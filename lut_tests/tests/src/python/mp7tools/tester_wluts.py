from mp7tools.tester import MP7Tester
import logging
import uhal


class GMTLUT(object):
    """docstring for GMTLUT"""
    def __init__(self, name, node):
        super(GMTLUT, self).__init__()
        self.node = node
        self.name = name
        self._data = None

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

    def get_size(self):
        if self._data is None:
            print "error: data is not valid"
            return -1
        return self._data.getSize()

class GMTLUTDirectNonPorted(GMTLUT):
    """ 
        GMTLUTDirectNonPorted: 
        class representing a LUT that is based on a non-ported block RAM 
    """
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
    """ 
        GMTLUTDirectPorted: 
        class representing a LUT that is based on a ported block RAM 
    """
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

class GMTLUTCommonPorted(GMTLUT):
    """ 
        GMTLUTCommonPorted: 
        class representing several LUTs that are grouped together (probably for multiple 
        instances of the same LUT) which is based on a non-ported block RAM 
    """
    def __init__(self, name, node, n, board):
        super(GMTLUTCommonPorted, self).__init__(name, node)
        self._addr = node.getNode("addr")
        self._data = node.getNode("data")
        self.board = board
        try:
            self._n_luts = int(n)
        except:
            print "Parameter N should always be an integer!"
            import sys
            sys.exit(-1)

        self._lut_size = self._data.getSize() / self._n_luts

    def write_block(self, lut_pos, data):
        if len(data) > self._lut_size or lut_pos >= self._n_luts:
            return -1
        self._addr.write(0x0)
       
        self._data.writeBlock(data)

    def read_block(self, lut_pos, size):
        if size > self._lut_size or lut_pos >= self._n_luts:
            return -1
        self._addr.write(0x0)

        return self._data.readBlock(size)

class GMTLUTDirectNonPortedAsymmetric(GMTLUT):
    """ 
        GMTLUTDirectNonPortedAsymmetric: 
        class representing an asymmetric LUT that is based on a non-ported block RAM 
    """
    def __init__(self, name, node, data_width):
        super(GMTLUTDirectNonPortedAsymmetric, self).__init__(name, node)
        self._data = node
        self._data_width = int(data_width)
        # from data-width we can calculate how much data words we can put into 1 32-bit word:
        self._data_per_word = 32/self._data_width

    def write_block(self, data):
        word_32bit = 0
        data_32bit = []
        # prepare the data to be compatible with 32 bit:
        for i, sub_word in enumerate(data):
            sub_word_cntr = i%self._data_per_word
            if sub_word_cntr == 0:
                if i != 0: data_32bit.append(word_32bit)
                word_32bit = 0
            word_32bit += sub_word << (self._data_width*sub_word_cntr)
            print hex(sub_word), hex(word_32bit), (self._data_width*sub_word_cntr)
        if len(data_32bit) > self._data.getSize():
            return -1
        self._data.writeBlock(data_32bit)

    def read_block(self, size):
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
        

        self._log.debug("for board-id {id}:".format(id=board.id()))
        self._log.debug(" LUT nodes : {names}".format(names=self._lutnames))
        self._log.debug(" Please note that LUT nodes are relative to payload.")

    def discover_luts(self):
        self._log.info("Discovering LUTs for Board ID {id}".format(id=self.board.id()))
        # try to discover the luts from the address table
        # have to do this recursive...
        self._lutnames = []
        self._luts = {}
        for node_name in self.board.getNode("payload").getNodes():
            node = self.board.getNode("payload."+node_name)
            tags = node.getTags().split(",")
            parameters = node.getParameters()

            # check whether we have a ported RAM:
            is_ported = False
            sub_nodes = node.getNodes()
            # assuming that a ported RAM always has only data+address as sub nodes:
            if len(sub_nodes) == 2: 
                for sub_node_name in sub_nodes:
                    sub_node = node.getNode(sub_node_name)
                    mode = sub_node.getMode()
                    if mode == uhal.BlockReadWriteMode.NON_INCREMENTAL: 
                        is_ported = True
                    
            if "lut" in tags and is_ported:
                self._luts[node_name] = GMTLUTDirectPorted(node_name, node)
                self._lutnames.append(node_name)
                self._log.info(" found ported direct address node: {name}".format(name=node.getPath()))
            elif "lut" in tags:
                self._luts[node_name] = GMTLUTDirectNonPorted(node_name, node)
                self._lutnames.append(node_name)
                self._log.info(" found direct address node: {name}".format(name=node.getPath()))
            elif "lut_group" in tags and is_ported:
                if not "N" in parameters:
                    self._log.error(" node {name} should be lut_group but needs additional parameters, skipping!".format(name=node_name))
                    continue
                self._luts[node_name] = GMTLUTCommonPorted(node_name, node, parameters["N"], self.board)
                self._lutnames.append(node_name)
                self._log.info(" found ported common address node: {name}".format(name=node.getPath()))
            elif "lut_asym" in tags:
                if not "data_width" in parameters:
                    self._log.error(" node {name} should be asymmetric lut but needs additional parameters, skipping!".format(name=node_name))
                    continue
                self._luts[node_name] = GMTLUTDirectNonPortedAsymmetric(node_name, node, parameters["data_width"])
                self._lutnames.append(node_name)
                self._log.info(" found asymmetric direct address node: {name}".format(name=node.getPath()))
        
        if len(self._lutnames) != 0:
            self._log.info("Discovered the following LUTs: {lutnames}".format(lutnames=self._lutnames))
        else:
            self._log.warning("Could not find nodes in payload with matching tags...")

    def lutnames(self):
        return self._lutnames

    def print_lut_debug(self, name):
        self._log.debug(self._luts[name])

    def write_lut(self, name, data, pos = -1):
        self._log.debug(" writing data: {data_vals}".format(data_vals=[hex(x) for x in data]))
        if name in self._luts.keys():
            lut = self._luts[name]
            if isinstance(lut, GMTLUTCommonPorted):
                if pos == -1:
                    self._log.error("write_lut for lut {name}: Please provide a position to which the data should be written. LUT is a common address lut.".format(name=name))
                    return
                self._log.info("trying to write mem block of size {sz} from {lutname}, position {p}".format(sz=len(data), lutname=name, p=pos))
                val = lut.write_block(pos, data)
            else:
                self._log.info("trying to write mem block of size {sz} from {lutname}".format(sz=len(data), lutname=name))
                val = lut.write_block(data)
            
            if val == -1:
                import sys
                self._log.error("an error occured in write_lut for lut {name}".format(name=name))
                sys.exit(-1)
            return val
        
        self._log.error("write_lut, lut name is not known")


    def read_lut(self, name, size = -1, pos = -1):
        if name in self._luts.keys():
            lut = self._luts[name]
            if size == -1:
                size = lut.get_size()
                self._log.debug("you did not specify size of data to be read. Reading all {size} bit".format(size=size))
            if isinstance(lut, GMTLUTCommonPorted):
                if pos == -1:
                    self._log.error("read_lut for lut {name}: Please provide a position to which the data should be written. LUT is a common address lut.".format(name=name))
                    return
                self._log.info("trying to read mem block of size {sz} from {lutname}, position {p}".format(sz=size, lutname=name, p=pos))
                val = self._luts[name].read_block(pos, size)
            
            else:
                self._log.info("trying to read mem block of size {sz} from {lutname}".format(sz=size, lutname=name))
                val = self._luts[name].read_block(size)
            return val
        self._log.error("read_lut, lut name is not known "+name)
