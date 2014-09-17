import ROOT
import math
import os
from ROOT import TCanvas, gStyle, gROOT, TLegend, TH1, TLatex
from muon_functions import non_zero
from mp7_buffer_parser import InputBufferParser, OutputBufferParser
from tools.vhdl import VHDLConstantsParser
from tools.TDRStyle import TDRStyle
from optparse import OptionParser

def parse_options():
    parser = OptionParser()
    parser.add_option("-f", "--directory", dest="directory")
    return parser.parse_args()

def create_and_fill_muon_hists(hist_parameters, muon_list, pfix):
    hist_dict = {}
    for var, options in hist_parameters.iteritems():
        hist_dict[var] = ROOT.TH1D(var+"_{pfix}".format(pfix=pfix), "", options[1], options[2], options[3])

    for mu in muon_list:
        # only plot non-zero muons!
        if mu.bitword == 0: continue
        hist_dict["qualityBits"].Fill(mu.qualityBits)
        hist_dict["ptBits"].Fill(mu.ptBits)
        hist_dict["phiBits"].Fill(mu.phiBits)
        hist_dict["etaBits"].Fill(mu.etaBits)
    return hist_dict

def create_and_fill_rank_hist(rank_list, pfix):
    hist = ROOT.TH1D("rank_{pfix}".format(pfix=pfix), "", 512, 0, 512)
    for rnk in rank_list:
        # only plot non-zero muons!
        hist.Fill(rnk)
    return hist

def set_legend_style(legend):
    legend.SetFillColor(ROOT.kWhite)
    legend.SetLineColor(0)
    legend.SetTextFont(42)
    legend.SetTextSize(0.04)
    legend.SetFillStyle(0)
    legend.SetLineStyle(0)
    legend.SetLineWidth(0)
    legend.SetBorderSize(0)

def set_text_style(txt):
    txt.SetNDC()
    txt.SetTextFont(42)
    txt.SetTextSize(0.04)

def plot_modifier(hist, xlabel, ylabel, color, marker_style=None):
    hist.GetXaxis().SetTitle(xlabel)
    hist.GetYaxis().SetTitle(ylabel)
    if not marker_style == None:
        hist.SetMarkerStyle(marker_style)
        hist.SetMarkerColor(color)
    hist.SetLineColor(color)
    if color != ROOT.kBlack:
        hist.SetFillColor(color)


if __name__ == "__main__":
    TDRStyle.initialize()
    TH1.AddDirectory(False)
    pi = math.pi
    gROOT.SetBatch()
    # gStyle.SetOptStat("ne")
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
        "qualityBits": ["qualityBits", 16, -0.5, 15.5],
        "ptBits": ["ptBits", 128, 0, 512],#(pt_high-pt_low)/pt_unit, pt_low, pt_high],
        "phiBits": ["phiBits", 128, 0, 1024], #(phi_high-phi_low)/phi_unit, phi_low, phi_high],
        "etaBits": ["etaBits", 128, -256, 256] #(eta_high-eta_low)/eta_unit, eta_low, eta_high]
    }

    for filename in file_dict:
        print "*"*30, filename, "*"*30
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

        print "{fn}_in_muons :".format(fn=filename), non_zero(in_muons), "/", len(in_muons)
        print "{fn}_num of final non-zero Output-Muons: ".format(fn=filename), non_zero(out_muons), "/", len(out_muons)#,"), corresponds to ", len(out_muons)/8," Events"
        print "{fn}_Output-Muons behind end_frame:"
        print "{fn}_num of intermediate non-zero Output-Muons: ".format(fn=filename), non_zero(intermediate_muons), "/" , len(intermediate_muons)#, "), corresponds to ", len(intermediate_muons)/24," Events" 
        print "{fn}_n_ranks".format(fn=filename), rank_num_of_non_zeros, "/", len(ranks)

        
        hist_rnk = create_and_fill_rank_hist(ranks, file_dict[filename]["rx"])
        plot_modifier(hist_rnk, "rank", "N", ROOT.kBlack)
        hist_rnk.Draw()
        canvas.Print("{f}/figures/hw_rank.pdf".format(f=filename))

        

        hists_input = create_and_fill_muon_hists(hist_parameters, in_muons, file_dict[filename]["rx"]+"in")
        hists_output = create_and_fill_muon_hists(hist_parameters, out_muons, file_dict[filename]["rx"]+"out")
        hists_imd = create_and_fill_muon_hists(hist_parameters, intermediate_muons, file_dict[filename]["rx"]+"imd")

        for var in hist_parameters:
            hw_leg = TLegend(0.4, 0.7, 0.7, 0.85)
            set_legend_style(hw_leg)
            a = hists_input[var].GetBinContent(hists_input[var].GetMaximumBin())
            b = hists_output[var].GetBinContent(hists_output[var].GetMaximumBin())
            c = max(a,b)

            plot_modifier(hists_input[var], hist_parameters[var][0], "N", ROOT.kAzure-4)
            plot_modifier(hists_output[var], hist_parameters[var][0], "N", ROOT.kBlack, 20)
            plot_modifier(hists_imd[var], hist_parameters[var][0], "N", ROOT.kBlack)
            hists_imd[var].SetFillStyle(0)
            hists_imd[var].SetLineStyle(2)

            hists_input[var].GetYaxis().SetRangeUser(0, 1.1*c)
            hists_input[var].GetYaxis().SetTitle("N")
            
            txt = TLatex(0.48, 0.87, "N input events: {n}".format(n=input_parser.get_n_valid()/6))
            set_text_style(txt)
            
            hw_leg.AddEntry(hists_input[var], "RX content (N={tot})".format(tot=hists_input[var].Integral()), "f")
            hw_leg.AddEntry(hists_imd[var], "TX: intermediate (N={tot})".format(tot=hists_imd[var].Integral()), "f")
            hw_leg.AddEntry(hists_output[var], "TX: final (N={tot})".format(tot=hists_output[var].Integral()), "P")

            hists_input[var].Draw()
            hists_output[var].Draw("textPsame")
            hw_leg.Draw()
            hists_imd[var].Draw("same")

            txt.Draw()
            canvas.Print("{f}/figures/hw_{name}.pdf".format(f=filename, name=hist_parameters[var][0]))
        print "*"*100