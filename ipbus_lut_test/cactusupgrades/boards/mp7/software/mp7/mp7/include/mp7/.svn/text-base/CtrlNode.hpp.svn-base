#ifndef _mp7_CSRNode_hpp_
#define	_mp7_CSRNode_hpp_

// MP7 Headers
#include "uhal/DerivedNode.hpp"

namespace mp7 {
    /*!
     * @class CtrlNode
     * @brief Specialised node that provides the basic control over the MP7 board
     * 
     * Some notes about the registers
     * Tx/Rx buffer selection: rx = 0,  tx = 1 (as in BufferSelect enum)
     * 
     * @author Alessandro Thea
     * @date  2013
     */

    class CtrlNode : public uhal::Node {
        UHAL_DERIVEDNODE( CtrlNode );
        
    public:
      
        enum BufferSelect { Rx, Tx };

        // PUBLIC METHODS
        CtrlNode( const uhal::Node& );
        virtual ~CtrlNode( );

        /// Nuke the board and reset the 40 Mhz clock
        void nuke( double aMilliSleep=1000 ) const;
        
        /// Soft reset
        void softReset() const;

        /// wait (up to 100 ms) for the clock lock
        void waitClk40Lock( uint32_t aMaxTries=1000 ) const;

        /// Select the clock
        void selectClk40Source( bool aExternalClock=true, double aMilliSleep=1000 ) const;

        /// Select the channel to access to
        void selectChannel( uint32_t channel ) const;

        /// Select quad to access to
        void selectQuad( uint32_t quad ) const;

        /// Select quad and channel
        void selectQuadChan( uint32_t quad, uint32_t chan ) const;

        /// Select link
        void selectLink( uint32_t link ) const;
        
        /// Select buffer
        void selectLinkBuffer( uint32_t aLink, BufferSelect aBuffer ) const;

        /// return the locking status of the 40Mhz clock
        bool clock40Locked( ) const;

    };

}

#endif	/* _mp7_CSRNode_hpp_ */

