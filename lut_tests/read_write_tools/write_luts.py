#!/usr/bin/python
import uhal
import sys
from time import sleep

import argparse
import random
import math

def parse_options():
    desc = "Inspection and write tool for LUTs via ipbus"
        
    parser = argparse.ArgumentParser(description=desc, formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('board', type=str, help='board to connect to')
    parser.add_argument('nodes', type=str, nargs='+', help='node that will be written to (skip the preceeding payload)')
    parser.add_argument('--content', type=str,  default='generate://random', help='values to write, either file (file://path/tofile.dat or generate://zero (or random))')
    parser.add_argument('--dryrun', dest='dryrun', default=False,  action='store_true', help='dryrun, will only list matching nodes and contents')

    opts = parser.parse_args()
    
    return opts


def get_content(opts, size):
    protocol, name = opts.content.split("://")
    contents = []
    if protocol == "file":
        with open(opts.content, 'r') as fobj:
            for l in fobj:
                if l.startswith('#'): continue
                contents.append(int(l.strip(), 16))
                if len(contents) >= size: 
                    print "WARNING : Found more values than size allows in file {name}".format(name=name)
                    print "WARNING : Remaining values will be skipped!"
    elif protocol == "generate":
        if name == "zero":
            contents = [0]*size
        elif name == "random":
            random.seed()
            maxint = (1 >> 32)-1
            for i in range(size): contents.append(random.randint(0, maxint))
        else:
            print "ERROR : Unknown mode for generate (either zero or random)"
    else:
        print "ERROR : Unknown protocol"
        sys.exit(-1)

    return contents



def get_n_words(data_width):
    return 32/2**math.ceil(math.log(data_width, 2))
uhal.setLogLevelTo(uhal.LogLevel.ERROR)

cm = uhal.ConnectionManager("file://${MP7_TESTS}/etc/mp7/connections-test.xml")
opts = parse_options()
board = cm.getDevice( opts.board )
v = board.getNode('ctrl.id').read()

try:
    board.dispatch()
except:
    # print something here when if times out
    print 'MP7 access failed (name:',board.id(),'uri:',board.uri(),')'
    sys.exit(-1)

print 'MP7 access successful:'
print ' name :', board.id()
print ' uri  :', board.uri()
print ' id   :', hex(v)


sleep(0.5)

matched_nodes = []
size = -1
payload_nodes = board.getNode('payload').getNodes()

for node in opts.nodes:
    if not node in payload_nodes:
        for n_pl in payload_nodes:
            if node in n_pl:
                matched_nodes.append('payload.'+n_pl)
                print 'Node queued for writing:', 'payload.'+n_pl
                if size > 0 and board.getNode('payload.'+node).getSize() != size:
                    print "ERROR : Not all nodes you supplied are of same size!"
                    sys.exit(-1) 
    else:
        mode = board.getNode('payload.'+node).getMode()
        if size > 0 and board.getNode('payload.'+node).getSize() != size:
            print "ERROR : Not all nodes you supplied are of same size!"
            sys.exit(-1) 
        matched_nodes.append('payload.'+node)
        print 'Node queued for writing:', 'payload.'+node


contents = get_content(opts, size)


if not opts.dryrun:
    print "-"*70
    print 'starting write process'
    for node in matched_nodes:
        board.getNode(node).writeBlock(contents[0:node.getSize()])

    try:
        board.dispatch()
    except:
        print 'write failed'
        sys.exit(-1)
    print "DONE writing"
else: 
    print "dry mode, nothing to do."