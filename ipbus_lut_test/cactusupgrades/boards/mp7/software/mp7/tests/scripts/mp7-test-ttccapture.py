#!/bin/env python
'''
--------------
MP7 Test Suite
--------------
Title: mp7-test-buffers.py
Author: Alessandro Thea

Example: TTC history capture script

Brief: capture the TTC inputs over the past few seconds and displays the result
Description:
This script provides an example on how to setup the MGT buffers, upload and process data.
All the high level actions are encoded as methods in the mp7tools.tester.MP7Tester class. It uses an uhal::HwInterface object to access the board.
The connections parameters to the MP7 are stored in the connectionFile. The script takes the board name as first and only argument.

After resetting the board, the MGT TX buffers are set to generate an hard-coded pattern (mp7tester.setupTx2RxPattern).
The MGTs are configured in loopback mode, from Tx to Rx through the serialization-deserialization stage, and aligned.
Only the channels from the active quads are used for alignment
Afterwards the channels are tested for CRCs and alignment errors (mp7tester.checkGTHs).

'''

import uhal
import mp7
import logging
import ansistrm


import mp7tools.helpers as hlp
# from mp7tools.helpers import list_maker, intlist_maker

def parseOptions():
    '''
    Parse here the command line options
    '''
    import optparse
    usage = '''
%prog name [options]
'''
    defaults = {
    	'connectionFile' : 'file://etc/uhal/connections-test.xml',
        'mode'           : 'algoPlay',
        'inject'         : 'generate:pattern',
        'path'           : 'data',
    }

    parser = optparse.OptionParser( usage )
    parser.add_option('-c', '--connectionFile' , dest='connectionFile' , help='uhal connection file (%default)'      , default=defaults['connectionFile'] , type='string' )
    parser.add_option('--showDevices'          , dest='showDevices'    , help='Show the list of available devices'   , default=False                      , action='store_true' )
    parser.add_option('--clk40'                , dest='clk40'          , help='Clock 40 source selection (%default)' , default='external'                 , type='string' )
    parser.add_option('--reset'                , dest='reset'          , help='Apply master reset'                   , default=False                      , action='store_true' )
    parser.add_option('-p', '--path'           , dest='path'           , help='Output path'                          , default=defaults['path']           , type='string' )
    parser.add_option('--maskBC0'              , dest='maskBC0'        , help='Mask BC0 capture'                     , default=False                      , action='store_true')


    opts, args = parser.parse_args()

    if len(args) == 1:
        opts.board = args[0]
    elif opts.showDevices:
        opts.board=None
    else:
        parser.error('Missing board name')

    if opts.clk40 not in ['external','internal']:
        parser.error('clk40 can be only "external" or "internal"')

    hlp.validatePath( parser, opts )

    return opts,args

# logging initialization
hlp.initLogging( logging.DEBUG )

opts, args = parseOptions()

# Ads
hlp.mp7Logo()

print '-'*40
print 'MP7 TTC capture script'
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

history =  mp7tester.ttc.captureBGOs( opts.maskBC0 )

for i,v in enumerate(history):
    # Decoded values
    valid = (v >> 31) & 1;
    isL1A = (v >> 24) & 1;
    orbit = (v >> 32) & 0xffffff;
    bx = (v >> 8) & 0xfff;
    cmd = (v & 0xff);

    print '%4d | V:%1d L1A:%1d orb:0x%06x bx:0x%03x cmd:%02x' % (i,valid, isL1A, orbit, bx, cmd)






