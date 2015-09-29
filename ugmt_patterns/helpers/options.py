import argparse
from os import walk, path

def parse_options(description = ""):
    """
    Adds often used options to the ArgumentParser...
    """
    desc = "Interfaces for test-pattern analysis."
    if description != "":
        desc = description
        
    parser = argparse.ArgumentParser(description=desc,formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument("--directory", dest="directory", type=str, help="Directory containing buffer dumps.")
    parser.add_argument("--emudirectory", dest="emudirectory", type=str, default="data/buffers/emulator", help="Directory containing emulator output root-files.")
    parser.add_argument("--nodebug", dest="nodebug", help='Whether debug output is in the file (intermediate muons, ranks and calo energies)', default=False, action='store_true')
    parser.add_argument('--verbose', dest='verbose', help='Additional output about muons per event', default=False, action='store_true')
    parser.add_argument('--veryverbose', dest="detaildump", help="Even more output", default=False, action="store_true")
    parser.add_argument("--delay", dest="delay", help="Specify how many empty frames should be written to mp7-pattern", default=4, type=int)
    parser.add_argument("--gtdumps", dest="gtdumps", help="Specify a folder containing files that represent the GT-spy buffer dumps", default="", type=str)
    parser.add_argument("--gtoffset", dest="gtoffset", help="Specify the offset for the GT-spy buffer (leading comma)", default=31, type=int)
    
    opts = parser.parse_args()
    
    # if opts.detaildump: opts.verbose = True
    return opts

def discover_files(opts):
    """
    Tries to find tx_*/rx_* files in --directory and root-file in --emudirectory
    TAKES: the options as returned by parse_options, above
    RETURNS: dict with all valid buffer-dump / root-file triples in the directories, structure:
                dict[pattern_name] = { 'tx':'/abspath/to/dir/tx_*.txt', 'rx':'/abspath/to/dir/rx_*.txt',
                                        'emu_tx':'/abspath/to/emu_dir/tx_*.txt', '/abspath/to/emu_dir/emu_rx':
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
                file_dict[pattern_name]["emu_rx"] = path.join(path.abspath(opts.emudirectory), pattern_name+".txt")
    return file_dict

def discover_emu_files(directory):
    '''
    'root':'/abspath/to/emu/root-file.root', 'idebug':/abspath/to/emu/*_iso_debug.txt
    '''
    file_dict = {}
    for roots, dirs, files in walk(directory):
        for fname in files:
            if fname.endswith(".root"):
                pattern_name = fname.replace(".root", "")
                if not pattern_name in file_dict.keys():
                    file_dict[pattern_name] = {}
                    file_dict[pattern_name]['base'] = path.abspath(roots)
                file_dict[pattern_name]['root'] = path.join(file_dict[pattern_name]['base'], fname)
            elif fname.endswith(".txt"):
                pattern_name = fname.replace('_iso_debug.txt', '')
                if not pattern_name in file_dict.keys():
                    file_dict[pattern_name] = {}
                    file_dict[pattern_name]['base'] = path.abspath(roots)
                file_dict[pattern_name]['idebug'] = path.join(file_dict[pattern_name]['base'], fname)
    return file_dict