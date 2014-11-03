import ROOT
import math
import os
from ROOT import TCanvas, gStyle, gROOT, TLegend, TH1, TLatex
from helpers.mp7_buffer_parser import InputBufferParser, OutputBufferParser, Version
from tools.vhdl import VHDLConstantsParser
from tools.TDRStyle import TDRStyle
from tools.muon_helpers import print_in_word, non_zero
from helpers.options import parse_options
from helpers.buffer_plotting import create_and_fill_rank_hist, plot_modifier, create_and_fill_muon_hists, set_legend_style, set_text_style
from tools.logger import log
from logging import  INFO


if __name__ == "__main__":
    TDRStyle.initialize()
    TH1.AddDirectory(False)
    pi = math.pi
    gROOT.SetBatch()
    # gStyle.SetOptStat("ne")
    gStyle.SetHistMinimumZero()
    gStyle.SetPalette(1)
    canvas = TCanvas("canvas_of_plots","comparisons")
    canvas.SetFillStyle(0)

    vhdl_dict = VHDLConstantsParser.parse_vhdl_file("data/ugmt_constants.vhd")

    options, args = parse_options()

    _log = None
    if options.verbose:
        _log = log.init_logging("BufferAnalyzer")
    else:
        _log = log.init_logging("BufferAnalyzer", INFO)

    file_dict = {}

    for roots, dirs, files in os.walk(options.directory):
        if "random" in roots: 
            continue
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
        version = Version.from_filename(filename)
        print "+"*30, filename, "+"*30
        # Reading and processing the hardware data
        input_parser = InputBufferParser("{f}/{fn}".format(f=filename, fn=file_dict[filename]["rx"]), vhdl_dict)
        output_parser = OutputBufferParser("{f}/{fn}".format(f=filename, fn=file_dict[filename]["tx"]), vhdl_dict, version)

        in_muons = input_parser.get_input_muons()

        for mu in in_muons:
            if mu.bitword != 0:
                if mu.qualityBits == 2:
                    _log.debug(print_in_word(mu.bitword))
                    _log.debug(hex(mu.bitword))
        out_muons = output_parser.get_output_muons()
        intermediate_muons = output_parser.get_intermediate_muons()
        ranks = output_parser.get_ranks()
        #### here the number of nonzero ranks is counted
        rank_num_of_non_zeros = 0
        for i in xrange(len(ranks)):
            if ranks[i]!=0:
                rank_num_of_non_zeros = rank_num_of_non_zeros+1
        ####

        _log.info("in_muons : {nz} / {all}".format(nz=non_zero(in_muons), all=len(in_muons)))
        _log.info("num of final non-zero Output-Muons: {nz} / {all}".format(nz=non_zero(out_muons), all=len(out_muons)))#,"), corresponds to ", len(out_muons)/8," Events")
        _log.info("num of intermediate non-zero Output-Muons: {nz} / {all}".format(nz=non_zero(intermediate_muons), all=len(intermediate_muons)))#, "), corresponds to ", len(intermediate_muons)/24," Events" )
        _log.info("n_ranks {nz} / {all}".format(nz=rank_num_of_non_zeros, all=len(ranks)))

        cntr = 0
        while cntr < len(out_muons)+1:
            event = cntr/8
            if non_zero(out_muons[cntr:cntr+8]) == 0:
                for mu in in_muons[event*108:(event+1)*108]:
                    if mu.bitword != 0:
                        _log.debug("input-link, frame: {l}, {fr}".format(l=mu.link, fr=mu.frame))
                        #print "imd: ", non_zero(intermediate_muons[event*24:(event+1)*24])
            else: # do some sorting analysis
                _log.debug("-"*10+"sorting analysis BX"+str(event)+"-"*10)
                _log.debug("-- final muons: --")
                for out_mu in out_muons[cntr:cntr+8]:
                    _log.debug("out rank (pT+Q): {r}".format(r=out_mu.ptBits+out_mu.qualityBits))
                _log.debug("-- inter muons: --")
                for i, imd_mu in enumerate(intermediate_muons[event*24:(event+1)*24]):
                    if i == 0: _log.debug("-"*5+"EMTF-")
                    if i == 4: _log.debug("-"*5+"EMTF+")
                    if i == 8: _log.debug("-"*5+"OMTF-")
                    if i == 12: _log.debug("-"*5+"OMTF+")
                    if i == 16: _log.debug("-"*5+"BMTF")
                    _log.debug("imd rank (pT+Q): {r} ({pt}+{q}={calc})".format(r=ranks[event*24+i], pt=imd_mu.ptBits, q=imd_mu.qualityBits, calc=imd_mu.ptBits+imd_mu.qualityBits))
                    
            cntr += 8




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
