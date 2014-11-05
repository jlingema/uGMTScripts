
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
from helpers.options import parse_options, discover_files

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

    opts, args = parse_options()
    fname_dict = discover_files(opts)

    for pattern, fnames in fname_dict.iteritems():
        events = Events(fnames['root'])

        out_handle = Handle('BXVector<l1t::Muon>')
        imd_handle = Handle('BXVector<l1t::Muon>')

        for i, event in enumerate(events):
            event.getByLabel("microGMTEmulator", out_handle)
            event.getByLabel("microGMTEmulator", "intermediateMuons", imd_handle)

            emu_out_muons = out_handle.product()
            imd_prod = imd_handle.product()

        input_parser = InputBufferParser(fnames['rx'], vhdl_dict)

        inputs = input_parser.get_input_muons()
        out_fname = "data/patterns/testbench/{pname}.txt".format(pname = pattern)

        with open(out_fname, 'w') as out_file:
            tracks = ""

            for i, inmu in enumerate(inputs):
                local_imu = i%108
                trktype = ""
                if local_imu < 18: 
                    out_file.write("FWD- ")
                    trktype = "FTRK-"
                elif local_imu < 36: 
                    out_file.write("OVL- ")
                    trktype = "OTRK-"
                elif local_imu < 72: 
                    out_file.write("BAR  ")
                    trktype = "BTRK"
                elif local_imu < 90: 
                    out_file.write("OVL+ ")
                    trktype = "OTRK+"
                else: 
                    out_file.write("FWD+ ")
                    trktype = "FTRK+"

                out_file.write("%i " % (local_imu/3)) #link number
                # muon: pt = 18,  phi = 5.19235,  eta = 0.91875,  charge = 0
                isempty = 0
                if inmu.ptBits == 0: isempty = 1
                sortrank = min(inmu.ptBits+inmu.qualityBits, 1023)
                out_file.write("{pt} {phi} {eta} {charge} {charge_valid} {quality} {sort} {empty} \n".format(
                    pt=inmu.ptBits,
                    phi=inmu.phiBits,
                    eta=inmu.etaBits,
                    charge=inmu.Sysign & 0x1,
                    charge_valid=inmu.Sysign >> 1,
                    quality=inmu.qualityBits,
                    sort=sortrank,
                    empty=isempty
                    ))

                if local_imu%3 == 0:
                    tracks += "\n"+trktype+" "
                tracks += "{eta} {phi} {quality} ".format(eta=inmu.etaBits, phi=inmu.phiBits, quality=inmu.qualityBits)

                if local_imu == 107:
                    out_file.write(tracks+"\n")
                    tracks = ""

            out_file.write(tracks+"\n")
