import ROOT
import math
import os
from ROOT import TCanvas, gStyle, gROOT, TH1D, TLegend, TH1
from muon_functions import file_converter, plot_modifier, find_nonzero_output, input_frames, get_rank_list, get_muon_objects, non_zero
from tools.vhdl import VHDLConstantsParser
from optparse import OptionParser

def parse_options():
    parser = OptionParser()
    parser.add_option("-f", "--directory", dest="directory")
    return parser.parse_args()

def create_and_fill_hists(hist_parameters, muon_list):
    hist_dict = {}
    for var, options in hist_parameters:
        hist_dict[var] = ROOT.TH1D("input_"+var+"_{f}".format(f=filename), "hw_input_"+var+" [{f}]".format(f=filename), options[1], options[2], options[3])
        hist_dict[var].SetXTitle(options[0])
        hist_dict[var].SetYTitle("N")

    for mu in muon_list:
        hist_dict["qualityBits"].Fill(mu.qualityBits)
        hist_dict["ptBits"].Fill(mu.ptBits)
        hist_dict["phiBits"].Fill(mu.phiBits)
        hist_dict["etaBits"].Fill(mu.etaBits)

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
        # Reading and processing the hardware data

        fobj = open("{f}/{fn}".format(f=filename, fn=file_dict[filename]["tx"]))
        frame_dict_out = file_converter(fobj)

        #######
        input_fobj = open("{f}/{fn}".format(f=filename, fn=file_dict[filename]["rx"]))
        frame_dict_in = file_converter(input_fobj)

        num_of_input_frames = input_frames(frame_dict_in)
        in_events = math.ceil(num_of_input_frames/6.)
        in_muons = get_muon_objects(vhdl_dict, frame_dict_in, 0, num_of_input_frames, 36, 72)

        ##### settings on where in the file the final output muons are may be set here and may be modified at any time:
        start_frame = find_nonzero_output(frame_dict_out)
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

        if find_nonzero_output(frame_dict_out, links=[4,12])==None:
            #print "Attention: all intermediates are 0! [occured at pattern {f}]".format(f=filename)
            offset = 0
        else:
            offset = start_frame - find_nonzero_output(frame_dict_out, links=[4,12])

        intermediate_frame_low = out_frame_low-offset
        intermediate_frame_high = intermediate_frame_low + 6 
        #####

        ##### settings on where in the output the ranks are may be set here and may be modified at any time:
        rank_link_low = 12
        rank_link_high = 13
        rank_frame_low = intermediate_frame_low # = intermediate_frame_low
        rank_frame_high = intermediate_frame_high # = intermediate_frame_high
        rank_free_bits = 12 # free bits in the ranks, maybe changed at any time    
        rank_bitlength = 10 # bitlength of one (!) get_rank_list bitword, may be changed at any time
        #####

        hw_endframe = min(1023, start_frame + num_of_input_frames-6)
        hw_list = get_muon_objects(vhdl_dict, frame_dict_out, out_frame_low, hw_endframe, out_link_low, out_link_high, mu_type="OUT")
        
        inter_list = get_muon_objects(vhdl_dict, frame_dict_out, intermediate_frame_low, intermediate_link_high,
            intermediate_link_low, intermediate_link_high)


        rank_frame_high = min(1023, start_frame-offset+num_of_input_frames-6)
        rank_list = get_rank_list(frame_dict_out, rank_link_low, rank_link_high, rank_frame_low, rank_frame_high, rank_bitlength, rank_free_bits)


        #### here the number of nonzero ranks is counted
        rank_num_of_non_zeros = 0
        for i in xrange(len(rank_list)):
            if rank_list[i]!=0:
                rank_num_of_non_zeros = rank_num_of_non_zeros+1
        ####

        print "{fn}_in_events :".format(fn=filename), in_events
        print "{fn}_in_muons :".format(fn=filename), non_zero(in_muons), "/", len(in_muons)
        print "{fn}_num of final non-zero Output-Muons: ".format(fn=filename), non_zero(hw_list), "/", len(hw_list)#,"), corresponds to ", len(hw_list)/8," Events"
        print "{fn}_Output-Muons behind end_frame:"
        print "{fn}_num of intermediate non-zero Output-Muons: ".format(fn=filename), non_zero(inter_list), "/" , len(inter_list)#, "), corresponds to ", len(inter_list)/24," Events" 
        print "{fn}_n_ranks".format(fn=filename), rank_num_of_non_zeros, "/", len(rank_list)

        hists_input = create_and_fill_hists(hist_parameters, in_muons)
        hists_output = create_and_fill_hists(hist_parameters, hw_list)

        for var in hist_parameters:
            hw_leg = TLegend(0.7, 0.7, 0.9, 0.85, "Legend")
            a = hists_input[var].GetBinContent(hists_input[var].GetMaximumBin())
            b = hists_output[var].GetBinContent(hists_output[var].GetMaximumBin())
            c = max(a,b)

            plot_modifier(hists_output[var], "{x}".format(x=hist_parameters[var][0]), "", ROOT.kBlack)
            hists_output[var].GetYaxis().SetRangeUser(0, 1.01*c)
            hists_output[var].GetYaxis().SetTitle("N")
            hw_leg.AddEntry(hists_output[var], "Output", "f")
            hists_output[var].Draw()

            plot_modifier(hists_input[var], "{x}".format(x=hist_parameters[var][0]), "", ROOT.kBlue)
            hists_input[var].GetYaxis().SetRangeUser(0, 1.01*c)
            hists_input[var].GetYaxis().SetTitle("N")
            hw_leg.AddEntry(hists_input[var], "Input", "f")
            hists_input[var].Draw("same")

            hw_leg.Draw("same")
            canvas.Print("{f}/figures/hw_{name}.pdf".format(f=filename, name=hist_parameters[var][0]))

        fobj.close()
        input_fobj.close()