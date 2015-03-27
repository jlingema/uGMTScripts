#!/usr/bin/env python
import json
from lut_configurator import LUTConfigurator
from datetime import date
import math

coe_header = """; Auto-generated Memory-Initialization .COE file for Core Generator, used in uGMT bench-tests
; LUT:        {lutname}
; Function:   {function}
; Version:    {version}
; Generated:  {date}
memory_initialization_radix=16;
memory_initialization_vector="""

emu_header = """# Auto-generated Memory-Initialization .lut file for uGMT emulator-tests
# LUT:        {lutname}
# Function:   {function}
# Version:    {version}
# Generated:  {date}
CONTENT_VECTOR= """


def write_coe_file(name, dirname, function, data):
    with open("{dirname}/{fname}.coe".format(dirname=dirname, fname=name), "w") as coe_file:
        coe_file.write(coe_header.format(lutname=name, function=function, version=1, date=date.today()))
        for i, d in enumerate(data):
            coe_file.write(hex(d).replace("0x", ""))
            if i < len(data) - 1:
                coe_file.write(",\n")
            else:
                coe_file.write(";")

def write_dist_file(name, dirname, function, data, out_width):
    with open("{dirname}/{fname}.mif".format(dirname=dirname, fname=name), "w") as dist_file:
        #dist_file.write(coe_header.format(lutname=name, function=function, version=1, date=date.today()))
        for i, d in enumerate(data):
            dist_file.write("{{w:0>{width}x}}\n".format(width=int(math.ceil(out_width/4.0))).format(w=d))

def write_bin_file(name, dirname, function, data, out_width):
    with open("{dirname}/{fname}.mif".format(dirname=dirname, fname=name), "w") as dist_file:
        #dist_file.write(coe_header.format(lutname=name, function=function, version=1, date=date.today()))
        for i, d in enumerate(data):
            dist_file.write("{{w:0>{width}b}}\n".format(width=out_width).format(w=d)) 

def write_emu_lut_file(name, dirname, function, data):
    with open("{dirname}/{fname}.lut".format(dirname=dirname, fname=name), "w") as lut_file:
        lut_file.write(emu_header.format(lutname=name, function=function, version=1, date=date.today()))
        for i, d in enumerate(data):
            lut_file.write("{datum} ".format(datum=int(d)))

def parse_options():
    '''
    Parse the command line options
    '''
    import optparse
    usage = '''
%prog json_file [options]

'''
    defaults = {
        'coe_out'       : 'data/coe/',
        'emu_out'       : 'data/emu/',
        'dist_out'       : 'data/dist/',
        'bin_out'       : 'data/binary/'
    }
    parser = optparse.OptionParser( usage )
    parser.add_option('--coe'   , dest='coe_out'   , help='location for output files (%default)', default=defaults['coe_out']   , type='string' )
    parser.add_option('--emu'   , dest='emu_out'   , help='location for output files (%default)', default=defaults['emu_out']   , type='string' )
    parser.add_option('--dist'   , dest='dist_out'   , help='location for output files (%default)', default=defaults['dist_out']   , type='string' )
    parser.add_option('--bin'   , dest='bin_out'   , help='location for output files (%default)', default=defaults['bin_out']   , type='string' )

    opts, args = parser.parse_args()

    if len(args) == 1:
        opts.json_name = args[0]
    else:
        parser.error('json filename')

    return opts,args

ETAMAP = {}
PHIMAP = []

if __name__ == "__main__":
    opts, args = parse_options()
    lut_cfger = LUTConfigurator()
    with open(opts.json_name, 'r') as json_file:
        lut_config = json.load(json_file)
        for name, config in lut_config.iteritems():
            owidth = config['data_out_width']
            if config["function"] != "":
                lut_data = LUTConfigurator.get_function_lut(config["function"], config["inputs"], config["input_widths"], config["data_out_width"])
                write_coe_file(name, opts.coe_out, config["function"], lut_data)
                write_dist_file(name, opts.dist_out, config["function"], lut_data, owidth)
                write_bin_file(name, opts.bin_out, config["function"], lut_data, owidth)
                write_emu_lut_file(name, opts.emu_out, config["function"], lut_data)
            elif config["map"]:
                if len(config["inputs"]) > 1: print "ERROR : Map only works with one input, currently"
                lut_data = lut_cfger.get_map_lut(config["map"], config["inputs"][0], config["input_widths"][0], config["data_out_width"])
                write_coe_file(name, opts.coe_out, config["function"], lut_data)
                write_dist_file(name, opts.dist_out, config["function"], lut_data, owidth)
                write_bin_file(name, opts.bin_out, config["function"], lut_data, owidth)
                write_emu_lut_file(name, opts.emu_out, config["function"], lut_data)
    

