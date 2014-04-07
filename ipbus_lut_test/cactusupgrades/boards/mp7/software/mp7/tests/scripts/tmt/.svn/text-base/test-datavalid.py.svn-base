#!/bin/env python

from mp7tools.buffers import BoardDataSource,PatternBuilder


if __name__ == '__main__':

    blocks = PatternBuilder()

    blocks.insert(range(0x10,0x18), 5 )
    print 'len is ',len(blocks)
    blocks.insert(range(0x30,0x40) , 40 )
    print 'len is ',len(blocks)
    blocks.insert(range(0x5,0x8) , 21 )
    print 'len is ',len(blocks)


    print '\n'.join( ['%04d - 0x%016x' % (i,v) for i,v in enumerate(blocks.aslist())] )

    # use a board data source for input
    src = BoardDataSource( 'pattern', 1, depth=60 )

    # 1 preprocessors
    data_event, cpb =  src.data, src.cpb

    # settings for splitting
    wpbx = 6
    nframes = 30
    nblocks = 2

    data = {}

    print "Slicing!"
    print '-'*80
    print '\n'.join( ['%04d - 0x%016x' % (i,v) for i,v in enumerate(data_event.getlinkbuffer(17))] )
    print '-'*80

    for ichan in xrange(72):

        ichan = 17

        bufdata = data_event.getlinkbuffer(ichan)

        blocks = PatternBuilder()
        for bx in xrange(nblocks):
            # this is my header
            # quad, chan, bx?
            # 0xq0c00bbb
            d = [ (ichan/4<<28)+(ichan%4<<20)+bx ]
            d.extend( bufdata[bx*nframes:(bx+1)*nframes] )
            # space the blocks by 1 block
            blocks.insert( d, bx*2*nframes )


        print '\n'.join( ['%04d - 0x%016x' % (i,v) for i,v in enumerate(blocks.aslist())] )
        data[ichan] = blocks.aslist()
        break




