from mp7_buffer_parser import InputBufferParser
from tools.vhdl import VHDLConstantsParser
import ROOT as r
from plot_buffer_content import create_and_fill_hists

from dat_to_mp7_dataformat import print_64word

def nice_print_bits(word, low_bit, high_bit, word_len):
    print_word = bin(word).replace("0b", "")
    print_word = "0"*(word_len-len(print_word))+print_word
    print_mask = "0"*(word_len-high_bit)+"1"*(high_bit-low_bit)+"0"*low_bit
    print "word", print_word
    print "mask", print_mask


vhdl_dict = VHDLConstantsParser.parse_vhdl_file("data/ugmt_constants.vhd")
# input_parser = InputBufferParser("tmp.txt", vhdl_dict)
input_parser = InputBufferParser("data/patterns/mp7/many_events.txt", vhdl_dict)
in_muons = input_parser.get_input_muons()
# for mu in in_muons:
#     print_64word(bin(mu.bitword)[2:])


hist_parameters = {
    "qualityBits": ["qualityBits", 16, 0, 16],
    "ptBits": ["ptBits", 128, 0, 512],#(pt_high-pt_low)/pt_unit, pt_low, pt_high],
    "phiBits": ["phiBits", 1024, 0, 1024], #(phi_high-phi_low)/phi_unit, phi_low, phi_high],
    "etaBits": ["etaBits", 256, -256, 255] #(eta_high-eta_low)/eta_unit, eta_low, eta_high]
}

hists = create_and_fill_hists(hist_parameters, in_muons, "")

cv = r.TCanvas()
for varname, hist in hists.iteritems():
    hist.Draw()
    cv.Print("data/figures/parser_test{var}.pdf".format(var=varname))