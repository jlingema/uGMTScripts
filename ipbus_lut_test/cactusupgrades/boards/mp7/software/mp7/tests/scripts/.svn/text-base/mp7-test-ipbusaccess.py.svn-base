#!/bin/env python
'''
--------------
MP7 Test Suite
--------------
Title: mp7-test-ipbusaccess.py 
Author: Alessandro Thea

Example script to connect to MP7 boards and access a register.
The connection parameters can be set from commandline.
'''

import uhal
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
    'name'         : 'MP7_LAB_TEST',
    'uri'          : 'ipbusudp-2.0://192.168.0.128:50001',
    'addressTable' : 'file://etc/uhal/mp7_default/top.xml'
    }

    parser = optparse.OptionParser( usage )
    parser.add_option('-a', '--addressTable', dest='addressTable', help='MP7 address table path (%default)'    , default=defaults['addressTable'], type='string' )
    parser.add_option('-n', '--name'        , dest='name'        , help='MP7 id (%default)'                    , default=defaults['name'],      type='string' )
    parser.add_option('-u', '--uri'         , dest='uri'         , help='MP7 uri (%default)'                   , default=defaults['uri'],      type='string' )

    opts, args = parser.parse_args()

    return opts,args

# logging initialization
hlp.initLogging( logging.DEBUG )

opts, args = parseOptions()

# Ads
hlp.mp7Logo()
print '-'*40
print 'IPbus connectivity test'
print '-'*40
print 

# Mask the errors when loading the address tables
uhal.setLogLevelTo(uhal.LogLevel.ERROR)
board = uhal.getDevice( opts.name, opts.uri, opts.addressTable)

v = board.getNode('ctrl.id').read()
try:
	board.dispatch()
except:
	import sys
	# print something here when if times out
	print 'MP7 access failed (name:',board.id(),'uri:',board.uri(),')'
	sys.exit(-1)

print 'MP7 access successful:'
print ' name :',board.id()
print ' uri  :',board.uri()
print ' id   :',hex(v)