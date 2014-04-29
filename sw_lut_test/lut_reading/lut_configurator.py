import json

class LUTConfigurator(object):
    """A class that can parse LUT description json files"""
    def __init__(self, fname):
        super(LUTConfigurator, self).__init__()
        self.fname = fname
        json_file = None
        try:
            json_file = open(fname, "r")
        except:
            print "could not open json {fname}".format(fname=fname)
        try:
            self._json = json.load(json_file)
        except:
            print "could not parse json {fname}".format(fname=fname)

    def get_lut(self, lut_path):
        path_parts = lut_path.split(".")[1:]

        curr = self._json[path_parts[0]]
        for path_part in path_parts[1:]:
            curr = curr[path_part]
        return curr

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
