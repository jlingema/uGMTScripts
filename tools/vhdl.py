
import re
from logger import log


#constant MU_QUAD_ASSIGNMENT : QuadAssignment_vector(8 downto 0) := (17, 16, 15, 14, 13, 12, 11, 10, 9);
class VHDLConstantsParser(object):
    """A parser that understands only constant definitions"""
    _log = log.init_logging("vhdl parse")
    def __init__(self):
        super(VHDLConstantsParser, self).__init__()        

    @staticmethod
    def get_actual_value(comb_match, val_dict):
        comb = re.split(r":= *", comb_match)[1]
        values = re.split(r"([+*])", comb)
        eval_str = ""
        for i in xrange(len(values)):
            if not re.match(r"[+*]", values[i]):
                values[i] = "val_dict['"+values[i]+"']"
            eval_str += values[i]

        VHDLConstantsParser._log.warning("Found combinatorical expression, please check (assuming the values are stored in dict val_dict):")
        value = eval(eval_str)
        print "\t\t", eval_str, "=", value
        
        return value

    @staticmethod
    def parse_vhdl_file(filename):
        f = open(filename, "r")
        re_vname = re.compile("constant +[A-Za-z_0-9]*")
        re_value = re.compile(":= *[0-9]+")
        re_type = re.compile(": *[A-Za-z_0-9]*")
        re_vcomb = re.compile(":= *[A-Za-z+*_]+")
        config_dict = {}
        for i, line in enumerate(f):
            # Check if line is commented.
            if line.lstrip()[0:1] == "--":
                continue
            if "constant " in line:
                vname_match = re_vname.search(line)
                if vname_match:
                    # get rid of starting constant
                    vname = vname_match.group(0).split()[1]
                else:
                    VHDLConstantsParser._log.error("constant in line but no variable name in line {}".format(i+1))
                    continue
                type_match = re_type.search(line)
                value_match = re_value.search(line)
                vcomb_match = re_vcomb.search(line)

                if type_match:
                    t = re.split(r": *", type_match.group(0))[1]
                    print t
                    if t in ["integer", "natural"]:                
                        if value_match:
                            config_dict[vname] = int(re.split(r":= *", value_match.group(0))[1])
                        elif vcomb_match:
                            config_dict[vname] = VHDLConstantsParser.get_actual_value(vcomb_match.group(0), config_dict)
                        elif vname:
                            VHDLConstantsParser._log.error("variable name but value not understandable in line {}".format(i+1))
                    if "vector" in t:
                        vals = line.split("(")[2].replace(")", "").replace(";", "")
                        vals = vals.split(",")
                        vals = [ int(x.strip()) for x in vals]
                        vals.reverse()
                        config_dict[vname] = vals 
        return config_dict
