import inspect
import mp7
import logging
import parameters

# import the enumerator for brevity
_BufMode = mp7.DatapathNode.BufMode
_DataSrc  = mp7.DatapathNode.DataSrc 
#----------------------------


class PathConfigurator:
    '''Helper class to deal with datapath configuration

    From the user perspective, each channel datapath is configurable in the following modes
      - 'latency' 
      - 'capture' 
      - 'playonce'
      - 'playloop'
      - 'pattern' 
      - 'zeroes'  

    On the other hand datapath for each channel is configured in terms of
      - buffer mode
      - data source 
      - bx that triggers data-valid  high
      - number of valid words

      PathConfigurator translates the mode into the  buffer mode + data source and applies them to the block

    '''
    _modes = {
        'latency': (_BufMode.Latency,  _DataSrc.Input   ),
        'capture':  (_BufMode.Capture,  _DataSrc.Input   ),
        'playonce': (_BufMode.PlayOnce, _DataSrc.Buffer  ),
        'playloop': (_BufMode.PlayLoop, _DataSrc.Buffer  ),
        'pattern':  (_BufMode.PlayOnce, _DataSrc.Pattern ),
        'zeroes':   (_BufMode.PlayOnce, _DataSrc.Zeroes  ),
    }

    def __init__(self, mode, trig_bx, max_words ):
        '''
        Args:
            mode(string): mode to be applied to the datapath
            trig_bx(int): bunch crossing before the first frame with datavalid=1 
            max_words(int): 
        '''
        if mode not in self._modes:
            raise AttributeError('Mode '+mode+' not known')

        self._mode = mode
        self._trig_bx = trig_bx
        self._max_words = max_words

    def __str__(self):
        (mode,data_src) = self.pathmode
        return (self.__class__.__name__+
            '(mode=%s(%s),data_src=%s(%s),trig_bx=%s,max_words=%s)' %
             (mode,mode.numerator,data_src,data_src.numerator,self._trig_bx,self._max_words))

    @classmethod
    def withBXRange(cls, mode, bxrange, **generics ):
        '''Construct a PathConfigurator object using bunch crossign range as input.

        Args:
        '''

        cr = generics['clock_ratio']
        bc = generics['bunch_count']

        (first_bx,last_bx) = bxrange
        # if first_bx is 0 
        trig_bx = first_bx-1 if first_bx >0 else (first_bx+bc-1)
        max_words = (last_bx-first_bx+1)*cr-1
        return cls(mode, trig_bx, max_words )

    def __call__(self, datapath):
        self.apply(datapath)

    @property
    def pathmode(self):
        return self._modes[self._mode]

    def configure(self, datapath):
        datapath.configure( *(self.pathmode) )
        datapath.setRange( self._trig_bx, self._max_words )


class Configurator2g:
    ''' Helper class to configure MP7 buffers in an almost human readable way
    '''
    _log = logging.getLogger('Configurator2g')
    _modes = {
        'latency':    ('latency',  'latency'), # L1 capture
        'captureRx':   ('capture',  'latency'), # 
        'captureTx':   ('latency',  'capture'), # 
        'captureRxTx': ('capture',  'capture'), # 
        'algoPlay':    ('playonce', 'capture'),
        'algoPatt':    ('pattern',  'capture'),
        'loopPlay':    ('capture',  'playonce'),
        'loopPatt':    ('capture',  'pattern'),
    }

    @classmethod
    def modes(cls):
        return cls._modes.keys()

    @property
    def boardmode(self):
        return self._modes[self._mode]

    def __init__(self, mode, play=( 0x0, 0xaa ), cap=( 0x0, 0x2a ) ):

        # Search for the requested config
        # self._log.debug('%s play: (%d,%d) cap: (%d,%d)', mode, self._play[0], self._play[1], self._cap[0], self._cap[1] )
        if mode not in self._modes:
            raise AttributeError('Mode '+mode+' not known')

        self._mode = mode
        self._play = play
        self._cap  = cap

    def getrange(self,mode):
        if mode in ['pattern','playonce','playloop']:
            return self._play
        elif mode == 'capture':
            return self._cap
        else:
            return (0x0,0x0)

    def assignRxTx(self, data):
        mode_rx,mode_tx = self.boardmode 
        data_rx = data if mode_rx in ['playonce','playloop'] else None
        data_tx = data if mode_tx in ['playonce','playloop'] else None

        return data_rx, data_tx

    def configure(self, ctrl, datapath, **generics ):
        '''Applies the requested configuration to the buffers
        It should be modified wo work with MP7 tester directly, but I fear circular dependencies

        Args:
            ctrl: MP7Ctrl node
        '''
        # Search for the requested config
        self._log.debug('%s play: (%d,%d) cap: (%d,%d)', self._mode, self._play[0], self._play[1], self._cap[0], self._cap[1] )

        print generics
        bc = generics['bunch_count']
        nq = generics['nquad']
        cr = generics['clock_ratio']

        rxmode,txmode = self.boardmode 
        rxrange = self.getrange(rxmode)
        txrange = self.getrange(txmode)

        rxconfig = PathConfigurator.withBXRange(rxmode, rxrange, bunch_count=bc, clock_ratio=cr)
        txconfig = PathConfigurator.withBXRange(txmode, txrange, bunch_count=bc, clock_ratio=cr)

        print 'rxconfig',rxconfig
        print 'txconfig',txconfig

        for l in xrange(nq*4):
            ctrl.selectLinkBuffer(l,ctrl.BufferSelect.Rx)
            rxconfig.configure(datapath)

            ctrl.selectLinkBuffer(l,ctrl.BufferSelect.Tx)
            txconfig.configure(datapath)


#----------------------------
class PatternBuilder:
    '''PatternBuilder

    Provides an easy way to collect to assemble a data to upload to a buffer as a collection of valid/invalid blocks
    '''

    #---
    def __init__(self):
        # structure lowedge, upedge, block
        self._blocks = []

    #---
    def insert(self, block, offset=None, valid=True ):

        if offset is None:
            offset = len(self)

        if not self._blocks:
            self._blocks.append( (offset, valid, block) )
            return 0;

        # make a list of offsets
        offsets = [ o for o,_,_ in self._blocks ]

        # already a number in there
        if offset in offsets:
            raise ValueError('Block overlapping at offset %d' % offset)

        # find where to put the new block
        import bisect
        j = bisect.bisect(offsets, offset)
        #print '-',j

        # check the left bound, if not at the border
        if j!=0:
            _,upleft,_  = self._blocks[j-1]
            # check it fits to the left
            if offset < upleft:
                raise IndexError('Block overlap [%d < left %d]' % ( offset, upleft) )

        # check the right bound, if not at the border
        if j<len(offsets):
            loright,_,_ = self._blocks[j]
            # and to the right
            if offset+len(block) >= loright:
                raise IndexError('Block overlap [%d >= right %d]' % ( offset, loright) )

        self._blocks.insert( j, (offset, valid, block) )

    #---
    def append(self, block, gap=0, valid=True):
        offset = len(self)+gap
        self._blocks.append( (offset, valid, block) )

    #---
    def appendat(self, block, offset, valid=True):
        '''Append the block at offset

        Args:
            block: the block of words
            offset: location where to attach
        '''
        if offset < len(self):
            raise IndexError( 'Cannot append at %d' % offset )

        self._blocks.append( (offset, valid, block) )

    #---
    def __len__(self):
        if not self._blocks: return 0

        offset,_,block = self._blocks[-1]
        return offset+len(block)

    #---
    def aslist(self, minsize=0):

        rawblock = [0x0] * max(minsize, len(self))

        for offset,valid,block in self._blocks:
            rawblock[offset:offset+len(block)] = [ ( valid << 32 ) + ( w & 0xffffffff ) for w in block ]

        return rawblock



#----------------------------
import random
import dataio
import os

class BoardDataSource(object):
    '''Description

    Class to provide properly formatted data for the MP7 input buffers
    '''
    _log = logging.getLogger('BoardDataSource')

    @staticmethod
    def validateDataUri( uri ):
        if uri.startswith('file://') :
            tokens = uri[7:].split('?')
            print tokens
            if   len(tokens) == 2:
                data_file, iboard = tokens
                # test integer conversion
            elif len(tokens) == 1:
                data_file, iboard = tokens[0],'0'
            else:
                raise RuntimeError( 'Malformed data file, must be file://<path>?<board>')
            if not iboard.isdigit():
                raise RuntimeError( 'Malformed data file, must be file://<path>?<board>')
            if not os.path.exists( data_file ):
                raise RuntimeError('File %s not found' % data_file)
    
            uri = 'file://'+data_file+'?'+iboard
            
        elif uri.startswith('generate:'):
            tokens = uri.split(':')
            if len(tokens) != 2:
                raise RuntimeError('Malformed data URI')
    
            if tokens[1] not in ['random','pattern','empty']:
                raise RuntimeError('Invalid generator mode')
        else:            
            raise RuntimeError('Invalid buffer data URI')

        return uri

    def __init__(self, data_uri, depth=0x400):
        '''Description

        Arguments:
        data_uri: uri to the data to fill the board with [path,'random','pattern']
        '''
        self._uri   = data_uri
        self._depth = depth

        self._data = self._process()

    @property
    def data(self):
        return self._data

    def _process(self):
        '''Description
        '''
        nlinks = parameters.mp.nlinks

        if self._uri == 'generate:empty':
            self._log.info( '--Empty' )
            data_event = dataio.BoardData('empty')
            for c in xrange(nlinks):
                # ipp = c/cpb
                data_event.addlink( c, [ 0x0 ]*self._depth )
        
        elif self._uri == 'generate:pattern':
            # pattern is
            # Ipp, Channel, Frame
            # - 0xICCCFFFF

            self._log.info( '--Pattern' )
            data_event = dataio.BoardData('pattern')

            for c in xrange(nlinks):
                # ipp = c/cpb
                data_event.addlink( c, [ ((1<<32)+(c<<16) + k ) for k in xrange( self._depth ) ] )

        elif self._uri == 'generate:random':

            self._log.info( '--Random' )
            data_event = dataio.BoardData('random')
            for i in xrange(nlinks):
                data_event.addlink( i, [ (1<<32)+random.randint(0,(1<<32)) for _ in xrange( self._depth ) ] )

        elif self._uri.startswith('file://'):
            self._log.info( '--Data from %s',self._uri)

            if ':' in self._uri:
                data_file, iboard = self._uri[7:].split('?')
            else:
                data_file = self._uri
                iboard    = 0

            data_list = dataio.readValid(data_file)

            data_event = data_list[int(iboard)]

        else:
            raise RuntimeError('%s is not a valid uri' % self._uri)

        return data_event



class PPDataSource(BoardDataSource):
# class BoardDataSource(object):
    '''Description

    Entry point for standard data for the tests.
    Provides:
        - geo-temporal pattern
        - randoms
        - data from Andy Rose's event dumper
    '''
    _log = logging.getLogger('PPDataSource')

    #---
    def __init__(self, data_uri, npps=1, depth=0xa00 ):
        '''Description

        Args:
            data_uri: Uri to the data [path, random, pattern]
            npps:  Number of preprocessors (useful for pp input)
            depth: Number of frames to generate (used by randoms and pattern)
        '''
        self.uri   = data_uri
        self.npps  = npps
        self.depth = depth

        data,cpb = self._process()

        # produced data
        self.data = data
        # channels per board
        self.cpb  = cpb

    #---
    def _process(self):
        nlinks = parameters.mp.nlinks

        if self.uri == 'pattern':
            # pattern is
            # Ipp, Channel, Frame
            # - 0xICCCFFFF

            self._log.info( '--Pattern' )
            data_event = dataio.BoardData('pattern')

            cpb = nlinks/self.npps
            # Can we split it among the boards?
            assert( (cpb*self.npps) == nlinks)

            for c in xrange(nlinks):
                ipp = c/cpb
                data_event.addlink( c, [ ( (ipp<<28)+(c<<16) + k ) for k in xrange( self.depth ) ] )

        elif self.uri == 'random':
            self._log.info( '--Random' )
            cpb = nlinks/self.npps
            data_event = dataio.BoardData('random')
            for i in xrange(nlinks):
                data_event.addlink( i, [ random.randint(0,(1<<32)) for _ in xrange( self.depth ) ] )

        else:
            self._log.info( '--Data from %s',self.uri)

            if ':' in self.uri:
                data_file, iboard = self.uri.split(':')
            else:
                data_file = self.uri
                iboard    = 0

            data_list = dataio.read(data_file)

            data_event = data_list[int(iboard)]

            # Channels per boards
            cpb = len(data_event.links)/self.npps
            # Can we split it among the boards?
            assert( (cpb*self.npps) == len(data_event.links) )

        return data_event,cpb

#----------------------------
import itertools
class DemuxDataSource:

    _log = logging.getLogger('DemuxDataSource')

    # FIXME: same parameter as in tester.py -> move it to a separate module

    SAMPLES     = 20
    NMP         = 9
    NACTIVEMP   = 8
    NCHAN       = 4
    FRAMELEN    = 6
    CLOCK_RATIO = 6

    #---
    def __init__(self, depth=0x400 ):
        self.depth = depth

        data = self._process()

        # produced data
        self.data = data

    #---
    def _process(self):

        data_event = dataio.BoardData('demux')

        for imp in xrange(self.NMP):
            for ich in xrange(self.NCHAN):
                blkList = PatternBuilder()
                offset  = self.CLOCK_RATIO * imp

                l = imp*self.NCHAN+ich
                if imp < self.NACTIVEMP:
                    print l,'pattern'
                    # fill the active ones
                    for isamp in xrange(self.SAMPLES):
                        base = ((imp & 0xff) << 24) + ((ich & 0xff) << 16) + ((isamp & 0xff) << 8)
                        blk  = [ base + imp + isamp * self.CLOCK_RATIO * ((self.FRAMELEN + 1) / self.CLOCK_RATIO) ]
                        blk.extend([ base + i for i in xrange(self.FRAMELEN) ])

                        blkList.appendat( blk, isamp*(self.FRAMELEN*self.NMP)+offset)

                    data_event.addlink( l, blkList.aslist()[:self.depth] )
                else:
                    print l,'zeroes'
                    # the rest are 0
                    data_event.addlink( l, [0x0]*self.depth)

        return data_event

