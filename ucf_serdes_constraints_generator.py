#!/usr/bin/env python

from tools.logger import log
from tools.vhdl import VHDLConstantsParser

def parse_options():
    import optparse
    usage = '''
%prog vhdl_file ucf_file [options]
'''

    parser = optparse.OptionParser( usage )
    parser.add_option('-v', '--verbosity', dest='verbosity', help='Set verbosity-level, possible values: DEBUG, INFO, WARNING, ERROR (%default)', default="DEBUG", type='string')

    opts, args = parser.parse_args()
    fnames = []
    if len(args) != 2:
        _log.error("Please provide two input files")
        print usage
        exit(0)
    else:
        for arg in args:
            fnames.append(arg)

    opts.files = fnames

    return opts, args

def get_quad_areagroup_mapping(filename):
    f = open(filename, 'r')
    quad_dict = {}
    for line_no, line in enumerate(f):
        if "INST" in line:
            if "mgt/quad_gen" in line:
                if "AREA_GROUP" in line:
                    quad_nr = line[line.index('[')+1:line.index(']')]
                    area_grp_string = line[line.index('GROUP=quad_'):line.index(';')]
                    area_grp = area_grp_string[area_grp_string.index('_')+1:]
                    quad_dict[quad_nr] = area_grp
    f.close()
    return quad_dict

def generate_instance_string(serdes_type, instance, area_group):
    instance_num = instance[instance.rfind('_')+1:]
    instance_string = 'INST "algo/deserialize'
    if serdes_type == "CALO":
        instance_string = instance_string + '_energies'
    instance_string = instance_string + '/deserialize_'
    instance_string = instance_string + str(instance_num)
    instance_string = instance_string + '" AREA_GROUP=quad_'
    instance_string = instance_string + str(area_group)
    instance_string = instance_string + ';'
    return instance_string
    

_log = log.init_logging("ucf_serdes_constraints_generator")
if __name__ == "__main__":
    # initialize command line input
    opts, args = parse_options()

    # set verbosity according to option
    log.set_level(opts.verbosity)
    _log.debug ("*"*40)
    _log.info ("  UCF Serdes constraints generator")
    _log.info ("*"*40)
    _log.info ("Paste the following into your ucf file:")

    config_dict = VHDLConstantsParser.parse_vhdl_file(opts.files[0])
    quad_dict = get_quad_areagroup_mapping(opts.files[1])
    
    for key in sorted(config_dict):
        if "MU_QUAD_" in key:
            print generate_instance_string("MU", key, quad_dict[str(config_dict[key])])
        if "ENERGY_QUAD_" in key:
            print generate_instance_string("CALO", key, quad_dict[str(config_dict[key])])


