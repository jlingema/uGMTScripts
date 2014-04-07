#!/usr/bin/python

import uhal
from time import sleep
import sys

uhal.setLogLevelTo(uhal.LogLevel.ERROR)
board = uhal.getDevice("690_MP", "ipbusudp-2.0://192.168.0.128:50001", "file://etc/uhal/mp7_tmt_pp_tmux/top.xml")
board.getClient().setTimeoutPeriod(10000)

board.getNode("ctrl.csr.ctrl.nuke").write(1)
board.dispatch()

sleep(2)

board.getNode("ttc.ttc.ctrl.int_bc0_enable").write(1)
board.getNode("buffers.csr.mode.rx_buf_mode").write(3)
board.getNode("buffers.csr.mode.rx_datasrc").write(0)
board.getNode("buffers.csr.mode.tx_buf_mode").write(1)
board.getNode("buffers.csr.cap_bx.bx_low").write(0)
board.getNode("buffers.csr.cap_bx.bx_high").write(0x10)
board.dispatch()

print "Setup done"

while True:
    v = board.getNode("buffers.csr.stat.locked").read()
    board.dispatch()
    print int(v)
    if int(v) != 0:
        break

print "Locked OK"

board.getNode("ttc.ttc.ctrl.buf_go").write(1)
board.dispatch()

while True:
    v = board.getNode("buffers.csr.stat.cap_done").read()
    board.dispatch()
    if int(v) != 0:
        break

print "Capture done"

NCHAN = 4
BSIZE = 0x100
b = []

for i in range(NCHAN):
    a = []
    board.getNode("ctrl.csr.ctrl.chan_sel").write(i)
    print "Getting:", i
    a = board.getNode("buffers.buffers.tx").readBlock(BSIZE)
    board.dispatch()
    b.append(a)

for i in range(BSIZE):
    print '%04x'%i,
    for j in range(NCHAN):
        print '%08x'%b[j][i],
    print
