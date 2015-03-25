#!/usr/bin/python
import uhal
import sys
from time import sleep

import argparse

def parse_options():
    desc = "Inspection and write tool for LUTs via ipbus"
        
    parser = argparse.ArgumentParser(description=desc, formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('nodes', type=str, nargs='+', help='node that will be written to (skip the preceeding payload)')
    parser.add_argument('--content', type=int,  default=0, help='value to write')
    parser.add_argument('--dryrun', dest='dryrun', default=False,  action='store_true', help='dryrun, will only list matching nodes and contents')

    opts = parser.parse_args()
    
    return opts




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

payload_nodes = board.getNode('payload').getNodes()
matched_nodes = []
size = -1

for node in opts.nodes:
    if not node in payload_nodes:
        for n_pl in payload_nodes:
            if node in n_pl:
                mode = board.getNode('payload.'+node).getMode()
                if mode != uhal.BlockReadWriteMode.SINGLE:
                    print "WARNING: One supplied node is not a register, it will be skipped."
                    continue
                matched_nodes.append('payload.'+n_pl)
    else:
        mode = board.getNode('payload.'+node).getMode()
        if mode != uhal.BlockReadWriteMode.SINGLE:
            print "WARNING: One supplied node is not a register, it will be skipped."
            continue
        matched_nodes.append('payload.'+node)


matched_nodes.sort()
print 'Found matches:'
for n in matched_nodes:
    print ' -- ', n

print '-'*70
if not opts.dryrun:
    print 'Starting actual write process.'
    for node in matched_nodes:
        board.getNode(node).write(opts.content)

    try:
        board.dispatch()
    except:
        print 'write failed'
        sys.exit(-1)
    print 'Done.'
    # print len(new_contents)/n_words, node.getSize()
else:
    print 'Only dry run. Nothing else to do.'
