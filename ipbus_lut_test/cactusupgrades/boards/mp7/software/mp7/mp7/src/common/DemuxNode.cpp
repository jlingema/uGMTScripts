#include "mp7/DemuxNode.hpp"

// Namespace resolution
using namespace uhal;

namespace mp7 {

    UHAL_REGISTER_DERIVED_NODE( DemuxNode )

    DemuxNode::DemuxNode( const uhal::Node& aNode ) :
    uhal::Node( aNode ) {
    }

    DemuxNode::~DemuxNode( ) {
    }

}
