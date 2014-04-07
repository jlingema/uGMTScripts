#ifndef _mp7_MgtAlignNode_hpp_
#define	_mp7_MgtAlignNode_hpp_

#include "uhal/DerivedNode.hpp"

namespace mp7 {
    /*!@class MGTAlignmentNode
     * @brief Specialised node to control the channel alignment mechanism
     * 
     * To fill
     * 
     * @author Alessandro Thea
     * @date  2013
     */

    class MGTAlignmentNode : public uhal::Node {
        UHAL_DERIVEDNODE( MGTAlignmentNode )
    public:

        // PUBLIC METHODS
        MGTAlignmentNode( const uhal::Node& aNode );
        virtual ~MGTAlignmentNode( );

        /// Align and wait for confirmation
        void align( bool force=false ) const;

        /// Disable the channels
        void enable( std::vector<bool> channels ) const;

        /// Check alignment and CRCs
        bool check( ) const;

    };
}

#endif	/* _mp7_MgtAlignNode_hpp_ */


