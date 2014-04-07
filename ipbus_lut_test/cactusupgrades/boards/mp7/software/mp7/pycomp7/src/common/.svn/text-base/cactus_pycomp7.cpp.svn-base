// Boost Headers
#include "boost/lexical_cast.hpp"
#include "boost/algorithm/string.hpp"
#include "boost/python.hpp"
#include "boost/python/module.hpp"
#include "boost/python/def.hpp"
#include "boost/python/suite/indexing/vector_indexing_suite.hpp"
#include "boost/python/wrapper.hpp"

// C++ Headers
#include "map"

// uHal Headers
#include "uhal/uhal.hpp"

// MP7 Headers
#include "mp7/MP7690Driver.hpp"
#include "mp7/CtrlNode.hpp"
#include "mp7/GTXQuadNode.hpp"
#include "mp7/GTHQuadNode.hpp"

#include "mp7/TTCNode.hpp"
#include "mp7/XpointNode.hpp"
#include "mp7/SI5326Node.hpp"
#include "mp7/MGTBufferNode.hpp"
#include "mp7/DatapathNode.hpp"
#include "mp7/PPRamNode.hpp"
#include "mp7/MGTAlignmentNode.hpp"
#include "mp7/DemuxNode.hpp"


// Custom Python Headers
#include "mp7/python/converters_exceptions.hpp"

using namespace boost::python;

BOOST_PYTHON_MEMBER_FUNCTION_OVERLOADS ( mp7_TTCNode_captureData_overloads, captureData, 0, 1 )
BOOST_PYTHON_MEMBER_FUNCTION_OVERLOADS ( mp7_TTCNode_captureBGOs_overloads, captureBGOs, 0, 2 )
BOOST_PYTHON_MEMBER_FUNCTION_OVERLOADS ( mp7_TTCNode_freqClk40_overloads, freqClk40, 0, 1 )

BOOST_PYTHON_MEMBER_FUNCTION_OVERLOADS ( mp7_CTRLNODE_nuke_overloads, nuke, 0, 1 )
BOOST_PYTHON_MEMBER_FUNCTION_OVERLOADS ( mp7_CTRLNODE_selectClk40Source_overloads, selectClk40Source, 0, 2 )
BOOST_PYTHON_MEMBER_FUNCTION_OVERLOADS ( mp7_CTRLNODE_resetClk40_overloads, resetClk40, 0, 1 )
BOOST_PYTHON_MEMBER_FUNCTION_OVERLOADS ( mp7_CTRLNODE_waitClk40Lock_overloads, waitClk40Lock, 0, 1 )

BOOST_PYTHON_MEMBER_FUNCTION_OVERLOADS ( mp7_XPOINTNODE_si5326WaitConfigured_overloads, si5326WaitConfigured, 0, 1 )

BOOST_PYTHON_MEMBER_FUNCTION_OVERLOADS ( mp7_MGTAlignmentNode_align_overloads, align, 0, 1 )

BOOST_PYTHON_MEMBER_FUNCTION_OVERLOADS ( mp7_MGTBufferNode_captureRange_overloads, captureRange, 2, 3 )
BOOST_PYTHON_MEMBER_FUNCTION_OVERLOADS ( mp7_MGTBufferNode_playbackRange_overloads, playbackRange, 2, 3 )
BOOST_PYTHON_MEMBER_FUNCTION_OVERLOADS ( mp7_MGTBufferNode_internalloop_overloads, internalLoop, 0, 1 )
BOOST_PYTHON_MEMBER_FUNCTION_OVERLOADS ( mp7_MGTBufferNode_externalloop_overloads, externalLoop, 0, 1 )


// *** N.B: The argument of this BOOST_PYTHON_MODULE macro MUST be the same as the name of the library created, i.e. if creating library file my_py_binds_module.so , imported in python as:
//                import my_py_binds_module
//          then would have to put
//                BOOST_PYTHON_MODULE(my_py_binds_module)
//          Otherwise, will get the error message "ImportError: dynamic module does not define init function (initmy_py_binds_module)
BOOST_PYTHON_MODULE ( _core )
{
  // CONVERTERS
  pycomp7::register_converters();
  // EXCEPTIONS
  pycomp7::wrap_exceptions();

  // Wrap MP7690Driver
  class_<mp7::MP7690Driver,bases<uhal::HwInterface> > ( "MP7690Driver", init<uhal::HwInterface&>() )
  //    .def("reset", &mp7::MP7Stub::reset)
  //    .def("getName", &mp7::MP7Stub::getName)
  //    .def("getId", &mp7::MP7Stub::getId)
  ;
  // Wrap the CtrlNode
  {
    scope mp7_CtrlNode_scope = class_<mp7::CtrlNode, bases<uhal::Node> > ( "CtrlNode", init<const uhal::Node&>() )
                              .def ( "nuke", ( void ( mp7::CtrlNode::* ) ( double ) ) 0, mp7_CTRLNODE_nuke_overloads() )
                              .def ( "softReset", &mp7::CtrlNode::softReset )
                              .def ( "waitClk40Lock", ( void ( mp7::CtrlNode::* ) ( uint32_t ) ) 0, mp7_CTRLNODE_waitClk40Lock_overloads() )
                              .def ( "selectClk40Source", ( void ( mp7::CtrlNode::* ) ( bool, double ) ) 0, mp7_CTRLNODE_selectClk40Source_overloads() )
                              .def ( "clock40Locked", &mp7::CtrlNode::clock40Locked )
                              .def ( "selectChannel", &mp7::CtrlNode::selectChannel )
                              .def ( "selectQuad", &mp7::CtrlNode::selectQuad )
                              .def ( "selectQuadChan", &mp7::CtrlNode::selectQuadChan )
                              .def ( "selectLink",  &mp7::CtrlNode::selectLink )
                              .def ( "selectLinkBuffer",  &mp7::CtrlNode::selectLinkBuffer )
                              ;
    enum_<mp7::CtrlNode::BufferSelect> ( "BufferSelect" )
    .value ( "Rx", mp7::CtrlNode::Rx )
    .value ( "Tx", mp7::CtrlNode::Tx )
    .export_values()
    ;
  }
  // Wrap TTCNode
  class_<mp7::TTCNode, bases<uhal::Node> > ( "TTCNode", init<const uhal::Node&>() )
  .def ( "clear", &mp7::TTCNode::clear )
  .def ( "captureData", ( void ( mp7::TTCNode::* ) ( double ) ) 0, mp7_TTCNode_captureData_overloads() )
  .def ( "captureBGOs", ( std::vector<uint64_t> ( mp7::TTCNode::* ) ( bool, double ) ) 0, mp7_TTCNode_captureBGOs_overloads() )
  .def ( "sendBGo", &mp7::TTCNode::sendBGo)
  .def ( "sendBTest", &mp7::TTCNode::sendBTest )
  .def ( "waitBC0Lock", &mp7::TTCNode::waitBC0Lock )
  .def ( "freqClk40", ( double ( mp7::TTCNode::* ) ( double ) ) 0, mp7_TTCNode_freqClk40_overloads() )
  ;
  // Wrap XpointNode
  {
    // XpointNode scoping
    scope mp7_XpointNode_scope = class_<mp7::XpointNode, bases<uhal::Node> > ( "XpointNode", init<const uhal::Node&>() )
                                 .def ( "configure", &mp7::XpointNode::configure )
                                 .def ( "configureU3", &mp7::XpointNode::configureU3 )
                                 .def ( "configureU15", &mp7::XpointNode::configureU15 )
                                 .def ( "configureU36", &mp7::XpointNode::configureU36 )
                                 .def ( "si5326Reset", &mp7::XpointNode::si5326Reset )
                                 .def ( "si5326WaitConfigured", ( void ( mp7::XpointNode::* ) ( uint32_t ) ) 0, mp7_XPOINTNODE_si5326WaitConfigured_overloads() )
                                 .def ( "si5326LossOfLock", &mp7::XpointNode::si5326LossOfLock )
                                 .def ( "si5326Interrupt", &mp7::XpointNode::si5326Interrupt )
                                 ;
    enum_<mp7::XpointNode::Clk40Src> ( "Clk40Src" )
    .value ( "ExtAMC13", mp7::XpointNode::ExtAMC13 )
    .value ( "ExtMCH", mp7::XpointNode::ExtMCH )
    .value ( "IntSrc", mp7::XpointNode::IntSrc )
    .export_values()
    ;
    enum_<mp7::XpointNode::RefClkSrc> ( "RefClkSrc" )
    .value ( "Oscillator", mp7::XpointNode::Oscillator )
    .value ( "ClockCleaner", mp7::XpointNode::ClockCleaner )
    .export_values()
    ;
  }
  // Wrap SI5326Node
  class_<mp7::OpenCoresI2C , bases<uhal::Node> > ( "OpenCoresI2C", init<const uhal::Node&>() )
  .def ( "getI2CSlaveAddress", &mp7::OpenCoresI2C::getI2CSlaveAddress )
  .def ( "getI2CClockPrescale", &mp7::OpenCoresI2C::getI2CClockPrescale )
  .def ( "readI2C", &mp7::OpenCoresI2C::readI2C )
  .def ( "writeI2C", &mp7::OpenCoresI2C::readI2C )
  ;
  // Wrap SI5326Node
  class_<mp7::SI5326Node, bases<mp7::OpenCoresI2C> > ( "SI5326Node", init<const uhal::Node&>() )
  .def ( "configure", &mp7::SI5326Node::configure )
  .def ( "reset", &mp7::SI5326Node::reset )
  .def ( "intcalib", &mp7::SI5326Node::intcalib )
  .def ( "sleep", &mp7::SI5326Node::sleep )
  .def ( "debug", &mp7::SI5326Node::debug )
  .def ( "registers", &mp7::SI5326Node::registers )
  ;
  // Wrap the GTXQuadNode
  class_<mp7::GTXQuadNode, bases<uhal::Node> > ( "GTXQuadNode", init<const uhal::Node&>() )
  .def ( "configure", &mp7::GTXQuadNode::configure )
  .def ( "softReset", &mp7::GTXQuadNode::softReset )
  .def ( "resetFSMs", &mp7::GTXQuadNode::resetFSMs )
  .def ( "alignOnce", &mp7::GTXQuadNode::alignOnce )
  .def ( "check", &mp7::GTXQuadNode::check )
  ;
  // Wrap the GTHQuadNode
  class_<mp7::GTHQuadNode, bases<uhal::Node> > ( "GTHQuadNode", init<const uhal::Node&>() )
  .def ( "exists", &mp7::GTHQuadNode::exists )
  .def ( "configure", &mp7::GTHQuadNode::configure )
  .def ( "softReset", &mp7::GTHQuadNode::softReset )
  .def ( "resetFSMs", &mp7::GTHQuadNode::resetFSMs )
  .def ( "clear", &mp7::GTHQuadNode::clear )
  .def ( "check", &mp7::GTHQuadNode::check )
  ;

  // Wrap the MGTBufferNode
  {
    // MGTBufferNode scoping
    scope mp7_MGTBufferNode_scope = class_<mp7::MGTBufferNode, bases<uhal::Node> > ( "MGTBufferNode", init<const uhal::Node&>() )
                                    .def ( "waitLock", &mp7::MGTBufferNode::waitLock )
                                    .def ( "waitCaptureDone", &mp7::MGTBufferNode::waitCaptureDone )
                                    .def ( "configure", &mp7::MGTBufferNode::configure )
                                    .def ( "playbackRange", ( void ( mp7::MGTBufferNode::* ) ( uint32_t, uint32_t, bool ) ) 0, mp7_MGTBufferNode_playbackRange_overloads() )
                                    .def ( "captureRange", ( void ( mp7::MGTBufferNode::* ) ( uint32_t, uint32_t, bool ) ) 0, mp7_MGTBufferNode_captureRange_overloads() )
                                    .def ( "internalLoop", ( void ( mp7::MGTBufferNode::* ) ( bool ) ) 0, mp7_MGTBufferNode_internalloop_overloads() )
                                    .def ( "externalLoop", ( void ( mp7::MGTBufferNode::* ) ( bool ) ) 0, mp7_MGTBufferNode_externalloop_overloads() )
                                    .def ( "writeRawRx", &mp7::MGTBufferNode::writeRawRx )
                                    .def ( "writeRawTx", &mp7::MGTBufferNode::writeRawTx )
                                    .def ( "readRawRx", &mp7::MGTBufferNode::readRawRx )
                                    .def ( "readRawTx", &mp7::MGTBufferNode::readRawTx )
                                    .def ( "clearRx", &mp7::MGTBufferNode::clearRx )
                                    .def ( "clearTx", &mp7::MGTBufferNode::clearTx )
                                    .def ( "uploadRx", &mp7::MGTBufferNode::uploadRx )
                                    .def ( "uploadTx", &mp7::MGTBufferNode::uploadTx )
                                    .def ( "downloadRx", &mp7::MGTBufferNode::downloadRx )
                                    .def ( "downloadTx", &mp7::MGTBufferNode::downloadTx )
                                    .def ( "uploadValidRx", &mp7::MGTBufferNode::uploadValidRx )
                                    .def ( "uploadValidTx", &mp7::MGTBufferNode::uploadValidTx )
                                    .def ( "downloadValidRx", &mp7::MGTBufferNode::downloadValidRx )
                                    .def ( "downloadValidTx", &mp7::MGTBufferNode::downloadValidTx )
                                    ;
    enum_<mp7::MGTBufferNode::Mode> ( "Mode" )
    .value ( "Disabled", mp7::MGTBufferNode::Disabled )
    .value ( "Capture", mp7::MGTBufferNode::Capure )
    .value ( "Playback", mp7::MGTBufferNode::Playback )
    .value ( "Pattern", mp7::MGTBufferNode::Pattern )
    .export_values()
    ;
  }
  // Wrap the Datapath
  {
    // Datapath scoping
    scope mp7_DatapathNode_scope = class_<mp7::DatapathNode, bases<uhal::Node> > ( "DatapathNode", init<const uhal::Node&>() )
                                    .def ( "getBufferSize", &mp7::DatapathNode::getBufferSize )
                                    .def ( "waitCaptureDone", &mp7::DatapathNode::waitCaptureDone )
                                    .def ( "configure", &mp7::DatapathNode::configure )
                                    .def ( "setRange", &mp7::DatapathNode::setRange )
                                    .def ( "clear", &mp7::DatapathNode::clear)
                                    .def ( "upload", &mp7::DatapathNode::upload)
                                    .def ( "download", &mp7::DatapathNode::download)
                                    .def ( "uploadValid", &mp7::DatapathNode::uploadValid)
                                    .def ( "downloadValid", &mp7::DatapathNode::downloadValid)
                                    .def ( "readRaw", &mp7::DatapathNode::readRaw)
                                    .def ( "writeRaw", &mp7::DatapathNode::writeRaw)
                                    ;
    enum_<mp7::DatapathNode::BufMode> ( "BufMode" )
      .value ( "Latency", mp7::DatapathNode::Latency )
      .value ( "Capture", mp7::DatapathNode::Capture )
      .value ( "PlayOnce", mp7::DatapathNode::PlayOnce )
      .value ( "PlayLoop", mp7::DatapathNode::PlayLoop )
      .export_values()
    ;

    enum_<mp7::DatapathNode::DataSrc> ( "DataSrc" )
      .value ( "Input", mp7::DatapathNode::Input )
      .value ( "Buffer", mp7::DatapathNode::Buffer )
      .value ( "Pattern", mp7::DatapathNode::Pattern )
      .value ( "Zeroes", mp7::DatapathNode::Zeroes )
      .export_values()
    ;
  }
  // Wrap the PPRamNode
  class_<mp7::PPRamNode, bases<uhal::Node> > ( "PPRamNode", init<const uhal::Node&>() )
  .def ( "upload", &mp7::PPRamNode::upload )
  //  .def( "writePayload", &mp7::PPRamNode::writePayload )
  .def ( "dumpRam", &mp7::PPRamNode::dumpRAM )
  .def ( "upload64", &mp7::PPRamNode::upload64 )
  ;
  // Wrap the MGTAlignmentNode
  class_<mp7::MGTAlignmentNode, bases<uhal::Node> > ( "MGTAlignmentNode", init<const uhal::Node&>() )
  .def ( "align", ( void ( mp7::MGTAlignmentNode::* ) ( bool ) ) 0, mp7_MGTAlignmentNode_align_overloads() )
  .def ( "enable", &mp7::MGTAlignmentNode::enable )
  .def ( "check", &mp7::MGTAlignmentNode::check )
  ;
  // Wrap the DemuxNode
  class_<mp7::DemuxNode, bases<uhal::Node> > ( "DemuxNode", init<const uhal::Node&>() )
  ;
}

