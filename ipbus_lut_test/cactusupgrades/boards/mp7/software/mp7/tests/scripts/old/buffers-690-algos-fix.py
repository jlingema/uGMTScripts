#!/bin/env python

import time
import sys
import array
import os

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
def run_from_ipython():
    try:
        __IPYTHON__
        return True
    except NameError:
        return False

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
    self.gth     = mp7.GTHQuadNode( board.getNode('mgt') )
    self.buf     = mp7.TransBufferNode(board.getNode("buffers"))

  def reset(self):

    csr     = self.csr
    ttc     = self.ttc
    xpoint  = self.xpoint
    si5326  = self.si5326

    # Commence resetting the board
    print 'Resetting the board'
    csr.reset()

    ttc.clear()
    ttc.enable()

    clk40_locked = csr.clock40Locked()
    print "Clock 40 is",("unlocked","locked")[clk40_locked]

    print "Configuring Xpoint"
    xpoint.configureU3 (1,1,1,1)
    xpoint.configureU15(1,1,1,1)
    xpoint.configureU36(2,2,0,0)


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

    clk40_locked = csr.clock40Locked()
    print "Clock 40 is",("unlocked","locked")[clk40_locked]

  def patternTx2Rx( self ):
    # Internal buffer loop :  Tx -> Rx
    # Uses playbacks
    #buf = mp7.TransBufferNode(board.getNode('buffers'))

    self.buf.configureTx( self.buf.Mode.Pattern )
    self.buf.configureRx( self.buf.Mode.Disabled )

  #---
  def configGTX( self, loop ):
    # put the transceivers in loopback mode (all of them)
    #gtx = mp7.GTXQuadNode( board.getNode('mgt') )
    gtx = self.gtx

    gtx.configure(loop,loop,loop,loop)

    time.sleep(2)

    gtx.alignOnce()

    time.sleep(2)

    gtx.check()

  #---
  def configGTH( self, loop ):
    # put the transceivers in loopback mode (all of them)
    #gth = mp7.GTHQuadNode( board.getNode('mgt') )
    #gth = self.gth

    self.gth.configure(loop,loop,loop,loop)


    self.board.getNode("mgt_align.ctrl").write(1)
    self.board.getNode("mgt_align.ctrl").write(0)
    self.board.dispatch()

    time.sleep(1)

    self.gth.clear()

    time.sleep(1)

    v = self.board.getNode("mgt_align.stat").read()
    self.board.dispatch()
    print "Align status:", hex(v)

    self.gth.check()

  #---
  def dumpBuffers(self, path="", depth = 0x100, quads = [0], chans = [0,1,2,3] ):

    csr = self.csr
    buf = self.buf

    wpb = 6

    print 'dumping',depth,'words'

    # pull the captured data out of the buffers
    values = {}
    for quad in quads:
        for chan in chans:
            csr.selectQuadChan( quad, chan )
            vTx = array.array('I',buf.downloadTx( depth ) )
            vRx = array.array('I',buf.downloadRx( depth ) )
            print 'q%dc%d_tx' % (quad,chan)
            values['tx-q%dc%d' % (quad,chan) ] = vTx
            values['rx-q%dc%d' % (quad,chan) ] = vRx

    print '-'*80


    for k,v in values.iteritems():

      if path: os.system('mkdir -p '+path)

      dumpath = os.path.join(path,'dump_'+k+'.txt')
      print 'dumping',dumpath
      dump = open(dumpath,'w')
      title = path+':'+k
      dump.write(title+'\n')
      dump.write('-'*len(title)+'\n')
      for i,x in enumerate(v):
          dump.write('%03d %02d 0x%08x\n' % ( i, (int(i)/wpb), x ) )
      dump.write('\n')
      dump.close()
      #print len(v),'values dumped'

  #---
  def configBuffers( self, func, quads = [0], chans = [0,1,2,3], data_rx = None, data_tx = None ):

      csr = self.csr
      buf = self.buf

      # apply the config
      func( self.board )

      time.sleep(0.1)

      # Dump some registers, for fun
      print '-'*80
      buf_regs = buf.dump()
      for n in sorted(buf_regs.iterkeys()):
          print n,':',hex(buf_regs[n])
      print '-'*80

      quad = 0
      for quad in quads:
          for chan in chans:
              print 'quad:chan',quad,chan

              csr.selectQuadChan(quad,chan)
              #print csr.dump()

              buf.clearRx()
              buf.clearTx()

              if data_rx:
                buf.uploadRx( data_rx[quad][chan] )
              if data_tx:
                buf.uploadTx( data_tx[quad][chan] )

play_bx_low  = 0x00
play_bx_high = 0xc00
cap_bx_low  = 0x00
cap_bx_high = 0x20


#--
def algoPlay( board ):

    buffers = mp7.TransBufferNode(board.getNode('buffers'))

    buffers.internalLoop(False)
    buffers.externalLoop(False)

    buffers.configureRx(buffers.Mode.Playback , play_bx_low , play_bx_high )
    buffers.configureTx(buffers.Mode.Capture  , cap_bx_low  , cap_bx_high  )

def algoPatt( board ):

    buffers = mp7.TransBufferNode(board.getNode('buffers'))

    buffers.internalLoop(False)
    buffers.externalLoop(False)

    buffers.configureRx(buffers.Mode.Pattern , play_bx_low , play_bx_high )
    buffers.configureTx(buffers.Mode.Capture , cap_bx_low  , cap_bx_high  )

def loopPlayB2B( board ):
    # Internal buffer loop :  Tx -> Rx
    # Uses playbacks
    buffers = mp7.TransBufferNode(board.getNode('buffers'))

    buffers.internalLoop(True)
    buffers.externalLoop(False)
    buffers.configureTx( buffers.Mode.Playback , play_bx_low , play_bx_high )
    buffers.configureRx( buffers.Mode.Capture  , cap_bx_low  , cap_bx_high  )

def loopPlayMGT( board ):
    # Internal buffer loop :  Tx -> Rx
    # Uses playbacks
    buffers = mp7.TransBufferNode(board.getNode('buffers'))

    buffers.internalLoop(False)
    buffers.externalLoop(False)
    buffers.configureTx( buffers.Mode.Playback , play_bx_low , play_bx_high )
    buffers.configureRx( buffers.Mode.Capture  , cap_bx_low  , cap_bx_high  )


def loopPattB2B( board ):
    # Internal buffer loop :  Tx -> Rx
    # Uses patterns

    buffers = mp7.TransBufferNode(board.getNode('buffers'))

    buffers.internalLoop(True)
    buffers.externalLoop(False)
    buffers.configureTx(buffers.Mode.Pattern , play_bx_low , play_bx_high )
    buffers.configureRx(buffers.Mode.Capture , cap_bx_low  , cap_bx_high  )

def loopPattMGT( board ):
    # Internal buffer loop :  Tx -> Rx
    # Uses patterns

    buffers = mp7.TransBufferNode(board.getNode('buffers'))

    buffers.internalLoop(False)
    buffers.externalLoop(False)
    buffers.configureTx(buffers.Mode.Pattern , play_bx_low , play_bx_high )
    buffers.configureRx(buffers.Mode.Capture , cap_bx_low  , cap_bx_high  )

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
gtx     = mp7.GTXQuadNode( board.getNode('mgt') )
gth     = mp7.GTHQuadNode( board.getNode('mgt') )
buf     = mp7.TransBufferNode(board.getNode("buffers"))


def go():
    mp7test = MP7Tester( board )
    # Reset the board
    mp7test.reset()
    uhal.setLogLevelTo(uhal.LogLevel.NOTICE)

    mp7test.patternTx2Rx()

    time.sleep(1)

    # config GTHs, just in case
    mp7test.configGTH(2)

    #stub    = mp7.MP7Stub( board.getNode() )



    # config for receiving through the algo block
    algoPatt(board)
    #algoPlay(board)

    #Or to send patterns
    #loopPlay(board)
    #loopPattMGT(board)

    time.sleep(0.1)

    # Dump some registers, for fun
    print '-'*80
    buf_regs = buf.dump()
    for n in sorted(buf_regs.iterkeys()):
        print n,':',hex(buf_regs[n])
    print '-'*80

    return

    quads = [ 0 ]
    chans = [ 0, 1, 2, 3 ]
    nbx = 0x100
    wpb = 6

    quad = 0
    for quad in quads:
        for chan in chans:
            print 'quad:chan',quad,chan

            data = [ x for l in [[( (quad << 16) + (chan << 8) + i)]*wpb for i in range(nbx)] for x in l]
            csr.selectQuadChan(quad,chan)
            #print csr.dump()

            buf.clearRx()
            buf.clearTx()

            # upload the pattern to the buffer
            #buf.uploadRx( data[0x0:0x10] )
            #buf.uploadTx( data )

    print '--Capture'
    # capture the buffers
    ttc.capture(2)


    mp7test.dumpBuffers()

def goto():
    mp7test = MP7Tester( board )
    # Reset the board
    mp7test.reset()
    uhal.setLogLevelTo(uhal.LogLevel.NOTICE)

    mp7test.patternTx2Rx()

    time.sleep(1)

    # config GTHs, just in case
    mp7test.configGTH(2)
    wpb = 6
    nbx = 0x100
    quads = [ 0 ]
    chans = [ 0, 1, 2, 3 ]

    data = {}
    for quad in quads:
      data[quad]={}
      for chan in chans:
        # take only the first 256
        bufdata = [ x for l in [[( (quad << 20) + (chan << 12) + (i << 4) +w ) for w in xrange(wpb)] for i in range(nbx)] for x in l]
        data[quad][chan] = bufdata[0:0x100]


    loopPatt = True
    loopPlay = True
    algos    = True

    if loopPatt:
      #--- testing the loopPattern (b2b)
      print '--Loop Pattern test (b2b)'
      mp7test.configBuffers( loopPattB2B, quads=quads, chans=chans )

      print '--Capture'
      # capture the buffers
      ttc.capture(2)

      # Dump
      mp7test.dumpBuffers('data/loopPattB2B', quads=quads, chans=chans )

      #--- testing the loopPattern
      print '--Loop Pattern test'
      mp7test.configBuffers( loopPattMGT, quads=quads, chans=chans )

      print '--Capture'
      # capture the buffers
      ttc.capture(2)

      # Dump
      mp7test.dumpBuffers('data/loopPattMGT', quads=quads, chans=chans )

    if loopPlay:

      #--- testing the loopPlayback B2B
      print '--Loop Playback test (b2b)'
      mp7test.configBuffers( loopPlayB2B, quads=quads, chans=chans, data_tx = data  )

      print '--Capture'
      # capture the buffers
      ttc.capture(2)

      # Dump
      mp7test.dumpBuffers('data/loopPlayB2B', quads=quads, chans=chans)

      #--- testing the loopPlayback MGT
      print '--Loop Playback test (b2b)'
      mp7test.configBuffers( loopPlayMGT, quads=quads, chans=chans, data_tx = data  )

      print '--Capture'
      # capture the buffers
      ttc.capture(2)

      # Dump
      mp7test.dumpBuffers('data/loopPlayMGT', quads=quads, chans=chans)

    if algos:

      #--- testing the algoPattern
      print '--Algo Pattern test'
      mp7test.configBuffers( algoPatt, quads=quads, chans=chans )

      print '--Capture'
      # capture the buffers
      ttc.capture(2)

      # Dump
      mp7test.dumpBuffers('data/algoPatt', quads=quads, chans=chans )

      #--- testing the algoPlayback
      print '--Algo Pattern test'
      mp7test.configBuffers( algoPlay, quads=quads, chans=chans, data_rx = data )
      #mp7test.configBuffers( algoPlay, quads=quads, chans=chans )

      print '--Capture'
      # capture the buffers
      ttc.capture(2)

      # Dump
      mp7test.dumpBuffers('data/algoPlay', quads=quads, chans=chans )



#-Execution--
if not run_from_ipython():
    goto()

