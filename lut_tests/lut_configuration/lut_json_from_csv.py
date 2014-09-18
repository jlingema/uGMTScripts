#!/usr/bin/env python
from csv import reader as csv_reader
import json

def parse_options():
    '''
    Parse the command line options
    '''
    import optparse
    usage = '''
%prog csv_file [options]

'''
    defaults = {
        'out'       : 'data/lut_config.json',
        'format'    : 'test_bench',
    }

    formats = ['test_bench']
    parser = optparse.OptionParser( usage )
    parser.add_option('-f', '--format', dest='format', help='format that is needed {formats} (%default)'.format(formats=formats), default=defaults['format'], type='string' )
    parser.add_option('-o', '--out'   , dest='out'   , help='location for output file (%default)',                                default=defaults['out']   , type='string' )

    opts, args = parser.parse_args()

    if len(args) == 1:
        opts.csv_name = args[0]
    else:
        parser.error('csv filename')

    if opts.format not in formats:
        parser.error('format should be one of {formats}'.format(formats=formats))
    return opts,args

if __name__ == "__main__":
    opts, args = parse_options()

    with open(opts.csv_name, 'r') as csv_file:
        lut_reader = csv_reader(csv_file, delimiter=",")
        header = lut_reader.next()

        idx_input_names = header.index("inputs")
        idx_input_widths = header.index("bits in (addr)")
        idx_output_width = header.index("bits out (dout)")
        idx_lut_name = 0
        idx_doc = header.index("Remarks")

        json_obj = {}
        default_function = "0"
        for row in lut_reader:
            name = row[idx_lut_name]
            if "Total" in name: continue
            
            json_obj[name] = {}
            if "," in row[idx_input_names]:
                json_obj[name]["inputs"] = [ n.strip() for n in row[idx_input_names].split(",")]
                json_obj[name]["input_widths"] = [ int(w) for w in row[idx_input_widths].split("+")]
                if len(json_obj[name]["input_widths"]) != len(json_obj[name]["inputs"]):
                    print "ERROR", name, "mismatch input widths and input names"
            else:
                json_obj[name]["inputs"] = [row[idx_input_names]]
                json_obj[name]["input_widths"] = [int(row[idx_input_widths])]

            json_obj[name]["data_out_width"] = int(row[idx_output_width])
            json_obj[name]["function"] = default_function
            json_obj[name]["docstring"] = row[idx_doc]

   
    with open(opts.out, "w") as json_file:
        json_file.write(json.dumps(json_obj, indent=4))