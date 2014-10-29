import ROOT
import math
import os
from ROOT import TCanvas, gStyle, gROOT, TLegend, TH1, TLatex
from mp7_buffer_parser import InputBufferParser, OutputBufferParser
from tools.vhdl import VHDLConstantsParser
from DataFormats.FWLite import Events, Handle
from muon import Muon
from tools.TDRStyle import TDRStyle
from tools.muon_helpers import non_zero, print_out_word
from plot_buffer_content import determine_version_from_filename, set_legend_style, create_and_fill_rank_hist, create_and_fill_muon_hists, parse_options, set_text_style, plot_modifier


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

    file_dict = {}

    for roots, dirs, files in os.walk("{d}".format(d=options.directory)):
        tmp_dict = {}
        for fname in files:
            if "tx_" in fname:
                tmp_dict["tx"] = fname
            if "rx_" in fname:
                tmp_dict["rx"] = fname
            if ".root" in fname:
                tmp_dict["root"] = fname
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
    	version = determine_version_from_filename(filename)
        print "+"*30, filename, "+"*30


        emu_out_list = []
        emu_imd_list = []

        events = Events('{f}/{fn}'.format(f=filename, fn=file_dict[filename]["root"]))
        print "using .root:", file_dict[filename]["root"]
        out_handle = Handle('BXVector<l1t::Muon>')
        bar_handle = Handle('std::vector<l1t::L1TRegionalMuonCandidate>')
        fwd_handle = Handle('std::vector<l1t::L1TRegionalMuonCandidate>')
        ovl_handle = Handle('std::vector<l1t::L1TRegionalMuonCandidate>')
        imd_handle = Handle('BXVector<l1t::Muon>')

        for i, event in enumerate(events):
            event.getByLabel("microGMTEmulator", out_handle)
            event.getByLabel("uGMTInputProducer", "BarrelTFMuons", bar_handle)
            event.getByLabel("uGMTInputProducer", "ForwardTFMuons", fwd_handle)
            event.getByLabel("uGMTInputProducer", "OverlapTFMuons", ovl_handle)
            event.getByLabel("microGMTEmulator", "intermediateMuons", imd_handle)

            emu_out_muons = out_handle.product()
            emu_bar_muons = bar_handle.product()
            emu_ovl_muons = ovl_handle.product()
            emu_fwd_muons = fwd_handle.product()
            imd_prod = imd_handle.product()

            for j in xrange(emu_out_muons.size(0)):
                mu = emu_out_muons.at(0, j)
                mu_tmp = Muon(vhdl_dict, mu_type="OUT", obj=mu)
                emu_out_list.append(mu_tmp)

            for j in xrange(imd_prod.size(0)):
                mu = imd_prod.at(0, j)
                mu_tmp = Muon(vhdl_dict, mu_type="IN", obj=mu)
                emu_imd_list.append(mu_tmp)

        print "total number of events in emulator: ", i
        # Reading and processing the hardware data
        input_parser = InputBufferParser("{f}/{fn}".format(f=filename, fn=file_dict[filename]["rx"]), vhdl_dict)
        output_parser = OutputBufferParser("{f}/{fn}".format(f=filename, fn=file_dict[filename]["tx"]), vhdl_dict, version)

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
        print "{fn}_num of intermediate non-zero Output-Muons: ".format(fn=filename), non_zero(intermediate_muons), "/" , len(intermediate_muons)#, "), corresponds to ", len(intermediate_muons)/24," Events" 
        print "{fn}_n_ranks".format(fn=filename), rank_num_of_non_zeros, "/", len(ranks)

        hist_rnk = create_and_fill_rank_hist(ranks, file_dict[filename]["rx"])
        plot_modifier(hist_rnk, "rank", "N", ROOT.kBlack)
        hist_rnk.Draw()
        canvas.Print("{f}/figures/hw_rank.pdf".format(f=filename))

        

        hists_input = create_and_fill_muon_hists(hist_parameters, in_muons, file_dict[filename]["rx"]+"in")
        hists_output = create_and_fill_muon_hists(hist_parameters, out_muons, file_dict[filename]["rx"]+"out")
        hists_imd = create_and_fill_muon_hists(hist_parameters, intermediate_muons, file_dict[filename]["rx"]+"imd")
        
        hists_emu_output = create_and_fill_muon_hists(hist_parameters, emu_out_list, file_dict[filename]["rx"]+"emuout")
        hists_emu_imd = create_and_fill_muon_hists(hist_parameters, emu_imd_list, file_dict[filename]["rx"]+"emuimd")

        for var in hist_parameters:
            hw_leg = TLegend(0.4, 0.7, 0.7, 0.85)
            set_legend_style(hw_leg)
            a = hists_input[var].GetBinContent(hists_input[var].GetMaximumBin())
            b = hists_output[var].GetBinContent(hists_output[var].GetMaximumBin())
            c = max(a,b)

            plot_modifier(hists_input[var], hist_parameters[var][0], "N", ROOT.kAzure-4)
            plot_modifier(hists_output[var], hist_parameters[var][0], "N", ROOT.kBlack, 20)
            plot_modifier(hists_imd[var], hist_parameters[var][0], "N", ROOT.kBlack)
            
            plot_modifier(hists_emu_output[var], hist_parameters[var][0], "N", ROOT.kBlue, 22)
            plot_modifier(hists_emu_imd[var], hist_parameters[var][0], "N", ROOT.kBlue)

            hists_imd[var].SetFillStyle(0)
            hists_imd[var].SetLineStyle(1)

            hists_emu_imd[var].SetFillStyle(0)
            hists_emu_imd[var].SetLineStyle(2)



            hists_input[var].GetYaxis().SetRangeUser(0, 1.1*c)
            hists_input[var].GetYaxis().SetTitle("N")
            
            txt = TLatex(0.48, 0.87, "N input events: {n}".format(n=input_parser.get_n_valid()/6))
            set_text_style(txt)
            
            hw_leg.AddEntry(hists_input[var], "RX content (N={tot})".format(tot=hists_input[var].Integral()), "f")
            hw_leg.AddEntry(hists_imd[var], "TX: intermediate (N={tot})".format(tot=hists_imd[var].Integral()), "f")
            hw_leg.AddEntry(hists_output[var], "TX: final (N={tot})".format(tot=hists_output[var].Integral()), "P")
            hw_leg.AddEntry(hists_emu_imd[var], "EMU: intermediate (N={tot})".format(tot=hists_emu_imd[var].Integral()), "f")
            hw_leg.AddEntry(hists_emu_output[var], "EMU: final (N={tot})".format(tot=hists_emu_output[var].Integral()), "P")
            hists_input[var].Draw()
            hists_output[var].Draw("textPsame")
            hists_emu_output[var].Draw("textPsame")
            hw_leg.Draw()
            hists_imd[var].Draw("same")
            hists_emu_imd[var].Draw("same")

            txt.Draw()
            canvas.Print("{f}/figures/hw_{name}.pdf".format(f=filename, name=hist_parameters[var][0]))
