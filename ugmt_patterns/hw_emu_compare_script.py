
# pylib:
import os
# ROOT:
import ROOT
# CMSSW:
from DataFormats.FWLite import Events, Handle

# ../tools:
from tools.muon_helpers import  non_zero, isequal, print_out_word
from tools.bithelper import bithlp
from tools.vhdl import VHDLConstantsParser

# ./helpers:
from helpers.muon import Muon 
from helpers.mp7_buffer_parser import InputBufferParser, OutputBufferParser, Version
from helpers.options import parse_options

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
    ROOT.TH1.AddDirectory(False)
    ROOT.gROOT.SetBatch()
    ROOT.gStyle.SetOptStat("ne")
    ROOT.gStyle.SetHistMinimumZero()
    ROOT.gStyle.SetPalette(1)
    canvas = ROOT.TCanvas("canvas_of_plots","comparisons")
    canvas.SetFillStyle(0)

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


    # binning of plots:
    hist_parameters = {
        "qualityBits": ["qualityBits", 16, 0, 16],
        "ptBits": ["ptBits", 128, 0, 512],#(pt_high-pt_low)/pt_unit, pt_low, pt_high],
        "phiBits": ["phiBits", 256, 0, 1024], #(phi_high-phi_low)/phi_unit, phi_low, phi_high],
        "etaBits": ["etaBits", 256, -512, 512] #(eta_high-eta_low)/eta_unit, eta_low, eta_high]
    }

    for filename in file_dict:
        version = Version.from_filename(filename)
        # Reading and initilaising the Emulator data
        emu_out_list = []
        emu_imd_list = []

        events = Events('{f}/{fn}'.format(f=filename, fn=file_dict[filename]["root"]))

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

            add_muons = 8-emu_out_muons.size(0)
            while add_muons != 0:
                mu_tmp = Muon(vhdl_dict, mu_type="OUT", bitword=0)    
                emu_out_list.append(mu_tmp)
                add_muons -= 1

            for j in xrange(imd_prod.size(0)):
                mu = imd_prod.at(0, j)
                mu_tmp = Muon(vhdl_dict, mu_type="OUT", obj=mu)
                emu_imd_list.append(mu_tmp)

            add_muons = 24-imd_prod.size(0)
            while add_muons != 0:
                mu_tmp = Muon(vhdl_dict, mu_type="OUT", bitword=0)    
                emu_imd_list.append(mu_tmp)
                add_muons -= 1
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

        # print "{fn}_in_events :".format(fn=filename), in_events
        print "{fn}_in_muons :".format(fn=filename), non_zero(in_muons), "/", len(in_muons)
        print "{fn}_num of final non-zero Output-Muons: ".format(fn=filename), non_zero(out_muons), "/", len(out_muons)#,"), corresponds to ", len(out_muons)/8," Events"
        print "{fn}_num of intermediate non-zero Output-Muons: ".format(fn=filename), non_zero(intermediate_muons), "/" , len(intermediate_muons)#, "), corresponds to ", len(intermediate_muons)/24," Events" 
        print "{fn}_n_ranks".format(fn=filename), rank_num_of_non_zeros, "/", len(ranks)

        hist1 = ROOT.TH2D("{f}_comparison1".format(f=file_dict[filename]["root"]), "", 64, 0, 64, 8, 1, 9)
        mucnt = -1
        print len(out_muons), len(emu_out_list)
        for mu, emu_mu in zip(out_muons, emu_out_list):
            mucnt += 1
            if mu.bitword == emu_mu.bitword: 
                continue
            for x in xrange(64):
                hw = bithlp.single_bit(mu.bitword, x)
                emu = bithlp.single_bit(emu_mu.bitword, x)
                if hw != emu:
                    hist1.Fill(x, mucnt%8+1)

        hist1.Draw("TEXT COLZ")

        var_list = ["PHI", "ETA", "PT", "QUAL", "ISO", "SYSIGN"]
        bs = []
        for v in var_list:
            low = vhdl_dict[v+"_OUT_LOW"]
            high = (vhdl_dict[v+"_OUT_HIGH"]+1)
            
            b = ROOT.TLine(low, 1, low, 9)
            b.SetLineStyle(2)
            b.SetLineWidth(2)

            b.Draw()
            bs.append(b)
            b = ROOT.TLine(high, 1, high, 9)
            b.SetLineStyle(2)
            b.SetLineWidth(2)
            b.Draw()
            bs.append(b)
        hist1.SetMaximum(1)
        hist1.SetMinimum(-1)
        hist1.SetContour(5)
        hist1.SetStats(0)
        hist1.GetXaxis().SetTitle("Bits")
        for n in xrange(64):
            hist1.GetXaxis().SetBinLabel(n+1,"{n}".format(n=n))
        for n in xrange(8):
            hist1.GetYaxis().SetBinLabel(n+1,"Muon {n}".format(n=n+1))
        canvas.Print("{f}/figures/bitplot1.pdf".format(f=filename))

        hist2 = ROOT.TH2D("{f}_comparison2".format(f=file_dict[filename]["root"]), "", 4, 0, 4, 8, 1, 9)
        mucnt = -1
        for mu, emu_mu in zip(out_muons, emu_out_list):
            mucnt += 1
            if mu.phiBits != emu_mu.phiBits:
                hist2.Fill(0, mucnt%8+1)
            if mu.ptBits != emu_mu.ptBits:
                hist2.Fill(1, mucnt%8+1)
            if mu.qualityBits != emu_mu.qualityBits:
                hist2.Fill(2, mucnt%8+1)
            if mu.etaBits != emu_mu.etaBits:
                hist2.Fill(3, mucnt%8+1)


        hist2.Draw("TEXT COLZ")
        hist2.SetMaximum(1)
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

        print "intermediate muons"
        hist_inter_1 = ROOT.TH2D("{f}_comparison_inter_1".format(f=filename), "comparison of intermediates: all bits [{f}]".format(f=filename), 64, 0, 64, 24, 0, min(len(intermediate_muons), len(emu_imd_list)))
        mucnt = -1
        for emu_mu, hw_mu, hw_rank in zip(emu_imd_list, intermediate_muons, ranks):
            mucnt += 1
            if emu_mu.bitword == hw_mu.bitword: 
                continue
            print "mismatch in BX", hw_mu.bx, "rank hw:", hw_rank, "rank emu:", emu_mu.rank
            for x in xrange(64):
                hw = bithlp.single_bit(hw_mu.bitword, x)
                emu = bithlp.single_bit(emu_mu.bitword, x)
                if hw != emu:
                    hist_inter_1.Fill(x, mucnt%24+1)


        hist_inter_1.Draw("TEXT COLZ")
        hist_inter_1.SetMaximum(1)
        hist_inter_1.SetMinimum(-1)
        hist_inter_1.SetContour(5)
        hist_inter_1.SetStats(0)
        hist_inter_1.GetXaxis().SetTitle("Bits")
        for n in xrange(64):
            hist_inter_1.GetXaxis().SetBinLabel(n+1,"{n}".format(n=n+1))
        for n in xrange(24):
            hist_inter_1.GetYaxis().SetBinLabel(n+1,"Inter-Muon {n}".format(n=n+1))
        canvas.Print("{f}/figures/intermediate_bitplot1.pdf".format(f=filename))

        hist_inter_2 = ROOT.TH2D("{f}_inter_comparison2".format(f=filename), "comparison of intermediate: overview [{f}]".format(f=filename), 4, 0, 4, 24, 1, min(len(intermediate_muons), len(emu_imd_list)))
        mucnt = -1
        for imd_mu, imd_emu_mu in zip(intermediate_muons, emu_imd_list):
            mucnt += 1
            if imd_mu.bitword == imd_emu_mu: 
                continue
            if imd_mu.phiBits != imd_emu_mu.phiBits:
                hist_inter_2.Fill(0, mucnt%24+1)
            if imd_mu.ptBits != imd_emu_mu.ptBits:
                hist_inter_2.Fill(1, mucnt%24+1)
            if imd_mu.qualityBits != imd_emu_mu.qualityBits:
                hist_inter_2.Fill(2, mucnt%24+1)
            if imd_mu.etaBits != imd_emu_mu.etaBits:
                hist_inter_2.Fill(3, mucnt%24+1)


        hist_inter_2.Draw("TEXT COLZ")
        hist_inter_2.SetMaximum(1)
        hist_inter_2.SetMinimum(-1)
        hist_inter_2.SetContour(5)
        hist_inter_2.SetStats(0)
        hist_inter_2.GetXaxis().SetBinLabel(1,"phi")
        hist_inter_2.GetXaxis().SetBinLabel(2,"pt")
        hist_inter_2.GetXaxis().SetBinLabel(3,"quality")
        hist_inter_2.GetXaxis().SetBinLabel(4,"eta")
        for n in xrange(24):
            hist_inter_2.GetYaxis().SetBinLabel(n+1,"Inter-Muon {n}".format(n=n+1))
        canvas.Print("{f}/figures/intermediate_bitplot2.pdf".format(f=filename))