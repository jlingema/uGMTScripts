from optparse import OptionParser
from os import walk, path

def parse_options():
    """
    Adds often used options to the OptionParser...
    """
    parser = OptionParser()
    parser.add_option("-f", "--directory", dest="directory")
    parser.add_option("-e", "--emudirectory", dest="emudirectory", default="data/buffers/emulator") 
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
                dict[pattern_name] = {'root':'/abspath/to/root-file.root', 'tx':'/abspath/to/tx_*.txt', 'rx':'/abspath/to/rx_*.txt'}
    """
    file_dict = {}
    for roots, dirs, files in walk("{d}".format(d=opts.directory)):
        tmp_dict = {}
        for fname in files:
            if "tx_" in fname:
                tmp_dict["tx"] = path.join(path.abspath(roots), fname)
            if "rx_" in fname:
                tmp_dict["rx"] = path.join(path.abspath(roots), fname)
        if tmp_dict != {}: 
            pattern_name = path.basename(roots)
            file_dict[pattern_name] = tmp_dict
            if path.exists(opts.emudirectory):
                file_dict[pattern_name]["root"] = path.join(path.abspath(opts.emudirectory), pattern_name+".root")
    return file_dict