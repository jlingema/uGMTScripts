# import ROOT
from bithelper import bithlp

# non member functions
def get_masked_word(complete_word, bit_low, bit_high):
    # Create bit mask for bit_low-bit_high
    mask = (1<<(bit_high-bit_low+1)) - 1
    mask = mask<<bit_low
    masked_word = complete_word & mask
    return masked_word>>bit_low

# def hist_creator2D(namesdict,hist,xname,yname,title): # xname & yname are strings!
#     hist["{yname} gg {xname}".format(xname=xname,yname=yname)] = ROOT.TH2D("{title}".format(title=title),"",
#         namesdict[xname][1],namesdict[xname][2],namesdict[xname][3],
#         namesdict[yname][1],namesdict[yname][2],namesdict[yname][3])

def isequal(a,b): # gives 1 if a==b and 0 otherwise
    x = int(a)^int(b)
    if x==0 or x==1:
        return x
    else:
        return 1

def single_bit(num,bit): # Gets one single bit defined by num
    a = 1<<bit
    b = num&a
    return b >> bit

def num_of_ones(x): # returns num of ones in a bitword...not very elegant, works only for positive numbers!
    return bin(x).count("1")

def non_zero(muon_objs): # counts how many obj in an array are !=0
    counter = 0
    for muon in muon_objs:
        if muon.bitword != 0:
            counter += 1
    return counter

def print_in_word(w, show_legend = False):
    pt_pre = '\x1b[31;01m'
    q_pre = '\x1b[32;01m'
    sys_pre = '\x1b[33;01m'
    eta_pre = '\x1b[35;01m'
    phi_pre = '\x1b[36;01m'
    add_pre = '\x1b[34;01m'
    reset = '\x1b[39;49;00m'
    print_w = bin(w)[2:]
    print_w = "0"*(64-len(print_w))+print_w
    # pretty_print_w =  print_w[0] + add_pre + print_w[1:28] + phi_pre + print_w[28:32] + reset + print_w[32] + phi_pre + print_w[33:39]+ sys_pre + print_w[39:41] + reset + print_w[41] + eta_pre + print_w[42:51] + q_pre + print_w[51:55] + pt_pre + print_w[55:] + reset
    pretty_print_w =  print_w[0] + add_pre + print_w[1:30] + sys_pre + print_w[30:32] + reset + print_w[32] + phi_pre + print_w[33:41] + reset + print_w[41] + eta_pre + print_w[42:51] + q_pre + print_w[51:55] + pt_pre + print_w[55:] + reset
    if show_legend:
        print  add_pre + "add" + phi_pre + "phi" + sys_pre + "sys" + eta_pre + "eta" + q_pre + "q"+ pt_pre + "pt"+ reset
    return pretty_print_w


def print_out_word(w, show_legend = False, print_dec = False, print_bin = True):
    pt_pre = '\t\x1b[31;01m'
    q_pre = '\t\x1b[32;01m'
    sys_pre = '\t\x1b[33;01m'
    eta_pre = '\t\x1b[35;01m'
    phi_pre = '\t\x1b[36;01m'
    iso_pre = '\t\x1b[34;01m'
    reset = '\x1b[39;49;00m'
    if print_bin:
        print_w = bin(w)[2:]
        print_w = "0"*(64-len(print_w))+print_w
        pretty_print_w =  print_w[:28] + sys_pre + print_w[28:30] + iso_pre + print_w[30:32] + eta_pre + print_w[32:41] + q_pre + print_w[41:45] + pt_pre + print_w[45:54] + phi_pre + print_w[54:] + reset
    if print_dec:
        print_w = bin(w)[2:]
        print_w = "0"*(64-len(print_w))+print_w
        if print_bin:
            pretty_print_w += "\n"
        else:
            pretty_print_w = ""
        signed_eta = bithlp.twos_complement_to_signed(int(print_w[32:41], 2), len(print_w[32:41]))
        pretty_print_w += str(int(print_w[:28], 2)) + sys_pre + print_w[28:30] + iso_pre + print_w[30:32] + eta_pre + str(signed_eta) + q_pre + str(int(print_w[41:45], 2)) + pt_pre + str(int(print_w[45:54], 2)) + phi_pre + str(int(print_w[54:], 2)) + reset
    if show_legend:
        print  "address" + sys_pre + "sys" + iso_pre + "iso" + eta_pre + "eta" + q_pre + "q" + pt_pre + "pt" + phi_pre + "phi" + reset
    return pretty_print_w
