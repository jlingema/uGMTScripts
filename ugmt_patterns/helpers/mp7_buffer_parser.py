from muon import Muon 
from tools.muon_helpers import get_masked_word
from tools.logger import log
import re

class Version(object):
    """
    Represents the uGMT firmware version for version-dependent parser
    """
    def __init__(self, versionstring):
        """
        TAKES: version-string of structure X_Y_Z (X=major, Y=minor, Z=patch)
        """
        v_parts = versionstring.split("_")
        self.major = int(v_parts[0])
        self.minor = int(v_parts[1])
        self.patch = int(v_parts[2])

    @staticmethod
    def from_filename(foldername):
        """
        extracts the version-string from folder name
        TAKES: foldername that can be of any structure but must contain the version-string (first is taken)
        """
        version_re = re.compile("[0-9]*_[0-9]*_[0-9]*")
        version_match = version_re.search(foldername)
        if version_match:
            # get rid of starting constant
            version = Version(version_match.group(0))
        return version

    def __repr__(self):
        return "v{ma}_{mi}_{pat}".format(ma=self.major, mi=self.minor, pat=self.patch)

class BufferParser(object):
    """
    Parses MP7 buffer files and can create lists of objects
    """
    def __init__(self, fname, vhdl_dict):
        super(BufferParser, self).__init__()
        self.fname = fname              # file that is parsed
        self.frame_dict = {}            # dict for easy access of words (see init)
        self.initialized = False        # saves if frame_dict is initialized
        self.vhdl_dict = vhdl_dict      # vhdl-dict as returned by ../../tools/vhdl.VHDLConfigParser
        self.max_frame = 0              # uppermost frame number containing muons
        self.valid_frames = -1          # total number of frames containing muons
        self._log = log.init_logging(self.__class__.__name__)

    def init(self):
        """
        Is called from all members that rely on self.frame_dict:
        Populates self.frame_dict with structure frame_dict[frame_number] = [link0-word, link1-word, ..., link71-word]
        NOTE: The dict contains strings!
        """
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
        """
        How many valid frames are in the file?
        RETURNS: number of frames that are valid
        """
        if self.valid_frames > 0: 
            return self.valid_frames

        self.valid_frames = 0
        for s in filter(lambda x: "1v" in x[47], self.frame_dict.values()): # just look at one input link they should be in synch!
            self.valid_frames += 1
        return self.valid_frames

    def frame_printer(self, frame_numbers):
        """ 
        Prints frames specified by 
        TAKES frame_numbers (either list/tuple (multiple frames) or int (single frame))
        """
        if not self.initialized: self.init()
        if isinstance(frame_numbers, int):
            print self.frame_dict[frame_numbers]
        else:
            frames = [ self.frame_dict[i] for i in frame_numbers ] 
            for frame in frames:
                print frame

    def get_num(self, frame, link): 
        """
        Get the hex-number as int of frame and link
        TAKES: frame (int in 0, 1023), link (int in 0, 71)
        """
        if not self.initialized: self.init()
        frame_content = self.frame_dict[frame][link]
        frame_content = frame_content.replace("1v", "")
        num = int(frame_content, 16)
        return num

    def get_muon_dict(self, link_low, link_high, frame_low, frame_high): 
        """
        Combains the two 32-bit words to get 64-bit muon in range specified
        TAKES: 
            link_low, lowest link to be considered
            link_high, highest link to be considered
            frame_low, lowest frame to be considered
            frame_high, highest frame to be considered
        """
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
                    mu_dict[frame].append([(b<<32) + a, link_n])
            frame += 2 

        return mu_dict

class InputBufferParser(BufferParser):
    """
    Parses uGMT-Input files (RX-buffer dump)
    """
    def __init__(self, fname, vhdl_dict):
        """
        TAKES: 
            fname,      file-name for RX buffer dump 
            vhdl_dict   as returned by ../../tools/vhdl.VHDLConfigParser 
        """
        super(InputBufferParser, self).__init__(fname, vhdl_dict)
    
    def init(self):
        """
        Populates frame-dict (as mother class) and gets the valid frame range
        """
        super(InputBufferParser, self).init()
        self.get_ranges()
    
    def get_ranges(self):
        """
        Populates the member variables that represent the valid frame range:
        Parses the frame-dict to find the lowest and highest non-zero valid frames
        """
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
        
        if not self.frame_low >= 0:
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
        """
        Get all input muons in the file
        RETURNS: List of muon objects within the valid frame range (contains also zero muons)
        """
        if not self.initialized: self.init() 
        if not self.frame_low >= 0: return []
        frame = self.frame_low
        muon_dict = self.get_muon_dict(self.link_low, self.link_high, self.frame_low, self.frame_high)
        muon_objs = []
        # for frame, muons in muon_dict.iteritems():
        #     muon_objs += [ Muon(self.vhdl_dict, "IN", bitword=info[0], link=info[1], frame = frame) for info in muons ]
        while frame < (self.frame_high):
            bx = (frame+1) / 6
            for i in xrange(36): #8 links
                muon_objs.append(Muon(self.vhdl_dict, "IN", muon_dict[frame][i][0], link=muon_dict[frame][i][1], frame=frame, bx=bx)) 
                muon_objs.append(Muon(self.vhdl_dict, "IN", muon_dict[frame+2][i][0], link=muon_dict[frame+2][i][1], frame=frame+2, bx=bx)) 
                muon_objs.append(Muon(self.vhdl_dict, "IN", muon_dict[frame+4][i][0], link=muon_dict[frame+4][i][1], frame=frame+4, bx=bx))
            frame += 6
        return muon_objs

class OutputBufferParser(BufferParser):
    """Parses uGMT-Output files (TX-buffer dump)"""
    def __init__(self, fname, vhdl_dict, ugmt_version):
        super(OutputBufferParser, self).__init__(fname, vhdl_dict)
        self.version = ugmt_version
        
    def init(self):
        """
        Populates frame-dict (as mother class) and gets the valid frame range
        """
        super(OutputBufferParser, self).init()
        self.get_ranges()

    def get_ranges(self):
        """
        Populates the member variables that represent the valid frame range:
        Parses the frame-dict to find the lowest and highest non-zero valid frames for:
        - output muons (links 0-3)
        - intermediate muons (links 4-11)
        - ranks (links 12-13)
        """
        self.intermediate_offset = 0
        self.rank_offset = 0
        if self.version.patch < 6 and self.version.major == 0 and self.version.minor == 0:
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
        escape = False
        for link in xrange(self.link_out_low, self.link_out_high+1):
            if escape: break
            for frame in xrange(0, self.max_frame+1):
                a = self.frame_dict[frame][link]
                if a[:2] == "0v":
                    last_0v_frame = frame
                if a[:2] == "1v" and a != "1v00000000":
                    self.frame_low = last_0v_frame+1
                    escape = True
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
        """
        Get all output muons
        RETURNS: list of muon objects found in links 0-3 (contains also zero muons) 
                 the muons are sorted as they are in the HW (0 = best of bx 0, 1 = second best etc)
        """
        if not self.initialized: self.init() 
        # check if initialization failed
        if not self.frame_low > 0: return []
        muon_dict = self.get_muon_dict(self.link_out_low, self.link_out_high, self.frame_low, self.frame_high)
        muon_objs = []

        frame = self.frame_low
        while frame < self.frame_high:
            bx = (frame + 1 - self.frame_low) / 6
            for i in xrange(4): #4 links
                muon_objs.append(Muon(self.vhdl_dict, "OUT", muon_dict[frame][i][0], link=muon_dict[frame][i][1], frame=frame, bx=bx)) 
                muon_objs.append(Muon(self.vhdl_dict, "OUT", muon_dict[frame+2][i][0], link=muon_dict[frame+2][i][1], frame=frame+2, bx=bx))
            frame += 6 # next event
            
        return muon_objs


    def get_intermediate_muons(self):
        """
        Get all intermediate muons
        RETURNS: list of imntermediate muon objects foudn in links 4-11 (contains also zero muons) 
                 the muons are sorted as they are in the HW (0 = best of bx 0, 1 = second best etc)
        """
        if not self.initialized: self.init()
        # check if initialization failed
        if not self.frame_low > 0: return []
        muon_dict = self.get_muon_dict(self.link_intermediate_low, self.link_intermediate_high, self.frame_low+self.intermediate_offset, self.frame_high+self.intermediate_offset)
        muon_objs = []

        frame = self.frame_low+self.intermediate_offset
        while frame < (self.frame_high+self.intermediate_offset):
            bx = (frame + 1 - self.frame_low + self.intermediate_offset) / 6
            # 8 links NOTE: when getting dict the link-offsets are already defined...
            for i in xrange(8): 
                muon_objs.append(Muon(self.vhdl_dict, "OUT", muon_dict[frame][i][0], link=muon_dict[frame][i][1], frame=frame, bx=bx)) 
                muon_objs.append(Muon(self.vhdl_dict, "OUT", muon_dict[frame+2][i][0], link=muon_dict[frame+2][i][1], frame=frame+2, bx=bx)) 
                muon_objs.append(Muon(self.vhdl_dict, "OUT", muon_dict[frame+4][i][0], link=muon_dict[frame+4][i][1], frame=frame+4, bx=bx))
            frame += 6
        return muon_objs

    def extract_rank_words(self, bitword):
        """
        As 2 ranks are encoded in each 32 bit word, they are split here 
        RETURNS: pair: rank0 rank1 (msw, lsw)
        """
        rank_bitlength = 10
        freebits = 32-rank_bitlength*2
        ranksword = bitword >> freebits
        rank1 = ranksword >> rank_bitlength #msw
        rank2 = get_masked_word(ranksword, 0, rank_bitlength-1) #lsw
        return rank1, rank2

    def get_ranks(self): 
        """ 
        List of valid ranks in the range found by get_ranges
        RETURNS: list of 12-bit rank words
        """
        if not self.initialized: self.init()
        if not self.frame_low > 0: return []

        rank_list = []
        frame = self.frame_low+self.rank_offset
        while frame < (self.frame_high+self.rank_offset):
        # for frame in xrange(self.frame_low+self.intermediate_offset, self.frame_high+self.intermediate_offset):
            for link in xrange(self.link_rank_low, self.link_rank_high+1):
                for i in xrange(6): # every frame contains ranks
                    tmp = self.get_num(frame+i, link)
                    rank1, rank2 = self.extract_rank_words(tmp)
                    rank_list.append(rank1)
                    rank_list.append(rank2)
            frame += 6
        return rank_list
