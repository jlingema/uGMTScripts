from mp7tools.tester import MP7Tester

class MP7TesterLUT(MP7Tester):
    """MP7 tester with additional memory access for LUTs"""
    def __init__(self, board, quads = 'auto', lutnames = 'auto'):
        super(MP7TesterLUT, self).__init__(board, quads)

        lutname_list = []
        if lutnames == 'auto':
            self._log.info("Discovering LUTs for Board ID "+ board.id())
            # try to discover the luts from the xml-file
            # have to do this recursive...
            lutname_list = [lname for lname in board.getNode("payload").getNodes() if "lut" in board.getNode("payload."+lname).getTags()]
            self._log.info("Discovered the following LUTs:", lutname_list)
        else:
            if not isinstance(list, lutname_list):
                self._log.error("lutnames", lutnames, "should be either 'auto' or list of lutnames")
                import sys
                sys.exit(-1)
            lutname_list = [lname for lname in lutnames]
            
        self._lutnames = lutname_list
        self._luts = {}
        # TODO check whether user already prependet payload!
        for lname in self._lutnames:
            try:
                self._luts[lname] = board.getNode("payload."+lname)
            except:
                import sys
                self._log.error("Failed to get node: payload."+lname)
                sys.exit(-1)
        self._log.info("LUT discovery successful")
        self._log.debug(" board     : " + board.id())
        self._log.debug(" LUT nodes : " + self._lutnames)
        self._log.debug(" Please note that LUT nodes are relative to payload.")

    def lutnames(self):
        return self._lutnames

    def print_lut_debug(self, name):
        lut = self._luts[name]
        self._log.debug(name + " info:")
        self._log.debug(" address    : " + hex(lut.getAddress()))
        self._log.debug(" mask       : " + hex(lut.getMask()))
        self._log.debug(" id         : " + lut.getId())
        self._log.debug(" full path  : " + lut.getPath())
        self._log.debug(" mode       : " + lut.getMode())
        self._log.debug(" permission : " + lut.getPermission())
        self._log.debug(" fw info    : " + lut.getFirmwareInfo())
        self._log.debug(" size       : " + lut.getSize())

    def write_lut(self, name, data):
        if name in self._luts.keys():
            lut = self._luts[name]
            if len(data) > lut.getSize():
                self._log.error("write_lut, trying to write more data than the node addresses")
                return
            val = lut.writeBlock(data)
            return val
        
        self._log.error("write_lut, lut name is not known")


    def read_lut(self, name, size = 256):
        if name in self._luts.keys():
            lut = self._luts[name]
            # self.print_lut_debug(name)
            self._log.info("trying to read mem block of size {sz} from {addr} ({lutname})".format(sz=size, addr=hex(lut.getAddress()), lutname=name))
            if (size > lut.getSize()):
                self._log.error("read_lut, trying to read more data than the node addresses")
                return
            return self._luts[name].readBlock(size)
        self._log.error("read_lut, lut name is not known "+name)
