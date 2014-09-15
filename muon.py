
class Muon():
    def __init__(self, vhdl_dict, mu_type, bitword = None, obj = None, ):
        # If the Muon object is a hardware output it has to be called with bitword
        # If....is a Emulator output ....with obj
    
        pt_low = vhdl_dict["PT_{t}_LOW".format(t=mu_type)]
        pt_high = vhdl_dict["PT_{t}_HIGH".format(t=mu_type)]

        sysign_low = vhdl_dict["SYSIGN_{t}_LOW".format(t=mu_type)]
        sysign_high = vhdl_dict["SYSIGN_{t}_HIGH".format(t=mu_type)]

        qual_low = vhdl_dict["QUAL_{t}_HIGH".format(t=mu_type)]
        qual_high = vhdl_dict["QUAL_{t}_HIGH".format(t=mu_type)]

        eta_low = vhdl_dict["ETA_{t}_LOW".format(t=mu_type)]
        eta_high = vhdl_dict["ETA_{t}_HIGH".format(t=mu_type)]

        phi_low = vhdl_dict["PHI_{t}_LOW".format(t=mu_type)]
        phi_high = vhdl_dict["PHI_{t}_HIGH".format(t=mu_type)]

        if mu_type == "OUT":
            iso_low = vhdl_dict["ISO_OUT_LOW"]
            iso_high = vhdl_dict["ISO_OUT_HIGH"]

        if obj == None:     # for hardware  
            self.bitword = bitword

            self.Sysign = self.bit_mask(sysign_low, sysign_high)
            self.etaBits = self.bit_mask(eta_low, eta_high)
            self.etaBits = self.twos_complement_sign(self.etaBits, eta_high-eta_low)
            self.qualityBits = self.bit_mask(qual_low, qual_high)
            self.ptBits = self.bit_mask(pt_low, pt_high)
            self.phiBits = self.bit_mask(phi_low, phi_high)
            if mu_type == "OUT":
                self.Iso = self.bit_mask(iso_low, iso_high)
            else:
                self.Iso = -9999
            self.rank = -9999

        elif bitword == None: # for emulator
            if hasattr(obj,"Sysign"):
                self.Sysign = obj.Sysign()
            else:
                self.Sysign = -9999
                
            if hasattr(obj,"etaBits"):
                self.etaBits = obj.etaBits()
            else:
                self.etaBits = -9999

            if hasattr(obj,"qualityBits"):
                self.qualityBits = obj.qualityBits()
            else:
                self.qualityBits = -9999

            if hasattr(obj,"ptBits"):
                self.ptBits = obj.ptBits()
            else:
                self.ptBits = -9999

            if hasattr(obj,"phiBits"):
                self.phiBits = obj.phiBits()
            else:
                self.phiBits = -9999

            if hasattr(obj,"Iso"):
                self.Iso = obj.Iso()
            else:
                self.Iso = -9999

            if hasattr(obj, "rank"):
                self.rank = obj.rank()
            else:
                self.rank = -9999

            self.bitword = (int(self.phiBits)<<phi_low) + (int(self.ptBits)<<pt_low) + (int(self.qualityBits)<<qual_low) + (int(self.etaBits)<<eta_low)

    @staticmethod
    def twos_complement_sign(bits, bit_num):
        # check sign bit and calculate signed int, if set
        if (bits>>(bit_num-1))==0:
            return bits
        else:
            return -((1<<bit_num)-bits)

    def bit_mask(self,xlow,xup):
        x = (1<<(xup-xlow+1)) - 1
        y = x<<xlow
        z = self.bitword & y
        return z>>xlow

