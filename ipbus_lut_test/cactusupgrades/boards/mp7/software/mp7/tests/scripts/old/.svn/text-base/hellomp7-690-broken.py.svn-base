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
    # this is the 690 10G async setup
    xpoint.configureU3 (1,1,1,1)
    xpoint.configureU15(1,1,1,1)
    xpoint.configureU36(3,3,0,0)

    #print "Clocks 40/240",ttc.clock40(), ttc.clock240()

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
    #board.getNode("buffers.ctrl.mode.tx_buf_mode").write(3)
    #board.getNode("buffers.ctrl.mode.play_bx_en").write(1)
    #board.getNode("buffers.ctrl.play_bx.bx_low").write(0x000)
    #board.getNode("buffers.ctrl.play_bx.bx_high").write(0xc00)
    #board.dispatch()

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

#---
def configGTH( board, loop ):
  # put the transceivers in loopback mode (all of them)
  gth = mp7.GTHQuadNode( board.getNode('mgt') )

  gth.configure(loop,loop,loop,loop)


  board.getNode("mgt_align.ctrl").write(1)
  board.getNode("mgt_align.ctrl").write(0)
  board.dispatch()

  time.sleep(1)

  gth.clear()

  time.sleep(1)

  v = board.getNode("mgt_align.stat").read()
  board.dispatch()
  print "Align status:", hex(v)

  gth.check()

#---
def patternTx( board ):

    buffers = mp7.TransBufferNode(board.getNode('buffers'))

    buffers.configureTx(3)

    csr     = mp7.CSRNode(    board.getNode("ctrl.csr"))
    clk40_locked = csr.clock40Locked()


#---
import uhal
import mp7

# Mask the errors when loading the address tables
uhal.setLogLevelTo(uhal.LogLevel.ERROR)
cm = uhal.ConnectionManager('file://etc/uhal/connections904.xml')
board = cm.getDevice("MP7_690_fix")

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

csr     = mp7.CSRNode(    board.getNode("ctrl.csr"))
ttc     = mp7.TTCNode(    board.getNode("ttc"))
xpoint  = mp7.XpointNode( board.getNode("ctrl.xpoint"))
si5326  = mp7.SI5326Node( board.getNode("ctrl.i2c_clk"))
buf     = mp7.TransBufferNode(board.getNode("buffers"))

# Reset the board
reset(board)

# setup the pattern
patternTx(board)

uhal.setLogLevelTo(uhal.LogLevel.NOTICE)

time.sleep(1)

configGTH(board,2)

quads = [ 0 ]
chans = [ 0, 1, 2, 3 ]
nbx = 0xdec
nbx = 0x100
import array

uhal.setLogLevelTo(uhal.LogLevel.DEBUG)
quad = 0
for quad in quads:
    for chan in chans:
        print 'quad:chan',quad,chan

        data = range(256)

        #board.getNode('ctrl.csr.ctrl.quad_sel').write(quad)
        #board.getNode('ctrl.csr.ctrl.chan_sel').write(chan)
        #board.dispatch()

        print '--quad:chan=',quad,':',chan
        csr.selectQuad( quad )
        csr.selectQuad( chan )

        #buf.clearRx()
        #buf.clearTx()

        # upload the pattern to the buffer
        buf.uploadRx( data )
        #board.getNode('buffers.buffers.tx').writeBlock([0]*10);
        #board.getClient().dispatch()
        buf.uploadTx( data )
