import uhal
from _core import *

# Utility function to take a snapshot of all the registers
def snapshot(self, aRegex = '' ):
  if aRegex :
    nodes = self.getNodes(aRegex)
  else:
    nodes = self.getNodes()

  vwords = [ (node,self.getNode(node).read()) for node in nodes ]
  self.getClient().dispatch()
  return dict( [ (n,v.value()) for n,v in vwords ] )

_classes = [
  CtrlNode,
  TTCNode,
  XpointNode,
  OpenCoresI2C,
  SI5326Node,

  GTHQuadNode,
  GTXQuadNode,
  MGTBufferNode,
  DatapathNode,
  MGTAlignmentNode,

  DemuxNode,
  PPRamNode,
  ]

for cl in _classes:
  setattr(cl,'snapshot',snapshot)
  setattr(cl,'dump',snapshot)

for name,enum in DatapathNode.DataSrc.names.iteritems():
  setattr(DatapathNode,name,enum)
for name,enum in DatapathNode.BufMode.names.iteritems():
  setattr(DatapathNode,name,enum)


# this is for later
#def exception_to_string(self):
   #return self.what

#exception.__str__ = exception_to_string

