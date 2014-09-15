import ROOT
from muon import Muon

# non member functions
def get_masked_word(complete_word, bit_low, bit_high): 
    # Create bit mask for bit_low-bit_high
    mask = (1<<(bit_high-bit_low+1)) - 1
    mask = mask<<bit_low
    masked_word = complete_word & mask
    return masked_word>>bit_low

def hist_creator2D(namesdict,hist,xname,yname,title): # xname & yname are strings!
    hist["{yname} gg {xname}".format(xname=xname,yname=yname)] = ROOT.TH2D("{title}".format(title=title),"",
        namesdict[xname][1],namesdict[xname][2],namesdict[xname][3],
        namesdict[yname][1],namesdict[yname][2],namesdict[yname][3])

def plot_modifier(hist,xlabel,ylabel,color):
    hist.GetXaxis().SetTitle("{xlabel}".format(xlabel=xlabel))
    hist.GetYaxis().SetTitle("{ylabel}".format(ylabel=ylabel))
    if color == ROOT.kBlack:
        hist.SetLineColor(color)
    else:
        hist.SetFillColor(color)
        hist.SetLineWidth(0)

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


