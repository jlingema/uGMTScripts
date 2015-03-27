#!/usr/bin/env python
import urllib
import argparse
import os

def parse_options():
    desc = "Setup script for uGMTScripts"
    parser = argparse.ArgumentParser(description=desc, formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('--update', dest='update', action='store_true', default=False, help='Update the cross repo dependencies')
    opts = parser.parse_args()
    return opts


def get_ugmt_constants():
    urllib.urlretrieve ("https://raw.githubusercontent.com/dinyar/uGMTfirmware/master/uGMT_algos/firmware/hdl/common/ugmt_constants.vhd", 
        "ugmt_patterns/data/ugmt_constants.vhd")

def main():
    opts = parse_options()
    if opts.update:
        print 'Fetching newest version of ugmt_constants.vhd'
        get_ugmt_constants()

    script_path = os.path.dirname(os.path.abspath(__file__))
    
    if not script_path in os.environ['PYTHONPATH']:
        print "Please execute setup.sh"
        with open('setup.sh', 'w') as fobj:
            fobj.write('export PYTHONPATH=$PYTHONPATH:'+script_path)

if __name__ == "__main__":
    main()