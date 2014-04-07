#!/bin/env python

import time

def hookDebugger(debugger='gdb'):
    '''debugging helper, hooks debugger to running interpreter process'''

    import os
    pid = os.spawnvp(os.P_NOWAIT,
                     debugger, [debugger, '-q', 'python', str(os.getpid())])

    # give debugger some time to attach to the python process
    import time
    time.sleep( 1 )

    # verify the process' existence (will raise OSError if failed)
    os.waitpid( pid, os.WNOHANG )
    os.kill( pid, 0 )
    return

#---
def bin(x,fill=0):
    """
    bin(number) -> string

    Stringifies an int or long in base 2.
    """
    if x < 0:
        return '-' + bin(-x)
    out = []
    if x == 0:
        out.append('0')
    while x > 0:
        out.append('01'[x & 1])
        x >>= 1
        pass
    if fill != 0 and fill>len(out):
        out+='0'*(fill-len(out))
    try:
        return '0b' + ''.join(reversed(out))
    except NameError, ne2:
        out.reverse()
    return '0b' + ''.join(out)

#---
def reset( board ):

    import time

    # pull all the cool nodes out
    csr     = mp7.CSRNode(    board.getNode("ctrl.csr"))
    ttc     = mp7.TTCNode(    board.getNode("ttc"))
    xpoint  = mp7.XpointNode( board.getNode("ctrl.xpoint"))
    si5326  = mp7.SI5326Node( board.getNode("ctrl.i2c_clk"))


    # Commence resetting the board
    print 'Resetting the board'
    csr.reset()

    ttc.clear()
    ttc.enable()

    clk40_locked = csr.clock40Locked()
    print "Clock 40 is",("unlocked","locked")[clk40_locked]

    print "Configuring Xpoint"
    xpoint.configureU3 (3,3,3,3)
    xpoint.configureU15(3,3,3,3)
    xpoint.configureU36(3,3,0,0)


    sicfg = "etc/config/mp7/si5326/MP7_SI5326_20130606_40.1MHz_CKIN1_to_160.4MHz_CKOUT1_NoIncDec_Regs.txt"
    print "Configuring SI5326 with",sicfg
    # Hold the clock
    csr.holdReset40()

    # reset the chip
    xpoint.si5326Reset()

    # sleep
    time.sleep(2)

    # and then reconfigure
    si5326.configure(sicfg)

    time.sleep(0.1)

    # wait for the si to recover
    for i in xrange(100):
        si5326_lol = xpoint.si5326LossOfLock()
        si5326_int = xpoint.si5326Interrupt()
        if not si5326_lol and not si5326_int: break
        time.sleep(0.001)

    if si5326_int: print "SI5326 clock chip reports Clock1 invalid"
    if si5326_lol: print "SI5326 clock chip reports that PLL has lost lock"

    si5326.debug()

    # release the clock
    csr.releaseReset40()

def algoloop( board ):

    buffers = mp7.TransBufferNode(board.getNode('buffers'))

def looptestDave( board ):
    board.getNode("ttc.ttc.ctrl.int_bc0_enable").write(0x1)
    board.getNode("buffers.ctrl.mode.rx_buf_mode").write(0x3)
    board.getNode("buffers.ctrl.mode.tx_buf_mode").write(0x1)
    board.getNode("buffers.ctrl.cap_bx.bx_low").write(0x00)
    board.getNode("buffers.ctrl.cap_bx.bx_high").write(0xc0)
    board.getNode("buffers.ctrl.play_bx.bx_low").write(0x00)
    board.getNode("buffers.ctrl.play_bx.bx_high").write(0xc0)
    board.dispatch()

#---
import uhal
import mp7

# Mask the errors when loading the address tables
uhal.setLogLevelTo(uhal.LogLevel.ERROR)
cm = uhal.ConnectionManager('file://etc/uhal/connections904.xml')
board = cm.getDevice("MP7_485_new")

# Increase the logging verbosity
uhal.setLogLevelTo(uhal.LogLevel.ERROR)

print '    ____        ________             ______                           __    '
print '   / __ )__  __/ __/ __/__  _____   / ____/  ______ _____ ___  ____  / /__  '
print '  / __  / / / / /_/ /_/ _ \/ ___/  / __/ | |/_/ __ `/ __ `__ \/ __ \/ / _ \ '
print ' / /_/ / /_/ / __/ __/  __/ /     / /____>  </ /_/ / / / / / / /_/ / /  __/ '
print '/_____/\__,_/_/ /_/  \___/_/     /_____/_/|_|\__,_/_/ /_/ /_/ .___/_/\___/  '
print '                                                           /_/              '

reset(board)

uhal.setLogLevelTo(uhal.LogLevel.NOTICE)

csr     = mp7.CSRNode(    board.getNode("ctrl.csr"))
ttc     = mp7.TTCNode(    board.getNode("ttc"))
xpoint  = mp7.XpointNode( board.getNode("ctrl.xpoint"))
si5326  = mp7.SI5326Node( board.getNode("ctrl.i2c_clk"))
buf = mp7.TransBufferNode(board.getNode("buffers"))

quads = [ 0 ]
nbx = 0xff # 256 buffers

looptestDave( board )

# clean the receiving buffer
buf.uploadTx( [0]*(nbx*4) )

ttc.capture(1)

import array
v = array.array('I',buf.downloadTx(nbx*4) )

#for i,x in enumerate(v):
    #if i%4 ==0: print
    #print hex(int(x)),' ',

for i,x in enumerate(v):
    print '%04x' % i, hex(int(x))
print
