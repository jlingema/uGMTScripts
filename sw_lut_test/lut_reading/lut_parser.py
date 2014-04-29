import json

class LUTFileParser(object):
    """A class that can parse LUT description json files"""
    def __init__(self, fname):
        super(LUTFileParser, self).__init__()
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