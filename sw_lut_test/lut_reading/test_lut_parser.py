#!/usr/env/bin python

from lut_parser import LUTFileParser

if __name__ == "__main__":
    fname = "data/test_lut_file.json"
    parser = LUTFileParser(fname)

    print "full lut1: ", parser.get_lut("TOP.payload.lut1")
    print "full lut2: ", parser.get_lut("TOP.payload.lut2")

    print "lut1 data instance1:", parser.get_lut_instance_data("TOP.payload.lut1", "instance1")
    print "lut2 data:", parser.get_lut_data("TOP.payload.lut2")

    print "lut1 data (all instances):", parser.get_lut_data("TOP.payload.lut1")
