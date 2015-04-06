import zlib
import argparse
import os
import subprocess
import time
import difflib

import exceptions
import sys
sys.path.append('../')

from helpers.mp7_buffer_parser import OutputBufferParser, Version
from tools.vhdl import VHDLConstantsParser

def compress(pattern_fname, comp_fname):
    with open(comp_fname, 'w') as ofile:
        with open(pattern_fname, 'r') as ifile:
            ofile.write( zlib.compress(ifile.read()) )

def decompress(pattern_fname, comp_fname):
    with open(comp_fname, 'r') as ifile:
        with open(pattern_fname, 'w') as ofile:
            ofile.write( zlib.decompress(ifile.read()) )


def parse_options():
    desc = "Interface for multi-buffer test"
        
    parser = argparse.ArgumentParser(description=desc, formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('boardname', type=str, default='ugmt_b40', help='name of mp7 board')
    parser.add_argument('--dir', type=str, dest='directory', default='patterns/many_events/', help='directory containing compressed patterns')
    parser.add_argument('--dump', default=False, action='store_true', help='flag for actually dumping the buffers')
    parser.add_argument('--out', type=str, dest='outpath', default='dumps', help='directory for buffer dumps')
    parser.add_argument('--test', type=str, dest='testpath', default='', help='directory containing HW response (suppresses HW access)')

    # parser.add_argument('--details', default=False, action='store_true', help='do detailed analysis of individual muons')
    opts = parser.parse_args()
    
    return opts

class Analyser():
    def __init__(self, emufname, hwfname, vhdcfg):
        self.emufname = emufname
        self.hwfname = hwfname
        self.vhdcfg = vhdcfg

        self.pt_errors = {}
        self.phi_errors = {}
        self.iso_errors = {}
        self.eta_errors = {}
        self.chrg_errors = {}
        self.qual_errors = {}
        self.errors = []

        self.emuversion = Version("99_99_99")
        self.hwversion = Version("0_2_19")
        self.event_ctr = 0
        self.event_nontrivial_cntr = 0
        self.mu_cntr = 0

    def analyse(self, filecnt):
        eventstart = filecnt*160
        print "emulator", self.emufname
        emu_parser = OutputBufferParser(self.emufname, self.vhdcfg, self.emuversion)
        hw_parser = OutputBufferParser(self.hwfname, self.vhdcfg, self.hwversion)
        emuout = emu_parser.get_output_muons()
        print "HW", self.hwfname
        hwout = hw_parser.get_output_muons()
        self.event_ctr += len(emuout)/8
        mucntr = 0 # running index
        muon_nonzero_ctr = 0 # counts how many non-zero
        for emu, hw in zip(emuout, hwout):
            event = mucntr/8+eventstart
            if (emu.bitword != 0): 
                muon_nonzero_ctr += 1
            if emu.bitword != hw.bitword: 
                if not event in self.errors: 
                    self.errors.append(event)
                    self.pt_errors[event] = 0
                    self.phi_errors[event] = 0
                    self.iso_errors[event] = 0
                    self.eta_errors[event] = 0
                    self.chrg_errors[event] = 0
                    self.qual_errors[event] = 0
                if emu.ptBits != hw.ptBits: self.pt_errors[event] += 1
                if emu.phiBits != hw.phiBits: self.phi_errors[event] += 1
                if emu.etaBits != hw.etaBits: self.eta_errors[event] += 1
                if emu.Iso != hw.Iso: self.iso_errors[event] += 1
                if emu.Sysign != hw.Sysign: self.chrg_errors[event] += 1
                if emu.qualityBits != hw.qualityBits: self.qual_errors[event] += 1
            mucntr += 1
            if mucntr%8 == 0: # for every event check
                self.mu_cntr += muon_nonzero_ctr
                if muon_nonzero_ctr > 1:
                    self.event_nontrivial_cntr += 1
                muon_nonzero_ctr = 0


    def get_total(self, cntr_dict):
        evts = []
        total = 0
        for ev, n in cntr_dict.iteritems():
            total += n
            if not ev in evts and n != 0:  evts.append(ev)
        return total, evts

    def print_out(self, pattern, logger):
        logger.write("Errors in pattern {pat}\n".format(pat=pattern))
        print "error summary for pattern:", pattern
        print "-----------------------------------------------------------------------"
        print "Note counters: nerrors / total instances (non-trivial instances)"
        print "-----------------------------------------------------------------------"
        logger.write("number of events with errors: {n} / {tot} ({nontriv})\n".format(n=len(self.errors), tot=self.event_ctr, nontriv=self.event_nontrivial_cntr))
        print "number of events with errors: {n} / {tot} ({nontriv})".format(n=len(self.errors), tot=self.event_ctr, nontriv=self.event_nontrivial_cntr)
        logger.write("errornous events: {evts}\n".format(evts=self.errors))
        tot, events = self.get_total(self.pt_errors)
        print "number of pt errors:   ", tot, "/", self.mu_cntr
        logger.write("number of muons with pt errors: {n} / {total}\n".format(n=tot, total=self.mu_cntr))
        logger.write("errornous events: {evts}\n".format(evts=events))

        tot, events = self.get_total(self.phi_errors)
        print "number of phi errors:  ", tot, "/", self.mu_cntr
        logger.write("number of muons with phi errors: {n} / {total}\n".format(n=tot, total=self.mu_cntr))
        logger.write("errornous events: {evts}\n".format(evts=events))

        tot, events = self.get_total(self.eta_errors)
        print "number of eta errors:  ", tot, "/", self.mu_cntr
        logger.write("number of muons with eta errors: {n} / {total}\n".format(n=tot, total=self.mu_cntr))
        logger.write("errornous events: {evts}\n".format(evts=events))

        tot, events = self.get_total(self.qual_errors)
        print "number of qual errors: ", tot, "/", self.mu_cntr
        logger.write("number of muons with qual errors: {n} / {total}\n".format(n=tot, total=self.mu_cntr))
        logger.write("errornous events: {evts}\n".format(evts=events))
        
        tot, events = self.get_total(self.chrg_errors)
        print "number of chrg errors: ", tot, "/", self.mu_cntr
        logger.write("number of muons with chrg errors: {n} / {total}\n".format(n=tot, total=self.mu_cntr))
        logger.write("errornous events: {evts}\n".format(evts=events))
        
        tot, events = self.get_total(self.iso_errors)
        print "number of iso errors:  ", tot, "/", self.mu_cntr
        logger.write("number of muons with iso errors: {n} / {total}\n".format(n=tot, total=self.mu_cntr))
        logger.write("errornous events: {evts}\n".format(evts=events))
        print "-----------------------------------------------------------------------"
        print "for more info see log file."

def main():
    opts = parse_options()
    file_list_rx = []
    file_list_tx = []
    pattern_name = ""

    for root, dirs, files in os.walk(opts.directory):
        for fname in files:
            if fname.startswith('tx_') and fname.endswith('.zip'):
                # strip leading tx_ and _<i>.zip
                pattern_name = fname[3:-6] 
                file_list_tx.append(root+fname)
            if fname.startswith('rx_') and fname.endswith('.zip'):
                file_list_rx.append(root+fname)

    known_responses = []
    if opts.testpath != '':
        for root, dirs, files in  os.walk(opts.testpath):
            for fname in files:
                if fname.startswith('tx_'):
                    known_responses.append(root+fname)

    # this should make them synchronised
    file_list_rx.sort(); file_list_tx.sort(); known_responses.sort()

    if len(file_list_rx) != len(file_list_tx):
        print "Number of RX and TX files not the same!"
        return
        
    print "-"*30, pattern_name, "-"*30
    print "Starting test: A total of {i} files will be fed into the algorithm".format(i=len(file_list_rx))
    log = open('{pattern}.log'.format(pattern=pattern_name), 'w')

    vhdl_cfg = VHDLConstantsParser.parse_vhdl_file("data/ugmt_constants.vhd")
    analyser = Analyser('tx_tmp.txt', 'tmp/tx_summary.txt', vhdl_cfg)

    for i in range(len(file_list_rx)):
        cmp_rx = file_list_rx[i]
        cmp_tx = file_list_tx[i]
        rx_tmp_name = 'rx_tmp.txt'
        tx_tmp_name = 'tx_tmp.txt'
        decompress(rx_tmp_name, cmp_rx)
        decompress(tx_tmp_name, cmp_tx)

        cap_lines = []
        if opts.testpath == '':
            butler_out = ''
            try:
                subprocess.check_output(['mp7butler.py', 'buffers', opts.boardname, 'algoPlay', '--inject', 'file://{fname}'.format(fname=rx_tmp_name)])
            except subprocess.CalledProcessError as e:
                print " errors in mp7_butler: "+str(e)
                return
            log.write(butler_out)
            time.sleep(1)
            try:
                subprocess.check_output(['mp7butler.py', 'capture', opts.boardname, '--outputpath', 'tmp'])
            except subprocess.CalledProcessError as e:
                print " errors in mp7_butler: "+str(e)
                return
            log.write(butler_out)

            cap_lines = []
            with open('tmp/tx_summary.txt', 'r') as cap:
                cap_lines = cap.readlines()
                # if opts.dump:
                #     with open(opts.outpath+'/tx_summary_{x}.txt'.format(x=i), 'w') as ofile:
                #         for lin in cap_lines: 
                #             ofile.write(lin)
            # if opts.dump:
            #     with open('tmp/rx_summary.txt', 'r') as cap:
            #         with open(opts.outpath+'/rx_summary_{x}.txt'.format(x=i), 'w') as ofile:
            #             ofile.write(cap.read())


        else:
            with open(known_responses[i], 'r') as cap:
                cap_lines = cap.readlines()
            analyser.hwfname = known_responses[i]

        # quick analysis whether the tx buffers are the same
        emu_lines = []
        with open(tx_tmp_name, 'r') as emu:
            emu_lines = emu.readlines()
        

        diff = difflib.context_diff(emu_lines, cap_lines)
        have_errors = False
        for d in diff:
            if d.startswith("***************"): 
                have_errors = True
                break
        # if they are not: do detailed analysis
        if have_errors:
            analyser.analyse(i)

    # print summary and write details to log
    analyser.print_out(pattern_name, log)
    log.close()

if __name__ == "__main__":
    main()
