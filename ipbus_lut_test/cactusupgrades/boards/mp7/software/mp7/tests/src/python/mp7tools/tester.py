
import time
import sys
import array
import os
import mp7

import dataio
import logging
import parameters
import helpers

class LinkErrorException(StandardError):
    def __init__(self, value):
        self.value = value

    def __str__(self):
        return repr(self.value)


_default_nquads = 18
_default_nchans = _default_nquads*4
# All 18 quads
_default_quads = range(_default_nquads)
# All 4 channels
_default_chans = range(4)
#  buffer depth
_default_depth = 0x400


class MP7Tester(object):
    _log = logging.getLogger('MP7Tester')
    def __init__(self, board, quads = 'auto' ):
        '''
        Creator. If quads is None, an attempt to autodiscover the active quads is done (from 0 to _default_quads).
        '''

        # self quads
        self.board = board

        if quads == 'auto':
            # fetch the number of quads
            v = board.getNode('ctrl.id.generics.nquad').read()
            board.dispatch()
            self.quads = range(v.value())
        else:
            self.quads = quads
        self.links = [ c for c in xrange(_default_nchans) if c/4 in self.quads ]

        self.chans = _default_chans

        # easy access to the wrappers
        self.ctrl     = mp7.CtrlNode        ( board.getNode("ctrl") )
        self.xpoint  = mp7.XpointNode       ( board.getNode("ctrl.xpoint") )
        self.si5326  = mp7.SI5326Node       ( board.getNode("ctrl.i2c_clk") )
        self.ttc     = mp7.TTCNode          ( board.getNode("ttc") )
        self.gth     = mp7.GTHQuadNode      ( board.getNode('datapath.mgt') )
        self.buf     = mp7.DatapathNode     ( board.getNode('datapath') )
        self.align   = mp7.MGTAlignmentNode ( board.getNode('datapath.align') )

        self._log.info(self.name()+' built')

    def __str__(self):
        return self.__class__.__name__+'(\''+self.name()+'\')'

    __repr__ = __str__

    def printId(self):
        
        idnode = self.board.getNode('csr.ctrl.id')
        a = idnode.getNode('fwrev.a').read()
        b = idnode.getNode('fwrev.b').read()
        c = idnode.getNode('fwrev.c').read()
        design = idnode.getNode('fwrev.design').read()
        idnode.getClient().dispatch()
        self._log.info('Firmware review: %s %02d.%02d.%02d', hex(design), a.value(), b.value(), c.value() )

        nquad = idnode.getNode('generics.nquad').read()
        clock_ratio = idnode.getNode('generics.clock_ratio').read()
        bunch_count = idnode.getNode('generics.bunch_count').read()
        idnode.getClient().dispatch()
        self._log.info('Generics nquad %d, clock_ratio %d, bunch_count %d:', nquad, clock_ratio, bunch_count)

    def getGenerics(self):
        return helpers.snapshot(self.board.getNode('ctrl.id.generics'))
            
    def name(self):
        return self.board.id()

    def dispatch(self):
        self.board.dispatch()        

    def reset(self, extClk40Src = True ):
        '''
        Reset the board status and configure clocking.

        '''
        # Meaningful configurations
        # - internal clock can be only 250
        # - SI5326 configuration is needed for 160/240 only
        ctrl     = self.ctrl
        ttc     = self.ttc

        # let's make life easier
        ttcEnable     = extClk40Src
        bc0Internal   = not extClk40Src
        
        self._log.warn('Resetting board %s',self.name())
        
        # ctrl.nuke()
        ctrl.softReset()
        
        self._log.info('Reset done')
        
        self.configureClocking(extClk40Src)

        self.configureTTC(ttcEnable, bc0Internal)

        #---
        self._log.info('Measuring clk40 frequency. Give me a second...')
        # Check the clock 40 frequency first
        # 1.1 sec is the minimum to guarantee the freq measurement to be completed, always
        try:
            logging.info('   Clock 40 frequency: %08f Mhz',ttc.freqClk40(1.1))
        except mp7.TTCFrequencyInvalid as e:
            self._log.error(e.what)
        

    def configureClocking(self, extClk40Src):
        ctrl     = self.ctrl
        xpoint  = self.xpoint
        si5326  = self.si5326

        self._log.info('Configuring clock 40')
        # leave clk40 in reset until the xpoint is set
        ctrl.getNode('csr.ctrl.clk40_rst').write(0x1)
        ctrl.getNode('csr.ctrl.clk40_sel').write(extClk40Src)
        ctrl.getClient().dispatch();
        #-- xpoint configuration is pure routing
        self._log.info('Configuring Xpoint')
        
        # configure ExternalAMC13 clock40 and
        Clk40Src = mp7.XpointNode.Clk40Src
        RefClkSrc = mp7.XpointNode.RefClkSrc
        
        if not extClk40Src:
            xpoint.configure(Clk40Src.IntSrc, RefClkSrc.Oscillator)
        else:
            xpoint.configure(Clk40Src.ExtAMC13, RefClkSrc.ClockCleaner)

            # Configure the si5326 clock only if in external mode
            self._log.info('Configuring SI5326')
            sicfg = 'etc/config/mp7/si5326/MP7_SI5326_20130606_40.1MHz_CKIN1_to_160.4MHz_CKOUT1_NoIncDec_Regs.txt'
            self._log.info('   Using %s', sicfg)
            
            # reset the chip
            xpoint.si5326Reset()
            
            # sleep
            time.sleep(1)
            
            # and then reconfigure
            si5326.configure(sicfg)
            
            time.sleep(0.5)
            
            # Wait the si5326 to recover
            xpoint.si5326WaitConfigured()
            
            si5326.debug()
        # All steps completed, release clock 40
        ctrl.getNode('csr.ctrl.clk40_rst').write(0x0)
        ctrl.getClient().dispatch()
        ctrl.waitClk40Lock()

    def configureTTC(self, ttcEnable, bc0Internal):
        ttc     = self.ttc
        ctrl     = self.ctrl
        
        self._log.info('Configuring ttc')

        # enable ttc L1As and Bgos commands
        ttc.getNode('csr.ctrl.ttc_enable').write(ttcEnable)
        ttc.getClient().dispatch();
        
        # clear counters
        ttc.clear()
        
        ttc.getNode('csr.ctrl.int_bc0_enable').write(bc0Internal)
        ttc.getClient().dispatch()

        # wait for the BC0 lock only for external input
        try:
            if ttcEnable: ttc.waitBC0Lock()
        except mp7.BC0LockFailed as e:
            self._log.error(e)

        # some additional checks
        self._log.info('Post-reset stats')
        csrdump =  mp7.snapshot(ctrl.getNode('csr'))
        ttcdump =  ttc.snapshot()
        try:
            f = ttc.freqClk40(1.1)
        except mp7.TTCFrequencyInvalid as e:
            self._log.error(e.what)
            f = 0.

        self._log.info('   Measured f40 : %08f Mhz' , f)
        self._log.info('   BC0 reg      : %04x'     , ttcdump['csr.stat0'] >> 16)
        self._log.info('   BC0 Internal : %d '      , ttcdump['csr.ctrl.int_bc0_enable'] )
        self._log.info('   BC0 Lock     : %d '      , ttcdump['csr.stat0.bc0_lock'] )
        self._log.info('   BC0 Error    : %d '      , ttcdump['csr.stat0.bc0_err'] )
        self._log.info('   BC0 Error    : %d '      , ttcdump['csr.stat0.bc0_err'] )
        self._log.info('   Dist lock    : %d '      , ttcdump['csr.stat0.dist_lock'] )

        v  = csrdump['stat']
        s0 = ttcdump['csr.stat0']
        s1 = ttcdump['csr.stat1']
        s2 = ttcdump['csr.stat2']
        s3 = ttcdump['csr.stat3']
        self._log.info('   Status: %08x BC0 stat: %0x4, Bunch %x Evt: %x, Orb %x', int(v),(int(s0) >> 16), (int(s0) & 0xfff), (int(s1) & 0xffffff), (int(s2) & 0xffffff) )

    #---
    def setupTx2RxPattern( self ):
        # Internal buffer loop :  Tx -> Rx
        # Uses playbacks
        '''
        Configures the MP7 buffers for Tx->Rx pattern 
        '''

        from buffers import PathConfigurator

        # self.buf.internalLoop(False)
        # self.buf.externalLoop(False)

        # self.buf.configure(mp7.MGTBufferNode.Mode.Disabled, mp7.MGTBufferNode.Mode.Pattern )
        # self.buf.playbackRange(0x0, 0xc0)

        # self.buf.waitLock()

        # self._log.info('Rx buffer disabled')
        # self._log.info('Tx buffer configured for pattern generation')

        ctrl  = self.ctrl
        buf   = self.buf

        rxconfig = PathConfigurator('latency',0,0)
        txconfig = PathConfigurator.withBXRange('pattern',(0x0,0x1),**(self.getGenerics()))

        # print 'rxconfig',rxconfig
        # print 'txconfig',txconfig

        for l in self.links:

            ctrl.selectLinkBuffer(l,ctrl.BufferSelect.Tx)

            txconfig.configure(buf)

            # print mp7.snapshot(ctrl.getNode('csr'))

            ctrl.selectLinkBuffer(l,ctrl.BufferSelect.Rx)

            rxconfig.configure(buf)

        self._log.warn('Generating Tx -> Rx patterns')


    #---
    def enableChanAlignment(self):
        '''
        Enable alignment for channels belonging to the active quads.
        '''

        activechans = [ (c in self.links) for c in xrange(_default_nchans) ]
        # activechans = [ 1 ]*2 +[ 0 ]*70
        self._log.debug('Enabling channels: %s ' % ''.join([('1' if c else '0') for c in activechans]))

        self.align.enable( activechans )

    #---
    def configureLinks( self, doalign=False,loopback=False ):
        '''
        Configure and align MGTs.
        '''

        # Local references
        gth   = self.gth
        ctrl   = self.ctrl
        align = self.align

        loop = 2 if loopback else 0
        # debug
        # loop = 0

        self._log.info('Configuring Quads %s', self.quads)
        for q in self.quads:
            self._log.debug('--> Q%02d', q)
            ctrl.selectQuad(q)
            gth.configure(loop,loop,loop,loop)
        self._log.info('Done')

        if doalign:
            # time.sleep(1)
            # magic parameter? What is it for?
            align.getNode('ctrl.margin').write(3)
            align.getClient().dispatch()
    

            # set the align mask for the unused quads
            self.enableChanAlignment()

            try:
                # perform alignment
                align.align()
            except RuntimeError as e:
                self._log.error('Failed aligning channels')

        self._log.info('Clearing counters')
        for q in self.quads:
            ctrl.selectQuad(q)
            gth.clear()

        # Report on alignment status
        v = align.getNode('stat').read()
        self.board.dispatch()
        self._log.info( 'Alignment')
        self._log.info( '--Status: %x', v)

        self._log.debug('----Breakdown')
        aligndump = align.snapshot('stat\..*')
        for k,v in sorted(aligndump.iteritems(), key=lambda x: x[0]):
            self._log.debug('%s : %d',k,v)
        self._log.debug('------------')

        self._log.info('Checking Quads for errors')
        for q in self.quads:
            ctrl.selectQuad(q)
            err = self.gth.check()
            qlog = (self._log.debug, self._log.error)[err]
            qlog('--> Q%02d: %s',q,('Ok','Error')[err])

        clk40_locked = ctrl.clock40Locked()
        self._log.info('Clock 40 is %s',('unlocked','locked')[clk40_locked])

    #---
    def checkLinks(self):
        '''
        Test all the MGTs for CRC and alignment errors.
        '''

        # Local references
        ctrl   = self.ctrl
        gth   = self.gth
        align = self.align

        self._log.info( 'Checking alignment' )
        # FIXME: Returning false when there are no error might _not_ be smart
        alignerr = align.check()

        #TODO: print the aling stat register when this fails
        if alignerr:
            self._log.warn( '--Alignment: Error')
            self._log.warn('---Breakdown')
            aligndump = align.snapshot('stat.*')
            for r in sorted(aligndump.iterkeys()):
                self._log.warn('%s : %s',r,hex(aligndump[r]))
            self._log.warn('------------')
        else:
            self._log.debug( '--Alignment: OK')

        self._log.info( 'Checking CRCs')

        crcerrs = []
        for q in self.quads:
            ctrl.selectQuad(q)
            err = gth.check()
            self._log.debug( '--> Q%02d: %s', q, ('Ok','Error')[err])
            #TODO: print the stat registers when this fails
            if err:
                # print a selection of registers
                gthdump = gth.snapshot('ro_regs\.ch\d\.crc_count.*')
                for r in sorted(gthdump.iterkeys()):
                    self._log.warn( ' %s:%x', r, gthdump[r])
                    crcerrs.append(q)

        self._log.debug( 'CRCs summary: %s',str(crcerrs))

        if alignerr or crcerrs:
            raise LinkErrorException('Alignment: '+('Ok','Error')[alignerr]+', CRCs on quads: '+str(crcerrs))
        else:
            self._log.info('Alignment & CRCs are OK for all channels')

    #---
    def dumpBuffers(self, path="", depth = parameters.defaults.mgtBuffersDepth ):

        # Local references
        ctrl = self.ctrl
        buf = self.buf

        # pull the captured data out of the buffers
        values = {}
        rxData = []
        txData = []

        rxData2g = dataio.BoardData( self.name() )
        txData2g = dataio.BoardData( self.name() )

        self._log.info('Reading quads: %s (%d words each)',self.quads,depth)

        for link in self.links:
            ctrl.selectLinkBuffer( link, ctrl.BufferSelect.Rx )
            vRx = buf.downloadValid( depth )
            rxData2g.addlink( link, vRx )

            ctrl.selectLinkBuffer( link, ctrl.BufferSelect.Tx )
            vTx = buf.downloadValid( depth )
            txData2g.addlink( link, vTx )

        if path: os.system('mkdir -p '+path)

        dataio.writeValid(rxData2g, os.path.join(path,'rx_summary.txt'))
        dataio.writeValid(txData2g, os.path.join(path,'tx_summary.txt'))

    #---
    def clearBuffers( self, data_rx = None, data_tx = None ):
        '''Clears the Rx/Tx buffers

        Args:
            data_rx:
            data_tx:
        '''

        # Local references
        ctrl = self.ctrl
        buf = self.buf

        # Dump some registers, for fun
        if False:
            print '-'*80
            buf_regs = buf.snapshot()
            for n in sorted(buf_regs.iterkeys()):
                print n,':',hex(buf_regs[n])
            print '-'*80

        self._log.info( 'Clearing Buffers')
        for link in self.links:
            self._log.debug('Clearing %02d Rx', link)
            ctrl.selectLinkBuffer( link, ctrl.BufferSelect.Rx )

            buf.clear()
            if data_rx:
                buf.uploadValid( data_rx.getlinkbuffer(link) )

            self._log.debug('Clearing %02d Tx', link)
            ctrl.selectLinkBuffer( link, ctrl.BufferSelect.Tx )

            buf.clear()
            if data_tx:
                buf.uploadValid( data_tx.getlinkbuffer(link) )

    #---
    def captureAndDump(self, path, depth=parameters.defaults.mgtBuffersDepth, data_rx=None, data_tx=None, capture=True, ):
        '''
        if cap_depth is 0x0 or none, don't capture
        '''
        # if data_rx and isinstance(data_rx.values()[0], dict):
        #     raise TypeError("data_rx is a dict of dict!!!")
        # if data_tx and isinstance(data_tx.values()[0], dict):
        #     raise TypeError("data_tx is a dict of dict!!!")

        # Local references
        ctrl = self.ctrl
        ttc = self.ttc
        buf = self.buf

        print mp7.snapshot(buf.getNode('csr.stat'))
        self.clearBuffers( data_rx, data_tx  )

        if capture:
            self._log.info('Capturing buffers')
            
            v = buf.getNode('csr.stat.cap_done').read()
            # Capture the buffers
            ttc.sendBTest()
            print 'cap_done :',v
            # And check it's done
            # time.sleep(1)
            print mp7.snapshot(buf.getNode('csr.stat'))
            buf.waitCaptureDone()
            self._log.info('Capture completed')

        # clk40_locked = ctrl.clock40Locked()
        # self._log.info('Clock 40 is %s',('unlocked','locked')[clk40_locked])

        #bc0_err = ttc.getNode('ttc.stat0.bc0_err').read()
        #ttc.getClient().dispatch()
        #print "BC0 error is",bc0_err.value()

        # Dump
        if path:
            self.dumpBuffers(path, depth=depth)

class PPTester(MP7Tester):
    _log = logging.getLogger('PPTester')
    def __init__(self, board, quads = parameters.pp.quads ):
        super(PPTester,self).__init__(board,quads)

        self.ppram   = mp7.PPRamNode        ( board.getNode('pp_ctrl') )

class MPTester(MP7Tester):
    _log = logging.getLogger('MPTester')
    def __init__(self, board, quads = parameters.mp.quads ):
        super(MPTester,self).__init__(board,quads)

class DemuxTester(MP7Tester):
    _log = logging.getLogger('DemuxTester')
    def __init__(self, board, quads = parameters.demux.quads ):
        super(DemuxTester,self).__init__(board,quads)

        self.buf     = mp7.MGTBufferNode  ( board.getNode('buffers') )
        self.demux   = mp7.DemuxNode( board.getNode('demux') )

    def clearBuffers( self, data_rx = None, data_tx = None ):
        # Local references
        ctrl = self.ctrl
        buf = self.buf

        time.sleep(0.1)

        # Dump some registers, for fun
        if False:
            print '-'*80
            buf_regs = buf.snapshot()
            for n in sorted(buf_regs.iterkeys()):
                print n,':',hex(buf_regs[n])
            print '-'*80

        self._log.info( 'Clearing quad: %s', self.quads)

        for link in self.links:
            ctrl.selectLink( link )

            buf.clearRx()
            buf.clearTx()

            if data_rx:
                buf.uploadValidRx( data_rx[link] )
            if data_tx:
                buf.uploadValidTx( data_tx[link] )

    #---
    def dumpBuffers(self, path="", depth = parameters.defaults.mgtBuffersDepth ):
        quads = self.quads

        # Local references
        ctrl = self.ctrl
        buf = self.buf

        # wpb = 6

        # pull the captured data out of the buffers
        values = {}
        rxData = []
        txData = []

        rxData = dataio.BoardData( self.board.id() )
        txData = dataio.BoardData( self.board.id() )

        self._log.info('Reading quads: %s (%d words each)',quads,depth)

        for link in self.links:
            ctrl.selectLink( link )

            vRx = buf.downloadValidRx( depth )
            rxData.addlink( link, vRx )

            vTx = buf.downloadValidTx( depth )
            txData.addlink( link, vTx )

        if path: os.system('mkdir -p '+path)

        dataio.writeValid(rxData, os.path.join(path,'rx_summary.txt'))
        dataio.writeValid(txData, os.path.join(path,'tx_summary.txt'))

    #---
    def captureAndDump(self, path, capture=True, depth=parameters.defaults.mgtBuffersDepth, data_rx=None, data_tx=None ):
        '''
        if cap_depth is 0x0 or none, don't capture
        '''
        if data_rx and isinstance(data_rx.values()[0], dict):
            raise TypeError("data_rx is a dict of dict!!!")
        if data_tx and isinstance(data_tx.values()[0], dict):
            raise TypeError("data_tx is a dict of dict!!!")

        # Local references
        ctrl = self.ctrl
        ttc = self.ttc
        buf = self.buf
        demux = self.demux

        self.clearBuffers( data_rx, data_tx  )
        # clear the demux counters
        demux.getNode("ctrl.ctrl.clr_err").write(0x1)
        demux.getNode("ctrl.ctrl.resync").write(0x1)
        demux.getNode("ctrl.ctrl.clr_err").write(0x0)
        demux.getNode("ctrl.ctrl.resync").write(0x0)
        demux.getClient().dispatch()

        if capture:
            self._log.info('Capturing buffers')
            # Capture the buffers
            ttc.capture(.1)
            # And check it's done
            buf.waitCaptureDone()
            self._log.info('Capture completed')

        clk40_locked = ctrl.clock40Locked()
        self._log.info('Clock 40 is %s',('unlocked','locked')[clk40_locked])

        #bc0_err = ttc.getNode('ttc.stat0.bc0_err').read()
        #ttc.getClient().dispatch()
        #print "BC0 error is",bc0_err.value()

        # Dump
        if path:
            self.snapshotBuffers(path, depth=depth)
