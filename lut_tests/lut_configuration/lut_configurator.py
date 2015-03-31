import json, math, sys

class LUTConfigurator(object):
    """A class that can parse LUT description json files"""
    def __init__(self, fname = None):
        super(LUTConfigurator, self).__init__()
        self.fname = fname
        json_file = None
        if fname != None:
            try:
                json_file = open(fname, "r")
            except:
                print "could not open json {fname}".format(fname=fname)
            try:
                self._json = json.load(json_file)
            except:
                print "could not parse json {fname}".format(fname=fname)
        else:
            self._json = None

        self.phimap = []
        muon_phi_stepsize = 0.011
        tower_phi_size = 2*0.087
        for x in xrange(pow(2, 10)): #phi
            self.phimap.append(int(x*muon_phi_stepsize / tower_phi_size))

        
        self.towermap = []
        self.create_tower_map()

        self.etamap = {}
        muon_eta_stepsize = 0.011
        neg_offset = 0b100000000
        neg_mask = 0b11111111
        for x in xrange(pow(2, 8)):
            eta_mu = min(2.4, muon_eta_stepsize*x) #2.05 = eta_acc - last_tower_size
            twr_idx_neg, twr_idx_pos = self.get_tower_index(eta_mu)
            self.etamap[x] = twr_idx_pos
            x_neg = (x^neg_mask)+neg_offset # twos complement in 9 bit space
            self.etamap[x_neg] = twr_idx_neg
        

    def create_tower_map(self):
        if self.towermap == []:
            self.towermap = []
            i1 = 0
            for i in range(10):
                i1 += 0.087*2
                self.towermap.append(0.087*2)
            
            self.towermap.append(0.19)
            i1+=0.19
            self.towermap.append(0.242)
            i1+=0.242

            self.towermap.append(0.15)
            i1+=0.15
            self.towermap.append(0.178)
            i1+=0.178
            # print i1 # is 2.5

            # self.towermap.append(0.15)
            # self.towermap.append(0.35)


    def get_tower_index(self, eta):
        if eta > 2.4: return 0, 0
        eta_tot = 0
        i = -1
        while (eta_tot <= eta):
            eta_tot += self.towermap[i]
            i += 1
        return 13-i, 14+i 

    def get_lut(self, lut_path):
        if self._json:
            path_parts = lut_path.split(".")[1:]

            curr = self._json[path_parts[0]]
            for path_part in path_parts[1:]:
                curr = curr[path_part]
            return curr
        else:
            print "[{name}] ERROR : trying to access json configuration not specified during construction".format(name=self.__class__)
            sys.exit(0)

    def get_lut_data(self, lut_path):
        lut = self.get_lut(lut_path)
        return lut["data"]

    def get_lut_instance_data(self, lut_path, instance_name):
        lut = self.get_lut(lut_path)
        return lut["data"][instance_name]

    @staticmethod
    def get_zeroes(n_words):
        return [0 for x in xrange(n_words)]

    @staticmethod
    def get_ones(n_words):
        return [1 for x in xrange(n_words)]

    @staticmethod
    def get_randoms(n_words, width=32):
        return [LUTConfigurator.get_random_word(width) for x in xrange(n_words)]

    @staticmethod
    def get_random_word(width = 32):
        from random import randint
        # 0 <= returned int < 2^width
        max_val = pow(2, width)-1
        val = randint(0, max_val)
        return val

    @staticmethod
    def get_sin_lut(addr_width, data_width):
        max_data_val = pow(2, data_width)
        max_addr = pow(2, addr_width)
        from math import sin, pi
        data = [ int((1+sin(x/float(max_addr)*2*pi))*max_data_val) for x in range(max_addr) ]
        return data
    @staticmethod
    def generate_mask(xlow, xup):
        ones = (1<<(xup-xlow+1)) - 1
        mask = ones<<xlow
        return mask

    @staticmethod
    def get_2param_function_lut(function_string, addr_width1, addr_width2, data_width):
        max_addr = 1 << (addr_width1+addr_width2)
        # calculate masks for to unhash the input
        mask1 = (1 << addr_width1) - 1
        mask2 = (1 << (addr_width1 + addr_width2)) - mask1 - 1

        # maximum value of output, given the data_width
        data_max = (1 << data_width) - 1
        data = []
        # iterate over the whole input range
        for x in xrange(max_addr):
            # unhash "input"
            a = x & mask1
            b = (x & mask2) << addr_width1
            # take maximum data if overflow
            res = min(eval(function_string), data_max)
            data.append(res)
        return data

    @staticmethod
    def get_function_lut(function_string, input_names, addr_widths, data_width):
        max_addr = 1 << (sum(addr_widths))

        #the convention is that the first input is the MSW, therefore for simplicity, we just reverse the lists here:
        rev_input_names = [ x for x in input_names ]
        rev_input_names.reverse()
        rev_addr_widths = [ x for x in addr_widths ]
        rev_addr_widths.reverse()
        
        # prepare the function string to use the local list inputs (see below)
        my_function_string = function_string
        for i, input_name in enumerate(rev_input_names):
            my_function_string = my_function_string.replace(input_name, "inputs[{idx}]".format(idx=i))

        # making my life easier by calculating the bit boundaries from the widths:
        bit_boundaries = []
        bitsum = 0
        for addw in rev_addr_widths:
            bit_boundaries.append([bitsum, bitsum+addw-1])
            bitsum += addw

        # prepare the masks according to the address widths:
        masks = []
        for i, boundary in enumerate(bit_boundaries):
            msk = LUTConfigurator.generate_mask(boundary[0], boundary[1])
            masks.append(msk)

        data_max = (1 << data_width) - 1 
        data = []
        for x in xrange(max_addr):
            # unhash "input"
            inputs = []

            for i, mask in enumerate(masks):
                inputs.append(x & mask)
                inputs[i] = inputs[i] >> bit_boundaries[i][0] # shift by lower bound
            # take maximum data if overflow
            res = min(eval(my_function_string), data_max)
            
            data.append(res)
        return data

    def get_map_lut(self, mapname, input_name, addr_width, data_width):
        max_addr = pow(2, addr_width)
        # prepare the function string to use the local list inputs (see below)
        lookupstring = "self."+mapname+"[input_]"


        data_max = pow(2, data_width) - 1
        data = []
        for input_ in xrange(max_addr):
            # take maximum data if overflow
            res = min(eval(lookupstring), data_max)
            data.append(res)
        return data