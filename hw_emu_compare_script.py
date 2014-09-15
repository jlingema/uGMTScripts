import ROOT
import math
import os
from ROOT import TCanvas, gStyle, gROOT, TH2D, TH1
from DataFormats.FWLite import Events, Handle
from muon import Muon 
from muon_functions import  non_zero, single_bit, isequal
#file_converter, plot_modifier, find_nonzero_output, input_frames, get_rank_list, single_bit, isequal, get_muon_objects, non_zero
from mp7_buffer_parser import InputBufferParser, OutputBufferParser
from tools.vhdl import VHDLConstantsParser
from optparse import OptionParser

def parse_options():
    parser = OptionParser()
    parser.add_option("-f", "--directory", dest="directory")
    return parser.parse_args()

def fill_muon_hists(index, hist_list, muons):
    for mu in muons:
        hist_list[index][0]["phiBits"].Fill(mu.phiBits)
        hist_list[index][0]["ptBits"].Fill(mu.ptBits)
        hist_list[index][0]["qualityBits"].Fill(mu.qualityBits)
        hist_list[index][0]["etaBits"].Fill(mu.etaBits)


def hist_creator1D(namesdict,hist,title):
    for varname, hist_property in namesdict.iteritems():
        hist[varname] = ROOT.TH1D(varname+"{title}".format(title=title), "", hist_property[1], hist_property[2], hist_property[3])
        hist[varname].SetXTitle(hist_property[0])

if __name__ == "__main__":
    TH1.AddDirectory(False)
    pi = math.pi
    gROOT.SetBatch()
    gStyle.SetOptStat("ne")
    gStyle.SetHistMinimumZero()
    gStyle.SetPalette(1)
    canvas = TCanvas("canvas_of_plots","comparisons")

    vhdl_dict = VHDLConstantsParser.parse_vhdl_file("data/ugmt_constants.vhd")

    options, args = parse_options()

    file_dict = {}

    for roots, dirs, files in os.walk("{d}".format(d=options.directory)):
        tmp_dict = {}
        for fname in files:
            if "tx_" in fname:
                tmp_dict["tx"] = fname
            if ".root" in fname:
                tmp_dict["root"] = fname
            if "rx_" in fname:
                tmp_dict["rx"] = fname
        if tmp_dict != {}: 
            file_dict[roots] = tmp_dict

    ##### if the physical properties should be calculated, then the functions phi, eta and pt just have to be discommented. Doing this, the following parameters are their input.
    ##### They dont have any other use
    eta_unit = 0.01
    eta_low = -240
    eta_high = 239
    phi_unit = 2*pi/576
    phi_low = 0
    phi_high = 57
    pt_unit = 0.5
    pt_low = 0
    pt_high = 280
    ####

    #### Parameters for histograms may be changed here at any time
    hist_parameters = {
        "qualityBits": ["qualityBits", 16, 0, 16],
        "ptBits": ["ptBits", 128, 0, 512],#(pt_high-pt_low)/pt_unit, pt_low, pt_high],
        "phiBits": ["phiBits", 256, 0, 1024], #(phi_high-phi_low)/phi_unit, phi_low, phi_high],
        "etaBits": ["etaBits", 256, -512, 512] #(eta_high-eta_low)/eta_unit, eta_low, eta_high]
    }

    for filename in file_dict:
        # Reading and initilaising the Emulator data
        emu_out_list = []
        emu_imd_list = []

        events = Events('{f}/{fn}'.format(f=filename, fn=file_dict[filename]["root"]))

        out_handle = Handle('std::vector<GMTMuonCandidate>')
        bar_handle = Handle('std::vector<GMTInputMuon>')
        fwd_handle = Handle('std::vector<GMTInputMuon>')
        ovl_handle = Handle('std::vector<GMTInputMuon>')
        imd_handle = Handle('std::vector<GMTMuonCandidate>')

        for i, event in enumerate(events):
            event.getByLabel("microGMTEmulator", out_handle)
            event.getByLabel("microGMTInputProducer", "BarrelTFMuons", bar_handle)
            event.getByLabel("microGMTInputProducer", "ForwardTFMuons", fwd_handle)
            event.getByLabel("microGMTInputProducer", "OverlapTFMuons", ovl_handle)
            event.getByLabel("microGMTEmulator", "intermediateMuons", imd_handle)

            emu_out_muons = out_handle.product()
            emu_bar_muons = bar_handle.product()
            emu_ovl_muons = ovl_handle.product()
            emu_fwd_muons = fwd_handle.product()
            imd_prod = imd_handle.product()

            for mu in emu_out_muons:
                mu_tmp = Muon(vhdl_dict, mu_type="OUT", obj=mu)
                emu_out_list.append(mu_tmp)

            for mu in imd_prod:
                mu_tmp = Muon(vhdl_dict, mu_type="IN", obj=mu)
                emu_imd_list.append(mu_tmp)

        # Reading and processing the hardware data
        input_parser = InputBufferParser("{f}/{fn}".format(f=filename, fn=file_dict[filename]["rx"]), vhdl_dict)
        output_parser = OutputBufferParser("{f}/{fn}".format(f=filename, fn=file_dict[filename]["tx"]), vhdl_dict)

        in_muons = input_parser.get_input_muons()
        out_muons = output_parser.get_output_muons()
        intermediate_muons = output_parser.get_intermediate_muons()
        ranks = output_parser.get_ranks()

        #### here the number of nonzero ranks is counted
        rank_num_of_non_zeros = 0
        for i in xrange(len(ranks)):
            if ranks[i]!=0:
                rank_num_of_non_zeros = rank_num_of_non_zeros+1
        ####

        # print "{fn}_in_events :".format(fn=filename), in_events
        print "{fn}_in_muons :".format(fn=filename), non_zero(in_muons), "/", len(in_muons)
        print "{fn}_num of final non-zero Output-Muons: ".format(fn=filename), non_zero(out_muons), "/", len(out_muons)#,"), corresponds to ", len(out_muons)/8," Events"
        print "{fn}_num of intermediate non-zero Output-Muons: ".format(fn=filename), non_zero(intermediate_muons), "/" , len(intermediate_muons)#, "), corresponds to ", len(intermediate_muons)/24," Events" 
        print "{fn}_n_ranks".format(fn=filename), rank_num_of_non_zeros, "/", len(ranks)


        #if len(out_muons) != len(emu_out_list): ### prints a warning if hardware- and Emulator-output have an unequal number of events
        #   print "Attention : Unequal number of Output- and Emulatormuons being compared! [occured at pattern {f}]".format(f=filename)
        #   print "len(out_muons) = ", len(out_muons), ", corresponds to ", len(out_muons)/8, " events"
        #   print "len(emu_out_list) = ", len(emu_out_list), ", corresponds to ", len(emu_out_list)/8, " events"

        hist1 = TH2D("{f}_comparison1".format(f=filename),"comparison of hardware: all bits [{f}]".format(f=filename),64,0,64,8,1,min(len(out_muons),len(emu_out_list)))
        for y in xrange(min(len(out_muons),len(emu_out_list))):
            for x in xrange(64):
                hw = single_bit(out_muons[y].bitword,x)
                emu = single_bit(emu_out_list[y].bitword,x)
                hist1.Fill(x,(y+1)*isequal(hw, emu))

        hist1.Draw("TEXT COLZ")
        hist1.SetMaximum(90)
        hist1.SetMinimum(-1)
        hist1.SetContour(5)
        hist1.SetStats(0)
        hist1.GetXaxis().SetTitle("Bits")
        for n in xrange(64):
            hist1.GetXaxis().SetBinLabel(n+1,"{n}".format(n=n+1))
        for n in xrange(8):
            hist1.GetYaxis().SetBinLabel(n+1,"Muon {n}".format(n=n+1))
        canvas.Print("{f}/figures/bitplot1.pdf".format(f=filename))

        hist2 = TH2D("{f}_comparison2".format(f=filename),"comparison of hardware: overview [{f}]".format(f=filename),4,0,4,8,1,min(len(out_muons),len(emu_out_list)))
        for y in xrange(min(len(out_muons),len(emu_out_list))):
            hist2.Fill(0,(y+1)*isequal(out_muons[y].phiBits, emu_out_list[y].phiBits))
            hist2.Fill(1,(y+1)*isequal(out_muons[y].ptBits,emu_out_list[y].ptBits))
            hist2.Fill(2,(y+1)*isequal(out_muons[y].qualityBits,emu_out_list[y].qualityBits))
            hist2.Fill(3,(y+1)*isequal(out_muons[y].etaBits,emu_out_list[y].etaBits))
            #hist2.Fill(3,(y+1)*isequal(twos_complement_sign(out_muons[y].etaBits,9),emu_out_list[y].etaBits()))  ### for mistakes on purpose

        hist2.Draw("TEXT COLZ")
        hist2.SetMaximum(90)
        hist2.SetMinimum(-1)
        hist2.SetContour(5)
        hist2.SetStats(0)
        hist2.GetXaxis().SetBinLabel(1,"phiBits")
        hist2.GetXaxis().SetBinLabel(2,"ptBits")
        hist2.GetXaxis().SetBinLabel(3,"qualityBits")
        hist2.GetXaxis().SetBinLabel(4,"etaBits")
        for n in xrange(8):
            hist2.GetYaxis().SetBinLabel(n+1,"Muon {n}".format(n=n+1))
        canvas.Print("{f}/figures/bitplot2.pdf".format(f=filename))

        hist_inter_1 = TH2D("{f}_comparison_inter_1".format(f=filename), "comparison of intermediates: all bits [{f}]".format(f=filename), 64, 0, 64, 24, 0, min(len(intermediate_muons), len(emu_imd_list)))
        for y in xrange(min(len(intermediate_muons), len(emu_imd_list))):
            for x in xrange(64):
                hw = single_bit(intermediate_muons[y].bitword, x)
                emu = single_bit(emu_imd_list[y].bitword, x)
                hist_inter_1.Fill(x, (y+1)*isequal(hw, emu))

        hist_inter_1.Draw("TEXT COLZ")
        hist_inter_1.SetMaximum(90)
        hist_inter_1.SetMinimum(-1)
        hist_inter_1.SetContour(5)
        hist_inter_1.SetStats(0)
        hist_inter_1.GetXaxis().SetTitle("Bits")
        for n in xrange(64):
            hist_inter_1.GetXaxis().SetBinLabel(n+1,"{n}".format(n=n+1))
        for n in xrange(24):
            hist_inter_1.GetYaxis().SetBinLabel(n+1,"Inter-Muon {n}".format(n=n+1))
        canvas.Print("{f}/figures/intermediate_bitplot1.pdf".format(f=filename))

        hist_inter_2 = TH2D("{f}_inter_comparison2".format(f=filename), "comparison of intermediate: overview [{f}]".format(f=filename), 4, 0, 4, 24, 1, min(len(intermediate_muons), len(emu_imd_list)))
        for y in xrange(min(len(intermediate_muons), len(emu_imd_list))):
            hist_inter_2.Fill(0,(y+1)*isequal(intermediate_muons[y].phiBits,emu_imd_list[y].phiBits))
            hist_inter_2.Fill(1,(y+1)*isequal(intermediate_muons[y].ptBits,emu_imd_list[y].ptBits))
            hist_inter_2.Fill(2,(y+1)*isequal(intermediate_muons[y].qualityBits,emu_imd_list[y].qualityBits))
            hist_inter_2.Fill(3,(y+1)*isequal(intermediate_muons[y].etaBits,emu_imd_list[y].etaBits))

        hist_inter_2.Draw("TEXT COLZ")
        hist_inter_2.SetMaximum(90)
        hist_inter_2.SetMinimum(-1)
        hist_inter_2.SetContour(5)
        hist_inter_2.SetStats(0)
        hist_inter_2.GetXaxis().SetBinLabel(1,"phiBits")
        hist_inter_2.GetXaxis().SetBinLabel(2,"ptBits")
        hist_inter_2.GetXaxis().SetBinLabel(3,"qualityBits")
        hist_inter_2.GetXaxis().SetBinLabel(4,"etaBits")
        for n in xrange(8):
            hist_inter_2.GetYaxis().SetBinLabel(n+1,"Inter-Muon {n}".format(n=n+1))
        canvas.Print("{f}/figures/intermediate_bitplot2.pdf".format(f=filename))
