from optparse import OptionParser
from os import walk, path

def parse_options():
    """
    Adds often used options to the OptionParser...
    """
    parser = OptionParser()
    parser.add_option("-f", "--directory", dest="directory")
    parser.add_option("-e", "--emudirectory", dest="emudirectory", default="data/patterns/mp7") 
    parser.add_option('-v', '--verbose', dest='verbose', help='Additional output about muons per event (%default)', default=False, action='store_true')
    parser.add_option("-u", '--veryverbose', dest="detaildump", help="Even more output (%defahult)", default=False, action="store_true")
    opts, args = parser.parse_args()
    if opts.detaildump: opts.verbose = True
    return opts, args

def discover_files(opts):
    """
    Tries to find tx_*/rx_* files in --directory and root-file in --emudirectory
    TAKES: the options as returned by parse_options, above
    RETURNS: dict with all valid buffer-dump / root-file triples in the directories, structure:
                dict[pattern_name] = {'root':'/abspath/to/emu/root-file.root', 'tx':'/abspath/to/dir/tx_*.txt', 'rx':'/abspath/to/dir/rx_*.txt',
                                        'base':'/abspath/to/dir/pattern/'}
    """
    file_dict = {}
    for roots, dirs, files in walk(opts.directory):
        tmp_dict = {}
        for fname in files:
            if fname.startswith("tx_"):
                tmp_dict["tx"] = path.join(path.abspath(roots), fname)
            if fname.startswith("rx_"):
                tmp_dict["rx"] = path.join(path.abspath(roots), fname)
        if tmp_dict != {}: 
            pattern_name = path.basename(roots)
            tmp_dict['base'] = path.abspath(roots)
            file_dict[pattern_name] = tmp_dict
            if path.exists(opts.emudirectory):
                file_dict[pattern_name]["emu_tx"] = path.join(path.abspath(opts.emudirectory), pattern_name+"_out.txt")
    return file_dict

def discover_emu_files(directory):
    file_dict = {}
    for roots, dirs, files in walk(directory):
        for fname in files:
            if fname.endswith(".root"):
                pattern_name = fname.replace(".root", "")
                file_dict[pattern_name] = {}
                file_dict[pattern_name]['base'] = path.abspath(roots)
                file_dict[pattern_name]['root'] = path.join(file_dict[pattern_name]['base'], fname)
    return file_dict