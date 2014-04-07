#!/bin/env python
'''
--------------
MP7 Test Suite
--------------
Title: mp7-test-reset .py
Author: Alessandro Thea


Brief: Example script to reset MP7 boards.

Description: 
The board is reset and reconfigured on external/internal clock source.
The source selection is a commandline options.
In this example the connection parameters can be set from commandline.

If the external clock source is selected, the script automatically enables external TTC inputs and check for incoming BC0s.
Otherwise, in internal mode, external TTC inputs are disabled and BC0s are generated internally.

The scripts reproduces the behavior of the mp7tools.tester.MP7Tester.reset() method, which is used by the other scripts in the test suite.
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
    'name'         : 'MP7_LAB_TEST',
    'uri'          : 'ipbusudp-2.0://192.168.0.128:50001',
    'addressTable' : 'file://etc/uhal/mp7_default/top.xml'
    }

    parser = optparse.OptionParser( usage )
    parser.add_option('-a', '--addressTable', dest='addressTable', help='MP7 address table path (%default)'    , default=defaults['addressTable'], type='string' )
    parser.add_option('-n', '--name'        , dest='name'     , help='MP7 id (%default)'                       , default=defaults['name'],      type='string' )
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
print 'MP7 Reset and Clock configuration script'
print '-'*40
print

# Mask the errors when loading the address tables
uhal.setLogLevelTo(uhal.LogLevel.ERROR)

board = uhal.getDevice( opts.name, opts.uri, opts.addressTable)

# run a simple access test
hlp.testAccess(board)

import time

# Instantiate the specialised nodes
csr     = mp7.CSRNode        ( board.getNode("ctrl.csr") )
ttc     = mp7.TTCNode        ( board.getNode("ttc") )
xpoint  = mp7.XpointNode     ( board.getNode("ctrl.xpoint") )
si5326  = mp7.SI5326Node     ( board.getNode("ctrl.i2c_clk") )

# Meaningful configurations
# - internal clock can be only 250
# - SI5326 configuration is needed for 160/240 only

clk40External = (opts.clk40 == 'external')
# let's make life easier
ttcEnable     = clk40External
bc0Internal   = not clk40External

logging.warn('Resetting board %s',board.id())

csr.nuke()

logging.info('Reset done')

logging.info('Configuring clock 40 %s', ('internal','external')[clk40External])
# leave clk40 in reset until the xpoint is set
csr.getNode('ctrl.clk40_rst').write(0x1)
csr.getNode('ctrl.clk40_sel').write(clk40External)
csr.getClient().dispatch();

#-- xpoint configuration is pure routing
logging.info('Configuring Xpoint')

# configure ExternalAMC13 clock40 and
Clk40Src = mp7.XpointNode.Clk40Src
RefClkSrc = mp7.XpointNode.RefClkSrc

if not clk40External:
    xpoint.configure(Clk40Src.IntSrc, RefClkSrc.Oscillator)
else:
    xpoint.configure(Clk40Src.ExtAMC13, RefClkSrc.ClockCleaner)

    #---
    logging.info('Configuring SI5326')
    sicfg = 'etc/config/mp7/si5326/MP7_SI5326_20130606_40.1MHz_CKIN1_to_160.4MHz_CKOUT1_NoIncDec_Regs.txt'
    logging.info('   Using %s', sicfg)

    # reset the chip
    xpoint.si5326Reset()

    # sleep
    time.sleep(1)

    # and then reconfigure
    si5326.configure(sicfg)

    time.sleep(0.5)

    # Wait the si5326 to recover
    xpoint.si5326WaitConfigured()

    si5326.debug()

# then release the clk40 reset now, as the clock route should be cleared
csr.getNode('ctrl.clk40_rst').write(0x0)
csr.getClient().dispatch()
csr.waitClk40Lock()

#---
logging.info('Measuring clk40 frequency. Give me a second...')
# check the clock 40 frequency first
logging.info('   Clock 40 frequency: %08f Mhz',ttc.freqClk40(1.))

logging.info('Configuring ttc')
# enable ttc L1As and Bgos commands
ttc.getNode('csr.ctrl.ttc_enable').write(ttcEnable)
ttc.getClient().dispatch()

# clear counters
ttc.clear()

ttc.getNode('csr.ctrl.int_bc0_enable').write(bc0Internal)
ttc.getClient().dispatch()

# wait for the BC0 lock only for external input
if ttcEnable: ttc.waitBC0Lock() 

logging.info('Resetting algos')
# reset the algos
ttc.getNode('csr.ctrl.algo_rst').write(1)
ttc.getClient().dispatch()
# some additional checks
csrdump =  csr.snapshot()
ttcdump =  ttc.snapshot()
f = ttc.freqClk40()
logging.info('  Measured f40 : %08f Mhz' , f)
logging.info('  BC0 reg      : %04x'     , ttcdump['csr.stat0'] >> 16)
logging.info('  BC0 Internal : %d '      , ttcdump['csr.ctrl.int_bc0_enable'] )
logging.info('  BC0 Lock     : %d '      , ttcdump['csr.stat0.bc0_lock'] )
logging.info('  BC0 Error    : %d '      , ttcdump['csr.stat0.bc0_err'] )

v  = csrdump['stat']
s0 = ttcdump['csr.stat0']
s1 = ttcdump['csr.stat1']
s2 = ttcdump['csr.stat2']
s3 = ttcdump['csr.stat3']
logging.info('  Status: %08x BC0 stat: %0x4, Bunch %x Evt: %x, Orb %x', int(v),(int(s0) >> 16), (int(s0) & 0xfff), (int(s1) & 0xffffff), (int(s2) & 0xffffff) )

