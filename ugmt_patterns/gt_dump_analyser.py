from helpers.muon import Muon

def get_gt_muons(fname, offset, nbx, vhdl_dict):
    with open(fname) as fobj: 
        for i in range(offset):
            fobj.readline()

        muons = []
        for i in range(nbx):
            line = fobj.readline()
            mu_words = [ int(w, 16) for w in line.split()[:8] ]
            for mu_word in mu_words:
                if mu_word == 0x505050bc505050bc:
                    muons.append(Muon(vhdl_dict, "OUT", bitword=0))
                else:
                    muons.append(Muon(vhdl_dict, "OUT", bitword=mu_word))
    return muons