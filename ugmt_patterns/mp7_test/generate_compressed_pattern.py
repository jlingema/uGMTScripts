import sys
sys.path.append('../')

from helpers.muon import Muon
from helpers.pattern_dumper import PatternDumper, BufferWriter

#ROOT
from ROOT import gSystem, gROOT
import zlib
def setupROOT():
    gSystem.Load("libFWCoreFWLite")
    gROOT.ProcessLine('AutoLibraryLoader::enable();')
    gSystem.Load("libFWCoreFWLite")
    gSystem.Load("libCintex")
    gROOT.ProcessLine('ROOT::Cintex::Cintex::Enable();')

setupROOT()
gSystem.Load("libL1TriggerL1TGlobalMuon")

#CMSSW
from DataFormats.FWLite import Events, Handle
#from L1Trigger.L1TGlobalMuon import MicroGMTRankPtQualLUT
# ../tools:
from tools.vhdl import VHDLConstantsParser

from helpers.options import parse_options, discover_emu_files




def get_muon_list_out(emu_product, mu_type, vhdl_dict):
    if mu_type == "OUT":    
        nexpected = 8
    if mu_type == "IMD":    
        nexpected = 24

    mulist = [Muon(vhdl_dict, mu_type="OUT", bitword=0)]*nexpected
    for i in xrange(emu_product.size(0)):
        if emu_product.at(0, i).hwPt() != 0:
            mu_tmp = Muon(vhdl_dict, mu_type="OUT", obj = emu_product.at(0, i))
            mulist[i] = mu_tmp
    return mulist


def get_muon_list(emu_product, mu_type, vhdl_dict, check = False):
    nexpected = 18
    if mu_type == "BARREL": nexpected = 36

    mulist = [Muon(vhdl_dict, mu_type="IN", bitword=0)]*nexpected
    
    link_offset = vhdl_dict[mu_type+"_LOW"]
    for mu in emu_product:
        loc_link = mu.link()-link_offset
        mu_tmp = Muon(vhdl_dict, mu_type="IN", obj=mu)
        # only take muons from the right side of the detector
        if mu_type.endswith("POS") and mu_tmp.etaBits < 0: continue
        if mu_type.endswith("NEG") and mu_tmp.etaBits > 0: continue

        # because we don't book all 72*3 muons but only 18*3/36*3
        loc_link = mu.link()-link_offset
        if mulist[loc_link*3].ptBits == 0: 
            mulist[loc_link*3] = mu_tmp
        elif mulist[loc_link*3+1].ptBits == 0:
            mulist[loc_link*3+1] = mu_tmp
        elif mulist[loc_link*3+2].ptBits == 0:
            mulist[loc_link*3+2] = mu_tmp

        if check:
            if mu_tmp.ptBits < 0 or mu_tmp.ptBits > 511: print "+++ err > pt out of bounds"
            if mu_tmp.etaBits < -224 or mu_tmp.etaBits > 223: print "+++ err > eta out of bounds"
            if mu_tmp.phiBits < 0 or mu_tmp.phiBits > 575: print "+++ err > phi out of bounds"
            if mu_tmp.qualityBits < 0 or mu_tmp.qualityBits > 15: print "+++ err > quality out of bounds"
            

    return mulist
    
def get_calo_list(raw_sums):
    calo_sums = [0]*36*28
    for csum in raw_sums:
        idx = csum.hwPhi() + csum.hwEta()*36
        calo_sums[idx] = csum.etBits()
    return calo_sums
    # for iphi in range(36):
    #     for ieta in range(28):
            # idx = ieta*36+iphi

def dump_files(directory, fname, n, input_buffer, output_buffer, indelay, outdelay):
    with open('{path}/rx_{fname}_{idx}.zip'.format(path=directory, fname=fname, idx=n), 'w') as ofile:
        ofile.write(zlib.compress(input_buffer.dump_string()))
    with open('{path}/tx_{fname}_{idx}.zip'.format(path=directory, fname=fname, idx=n), 'w') as ofile:
        ofile.write(zlib.compress(output_buffer.dump_string(True)))
    output_buffer.writeEmptyFrames(outdelay)
    if indelay > 0:
        input_buffer.writeEmptyFrames(indelay)



def main():
    vhdl_dict = VHDLConstantsParser.parse_vhdl_file("../data/ugmt_constants.vhd")

    opts = parse_options()
    fname_dict = discover_emu_files(opts.emudirectory)

    ALGODELAY = 60 #first frame with valid = 1

    max_events = int((1024-ALGODELAY)/6)
    
    for pattern, fnames in fname_dict.iteritems():

        print "+"*30, pattern, "+"*30
        events = Events(fnames['root'])

        out_handle = Handle('BXVector<l1t::Muon>')
        imd_handle = Handle('BXVector<l1t::Muon>')
        bar_handle = Handle('std::vector<l1t::L1TRegionalMuonCandidate>')
        fwd_handle = Handle('std::vector<l1t::L1TRegionalMuonCandidate>')
        ovl_handle = Handle('std::vector<l1t::L1TRegionalMuonCandidate>')

        calo_handle = Handle('std::vector<l1t::L1TGMTInputCaloSum>')

        basedir_mp7 = "patterns/compressed/"
        path = '{path}/{pattern}/'.format(path=basedir_mp7, pattern=pattern)

        input_buffer = PatternDumper(basedir_mp7+pattern+".txt", vhdl_dict, BufferWriter)
        output_buffer = PatternDumper(basedir_mp7+pattern+"_out.txt", vhdl_dict, BufferWriter)
        
        if opts.delay > 0:
            input_buffer.writeEmptyFrames(opts.delay)

        output_buffer.writeEmptyFrames(ALGODELAY)
        cntr = 0
        for i, event in enumerate(events):
            event.getByLabel("microGMTEmulator", out_handle)
            event.getByLabel("microGMTEmulator", "intermediateMuons", imd_handle)
            event.getByLabel("uGMTInputProducer", "BarrelTFMuons", bar_handle)
            event.getByLabel("uGMTInputProducer", "ForwardTFMuons", fwd_handle)
            event.getByLabel("uGMTInputProducer", "OverlapTFMuons", ovl_handle)

            event.getByLabel("uGMTInputProducer", "TriggerTowerSums", calo_handle)

            calo_sums_raw = calo_handle.product()
            calo_sums = get_calo_list(calo_sums_raw)

            emu_out_muons = out_handle.product()
            outmuons = get_muon_list_out(emu_out_muons, "OUT", vhdl_dict)
            imd_prod = imd_handle.product()
            imdmuons = get_muon_list_out(imd_prod, "IMD", vhdl_dict)
            emu_bar_muons = bar_handle.product()
            bar_muons = get_muon_list(emu_bar_muons, "BARREL", vhdl_dict)
            emu_ovl_muons = ovl_handle.product()
            ovlp_muons = get_muon_list(emu_ovl_muons, "OVL_POS", vhdl_dict)
            ovln_muons = get_muon_list(emu_ovl_muons, "OVL_NEG", vhdl_dict)
            emu_fwd_muons = fwd_handle.product()
            fwdp_muons = get_muon_list(emu_fwd_muons, "FWD_POS", vhdl_dict)
            fwdn_muons = get_muon_list(emu_fwd_muons, "FWD_NEG", vhdl_dict)
            for mu in outmuons:
                if mu.bitword != 0: cntr += 1
            input_buffer.writeFrameBasedInputBX(bar_muons, fwdp_muons, fwdn_muons, ovlp_muons, ovln_muons, calo_sums)
            output_buffer.writeFrameBasedOutputBX(outmuons, imdmuons)

            if i%(max_events-1) == 0 and i != 0: # dump every max_events
                ifile = i/max_events
                print "Writing file {pattern}_{ifile}.zip for event {i}".format(pattern=pattern, ifile=ifile, i=i)
                dump_files(path, pattern, ifile, input_buffer, output_buffer, opts.delay, ALGODELAY)
                

            if (i+1)%1000 == 0:
                print "  processing the {i}th event".format(i=i+1)
        print 'n final muons: ', cntr
        if i%(max_events-1) != 0:
            ifile = i/max_events
            dump_files(path, pattern, ifile, input_buffer, output_buffer, opts.delay, ALGODELAY)
            
        print (i+1)/max_events



if __name__ == "__main__":
    main()