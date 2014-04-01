#!/usr/bin/env python
from tools.vhdl import VHDLConstantsParser

#BAR 0 9 4 58 0 1 3     # muon: pt = 4.5,  phi = 0.0436332,  eta = 0.58125,  charge = 0
# muon format (separated by one space):
# cable number only for debugging purposes
# variable: ID cable no pT phi eta sign valid sign quality
# n bits  : -  -        9  10  9   1    1          4
def twos_comp(val, bits):
    """compute the 2's compliment of int value val"""
    if val >= 0:
        return val
    val = val + (1<<bits)
    return val

def test(nbits):
    print "nbits:", nbits
    max_ = (1<<(nbits-1))-1
    min_ = -(1<<(nbits-1))
    middle = min_+max_/2
    print "max pos:", max_, twos_comp(max_, nbits), hex(twos_comp(max_, nbits))
    print "max neg:", min_, twos_comp(min_, nbits), hex(twos_comp(min_, nbits))
    print "something:", middle, twos_comp(middle, nbits), hex(twos_comp(middle, nbits))
    print "-1:", twos_comp(-1, nbits), hex(twos_comp(-1, nbits))
    print "+1:", twos_comp(1, nbits), hex(twos_comp(1, nbits))

def print_dformat(df, i, values = None):
    word = df[i]

    header = "\n| Word "+str(i)
    names = "\n| Name:  "
    widths = "\n| Width: "
    starts = "\n| Start: "
    value_str = "\n| Vals:  "
    for name, cf in word.iteritems():
        names += " "+name
        widths +=  " "+"{}".format(cf[1] - cf[0]+1).rjust(len(name))
        starts +=  " "+"{}".format(cf[2]).rjust(len(name))
        if values != None:
            value_str += " "+"{}".format(values[name]).rjust(len(name))
    start_end = "+"+"-"*(len(names)+2)+"+"
    header += " "*(len(start_end)-len(header))+"|"
    names+=" "*(len(start_end)-len(names))+"|"
    value_str += " "*(len(start_end)-len(value_str))+"|"
    widths+=" "*(len(start_end)-len(widths))+"|"
    starts+=" "*(len(start_end)-len(starts))+"|"
    p_string = start_end+header+names+starts+widths
    if values != None:
        p_string += value_str
    p_string += "\n"+start_end
    print p_string

def mu_to_string(mu_line, line_no):
    mu_params = mu_line.split()

    # could also read the 
    name_to_key = {"ADDRESS":None, "PT":2, "PHI":3, "ETA":4, "SYSIGN":5, "QUAL":7}
    offset_w2 = 64
    for name, p_key in name_to_key.iteritems():
        if cfg[name+"_IN_HIGH"] > 31:
            offset_w2 = min(offset_w2, cfg[name+"_IN_LOW"])

    id_ = mu_params[0]
    cable = int(mu_params[1])
    
    i_word1 = 0
    i_word2 = 0

    s_word1 = {}
    s_word2 = {}
    values = {}
    for name, p_key in name_to_key.iteritems():
        if name == "ADDRESS":
            values[name] = 0
            if cfg[name+"_IN_LOW"] < offset_w2:
                s_word1[name] = [cfg[name+"_IN_LOW"], cfg[name+"_IN_HIGH"], cfg[name+"_IN_LOW"]]
            else:
                s_word2[name] = [cfg[name+"_IN_LOW"], cfg[name+"_IN_HIGH"], cfg[name+"_IN_LOW"]]
            continue
        shift = cfg[name+"_IN_LOW"]
        nbits = cfg[name+"_IN_HIGH"] - cfg[name+"_IN_LOW"] + 1
        #print name, nbits
        if shift >= offset_w2: 
            shift -= offset_w2
            i_word2 += twos_comp(int(mu_params[p_key]), nbits) << shift
            s_word2[name] = [cfg[name+"_IN_LOW"], cfg[name+"_IN_HIGH"], shift]
            
        else: 
            s_word1[name] = [cfg[name+"_IN_LOW"], cfg[name+"_IN_HIGH"], shift]
            i_word1 += twos_comp(int(mu_params[p_key]), nbits) << shift
        values[name] = mu_params[p_key]
    word1 = hex(i_word1).replace("0x", "")
    if len(word1) > 8:
        print "*"*40
        print "\033[22;30m[error]\033[22;0m overflow:", word1, "in line", line_no
        print_dformat([s_word1, s_word2], 0, values)
        print "*"*40

    word2 = hex(i_word2).replace("0x", "")
    if len(word2) > 8:
        print "*"*40
        print "\033[22;30m[error]\033[22;0m overflow:", word2, "in line", line_no
        print_dformat([s_word1, s_word2], 1, values)
        print "*"*40

    word1=fill_word(word1)
    word2=fill_word(word2)
    #print word1, word2
    return id_, cable, word1, word2, [s_word1, s_word2]

def fill_word(w):
    while len(w) < 8:
        w = "0"+w
    w = "1v"+w
    return w
def parse_options():
    import optparse
    usage = '''
%prog board_name [options]
'''
    defaults = {
    'in'    : 'test.dat',
    'out'   : 'muon_test_mp7.dat',
    'board' : 'UGMT',
    'config': 'ugmt_constants.vhd'
    }

    parser = optparse.OptionParser( usage )
    parser.add_option('-i', '--in',  dest='infile',      help='Input human-readable data file (%default)',          default=defaults['in'],     type='string')
    parser.add_option('-o', '--out', dest='outfile',     help='Output mp7-framework readable data file (%default)', default=defaults['out'],    type='string')
    parser.add_option('-c', '--config', dest='config',   help='VHDL file containing ugmt constants (%default)',     default=defaults['config'], type='string')
    parser.add_option('-v', '--verbose', dest='verbose', help='Additional output about muons per event (%default)', default=False,              action='store_true')

    opts, args = parser.parse_args()
    if len(args) != 1:
        parser.error('Missing board name')

    return opts, args


def generate_frames_string(frames, offset):
    f_string = ""
    for i in xrange(6):
        f_string += "Frame {:04} :".format(offset+i+1)
        for j in xrange(72):
            if len(frames[j]) > i:
                f_string += " "+frames[j][i]
            else:
                f_string += " 1v00000000"
        f_string += "\n"

    return f_string


def print_counters(header, ctrs):
    print header
    print "#Muon for  FWD+   OVL+    BRL   OVL-   FWD-   CALO"
    print repr(ctrs['fwd_pos']).rjust(15), repr(ctrs['ovl_pos']).rjust(6), repr(ctrs['brl']).rjust(6), repr(ctrs['ovl_neg']).rjust(6), repr(ctrs['fwd_neg']).rjust(6), repr(ctrs['calo']).rjust(6)


def determine_offset_count(counters):
    offset = 0
    if id_ == "BAR":
        offset = cfg['BARREL_LOW']
        counters['brl'] += 1
    if id_ == "FWD":
        if cable > 5:
            offset = cfg['FWD_NEG_LOW']
            counters['fwd_neg'] += 1
        else: 
            offset = cfg['FWD_POS_LOW']
            counters['fwd_pos'] += 1
    if id_ == "OVL":
        if cable > 5:
            offset = cfg['OVL_NEG_LOW']
            counters['ovl_neg'] += 1
        else: 
            offset = cfg['OVL_POS_LOW']
            counters['ovl_pos'] += 1
    return offset

def generate_calo_frames(frames, calo_energies):
    cable_no = cfg['NUM_MU_CHANS']+1 #calo energies come after muons
    word = 0
    frame_counter = 0
    tot_words = 0
    for i, en_sum in enumerate(calo_energies):
        if i%6 == 0:
            s_word = fill_word(hex(word).replace("0x", ""))
            frames[cable_no].append(s_word)
            tot_words += 1
            word = 0
            frame_counter += 1
        if frame_counter == 6:
            frame_counter = 0
            cable_no += 1
        shift = i%6
        word += en_sum << shift

    print "Total words for CALO in this event:", tot_words


def add_energies(calo_energies, line, line_no):
    tot = 0
    for i, en_sum in enumerate(line.split()):
        if en_sum == "CALO": continue
        if en_sum[0] == "#": break
        tot = i
        calo_energies.append(int(en_sum))
    return tot


if __name__ == "__main__":
    global cfg
    cfg = {}
    #mu_to_string("BAR 0 9 4 58 0 1 3     # muon: pt = 4.5,  phi = 0.0436332,  eta = 0.58125,  charge = 0")
    opts, args = parse_options()

    mp7_string = "Board %s\n" % args[0]
    quad_line = " Quad/Chan :"
    link_line = "      Link :"

    
    print '-'*40
    print 'MP7 muon input conversion script'
    print '-'*40

    #test(8); test(9); test(2); test(10)
    frames = {}

    for i in xrange(72):
        quad = int(i/4)
        channel = i%4
        quad_line += " "+"q{:02}c{}".format(quad, channel).center(10)
        link_line += " "+"{:02}".format(i).center(10)
        frames[i] = []

    quad_line += "\n"
    link_line += "\n"
    # convert this to commandline option together with out file
    infile = open(opts.infile, "r")
    outfile = open(opts.outfile, "w")
    cfg = VHDLConstantsParser.parse_vhdl_file(opts.config)

    newEvt = False
    evts = 0
    counters_tot = {
        "brl" : 0,
        "fwd_pos" : 0,
        "fwd_neg" : 0,
        "ovl_pos" : 0,
        "ovl_neg" : 0,
        "calo": 0
    }
    counters = counters_tot.copy()

    frames_string = ""
    cur_frames = {}
    calo_energies = []
    for i, line in enumerate(infile):
        if line[0] == "#" or len(line.split()) == 0: continue

        if "EVT" in line and newEvt:
            generate_calo_frames(cur_frames, calo_energies)
            frames_string += generate_frames_string(cur_frames, (evts-1)*6)
            if opts.verbose: print_counters("#Muons in evt {}:".format(evts), counters)
            for k in counters.iterkeys():
                counters_tot[k] += counters[k]
            counters = dict.fromkeys(counters.iterkeys(), 0)
            calo_energies = []
            #break
        if "EVT" in line: 
            cur_frames = frames.copy()
            newEvt = True
            evts += 1
            continue

        if "CALO" in line: 
            counters["calo"] += add_energies(calo_energies, line, i)
        else:
            id_, cable, word1, word2, data_format = mu_to_string(line, i)
            offset = determine_offset_count(counters)
        
        cur_frames[cable+offset].append(word1)
        cur_frames[cable+offset].append(word2)  
    
    print '-'*40
    print_counters("Total events processed: {} \nSummary of muons processed:".format(evts), counters_tot)
    print 'Incoming Muon Dataformat:'
    print_dformat(data_format, 0)
    print_dformat(data_format, 1)

    outfile.write(mp7_string+quad_line+link_line+frames_string)
    print "Data blocks were written for board:", args[0]
    print "Read muons from:", opts.infile
    print "Wrote to file:", opts.outfile
    