from helpers.muon import Muon
from helpers.pattern_dumper import PatternDumper, TestbenchWriter, BufferWriter, TestvectorWriter

#ROOT
from ROOT import gSystem, gROOT
import time


def setupROOT():
    gSystem.Load("libFWCoreFWLite")
    gROOT.ProcessLine('AutoLibraryLoader::enable();')
    gSystem.Load("libFWCoreFWLite")
    gSystem.Load("libCintex")
    gROOT.ProcessLine('ROOT::Cintex::Cintex::Enable();')

setupROOT()
gSystem.Load("libL1TriggerL1TGlobalMuon")

from ROOT import l1t

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
        if emu_product.at(0, i).hwPt() > 0:
            mu_tmp = Muon(vhdl_dict, mu_type="OUT", obj=emu_product.at(0, i))
            mulist[i] = mu_tmp
    return mulist


def get_muon_list(emu_product, mu_type, vhdl_dict, bx, check=False):
    nexpected = 18
    if mu_type == "BARREL":
        nexpected = 36

    mulist = [Muon(vhdl_dict, mu_type="IN", bitword=0)]*nexpected

    link_offset = vhdl_dict[mu_type+"_LOW"]
    for mu in emu_product:
        loc_link = mu.link()-link_offset
        mu_tmp = Muon(vhdl_dict, mu_type="IN", obj=mu, bx=bx)
        # only take muons from the right side of the detector
        if mu_type.endswith("POS") and mu_tmp.etaBits < 0:
            continue
        if mu_type.endswith("NEG") and mu_tmp.etaBits > 0:
            continue

        # because we don't book all 72*3 muons but only 18*3/36*3
        loc_link = mu.link()-link_offset
        if mulist[loc_link*3].ptBits == 0:
            mu_tmp.setBunchCounter(0)
            mulist[loc_link*3] = mu_tmp
        elif mulist[loc_link*3+1].ptBits == 0:
            mu_tmp.setBunchCounter(1)
            mulist[loc_link*3+1] = mu_tmp
        elif mulist[loc_link*3+2].ptBits == 0:
            mu_tmp.setBunchCounter(2)
            mulist[loc_link*3+2] = mu_tmp

        if check:
            if mu_tmp.ptBits < 0 or mu_tmp.ptBits > 511:
                print "+++ err > pt out of bounds"
            if mu_tmp.etaBits < -224 or mu_tmp.etaBits > 223:
                print "+++ err > eta out of bounds"
            if mu_tmp.phiBits < 0 or mu_tmp.phiBits > 575:
                print "+++ err > phi out of bounds"
            if mu_tmp.qualityBits < 0 or mu_tmp.qualityBits > 15:
                print "+++ err > quality out of bounds"

    return mulist


def get_calo_list(raw_sums):
    calo_sums = [0]*36*28
    for csum in raw_sums:
        idx = csum.hwPhi() + csum.hwEta()*36
        # print csum.hwPhi(), csum.hwEta()
        calo_sums[idx] = csum.etBits()
    return calo_sums


def main():
    vhdl_dict = VHDLConstantsParser.parse_vhdl_file("data/ugmt_constants.vhd")

    opts = parse_options()
    fname_dict = discover_emu_files(opts.emudirectory)
    rankLUT = l1t.MicroGMTRankPtQualLUT()

    for pattern, fnames in fname_dict.iteritems():
        print "+"*30, pattern, "+"*30
        events = Events(fnames['root'])

        start = time.time()

        tower_indices = None
        if 'idebug' in fnames.keys():
            debug_fname = fnames['idebug']
            with open(debug_fname, 'r') as fobj:
                tower_indices = [[int(idx.strip()) for idx in l.split()] for l in fobj]

        out_handle = Handle('BXVector<l1t::Muon>')
        imd_handle = Handle('BXVector<l1t::Muon>')
        bar_handle = Handle('std::vector<l1t::L1TRegionalMuonCandidate>')
        fwd_handle = Handle('std::vector<l1t::L1TRegionalMuonCandidate>')
        ovl_handle = Handle('std::vector<l1t::L1TRegionalMuonCandidate>')
        calo_handle = Handle('std::vector<l1t::L1TGMTInputCaloSum>')

        basedir_testbench = "data/patterns/testbench/"
        basedir_mp7 = "data/patterns/mp7/"

        input_buffer = PatternDumper(basedir_mp7+pattern+".txt", vhdl_dict, BufferWriter)
        output_buffer = PatternDumper(basedir_mp7+pattern+"_out.txt", vhdl_dict, BufferWriter)
        input_testbench = PatternDumper(basedir_testbench+pattern+".txt", vhdl_dict, TestbenchWriter)
        serializer_testbench = PatternDumper(basedir_testbench+"serializer_"+pattern+".txt", vhdl_dict, TestbenchWriter)
        deserializer_testbench = PatternDumper(basedir_testbench+"deserializer_"+pattern+".txt", vhdl_dict, TestbenchWriter)
        integration_testbench = PatternDumper(basedir_testbench+"integration_"+pattern+".txt", vhdl_dict, TestbenchWriter)

        if opts.delay > 0:
            input_buffer.writeEmptyFrames(opts.delay)

        setup_time = time.time() - start

        avg_get_label_time = 0
        avg_conversion_time = 0
        avg_write_time = 0
        n_twrs = 0
        for i, event in enumerate(events):
            evt_start = time.time()
            event_head = "#"*80+"\n"
            event_head += "# Event: {ievent}\n".format(ievent=i)
            event_head += "#"*80+"\n"
            input_testbench.addLine(event_head)
            serializer_testbench.addLine(event_head)
            deserializer_testbench.addLine(event_head)
            integration_testbench.addLine(event_head)

            event.getByLabel("microGMTEmulator", out_handle)
            event.getByLabel("microGMTEmulator", "intermediateMuons", imd_handle)
            event.getByLabel("uGMTInputProducer", "BarrelTFMuons", bar_handle)
            event.getByLabel("uGMTInputProducer", "ForwardTFMuons", fwd_handle)
            event.getByLabel("uGMTInputProducer", "OverlapTFMuons", ovl_handle)

            event.getByLabel("uGMTInputProducer", "TriggerTowerSums", calo_handle)
            get_label_time = time.time() - evt_start
            calo_sums_raw = calo_handle.product()
            calo_sums = get_calo_list(calo_sums_raw)

            emu_out_muons = out_handle.product()
            outmuons = get_muon_list_out(emu_out_muons, "OUT", vhdl_dict)
            imd_prod = imd_handle.product()
            imdmuons = get_muon_list_out(imd_prod, "IMD", vhdl_dict)
            emu_bar_muons = bar_handle.product()
            bar_muons = get_muon_list(emu_bar_muons, "BARREL", vhdl_dict, i)
            emu_ovl_muons = ovl_handle.product()
            ovlp_muons = get_muon_list(emu_ovl_muons, "OVL_POS", vhdl_dict, i)
            ovln_muons = get_muon_list(emu_ovl_muons, "OVL_NEG", vhdl_dict, i)
            emu_fwd_muons = fwd_handle.product()
            fwdp_muons = get_muon_list(emu_fwd_muons, "FWD_POS", vhdl_dict, i)
            fwdn_muons = get_muon_list(emu_fwd_muons, "FWD_NEG", vhdl_dict, i)

            conversion_time = time.time() - evt_start - get_label_time
            input_buffer.writeFrameBasedInputBX(bar_muons, fwdp_muons, fwdn_muons, ovlp_muons, ovln_muons, calo_sums)
            integration_testbench.writeFrameBasedInputBX(bar_muons, fwdp_muons, fwdn_muons, ovlp_muons, ovln_muons, calo_sums)
            deserializer_testbench.writeFrameBasedInputBX(bar_muons, fwdp_muons, fwdn_muons, ovlp_muons, ovln_muons, calo_sums)
            output_buffer.writeFrameBasedOutputBX(outmuons, imdmuons)

            input_testbench.writeMuonBasedInputBX(bar_muons, fwdp_muons, fwdn_muons, ovlp_muons, ovln_muons, calosums=calo_sums, rankLUT=rankLUT, addTracks=True)
            input_testbench.addLine("# Expected emulator output\n")
            input_testbench.writeMuonBasedOutputBX(outmuons, imdmuons)
            deserializer_testbench.addLine("# Expected emulator output\n")
            deserializer_testbench.writeMuonBasedInputBX(bar_muons, fwdp_muons, fwdn_muons, ovlp_muons, ovln_muons, calosums=calo_sums, rankLUT=rankLUT, addTracks=True)
            if tower_indices is not None:
                input_testbench.addLine("# Tower indices:\n")
                cntr = 0
                for mu in outmuons:
                    if mu.bitword != 0:
                        cntr += 1
                input_testbench.writeTowerIndices(tower_indices[n_twrs:n_twrs+cntr])
                n_twrs += cntr

            serializer_testbench.writeMuonBasedOutputBX(outmuons, imdmuons)
            serializer_testbench.addLine("# Expected emulator output\n")
            serializer_testbench.writeFrameBasedOutputBX(outmuons, imdmuons)
            integration_testbench.addLine("# Expected emulator output\n")
            integration_testbench.writeFrameBasedOutputBX(outmuons, imdmuons)
            write_time = time.time() - evt_start - conversion_time
            avg_get_label_time += get_label_time
            avg_conversion_time += conversion_time
            avg_write_time += write_time
        print "total: ", time.time() - start
        print "setup: ", setup_time
        print "get_label:", "avg", avg_get_label_time/float(i+1), "last", get_label_time
        print "conversion: avg", avg_conversion_time/float(i+1), "last", conversion_time
        print "write: avg", avg_write_time/float(i+1), "last", write_time
        output_buffer.dump(True)
        input_testbench.dump()
        serializer_testbench.dump()
        deserializer_testbench.dump()
        input_buffer.dump()
        integration_testbench.dump()

if __name__ == "__main__":
    main()
