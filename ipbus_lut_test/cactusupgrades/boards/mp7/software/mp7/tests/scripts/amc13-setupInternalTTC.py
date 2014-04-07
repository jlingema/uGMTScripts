#!/bin/env python

import uhal
import sys
import os.path
import time

twd = os.path.realpath(os.path.dirname(__file__)+'/../')

def parseOptions():
    '''
    Parse here the command line options
    '''
    import optparse
    usage = '''
%prog name [options]
'''
    parser = optparse.OptionParser( usage )
    parser.add_option('-N', '--serialNumber' , dest='serialNumber' , help='AMC13 serial number' , type='int' )

    opts, args = parser.parse_args()

    if not opts.serialNumber:
      raise RuntimeError('No AMC13 serial number provided')

    return opts,args

opts,args = parseOptions()

serial = opts.serialNumber
ipS6 = '192.168.1.%d' % (254-(serial*2))
ipV6 = '192.168.1.%d' % (255-(serial*2))

# Mask the errors when loading the address tables
uhal.setLogLevelTo(uhal.LogLevel.ERROR)


#s6 = uhal.getDevice("s6", "ipbusudp-2.0://192.168.1.242:50001", "file://etc/uhal/amc13/AMC13_AddressTable_S6.xml")
s6 = uhal.getDevice('s6', 'ipbusudp-2.0://'+ipS6+':50001', 'file://'+twd+'/etc/uhal/amc13/AMC13_AddressTable_S6.xml')
v6 = uhal.getDevice('v6', 'ipbusudp-2.0://'+ipV6+':50001', 'file://'+twd+'/etc/uhal/amc13/AMC13_AddressTable_V6.xml')

s6ok = v6ok = True

print 'Checking T1 Spartan connectivity'
c0 = s6.getNode('CONTROL0').read()
try:
  s6.dispatch()
  print 'Spartan CONTROL0',hex(c0)
except:
  s6ok=False
  print 'Access failed'

print 'Checking T2 Virtex connectivity'
c0 = v6.getNode('CONTROL0').read()
try:
  v6.dispatch()
  print 'Virtex CONTROL0',hex(c0)
except:
  v6ok=False
  print 'Access failed'

if not (s6ok and v6ok):
  print 'Failed to access the AMC13 at s6:%s, v6:%s. Please check the connectivity' % (ipS6,ipV6)
  sys.exit(-1)

print 'Both S6 and V6 are responsive'

print 'Reset T2 (spartan)'
s6.getNode('CONTROL0.RESET').write(0x1)
s6.dispatch()


print 'Reset T1 (virtex)'
# v6.getNode('CONTROL1.RUN_MODE').write(0x0)
# v6.getNode('CONTROL0.RESET').write(0x1)
# v6.getNode('CONTROL0.CTR_RESET').write(0x1)
v6.dispatch()


print 'Configuring AMC13 for internal BC0 generation'

amcEnables = ['CONTROL3.ENA_AMC00',
              'CONTROL3.ENA_AMC01',
              'CONTROL3.ENA_AMC02',
              'CONTROL3.ENA_AMC03',
              'CONTROL3.ENA_AMC04',
              'CONTROL3.ENA_AMC05',
              'CONTROL3.ENA_AMC06',
              'CONTROL3.ENA_AMC07',
              'CONTROL3.ENA_AMC08',
              'CONTROL3.ENA_AMC09',
              'CONTROL3.ENA_AMC10',
              'CONTROL3.ENA_AMC11']

for e in amcEnables:
    v6.getNode(e).write(0x1)
v6.dispatch()

v6.getNode('CONTROL1.INT_GEN_L1A').write(0x1)
v6.getNode('CONTROL1.TTS_OUT_TTC_OUT').write(0x1)
v6.getNode('CONTROL1.RUN_MODE').write(0x1)
v6.getNode('CONTROL0.RESET').write(0x1)

v6.dispatch()


