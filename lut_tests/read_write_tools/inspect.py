#!/usr/bin/python
import uhal
import sys
from time import sleep

import argparse

class Inspector(object):
    """docstring for Inspector"""
    def __init__(self, board):
        super(Inspector, self).__init__()
        self.board = board
        self.nodes = []
        self.read_dict = {}
        self.values = {}
        self.display_dict = {}
    
    def add(self, node_name):
        print "Adding node to be inspected: {name}".format(name=node_name)
        self.nodes.append("payload."+node_name)
        mode = board.getNode("payload."+node_name).getMode()
        if mode == uhal.BlockReadWriteMode.SINGLE:
            self.read_dict["payload."+node_name] = self.reg_read
            self.display_dict["payload."+node_name] = self.reg_display
        elif mode == uhal.BlockReadWriteMode.INCREMENTAL:
            self.read_dict["payload."+node_name] = self.block_read
            self.display_dict["payload."+node_name] = self.block_display
        else:
            print "No implemented read function for mode", mode

    def block_display(self, node):
        string = node+"  =  ["
        vals = self.values[node]
        if len(vals) > 16:
            for i in range(8): string += hex(vals[i]) + ", "
            string += " ..."
            n = len(vals)
            for i in range(n-8, n): string += ", "+hex(vals[i])
            string += "] (total size: {sz})".format(sz=len(vals))
        else:
            for val in vals:
                string += hex(val)+", "
            string += "]"
        print string

    def reg_display(self, node):
        print node, " = ", hex(self.values[node])

    def block_read(self, node):
        size = self.board.getNode(node).getSize()
        self.values[node] = self.board.getNode(node).readBlock(size)

    def reg_read(self, node):
        self.values[node] = self.board.getNode(node).read()

    def inspect_all(self):
        for node in self.nodes:
            self.read_dict[node](node)

        try:
            self.board.dispatch()
        except:
            print "Failed to read!"
            return -1

        return 0

    def display_all(self):
        for node in self.nodes:
            self.display_dict[node](node)

    def display_names(self):
        for node in self.nodes:
            print ' --', node

def parse_options():
    desc = "Inspection tool via ipbus"
        
    parser = argparse.ArgumentParser(description=desc, formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('nodes', type=str, nargs='+', help='nodes that will be inspected (skip the preceeding payload)')
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

print 'MP7 access successful:'
print ' name :', board.id()
print ' uri  :', board.uri()
print ' id   :', hex(v)

opts = parse_options()

sleep(0.5)

payload_nodes = board.getNode('payload').getNodes()
inspector = Inspector(board)
for node in opts.nodes:
    if not node in payload_nodes:
        for n_pl in payload_nodes:
            if node in n_pl:
                inspector.add(n_pl)
    else:
        inspector.add(node)

if not opts.dryrun:
    if inspector.inspect_all() == 0:
        inspector.display_all()
else:
    print 'Dry run, nothing to be done'

