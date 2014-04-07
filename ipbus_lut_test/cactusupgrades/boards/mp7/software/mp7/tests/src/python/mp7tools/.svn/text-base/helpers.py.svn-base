#
#
#
import sys
import logging
import ansistrm

import dataio
import random
import buffers

class Tee(object):
    def __init__(self, name, mode='w'):
        self.file = open(name, mode)
        self.stdout = sys.stdout
        sys.stdout = self

    def __del__(self):
        self.file.close()
        del self.stdout

    def write(self, data):
        self.file.write(data)
        self.stdout.write(data)

    def flush(self):
        self.file.flush()
        self.stdout.flush()


def mp7Logo():
    print '       __ __  ____      _____   ______    _________  '
    print '      / // //     |    /  _  | |   _  \  |_____   /  '
    print '     / // //  /|  |   /  /|  | |  | \  |      /  /   '
    print '    / // //  / |  |  /  / |  | |  |_/  |  ___/  /__  '
    print '   / // //  /  |  | /  /  |  | |   __ /  |__  ____/  '
    print '  / // //  /   |  |/  /   |  | |  |       /  /       '
    print ' /_//_//__/    |_____/    |__| |__|      /__/        '

def testAccess(board):

    v = board.getNode('ctrl.id').read()
    try:
        board.dispatch()
    except:
        import sys
        # print something here when if times out
        logging.error('MP7 access failed (name: %s uri: %s)',board.id(),board.uri())
        sys.exit(-1)
    
    logging.info('%s access successful', board.id())
    logging.debug(' uri : %s',board.uri())
    logging.debug(' id  : %s',hex(v))

def getLogLevel():
    import uhal
    levels = uhal.LogLevel.values
    for l in sorted(levels.keys()):
        if uhal.LoggingIncludes(levels[l]):
            return levels[l]

def snapshot( node ):
    '''snapshot( node ) -> { subnode:value }'''
    import uhal
    vals = {}
    for n in node.getNodes():
        vals[n] = node.getNode(n).read()
    node.getClient().dispatch()

    return dict( [ (k,v.value()) for k,v in vals.iteritems() ] )


# Make a logging Tee, to add the print to the logging, with below-warning
# priority :D

def hookDebugger(debugger='gdb'):
    '''debugging helper, hooks debugger to running interpreter process'''

    import os
    pid = os.spawnvp(os.P_NOWAIT,
                     debugger, [debugger, '-q', 'python', str(os.getpid())])

    # give debugger some time to attach to the python process
    import time
    time.sleep( 1 )

    # verify the process' existence (will raise OSError if failed)
    os.waitpid( pid, os.WNOHANG )
    os.kill( pid, 0 )
    return

#---
def run_from_ipython():
    try:
        __IPYTHON__
        return True
    except NameError:
        return False
#---

class list_maker:
  def __init__(self, var, sep=',', type=None ):
    self._type= type
    self._var = var
    self._sep = sep

  def __call__(self,option, opt_str, value, parser):
    if not hasattr(parser.values,self._var):
      setattr(parser.values,self._var,[])

    try:
      array = value.split(self._sep)
      if self._type:
        array = [ self._type(e) for e in array ]
      setattr(parser.values, self._var, array)

    except:
      print 'Malformed option (comma separated list expected):',value

class intlist_maker:
  def __init__(self, var, sep=',', dash='-'):
    self._var  = var
    self._sep  = sep
    self._dash = dash

  def __call__(self,option, opt_str, value, parser):
    if not hasattr(parser.values,self._var):
      setattr(parser.values,self._var,[])

    numbers=[]
    items = value.split(self._sep)
    for item in items:
        nums = item.split(self._dash)
        if len(nums) == 1:
            # single number
            numbers.append(int(item))
        elif len(nums) == 2:
            i = int(nums[0])
            j = int(nums[1])
            if i > j:
                raise ValueError('Invalid interval '+item)
            numbers.extend(range(i,j+1))
        else:
           print 'Malformed option (comma separated list expected):',value
    setattr(parser.values, self._var, numbers)

#---
def bin(x,fill=0):
    """
    bin(number) -> string

    Stringifies an int or long in base 2.
    """
    if x < 0:
        return '-' + bin(-x)
    out = []
    if x == 0:
        out.append('0')
    while x > 0:
        out.append('01'[x & 1])
        x >>= 1
        pass
    if fill != 0 and fill>len(out):
        out+='0'*(fill-len(out))
    try:
        return '0b' + ''.join(reversed(out))
    except NameError, ne2:
        out.reverse()
    return '0b' + ''.join(out)

#---
def initLogging( level, logpath=None, mode='a' ):

    root = logging.getLogger()
    if any([isinstance(h,ansistrm.ColorizingStreamHandler) for h in root.handlers]):
        root.info('Logging already initialized')
        return 
    root.setLevel(logging.DEBUG)

    # define the colored console handler
    console = ansistrm.ColorizingStreamHandler()
    console.setLevel(level)
    # set a format which is simpler for console use
    formatter = logging.Formatter('%(levelname)-8s | %(message)s')
    # tell the handler to use this format
    console.setFormatter(formatter)
    # add the handler to the root logger
    root.addHandler(console)

    if logpath:
        # define the logfile handler
        logfile = logging.FileHandler( logpath,mode )

        # more verbose format for the logfile
        fileformatter = logging.Formatter('%(asctime)s %(levelname)-8s: %(message)s')
        logfile.setFormatter(fileformatter)
        logfile.setLevel(logging.DEBUG)
        root.addHandler(logfile)

        root.info('>>> Logging to %s',logpath)

#---
def init_colorlog( level ):

    esc = "\x1b["

    codes = {}
    codes[""]          = ""
    codes["reset"]     = esc + "39;49;00m"

    codes["bold"]      = esc + "01m"
    codes["faint"]     = esc + "02m"
    codes["standout"]  = esc + "03m"
    codes["underline"] = esc + "04m"
    codes["blink"]     = esc + "05m"
    codes["overline"]  = esc + "06m"

    dark_colors  = ["black", "darkred", "darkgreen", "brown", "darkblue",
                    "purple", "teal", "lightgray"]
    light_colors = ["darkgray", "red", "green", "yellow", "blue",
                    "fuchsia", "turquoise", "white"]

    x = 30

    for d, l in zip(dark_colors, light_colors):
        codes[d] = esc + "%im" % x
        codes[l] = esc + "%i;01m" % x
        x += 1

    del d, l, x

    codes["darkteal"]   = codes["turquoise"]
    codes["darkyellow"] = codes["brown"]
    codes["fuscia"]     = codes["fuchsia"]
    codes["white"]      = codes["bold"]

    esc = '\x1b['

    reset = esc + "39;49;00m"
    fatal = esc + '1;31m'
    error = esc + '1;41m'

    fatal = codes['purple']
    error = codes['red']
    warn  = codes['yellow']
    info  = codes['teal']
    debug = codes['turquoise']

    logging.addLevelName( logging.FATAL,   fatal + logging.getLevelName(logging.FATAL)   + reset)
    logging.addLevelName( logging.ERROR,   error + logging.getLevelName(logging.ERROR)   + reset)
    logging.addLevelName( logging.WARNING, warn  + logging.getLevelName(logging.WARNING) + reset)
    logging.addLevelName( logging.INFO,    info  + logging.getLevelName(logging.INFO)    + reset)
    logging.addLevelName( logging.DEBUG,   debug + logging.getLevelName(logging.DEBUG)   + reset)

    logging.basicConfig(level=level,format='%(asctime)s [%(name)s] %(levelname)s: %(message)s')#, datefmt='%m-%d-%Y %H:%M:%S')

import os

def validateDataUri( parser, opts ):

    try:
        uri = buffers.BoardDataSource.validateDataUri(opts.data_uri)
    except RuntimeError as re:
        parser.error(str(re))

    opts.data_uri = uri

    # if opts.data_uri.startswith('file://') :
    #     tokens = opts.data_uri[7:].split('?')
    #     print tokens
    #     if   len(tokens) == 2:
    #         data_file, iboard = tokens
    #         # test integer conversion
    #     elif len(tokens) == 1:
    #         data_file, iboard = tokens[0],'0'
    #     else:
    #         parser.error( 'Malformed data file, must be file://<path>?<board>')
    #     if not iboard.isdigit():
    #         parser.error( 'Malformed data file, must be file://<path>?<board>')
    #     if not os.path.exists( data_file ):
    #         parser.error('File %s not found' % data_file)

    #     opts.data_uri = 'file://'+data_file+'?'+iboard

    # elif opts.data_uri.startswith('generate:'):
    #     tokens = opts.data_uri.split(':')
    #     if len(tokens) != 2:
    #         parser.error('Malformed data URI')

    #     if tokens[1] not in ['random','pattern']:
    #         parser.error('Invalid generator mode')
    # else:            
    #     parser.error('Invalid buffer data URI')

def validatePath( parser, opts ):
    if opts.path:
        # some local imports
        from os.path import exists,basename,join,splitext

        # sanitaise the inputs
        if opts.path[-1] != '/': opts.path += '/'

        if not os.path.exists(opts.path):
            os.system('mkdir -p '+opts.path)

        #
        opts.logfile = join(opts.path,basename(splitext(parser.get_prog_name())[0]+'.log') )
    else:
        opts.logfile=None

