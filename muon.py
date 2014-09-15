
class Muon():
    def __init__(self, vhdl_dict, bitword=None, obj=None):
        # If the Muon object is a hardware output it has to be called with bitword
        # If....is a Emulator output ....with obj
    
        phi_out_low = vhdl_dict["PHI_OUT_LOW"]
        phi_out_high = vhdl_dict["PHI_OUT_HIGH"]

        qual_out_low = vhdl_dict["QUAL_OUT_LOW"]
        qual_out_high = vhdl_dict["QUAL_OUT_HIGH"]

        pt_out_low = vhdl_dict["PT_OUT_HIGH"]
        pt_out_high = vhdl_dict["PT_OUT_HIGH"]

        sysign_out_low = vhdl_dict["SYSIGN_OUT_LOW"]
        sysign_out_high = vhdl_dict["SYSIGN_OUT_HIGH"]

        iso_out_low = vhdl_dict["ISO_OUT_LOW"]
        iso_out_high = vhdl_dict["ISO_OUT_HIGH"]

        eta_out_low = vhdl_dict["ETA_OUT_LOW"]
        eta_out_high = vhdl_dict["ETA_OUT_HIGH"]

        pt_in_low = vhdl_dict["PT_IN_LOW"]
        pt_in_high = vhdl_dict["PT_IN_HIGH"]

        sysign_in_low = vhdl_dict["SYSIGN_IN_LOW"]
        sysign_in_high = vhdl_dict["SYSIGN_IN_HIGH"]

        qual_in_low = vhdl_dict["QUAL_IN_HIGH"]
        qual_in_high = vhdl_dict["QUAL_IN_HIGH"]

        eta_in_low = vhdl_dict["ETA_IN_LOW"]
        eta_in_high = vhdl_dict["ETA_IN_HIGH"]

        phi_in_low = vhdl_dict["PHI_IN_LOW"]
        phi_in_high = vhdl_dict["PHI_IN_HIGH"]

        if obj == None:     # for hardware  
            self.bitword = bitword

            # if the input_muons have to be investigated, one can call their properties by simply prepending "input_"
            self.input_etaBits = self.bit_mask(eta_in_low ,eta_in_high)
            self.input_etaBits = self.twos_complement_sign(self.input_etaBits, eta_in_high-eta_in_low)
            self.input_qualityBits = self.bit_mask(qual_in_low, qual_in_high)
            self.input_ptBits = self.bit_mask(pt_in_low, pt_in_high)
            self.input_phiBits = self.bit_mask(phi_in_low, phi_in_high)
            self.input_Sysign = self.bit_mask(sysign_in_low, sysign_in_high)

            self.Sysign = self.bit_mask(sysign_out_low, sysign_out_high)
            self.etaBits = self.bit_mask(eta_out_low, eta_out_high)
            self.etaBits = self.twos_complement_sign(self.etaBits, eta_out_high-eta_out_low)
            self.qualityBits = self.bit_mask(qual_out_low, qual_out_high)
            self.ptBits = self.bit_mask(pt_out_low, pt_out_high)
            self.phiBits = self.bit_mask(phi_out_low, phi_out_high)
            self.Iso = self.bit_mask(iso_out_low, iso_out_high)
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

            self.bitword = (int(self.phiBits)<<phi_out_low) + (int(self.ptBits)<<pt_out_low) + (int(self.qualityBits)<<qual_out_low) + (int(self.etaBits)<<eta_out_low)

    def twos_complement_sign(bits, bit_num):
        # check sign bit and calculate signed int, if set
        if (bits>>(bit_num-1))==0:
            return bits
        elif (bits>>(bit_num-1))==1:
            return -((1<<bit_num)-bits)

    def bit_mask(self,xlow,xup):
        x = (1<<(xup-xlow+1)) - 1
        y = x<<xlow
        z = self.bitword & y
        return z>>xlow

