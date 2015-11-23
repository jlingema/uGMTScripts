#!/bin/python
import uhal
import sys

import argparse

uhal.setLogLevelTo(uhal.LogLevel.ERROR)

def mem_display(node, values):
    string = node+"  =  ["
    vals = values[node]
    if len(vals) > 16:
        for i in range(8):
            string += hex(vals[i]) + ", "
        string += " ..."
        n = len(vals)
        for i in range(n-8, n):
            string += ", "+hex(vals[i])
        string += "] (total size: {sz})".format(sz=len(vals))
    else:
        for val in vals:
            string += hex(val)+", "
        string += "]"
    print string

def reg_display(node, values):
    print node, " = ", hex(values[node])

def display_all(regNodes, memNodes, regValues, memValues):
    for regNode in regNodes:
        reg_display(regNode, regValues)
    for memNode in memNodes:
        mem_display(memNode, memValues)

def mem_read(board, node, values):
    size = board.getNode(node).getSize()
    values[node] = board.getNode(node).readBlock(size)

def reg_read(board, node, values):
    values[node] = board.getNode(node).read()

def read_all(board, regNodes, memNodes, regValues, memValues):
    for regNode in regNodes:
        reg_read(board, regNode, regValues)
    for memNode in memNodes:
        mem_read(board, memNode, memValues)

    try:
        board.dispatch()
    except:
        print "Failed to read!"
        return -1

    return 0

def add_nodes(board, node_name, regNodes, memNodes):
    mode = board.getNode("payload."+node_name).getMode()
    if mode == uhal.BlockReadWriteMode.SINGLE:
        regNodes.append("payload."+node_name)
    elif mode == uhal.BlockReadWriteMode.INCREMENTAL:
        memNodes.append("payload."+node_name)
    else:
        print "No implemented read function for mode", mode

def parseNumList(string):
    m = string.split('-')

    start = m[0]
    end = m[1] or start
    return list(range(int(start, 10), int(end, 10)+1))

def main():
    desc = ''
    parser = argparse.ArgumentParser(description=desc, formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('--quads', type=parseNumList, default="0-8", help='Range of muon quads to read from.')
    parser.add_argument('--dumpSpyBuffers', default='False', action='store_true', help='Whether to read out the spy buffers.')
    parser.add_argument('--connections_file', type=str, default='/nfshome0/ugmtdev/firmware/connections-ugmt.xml', help='URI to connections file.')
    parser.add_argument('board', type=str, help='Name of board to read from.')

    opts = parser.parse_args()

    cm = uhal.ConnectionManager("file://" + opts.connections_file)
    board = cm.getDevice(opts.board)
    board.getNode('ctrl.id').read()

    try:
        board.dispatch()
    except:
        # print something here when if times out
        print 'MP7 access failed (name:', board.id(), 'uri:', board.uri(), ')'
        sys.exit(-1)

    counter_template_string = "muon_input.mu_quad_{0}.muon_counter_"
    counter_list = []
    for i in opts.quads:
        counter_list.append(counter_template_string.format(i))

    payload_nodes = board.getNode('payload').getNodes()
    regNodes = []
    memNodes = []
    for node in counter_list:
        if not node in payload_nodes:
            for n_pl in payload_nodes:
                if node in n_pl:
                    add_nodes(board, n_pl, regNodes, memNodes)
        else:
            add_nodes(board, node, regNodes, memNodes)

    regValues = {}
    memValues = {}
    if read_all(board, regNodes, memNodes, regValues, memValues) == 0:
        display_all(regNodes, memNodes, regValues, memValues)

if __name__ == "__main__":
    main()
