from array import array
import itertools

class ValBlock:
    '''
    Structure:
        list of data
        with a frame range

    payload
    offset
    first valid
    last valid


    '''
    def __init__(self, payload, vstart=None, vend=None ):
        self._payload = payload
        if not vstart: vstart = 0
        if not vend:  vend  = len(payload)
        self._vrange = (vstart,vend)

    def raw(self):
        vstart,vend = self._vrange

        #rawblock = array('L', itertools.repeat(0x0,len(self)) )
        rawblock = [0x0] * len(self)
        for i,v in enumerate(self._payload):

            v64 = (( vstart <= i and i<vend ) << 32) + v

            rawblock[i] = v64

        return rawblock

    def __len__(self):
        return self._payload.__len__()



class ValBlockList_deprecated:
    '''
    aaaa
    '''

    #---
    def __init__(self):
        # structure lowedge, upedge, block
        self._blocks = []

    #---
    def insert(self, block, offset=None ):

        if offset is None:
            offset = len(self)

        if not self._blocks:
            self._blocks.append( (offset,offset+len(block)-1, block) )
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

        self._blocks.insert( j, (offset, offset+len(block)-1, block) )

    #---
    def append(self, block, gap=0):
        offset = len(self)+gap
        self._blocks.append( (offset, offset+len(block)-1, block) )

    #---
    def appendat(self, block, offset):
        '''Append the block at offset

        Args:
            block: the block of words
            offset: location where to attach
        '''
        if offset < len(self):
            raise IndexError( 'Cannot append at %d' % offset )

        self._blocks.append( (offset, offset+len(block)-1, block) )

    #---
    def __len__(self):
        if not self._blocks: return 0

        _,he,_ = self._blocks[-1]
        return he+1

    #---
    def raw(self):

        rawblock = [0x0] * len(self)

        for lo,up,block in self._blocks:
            rawblock[lo:up+1] = block.raw()

        return rawblock



