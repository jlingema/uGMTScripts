from tools.bithelper import bithlp


class Muon():

    """
    A class capable of interpreting the uGMT emulator and hardware muon representations
    """

    def __init__(self, vhdl_dict, mu_type, bitword=None, obj=None, link=-1, frame=-1, bx=-1):
        """
        ctor:
        TAKES:
            vhdl_dict   as returned by ../../tools/vhdl.VHDLConstantsParser
            mu_type     either IN (inputs) or OUT (intermediates/outputs)
            bitword     can be None or a 64bit integer (for HW muons)
            obj         can be None or one of the emulator objects (for emulator muons)
            link        integer representing link the muon was received / is sent (HW only)
            bx          integer indicating the bunch-crossing the muon is associated with
        """

        # get the bit boundaries for the muon quantities
        self.bx = bx

        pt_low = vhdl_dict["PT_{t}_LOW".format(t=mu_type)]
        pt_high = vhdl_dict["PT_{t}_HIGH".format(t=mu_type)]

        sysign_low = vhdl_dict["SYSIGN_{t}_LOW".format(t=mu_type)]
        sysign_high = vhdl_dict["SYSIGN_{t}_HIGH".format(t=mu_type)]

        trackadd_low = 0
        trackadd_high = 0

        qual_low = vhdl_dict["QUAL_{t}_LOW".format(t=mu_type)]
        qual_high = vhdl_dict["QUAL_{t}_HIGH".format(t=mu_type)]

        eta_low = vhdl_dict["ETA_{t}_LOW".format(t=mu_type)]
        eta_high = vhdl_dict["ETA_{t}_HIGH".format(t=mu_type)]

        phi_low = vhdl_dict["PHI_{t}_LOW".format(t=mu_type)]
        phi_high = vhdl_dict["PHI_{t}_HIGH".format(t=mu_type)]

        if mu_type == "OUT":
            iso_low = vhdl_dict["ISO_OUT_LOW"]
            iso_high = vhdl_dict["ISO_OUT_HIGH"]

        if obj == None and bitword != None:     # for hardware
            self.bitword = bitword
            self.Sysign = bithlp.get_shifted_subword(self.bitword, sysign_low, sysign_high)
            self.etaBits = bithlp.get_shifted_subword(self.bitword, eta_low, eta_high)
            self.etaBits = bithlp.twos_complement_to_signed(self.etaBits, eta_high-eta_low+1)
            self.qualityBits = bithlp.get_shifted_subword(self.bitword, qual_low, qual_high)
            self.ptBits = bithlp.get_shifted_subword(self.bitword, pt_low, pt_high)
            if mu_type == "OUT":
                self.phiBits = bithlp.get_shifted_subword(self.bitword, phi_low, phi_high)
                self.Iso = bithlp.get_shifted_subword(self.bitword, iso_low, iso_high)
            else:
                self.Iso = 0
                # for input have to mask the 31st bit as it is control bit
                # as of moving to local phi this is not needed anymore
                # self.phiBits = self.decode_phi(phi_low, phi_high)
                self.phiBits = bithlp.get_shifted_subword(self.bitword, phi_low, phi_high)
                # we have to adjust these values as they are beyond the 32 bit boundary
                sysign_low += 1
                sysign_high += 1
                trackadd_high = vhdl_dict["ADDRESS_IN_HIGH"] + 1
                trackadd_low = vhdl_dict["ADDRESS_IN_LOW"] + 1
            self.rank = 0

        elif bitword == None and obj != None:  # for emulator
            if mu_type == "OUT":
                self.Iso = obj.hwIso()
                self.rank = obj.hwRank()
                self.Sysign = obj.hwCharge() + (obj.hwChargeValid() << 1)
            else:
                self.Iso = 0
                self.rank = 0
                self.Sysign = obj.hwSign() + (obj.hwSignValid() << 1)

            self.etaBits = obj.hwEta()
            unsigned_eta = bithlp.twos_complement_to_unsigned(obj.hwEta(), 9)
            self.qualityBits = obj.hwQual()
            self.ptBits = obj.hwPt()
            self.phiBits = obj.hwPhi()

            # calculate the bitword to make comparison with HW easy
            self.bitword = (self.ptBits << pt_low)
            self.bitword += (self.qualityBits << qual_low)
            self.bitword += (self.Sysign << sysign_low)
            self.bitword += (unsigned_eta << eta_low)
            self.bitword += (self.phiBits << phi_low)

            if mu_type == "OUT" and self.Iso > 0:
                self.bitword += (self.Iso << iso_low)

        self.frame = frame
        self.link = link
        self.local_link = -1
        if self.link != -1:
            self.local_link = self.link - 36
            if self.local_link < vhdl_dict["FWD_POS_HIGH"]:
                pass
            elif self.local_link < vhdl_dict["OVL_POS_HIGH"]:
                self.local_link -= vhdl_dict["OVL_POS_LOW"]
            elif self.local_link < vhdl_dict["BARREL_HIGH"]:
                self.local_link -= vhdl_dict["BARREL_LOW"]
            elif self.local_link < vhdl_dict["OVL_NEG_HIGH"]:
                self.local_link -= vhdl_dict["OVL_NEG_LOW"]
            else:
                self.local_link -= vhdl_dict["FWD_NEG_LOW"]

    def setBunchCounter(self, n_mu):
        if n_mu == 1:
            self.bitword += ((self.bx & 0b1) << 31)
            # since it is the second bit only need to shift by 62 instead of 63
            self.bitword += (self.bx & 0b10) << 62
        if n_mu == 2:
            self.bitword += (((self.bx & 0b100) >> 2) << 31)
        if self.bx == 0 and n_mu == 0:
            self.bitword += 1 << 31
        pass

    def getBx(self):
        """
        returns the assiciated bunch-crossing
        """
        return self.bx

    def getRank(self):
        return self.rank

    def getLSW(self):
        mask = 0xffffffff
        return (self.bitword & mask)

    def getMSW(self):
        return (self.bitword >> 32)

    def encode_phi(self, phi):
        """
        As the hardware expects a control bit on position 31 and phi
        goes across the word boundary we need to put a zero in the
        middle.
        """
        mask_lsw = bithlp.get_mask(0, 5)  # 0-5 for phi
        lsw = int(phi) & mask_lsw
        msw = int(phi) >> 6
        encoded_phi = lsw + (msw << 7)
        return encoded_phi

    def decode_phi(self, xlow, xup):
        """
        for the HW represntation: the phi variable goes across 32bit word boundary
        at the boundary a control bit is reserved
        """
        # this is a specialized function because phi reaches over the word boundary
        ctrl_mask = bithlp.get_mask(31, 31)
        # +1 because dinyar shaves off the 32nd bit in the vhdl-file
        raw_mask = bithlp.get_mask(xlow, xup+1)
        # mask is 11110111111 for phi
        mask = raw_mask ^ ctrl_mask
        raw_val = self.bitword & mask
        raw_val = raw_val >> xlow
        lsw_mask = bithlp.get_mask(0, 5)
        msw_mask = bithlp.get_mask(7, 10)
        val = (raw_val & lsw_mask) + ((raw_val & msw_mask) >> 1)
        return val
