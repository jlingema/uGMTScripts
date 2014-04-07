#!/bin/env python

import uhal
from time import sleep
import sys
import time

uhal.setLogLevelTo(uhal.LogLevel.ERROR)
#board = uhal.getDevice("glib", "ipbusudp-2.0://192.168.201.2:50001", "file://a/top.xml")
board = uhal.getDevice("glib", "ipbusudp-2.0://192.168.0.134:50001", "file://etc/uhal/mp7_demux/top.xml")
#board.getClient().setTimeoutPeriod(10000)

board.getNode("ctrl.csr.ctrl.nuke").write(1)
board.dispatch()

sleep(2)

board.getNode("ttc.ttc.ctrl.int_bc0_enable").write(1)
board.getNode("buffers.csr.mode.rx_buf_mode").write(2)
board.getNode("buffers.csr.mode.rx_datasrc").write(0)
board.getNode("buffers.csr.mode.tx_buf_mode").write(1)
board.getNode("buffers.csr.play_bx.bx_low").write(0x00)
board.getNode("buffers.csr.play_bx.bx_high").write(0x09)
board.getNode("buffers.csr.cap_bx.bx_low").write(0)
board.getNode("buffers.csr.cap_bx.bx_high").write(0xa0)
board.getNode("demux.csr.ctrl.lat_p").write(0x0)
board.dispatch()
#assert(False)

print "Setup done"

while True:
    v = board.getNode("buffers.csr.stat.locked").read()
    board.dispatch()
    print int(v)
    if int(v) != 0:
        break

print "Locked OK"

SAMPLES = 16

NMP=9
NCHAN=4
FRAMELEN=6
CLOCK_RATIO = 6

#NMP = 4
#NCHAN = 1
#SAMPLES = 4
#FRAMELEN = 6
#CLOCK_RATIO = 6

for imp in xrange(NMP):
    for ich in xrange(NCHAN):
        b = []
        for i in xrange(CLOCK_RATIO * imp):
            a = 0
            v = 0
            b.append(a & 0xffff)
            b.append(((a >> 16) & 0xffff) + (v << 16))
        for isamp in xrange(SAMPLES):
            a = ((imp & 0xff) << 24) + ((ich & 0xff) << 16) + ((isamp & 0xff) << 8) + imp + isamp * CLOCK_RATIO * ((FRAMELEN + 1) / CLOCK_RATIO)
            v = 1
            b.append(a & 0xffff)
            b.append(((a >> 16) & 0xffff) + (v << 16))
            for i in xrange(FRAMELEN):
                a = ((imp & 0xff) << 24) + ((ich & 0xff) << 16) + ((isamp & 0xff) << 8) + i
                v = 1
                b.append(a & 0xffff)
                b.append(((a >> 16) & 0xffff) + (v << 16))
            for i in xrange((8 * CLOCK_RATIO) - ((FRAMELEN + 1) % CLOCK_RATIO)):
                a = ((imp & 0xff) << 24) + ((ich & 0xff) << 16) + ((isamp & 0xff) << 8) + 128 + i
                v = 0
                b.append(a & 0xffff)
                b.append(((a >> 16) & 0xffff) + (v << 16))

        print "Write block for", hex(imp), hex(ich)
        link = (imp * NCHAN + ich)
        board.getNode("ctrl.csr.ctrl.quad_sel").write(link/4)
        board.getNode("ctrl.csr.ctrl.chan_sel").write(link%4)
        board.getNode("buffers.buffers.rx_addr").write(0)
        board.getNode("buffers.buffers.rx_data").writeBlock(b)
        board.getNode("buffers.buffers.tx_addr").write(0)
        board.getNode("buffers.buffers.tx_data").writeBlock([0x00005050, 0x0000c0c0]*0x400)
        board.dispatch()

        print "Done"
        #l = len(b)
        #for i in range(l):
            #print '%04x'%i, '%08x'%b[i]
#       print "Read block for", hex(imp), hex(ich)
#       board.getNode("buffers.buffers.rx_addr").write(0)
#       b = board.getNode("buffers.buffers.rx_data").readBlock(l)
#       board.dispatch()
#       print "Done"
#       for i in range(len(b)):
#           print '%04x'%i, '%08x'%b[i]


print "Reading back"

b = []

for i in range(NMP * NCHAN):
    board.getNode("ctrl.csr.ctrl.quad_sel").write(i/4)
    board.getNode("ctrl.csr.ctrl.chan_sel").write(i%4)
    board.getNode("buffers.buffers.rx_addr").write(0)
    q = board.getNode("buffers.buffers.rx_data").readBlock(FRAMELEN * 2)
    board.dispatch()
    b.append(q)

#for i in range(FRAMELEN * 2):
    #print '%04x'%i,
    #for j in range(NMP * NCHAN):
        #print '%08x'%b[j][i],
    #print

board.getNode("demux.csr.ctrl.clr_err").write(0x1)
board.getNode("demux.csr.ctrl.resync").write(0x1)
board.getNode("demux.csr.ctrl.clr_err").write(0x0)
board.getNode("demux.csr.ctrl.resync").write(0x0)

board.dispatch()

time.sleep(0.5)

for i in xrange(5):
    good  = board.getNode('demux.csr.good_count').read()
    empty = board.getNode('demux.csr.empty_count').read()
    board.dispatch()

    time.sleep(0.5)

    print '--',i
    print 'good/empty:',good,empty

    print 'good bx:', float(good.value())/(good.value()+empty.value())*3564
