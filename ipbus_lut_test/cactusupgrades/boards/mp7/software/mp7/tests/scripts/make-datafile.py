#!/bin/env python
'''
Create a board buffer data file.
'''

import logging
import ansistrm

import mp7tools.helpers as hlp
import mp7tools.buffers as buffers
import mp7tools.dataio as dataio

def parseOptions():
    '''
    Parse here the command line options
    '''
    import optparse
    usage = '''
%prog name [options]

'''

    parser = optparse.OptionParser( usage )
    parser.add_option('-g','--generate' , dest='generate' , help='Data to generate' , default='empty')

    opts, args = parser.parse_args()

    if not args or len(args) != 1:
    	parser.error('No output file defined')

    opts.output = args[0]

    return opts,args


# logging initialization
hlp.initLogging( logging.DEBUG )

opts, args = parseOptions()

dataSource = buffers.BoardDataSource('generate:'+opts.generate)

# print dataSource.data

dataio.writeValid( dataSource.data, opts.output )

data2 = dataio.readValid( opts.output )

print 'Consistency check:',('Failed','OK')[dataSource.data == data2[0]]
