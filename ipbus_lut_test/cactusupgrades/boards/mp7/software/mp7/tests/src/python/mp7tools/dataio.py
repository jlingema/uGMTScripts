#!/bin/env python

'''
----------------
BoardData format
----------------
    Originally intended for 32 bits words, it can host 64, where, at the moment, the 33rd bit is the valid flag
    The words are displayed as

    YvXXXXXXXX

    Y       : data valid bit
    XXXXXXXX: data payload


    Board pattern                                             <-- Board name/id
     Quad/Chan :    q00c0      q00c1      q00c2      q00c3    <-- Quad/channel number
          Link :     00         01         02         03      <-- Link number
    Frame 0000 : 0v00000000 0v00010000 0v00020000 0v00030000
    Frame 0001 : 0v00000001 0v00010001 0v00020001 0v00030001
    Frame 0002 : 0v00000002 0v00010002 0v00020002 0v00030002
    Frame 0003 : 0v00000003 0v00010003 0v00020003 0v00030003
    Frame 0004 : 0v00000004 0v00010004 0v00020004 0v00030004
    Frame 0005 : 0v00000005 0v00010005 0v00020005 0v00030005
    Frame 0006 : 1v00000006 1v00010006 1v00020006 1v00030006  <-- data valid bit goes high here
    Frame 0007 : 1v00000007 1v00010007 1v00020007 1v00030007
    Frame 0008 : 1v00000008 1v00010008 1v00020008 1v00030008
    Frame 0009 : 1v00000009 1v00010009 1v00020009 1v00030009
    Frame 0010 : 1v0000000a 1v0001000a 1v0002000a 1v0003000a

'''
import itertools
import re
import logging
import valid

_log = logging.getLogger(__name__)

class BoardData:
    '''Storage class for the MP7 buffer data
    '''

    def __init__(self, id=None ):
        self.id      = id
        self.depth   = 0
        self.links   = []
        self.buffers = []

    def __eq__(self, other):

        # for k in self.__dict__.keys():
            # print k, getattr(self,k) == getattr(other,k)
        # return ( 
        #     self.id == other.id and
        #     self.depth == other.depth
        #     )

        return self.__dict__ == other.__dict__


    def iterlinks(self):
        return itertools.izip(self.links, self.buffers)

    def getlinkbuffer(self,i):
        '''getlinkbuffer( i ) -> list

        Returns the buffer from the link number
        '''
        if   isinstance( i, int ):
            return self.buffers[self.links.index(i)]
        elif isinstance( i, slice ):
            # slice option
            return [ self.buffers[k] for k in self.links[i] ]
        raise TypeError('data indices must be integers')


    def addlink(self, link, frames ):

        if link in self.links:
            raise ValueError('Link %d is already present' % link )
        self.links.append(link)
        self.buffers.append(frames)

        # insure to have a uniform depth
        assert( len(set(len(b) for b in self.buffers))==1 )

        if self.depth == 0:
            self.depth = len(frames)

    def frame(self, k):
        'Get the k-th frame'
        if not k < self.depth:
            raise IndexError()
        return [ b[k] for b in self.buffers ]

        #elif isinstance( k, slice ):
            ## generate the index list
            #indexes = range(self.depth)[k]

            ## build the list of frames
            #return [ [ b[k] for b in self.buffers ] for k in indexes ]

    def row(self, r):
        'Get the r-th row'
        if not r < self.depth:
            raise IndexError()

        return [ (l,b[r]) for l,b in itertools.izip(self.links, self.buffers) ]

class Slicer:

    def __init__(self, fpb=30, gap=10, offset=0, header=None):
        '''
        What do I do with the header? It needs a header
        '''
        # frame per blocks
        self.fpb    = fpb
        self.gap    = gap
        self.offset = offset

    def slice(self, data):
        sliced = BoardData(data.id+'_sliced')

        # +1 if no precise splitting is possible
        nblocks = data.depth/self.fpb+( data.depth%self.fpb == 0 )

        for l,b in data.iterlinks():

            blocks = valid.ValBlockList()
            blocks.append( self._buildblock(l,b), self.offset )

            for ib in xrange(1,nblocks):
                blocks.append( self._buildblock(l,b,ib), self.gap )

            sliced.addlink(l,blocks.raw())

        return sliced

    def _buildblock(self, link, buf, ib=0):
        raw = []
        header = (link/4<<24)+(link%4<<20)+ib
        raw.append( header )
        raw.extend( buf[ ib*self.fpb : (ib+1)*self.fpb ] )
        return valid.ValBlock( raw )


#---
def write( boards, path ):

    # sanitize inputs
    if isinstance(boards, BoardData):
        boards = [boards]
    elif isinstance(boards,list):
        boards = boards
    else:
        raise TypeError('boards must be a BoardData or a BoardData list')

    #TODO: debug?
    _log.info( '>>> Writing %d board(s) to %s', len(boards), path )

    ofile = open(path,'w')

    for board in boards:

        # board id
        ofile.write('Board %s\n'% board.id)

        # quad/chan header
        ofile.write(' Quad/Chan :')
        for i in board.links:
            ofile.write('   q%02dc%1d ' % (i/4, i%4))
        ofile.write('\n')

        # link header
        ofile.write('      Link :')
        for i in board.links:
            ofile.write('    %02d   ' % i)
        ofile.write('\n')

        # frames
        #for i,frame in enumerate(board):
        for i in xrange(board.depth):
            frame = board.frame(i)
            ofile.write('Frame %04d :' % i)
            for w in frame:
                ofile.write(' %08x' % w)
            ofile.write('\n')

        ofile.write('\n')

    ofile.close()

#---
def writeValid( boards, path ):
    '''writeValid( path ) -> None

    Helper function to write BoardData to file, including the valid data bit.

    '''

    # sanitize inputs
    if isinstance(boards, BoardData):
        boards = [boards]
    elif isinstance(boards,list):
        boards = boards
    else:
        raise TypeError('boards must be a BoardData or a BoardData list')

    #TODO: debug?
    _log.info( '>>> Writing %d board(s) to %s', len(boards), path )

    ofile = open(path,'w')

    for board in boards:

        # board id
        ofile.write('Board %s\n'% board.id)

        # quad/chan header
        ofile.write(' Quad/Chan :')
        for i in board.links:
            ofile.write('    q%02dc%1d  ' % (i/4, i%4))
        ofile.write('\n')

        # link header
        ofile.write('      Link :')
        for i in board.links:
            ofile.write('     %02d    ' % i)
        ofile.write('\n')

        # frames
        for i in xrange(board.depth):
            frame = board.frame(i)
            ofile.write('Frame %04d :' % i)
            for w in frame:
                ofile.write(' %1dv%08x' % ((w >> 32) & 0x1,w & 0xffffffff) )
            ofile.write('\n')

        ofile.write('\n')

    ofile.close()
#---
def read( path ):
    '''readData( path ) -> list( BoardData )

    Old version, the data valid bit is not considered
    '''
    # some regex
    _re_board = re.compile('^Board (.+)')
    _re_link  = re.compile('^Link : (.*)')
    _re_frame = re.compile('^Frame (\d{4}) : (.*)')

    boards = []

    ifile = open(path)

    for line in ifile:
      line = line.strip()
      if not line or line[0] == '#': continue

      m = _re_board.match(line)
      if m:
        _log.debug('Found board %s',m.group(1))
        board    = BoardData()
        board.id = m.group(1)
        boards.append(board)
        continue

      m = _re_link.match(line)
      if m:
        links = [int(x) for x in m.group(1).split()]
        board.links = links
        board.buffers = [ list() for _ in links ]
        continue

      m = _re_frame.match(line)
      if m:
        fid = int(m.group(1))

        # add the data valid bit by hand. Assume all data is valid
        fwords = [(1<<32)+int(x,16) for x in m.group(2).split()]

        # check the frames depth to be ok
        #assert( fid == len(board.frames) )

        #board.frames.append(fwords)

        for w,b in itertools.izip( fwords, board.buffers ):
          # check that the buffer depth is correct
          assert( fid == len(b) )

          b.append(w)

        board.depth = fid+1

    ifile.close()

    return boards

#---
def readValid( path ):
    '''readData( path ) -> list( BoardData )

    Reads a buffer data file, converting it into a BoardData object. 
    '''
    # some regex
    _re_board = re.compile('^Board (.+)')
    _re_link  = re.compile('^Link : (.*)')
    _re_frame = re.compile('^Frame (\d{4}) : (.*)')

    boards = []

    ifile = open(path)

    for line in ifile:
      line = line.strip()
      if not line or line[0] == '#': continue

      m = _re_board.match(line)
      if m:
        _log.debug('Found board %s',m.group(1))
        board    = BoardData()
        board.id = m.group(1)
        boards.append(board)
        continue

      m = _re_link.match(line)
      if m:
        links = [int(x) for x in m.group(1).split()]
        board.links = links
        board.buffers = [ list() for _ in links ]
        continue

      m = _re_frame.match(line)
      if m:
        fid = int(m.group(1))

        fwords = [ ( (int(x[0])<<32 ) + int(x[2:10],16) ) for x in m.group(2).split()]

        # check the frames depth to be ok
        #assert( fid == len(board.frames) )

        #board.frames.append(fwords)

        for w,b in itertools.izip( fwords, board.buffers ):
          # check that the buffer depth is correct
          assert( fid == len(b) )

          b.append(w)

        board.depth = fid+1

    ifile.close()

    return boards


#---
# class reader:

#   def __init__(self, path ):
#     self.path   = path
#     self.boards = []

#     # some regex
#     self._re_board = re.compile('^Board (\d+)')
#     self._re_link  = re.compile('^Link : (.*)')
#     self._re_frame = re.compile('^Frame (\d{4}) : (.*)')

#     self._load()

#   def _load(self):
#     ifile = open(self.path)

#     for line in ifile:
#       line = line.strip()
#       if not line or line[0] == '#': continue

#       m = self._re_board.match(line)
#       if m:
#         print 'Found board',int(m.group(1))
#         board = BoardData()
#         board.id     = int(m.group(1))
#         self.boards.append(board)
#         continue

#       m = self._re_link.match(line)
#       if m:
#         links = [int(x) for x in m.group(1).split()]
#         board.links = links
#         board.buffers = [ list() for _ in links ]
#         continue

#       m = self._re_frame.match(line)
#       if m:
#         fid = int(m.group(1))
#         fwords = [int(x,16) for x in m.group(2).split()]

#         # check the frames depth to be ok
#         #assert( fid == len(board.frames) )

#         #board.frames.append(fwords)

#         for w,b in itertools.izip( fwords, board.buffers ):
#           # check that the buffer depth is correct
#           assert( fid == len(b) )

#           b.append(w)

#         board.depth = fid

#     ifile.close()



