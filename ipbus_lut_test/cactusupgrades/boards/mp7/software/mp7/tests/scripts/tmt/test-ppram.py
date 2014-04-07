#!/bin/env python

import time
import sys
import array
import os
import mp7
import logging
import ansistrm

# MP7 import
import mp7

import mp7tools.helpers as hlp
import mp7tools.configurator as cfg

from mp7tools.helpers import bin, hookDebugger, list_maker, intlist_maker
from mp7tools.tester import MP7Tester
from mp7tools.configurator import BufferConfigurator, BoardDataSource

import mp7tools.dataio as dataio

#---
def parseOptions():
    import optparse

    usage = '%prog board_id [options]'

    parser = optparse.OptionParser( usage )
    parser.add_option('-q', '--quads' , dest='quads'  , help='list of quads (%default)'       , default=[0]       , type='string', action='callback' , callback=intlist_maker('quads'))
    parser.add_option('-p', '--path'  , dest='path'   , help='output path (%default)'         , default=None      , type='string' )
    parser.add_option('-l', '--loop'  , dest='loop'   , help='MGTs loopback (%default)'       , default=2         , type='int' )
    parser.add_option('--mgt'         , dest='cfgmgt'  , help='cfg the mgts'                    , default=False     , action='store_true' )
    parser.add_option('--reset'       , dest='reset'   , help='master reset'                    , default=False     , action='store_true' )
    parser.add_option('--load'        , dest='data_uri', help='data to upload: <file>:<board#>' , default=None  , )

    opts, args = parser.parse_args()

    if len(args) != 1:
        parser.error('Missing board id')
    opts.board = args[0]

    if opts.loop not in [0,2]:
        parser.error('Loopmode can be 0 or 2')

    hlp.validateDataUri( parser, opts )
    hlp.validatePath( parser, opts )

    return opts,args

#---
import uhal
import mp7

# parse options
opts, args = parseOptions()

# logging initialization
hlp.initLogging( logging.INFO, opts.logfile )

logging.debug('Opts: %s',opts)
logging.debug('Args: %s',args)

# Prepare the data to be loaded into the pp RAMs
if opts.data_uri is not None:
    src = BoardDataSource( opts.data_uri, 2, depth = 0xa00 )
    # 2 preprocessors
    data_event, cpb =  src.data, src.cpb

# Mask the errors when loading the address tables
uhal.setLogLevelTo(uhal.LogLevel.ERROR)
cm = uhal.ConnectionManager('file://etc/uhal/connections904.xml')
board = cm.getDevice( opts.board )

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

mp7test = MP7Tester( board, opts.quads )

print 'Using tester class',mp7test.__class__.__name__

csr     = mp7test.csr
ttc     = mp7test.ttc
xpoint  = mp7test.xpoint
si5326  = mp7test.si5326
gth     = mp7test.gth
buf     = mp7test.buf
ppram   = mp7test.ppram

def go( path = 'data', reset=True, cfgmgt = True, loop=2, data_uri=None ):
#def go( path, ppmode, quads, reset, cfgmgt, loop ):

    # Increase the logging verbosity
    uhal.setLogLevelTo(uhal.LogLevel.WARNING)

    if reset:
        # Reset the board
        mp7test.reset()

    if cfgmgt:

        # config GTHs, just in case
        mp7test.configGTH(loop)

    # settings
    play_bx  = (0x0,0xaa)
    cap_bx   = (0x0,0xaa)
    play_len = play_bx[1]-play_bx[0]+1

    pp_data_sel = ( data_uri is not None )


    print 'Configuring the PP rams'
    csr.getNode('ctrl.pp_data_sel').write( pp_data_sel )
    csr.getClient().dispatch()

    if pp_data_sel :

        # id to the pp offset
        pp_offset = 0

        for c in xrange(cpb):
            print '--',c

            csr.getNode('ctrl.pp_sel').write( c )
            csr.getClient().dispatch()

            # shift data by 18 frames, 3 bx
            ppram.upload( data_event.getlinkbuffer( c ), 18 )

            #  next generation
            #import mp7tools.valid
            #vb = mp7tools.valid.ValBlock(data_event.getlinkbuffer( c ))
            #ppram.upload64( list(vb.raw()), 18 )

    print 'Done'

    if path:
        bufcfg = BufferConfigurator( mp7test.buf, cap=cap_bx)
        bufcfg.configure('captureRxTx')

        mp7test.captureAndDump(path+'captureRxTx', depth=0x400)

    return

#-Execution--
if not hlp.run_from_ipython():
    go( opts.path, opts.reset, opts.cfgmgt, opts.loop, opts.data_uri)
    #go( opts.path, pp_data_sel, opts.quads, opts.reset, opts.cfgmgt, opts.loop )
else:
    # Increase the logging verbosity
    uhal.setLogLevelTo(uhal.LogLevel.WARNING)
    import mp7tools.valid
    vb = mp7tools.valid.ValBlock(data_event.getlinkbuffer(1))
    #ppram.upload64( list(vb.raw()), 10 )


