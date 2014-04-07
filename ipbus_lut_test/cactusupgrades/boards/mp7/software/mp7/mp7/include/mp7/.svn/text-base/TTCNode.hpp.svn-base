#ifndef _mp7_TTCNode_hpp_
#define	_mp7_TTCNode_hpp_

// C++ Headers
#include <map>

// MP7 Headers
#include "uhal/DerivedNode.hpp"

namespace mp7 {
    /*!@class TTCNode
     * @brief Derived class to for the TTC control block.
     *
     * ** Signals and resets
     * Here are reset all those signals which have to be synchronous with the ttc.
     * For this reason ~algo_rst~ belongs to TTC and not to the CSR (as other clock40 async resets)

     * - ~ttc_enable~: enables external TTC inputs (from the AMC13)
     * - ~int_bc0_enable~: generate internal BC0 signals

     * ** Frequency measurement
     * Managed within: ~ttc.ttc_freq~
     * Meaning of subnodes
     * - ~chan_sel~: Selection of the clock to measure. Values in the range [0-3] are allowed. When 'single channel' is specified, the frequency measured belongs to the channel selected in the top CSR node.
     *   + 0: Clock 40
     *   + 1: Reference clock [single channel]
     *   + 2: rx clock [single channel]
     *   + 3: tx clock [single channel]

     * @author Alessandro Thea
     * @date August 2013
     */


    class TTCNode : public uhal::Node {
        UHAL_DERIVEDNODE( TTCNode )
        
        const static uint32_t mBTestCode;
    public:
        TTCNode( const uhal::Node& aNode );
        virtual ~TTCNode( );

        enum FreqClockChannel {
            Clock40=0x0,
            RefClock=0x1,
            RxClock=0x2,
            TxClock=0x3
        };
        /// Enable the TTC block
        //void enable( bool enable=true ) const;

        /// Clears the counters
        void clear( ) const;
        
        /// Send BGo
        void sendBGo( uint32_t aCode ) const;
        
        /// Send test Bgo (Btest)
        void sendBTest() const;

        /// run buffers
        void captureData( double wait=1. /* seconds */ ) const;

        /// capture the incoming BGOs
        std::vector<uint64_t> captureBGOs( bool aMaskBC0=false, double aWaitSec=1. /* seconds */ ) const;

        /// wait for BC0Lock
        void waitBC0Lock( ) const;

        /// freq 40 reading
        double freqClk40( double aWait=1. ) const;

        /// reset clock40
        void resetClk40( bool aReset ) const;

    };
}
#endif	/* _mp7_TTCNode_hpp_ */


