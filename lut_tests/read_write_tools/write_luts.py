#!/usr/bin/python
import uhal
import sys
from time import sleep

import argparse

import math

def parse_options():
    desc = "Inspection and write tool for LUTs via ipbus"
        
    parser = argparse.ArgumentParser(description=desc, formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('board', type=str, help='board to connect to')
    parser.add_argument('node', type=str, help='node that will be written to (skip the preceeding payload)')
    parser.add_argument('content', type=str,  help='file with content to write to the node')
    parser.add_argument('width', type=int, help='data width in bits')

    opts = parser.parse_args()
    
    return opts


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

node = None
try:
    node = board.getNode('payload.'+opts.node)
except: 
    print "Cannot find node!"
    sys.exit(-1)

contents = []
with open(opts.content, 'r') as fobj:
    for l in fobj:
        if l.startswith('#'): continue
        contents.append(int(l.strip(), 16))

n_words = get_n_words(opts.width)
contents_tmp = [0]*node.getSize()
# WORKAROUND until asymmetric fixed in FW
node.writeBlock(contents[0:node.getSize()])

try:
    board.dispatch()
except:
    print 'write failed'
    sys.exit(-1)

# print len(contents)/n_words, node.getSize()

