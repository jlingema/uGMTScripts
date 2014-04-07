#!/usr/bin/python

import uhal
from time import sleep
import sys

def i2c_setup():
    board.getNode("ctrl.i2c_clk.ps_lo").write(0x40) # Set clock divider (31.25MHz / (5 * 64) = 98kHz SCL frequency
    board.getNode("ctrl.i2c_clk.ps_hi").write(0x0)
    board.getNode("ctrl.i2c_clk.ctrl").write(0x80) # Enable core
    board.dispatch()
    sleep(1)

def i2c_wait():
    while True:
        v = board.getNode("ctrl.i2c_clk.cmd_stat").read()
        board.dispatch()
        if (int(v) & 0x2) == 0:
            break
    return()
            
def i2c_w(a, sa, d):
    board.getNode("ctrl.i2c_clk.data").write(a << 1) # Write slave address in write mode
    board.getNode("ctrl.i2c_clk.cmd_stat").write(0x90) # Start + write
    board.dispatch()
    i2c_wait()
    board.getNode("ctrl.i2c_clk.data").write(sa) # Write internal address
    board.getNode("ctrl.i2c_clk.cmd_stat").write(0x10) # Write
    board.dispatch()
    i2c_wait()
    board.getNode("ctrl.i2c_clk.data").write(d) # Write data
    board.getNode("ctrl.i2c_clk.cmd_stat").write(0x50) # Stop + write
    board.dispatch()
    i2c_wait()

def i2c_r(a, sa):
    board.getNode("ctrl.i2c_clk.data").write(a << 1) # Write slave address in write mode
    board.getNode("ctrl.i2c_clk.cmd_stat").write(0x90) # Start + write
    board.dispatch()
    i2c_wait()
    board.getNode("ctrl.i2c_clk.data").write(sa) # Write internal address
    board.getNode("ctrl.i2c_clk.cmd_stat").write(0x10) # Write
    board.dispatch()
    i2c_wait()
    board.getNode("ctrl.i2c_clk.data").write((a << 1) + 1) # Write slave address in read mode
    board.getNode("ctrl.i2c_clk.cmd_stat").write(0x90) # Start + write
    board.dispatch()
    i2c_wait()
    board.getNode("ctrl.i2c_clk.cmd_stat").write(0x68) # Stop + read + nack
    board.dispatch()
    i2c_wait()
    d=board.getNode("ctrl.i2c_clk.data").read()
    board.dispatch()
    return(int(d))

def get_freq():
    sleep(0.1)
    v = board.getNode("ctrl.csr.stat").read()
    board.dispatch()
    if (int(v) & 0x1) == 0:
        print "Clock is not locked"
        return()
    s0 = board.getNode("ttc.ttc.stat0").read()
    s1 = board.getNode("ttc.ttc.stat1").read()
    s2 = board.getNode("ttc.ttc.stat2").read()
    s3 = board.getNode("ttc.ttc.stat3").read()
    f40 = board.getNode("ttc.ttc_freq.clk40_freq").read()
    f240 = board.getNode("ttc.ttc_freq.clk240_freq").read()
    board.dispatch()
    print "  Status:", hex(v), "BC0 stat:", hex(int(s0) >> 16), "Bunch", hex(int(s0) & 0xfff), "Evt:", hex(int(s1) & 0xffffff), "Orb:", hex(int(s2) & 0xffffff)
    print "  Serr:", hex(int(s3) & 0xffff), "Derr:", hex(int(s3) >> 16), "Freq 40/240:", 31.25 * (int(f40) / 65536.0), 31.25 * (int(f240) / 65536.0)


uhal.setLogLevelTo(uhal.LogLevel.ERROR)
board = uhal.getDevice("mp7", "ipbusudp-2.0://192.168.0.130:50001", "file://etc/uhal/mp7/top.xml") 

board.getNode("ctrl.csr.ctrl.nuke").write(0x1)
board.dispatch()
sleep(1)
print "Reset done"

board.getNode("ctrl.csr.ctrl.clk40_rst").write(1)
board.getNode("ctrl.csr.ctrl.clk40_sel").write(1)
board.dispatch()

board.getNode("ctrl.csr.ctrl.clk40_rst").write(0)
board.dispatch()

board.getNode("ttc.ttc.ctrl.ttc_enable").write(1)
#board.getNode("ttc.ttc.ctrl.int_bc0_enable").write(1)
board.getNode("ttc.ttc.ctrl.ctr_clear").write(1)
board.getNode("ttc.ttc.ctrl.ctr_clear").write(0)
board.dispatch()

board.getNode("buffers.ctrl.mode.tx_buf_mode").write(3)
board.getNode("buffers.ctrl.mode.play_bx_en").write(1)
board.getNode("buffers.ctrl.play_bx.bx_low").write(0x000)
board.getNode("buffers.ctrl.play_bx.bx_high").write(0xc00)
board.dispatch()

board.getNode("ctrl.xpoint.ctrl").write(0x0fffff07)
board.dispatch()
board.getNode("ctrl.xpoint.ctrl").write(0x0fffff00)
board.dispatch()
board.getNode("ctrl.xpoint.ctrl.rst_si5326").write(1)
board.dispatch()
sleep(1)

get_freq()


i2c_setup()

s = [ [2, 0xa2], [3, 0x15], [4, 0x92], [6, 0x3f],
      [10, 0x08], [11, 0x42], [21, 0x7f], [25, 0x00],
      [33, 0x07], [36, 0x07], [40, 0x80], [41, 0x01],
      [42, 0x4f], [45, 0x14], [48, 0x14], [136, 0x40] ]

print "Writing si5326 registers"
for i in s:
    i2c_w(0x68, i[0], i[1])

sleep(1)

v = board.getNode("ctrl.xpoint.stat").read()
board.dispatch()
print "Clock dist status:", hex(v)

ch_ro = []
ch_ro.append(board.getNode("mgt.ro_regs.ch0"))
ch_ro.append(board.getNode("mgt.ro_regs.ch1"))
ch_ro.append(board.getNode("mgt.ro_regs.ch2"))
ch_ro.append(board.getNode("mgt.ro_regs.ch3"))
ch_c_ro = board.getNode("mgt.ro_regs.common")
ch_rw = []
ch_rw.append(board.getNode("mgt.rw_regs.ch0.control"))
ch_rw.append(board.getNode("mgt.rw_regs.ch1.control"))
ch_rw.append(board.getNode("mgt.rw_regs.ch2.control"))
ch_rw.append(board.getNode("mgt.rw_regs.ch3.control"))
ch_c_rw = board.getNode("mgt.rw_regs.common.control")

NCHAN = 4

for i in range(NCHAN):
    ch_rw[i].getNode("loopback").write(0)
board.dispatch()

ch_c_rw.getNode("soft_reset").write(1)
board.dispatch()
sleep(1)
ch_c_rw.getNode("soft_reset").write(0)
board.dispatch()

for i in range(NCHAN):
    ch_rw[i].getNode("tx_fsm_reset").write(1)
    ch_rw[i].getNode("rx_fsm_reset").write(1)
board.dispatch()
sleep(1)
for i in range(NCHAN):
    ch_rw[i].getNode("tx_fsm_reset").write(0)
board.dispatch()
sleep(1)
for i in range(NCHAN):
    ch_rw[i].getNode("rx_fsm_reset").write(0)
board.dispatch()

sleep(2)

for i in range(NCHAN):
    ch_rw[i].getNode("orbit_location_req").write(0x30)
    ch_rw[i].getNode("align_once").write(0)
    board.dispatch()
    ch_rw[i].getNode("align_once").write(1)
    board.dispatch()
    ch_rw[i].getNode("align_once").write(0)
    board.dispatch()

    sleep(1)
    
    ch_rw[i].getNode("sync_lost_clear").write(1)
    ch_rw[i].getNode("sync_lost_clear").write(0)
    ch_rw[i].getNode("reset_crc_counters").write(1)
    ch_rw[i].getNode("reset_crc_counters").write(0)
    board.dispatch()

sleep(1)

for i in range(NCHAN):
    stat = ch_ro[i].getNode("status").read()
    crc_cnt = ch_ro[i].getNode("crc_checked_cnt").read()
    crc_err = ch_ro[i].getNode("crc_error_cnt").read()
    tx_cnt = ch_ro[i].getNode("tx_crc_checked_cnt").read()
    tx_err = ch_ro[i].getNode("tx_crc_error_cnt").read()
    loc_max = ch_ro[i].getNode("orbit_lock_range.orbit_location_max").read()
    loc_min = ch_ro[i].getNode("orbit_lock_range.orbit_location_min").read()
    board.dispatch()
    print "status:", hex(stat)
    print "crc check:", hex(crc_cnt), hex(crc_err)
    print "tx check:", hex(tx_cnt), hex(tx_err)
    print "orbit lock range:", hex(loc_max), hex(loc_min)

