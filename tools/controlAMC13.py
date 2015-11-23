#!/bin/python

import os
import sys
mp7path=os.environ.get('MP7_TESTS')
if mp7path == None:
    print "ERROR: Set the mp7sw environment before continuing."
    exit()
sys.path.append(mp7path+'/python/daq')
import re
import dtm
import uhal
import readline
import argparse
import logging
from mp7.tools.log_config import initLogging
initLogging( logging.DEBUG)

desc = ''
parser = argparse.ArgumentParser(description=desc, formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--fedID', type=int, default=1402, help='Enter your FED ID.')
# TODO: Allow multiple slots to be activated.
parser.add_argument('--slot', type=int, default=9, help='Slot to activate in crate')
parser.add_argument('--BCNoffset', type=int, default=(0xdec-23), help='Bunch crossing to expect BC0 in.')
parser.add_argument('--enableSlink', default='False', action='store_true', help='Flag to enable the Slink to DAQ.')
parser.add_argument('--connections_file', type=str, default='/nfshome0/ugmtdev/firmware/connections-ugmt.xml', help='URI to connections file.')

opts = parser.parse_args()

def status(amc13, state):
    print "Current state according to script: " + state
    amc13.status()

def reset(amc13):
    amc13.reset()
    return "Halted"

def configureTTC(amc13, state):
    if state == "Halted":
        amc13.configureTTC()
        return "Halted"
    else:
        print "Error: Board not halted. Reset it first."

def configure(amc13, state):
    if state == "Halted":
        if opts.enableSlink == True:
            print "Enabling Slink."
            enableSlink = 1
        else:
            print "Slink disabled."
            enableSlink = 0
        print "Using " + str(opts.BCNoffset) + " as BCNoffset."
        amc13.configure([opts.slot], opts.fedID, enableSlink, bcnOffset=opts.BCNoffset)
        return "Configured"
    else:
        print "Error: Board not halted. Reset it first."

def start(amc13, state):
    if state == "Configured":
        amc13.start()
        return "Running"
    else:
        print "Error: Board not configured. Configure it first."

def stop(amc13, state):
    if state == "Running":
        print "Currently non-funcitonal. Use reset"
        return "Stopped"
        amc13.stop()
        return "Stopped"
    else:
        print "Error: Board not running."

def spy(amc13, state):
    if state != "Running":
        print "WARNING: Seems like we're not running, you probably won't see any events here."
    print "Spying on events. Use ctrl+c to stop."
    amc13.spy()

def main():
    # I'm so sorry..
    state = "Undefined"

    # Sanitise the connection string
    conns = opts.connections_file.split(';')
    for i,c in enumerate(conns):
        if re.match('^\w+://.*', c) is None:
            conns[i] = 'file://'+c


    print 'Using file',conns
    cm = uhal.ConnectionManager(';'.join(conns))

    amc13T1 = cm.getDevice('T1')
    amc13T2 = cm.getDevice('T2')

    amc13 = dtm.DTManager(t1=amc13T1, t2=amc13T2)

    help_string = 'Available commands: status, reset, configureTTC, configure, start, stop, spy, q'

    while True:
        print help_string
        c = raw_input("--> ")
        if c == 'status':
            status(amc13, state)
        elif c == 'reset':
            state = reset(amc13)
        elif c == 'configureTTC':
            state = configureTTC(amc13, state)
        elif c == 'configure':
            state = configure(amc13, state)
        elif c == 'start':
            state = start(amc13, state)
        elif c == 'stop':
            state = stop(amc13, state)
        elif c == 'spy':
            spy(amc13, state)
        elif c == 'q':
            break
        else:
            print "Error: Unrecognized command. Try again."

if __name__ == "__main__":
    main()
