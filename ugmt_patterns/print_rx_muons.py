from helpers.mp7_buffer_parser import InputBufferParser, Version
from tools.muon_helpers import print_in_word
from helpers.options import parse_options, discover_files
from tools.vhdl import VHDLConstantsParser

if __name__ == "__main__":
    vhdl_dict = VHDLConstantsParser.parse_vhdl_file("data/ugmt_constants.vhd")
    options = parse_options()
    file_dict = discover_files(options)

    for pattern, fnames in file_dict.iteritems():
        version = Version.from_filename(fnames['base'])
        print "+"*30, "version detected:", version, "+"*30
        print "+"*30, pattern, "+"*30

        # Reading and processing the hardware data
        input_parser = InputBufferParser(fnames["rx"], vhdl_dict)
        in_muons = input_parser.get_input_muons()
        non_zero = [ mu for mu in in_muons if mu.bitword != 0 ]
        
        emu_in_muons = None
        if "emu_rx" in fnames.keys():
            emu_input_parser = InputBufferParser(fnames["emu_rx"], vhdl_dict)
            emu_in_muons = emu_input_parser.get_input_muons()
            non_zero_emu = [ mu for mu in emu_in_muons if mu.bitword != 0 ]


        if emu_in_muons is not None:
            mu_to_print = {}
            if options.verbose:
                mu_to_print = zip(in_muons, emu_in_muons)
            else:
                mu_to_print = zip(non_zero, non_zero_emu)

            last_bx = 0
            for mu, mu_emu in mu_to_print:
                if mu.bx != last_bx:
                    print "*"*50, "current bx:", mu.bx, mu_emu.bx, "*"*50
                    last_bx = mu.bx
                if options.verbose or (mu.bitword != mu_emu.bitword):
                    print "hw", print_in_word(mu.bitword), "emu", print_in_word(mu_emu.bitword)
        else:
            mu_to_print = []
            if options.verbose:
                mu_to_print = in_muons
            else:
                mu_to_print = non_zero

            last_bx = 0            
            for mu in non_zero:
                if mu.bx != last_bx:
                    print "*"*50, "current bx:", mu.bx, "*"*50
                    last_bx = mu.bx

                print print_in_word(mu.bitword)