#CMSSW
from DataFormats.FWLite import Events, Handle

# ../tools:
from tools.vhdl import VHDLConstantsParser

# ./helpers:
from helpers.muon import Muon 
from helpers.options import parse_options, discover_files

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

def get_muon_line(mu, mu_type, rank, addIso = False):
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
    sortrank = min(mu.ptBits+mu.qualityBits, 1023)
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
    RETURNS: string with lines encoding muons (see get_muon_line)
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

def convert_input_vector_to_strings(vec, vhdl_dict, mu_type, size):
    """
    converts the input std::vector<l1t::L1TRegionalMuonCandidate> into 
    two strings with one containing one muon per line and the other encoding
    the tracks of three muons per line (atm phi, eta and quality)
    TAKES:  vec:        the input vector
            vhdl_dict:  as returned by ../tools/vhdl.VHDLConstantsParser
            mu_type:     BAR, OVL, FWD
            size:       36 / 18 depending on BAR or OVL/FWD
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
        mu_string += get_muon_line(mulist[i], mu_type, i/3+link_offset)
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

    for pattern, fnames in fname_dict.iteritems():
        print "+"*30, pattern, "+"*30
        events = Events(fnames['root'])

        out_handle = Handle('BXVector<l1t::Muon>')
        imd_handle = Handle('BXVector<l1t::Muon>')
        bar_handle = Handle('std::vector<l1t::L1TRegionalMuonCandidate>')
        fwd_handle = Handle('std::vector<l1t::L1TRegionalMuonCandidate>')
        ovl_handle = Handle('std::vector<l1t::L1TRegionalMuonCandidate>')

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

                table_head = "#{id:<5} {rank:>5} {pt:>5} {phi:>5} {eta:>5} {charge:>5} {charge_valid:>5} {quality:>5} {sort:>5} {empty:>5}\n".format(
                    id="TYPE", rank="POS", pt="PT", phi="PHI", eta="ETA", charge = "SIGN", charge_valid="VSIG", quality="QUAL", sort="RANK", empty="EMPT")
                out_file.write(table_head)

                # Get all input muon / track strins and write the muons to file
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

                table_head = "#{id:<5}".format(id="TYPE")
                for i in range(3):
                    table_head += " {eta:>5} {phi:>5} {quality:>5}".format(eta="ETA"+str(i),
                                                                           phi="PHI"+str(i),
                                                                           quality="QUAL"+str(i) )
                out_file.write(table_head+"\n")
                # Now write the tracks 
                out_file.write(track_string_fwdp)
                out_file.write(track_string_ovlp)
                out_file.write(track_string_bar)
                out_file.write(track_string_ovln)
                out_file.write(track_string_fwdn)

                out_file.write("#"*80+"\n")
                out_file.write("# Emulator information for event: {ievent}\n".format(ievent=i))
                out_file.write("#"*80+"\n")

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
                out_file.write(table_head)
                out_file.write(imd_muons_str)
                table_head = "#{id:<5} {rank:>5} {pt:>5} {phi:>5} {eta:>5} {charge:>5} {charge_valid:>5} {quality:>5} {sort:>5} {empty:>5} {iso:>5}\n".format(
                    id="TYPE", rank="POS", pt="PT", phi="PHI", eta="ETA", charge = "SIGN", charge_valid="VSIG", quality="QUAL", sort="RANK", empty="EMPT", iso="ISO")
                out_file.write(table_head)
                out_file.write(out_muons_str)

if __name__ == "__main__":
    main()

