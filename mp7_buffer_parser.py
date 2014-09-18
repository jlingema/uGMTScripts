from muon import Muon 
from muon_functions import get_masked_word
from tools.logger import log

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
        self.max_frame = 0
        self.valid_frames = -1
        self._log = log.init_logging(self.__class__.__name__)

    def init(self): 
        # transforms data from txt-File to a dictionary the index is the frame-number
        with open(self.fname, "r") as fobj:
            self.frame_dict = {}
            for line in fobj:
                frames = line.split()
                if frames and frames[0] == "Frame":
                    frame_n = int(frames[1]) 
                    self.frame_dict[frame_n] = frames[3:] # strips the frame identifier
                    self.max_frame = frame_n
            self.initialized = True
            
    def get_n_valid(self):
        if self.valid_frames > 0: 
            return self.valid_frames

        self.valid_frames = 0
        for s in filter(lambda x: "1v" in x[47], self.frame_dict.values()): # just look at one input link they should be in synch!
            self.valid_frames += 1
        return self.valid_frames

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

    def get_muon_dict(self, link_low, link_high, frame_low, frame_high, mu_type): 
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
                    if mu_type == "IN":
                        mu_dict[frame].append((b<<32) + a)
                    else: # FIXME this is a work around for bug in HW need to change once updated
                        mu_dict[frame].append((a<<32) + b)

            frame += 2 

        return mu_dict

class InputBufferParser(BufferParser):
    """docstring for InputBufferParser"""
    def __init__(self, fname, vhdl_dict):
        super(InputBufferParser, self).__init__(fname, vhdl_dict)
    
    def init(self):
        super(InputBufferParser, self).init()
        self.get_ranges()
    
    def get_ranges(self):
        self.frame_low = -1
        self.frame_high = -1
        self.link_low = 36
        self.link_high = 71

        for link in xrange(self.link_low, self.link_high+1):
            for frame in xrange(0, self.max_frame+1):
                a = self.frame_dict[frame][link]
                if a[:2] == "1v":
                    self.frame_low = frame
                    break
        
        if not self.frame_low > 0:
            self._log.error("Found no valid, non-zero frames in this file {fn}".format(fn=self.fname))
            return

        for link in xrange(self.link_low, self.link_high):
            for frame in xrange(self.frame_low, self.max_frame+1):
                a = self.frame_dict[frame][link]
                if a[:2] == "0v" and self.frame_high == -1:
                    self.frame_high = frame-1
                if self.frame_high != -1 and a[:2] == "1v":
                    self.frame_high = -1

        if self.frame_high == -1:
            self.frame_high = self.max_frame

        self._log.info("Found valid frames for input mus: {minf}-{maxf} (=> {bx} BX)".format(minf=self.frame_low, maxf=self.frame_high, bx = (self.frame_high-self.frame_low+1)/6))

    def get_input_muons(self):
        if not self.initialized: self.init() 
        if not self.frame_low >= 0: return []
        muon_dict = self.get_muon_dict(self.link_low, self.link_high, self.frame_low, self.frame_high, "IN")
        muon_objs = []
        for frame, muons in muon_dict.iteritems():
            muon_objs += [ Muon(self.vhdl_dict, "IN", bitword) for bitword in muons ]
        return muon_objs

class OutputBufferParser(BufferParser):
    """docstring for OutputBufferParser"""
    def __init__(self, fname, vhdl_dict):
        super(OutputBufferParser, self).__init__(fname, vhdl_dict)
        
    def init(self):
        super(OutputBufferParser, self).init()
        self.get_ranges()

    def get_ranges(self):
        self.intermediate_offset = -6
        self.rank_offset = -6

        self.frame_low = -1
        self.frame_high = -1
        
        self.link_out_low = 0
        self.link_out_high = 3

        self.link_intermediate_low = 4
        self.link_intermediate_high = 11

        self.link_rank_low = 12
        self.link_rank_high = 13

        last_0v_frame = 0
        for link in xrange(self.link_out_low, self.link_out_high+1):
            for frame in xrange(0, self.max_frame+1):
                a = self.frame_dict[frame][link]
                if a[:2] == "0v":
                    last_0v_frame = frame
                if a[:2] == "1v" and a != "1v00000000":
                    self.frame_low = last_0v_frame+1
                    break

        if self.frame_low == -1:
            self._log.error("Found no valid, non-zero frames in this file {fn}".format(fn=self.fname))
            return

        for link in xrange(self.link_out_low, self.link_out_high+1):
            for frame in xrange(self.frame_low, self.max_frame+1):
                a = self.frame_dict[frame][link]
                if a[:2] == "0v" and self.frame_high == -1:
                    self.frame_high = frame+1 #last two frames are zero
                if self.frame_high != -1 and (a[:2] == "1v" and a != "1v00000000"):
                    self.frame_high = -1

        if self.frame_high == -1:
            self.frame_high = self.max_frame
        # only analyse full events!
        missed_frames = (self.frame_high-self.frame_low+1)%6
        if missed_frames != 0:
            self.frame_high += 6-missed_frames
            if self.frame_high > 1023:
                self._log.warning("Apparently not all events fit into the output buffer: {fn}\n\t\twill ignore trailing frames".format(fn=self.fname))
                self.frame_high = 1023
                self.frame_high -= (self.frame_high-self.frame_low)%6
        
        self._log.info("Found valid frames for final mus: {minf}-{maxf} (=> {bx} BX)".format(minf=self.frame_low, maxf=self.frame_high, bx = (self.frame_high-self.frame_low+1)/6))
        if self.intermediate_offset != 0:
            self._log.info("Offset is set for inter mus     : {offset}".format(offset=self.intermediate_offset))
        if self.rank_offset != 0:
            self._log.info("Offset is set for ranks         : {offset}".format(offset=self.rank_offset))

    def get_output_muons(self):
        if not self.initialized: self.init() 
        if not self.frame_low > 0: return []
        muon_dict = self.get_muon_dict(self.link_out_low, self.link_out_high, self.frame_low, self.frame_high, "OUT")
        muon_objs = []

        frame = self.frame_low
        while frame < self.frame_high:
            for i in xrange(4): #4 links
                muon_objs.append(Muon(self.vhdl_dict, "OUT", muon_dict[frame][i])) 
                muon_objs[len(muon_objs)-1].frame=frame
                muon_objs[len(muon_objs)-1].link=i
                muon_objs.append(Muon(self.vhdl_dict, "OUT", muon_dict[frame+2][i]))
                muon_objs[len(muon_objs)-1].frame=frame+2
                muon_objs[len(muon_objs)-1].link=i
            frame += 6 # next event
            
        return muon_objs


    def get_intermediate_muons(self):
        if not self.initialized: self.init() 
        if not self.frame_low > 0: return []
        muon_dict = self.get_muon_dict(self.link_intermediate_low, self.link_intermediate_high, self.frame_low+self.intermediate_offset, self.frame_high+self.intermediate_offset, "OUT")
        muon_objs = []

        frame = self.frame_low+self.intermediate_offset
        while frame < (self.frame_high+self.intermediate_offset):
            for i in xrange(8): #8 links
                muon_objs.append(Muon(self.vhdl_dict, "OUT", muon_dict[frame][i])) 
                muon_objs.append(Muon(self.vhdl_dict, "OUT", muon_dict[frame+2][i])) 
                muon_objs.append(Muon(self.vhdl_dict, "OUT", muon_dict[frame+4][i]))
            frame += 6
        return muon_objs

    def get_ranks(self): 
        # returns a list of valid ranks in the range specified
        if not self.initialized: self.init()
        if not self.frame_low > 0: return []
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
