#!/bin/env python
import uhal
import mp7tools.helpers as hlp
import logging


def parse_options():
    '''
    Parse the command line options
    '''
    import optparse
    usage = '''
%prog boardname [options]

'''
    defaults = {
        'connectionFile' : 'file://data/addrtab/mp7_payload.xml',
        'clk40'          : 'external',
    }

    parser = optparse.OptionParser( usage )
    parser.add_option('-c', '--connectionFile' , dest='connectionFile' , help='uhal connection file (%default)'      , default=defaults['connectionFile'] , type='string' )
    parser.add_option('--clk40'                , dest='clk40'          , help='Clock 40 source selection (%default)' , default=defaults['clk40']          , type='string' )
    parser.add_option('--sim'                  , dest='sim'            , help='Are you running on simulation or hardware (%default)' , default=False          , action='store_true' )


    opts, args = parser.parse_args()

    if len(args) == 1:
        opts.board = args[0]
    elif opts.showDevices:
        opts.board=None
    else:
        parser.error('Missing board name')

    if opts.clk40 not in ['external','internal']:
        parser.error('clk40 can be only "external" or "internal"')

    return opts,args


def get_lut_32bit_word(address):
    from random import randint
    # 0 <= ret <= (2^32-1)
    val = randint(0, 4294967295)
    if len(bin(val).replace("0b", "")) > 32: #dirty check for me
        print hex(val)
    return val

opts, args = parse_options()

#uhal.setLogLevelTo(uhal.LogLevel.ERROR)

cm = uhal.ConnectionManager(opts.connectionFile)
board = cm.getDevice( opts.board )
# run a simple access test
hlp.testAccess(board)


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

import mp7tools.tester_wluts as tester

# only necessary for sim!
if opts.sim:
    board.setTimeoutPeriod(5000)

mp7tester = tester.MP7TesterLUT(board, lutnames='auto')
lut_names = mp7tester.lutnames()

######## Define or get the lut data (temporary):
N_ADDRESS_BITS = 8
address_max = pow(2, N_ADDRESS_BITS)

lut_data = {}
for lut_name in lut_names:
    mp7tester.print_lut_debug(lut_name)
    lut_data[lut_name] = []
    for add in range(address_max):
        lut_data[lut_name].append(get_lut_32bit_word(add))


#### just read
for lut_name in lut_names:
    reg = mp7tester.read_lut(lut_name)
    try:
        board.dispatch()
    except:
        import sys
        print "Failed to read block data from",lut_name
        sys.exit(-1)

    print "Successfully read from", lut_name
    print " Values: ", [hex(x) for x in reg]


#### write and read
valheader = mp7tester.write_lut("lut1", lut_data["lut1"])
mem = mp7tester.read_lut("lut1")

try:
    board.dispatch()
except:
    import sys
    print "Failed to dispatch write and read"
    sys.exit(-1)

print "Successfully wrote and read back from lut1"
print " New values: ", [hex(x) for x in mem]


