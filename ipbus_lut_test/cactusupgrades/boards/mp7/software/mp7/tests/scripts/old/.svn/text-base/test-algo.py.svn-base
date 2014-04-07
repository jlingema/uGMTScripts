#!/bin/env python

import time
import sys
import array
import os
import mp7

from mp7tools.helpers import bin, hookDebugger, run_from_ipython, list_maker, intlist_maker
from mp7tools.tester import MP7Tester, MP7TesterLegacy
from mp7tools.configurator import BufferConfigurator
from mp7tools.dataio import BoardData, read

#---
def parseOptions():
    import optparse

    usage = '%prog board_id [options]'

    parser = optparse.OptionParser( usage )
    parser.add_option('-q', '--quads' , dest='quads'  , help='list of quads (%default)'       , default=[0]       , type='string', action='callback' , callback=intlist_maker('quads'))
    parser.add_option('-p', '--path'  , dest='path'   , help='output path'                    , default='data'    , type='string' )
    parser.add_option('-l', '--loop'  , dest='loop'   , help='MGTs loopback (%default)'       , default=2         , type='int' )
    parser.add_option('--mgt'         , dest='cfgmgt' , help='cfg the mgts'                   , default=False     , action='store_true' )
    parser.add_option('--reset'       , dest='reset'  , help='master reset'                   , default=False     , action='store_true' )

    opts, args = parser.parse_args()

    if opts.loop not in [0,2]:
        parser.error('Loopmode can be 0 or 2')

    if len(args) != 1:
        parser.error('Missing board id')

    opts.board = args[0]

    return opts,args

#---
import uhal
import mp7

opts, args = parseOptions()

print opts, args

quads = opts.quads
loop  = opts.loop

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

mp7test = MP7Tester( board )

print 'Using tester class',mp7test.__class__.__name__

csr     = mp7test.csr
ttc     = mp7test.ttc
xpoint  = mp7test.xpoint
si5326  = mp7test.si5326
gth     = mp7test.gth
buf     = mp7test.buf

def go( path = 'data', reset=True, cfgmgt = True ):

    # sanitaise the inputs
    if path[-1] != '/': path += '/'

    # Increase the logging verbosity
    uhal.setLogLevelTo(uhal.LogLevel.NOTICE)

    if reset:
        # Reset the board
        mp7test.reset()

    if cfgmgt:
        # This is probably not working
        # if in loopback, feed something into the Rx buffers
        if loop == 2:
            mp7test.patternTx2Rx()

        # config GTHs, just in case
        mp7test.configGTH(loop, quads)

    # settings
    chans = [ 0, 1, 2, 3 ]

    # read the board file
    data_list = read('BoardBuffers.txt')

    # convert link id to quad/chan format
    data = {}
    for quad in quads:
        data[quad]={}
        for chan in chans:
            data[quad][chan] = data_list[0].getbuffer(quad*4+chan)[0:0x100]

    # create the buffer object
    bufcfg = BufferConfigurator( mp7test.buf )
    # configure for playback through the algo block (Rx->algo->Tx)
    # check the bx range for capture here
    bufcfg.configure('algoPlay')
    # capture
    mp7test.captureAndDump(path, quads, chans, data_rx = data )

    return

#-Execution--
if not run_from_ipython():
    go( opts.path, opts.reset, opts.cfgmgt )



