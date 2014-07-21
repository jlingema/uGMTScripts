#!/usr/bin/env python
import json
from lut_configurator import LUTConfigurator
from datetime import date

coe_header = """; Auto-generated Memory-Initialization .COE file for uGMT bench-tests
; LUT:        {lutname}
; Function:   {function}
; Version:    {version}
; Generated:  {date}
memory_initialization_radix=16;
memory_initialization_vector="""

def write_coe_file(name, dirname, function, data):
    with open("{dirname}/{fname}.coe".format(dirname=dirname, fname=name), "w") as coe_file:
        coe_file.write(coe_header.format(lutname=name, function=function, version=1, date=date.today()))
        for i, d in enumerate(data):
            coe_file.write(hex(d).replace("0x", ""))
            if i < len(data) - 1:
                coe_file.write(",\n")
            else:
                coe_file.write(";")

def parse_options():
    '''
    Parse the command line options
    '''
    import optparse
    usage = '''
%prog json_file [options]

'''
    defaults = {
        'outdir'       : 'data/',
    }
    parser = optparse.OptionParser( usage )
    parser.add_option('-o', '--outdir'   , dest='outdir'   , help='location for output files (%default)', default=defaults['outdir']   , type='string' )

    opts, args = parser.parse_args()

    if len(args) == 1:
        opts.json_name = args[0]
    else:
        parser.error('json filename')

    return opts,args

if __name__ == "__main__":
    opts, args = parse_options()
   
    with open(opts.json_name, 'r') as json_file:
        lut_config = json.load(json_file)

        for name, config in lut_config.iteritems():
            if config["function"] and len(config["inputs"]) == 2:
                fstring = config["function"].replace("a", config["inputs"][0]).replace("b", config["inputs"][1])
                lut_data = LUTConfigurator.get_2param_function_lut(config["function"], config["input_widths"][0], config["input_widths"][1], config["data_out_width"])
                write_coe_file(name, opts.outdir, fstring, lut_data)


    

