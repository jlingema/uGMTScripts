import ROOT
import math
import os
from ROOT import TCanvas, gStyle, gROOT, TH2D, TH1D, TLegend, THStack, TH1
from DataFormats.FWLite import Events, Handle
from muon import Muon 
from muon_functions import file_converter, select, twos_complement_sign, plot_modifier, hist_creator1D, non_zero_block, find_nonzero_output, input_frames, rank, eta, single_bit, isequal
from tools.vhdl import VHDLConstantsParser
from optparse import OptionParser

def fill_muon_hists(index, hist_list, muons):
    for mu in muons:
        hist_list[index][0]["phiBits"].Fill(mu.phiBits)
        hist_list[index][0]["ptBits"].Fill(mu.ptBits)
        hist_list[index][0]["qualityBits"].Fill(mu.qualityBits)
        hist_list[index][0]["etaBits"].Fill(mu.etaBits)

if __name__ == "__main__":
    TH1.AddDirectory(False)
    pi = math.pi
    gROOT.SetBatch()
    gStyle.SetOptStat("ne")
    gStyle.SetHistMinimumZero()
    gStyle.SetPalette(1)
    canvas = TCanvas("canvas_of_plots","comparisons")

    vhdl_dict = VHDLConstantsParser.parse_vhdl_file("data/ugmt_constants.vhd")

    parser = OptionParser()
    parser.add_option("-f", "--directory", dest="directory")
    (options, args) = parser.parse_args()

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

        leafs_hists_out = {}
        leafs_hists_bar = {}
        leafs_hists_ovl = {}
        leafs_hists_fwd = {}
        leafs_hists_imd = {}

        vec_list = ([leafs_hists_out,"emu_out_muons"], [leafs_hists_bar,"emu_bar_muons"], [leafs_hists_ovl,"emu_ovl_muons"], [leafs_hists_fwd,"emu_fwd_muons"], [leafs_hists_imd, "emu_imd_muons"])
        for hist_list, hist_name_prefix in vec_list:
            hist_creator1D(hist_parameters, hist_list, hist_name_prefix)

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
                mu_tmp = Muon(vhdl_dict, obj=mu)
                emu_out_list.append(mu_tmp)

            for mu in imd_prod:
                mu_tmp = Muon(vhdl_dict, obj=mu)
                emu_imd_list.append(mu_tmp)

            fill_muon_hists(0, vec_list, emu_out_list)
            fill_muon_hists(4, vec_list, emu_imd_list)


        for name in hist_parameters:
            emu_leg = TLegend(0.2,0.7,0.4,0.9,"Legend")
            emu_stack = THStack("stack","{name}".format(name=name))

            plot_modifier(leafs_hists_out[name],"{name}".format(name=name),"",ROOT.kBlack)
            emu_leg.AddEntry(leafs_hists_out[name],"emu_out_muons","f")

            plot_modifier(leafs_hists_bar[name],"{name}".format(name=name),"",ROOT.kGreen+1)
            emu_leg.AddEntry(leafs_hists_bar[name],"emu_bar_muons","f")
            emu_stack.Add(leafs_hists_bar[name])

            plot_modifier(leafs_hists_ovl[name],"{name}".format(name=name),"",ROOT.kYellow)
            emu_leg.AddEntry(leafs_hists_ovl[name],"emu_ovl_muons","f")
            emu_stack.Add(leafs_hists_ovl[name])

            plot_modifier(leafs_hists_fwd[name],"{name}".format(name=name),"",ROOT.kAzure-2)
            emu_leg.AddEntry(leafs_hists_fwd[name],"emu_fwd_muons","f")
            emu_stack.Add(leafs_hists_fwd[name])

            max_vec = (emu_stack.GetMaximum(),
            leafs_hists_out[name].GetBinContent(leafs_hists_out[name].GetMaximumBin()))
            a = sum(max_vec)+10

            if max_vec[0]!=0:
                emu_stack.Draw("")
                emu_stack.GetXaxis().SetTitle("{name}".format(name=name))
                emu_stack.GetYaxis().SetTitle("N")
                emu_stack.GetYaxis().SetRangeUser(0,a)
                leafs_hists_out[name].Draw("same")
            else:
                leafs_hists_out[name].Draw("")
                leafs_hists_out[name].GetYaxis().SetRangeUser(0, a)

            emu_leg.Draw("same")
        canvas.Print("{f}/figures/emu_{name}.pdf".format(f=filename, name=hist_parameters[name][0]))

        # Reading and processing the hardware data

        fobj = open("{f}/{fn}".format(f=filename, fn=file_dict[filename]["tx"]))
        obj = file_converter(fobj)

        #######
        input_fobj = open("{f}/{fn}".format(f=filename, fn=file_dict[filename]["rx"]))
        in_obj = file_converter(input_fobj)

        num_of_input_frames = input_frames(in_obj)
        in_events = num_of_input_frames/6

        in_muons = []
        in_muons_dict = select(in_obj, 36, 72, 0, num_of_input_frames)

        for var in in_muons_dict:
            if in_muons_dict[var]!=0:
                in_muons_dict[var] = Muon(vhdl_dict, bitword=in_muons_dict[var])
                in_muons.append(in_muons_dict[var])

        ##### settings on where in the file the final output muons are may be set here and may be modified at any time:
        start_frame = find_nonzero_output(obj)
        if start_frame==None:
            #print "Attention! start frame set to zero, no non-zero output found!"
            start_frame=0
        out_link_low = 0
        out_link_high = 4
        out_frame_low = start_frame # 3
        out_frame_high = start_frame+3 # 6
        #####

        ##### settings on where in the file the intermediate muons are may be set here and may be modified at any time:
        intermediate_link_low = 4
        intermediate_link_high = 12

        if find_nonzero_output(obj, links=[4,12])==None:
            #print "Attention: all intermediates are 0! [occured at pattern {f}]".format(f=filename)
            offset = 0
        else:
            offset = start_frame - find_nonzero_output(obj, links=[4,12])

        intermediate_frame_low = out_frame_low-offset
        intermediate_frame_high = intermediate_frame_low + 6 
        #####

        ##### settings on where in the output the ranks are may be set here and may be modified at any time:
        rank_link_low = 12
        rank_link_high = 13
        rank_frame_low = intermediate_frame_low # = intermediate_frame_low
        rank_frame_high = intermediate_frame_high # = intermediate_frame_high
        rank_free_bits = 12 # free bits in the ranks, maybe changed at any time    
        rank_bitlength = 10 # bitlength of one (!) rank bitword, may be changed at any time
        #####

        hw_list = []
        while out_frame_high<=min(1023, start_frame + num_of_input_frames-6):
            muons = select(obj,out_link_low,out_link_high,out_frame_low,out_frame_high)
            non_zero_block(vhdl_dict, hw_list,muons)
            out_frame_low = out_frame_low+6
            out_frame_high = out_frame_high+6

        for m in hw_list:
            eta(m,eta_unit,eta_low,eta_high)
            #phi(m,phi_unit,phi_low,phi_high)
            #pt(m,pt_unit,pt_low,pt_high)

        inter_list = []
        while intermediate_frame_high<=min(1023, start_frame + num_of_input_frames - offset-6):
            intermediate = select(obj,intermediate_link_low,intermediate_link_high,intermediate_frame_low,intermediate_frame_high)
            non_zero_block(vhdl_dict, inter_list, intermediate)
            intermediate_frame_low = intermediate_frame_low+6
            intermediate_frame_high = intermediate_frame_high+6

        for m in inter_list:
            eta(m,eta_unit,eta_low,eta_high)
            #phi(m,phi_unit,phi_low,phi_high)
            #pt(m,pt_unit,pt_low,pt_high)

        rank_list = []
        while rank_frame_high<=min(1023, start_frame-offset+num_of_input_frames-6): 
            a = rank(obj,rank_link_low,rank_link_high,rank_frame_low,rank_frame_high,rank_bitlength,rank_free_bits)
            for i in xrange(len(a)):
                rank_list.append(a[i])
            rank_frame_low = rank_frame_low + 6
            rank_frame_high = rank_frame_high + 6

        #for i in xrange(len(inter_list)):  # here each intermediate muon can be assigned a rank. Works only if len(inter_list)==len(rank_list)
        #   inter_list[i].rank = rank_list[i]

        #### here the number of nonzero ranks is counted
        rank_num_of_non_zeros = 0
        for i in xrange(len(rank_list)):
            if rank_list[i]!=0:
                rank_num_of_non_zeros = rank_num_of_non_zeros+1
        ####

        #print "{fn}_in_events :".format(fn=filename), in_events
        #print "{fn}_in_muons :".format(fn=filename), len(in_muons), "/", len(in_muons_dict)
        #print "{fn}_num of final non-zero Output-Muons: ".format(fn=filename), non_zero(hw_list), "/", len(hw_list)#,"), corresponds to ", len(hw_list)/8," Events"
        #print "{fn}_Output-Muons behind end_frame:"
        #print "{fn}_num of intermediate non-zero Output-Muons: ".format(fn=filename), non_zero(inter_list), "/" , len(inter_list)#, "), corresponds to ", len(inter_list)/24," Events" 
        #print "{fn}_n_ranks".format(fn=filename), rank_num_of_non_zeros, "/", len(rank_list)
        #print "{fn}_n_zero_pt".format(fn=filename), zero_pt(hw_list)
        #print "{fn}_n_zero_qual".format(fn=filename), zero_qual(hw_list)
        #print "{fn}_in_zero_pt".format(fn=filename), zero_pt(in_muons, "input")
        #print "{fn}_in_zero_qual".format(fn=filename), zero_qual(in_muons, "input")

        #if len(hw_list) != len(emu_out_list): ### prints a warning if hardware- and Emulator-output have an unequal number of events
        #   print "Attention : Unequal number of Output- and Emulatormuons being compared! [occured at pattern {f}]".format(f=filename)
        #   print "len(hw_list) = ", len(hw_list), ", corresponds to ", len(hw_list)/8, " events"
        #   print "len(emu_out_list) = ", len(emu_out_list), ", corresponds to ", len(emu_out_list)/8, " events"

        hist_input_dict = {}

        for var in hist_parameters:
            hpv = hist_parameters[var]
            hist_input_dict[var] = ROOT.TH1D("input_"+var+"_{f}".format(f=filename), "hw_input_"+var+" [{f}]".format(f=filename), int(hpv[1]), hpv[2], hpv[3])
            hist_input_dict[var].SetXTitle(hpv[0])
            hist_input_dict[var].SetYTitle("N")

        for i in xrange(len(in_muons)):
            hist_input_dict["qualityBits"].Fill(in_muons[i].input_qualityBits)
            hist_input_dict["ptBits"].Fill(in_muons[i].input_ptBits)
            hist_input_dict["phiBits"].Fill(in_muons[i].input_phiBits)
            hist_input_dict["etaBits"].Fill(twos_complement_sign(in_muons[i].input_etaBits))
        #######

        hist_dict = {}

        for var in hist_parameters:
            hpv = hist_parameters[var]
            hist_dict[var] = TH1D("output_"+var+"_{f}".format(f=filename), "hw_output_"+var+" [{f}]".format(f=filename), int(hpv[1]), hpv[2], hpv[3])
            hist_dict[var].SetXTitle(hpv[0])
            hist_dict[var].SetYTitle("N")

        for i in xrange(len(hw_list)):
            hist_dict["qualityBits"].Fill(hw_list[i].qualityBits)
            hist_dict["ptBits"].Fill(hw_list[i].ptBits)
            hist_dict["phiBits"].Fill(hw_list[i].phiBits)
            hist_dict["etaBits"].Fill(hw_list[i].etaBits)
        ########

        for var in hist_parameters:

            hw_leg = TLegend(0.7, 0.7, 0.9, 0.85, "Legend")
            a = hist_input_dict[var].GetBinContent(hist_input_dict[var].GetMaximumBin())
            b = hist_dict[var].GetBinContent(hist_dict[var].GetMaximumBin())
            c = max(a,b)

            plot_modifier(hist_dict[var], "{x}".format(x=hist_parameters[var][0]), "", ROOT.kBlack)
            hist_dict[var].GetYaxis().SetRangeUser(0, 1.01*c)
            hist_dict[var].GetYaxis().SetTitle("N")
            hw_leg.AddEntry(hist_dict[var], "Output", "f")
            hist_dict[var].Draw()

            plot_modifier(hist_input_dict[var], "{x}".format(x=hist_parameters[var][0]), "", ROOT.kBlue)
            hist_input_dict[var].GetYaxis().SetRangeUser(0, 1.01*c)
            hist_input_dict[var].GetYaxis().SetTitle("N")
            hw_leg.AddEntry(hist_input_dict[var], "Input", "f")
            hist_input_dict[var].Draw("same")

            hw_leg.Draw("same")
            canvas.Print("{f}/figures/hw_{name}.pdf".format(f=filename, name=hist_parameters[var][0]))

        hist1 = TH2D("{f}_comparison1".format(f=filename),"comparison of hardware: all bits [{f}]".format(f=filename),64,0,64,8,1,min(len(hw_list),len(emu_out_list)))
        for y in xrange(min(len(hw_list),len(emu_out_list))):
            for x in xrange(64):
                hw = single_bit(hw_list[y].bitword,x)
                emu = single_bit(emu_out_list[y].bitword,x)
                hist1.Fill(x,(y+1)*isequal(hw,emu))

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

        hist2 = TH2D("{f}_comparison2".format(f=filename),"comparison of hardware: overview [{f}]".format(f=filename),4,0,4,8,1,min(len(hw_list),len(emu_out_list)))
        for y in xrange(min(len(hw_list),len(emu_out_list))):
            hist2.Fill(0,(y+1)*isequal(hw_list[y].phiBits, emu_out_list[y].phiBits))
            hist2.Fill(1,(y+1)*isequal(hw_list[y].ptBits,emu_out_list[y].ptBits))
            hist2.Fill(2,(y+1)*isequal(hw_list[y].qualityBits,emu_out_list[y].qualityBits))
            hist2.Fill(3,(y+1)*isequal(hw_list[y].etaBits,emu_out_list[y].etaBits))
            #hist2.Fill(3,(y+1)*isequal(twos_complement_sign(hw_list[y].etaBits,9),emu_out_list[y].etaBits()))  ### for mistakes on purpose

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

        hist_inter_1 = TH2D("{f}_comparison_inter_1".format(f=filename), "comparison of intermediates: all bits [{f}]".format(f=filename), 64, 0, 64, 24, 0, min(len(inter_list), len(emu_imd_list)))
        for y in xrange(min(len(inter_list), len(emu_imd_list))):
            for x in xrange(64):
                hw = single_bit(inter_list[y].bitword, x)
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

        hist_inter_2 = TH2D("{f}_inter_comparison2".format(f=filename), "comparison of intermediate: overview [{f}]".format(f=filename), 4, 0, 4, 24, 1, min(len(inter_list), len(emu_imd_list)))
        for y in xrange(min(len(inter_list), len(emu_imd_list))):
            hist_inter_2.Fill(0,(y+1)*isequal(inter_list[y].phiBits,emu_imd_list[y].phiBits))
            hist_inter_2.Fill(1,(y+1)*isequal(inter_list[y].ptBits,emu_imd_list[y].ptBits))
            hist_inter_2.Fill(2,(y+1)*isequal(inter_list[y].qualityBits,emu_imd_list[y].qualityBits))
            hist_inter_2.Fill(3,(y+1)*isequal(inter_list[y].etaBits,emu_imd_list[y].etaBits))

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

        fobj.close()
        input_fobj.close()