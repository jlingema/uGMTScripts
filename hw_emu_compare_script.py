import ROOT
import math
import os
from ROOT import TColor, TCanvas, gStyle, gROOT, TH2D, TH1D, TLegend, THStack
from DataFormats.FWLite import Events, Handle
from Muon_class import Muon 
from muon_functions import file_converter, get_frame, get_frames, frame_printer, get_num, add_nums, bit_mask_new, select, twos_complement_sign, plot_modifier, hist_creator1D
from tools.vhdl import VHDLConstantsParser
from optparse import OptionParser

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

def eta(obj,stepsize,eta_low,eta_high): # reads the etaBits in twos_complement.
    # The discommented lines transform etaBits to the physical values for eta and print a warning if eta is out of physical senseful boundaries

    obj.etaBits = twos_complement_sign(obj.etaBits,9)
    #obj.etaBits = stepsize*obj.etaBits
    #if (obj.etaBits<eta_low) or (obj.etaBits>eta_high):
    #   print "etaBits out of range [{l},{h}]".format(l=eta_low,h=eta_high)

def phi(obj,stepsize,phi_low,phi_high): # the following 2 functions are discommented in the script, but they return the physical phi and pT (see eta)
    obj.phiBits = stepsize*obj.phiBits
    if (obj.phiBits<phi_low) or (obj.phiBits>phi_high):
        print "phiBits out of range [{l},{h}]".format(l=phi_low,h=phi_high)

def pt(obj,stepsize,pt_low,pt_high):
    obj.ptBits = stepsize*obj.ptBits
    if (obj.ptBits<pt_low) or (obj.ptBits>pt_high):
        print "ptBits out of range [{l},{h}]".format(l=pt_low,h=pt_high)

def rank(obj,rank_link_low,rank_link_high,rank_frame_low,rank_frame_high,rank_bitlength,free_bits): # A very complicated function but it works: 
    # It returns a list of the ranks from frame_low and link_low to frame_high and link_high. 
    # Addtionally the bitlength of the rank_words (see below) can be changed as well as the number of free bits in the 32-bit-word
    # This was implemented to keep it as flexible as possible. 

    ranks = {}
    rank_list = []
    for i in xrange(rank_link_low,rank_link_high+1): 
        for j in xrange(rank_frame_low,rank_frame_high):
            ranks["Frame {j}, link {i}".format(j=j, i=i)] = get_num(obj,j,i)
            a = ranks["Frame {j}, link {i}".format(j=j, i=i)]
            b = (int(a,16)>>12) 
            ranks["Frame {j}, link {i}".format(j=j, i=i)] = b

    for i in xrange(rank_frame_low,rank_frame_high):
        for j in xrange(2*(1+rank_link_high-rank_link_low)):
            arg = (i-1)*2*(1+rank_link_high-rank_link_low)+j

            if j<(1+rank_link_high-rank_link_low):
                m = rank_link_low
            else:
                m = rank_link_high

            if arg%2 == 0:
                a = ranks["Frame {i}, link {m}".format(m=m, i=i)]>>rank_bitlength
                rank_list.append(a)
            else:
                b = bit_mask_new(ranks["Frame {i}, link {m}".format(i=i,m=m)],1+rank_bitlength,2*rank_bitlength)
                rank_list.append(b)
    return rank_list

def find_nonzero_output(obj, links=None, num_of_frames=None): # Finds the first non-zero valid (1v) entry from frame 0000 to frame "num_of_frames" in the input_links 
    # Attention: links is an array of length 2 !!!

    if num_of_frames==None:
        num_of_frames = 2**10

    if links==None:
        k0 = 0
        k1 = 4
    else:
        k0 = links[0]
        k1 = links[1]

    for j in xrange(k0, k1):
        for i in xrange(num_of_frames):
            a = get_frame(obj,i)[j]
            if (a[:2] == "1v") and (a!="1v00000000"):
                return i
                break

def input_frames(obj, link=None, num_of_frames=None): # Function made for input_files. Returns the number of valid input_frames starting from link 36 (can be modified)
    # Attention: Stops at first "0v" entry! (See code) If there should be other "1v" entries below, this function doesnt take them into consideration!

    if link==None:
        link = 36

    if num_of_frames == None:
        num_of_frames = 1024

    end_frame = num_of_frames

    for i in xrange(num_of_frames):
        a = get_frame(obj, i)[link]
        if a[:2] == "1v":
            start_frame = i
            break

    for i in xrange(start_frame,num_of_frames):
        a = get_frame(obj, i)[link]
        if a[:2] == "0v":
            end_frame = i
            break

    return end_frame-start_frame

def find_nonzero_intermediate(obj,start_frame,link_low=None,link_high=None): # Function made for the intermediate_muons.
    # It finds the first intermediate-bitword that is identical to the first valid non-zero output-bitword. "start_frame" is the frame in which this output_word is.
    # This is to define the offset between output and intermediate if there are problems in the alignment.

    if link_low==None:
        link_low=4

    if link_high==None:
        link_high=12

    for i in xrange(start_frame+1):
        for j in xrange(link_low,link_high):
            a = get_frame(obj,i)[j]
            b = get_frame(obj,start_frame)[0] 
            if a==b:
                return i
                break

def zero_qual(obj, input_muon=None): # Counts the muons with quality=0 but non-zero bitword. If the function is called with 2 arguments, it counts the input_qualityBits
    vec = []
    for i in xrange(len(obj)):
        if input_muon==None:
            m = obj[i].input_qualityBits
        else:
            m = obj[i].qualityBits

        if m==0 and obj[i].bitword!=0:
            vec.append(obj[i])
    return len(vec)

def zero_pt(obj, input_muon=None): # works as the function above for "ptBits"
    vec = []
    for i in xrange(len(obj)):
        if input_muon==None:
            m = obj[i].input_ptBits
        else:
            m = obj[i].ptBits

        if m==0 and obj[i].bitword!=0:
            vec.append(obj[i])
    return len(vec)

def non_zero(obj): # counts how many obj in an array are !=0
    vec = []
    for i in xrange(len(obj)):
        if obj[i].bitword!=0:
            vec.append(obj[i])
    return len(vec)

def non_zero_block(m_list,m_dict,muon_option=None): # Outputs have 3 links a 6 frames -> correspond to 4 muons. m_dict is a dict that contains such a "block"
    # m_list (the output) is a list of m_dict, with all the entries transformed to objects of the Muon_class, but only if any of them is !=0. This is to ensure that no empty blocks are taken.
    # If the function is called with 3 arguments, only the entries are taken into the list without initialising them as Muon objects.

    h_vec = []
    for var in m_dict:
        h_vec.append(m_dict[var])   
    #if any(x != 0 for x in h_vec): # not very elegant, just a prototype!
    for m in h_vec:
        if muon_option==None:
            m = Muon(vhdl_dict, bitword=m)
        m_list.append(m)

    return m_list

def plot_mu(index, hist_list, muons):
    for mu in muons:
        hist_list[index][0]["phiBits"].Fill(mu.phiBits)
        hist_list[index][0]["ptBits"].Fill(mu.ptBits)
        hist_list[index][0]["qualityBits"].Fill(mu.qualityBits)
        hist_list[index][0]["etaBits"].Fill(mu.etaBits)

def sort_files(list): # Sorts the files of the os.walk(). Attention: All input_files start with "rx_", all output_files with "tx_" and all emu_files end with "root"!!!
    o_list = [0, 0, 0]
    for d in files:
        if d[-4:]=="root":
            o_list[2]=d
        if d[:3]=="tx_":
            o_list[1]=d
        if d[:3]=="rx_":
            o_list[0]=d

    return o_list

if __name__ == "__main__":

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

    print options.directory
    for roots, dirs, files in os.walk("{d}".format(d=options.directory)):
        file_dict[roots] = {}
        for fname in files:
            if "tx_" in fname:
                file_dict[roots]["tx"] = fname
            if ".root" in fname:
                file_dict[roots]["root"] = fname
            if "rx_" in fname:
                file_dict[roots]["rx"] = fname
        if file_dict[roots] == {}: del file_dict[roots]

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
    "qualityBits":["qualityBits", 16, 0, 16],
    "ptBits":["ptBits", 128, 0, 512],#(pt_high-pt_low)/pt_unit, pt_low, pt_high],
    "phiBits":["phiBits", 256, 0, 1024], #(phi_high-phi_low)/phi_unit, phi_low, phi_high],
    "etaBits":["etaBits", 256, -512, 512] #(eta_high-eta_low)/eta_unit, eta_low, eta_high]
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
        for i in vec_list:
            hist_creator1D(hist_parameters,i[0],i[1])

        for event in events:
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

            emulator_muon_list = [emu_out_muons, emu_bar_muons, emu_ovl_muons, emu_fwd_muons, imd_prod]
            for var in emulator_muon_list:
                for mu in var:
                    mu = Muon(vhdl_dict, obj=mu)
                    if var==emu_out_muons:
                        emu_out_list.append(mu)
                    if var==imd_prod:
                        emu_imd_list.append(mu)

            plot_mu(0, vec_list, emu_out_list)
            plot_mu(4, vec_list, emu_imd_list)


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
            non_zero_block(hw_list,muons)
            out_frame_low = out_frame_low+6
            out_frame_high = out_frame_high+6

        for m in hw_list:
            eta(m,eta_unit,eta_low,eta_high)
            #phi(m,phi_unit,phi_low,phi_high)
            #pt(m,pt_unit,pt_low,pt_high)

        inter_list = []
        while intermediate_frame_high<=min(1023, start_frame + num_of_input_frames - offset-6):
            intermediate = select(obj,intermediate_link_low,intermediate_link_high,intermediate_frame_low,intermediate_frame_high)
            non_zero_block(inter_list, intermediate)
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
            hist2.Fill(0,(y+1)*isequal(hw_list[y].phiBits,emu_out_list[y].phiBits))
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