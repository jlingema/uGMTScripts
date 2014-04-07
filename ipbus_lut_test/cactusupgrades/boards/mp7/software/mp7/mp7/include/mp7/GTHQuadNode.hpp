
#ifndef _mp7_GTHQuadNode_hpp_
#define	_mp7_GTHQuadNode_hpp_


// MP7 Headers
#include "uhal/DerivedNode.hpp"

// C++ Headers
#include <string>
#include <map>

namespace mp7 {
    /*!
     * @class GTHQuadNode
     * @brief
     * @author Alessandro Thea
     * @date 2013
     */


    class GTHQuadNode : public uhal::Node {
        UHAL_DERIVEDNODE( GTHQuadNode )
    public:
        // PUBLIC METHODS
        GTHQuadNode( const uhal::Node& );
        virtual ~GTHQuadNode( );

        /// Config the loopback on the 4 channels of the quad
        /// 0 - no loopback
        /// 1 - some loopback?
        /// 2 - full loopback
        void configure( uint32_t Loop0, uint32_t Loop1, uint32_t Loop2, uint32_t Loop3 ) const;

        // Re-align the transcievers
        void clear( ) const;

        /// Issue a soft reset to the common block
        void softReset( ) const;

        /// Reset the transciever state machine
        void resetFSMs( ) const;

        bool check( ) const;

        bool exists( ) const;

    private:
        // PRIVATE MEMBERS

    };
}

#endif	/* _mp7_GTHQuadNode_hpp_ */


