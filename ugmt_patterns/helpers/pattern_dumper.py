from tools.logger import log

class BufferWriter(object):
    """
    Class (Decorator) that produces mp7-buffer-files. 
    Giving this class to the ctor of of PatternDumper will let it create these files
    """
    def __init__(self):
        super(BufferWriter, self).__init__()
        self.string = []
        self.frameCounter = 0
        self.head = """Board ugmt_b40
 Quad/Chan :    q00c0      q00c1      q00c2      q00c3      q01c0      q01c1      q01c2      q01c3      q02c0      q02c1      q02c2      q02c3      q03c0      q03c1      q03c2      q03c3      q04c0      q04c1      q04c2      q04c3      q05c0      q05c1      q05c2      q05c3      q06c0      q06c1      q06c2      q06c3      q07c0      q07c1      q07c2      q07c3      q08c0      q08c1      q08c2      q08c3      q09c0      q09c1      q09c2      q09c3      q10c0      q10c1      q10c2      q10c3      q11c0      q11c1      q11c2      q11c3      q12c0      q12c1      q12c2      q12c3      q13c0      q13c1      q13c2      q13c3      q14c0      q14c1      q14c2      q14c3      q15c0      q15c1      q15c2      q15c3      q16c0      q16c1      q16c2      q16c3      q17c0      q17c1      q17c2      q17c3  
      Link :     00         01         02         03         04         05         06         07         08         09         10         11         12         13         14         15         16         17         18         19         20         21         22         23         24         25         26         27         28         29         30         31         32         33         34         35         36         37         38         39         40         41         42         43         44         45         46         47         48         49         50         51         52         53         54         55         56         57         58         59         60         61         62         63         64         65         66         67         68         69         70         71    
"""

    def writeFrame(self, words, valid = 1, validoverflow = 0, ftype=None):
        """
        Write a frame to the internal "buffer" (i.e. string),
        TAKES: 
            words: List of 72-X 32 bit words (if X > 0, the remaining links are filled with 0)
        RETURNS:
            void
        """
        self.string += ["Frame {n:0>4} :".format(n=self.frameCounter)]
        for w in words:
            self.string += [" {v}v{w:0>8x}".format(v=valid, w=w)]

        for i in range(72-len(words)):
            self.string += [" {v}v{w:0>8x}".format(v=validoverflow, w=0)]
        self.string += ["\n"]
        self.frameCounter += 1

    def get_full_string(self):
        fstring = self.head + ''.join(self.string)
        self.string = []
        return fstring

    def fill_up(self, n):
        while self.frameCounter < n:
            self.writeFrame([])

    def reset(self):
        self.frameCounter = 0

class TestbenchWriter(object):
    """
    Class (Decorator) that produces testbench files (i.e. what Dinyar uses for testing)
    Giving this class to the ctor of of PatternDumper will let it create these files
    """
    def __init__(self):
        super(TestbenchWriter, self).__init__()
        self.string = []
        self.iFrameCounter = 0
        self.oFrameCounter = 0
        self.bxCounter = 0
        self.head = """################################################################################
# Pattern for testbench of the uGMT algo block
# Data format of muons:
# ID N PT PHI ETA CHARGE CHARGE_VALID QUALITY SORT EMPTY (ISO)
# where ID = {FWD+/-, OVL+/-, BAR, OUT, FIMD, BIMD, OIMD}
# N is the rank for IMD / OUT and the link for inputs.
# ISO is optional and only present for OUT
# 
# Data format for tracks:
# ID ETA0 PHI0 QUALITY0 ETA1 PHI1 QUALITY1 ETA2 PHI2 QUALITY2
# where ID = {FTRK+/-, OTRK+/-, BTRK}
# Tracks are given always for 3 consecutive muons
#
#
# Data format for output of serializer:
# ID VALID0 WORD0 VALID1 WORD1 ... VALIDN WORDN
# where ID = FRMx, x being the current 240 MHz cycle
# In WordX the X represents the link number, meaning that muon0 is x(FRM0, WORD0) + x(FRM1, WORD0) << 32.
"""
    

    def writeFrame(self, words, valid = 1, validoverflow = 0, ftype="in"):
        """
        Adds the frame to the buffer
        TAKES: 
            words : list of the 32 bit words of the current frame (filled with 0s to have 72)
        """
        if ftype == "in":
            self.string += ["{n:<6} ".format(n="IFR"+str(self.iFrameCounter))]
            self.iFrameCounter += 1
        else:
            self.string += ["{n:<6} ".format(n="OFR"+str(self.oFrameCounter))]
            self.oFrameCounter += 1

        for w in words:
            self.string += [" {v} {w:0>8x}".format(v=valid, w=w)]

        for i in range(72-len(words)):
            self.string += [" {v} {w:0>8x}".format(v=validoverflow, w=0)]
        self.string += ["\n"]


    def writeMuonHeadline(self):
        """ documenting the individual muon quantities """
        self.string += ["#{id:<5} {rank:>5} {pt:>5} {phi:>5} {eta:>5} {charge:>5} {charge_valid:>5} {quality:>5} {sort:>5} {empty:>5} {iso:>5}\n".format(
                                id="TYPE",
                                rank="POS",
                                pt="PT",
                                phi="PHI",
                                eta="ETA",
                                charge="CHR",
                                charge_valid="VCHR",
                                quality="QUAL",
                                sort="RANK",
                                empty="EMPT",
                                iso="(ISO)",
                            )]
    def writeTrackHeadline(self):
        """ documenting the individual track quantities """
        self.string += ["# TRACKS\n#TYPE   ETA0  PHI0 QUAL0  ETA1  PHI1 QUAL1  ETA2  PHI2 QUAL2\n"]

    def writeEventHeader(self, n):
        self.string += ["# Event {n}\n".format(n=n)]

    def writeBXCounter(self, n):
        self.string += ["EVT {n}\n".format(n=n)]

    def fill_up(self, n):
        while self.frameCounter < n:
            self.writeFrame([])

    def writeMuon(self, mu, mu_type, rank, addIso = False, rankLUT = None):
        """ 
        Convert a single ./helpers/muon.Muon object into string
        TAKES:  mu          Muon object
                mu_type     muon type (BAR, FWD+/-, OVL+/-, FIMD, BIMD, OIMD, OUT)
                rank        relative position of the muon (IMD: 0-23, OUT: 0-7, FWD/OVL: 0-37, BAR: 0-35)
                addIso      whether to add isolation info (should only be done for OUT)
        Adds to self.string "ID N PT PHI ETA CHARGE CHARGE_VALID QUALITY SORT EMPTY (ISO)"
        """
        isempty = 0
        if mu.ptBits == 0: isempty = 1
        sortrank = 0
        if rankLUT != None:
            sortrank = rankLUT.lookup(mu.ptBits, mu.qualityBits)
        else:
            sortrank = mu.rank

        tmp_string = "{id:<6} {rank:>5} {pt:>5} {phi:>5} {eta:>5} {charge:>5} {charge_valid:>5} {quality:>5} {sort:>5} {empty:>5}".format(
                        id=mu_type,
                        rank=rank,
                        pt=mu.ptBits,
                        phi=mu.phiBits,
                        eta=mu.etaBits,
                        charge=mu.Sysign & 0x1,
                        charge_valid=mu.Sysign >> 1,
                        quality=mu.qualityBits,
                        sort=sortrank,
                        empty=isempty
                    )
        if addIso:
            tmp_string += " {iso:>5}".format(iso=mu.Iso)
        
        tmp_string += "\n"
        self.string += [tmp_string]

    def writeTracks(self, tracks, track_type):
        """ 
        Adds the track information to the buffer. 
        TAKES: 
            tracks: list of [eta, phi, qual]*n_tracks
            track_type: track-id = {FTRK+/-, BTRK, OTRK+/-}
        """
        for i, track in enumerate(tracks):
            if i%3==0:
                self.string += ["{id:<6}".format(id=track_type)]
            self.string += [" {eta:>5} {phi:>5} {qual:>5}".format(eta=track[0], phi=track[1], qual=track[2])]
            if (i+1)%3 == 0:
                self.string += ["\n"]

    def writeCaloChannel(self, channel, sums):
        """ 
        Adds the calo information to the buffer. 
        TAKES: 
            channel: current channel
            sums: calo sums for current channel (list with length 36)
        """
        self.string += ["CALO{id:<2}".format(id=channel)]
        for csum in sums:
            self.string += ["{calo:>3}".format(calo=csum)]
        self.string += ["\n"]

    def get_full_string(self):
        return self.head + ''.join(self.string)


class TestvectorWriter(object):
    """
    Class (Decorator) that produces testbench files (i.e. what Dinyar uses for testing)
    Giving this class to the ctor of of PatternDumper will let it create these files
    """
    def __init__(self):
        super(TestvectorWriter, self).__init__()
        self.string = []
        self.frameCounter = 0
        self.muonCounter = 0
        self.bxCounter = 0
        self.head = "|BX|"
        for i in range(108):
            self.head += " |{muon:-^14}|".format(muon="Muon({n})".format(n=i))

    def writeMuon(self, mu, mu_type, rank, addIso = False, rankLUT = None):
        """ 
        Convert a single ./helpers/muon.Muon object into string
        TAKES:  mu          Muon object
                mu_type     muon type (BAR, FWD+/-, OVL+/-, FIMD, BIMD, OIMD, OUT)
                rank        relative position of the muon (IMD: 0-23, OUT: 0-7, FWD/OVL: 0-37, BAR: 0-35)
                addIso      whether to add isolation info (should only be done for OUT)
        Adds to string "ID N PT PHI ETA CHARGE CHARGE_VALID QUALITY SORT EMPTY (ISO) (TWR)"
        """
        if self.muonCounter == 0:
            self.string += ["\n{bx:0>4}".format(bx=self.bxCounter)]

        self.string += [" {muon:0>16x}".format(muon=mu.bitword)]
        self.muonCounter += 1
        if self.muonCounter == 108:
            self.bxCounter += 1
            self.muonCounter = 0

    def get_full_string(self):
        return self.head + ''.join(self.string)

    def writeTracks(self, tracks, track_type):
        pass

    def writeEventHeader(self, n):
        pass

    def writeBXCounter(self, n):
        pass

    def writeTrackHeadline(self):
        pass

    def writeMuonHeadline(self):
        pass

    def writeFrame(self, words, valid, validoverflow):
        pass

    def fill_up(self, n):
        pass

class PatternDumper(object):
    def __init__(self, fname, vhdl_dict, writer_t):
        super(PatternDumper, self).__init__()
        self.fname = fname              # file that is dumped to
        self.frame_dict = {}            # dict for easy access of words
        self.vhdl_dict = vhdl_dict      # vhdl-dict as returned by ../../tools/vhdl.VHDLConfigParser
        self._log = log.init_logging(self.__class__.__name__)
        self._writer = writer_t()       # which writer should be used for dumping?
        self._bxCounter = 0

    def writeEmptyFrames(self, n):
        for i in range(n):
            self._writer.writeFrame([])
    
    def dump(self, fill = False):
        if fill:
            self._writer.fill_up(1024)
        
        if hasattr(self._writer, 'reset'): self._writer.reset()

        with open(self.fname, "w") as fobj:
            fobj.write(self._writer.get_full_string())

    def dump_string(self, fill = False):
        if fill:
            self._writer.fill_up(1024)
        # self._writer.reset()
        if hasattr(self._writer, 'reset'): self._writer.reset()

        return self._writer.get_full_string()

    def clear(self):
        self.string = ""

    def writeMuonsToFrames(self, frames, mutype, muons, per_link, link_offset, frame_offset = 0):
        for i, muon in enumerate(muons):
            ilink = i/per_link+self.vhdl_dict[mutype+"_LOW"]+link_offset
            iframe = (i%per_link)*2+frame_offset # 2 padding words
            frames[iframe][ilink] = muon.getLSW()
            frames[iframe+1][ilink] = muon.getMSW()

    def writeCaloToFrames(self, frames, calosums):
        for ieta in range(28):
            idx_low = ieta*36
            for iframe in range(6):
                frame_val = 0
                for l_iphi in range(6): # per frame 6 calo sums encoded
                    idx = idx_low+(iframe*6)+l_iphi 
                    frame_val += calosums[idx] << (l_iphi*5)
                frames[iframe][ieta+8] = frame_val


    def writeFrameBasedOutputBX(self, out_muons, imd_muons):
        frames = {}
        for x in range(6):
            frames[x] = [0]*72

        self.writeMuonsToFrames(frames, "OUT", out_muons, 2, 0, 2)
        self.writeMuonsToFrames(frames, "IMD", imd_muons, 3, 0)

        for x, frame in frames.iteritems():
            self._writer.writeFrame(frame, ftype="out")

    def writeFrameBasedInputBX(self, bar_muons, fwdp_muons, fwdn_muons, ovlp_muons, ovln_muons, calosums):
        frames = {}
        for x in range(6):
            frames[x] = [0]*72

        self.writeMuonsToFrames(frames, "BARREL", bar_muons, 3, 36)
        self.writeMuonsToFrames(frames, "FWD_NEG", fwdn_muons, 3, 36)
        self.writeMuonsToFrames(frames, "FWD_POS", fwdp_muons, 3, 36)
        self.writeMuonsToFrames(frames, "OVL_POS", ovlp_muons, 3, 36)
        self.writeMuonsToFrames(frames, "OVL_NEG", ovln_muons, 3, 36)

        if calosums:
            self.writeCaloToFrames(frames, calosums)

        for x, frame in frames.iteritems():
            self._writer.writeFrame(frame, ftype="in")
        self._bxCounter += 1


    def writeMuonGroup(self, muons, mutype, addIso, rankLUT):
        themuid = mutype
        for i, muon in enumerate(muons):
            if mutype == "IMD":
                if i < 4 or i > 19: themuid = "FIMD"
                elif i < 8 or i > 15: themuid = "OIMD"
                else: themuid = "BIMD"
            link = i
            if muon.local_link != -1:
                link = muon.local_link

            self._writer.writeMuon(muon, themuid, link, addIso, rankLUT)
            

    def writeCaloGroup(self, calosums):
        for iline in range(28):
            idx_low = iline*36
            idx_high = idx_low+36
            self._writer.writeCaloChannel(iline, calosums[idx_low:idx_high])

    def writeTrackGroup(self, muons, track_type):
        tracks = []
        for i, muon in enumerate(muons):
            tracks.append([muon.etaBits, muon.phiBits, muon.qualityBits])
        self._writer.writeTracks(tracks, track_type)

    def writeMuonBasedInputBX(self, bar_muons, fwdp_muons, fwdn_muons, ovlp_muons, ovln_muons, calosums, rankLUT, addTracks = False, addBXCounter = False):
        if addBXCounter:
            self._writer.writeBXCounter(self._bxCounter)


        if calosums:
            self.addLine("# Calo sums:\n")
            self.writeCaloGroup(calosums)
        try:
            self._writer.writeMuonHeadline()
        except AttributeError:
            self._log.error("You are trying to write muons with the wrong Writer class. Only supports frame-based writing.")
            return
        self.writeMuonGroup(fwdp_muons, "FWD+", False, rankLUT)
        self.writeMuonGroup(ovlp_muons, "OVL+", False, rankLUT)
        self.writeMuonGroup(bar_muons, "BAR", False, rankLUT)
        self.writeMuonGroup(ovln_muons, "OVL-", False, rankLUT)
        self.writeMuonGroup(fwdn_muons, "FWD-", False, rankLUT)

        if addTracks:
            self._writer.writeTrackHeadline()
            self.writeTrackGroup(fwdp_muons, "FTRK+")
            self.writeTrackGroup(ovlp_muons, "OTRK+")
            self.writeTrackGroup(bar_muons, "BTRK")
            self.writeTrackGroup(ovln_muons, "OTRK-")
            self.writeTrackGroup(fwdn_muons, "FTRK-")

        self._bxCounter += 1

    def writeTowerIndices(self, twrs):
        self._writer.string += ["# {typ:<6} {idx:<2} {phi:>5} {eta:>5}\n".format(typ="ID", idx="MU", phi="PHI", eta="ETA")]
        for i, twr in enumerate(twrs):
            self._writer.string += ["{typ:<8} {idx:<2} {phi:>5} {eta:>5}\n".format(typ="TWRIDX", idx=i, phi=twr[0], eta=twr[1])]
        for i in range(len(twrs), 8):
            self._writer.string += ["{typ:<8} {idx:<2} {phi:>5} {eta:>5}\n".format(typ="TWRIDX", idx=i, phi=0, eta=0)]

    def addLine(self, line):
        self._writer.string += [line]

    def writeMuonBasedOutputBX(self, out_muons, imd_muons):
        try:
            self._writer.writeMuonHeadline()
        except AttributeError:
            self._log.error("You are trying to write muons with the wrong Writer class. Only supports frame-based writing.")
            return
        self.writeMuonGroup(imd_muons, "IMD", False, None)
        self.writeMuonGroup(out_muons, "OUT", True, None)
