#!/bin/env python
'''
--------------
MP7 Test Suite
--------------
Title: mp7-load-tester.py 
Author: Alessandro Thea

Creates an mp7 board tester to be used in ipython
'''

import uhal
import mp7
import logging
import ansistrm

import mp7tools.helpers as hlp

def parseOptions():
    '''
    Parse here the command line options
    '''
    import optparse
    usage = '''
%prog [options]
'''
    defaults = {
    # 'connectionFile': 'file://etc/uhal/connections904.xml',
    'name'         : 'MP7_LAB_TEST',
    'uri'          : 'ipbusudp-2.0://192.168.0.128:50001',
    'addressTable' : 'file://etc/uhal/mp7_default/top.xml'
    }

    parser = optparse.OptionParser( usage )
    parser.add_option('-a', '--addressTable', dest='addressTable', help='MP7 address table path (%default)'    , default=defaults['addressTable'], type='string' )
    parser.add_option('-n', '--name'        , dest='name'        , help='MP7 id (%default)'                    , default=defaults['name'],      type='string' )
    parser.add_option('-u', '--uri'         , dest='uri'         , help='MP7 uri (%default)'                   , default=defaults['uri'],      type='string' )
    parser.add_option('--clk40'             , dest='clk40'       , help='Clock 40 source selection (%default)' , default='external',           type='string' )

    opts, args = parser.parse_args()

    if opts.clk40 not in ['external','internal']:
        parser.error('clk40 can be only "external" or "internal"')

    return opts,args

# logging initialization
hlp.initLogging( logging.DEBUG )

opts, args = parseOptions()

# Ads
hlp.mp7Logo()

print '-'*40
print 'MP7 MGT alignment script'
print '-'*40
print

# Mask the errors when loading the address tables
uhal.setLogLevelTo(uhal.LogLevel.ERROR)

board = uhal.getDevice( opts.name, opts.uri, opts.addressTable)

v = board.getNode('ctrl.id.magic').read()
try:
	board.dispatch()
except:
	import sys
	# print something here when if times out
	print 'MP7 access failed (name:',board.id(),'uri:',board.uri(),')'
	sys.exit(-1)
a = board.getNode('ctrl.id.fwrev.a').read()
b = board.getNode('ctrl.id.fwrev.b').read()
c = board.getNode('ctrl.id.fwrev.c').read()
design = board.getNode('ctrl.id.fwrev.design').read()


nquad = board.getNode('ctrl.id.generics.nquad').read()
clock_ratio = board.getNode('ctrl.id.generics.clock_ratio').read()
bunch_count = board.getNode('ctrl.id.generics.bunch_count').read()
board.dispatch()

print 'MP7 access successful:'
print ' name :',board.id()
print ' uri  :',board.uri()
print ' id   :',hex(v)

print '-fwrev-'
print '   a:',a
print '   b:',b
print '   c:',c

print '-generics-'
print '   nquad:',nquad
print '   clock_ratio:',clock_ratio
print '   bunch_count:',bunch_count

import mp7tools.tester

mp7tester = mp7tools.tester.MP7Tester(board)
