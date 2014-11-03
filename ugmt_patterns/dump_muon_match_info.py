import os
from helpers.mp7_buffer_parser import InputBufferParser, OutputBufferParser, Version
from tools.vhdl import VHDLConstantsParser
from tools.muon_helpers import print_out_word, print_in_word
from helpers.options import  parse_options


class Relation():
    max_relation = -1
    bx_factor = 30

def calculate_relation(mu1, mu2):
    """
    | Calculate the relation of two muons:
    | counts bits that are compatible and takes BX into account with a high weight
    | TAKES: two Muon objects
    | RETURNS: relation_factor: number of bits compatible + 30 * (bx1 == bx2)
    """
    relation = 0 #counting bits that match
    if mu1.phiBits == mu2.phiBits:           relation += 9
    if mu1.etaBits == mu2.etaBits:           relation += 8
    if mu1.ptBits == mu2.ptBits:             relation += 9
    if mu1.qualityBits == mu2.qualityBits:   relation += 4
    if mu1.Sysign == mu2.Sysign:             relation += 2
    # always prefer matches from the same BX: (kinda arbitrary)
    if mu1.bx == mu2.bx:                     relation += Relation.bx_factor
    # change this if one factor is changes:
    Relation.max_relation = 9+8+9+4+2+Relation.bx_factor
    return relation



def get_closest_matches(inmus, outmus, imdmus):
    """
    | Get the closest matches in input muons / intermediate muons for each
    | final muon.
    | TAKES: Three lists of Muon objects
    |           inmus: input muons
    |           outmus: final muons
    |           imdmus: intermediate muons
    | RETURNS: Two dicts of matches, with output Muon object as key
    |           first: in_match_dict: maps out_muon --> [relation_factor, in_muon]
    |           second: imd_match_dict: maps out_muon --> [relation_factor, intermediate_muon]
    """
    in_match_dict = {}
    imd_match_dict = {}
    for mu_out in outmus:
        in_match_dict[mu_out] = [0, None]
        for mu_in in inmus:
            relation = calculate_relation(mu_in, mu_out)
            if in_match_dict[mu_out][0] < relation:
                in_match_dict[mu_out] = [relation, mu_in]
        imd_match_dict[mu_out] = [0, None]
        for mu_imd in imdmus:
            relation = calculate_relation(mu_imd, mu_out)
            #if relation isn't just random, put it in the dict
            if imd_match_dict[mu_out][0] < relation and relation > 19: 
                imd_match_dict[mu_out] = [relation, mu_imd]

    return in_match_dict, imd_match_dict

if __name__ == "__main__":
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
            if ".root" in fname:
                tmp_dict["root"] = fname
        if tmp_dict != {}: 
            file_dict[roots] = tmp_dict

    for filename in file_dict:
        version = Version.from_filename(filename)
        print "+"*30, filename, "+"*30

        # Reading and processing the hardware data
        input_parser = InputBufferParser("{f}/{fn}".format(f=filename, fn=file_dict[filename]["rx"]), vhdl_dict)
        output_parser = OutputBufferParser("{f}/{fn}".format(f=filename, fn=file_dict[filename]["tx"]), vhdl_dict, version)

        in_muons = input_parser.get_input_muons()
        out_muons = output_parser.get_output_muons()
        intermediate_muons = output_parser.get_intermediate_muons()

        in_mu_non_zero = [ in_mu for in_mu in in_muons if in_mu.bitword != 0 ]
        out_mu_non_zero = [ out_mu for out_mu in out_muons if out_mu.bitword != 0 ]
        imd_mu_non_zero = [imd_mu for imd_mu in intermediate_muons if imd_mu.bitword != 0 ]

        # get closest matches:
        in_matches, imd_matches = get_closest_matches(in_mu_non_zero, out_mu_non_zero, imd_mu_non_zero)


        ### Now dump everything into the console options.detaildump --> -u option:
        print "="*20, "Printing Closest Matches", "with BX mismatch"*(not options.detaildump), "="*20
        for mu_out in out_mu_non_zero:
            rel_in = in_matches[mu_out][0]
            rel_imd = imd_matches[mu_out][0]
            mu_in = in_matches[mu_out][1]
            mu_imd = imd_matches[mu_out][1]

            # check if the match was not perfect
            mismatch = rel_in < Relation.max_relation or rel_imd < Relation.max_relation
            # check if BX is the same... as a few bits were usually not fitting
            mismatch_bx = mu_in == None or mu_imd == None or mu_in.bx != mu_out.bx or mu_imd.bx != mu_out.bx

            # first dump the matches with some additional info:
            if (mismatch_bx or (mismatch and options.verbose) or options.detaildump):
                print "+"*30, "BX", mu_out.bx, "+"*30
                print "out: ", print_out_word(mu_out.bitword), "in BX", mu_out.bx, "( frame:", mu_out.frame, " link:", mu_out.link, ")"
                if mu_imd != None:
                    print "imd: ", print_out_word(mu_imd.bitword), "in BX", mu_imd.bx, "( frame:", mu_imd.frame, " link:", mu_imd.link, \
                        " match: {match:.2%} )".format(match=rel_imd/float(Relation.max_relation))
                else: 
                    print "imd: NO MATCH"
                if mu_in != None:
                    print "in : ", print_in_word(mu_in.bitword), "in BX", mu_in.bx, "( frame:", mu_in.frame, " link:", mu_in.link, \
                        " match: {match:.2%} )".format(match=rel_in/float(Relation.max_relation))
                else:
                    print "in : NO MATCH"

            # Now, dump details about the BXs that were connected above (if options.verbose --> option -v)
            if options.verbose and mismatch and mu_in != None and mu_imd != None:
                bxs = [mu_out.bx]
                if not mu_in.bx in bxs: bxs.append(mu_in.bx)
                if not mu_imd.bx in bxs: bxs.append(mu_imd.bx)
                print "BX dumps:"

                for bx in bxs:
                    print "BX ", bx
                    print "-"*30 + "non-zero in muons: -" + "-"*30
                    for iinmu in xrange(bx*108, (bx+1)*108):
                        if iinmu < len(in_muons):
                            in_mu = in_muons[iinmu]
                            if in_mu.bitword != 0: 
                                print print_in_word(in_mu.bitword), "in BX", in_mu.bx, "( frame:", in_mu.frame, " link:", in_mu.link, ")"
                    print "-"*30 + "non-zero imd muons: " + "-"*30
                    for iimu in xrange(bx*24, (bx+1)*24):
                        if iimu < len(intermediate_muons):
                            imd_mu = intermediate_muons[iimu]
                            if imd_mu.bitword != 0: 
                                print print_out_word(imd_mu.bitword), "in BX", imd_mu.bx, "( frame:", imd_mu.frame, " link:", imd_mu.link, ")"
                    print "-"*30 + "non-zero fin muons: " + "-"*30
                    for iomu in xrange(bx*8, (bx+1)*8):
                        if iomu < len(out_muons):
                            omu = out_muons[iomu]
                            if omu.bitword != 0: 
                                print print_out_word(omu.bitword), "in BX", omu.bx, "( frame:", omu.frame, " link:", omu.link, ")"
                    
