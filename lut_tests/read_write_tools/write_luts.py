#!/usr/bin/python
import uhal
import sys
from time import sleep

import argparse
import os

import random

def parse_options():
    desc = "Inspection and write tool for LUTs via ipbus"
        
    parser = argparse.ArgumentParser(description=desc, formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('node', type=str, help='node that will be written to (skip the preceeding payload)')
    parser.add_argument('--content', type=str,  default='generate:zero', help='file with content to write to the node')
    parser.add_argument('--dryrun', dest='dryrun', default=False,  action='store_true', help='dryrun, will only list matching nodes and contents')

    opts = parser.parse_args()
    
    return opts

def print_block(block, pre):
    string = pre+"  =  ["
    if len(block) > 16:
        for i in range(8): string += hex(block[i]) + ", "
        string += " ..."
        n = len(block)
        for i in range(n-8, n): string += ", "+hex(block[i])
        string += "] (total size: {sz})".format(sz=len(block))
    else:
        for val in block:
            string += hex(val)+", "
        string += "]"
    print string

def get_content(cntstring, size):
    protocol, name = cntstring.split('://')
    contents = []
    if protocol == 'file':
        with open(os.path.join('./', name), 'r') as fobj:
            for l in fobj:
                if l.startswith('#'): continue
                if len(contents) < size:
                    # FIXME: Once we have asymmetric LUTs we have to address this here!
                    contents.append(int(l.strip(), 16)) 
                else:
                    print 'WARNING: Found overflowing data values in file: ', name
                    print 'WARNING: Will skip following data values!'
                    break
    elif protocol == 'generate':
        if name == 'zero':
            contents = [0]*size
        elif name == 'random':
            random.seed()
            maxint = (1 << 32)-1
            for i in range(size):
                contents.append(random.randrange(0, maxint))
        else:
            print 'ERROR: Do not understand the generate string:', name, '(possible values: zero, random)'
            sys.exit(-1)   
    else:
        print 'ERROR: Do not understand the protocol:', protocol, '(possible values: file, generate)'
        sys.exit(-1)   

    return contents

uhal.setLogLevelTo(uhal.LogLevel.ERROR)

cm = uhal.ConnectionManager("file://${MP7_TESTS}/etc/mp7/connections-test.xml")
board = cm.getDevice( "ugmt_b14" )
v = board.getNode('ctrl.id').read()

try:
    board.dispatch()
except:
    # print something here when if times out
    print 'MP7 access failed (name:',board.id(),'uri:',board.uri(),')'
    sys.exit(-1)

opts = parse_options()

if not opts.dryrun:
    print 'MP7 access successful:'
    print ' name :', board.id()
    print ' uri  :', board.uri()
    print ' id   :', hex(v)
    print '-'*70
    sleep(0.5)

nodes = board.getNode('payload').getNodes()
matched_nodes = []
size = -1
for node in nodes:
    if opts.node in node:
        matched_nodes.append('payload.'+node)
        s = board.getNode('payload.'+node).getSize()
        if s != size and size > 0:
            print 'ERROR: Some nodes have different sizes...'
            sys.exit(-1)
        size = s

matched_nodes.sort()
print 'Found matches:'
for n in matched_nodes:
    print ' -- ', n

new_contents = get_content(opts.content, size)
print '\nWill write the following new_contents:'
print_block(new_contents, 'new_contents')

print '-'*70
if not opts.dryrun:
    print 'Starting actual write process.'
    for node in matched_nodes:
        board.getNode(node).writeBlock(new_contents)

    try:
        board.dispatch()
    except:
        print 'write failed'
        sys.exit(-1)
    print 'Done.'
    # print len(new_contents)/n_words, node.getSize()
else:
    print 'Only dry run. Nothing else to do.'
