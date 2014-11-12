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

#CMSSW
from DataFormats.FWLite import Events, Handle
#from L1Trigger.L1TGlobalMuon import MicroGMTRankPtQualLUT
# ../tools:
from tools.vhdl import VHDLConstantsParser

# ./helpers:
from helpers.muon import Muon 
from helpers.options import parse_options, discover_files

def get_header_algo():
    string = "#"*80
    string += """
# Pattern for testbench of the uGMT algo block
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

def get_header_serializer():
    string = "#"*80
    string += """
# Pattern for testbench of the uGMT serializer
# Data format of muons:
# ID N PT PHI ETA CHARGE CHARGE_VALID QUALITY SORT EMPTY (ISO)
# where ID = {FWD+/-, OVL+/-, BAR, OUT, FIMD, BIMD, OIMD}
# N is the rank for IMD / OUT and the link for inputs.
# ISO is optional and only present for OUT
# 
# Data format for output of serializer:
# ID VALID0 WORD0 VALID1 WORD1 ... VALIDN WORDN
# where ID = FRMx, x being the current 240 MHz cycle
# In WordX the X represents the link number, meaning that muon0 is x(FRM0, WORD0) + x(FRM1, WORD0) << 32.
"""
    return string




def link_from_phi(phi, mutype):
    """
    Calculates the link position given type and phi
    """
    if mutype == "BAR":
        phiToCable = 0.005859375*2
    else:
        phiToCable = 0.005859375 
    cable = int(phi*phiToCable)    
    return cable

def get_muon_line(mu, mu_type, rank, addIso = False, rankLUT = None):
    """ 
    Convert a single ./helpers/muon.Muon object into string
    TAKES:  mu          Muon object
            mu_type     muon type (BAR, FWD+/-, OVL+/-, FIMD, BIMD, OIMD, OUT)
            rank        relative position of the muon (IMD: 0-23, OUT: 0-7, FWD/OVL: 0-37, BAR: 0-35)
            addIso      whether to add isolation info (should only be done for OUT)
    RETYURNS: string "ID N PT PHI ETA CHARGE CHARGE_VALID QUALITY SORT EMPTY (ISO)"
    """
    isempty = 0
    if mu.ptBits == 0: isempty = 1
    sortrank = 0
    if rankLUT:
        sortrank = rankLUT.loopup(mu.ptBits, mu.qualityBits)
    else:
        sortrank = mu.rank
    string = "{id:<6} {rank:>5} {pt:>5} {phi:>5} {eta:>5} {charge:>5} {charge_valid:>5} {quality:>5} {sort:>5} {empty:>5}".format(
                    id=mu_type,
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

def get_muon_lines(mu_list, mu_type, addIso):
    """
    Convert a list of ./helpers/muon.Muon into strings as used by testbench
    TAKES:  mu_list:    list of ./helpers/muon.Muon objects
            mu_type:    muon type (BAR, FWD, OVL, IMD, OUT) 
                        -- IMD is converted into BIMD/FIMD/OIMD according to position in list 
            addIso      bool whether to add iso info as last info piece
    RETURNS: string with lines encoded muons (see get_muon_line)
    """
    string = ""
    themuid = mu_type
    for i, mu in enumerate(mu_list):
        if mu_type == "IMD":
            if i < 4 or i > 19: themuid = "FIMD"
            elif i < 8 or i > 15: themuid = "OIMD" 
            else: themuid = "BIMD"
        string += get_muon_line(mu, themuid, i, addIso)
    
    return string

def get_muon_words(imd_mu_list, out_mu_list):
    """
    Convert output and intermediate muons into 32bit word strings. 
    Used for testing the serializer stage
    TAKES:  imd_mu_list:    list of intermeidate muon objects
            out_mu_list:    list of outgoing muon objects
    RETURNS: string with lines of encoded muons

    """
    string = ""
    n_words_per_link = 6 # 6 240 MHz cycles in 40 MHz clock
    #msw_mask = 0xffffffff00000000
    lsw_mask = 0xffffffff

    out_words = [ [] for x in range(12)]# imd = 8; out = 4
    for i, mu in enumerate(out_mu_list):
        link = i / 2
        if i%2 == 0: # fill padding words
            out_words[link].append(0)
            out_words[link].append(0)
        bitword = mu.bitword
        msw = bitword >> 32
        lsw = bitword & lsw_mask
        out_words[link].append(lsw)
        out_words[link].append(msw)

    for i, mu in enumerate(imd_mu_list):
        link = i / 3+4
        bitword = mu.bitword
        msw = bitword >> 32
        lsw = bitword & lsw_mask
        out_words[link].append(lsw)
        out_words[link].append(msw)

    string += "#{id:<6} ".format(id="ID")
    for link in range(12): string += "{valid:>3} {word:>8} ".format(valid="V"+str(link), word="LINK"+str(link))
    string += "\n"
    for frm in range(n_words_per_link):
        string += "{n:<7} ".format(n="FRM"+str(frm))
        for link in range(12):
            valid = 1
            if frm < 2 and link < 4: valid = 0
            string += "{valid:>3} {word:0>8x} ".format(valid=valid, word=out_words[link][frm])

        string += "\n"

    return string

def convert_input_vector_to_strings(vec, vhdl_dict, mu_type, size, rankLUT):
    """
    converts the input std::vector<l1t::L1TRegionalMuonCandidate> into 
    two strings with one containing one muon per line and the other encoding
    the tracks of three muons per line (atm phi, eta and quality)
    TAKES:  
        vec:        the input vector
        vhdl_dict:  as returned by ../tools/vhdl.VHDLConstantsParser
        mu_type:    BAR, OVL, FWD
        size:       36 / 18 depending on BAR or OVL/FWD
        rankLUT:    the CMSSW loop-up-table to calculate rank
    RETURNS: pair of strings:
        [0] muon strings (see get_muon_line)
        [1] muon track lines "ETA0 PHI0 QUALITY0 ETA1 PHI1 QUALITY1 ETA2 PHI2 QUALITY2"
    """
    # Putting together the right key for the vhdl dict: e.g. FWD_NEG_LOW or BARREL_LOW
    vhdl_key = mu_type.replace("-", "_NEG")
    vhdl_key = vhdl_key.replace("+", "_POS")
    vhdl_key = vhdl_key.replace("BAR", "BARREL")
    vhdl_key += "_LOW"
    link_offset = vhdl_dict[vhdl_key]

    mulist = [ None for i in xrange(size)]
    for mu in vec:
        mu_tmp = Muon(vhdl_dict, mu_type="IN", obj=mu)
        # only take muons from the right side of the detector
        if mu_type.endswith("+") and mu_tmp.etaBits < 0: continue
        if mu_type.endswith("-") and mu_tmp.etaBits > 0: continue

        # because we don't book all 72*3 muons but only 18*3/36*3
        loc_link = mu.link()-link_offset
        if mulist[loc_link*3] == None: 
            mulist[loc_link*3] = mu_tmp
        elif mulist[loc_link*3+1] == None:
            mulist[loc_link*3+1] = mu_tmp
        elif mulist[loc_link*3+2] == None:
            mulist[loc_link*3+2] = mu_tmp
        else:
            print "ERROR", mu_tmp.phiBits, loc_link, mu_type

    # compose the track starting word
    track_id = mu_type[0]+"TRK"
    if mu_type.endswith("+"): track_id += "+"
    if mu_type.endswith("-"): track_id += "-"
    track_string = ""
    track_string_template = " {eta:>5} {phi:>5} {quality:>5}"
    mu_string = ""
    for i in xrange(len(mulist)):
        if mulist[i] == None:
            mulist[i] = mu_tmp = Muon(vhdl_dict, mu_type="IN", bitword=0)
        mu_string += get_muon_line(mulist[i], mu_type, i/3+link_offset, rankLUT)
        if (i+1)%3 == 0: # to make sure all three muons are instantiated
            track_string += "{id:<6}".format(id=track_id)
            for j in [2, 1, 0]:
                track_string += track_string_template.format(eta=mulist[i-j].etaBits, phi=mulist[i-j].phiBits, quality=mulist[i-j].qualityBits)
            track_string += "\n"
            
    return mu_string, track_string


def main() :
    vhdl_dict = VHDLConstantsParser.parse_vhdl_file("data/ugmt_constants.vhd")

    opts, args = parse_options()
    fname_dict = discover_files(opts)
    
    rankLUT = l1t.MicroGMTRankPtQualLUT()


    for pattern, fnames in fname_dict.iteritems():
        print "+"*30, pattern, "+"*30
        events = Events(fnames['root'])

        out_handle = Handle('BXVector<l1t::Muon>')
        imd_handle = Handle('BXVector<l1t::Muon>')
        bar_handle = Handle('std::vector<l1t::L1TRegionalMuonCandidate>')
        fwd_handle = Handle('std::vector<l1t::L1TRegionalMuonCandidate>')
        ovl_handle = Handle('std::vector<l1t::L1TRegionalMuonCandidate>')

        algo_fname = "data/patterns/testbench/{pname}.txt".format(pname = pattern)
        ser_fname = "data/patterns/testbench/serializer_{pname}.txt".format(pname = pattern)

        algo_string = get_header_algo()
        ser_string = get_header_serializer()

        for i, event in enumerate(events):
            event_head = "#"*80+"\n"
            event_head += "# Event: {ievent}\n".format(ievent=i)
            event_head += "#"*80+"\n"

            algo_string += event_head
            ser_string += event_head

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

            table_head = "#{id:<5} {rank:>5} {pt:>5} {phi:>5} {eta:>5} {charge:>5} {charge_valid:>5} {quality:>5} {sort:>5} {empty:>5}\n".format(
                id="TYPE", rank="POS", pt="PT", phi="PHI", eta="ETA", charge = "SIGN", charge_valid="VSIG", quality="QUAL", sort="RANK", empty="EMPT")
            algo_string += table_head

            # Get all input muon / track strins and write the muons to file
            muon_string_fwdp, track_string_fwdp = convert_input_vector_to_strings(emu_fwd_muons, vhdl_dict, "FWD+", 18, rankLUT)
            algo_string += muon_string_fwdp
            muon_string_ovlp, track_string_ovlp = convert_input_vector_to_strings(emu_ovl_muons, vhdl_dict, "OVL+", 18, rankLUT)
            algo_string += muon_string_ovlp
            muon_string_bar, track_string_bar = convert_input_vector_to_strings(emu_bar_muons, vhdl_dict, "BAR", 36, rankLUT)
            algo_string += muon_string_bar
            muon_string_ovln, track_string_ovln = convert_input_vector_to_strings(emu_ovl_muons, vhdl_dict, "OVL-", 18, rankLUT)
            algo_string += muon_string_ovln
            muon_string_fwdn, track_string_fwdn = convert_input_vector_to_strings(emu_fwd_muons, vhdl_dict, "FWD-", 18, rankLUT)
            algo_string += muon_string_fwdn

            table_head = "#{id:<5}".format(id="TYPE")
            for i in range(3):
                table_head += " {eta:>5} {phi:>5} {quality:>5}".format(eta="ETA"+str(i),
                                                                       phi="PHI"+str(i),
                                                                       quality="QUAL"+str(i) )
            algo_string += table_head+"\n"
            # Now write the tracks 
            algo_string += track_string_fwdp
            algo_string += track_string_ovlp
            algo_string += track_string_bar
            algo_string += track_string_ovln
            algo_string += track_string_fwdn

            algo_string += "#"*80+"\n"
            algo_string += "# Emulator information for event: {ievent}\n".format(ievent=i)
            algo_string += "#"*80+"\n"

            # first convert the output / intermediate muons into simple py-litst
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

            # convert them into strings and write to file
            out_muons_str = get_muon_lines(out_list, mu_type="OUT", addIso=True)
            imd_muons_str = get_muon_lines(imd_list, mu_type="IMD", addIso=False)
            table_head = "#{id:<5} {rank:>5} {pt:>5} {phi:>5} {eta:>5} {charge:>5} {charge_valid:>5} {quality:>5} {sort:>5} {empty:>5}\n".format(
                id="TYPE", rank="POS", pt="PT", phi="PHI", eta="ETA", charge = "SIGN", charge_valid="VSIG", quality="QUAL", sort="RANK", empty="EMPT")
            algo_string += table_head
            algo_string += imd_muons_str
            ser_string += table_head
            ser_string += imd_muons_str
            table_head = "#{id:<5} {rank:>5} {pt:>5} {phi:>5} {eta:>5} {charge:>5} {charge_valid:>5} {quality:>5} {sort:>5} {empty:>5} {iso:>5}\n".format(
                id="TYPE", rank="POS", pt="PT", phi="PHI", eta="ETA", charge = "SIGN", charge_valid="VSIG", quality="QUAL", sort="RANK", empty="EMPT", iso="ISO")
            algo_string += table_head
            algo_string += out_muons_str
            ser_string += table_head
            ser_string += out_muons_str

            ser_string += "#"*80+"\n"
            ser_string += "# Expected serializer output for event: {ievent}\n".format(ievent=i)
            ser_string += "#"*80+"\n"

            ser_string += get_muon_words(imd_list, out_list)

        with open(algo_fname, 'w') as algo_file:
            algo_file.write(algo_string)

        with open(ser_fname, 'w') as ser_file:
            ser_file.write(ser_string)

if __name__ == "__main__":
    main()

