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
    'loopPlayMGT'
    'loopPattMGT'
    'captureRx'
    'captureTx'
    'captureRxTx'

Sketch of buffer interconnections
        -----     ----
    -<-| MGT |-<-| Tx |---<---
        -----     ----       |
          |                  ^
          v              ----------
          |             |          |
      MGT |             |   Algo   | 
     loop |             |   Block  | 
          |             |          |
          v              ----------
          |                  ^
        -----     ----       |
    ->-| MGT |->-| Rx |--->---
        -----     ----

- Loopback mode B2B: Tx to Rx loop, direct connection from buffer to buffer
- Loopback mode MGT: Tx to Rx loop, connection through the MGTs
'''
from __future__ import print_function
import uhal
import mp7
import logging
import ansistrm
import sys


import mp7tools.helpers as hlp
from mp7tools.helpers import list_maker, intlist_maker
from mp7tools.buffers import Configurator2g, BoardDataSource

def parseArguments( argv=None ):

    import argparse

    modes=Configurator2g.modes()
    clksrcs = [
        'internal',
        'external',
    ]

    dftstr=' (default: \'%(default)s\')'

    parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('-c','--connections', default='file://etc/uhal/connections-test.xml', help='Uhal connection file'+dftstr)

    subparsers = parser.add_subparsers(dest = 'cmd')
    subp = subparsers.add_parser('show', help='Show the list of known devices')

    subp = subparsers.add_parser('exec', help='Execute')
    subp.add_argument('file',help='file containing commands to execute')
    
    subp = subparsers.add_parser('reset', help='Reset the board and set the clocking')
    subp.add_argument('board',help='board to connect to')
    subp.add_argument('-s','--clksrc', choices=clksrcs, default='external', help='clock source selection'+dftstr)
    
    subp = subparsers.add_parser('links', help='Manage links')
    subp.add_argument('board',help='board to connect to')
    subp.add_argument('--loopback',  dest='loopback', default=False, action='store_true', help='activate MGT loopback'+dftstr,  )
    subp.add_argument('--noconfig', dest='config',   default=True, action='store_false', help='configure links'+dftstr,        )
    subp.add_argument('--noalign',  dest='align',    default=True, action='store_false', help='run link alignment'+dftstr,     )
    subp.add_argument('--nocheck',  dest='check',    default=True, action='store_false', help='check links for errors'+dftstr, )

    subp = subparsers.add_parser('capture', help='run data capture')
    subp.add_argument('board',help='board to connect to')
    subp.add_argument('mode',choices=modes)
    subp.add_argument('--path', default='data', help='output path'+dftstr)
    subp.add_argument('--inject', dest='data_uri', default='generate:empty', help='source of data to be injected'+dftstr)

    subp = subparsers.add_parser('ttccapture', help='capture ttc commands')
    subp.add_argument('board',help='board to connect to')
    subp.add_argument('--maskbc0', default=False, action='store_true', help='skip BC0s'+dftstr )

    # print(argv, sys.argv)
    val = parser.parse_args(argv)

    # validation if needed

    return val

def execute( argv=None ):
    args = parseArguments(argv)
    # print(args)
    
    if args.cmd == 'exec':
        import shlex
        with open(args.file) as commands:
            for line in commands:
                cmd = line.strip()
                if cmd[0] == '#': continue

                logging.info('='*40)
                logging.info('Executing: %s',cmd)
                logging.info('='*40)
                
                execute(shlex.split(cmd))
                # execute(cmd.split())
        return
    elif args.cmd == 'show':

        logging.info( 'Available devices in %s:',args.connections)
        for d in cm.getDevices():
            logging.info(  '    - %s',d )
        return
    
    board = cm.getDevice( args.board )
    
    # run a simple access test
    hlp.testAccess(board)
    
    import mp7tools.tester
    
    # Create the MP7Tester objects. quads=Non autoDiscovers what quads are active
    mp7tester = mp7tools.tester.MP7Tester(board)
    
    if args.cmd == 'reset':
        extClk40 = (args.clksrc == 'external')
        mp7tester.reset(extClk40)
    
    elif args.cmd == 'links':
        if args.loopback:
            # Configure the MGTs in loop mode, for self alignment.
            # Use a pattern generated in the Tx buffers to align the Rx channels
            mp7tester.setupTx2RxPattern()
    
        if args.config:
            # Configure the GTHs in loopback mode
            mp7tester.configureLinks(args.align,args.loopback)
    
        if args.check:
            # Run some checks to make sure no errors were found
            try:
                mp7tester.checkLinks()
            except StandardError as e:
                logging.error(e)
    
    elif args.cmd == 'capture':
        from os.path import join
        # some default settings
        play_bx  = (0x0,0x1)
        cap_bx   = (0x0,0x10)
        depth    = 0x400
    
        logging.warn('playback=%s, capture=%s, depth=%s' % (play_bx, cap_bx, depth) )
        
        # Prepare the data to be loaded into the pp RAMs
        if args.data_uri is not None:
            src = BoardDataSource( args.data_uri, depth=depth )
            # 2 preprocessors
            data =  src.data
        else:
            data = None
    
        # Instantiate a buffer configurator.
        mp7Configurator = Configurator2g( args.mode, play=play_bx, cap=cap_bx )
        
        # Apply the selected configuration
        mp7Configurator.configure(mp7tester.ctrl, mp7tester.buf, **(mp7tester.getGenerics()))
        
        # Pre-fill the buffers according to the selected operation mode
        data_rx, data_tx = mp7Configurator.assignRxTx(data)
    
        print(data, data_rx, data_tx)
        
        mp7tester.captureAndDump( join(args.path,args.mode), depth, data_rx, data_tx )
    
    elif args.cmd == 'ttccapture':
    
        history =  mp7tester.ttc.captureBGOs( args.maskbc0 )
    
        for i,v in enumerate(history):
            # Decoded values
            valid = (v >> 31) & 1;
            isL1A = (v >> 24) & 1;
            orbit = (v >> 32) & 0xffffff;
            bx = (v >> 8) & 0xfff;
            cmd = (v & 0xff);
        
            print('%4d | V:%1d L1A:%1d orb:0x%06x bx:0x%03x cmd:%02x' % (i,valid, isL1A, orbit, bx, cmd))
    

# logging initialization
hlp.initLogging( logging.DEBUG )

# opts, args = parseOptions()
args = parseArguments()
# print args

# Ads
hlp.mp7Logo()

print('-'*40)
print('MP7 Data capture script')
print('-'*40)
print()

# Mask the errors when loading the address tables
uhal.setLogLevelTo(uhal.LogLevel.ERROR)
cm = uhal.ConnectionManager(args.connections)

execute()

