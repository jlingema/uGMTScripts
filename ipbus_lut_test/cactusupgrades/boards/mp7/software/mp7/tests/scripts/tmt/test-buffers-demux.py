#!/bin/env python

import time
import sys
import array
import os
import mp7
import logging
import ansistrm

# MP7 import
import uhal
import mp7

import mp7tools.helpers as hlp

from mp7tools.helpers import bin, hookDebugger, list_maker, intlist_maker
from mp7tools.tester import MP7Tester, DemuxTester
from mp7tools.buffers import Configurator, BoardDataSource, DemuxDataSource


#---
def parseOptions():
    import optparse

    usage = '%prog board_id [options]'

    parser = optparse.OptionParser( usage )
    parser.add_option('-m', '--modes' , dest='modes'  , help='buffer modes to test (%default)', default=[]        , type='string', action='callback' , callback=list_maker('modes'))
    parser.add_option('-q', '--quads' , dest='quads'   , help='list of quads (%default)'        , default=[0]       , type='string', action='callback' , callback=intlist_maker('quads'))
    parser.add_option('-p', '--path'  , dest='path'    , help='output path'                     , default=None      , type='string' )
    parser.add_option('-l', '--loop'  , dest='loop'    , help='MGTs loopback (%default)'        , default=2         , type='int' )
    parser.add_option('--mgt'         , dest='cfgmgt'  , help='Config the mgts'                 , default=False     , action='store_true' )
    parser.add_option('--reset'       , dest='reset'   , help='Apply master reset'              , default=False     , action='store_true' )
    parser.add_option('--load'        , dest='data_uri', help='data to upload: <file>:<board#>' , default='pattern' , )

    opts, args = parser.parse_args()

    if len(args) != 1:
        parser.error('Missing board id')
    opts.board = args[0]

    if opts.loop not in [0,2]:
        parser.error('Loopmode can be 0 or 2')

    opts.modes = set(opts.modes)

    hlp.validateDataUri( parser, opts )
    hlp.validatePath( parser, opts )

    return opts,args

#---
# parse options
opts, args = parseOptions()

# logging initialization
hlp.initLogging( logging.DEBUG, opts.logfile )

# print logging
logging.debug('Opts: %s',opts)
logging.debug('Args: %s',args)

# Prepare the data to be loaded into the pp RAMs
#if opts.data_uri is not None:
    #src = BoardDataSource( opts.data_uri, depth=0x400 )
    ## 2 preprocessors
    #data_event,_ =  src.data, src.cpb

src = DemuxDataSource( depth = 0x400 )
data_event = src.data


# Mask the errors when loading the address tables
uhal.setLogLevelTo(uhal.LogLevel.ERROR)
cm = uhal.ConnectionManager('file://etc/uhal/connections904.xml')
board = cm.getDevice( opts.board )

# Ads
print '  __  __ ____ _____ ____ '
print ' |  \/  |  _ \___  / / / '
print ' | |\/| | |_) | / / / /  '
print ' | |  | |  __/ / / / /   '
print ' |_|  |_|_|   /_/_/_/    '
print '                         '

# Id, to remind ourselves what we are dealing with
print 'This is:',board.id(),'['+board.uri()+']'

mp7test = DemuxTester( board, opts.quads )

print 'Using tester class',mp7test.__class__.__name__

csr     = mp7test.csr
ttc     = mp7test.ttc
xpoint  = mp7test.xpoint
si5326  = mp7test.si5326
gth     = mp7test.gth
buf     = mp7test.buf
demux   = mp7test.demux

def go( path = 'data', modes=[], reset=True, cfgmgt = True, loop=2, quads=[0] ):

    # Increase the logging verbosity
    uhal.setLogLevelTo(uhal.LogLevel.WARNING)

    if reset:
        print 'Resetting'
        # Reset the board
        mp7test.reset()


    if cfgmgt:
        print 'Configuring MGTs'
        # This is probably not working
        # if in loopback, feed something into the Rx buffers
        if loop == 2:
            mp7test.patternTx2Rx()

        # config GTHs, just in case
        mp7test.configGTH(loop)

    # settings
    play_bx  = (0x0,0xaa)
    play_bx  = (0x0,0x12)
    cap_bx   = (0x0,0xaa)
    play_len = play_bx[1]-play_bx[0]+1

    # build up some pattern
    data = dict( (l,b) for l,b in data_event.iterlinks() )

    bufcfg = Configurator( mp7test.buf, cap=cap_bx, play=play_bx )
    bufcfg.configure('algoPlay')
    # after the buffer configuration?
    demux.getNode("csr.ctrl.lat_p").write(0x0)


    # build up some pattern
    data = dict( (l,b) for l,b in data_event.iterlinks() )


    for i in xrange(10):
        d = demux.dump()

        print 'good :',d['csr.good_count']
        print 'empty:',d['csr.empty_count']
        time.sleep(0.1)

    mp7test.captureAndDump(path, data_rx=data, depth=0x400)

    for i in xrange(5):
        d = demux.dump()

        print 'good :',d['csr.good_count']
        print 'empty:',d['csr.empty_count']
        time.sleep(0.1)

    return

#-Execution--
if not hlp.run_from_ipython():
    go( opts.path, opts.modes, opts.reset, opts.cfgmgt, opts.loop, opts.quads )
else:
    uhal.setLogLevelTo(uhal.LogLevel.NOTICE)

