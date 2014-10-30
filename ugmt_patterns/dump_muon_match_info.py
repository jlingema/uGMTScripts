import os
from mp7_buffer_parser import InputBufferParser, OutputBufferParser
from tools.vhdl import VHDLConstantsParser
from tools.muon_helpers import print_out_word, print_in_word
from plot_buffer_content import determine_version_from_filename,  parse_options



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
    if mu1.bx == mu2.bx:                     relation += 30 
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
    for outmu in outmus:
        in_match_dict[outmu] = [0, None]
        for inmu in inmus:
            relation = calculate_relation(inmu, outmu)
            if in_match_dict[outmu][0] < relation:
                in_match_dict[outmu] = [relation, inmu]
        imd_match_dict[outmu] = [0, None]
        for imdmu in imdmus:
            relation = calculate_relation(imdmu, outmu)
            #if relation isn't just random, put it in the dict
            if imd_match_dict[outmu][0] < relation and relation > 19: 
                imd_match_dict[outmu] = [relation, imdmu]

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
        version = determine_version_from_filename(filename)
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
        for outmu in out_mu_non_zero:
            in_match = in_matches[outmu]
            imd_match = imd_matches[outmu]
            mismatch = in_match[1] == None or outmu.bx != in_match[1].bx or imd_match[1] == None or outmu.bx != imd_match[1].bx
            # first dump the matches with some additional info:
            if (mismatch or options.detaildump):
                print "+"*30, "BX", outmu.bx, "+"*30
                print "out: ", print_out_word(outmu.bitword), "in BX", outmu.bx, "( frame:", outmu.frame, " link:", outmu.link, ")"
                if imd_match[1] != None:
                    print "imd: ", print_out_word(imd_match[1].bitword), "in BX", imd_match[1].bx, "( frame:", imd_match[1].frame, " link:", imd_match[1].link, ")"
                else: 
                    print "imd: NO MATCH"
                if in_match[1] != None:
                    print "in : ", print_in_word(in_match[1].bitword), "in BX", in_match[1].bx, "( frame:", in_match[1].frame, " link:", in_match[1].link, ")"
                else:
                    print "in : NO MATCH"

            # Now, dump details about the BXs that were connected above (if options.verbose --> option -v)
            if options.verbose and mismatch and in_match[1] != None and imd_match[1] != None:
                bxs = [outmu.bx]
                if not in_match[1].bx in bxs: bxs.append(in_match[1].bx)
                if not imd_match[1].bx in bxs: bxs.append(imd_match[1].bx)
                print "BX dumps:"
                for bx in bxs:
                    print "BX ", bx
                    print "-"*30 + "non-zero in muons: -" + "-"*30
                    for iinmu in xrange(bx*108, (bx+1)*108):
                        if iinmu < len(in_muons):
                            inmu = in_muons[iinmu]
                            if inmu.bitword != 0: 
                                print print_in_word(inmu.bitword), "in BX", inmu.bx, "( frame:", inmu.frame, " link:", inmu.link, ")"
                    print "-"*30 + "non-zero imd muons: " + "-"*30
                    for iimu in xrange(bx*24, (bx+1)*24):
                        if iimu < len(intermediate_muons):
                            imdmu = intermediate_muons[iimu]
                            if imdmu.bitword != 0: 
                                print print_out_word(imdmu.bitword), "in BX", imdmu.bx, "( frame:", imdmu.frame, " link:", imdmu.link, ")"
                    print "-"*30 + "non-zero fin muons: " + "-"*30
                    for iomu in xrange(bx*8, (bx+1)*8):
                        if iomu < len(out_muons):
                            omu = out_muons[iomu]
                            if omu.bitword != 0: 
                                print print_out_word(omu.bitword), "in BX", omu.bx, "( frame:", omu.frame, " link:", omu.link, ")"
                    
