from mp7tools.tester import MP7Tester
import logging

class GMTLUT(object):
    """docstring for GMTLUT"""
    def __init__(self, name, node):
        super(GMTLUT, self).__init__()
        self.node = node
        self.name = name
        
    def __repr__(self):
        rep = self.name + " info:\n"
        rep += "\t typename   : {name}\n".format(name=self.__class__.__name__)
        rep += "\t address    : {addr}\n".format(addr=hex(self.node.getAddress()))
        rep += "\t mask       : {msk}\n".format(msk=hex(self.node.getMask()))
        rep += "\t id         : {id}\n".format(id=self.node.getId())
        rep += "\t full path  : {path}\n".format(path=self.node.getPath())
        rep += "\t mode       : {mode}\n".format(mode=self.node.getMode())
        rep += "\t permission : {perm}\n".format(perm=self.node.getPermission())
        rep += "\t fw info    : {fwinfo}\n".format(fwinfo=self.node.getFirmwareInfo())
        rep += "\t size       : {size}\n".format(size=self.node.getSize())
        return rep

    __str__ = __repr__

class GMTLUTDirectNonPorted(GMTLUT):
    """docstring for GMTLUTDirectNonPorted"""
    def __init__(self, name, node):
        super(GMTLUTDirectNonPorted, self).__init__(name, node)
        self._data = node

    def write_block(self, data):
        if len(data) > self._data.getSize():
            return -1
        self._data.writeBlock(data)

    def read_block(self, size):
        if (size > self._data.getSize()):
            return -1
        return self._data.readBlock(size)

class GMTLUTDirectPorted(GMTLUT):
    """docstring for GMTLUTDirectNonPorted"""
    def __init__(self, name, node):
        super(GMTLUTDirectPorted, self).__init__(name, node)
        self._addr = node.getNode("addr")
        self._data = node.getNode("data")

    def write_block(self, data):
        self._addr.write(0x0)
        if len(data) > self._data.getSize():
            return -1
        self._data.writeBlock(data)

    def read_block(self, size):
        self._addr.write(0x0)
        if (size > self._data.getSize()):
            return -1
        return self._data.readBlock(size)

class MP7TesterLUT(MP7Tester):
    """MP7 tester with additional memory access for LUTs"""
    def __init__(self, board, quads = 'auto', luts = 'auto'):
        super(MP7TesterLUT, self).__init__(board, quads)
        self._log.setLevel(logging.DEBUG)
        if luts == 'auto':
            self.discover_luts()
        else:
            if not isinstance(luts, dict):
                self._log.error("luts {names} should be either 'auto' or dict of luts with key, val = name, type".format(names=luts))
                import sys
                sys.exit(-1)
            
            self._lutnames = luts.keys()
            self._luts = {}
            # TODO check whether user already prependet payload!
            for lname in self._lutnames:
                try:
                    self._luts[lname] = luts[lname](lname, board.getNode("payload."+lname))
                except:
                    import sys
                    self._log.error("Failed to get node: payload."+lname)
                    sys.exit(-1)
        

        self._log.debug(" board     : {id}".format(id=board.id()))
        self._log.debug(" LUT nodes : {names}".format(names=self._lutnames))
        self._log.debug(" Please note that LUT nodes are relative to payload.")


    def discover_luts(self):
        self._log.info("Discovering LUTs for Board ID {id}".format(id=self.board.id()))
        # try to discover the luts from the xml-file
        # have to do this recursive...
        self._lutnames = []
        self._luts = {}
        for node_name in self.board.getNode("payload").getNodes():
            node = self.board.getNode("payload."+node_name)
            tags = node.getTags().split(",")
            parameters = node.getParameters()

            if "lut" in tags and "ported" in tags:
                self._luts[node_name] = GMTLUTDirectPorted(node_name, node)
                self._lutnames.append(node_name)
            elif "lut" in tags:
                self._luts[node_name] = GMTLUTDirectNonPorted(node_name, node)
                self._lutnames.append(node_name)

            #print tags, parameters
        print self._lutnames
        #lutname_list = [lname for lname in self.board.getNode("payload").getNodes() if "lut"] #assumes all payload nodes are luts for now
        #self._log.info("Discovered the following LUTs: {lutnames}".format(lutnames=lutname_list))

    def lutnames(self):
        return self._lutnames

    def print_lut_debug(self, name):
       self._log.debug(self._luts[name])

    def write_lut(self, name, data):
        if name in self._luts.keys():
            lut = self._luts[name]
            self._log.debug(" writing data: {data_vals}".format(data_vals=[hex(x) for x in data]))
            val = lut.write_block(data)
            if val < 0:
                self._log.error("an error occured in write_lut for lut {name}".format(name=name))
            return val
        
        self._log.error("write_lut, lut name is not known")


    def read_lut(self, name, size = 256):
        if name in self._luts.keys():
            lut = self._luts[name]
            # self.print_lut_debug(name)
            self._log.info("trying to read mem block of size {sz} from {lutname}".format(sz=size, lutname=name))
            val = self._luts[name].read_block(size)
            if not isinstance(val, list):
                self._log.error("read_lut, an error occured for {name}".format(name=name))
            return val
        self._log.error("read_lut, lut name is not known "+name)
