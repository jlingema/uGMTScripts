from helpers.muon import Muon
from helpers.pattern_dumper import PatternDumper, TestbenchWriter
from helpers.mp7_buffer_parser import InputBufferParser


from helpers.options import parse_options, discover_files
from tools.logger import log
from tools.vhdl import VHDLConstantsParser

#ROOT
from ROOT import gSystem, gROOT

def setupROOT():
    gSystem.Load("libFWCoreFWLite")
    gROOT.ProcessLine('AutoLibraryLoader::enable();')
    gSystem.Load("libFWCoreFWLite")
    gSystem.Load("libCintex")
    gROOT.ProcessLine('ROOT::Cintex::Cintex::Enable();')

setupROOT()
gSystem.Load("libL1TriggerL1TGlobalMuon")

from ROOT import l1t

def main():
    _log = log.init_logging("main")

    vhdl_dict = VHDLConstantsParser.parse_vhdl_file("data/ugmt_constants.vhd")

    basedir_testbench = "data/patterns/emu/"
    rankLUT = l1t.MicroGMTRankPtQualLUT()

    options = parse_options()
    file_dict = discover_files(options)
    for pattern, fnames in file_dict.iteritems():
        _log.info("{patt:+^90}".format(patt=pattern))

        _log.info("{info:>90}".format(info="HW PARSING"))
        # Reading and processing the hardware data
        input_parser = InputBufferParser(fnames["rx"], vhdl_dict)
        in_muons = input_parser.get_input_muons()

        input_testbench = PatternDumper(basedir_testbench+pattern+".txt", vhdl_dict, TestbenchWriter)
        offset = 36
        fwdp_range = range(offset+vhdl_dict["FWD_POS_LOW"], offset+vhdl_dict["FWD_POS_HIGH"])
        fwdn_range = range(offset+vhdl_dict["FWD_NEG_LOW"], offset+vhdl_dict["FWD_NEG_HIGH"])
        bar_range = range(offset+vhdl_dict["BARREL_LOW"], offset+vhdl_dict["BARREL_HIGH"])
        ovlp_range = range(offset+vhdl_dict["OVL_POS_LOW"], offset+vhdl_dict["OVL_POS_HIGH"])
        ovln_range = range(offset+vhdl_dict["OVL_NEG_LOW"], offset+vhdl_dict["OVL_NEG_HIGH"])

        while len(in_muons) > 0:
            bar_muons = []
            ovlp_muons = []
            ovln_muons = []
            fwdp_muons = []
            fwdn_muons = []
            for i in range(108):
                mu = in_muons[0]
                if mu.link in fwdp_range: fwdp_muons.append(mu)
                if mu.link in fwdn_range: fwdn_muons.append(mu)
                if mu.link in ovlp_range: ovlp_muons.append(mu)
                if mu.link in ovln_range: ovln_muons.append(mu)
                if mu.link in bar_range: bar_muons.append(mu)

                del in_muons[0]

            input_testbench.writeMuonBasedInputBX(bar_muons, fwdp_muons, fwdn_muons, ovlp_muons, ovln_muons, [], rankLUT, False, True)
        input_testbench.dump()

if __name__ == "__main__":
    main()