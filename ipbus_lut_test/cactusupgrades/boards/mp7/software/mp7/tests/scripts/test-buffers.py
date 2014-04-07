#!/bin/env python
'''
-----------------
MP7 buffer scheme
-----------------

    -----     ----       
-<-| MGT |-<-| Tx |---<---
    -----     ----       |
      |        |         ^
      v        v    -----------
      |        |    |         |
  MGT |    B2B |    |   Algo  |
      |        |    |         |
      v        v    -----------
      |        |         ^
    -----     ----       |
->-| MGT |->-| Rx |--->---
    -----     ----

- Loopback mode B2B: Tx to Rx loop, direct connection from buffer to buffer
- Loopback mode MGT: Tx to Rx loop, connection through the MGTs

'''

import time
import sys
import array
import os
import logging
import ansistrm

# MP7 import
import mp7

import mp7tools.helpers as hlp

from mp7tools.helpers import bin, hookDebugger, list_maker, intlist_maker
from mp7tools.tester import MP7Tester
from mp7tools.buffers import Configurator, BoardDataSource

#---
def parseOptions():
    import optparse

    usage = '''
%prog board_id [options]

Available capture modes:
            'disabled'
            'algoPlay'
            'algoPatt'
            'loopPlayB2B'
            'loopPlayMGT'
            'loopPattB2B'
            'loopPattMGT'
            'captureRx'
            'captureTx'
            'captureRxTx'
'''

    parser = optparse.OptionParser( usage )
    parser.add_option('-m', '--modes' , dest='modes'   , help='Buffer modes to test (%default)' , default=[]        , type='string', action='callback' , callback=list_maker('modes'))
    parser.add_option('-q', '--quads' , dest='quads'   , help='List of quads (%default)'        , default=[0]       , type='string', action='callback' , callback=intlist_maker('quads'))
    parser.add_option('-p', '--path'  , dest='path'    , help='Output path'                     , default=None      , type='string' )
    parser.add_option('-l', '--loop'  , dest='loop'    , help='MGTs loopback (%default)'        , default=2         , type='int' )
    parser.add_option('--mgt'         , dest='cfgmgt'  , help='Config the mgts'                 , default=False     , action='store_true' )
    parser.add_option('--reset'       , dest='reset'   , help='Apply master reset'              , default=False     , action='store_true' )
    parser.add_option('--load'        , dest='data_uri', help='Data to upload: <file>:<board#>' , default='pattern' , )

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
import uhal

# parse options
opts, args = parseOptions()

# logging initialization
hlp.initLogging( logging.DEBUG, opts.logfile )

# print logging
logging.debug('Opts: %s',opts)
logging.debug('Args: %s',args)

# Prepare the data to be loaded into the pp RAMs
if opts.data_uri is not None:
    src = BoardDataSource( opts.data_uri, depth=0x400 )
    # 2 preprocessors
    data_event,_ =  src.data, src.cpb


# Mask the errors when loading the address tables
uhal.setLogLevelTo(uhal.LogLevel.ERROR)
cm = uhal.ConnectionManager('file://etc/uhal/connections904.xml')
board = cm.getDevice( opts.board )

# Ads
hlp.mp7Logo()

# Id, to remind ourselves what we are dealing with
print 'This is:',board.id(),'['+board.uri()+']'

mp7tester = MP7Tester( board, opts.quads )

print 'Using tester class',mp7tester.__class__.__name__

csr     = mp7tester.csr
ttc     = mp7tester.ttc
xpoint  = mp7tester.xpoint
si5326  = mp7tester.si5326
gth     = mp7tester.gth
buf     = mp7tester.buf

#def go( path, ppmode, quads, reset, cfgmgt, loop ):
def go( path = 'data', modes=[], reset=True, cfgmgt = True, loop=2, quads=[0] ):

    # Increase the logging verbosity
    uhal.setLogLevelTo(uhal.LogLevel.WARNING)

    if reset:
        print 'Resetting'
        # Reset the board
        mp7tester.reset( True )

    if cfgmgt:
        print 'Configuring MGTs'
        # This is probably not working
        # if in loopback, feed something into the Rx buffers
        if loop == 2:
            mp7tester.setupPatternTx2Rx()

        # config GTHs, just in case
        mp7tester.configGTHs (loop)

    # settings
    play_bx  = (0x0,0xaa)
    cap_bx   = (0x0,0xaa)
    play_len = play_bx[1]-play_bx[0]+1

    # build up some pattern
    data = dict( (l,b) for l,b in data_event.iterlinks() )
    patt = dict( (l,range((l<<12),(l<<12)+0x400)) for l in xrange(72) )

    if 'all' in modes:
        modes.remove('all')

        modes.add('loopPattB2B')
        modes.add('loopPattMGT')
        modes.add('loopPlayB2B')
        modes.add('loopPlayMGT')
        modes.add('algoPatt')
        modes.add('algoPlay')

    bufcfg = Configurator( mp7tester.buf, cap=(0,0xaa) )

    for m in sorted(modes):
        print '--Testing',m
        # configure the buffers
        m_rx,m_tx = bufcfg.configure(m)

        if m_rx == mp7.MGTBufferNode.Mode.Playback :
            data_rx = data
        else:
            data_rx = None
            #data_rx = patt

        if m_tx == mp7.MGTBufferNode.Mode.Playback:
            data_tx = data
        else:
            data_tx = None
            #data_tx = patt

        mp7tester.captureAndDump(path+m, data_rx=data_rx, data_tx=data_tx, depth=0x400)

    return

#-Execution--
if not hlp.run_from_ipython():
    go( opts.path, opts.modes, opts.reset, opts.cfgmgt, opts.loop, opts.quads )
else:
    uhal.setLogLevelTo(uhal.LogLevel.NOTICE)



