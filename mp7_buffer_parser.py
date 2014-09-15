from muon import Muon 
from muon_functions import get_masked_word
class BufferParser(object):
    """
        Parses MP7 buffer files and can create lists of objects
    """
    def __init__(self, fname, vhdl_dict):
        super(BufferParser, self).__init__()
        self.fname = fname
        self.frame_dict = {}
        self.initialized = False
        self.vhdl_dict = vhdl_dict


    def init(self): 
        # transforms data from txt-File to a dictionary the index is the frame-number
        with open(self.fname, "r") as fobj:
            self.frame_dict = {}
            for line in fobj:
                frames = line.split()
                if frames and frames[0] == "Frame":
                    frame_n = int(frames[1]) 
                    self.frame_dict[frame_n] = frames[3:] # strips the frame identifier

            self.initialized = True
            

    def frame_printer(self, frame_numbers):
        # Prints frames specified by frame_numbers (either list/tuple or int)
        if not self.initialized: self.init()
        if isinstance(frame_numbers, int):
            print self.frame_dict[frame_numbers]
        else:
            frames = [ self.frame_dict[i] for i in frame_numbers ] 
            for frame in frames:
                print frame

    def get_num(self, frame, link): 
        # Get the actual hex-number of frame and link
        if not self.initialized: self.init()
        frame_content = self.frame_dict[frame][link]
        frame_content = frame_content.replace("1v", "")
        num = int(frame_content, 16)
        return num

    def get_muon_dict(self, link_low, link_high, frame_low, frame_high): 
        # Concatinates muon frames and returns dict
        if not self.initialized: self.init()
        mu_dict = {}
        frame = frame_low
        while frame < frame_high:
            mu_dict[frame] = []
            for link_n in xrange(link_low, link_high+1):
                # only take frames with valid bit set
                if "1v" in self.frame_dict[frame][link_n] and "1v" in self.frame_dict[frame+1][link_n]: 
                    a = self.get_num(frame, link_n)
                    b = self.get_num(frame+1, link_n)
                    mu_dict[frame].append((b<<32) + a)
            frame = frame+2 

        return mu_dict

    def get_muon_objects(self, start_frame, end_frame, start_link, end_link):
        if not self.initialized: self.init() 
        if "rx_" in self.fname: 
            mu_type = "IN"
        else:
            mu_type = "OUT"
        muon_dict = self.get_muon_dict(start_link, end_link, start_frame, end_frame)
        muon_objs = []
        for frame, muons in muon_dict.iteritems():
            muon_objs += [ Muon(self.vhdl_dict, mu_type, bitword) for bitword in muons ]
        return muon_objs

class InputBufferParser(BufferParser):
    """docstring for InputBufferParser"""
    def __init__(self, fname, vhdl_dict):
        super(InputBufferParser, self).__init__(fname, vhdl_dict)
    
    def init(self):
        super(InputBufferParser, self).init()
        self.get_ranges()
    
    def get_ranges(self):
        self.frame_low = 0
        self.frame_high = -1
        self.link_low = 36
        self.link_high = 71

        for link in xrange(self.link_low, self.link_high+1):
            for frame in xrange(self.frame_low, 1024):
                a = self.frame_dict[frame][link]
                if a[:2] == "1v":
                    self.frame_low = frame
                    break

        for link in xrange(self.link_low, self.link_high):
            for frame in xrange(self.frame_low, 1024):
                a = self.frame_dict[frame][link]
                if a[:2] == "0v" and self.frame_high == -1:
                    self.frame_high = frame-1
                if self.frame_high != -1 and a[:2] == "1v":
                    self.frame_high = -1

        if self.frame_high == -1:
            self.frame_high = 1023

    def get_input_muons(self):
        if not self.initialized: self.init()
        return self.get_muon_objects(self.frame_low, self.frame_high, self.link_low, self.link_high)

class OutputBufferParser(BufferParser):
    """docstring for OutputBufferParser"""
    def __init__(self, fname, vhdl_dict):
        super(OutputBufferParser, self).__init__(fname, vhdl_dict)
        
    def init(self):
        super(OutputBufferParser, self).init()
        self.get_ranges()

    def get_ranges(self):
        self.intermediate_offset = 6
        self.rank_offset = 6

        self.frame_low = 0
        self.frame_high = -1
        
        self.link_out_low = 0
        self.link_out_high = 3

        self.link_intermediate_low = 4
        self.link_intermediate_high = 11

        self.link_rank_low = 12
        self.link_rank_high = 13

        for link in xrange(self.link_out_low, self.link_out_high+1):
            for frame in xrange(self.frame_low, 1024):
                a = self.frame_dict[frame][link]
                if a[:2] == "1v" and a != "1v00000000":
                    self.frame_low = frame
                    break

        for link in xrange(self.link_out_low, self.link_out_high+1):
            for frame in xrange(self.frame_low, 1024):
                a = self.frame_dict[frame][link]
                if a[:2] == "0v" and self.frame_high == -1:
                    self.frame_high = frame-1
                if self.frame_high != -1 and (a[:2] == "1v" and a != "1v00000000"):
                    self.frame_high = -1
        if self.frame_high == -1:
            self.frame_high = 1023

    def get_output_muons(self):
        if not self.initialized: self.init()
        return self.get_muon_objects(self.frame_low, self.frame_high, self.link_out_low, self.link_out_high)

    def get_intermediate_muons(self):
        if not self.initialized: self.init()
        return self.get_muon_objects(self.frame_low+self.intermediate_offset, self.frame_high+self.intermediate_offset, self.link_intermediate_low, self.link_intermediate_high)

    def get_ranks(self): 
        # returns a list of valid ranks in the range specified
        if not self.initialized: self.init()
        rank_bitlength = 10
        freebits = 32-rank_bitlength*2
        rank_list = []
        for frame in xrange(self.frame_low+self.intermediate_offset, self.frame_high+self.intermediate_offset):
            for link in xrange(self.link_rank_low, self.link_rank_high+1): 
                tmp = self.get_num(frame, link)
                # gets rid of empty 12 LSBs
                ranksword = tmp >> freebits
                rank2 = ranksword >> rank_bitlength
                rank1 = get_masked_word(ranksword, 1+rank_bitlength, 2*rank_bitlength)
                rank_list.append(rank1)
                rank_list.append(rank2)
        return rank_list
