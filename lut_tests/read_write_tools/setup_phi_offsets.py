#!/usr/bin/python
import uhal
import sys
from time import sleep

import argparse


def parse_options():
    desc = "Inspection and write tool for LUTs via ipbus"

    parser = argparse.ArgumentParser(description=desc, formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('board', type=str, help='board to connect to')
    parser.add_argument('mode', type=str, help='write / read')

    opts = parser.parse_args()

    return opts


def main():
    # this setup stuff should eventually go into the data base
    phi_node_dict = {}
    node_prefix = "payload.mu_deserialization."
    offsets = []
    node_names = []
    for j in range(2):  # for both endcap+ and overlap+ 60 degrees sectors
        for i in range(6):  # 6 channels each
            offsets.append(i*96 + 24)
    for i in range(12):  # for barrel 12*30 degree wedges
        offsets.append((i * 48 + 576 - 24) % 576)
    for j in range(2):  # for both endcap- and overlap- 60 degrees sectors
        for i in range(6):  # 6 channels each
            offsets.append(i*96 + 24)

    for quad in range(9):
        for channel in range(4):
            node_name = node_prefix + "mu_quad{q}.phi_offset_{ch}".format(q=quad, ch=channel)
            phi_node_dict[node_name] = offsets[quad*4+channel]
            node_names.append(node_name)


    opts = parse_options()

    uhal.setLogLevelTo(uhal.LogLevel.ERROR)
    cm = uhal.ConnectionManager("file://${MP7_TESTS}/etc/mp7/connections-test.xml")
    board = cm.getDevice(opts.board)
    board.getNode('ctrl.id').read()
    try:
        board.dispatch()
    except:
        # print something here when if times out
        print 'MP7 access failed (name:', board.id(), 'uri:', board.uri(), ')'
        sys.exit(-1)

    if opts.mode == "read":
        values = {}
        for node, value in phi_node_dict.iteritems():
            values[node] = board.getNode(node).read()
        try:
            board.dispatch()
        except:
            print 'read failed'
            sys.exit(-1)

        for node in node_names:
            print node, " = ", hex(values[node]), " ..  should be", hex(phi_node_dict[node])
        return
    if opts.mode == "write":
        for node, value in phi_node_dict.iteritems():
            board.getNode(node).write(value)
        try:
            board.dispatch()
        except:
            print 'write failed'
            sys.exit(-1)
        print "wrote values to phi offset registers."

if __name__ == "__main__":
    main()
