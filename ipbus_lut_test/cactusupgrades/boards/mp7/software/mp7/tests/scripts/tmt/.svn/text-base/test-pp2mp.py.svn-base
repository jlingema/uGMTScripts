#!/bin/env python

import time
import sys
import array
import os
import logging
import random

import ansistrm

# MP7 imports
import uhal
import mp7

import mp7tools.helpers as hlp

from mp7tools.helpers import bin, hookDebugger, list_maker, intlist_maker
from mp7tools.tester import MPTester, PPTester, LinkErrorException
from mp7tools.buffers import Configurator, BoardDataSource

import mp7tools.dataio as dataio

#---
def parseOptions():
    import optparse

    parser = optparse.OptionParser()
    parser.add_option('-p', '--path'    , dest='path'    , help='output path'         , default='tmp' , type='string' )
    parser.add_option('-v', '--verbose' , dest='verbose' , help='Verbosity'           , default=False  , action='store_true')
    parser.add_option('--mgt'           , dest='cfgmgt'  , help='don\'t cfg the mgts' , default=False  , action='store_true' )
    parser.add_option('--reset'         , dest='reset'   , help='no master reset'     , default=False  , action='store_true' )
    parser.add_option('--load'          , dest='data_uri', help='data to upload: <file>:<board#>' , default=None  , )


    opts, args = parser.parse_args()

    hlp.validateDataUri( parser, opts )
    hlp.validatePath( parser, opts )

    return opts,args


# parse options
opts, args = parseOptions()

# logging initialization
hlp.initLogging( logging.DEBUG, opts.logfile )

# print logging
logging.debug('Opts: %s',opts)
logging.debug('Args: %s',args)

print '  __  __ ____ _____ ____  ____  ____   ____    __  __ ____   '
print ' |  \/  |  _ \___  / / / |  _ \|  _ \  \ \ \  |  \/  |  _ \  '
print ' | |\/| | |_) | / / / /  | |_) | |_) |  \ \ \ | |\/| | |_) | '
print ' | |  | |  __/ / / / /   |  __/|  __/   / / / | |  | |  __/  '
print ' |_|  |_|_|   /_/_/_/    |_|   |_|     /_/_/  |_|  |_|_|     '
print '                                                             '

# temporary expansion
path   = opts.path
reset  = opts.reset
cfgmgt = opts.cfgmgt

# Mask the errors when loading the address tables
uhal.setLogLevelTo(uhal.LogLevel.ERROR)
cm = uhal.ConnectionManager('file://etc/uhal/connections904.xml')

mpIds = ['MP7_690_MP']
ppIds = ['MP7_690_TX_PP', 'MP7_690_RX_PP']

#---
nbx = 0xaa
#---
ppquads = range(0,9)
pps = [ PPTester(cm.getDevice(ppId), ppquads) for ppId in ppIds  ]
#---
mpquads = range(0,18)
mps = [ MPTester(cm.getDevice(mpId), mpquads) for mpId in mpIds  ]

print '<<< MPs >>>'
for i,mp in enumerate(mps):
    # Id, to remind ourselves what we are dealing with
    print 'This is MP[%d]: %s [%s]' % (i,mp.id(),mp.board.uri())

print '<<< PPs >>>'
for i,pp in enumerate(pps):
    # Id, to remind ourselves what we are dealing with
    print 'This is PP[%d]: %s [%s]' % (i,pp.id(),pp.board.uri())

# Prepare the data to be loaded into the pp RAMs
if opts.data_uri is not None:
    # reminder, the rams' depth is 5*1024=0xa00
    src = BoardDataSource( opts.data_uri, 2, depth=0xa00)
    # 2 preprocessors
    data_event, cpb =  src.data, src.cpb


# Increase the logging verbosity
uhal.setLogLevelTo(uhal.LogLevel.WARNING)

def go():
    # using data_src, cpb, pps, mps

    print
    print '>>> Setting up the PPs'
    pploop  = 2
    pp_data_sel = ( opts.data_uri is not None )

    for ipp,pp in enumerate(pps):
        print
        print '<<< Configuring',pp.id(),'quads:',pp.quads,'>>>'
        print

        if reset:
            # Reset the board
            pp.reset()

        if cfgmgt:
            # config GTHs, just in case
            pp.configGTH(pploop)

        print 'Configuring the PP rams'
        pp.csr.getNode('ctrl.pp_data_sel').write( pp_data_sel )
        pp.csr.getClient().dispatch()

        # data loading files in here, if required
        if pp_data_sel:

            for c in xrange(cpb):

                pp.csr.getNode('ctrl.pp_sel').write( c )
                pp.csr.getClient().dispatch()
                #print '. loading channel',ipp*cpb+i,'to board',ipp,'chan',i

                # additional offset of 18 frames to let the pp logic to kick
                # off
                pp.ppram.upload( data_event.getlinkbuffer(ipp*cpb+c), 18 )

        # configure the buffers
        bufcfg = Configurator( pp.buf, cap=(0,nbx) )
        bufcfg.configure('captureRxTx')

        if path:
            # read the whole pp buffers (1024)
            pp.captureAndDump(path+'pp/'+pp.id(), depth=0x400 )

    print '>>> PP configuration completed'
    print
    print '>>> Setting up the MPs'
    # Parameters
    mploop = 0

    for mp in mps:
        print '<<< Configuring',mp.id(),'quads:',mp.quads,'>>>'

        if reset:
            # Reset the board
            mp.reset()

        if cfgmgt:
            # if in loopback, feed something into the Rx buffers
            if mploop == 2:
                mp.patternTx2Rx()

            # config GTHs, just in case
            mp.configGTH( mploop )

        # configure the buffers for capture
        bufcfg = Configurator( mp.buf, cap=(0,nbx) )
        bufcfg.configure('captureRxTx')

        if path: # capture from time to time?
            mp.captureAndDump(path+'mp/'+mp.id(), depth=0x400  )

def monitor():
    print '[[ PreProcessors ]]'
    for pp in pps:
        print '- Board:',pp.id()
        pp.checkGTHs()

    print
    print '[[ MasterProcessors ]]'
    for mp in mps:
        print '- Board:',mp.id()
        mp.checkGTHs()

def loop( times, wait ):
    print
    timeFmt = '%a, %d %b %Y %H:%M:%S'
    print '===> Start Time ('+time.strftime( timeFmt, time.localtime())+') ==='

    try:
        for i in xrange(times):
            print '-'*80
            print '| --'+str(i)+'--('+time.strftime( timeFmt, time.localtime())+')---'
            print '-'*80
            monitor()
            if i == (times-1): break
            # flush it!
            if tee: tee.flush()
            time.sleep(wait)
    except KeyboardInterrupt:
        print 'Ctrl-C detected. Loop stopped'
    except LinkErrorException,e:
        print e

    print '===> End Time ('+time.strftime( timeFmt, time.localtime())+') ==='

if not hlp.run_from_ipython():
    go()
    #loop(960,30)
    #monitor()
    pass
