

class bithlp():
    @staticmethod
    def twos_complement_to_signed(bits, bit_num):
        # check sign bit and calculate signed int, if set
        if (bits>>(bit_num-1))==0:
            return bits
        else:
            mask = (1 << bit_num)-1
            r = mask^bits
            return -(r+1)

    @staticmethod
    def get_mask(xlow, xup):
        ones = (1<<(xup-xlow+1)) - 1
        mask = ones<<xlow
        return mask

    @staticmethod
    def get_subword(bitword, xlow, xup):
        mask = bithlp.get_mask(xlow, xup)  
        return bitword & mask

    @staticmethod
    def get_shifted_subword(bitword, xlow, xup):
        val = bithlp.get_subword(bitword, xlow, xup)
        return val>>xlow

    @staticmethod
    def twos_complement_to_unsigned(val, bits):
        """compute the 2's compliment of int value val"""
        if val >= 0:
            return val
        all_one = (1 << bits)-1
        val = ((-val)^all_one)+1

        return val