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

class MP7Tester:
  def __init__(self, board):
    self.board = board

    self.csr     = mp7.CSRNode(    board.getNode("ctrl.csr"))
    self.ttc     = mp7.TTCNode(    board.getNode("ttc"))
    self.xpoint  = mp7.XpointNode( board.getNode("ctrl.xpoint"))
    self.si5326  = mp7.SI5326Node( board.getNode("ctrl.i2c_clk"))
    self.gtx     = mp7.GTXQuadNode( board.getNode('mgt') )
    self.buf     = mp7.TransBufferNode(board.getNode("buffers"))

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

    # configures the buffers
    board.getNode("buffers.ctrl.mode.tx_buf_mode").write(3)
    board.getNode("buffers.ctrl.mode.play_bx_en").write(1)
    board.getNode("buffers.ctrl.play_bx.bx_low").write(0x000)
    board.getNode("buffers.ctrl.play_bx.bx_high").write(0xc00)
    board.dispatch()

    clk40_locked = csr.clock40Locked()
    print "Clock 40 is",("unlocked","locked")[clk40_locked]


#---
def configGTX( board, loop ):
  # put the transceivers in loopback mode (all of them)
  gtx = mp7.GTXQuadNode( board.getNode('mgt') )

  gtx.configure(loop,loop,loop,loop)

  time.sleep(2)

  gtx.alignOnce()

  time.sleep(2)

  gtx.check()

def bufferTest( board ):

    buffers = mp7.TransBufferNode(board.getNode('buffers'))

    buffers.capture(2,0,256)
    buffers.playback(1,0,20)
    buffers.uploadCaptureData(range(10))

    import array
    a = array.array('I',buffers.downloadCaptureData(20))
    print "Loaded to capture buffers",a

    import array
    a = array.array('I',buffers.downloadPlaybackData(20))
    print "Playback buffers",a

def looptest( board ):

    buffers = mp7.TransBufferNode(board.getNode('buffers'))

    buffers.configureTx(3,0x00,0xc00)
    #buffers.configureRx(buffers.Mode.Capture,0x00,0xe00)

    csr     = mp7.CSRNode(    board.getNode("ctrl.csr"))

def looptestDave( board ):
    board.getNode("ttc.ttc.ctrl.int_bc0_enable").write(0x1)
    board.getNode("buffers.ctrl.mode.rx_buf_mode").write(0x3)
    board.getNode("buffers.ctrl.mode.tx_buf_mode").write(0x1)
    board.getNode("buffers.ctrl.cap_bx.bx_low").write(0x00)
    board.getNode("buffers.ctrl.cap_bx.bx_high").write(0xc0)
    board.getNode("buffers.ctrl.play_bx.bx_low").write(0x00)
    board.getNode("buffers.ctrl.play_bx.bx_high").write(0xc0)
    board.dispatch()

def algoloop( board ):

    buffers = mp7.TransBufferNode(board.getNode('buffers'))

    buffers.configureRx(buffers.Mode.Playback,0x00,0x100)
    buffers.configureTx(buffers.Mode.Capture ,0x00,0x100)

#---
import uhal
import mp7

# Mask the errors when loading the address tables
uhal.setLogLevelTo(uhal.LogLevel.ERROR)
cm = uhal.ConnectionManager('file://etc/uhal/connections904.xml')
board = cm.getDevice("MP7_485")
#board = cm.getDevice("MP7_485_new")

# Increase the logging verbosity
uhal.setLogLevelTo(uhal.LogLevel.ERROR)

# Ads
print ' __   __  _______  ___      ___      _______    __   __  _______  _______ '
print '|  | |  ||       ||   |    |   |    |       |  |  |_|  ||       ||       |'
print '|  |_|  ||    ___||   |    |   |    |   _   |  |       ||    _  ||___    |'
print '|       ||   |___ |   |    |   |    |  | |  |  |       ||   |_| |    |   |'
print '|       ||    ___||   |___ |   |___ |  |_|  |  |       ||    ___|    |   |'
print '|   _   ||   |___ |       ||       ||       |  | ||_|| ||   |        |   |'
print '|__| |__||_______||_______||_______||_______|  |_|   |_||___|        |___|'
print ''

# Id, to remind ourselves what we are dealing with
print 'This is:',board.id(),'['+board.uri()+']'

stub    = mp7.MP7Stub( board.getNode() )

csr     = mp7.CSRNode(    board.getNode("ctrl.csr"))
ttc     = mp7.TTCNode(    board.getNode("ttc"))
xpoint  = mp7.XpointNode( board.getNode("ctrl.xpoint"))
si5326  = mp7.SI5326Node( board.getNode("ctrl.i2c_clk"))
buf     = mp7.TransBufferNode(board.getNode("buffers"))
gtx     = mp7.GTXQuadNode( board.getNode('mgt') )

# Reset the board
reset(board)

csr.selectChannel(0,1)

# Configure the buffers for internal loop
looptestDave(board)

uhal.setLogLevelTo(uhal.LogLevel.NOTICE)

configGTX(board, 2)


#nbx = 256
#data = [ x for l in [[i]*4 for i in range(nbx)] for x in l]
#data = [ x for l in [[0xffffffff]*4 for i in range(nbx)] for x in l]

## config for receiving through the algo block
#algoloop(board)

## clean the receiving buffer
#buf.uploadTx( [0]*(nbx*4) )

## upload the pattern to the buffer
#buf.uploadRx( data )
#ttc.capture(1)


#import array
#v = array.array('I',buf.downloadTx(nbx*4) )


