# ROOT:
import ROOT
# CMSSW:
from DataFormats.FWLite import Events, Handle

# ../tools:
from tools.vhdl import VHDLConstantsParser

# ./helpers:
from helpers.muon import Muon 
from helpers.options import parse_options, discover_files

def fill_muon_hists(index, hist_list, muons):
    for mu in muons:
        hist_list[index][0]["phiBits"].Fill(mu.phiBits)
        hist_list[index][0]["ptBits"].Fill(mu.ptBits)
        hist_list[index][0]["qualityBits"].Fill(mu.qualityBits)
        hist_list[index][0]["etaBits"].Fill(mu.etaBits)

def get_header():
    string = "#"*80
    string += """
# Testbench file for the uGMT
# Data format of muons:
# ID N PT PHI ETA CHARGE CHARGE_VALID QUALITY SORT EMPTY (ISO)
# where ID = {FWD+/-, OVL+/-, BAR, OUT, FIMD, BIMD, OIMD}
# N is the rank for IMD / OUT and the link for inputs.
# ISO is optional and only present for OUT
# 
# Data format for tracks:
# ID ETA0 PHI0 QUALITY0 ETA1 PHI1 QUALITY1 ETA2 PHI2 QUALITY2
# where ID = {FTRK+/-, OTRK+/-, BTRK}
# Tracks are given always for 3 consecutive muons
"""
    return string

def link_from_phi(phi, mutype, eta = 0):
    if mutype == "BAR":
        phiToCable = 0.005859375*2
    else:
        phiToCable = 0.005859375 
    cable = int(phi*phiToCable)    
    return cable

def get_muon_line(mu, muid, rank, addIso = False):
    isempty = 0
    if mu.ptBits == 0: isempty = 1
    sortrank = min(mu.ptBits+mu.qualityBits, 1023)
    string = "{id:<6} {rank:>5} {pt:>5} {phi:>5} {eta:>5} {charge:>5} {charge_valid:>5} {quality:>5} {sort:>5} {empty:>5}".format(
                    id=muid,
                    rank=rank,
                    pt=mu.ptBits,
                    phi=mu.phiBits,
                    eta=mu.etaBits,
                    charge=mu.Sysign & 0x1,
                    charge_valid=mu.Sysign >> 1,
                    quality=mu.qualityBits,
                    sort=sortrank,
                    empty=isempty
                )
    if addIso:
        string += " {iso:>5}\n".format(iso=mu.Iso)
    else:
        string += "\n"
    return string

def get_muon_lines(mu_list, muid, addIso):
    string = ""
    themuid = muid
    for i, mu in enumerate(mu_list):
        if muid == "IMD":
            if i < 8: themuid = "BIMD"
            elif i < 16: themuid = "OIMD" 
            else: themuid = "FIMD"
        string += get_muon_line(mu, themuid, i, addIso)
    
    return string


def hist_creator1D(namesdict,hist,title):
    for varname, hist_property in namesdict.iteritems():
        hist[varname] = ROOT.TH1D(varname+"{title}".format(title=title), "", hist_property[1], hist_property[2], hist_property[3])
        hist[varname].SetXTitle(hist_property[0])

def convert_input_vector_to_strings(vec, vhdl_dict, mutype, size):
    vhdl_key = mutype.replace("-", "_NEG")
    vhdl_key = vhdl_key.replace("+", "_POS")
    vhdl_key = vhdl_key.replace("BAR", "BARREL")
    vhdl_key += "_LOW"
    link_offset = vhdl_dict[vhdl_key]
    mulist = [ None for i in xrange(size)]
    for mu in vec:
        mu_tmp = Muon(vhdl_dict, mu_type="IN", obj=mu)
        if mutype.endswith("+") and mu_tmp.etaBits < 0: continue
        if mutype.endswith("-") and mu_tmp.etaBits > 0: continue

        link = mu.link()-link_offset

        if mulist[link*3] == None: 
            mulist[link*3] = mu_tmp
        elif mulist[link*3+1] == None:
            mulist[link*3+1] = mu_tmp
        elif mulist[link*3+2] == None:
            mulist[link*3+2] = mu_tmp
        else:
            print "ERROR", mu_tmp.phiBits, link, mutype

    track_id = mutype[0]+"TRK"
    if mutype.endswith("+"): track_id += "+"
    if mutype.endswith("-"): track_id += "-"
    track_string = ""
    track_string_template = " {eta:>5} {phi:>5} {quality:>5}"
    mu_string = ""
    for i in xrange(len(mulist)):
        if mulist[i] == None:
            mulist[i] = mu_tmp = Muon(vhdl_dict, mu_type="IN", bitword=0)
        mu_string += get_muon_line(mulist[i], mutype, i/3+link_offset)
        if i%3 == 0 and i != 0:
            track_string += "{id:<6}".format(id=track_id)
            for j in [3, 2, 1]:
                track_string += track_string_template.format(eta=mulist[i-j].etaBits, phi=mulist[i-j].phiBits, quality=mulist[i-j].qualityBits)
            track_string += "\n"
    return mu_string, track_string


if __name__ == "__main__":
    ROOT.TH1.AddDirectory(False)
    ROOT.gROOT.SetBatch()
    ROOT.gStyle.SetOptStat("ne")
    ROOT.gStyle.SetHistMinimumZero()
    ROOT.gStyle.SetPalette(1)
    canvas = ROOT.TCanvas("canvas_of_plots","comparisons")
    canvas.SetFillStyle(0)

    vhdl_dict = VHDLConstantsParser.parse_vhdl_file("data/ugmt_constants.vhd")

    opts, args = parse_options()
    fname_dict = discover_files(opts)

    for pattern, fnames in fname_dict.iteritems():
        print "+"*30, pattern, "+"*30
        events = Events(fnames['root'])

        out_handle = Handle('BXVector<l1t::Muon>')
        imd_handle = Handle('BXVector<l1t::Muon>')
        bar_handle = Handle('std::vector<l1t::L1TRegionalMuonCandidate>')
        fwd_handle = Handle('std::vector<l1t::L1TRegionalMuonCandidate>')
        ovl_handle = Handle('std::vector<l1t::L1TRegionalMuonCandidate>')

        out_emu_muons = []
        imd_emu_muons = []
        out_fname = "data/patterns/testbench/{pname}.txt".format(pname = pattern)

        with open(out_fname, 'w') as out_file:
            out_file.write(get_header())
            for i, event in enumerate(events):
                out_file.write("#"*80+"\n")
                out_file.write("# Event: {ievent}\n".format(ievent=i))
                out_file.write("#"*80+"\n")

                event.getByLabel("microGMTEmulator", out_handle)
                event.getByLabel("microGMTEmulator", "intermediateMuons", imd_handle)
                event.getByLabel("uGMTInputProducer", "BarrelTFMuons", bar_handle)
                event.getByLabel("uGMTInputProducer", "ForwardTFMuons", fwd_handle)
                event.getByLabel("uGMTInputProducer", "OverlapTFMuons", ovl_handle)

                emu_out_muons = out_handle.product()
                imd_prod = imd_handle.product()
                emu_bar_muons = bar_handle.product()
                emu_ovl_muons = ovl_handle.product()
                emu_fwd_muons = fwd_handle.product()

                muon_string_fwdp, track_string_fwdp = convert_input_vector_to_strings(emu_fwd_muons, vhdl_dict, "FWD+", 18)
                out_file.write(muon_string_fwdp)
                muon_string_ovlp, track_string_ovlp = convert_input_vector_to_strings(emu_ovl_muons, vhdl_dict, "OVL+", 18)
                out_file.write(muon_string_ovlp)
                muon_string_bar, track_string_bar = convert_input_vector_to_strings(emu_bar_muons, vhdl_dict, "BAR", 36)
                out_file.write(muon_string_bar)
                muon_string_ovln, track_string_ovln = convert_input_vector_to_strings(emu_ovl_muons, vhdl_dict, "OVL-", 18)
                out_file.write(muon_string_ovln)
                muon_string_fwdn, track_string_fwdn = convert_input_vector_to_strings(emu_fwd_muons, vhdl_dict, "FWD-", 18)
                out_file.write(muon_string_fwdn)


                out_file.write(track_string_fwdp)
                out_file.write(track_string_ovlp)
                out_file.write(track_string_bar)
                out_file.write(track_string_ovln)
                out_file.write(track_string_fwdn)

                out_file.write("#"*80+"\n")
                out_file.write("# Emulator information for event: {ievent}\n".format(ievent=i))
                out_file.write("#"*80+"\n")

                out_list = []
                for j in xrange(emu_out_muons.size(0)):
                    mu = emu_out_muons.at(0, j)
                    mu_tmp = Muon(vhdl_dict, mu_type="OUT", obj=mu)
                    out_list.append(mu_tmp)
                add_muons = 8-emu_out_muons.size(0)
                while add_muons != 0:
                    mu_tmp = Muon(vhdl_dict, mu_type="OUT", bitword=0)    
                    out_list.append(mu_tmp)
                    add_muons -= 1

                imd_list = []
                for j in xrange(imd_prod.size(0)):
                    mu = imd_prod.at(0, j)
                    mu_tmp = Muon(vhdl_dict, mu_type="OUT", obj=mu)
                    imd_list.append(mu_tmp)

                add_muons = 24-imd_prod.size(0)
                while add_muons != 0:
                    mu_tmp = Muon(vhdl_dict, mu_type="OUT", bitword=0)    
                    imd_list.append(mu_tmp)
                    add_muons -= 1

                out_muons_str = get_muon_lines(out_list, muid="OUT", addIso=True)
                imd_muons_str = get_muon_lines(imd_list, muid="IMD", addIso=False)
                out_file.write(imd_muons_str)
                out_file.write(out_muons_str)

