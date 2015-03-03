import os

# ROOT:
import ROOT

# ../tools:
from tools.muon_helpers import  non_zero, isequal, print_out_word
from tools.bithelper import bithlp
from tools.vhdl import VHDLConstantsParser
from tools.logger import log

# ./helpers:
from helpers.mp7_buffer_parser import InputBufferParser, OutputBufferParser, Version
from helpers.options import parse_options, discover_files
from gt_dump_analyser import get_gt_muons

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
    _log = log.init_logging("main")

    vhdl_dict = VHDLConstantsParser.parse_vhdl_file("data/ugmt_constants.vhd")

    options = parse_options()

    file_dict = discover_files(options)

    # binning of plots:
    hist_parameters = {
        "qualityBits": ["qualityBits", 16, 0, 16],
        "ptBits": ["ptBits", 128, 0, 512],#(pt_high-pt_low)/pt_unit, pt_low, pt_high],
        "phiBits": ["phiBits", 256, 0, 1024], #(phi_high-phi_low)/phi_unit, phi_low, phi_high],
        "etaBits": ["etaBits", 256, -512, 512] #(eta_high-eta_low)/eta_unit, eta_low, eta_high]
    }
    phys_patterns = ["ZMM", "WM", "TTbar", "MinBias", "SingleMuPt100"]


    for pattern, fnames in file_dict.iteritems():
        _log.info("{patt:+^90}".format(patt=pattern))
        version = Version.from_filename(fnames['tx'])
        emu_version = Version("99_99_99") # so workarounds are not applied for this
        # Reading and initilaising the Emulator data
        emu_out_list = []
        emu_imd_list = []

        # Reading and processing the hardware data
        print "--- Emulator parsing:"
        emu_output_parser = OutputBufferParser(fnames["emu_tx"], vhdl_dict, emu_version)
        emu_out_list = emu_output_parser.get_output_muons()
        emu_imd_list = emu_output_parser.get_intermediate_muons()

        # Reading and processing the hardware data
        print "--- HW parsing:"
        input_parser = InputBufferParser(fnames["rx"], vhdl_dict)
        output_parser = OutputBufferParser(fnames["tx"], vhdl_dict, version)
        skip = 0
        if pattern in phys_patterns:
            skip = 60
        in_muons = input_parser.get_input_muons()
        out_muons = output_parser.get_output_muons(skip)

        if pattern in phys_patterns:
            _log.info("Dropping the last {n} muons from the emulator".format(n=len(emu_out_list)-len(out_muons)))
            if len(out_muons) != len(emu_out_list)-(6*8): print "UUUuuups: that seems fishy!"
            del emu_out_list[len(out_muons):]
        
        if not options.nodebug:
            intermediate_muons = output_parser.get_intermediate_muons()
            ranks = output_parser.get_ranks()

            rank_num_of_non_zeros = 0
            for i in xrange(len(ranks)):
                if ranks[i]!=0:
                    rank_num_of_non_zeros = rank_num_of_non_zeros+1
            if pattern in phys_patterns:
                del emu_imd_list[len(intermediate_muons):]

        gt_muons = []
        if options.gtdumps != "":
            _log.info("{info:>90}".format(info="GT PARSING"))
            nbx = 158
            if pattern == "FakeMuons":
                nbx = 91
            gt_fname = os.path.join(options.gtdumps, "spy1-test-out_{patt}.dat".format(patt=pattern))
            if os.path.isfile(gt_fname):
                gt_muons = get_gt_muons(gt_fname, options.gtoffset, nbx, vhdl_dict)
            else:
                _log.debug("Could not find GT pattern")


        print "{fn}_in_muons :".format(fn=pattern), non_zero(in_muons), "/", len(in_muons)
        print "{fn}_num of final non-zero Output-Muons: ".format(fn=pattern), non_zero(out_muons), "/", len(out_muons)#,"), corresponds to ", len(out_muons)/8," Events"
        if not options.nodebug:
            print "{fn}_num of intermediate non-zero Output-Muons: ".format(fn=pattern), non_zero(intermediate_muons), "/" , len(intermediate_muons)#, "), corresponds to ", len(intermediate_muons)/24," Events" 
            print "{fn}_n_ranks".format(fn=pattern), rank_num_of_non_zeros, "/", len(ranks)

        h2_emu_vs_gmt = ROOT.TH2D("{f}_comparison1".format(f=pattern), "", 64, 0, 64, 8, 1, 9)
        mucnt = -1
        
        if len(out_muons) != len(emu_out_list):
            print "UUuuups... not the same number of output muons!"

        for mu, emu_mu in zip(out_muons, emu_out_list):
            mucnt += 1
            if mu.bitword == emu_mu.bitword: 
                continue
            for x in xrange(64):
                hw = bithlp.single_bit(mu.bitword, x)
                emu = bithlp.single_bit(emu_mu.bitword, x)
                if hw != emu:
                    h2_emu_vs_gmt.Fill(x, mucnt%8+1)
        h2_emu_vs_gmt.Draw("TEXT COLZ")    

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
        h2_emu_vs_gmt.SetMaximum(1)
        h2_emu_vs_gmt.SetMinimum(-1)
        h2_emu_vs_gmt.SetContour(5)
        h2_emu_vs_gmt.SetStats(0)
        h2_emu_vs_gmt.GetXaxis().SetTitle("Bits")
        for n in xrange(64):
            h2_emu_vs_gmt.GetXaxis().SetBinLabel(n+1,"{n}".format(n=n))
        for n in xrange(8):
            h2_emu_vs_gmt.GetYaxis().SetBinLabel(n+1,"Muon {n}".format(n=n+1))
        
        canvas.Print("{f}/figures/bitword_emu_vs_gmt.pdf".format(f=fnames['base']))
        
        if gt_muons:
            h2_emu_vs_gt = ROOT.TH2D("{f}_comparison_gt".format(f=pattern), "", 64, 0, 64, 8, 1, 9)
            mucnt = -1
            for gt_mu, mu in zip(gt_muons, emu_out_list):
                mucnt += 1
                if mu.bitword == emu_mu.bitword: 
                    continue
                for x in xrange(64):
                    hw = bithlp.single_bit(gt_mu.bitword, x)
                    emu = bithlp.single_bit(mu.bitword, x)
                    if hw != emu:
                        h2_emu_vs_gt.Fill(x, mucnt%8+1)
            h2_emu_vs_gt.SetMaximum(1)
            h2_emu_vs_gt.SetMinimum(-1)
            h2_emu_vs_gt.SetContour(5)
            h2_emu_vs_gt.SetStats(0)
            h2_emu_vs_gt.GetXaxis().SetTitle("Bits")
            for n in xrange(64):
                h2_emu_vs_gt.GetXaxis().SetBinLabel(n+1,"{n}".format(n=n))
            for n in xrange(8):
                h2_emu_vs_gt.GetYaxis().SetBinLabel(n+1,"Muon {n}".format(n=n+1))
            
            h2_emu_vs_gt.Draw("TEXT COLZ")
            for b in bs: b.Draw()
            canvas.Print("{f}/figures/bitword_emu_vs_gt.pdf".format(f=fnames['base']))

        hist2 = ROOT.TH2D(pattern+"_comparison2", "", 4, 0, 4, 8, 1, 9)
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
        canvas.Print("{f}/figures/quantities_emu_vs_gmt.pdf".format(f=fnames['base']))

        if not options.nodebug:
            hist_inter_1 = ROOT.TH2D("{f}_comparison_inter_1".format(f=pattern), "comparison of intermediates: all bits [{f}]".format(f=pattern), 64, 0, 64, 24, 0, min(len(intermediate_muons), len(emu_imd_list)))
            mucnt = -1

            # non_zero_ranks = [rank for rank in ranks if rank != 0]
            # non_zero_emu = [emu for emu in emu_imd_list if emu.bitword != 0]
            # for mu, rank in zip(non_zero_emu, non_zero_ranks):
            #     if mu.rank != rank: print mu.rank, rank

            for emu_mu, hw_mu, hw_rank in zip(emu_imd_list, intermediate_muons, ranks):
                mucnt += 1
                if emu_mu.bitword == hw_mu.bitword: 
                    continue
                if options.verbose:
                    print "mismatch in BX", hw_mu.bx, "rank hw:", hw_rank, "rank emu:", emu_mu.rank
                    print print_out_word(hw_mu.bitword)
                    print print_out_word(emu_mu.bitword)
                    print "-"*80
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
            canvas.Print("{f}/figures/intermediate_bitplot1.pdf".format(f=fnames['base']))

            hist_inter_2 = ROOT.TH2D("{f}_inter_comparison2".format(f=pattern), "comparison of intermediate: overview [{f}]".format(f=fnames['base']), 4, 0, 4, 24, 1, min(len(intermediate_muons), len(emu_imd_list)))
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
            canvas.Print("{f}/figures/intermediate_bitplot2.pdf".format(f=fnames['base']))