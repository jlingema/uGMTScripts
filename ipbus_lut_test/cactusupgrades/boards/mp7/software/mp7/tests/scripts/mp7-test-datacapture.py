#!/bin/env python
'''
--------------
MP7 Test Suite
--------------
Title: mp7-test-buffers.py
Author: Alessandro Thea

Example: Buffer capture script

Brief: Buffer capture and data transmission example
Description:
This script provides an example to work with MGT buffers: upload and capture data.
As in the previous example the high level actions are from mp7tools.tester.MP7Tester.

Valid buffer modes:
    'disabled': self-explanatory
    'algoPlay':
    'algoPatt'
    'loopPlayB2B'
    'loopPlayMGT'
    'loopPattB2B'
    'loopPattMGT'
    'captureRx'
    'captureTx'
    'captureRxTx'

Sketch of buffer interconnections
        -----     ----
    -<-| MGT |-<-| Tx |---<---
        -----     ----       |
          |        |         ^
          v        v     ----------
          |        |    |          |
      MGT |    B2B |    |   Algo   |    Algo
     loop |   loop |    |          |    Block
          |        |    |          |
          v        v     ----------
          |        |         ^
        -----     ----       |
    ->-| MGT |->-| Rx |--->---
        -----     ----

- Loopback mode B2B: Tx to Rx loop, direct connection from buffer to buffer
- Loopback mode MGT: Tx to Rx loop, connection through the MGTs
'''

import uhal
import mp7
import logging
import ansistrm


import mp7tools.helpers as hlp
from mp7tools.helpers import list_maker, intlist_maker
from mp7tools.buffers import Configurator, BoardDataSource

def parseOptions():
    '''
    Parse here the command line options
    '''
    import optparse
    usage = '''
%prog name [options] -m mode

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
    defaults = {
    	'connectionFile' : 'file://etc/uhal/connections-test.xml',
        'mode'           : 'algoPlay',
        'inject'         : 'generate:pattern',
        'path'           : 'data',
        'clk40'          : 'external',
    }

    parser = optparse.OptionParser( usage )
    parser.add_option('-c', '--connectionFile' , dest='connectionFile' , help='uhal connection file (%default)'      , default=defaults['connectionFile'] , type='string' )
    parser.add_option('--showDevices'          , dest='showDevices'    , help='Show the list of available devices'   , default=False                      , action='store_true' )
    parser.add_option('--clk40'                , dest='clk40'          , help='Clock 40 source selection (%default)' , default=defaults['clk40']          , type='string' )
    parser.add_option('--align'                , dest='align'          , help='Config and aling MGTs'                , default=False                      , action='store_true' )
    parser.add_option('--reset'                , dest='reset'          , help='Apply master reset'                   , default=False                      , action='store_true' )
    parser.add_option('--inject'               , dest='data_uri'       , help='Data to upload: <file>:<board#>'      , default=defaults['inject']         )
    parser.add_option('-l', '--loopback'       , dest='loopback'       , help='Config MGTs in loopback (%default)'   , default=False                      , action='store_true' )
    parser.add_option('-m', '--mode'           , dest='mode'           , help='Buffer test mode (%default)'          , default=defaults['mode']           , type='string' )
    parser.add_option('-p', '--path'           , dest='path'           , help='Output path'                          , default=defaults['path']           , type='string' )


    opts, args = parser.parse_args()

    if len(args) == 1:
        opts.board = args[0]
    elif opts.showDevices:
        opts.board=None
    else:
        parser.error('Missing board name')

    if opts.clk40 not in ['external','internal']:
        parser.error('clk40 can be only "external" or "internal"')

    if opts.mode not in Configurator.configs():
        parser.error('Buffer mode \'%s\' unknown' % opts.mode)

    hlp.validateDataUri( parser, opts)
    hlp.validatePath( parser, opts )

    return opts,args

# logging initialization
hlp.initLogging( logging.DEBUG )

opts, args = parseOptions()

# Ads
hlp.mp7Logo()

print '-'*40
print 'MP7 Data capture script'
print '-'*40
print

# Mask the errors when loading the address tables
uhal.setLogLevelTo(uhal.LogLevel.ERROR)
cm = uhal.ConnectionManager(opts.connectionFile)

if opts.showDevices:
    import sys
    logging.info( 'Available devices in %s:',opts.connectionFile)
    for d in cm.getDevices():
        logging.info(  '    - %s',d )
    sys.exit(0)

board = cm.getDevice( opts.board )

# run a simple access test
hlp.testAccess(board)

import mp7tools.tester

# Create the MP7Tester objects. quads=Non autoDiscovers what quads are active
mp7tester = mp7tools.tester.MP7Tester(board)

if opts.reset:
    # reset and configure clocking
    extClk40 = (opts.clk40 == 'external')
    mp7tester.reset(extClk40)

if opts.align:
    if opts.loopback:
        # Configure the MGTs in loop mode, for self alignment.
        # Use a pattern generated in the Tx buffers to align the Rx channels
        mp7tester.setupTx2RxPattern()

    # Configure the GTHs in loopback mode
    mp7tester.configureGTHs(loop=opts.loopback)

    # Run some checks to make sure no errors were found
    mp7tester.checkGTHs()

# some default settings
play_bx  = (0x0,0xaa)
cap_bx   = (0x0,0xaa)
play_len = play_bx[1]-play_bx[0]+1
depth    = 0x400

# Prepare the data to be loaded into the pp RAMs
if opts.data_uri is not None:
    src = BoardDataSource( opts.data_uri, depth=0x400 )
    # 2 preprocessors
    data =  src.data
else:
    data = None

# Instantiate a buffer configurator.
bufConfigurator = Configurator( mp7tester.buf, cap=cap_bx )

# Apply the selected configuration
mode_rx,mode_tx = bufConfigurator.configure(opts.mode)

# Pre-fill the buffers according to the selected operation mode
if mode_rx == mp7.MGTBufferNode.Mode.Playback :
    data_rx = data
else:
    data_rx = None

if mode_tx == mp7.MGTBufferNode.Mode.Playback:
    data_tx = data
else:
    data_tx = None

mp7tester.captureAndDump(opts.path+opts.mode, data_rx=data_rx, data_tx=data_tx, depth=depth)







