from optparse import OptionParser

def parse_options():
    parser = OptionParser()
    parser.add_option("-f", "--directory", dest="directory")
    parser.add_option('-v', '--verbose', dest='verbose', help='Additional output about muons per event (%default)', default=False, action='store_true')
    parser.add_option("-u", '--veryverbose', dest="detaildump", help="Even more output (%defahult)", default=False, action="store_true")
    opts, args = parser.parse_args()
    if opts.detaildump: opts.verbose = True
    return opts, args