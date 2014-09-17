
class Muon():
    def __init__(self, vhdl_dict, mu_type, bitword = None, obj = None, ):
        # If the Muon object is a hardware output it has to be called with bitword
        # If....is a Emulator output ....with obj
    
        pt_low = vhdl_dict["PT_{t}_LOW".format(t=mu_type)]
        pt_high = vhdl_dict["PT_{t}_HIGH".format(t=mu_type)]

        sysign_low = vhdl_dict["SYSIGN_{t}_LOW".format(t=mu_type)]
        sysign_high = vhdl_dict["SYSIGN_{t}_HIGH".format(t=mu_type)]

        qual_low = vhdl_dict["QUAL_{t}_LOW".format(t=mu_type)]
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
            self.Sysign = self.get_value(sysign_low, sysign_high)
            self.etaBits = self.get_value(eta_low, eta_high)
            self.etaBits = self.twos_complement_sign(self.etaBits, eta_high-eta_low+1)
            self.qualityBits = self.get_value(qual_low, qual_high)
            self.ptBits = self.get_value(pt_low, pt_high)
            if mu_type == "OUT":
                self.phiBits = self.get_value(phi_low, phi_high)
                self.Iso = self.get_value(iso_low, iso_high)
            else:
                self.Iso = -9999
                # for input have to mask the 31st bit as it is control bit
                self.phiBits = self.get_phi(phi_low, phi_high)
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

            # FIXME!
            self.bitword = 0


    @staticmethod
    def twos_complement_sign(bits, bit_num):
        # check sign bit and calculate signed int, if set
        if (bits>>(bit_num-1))==0:
            return bits
        else:
            mask = (1 << bit_num)-1
            r = mask^bits
            return -(r+1)

    def get_phi(self, xlow, xup):
        # this is a specialized function because phi reaches over the word boundary
        ctrl_mask = self.get_mask(31, 31)
        # +1 because dinyar shaves off the 32nd bit in the vhdl-file
        raw_mask = self.get_mask(xlow, xup+1) 
        # mask is 11110111111 for phi
        mask = raw_mask^ctrl_mask
        raw_val = self.bitword & mask
        raw_val = raw_val >> xlow
        lsw_mask = self.get_mask(0, 5)
        msw_mask = self.get_mask(7, 10)
        val = (raw_val&lsw_mask) + ((raw_val&msw_mask) >> 1)
        return val

    def get_mask(self, xlow, xup):
        ones = (1<<(xup-xlow+1)) - 1
        mask = ones<<xlow
        return mask

    def get_value(self,xlow,xup):
        mask = self.get_mask(xlow, xup)  
        val = self.bitword & mask
        return val>>xlow

