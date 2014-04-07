#ifndef _mp7_XpointNode_hpp_
#define	_mp7_XpointNode_hpp_

// MP7 Headers
#include "uhal/DerivedNode.hpp"

// C++ Headers
#include <map>

namespace mp7 {
    /*!
     * @class XpointNode
     * @brief Specialised Node to control the Xpoint switches
     *
     * @author Alessandro Thea
     * @date August 2013
     */


    class XpointNode : public uhal::Node {
        UHAL_DERIVEDNODE( XpointNode );
    public:

        enum Clk40Src {
            ExtAMC13,
            ExtMCH,
            IntSrc
        };

        enum RefClkSrc {
            Oscillator,
            ClockCleaner
        };

        // PUBLIC METHODS
        XpointNode( const uhal::Node& );
        virtual ~XpointNode( );

        /// Configure the routing by logical states
        void configure( Clk40Src aClk40Src, RefClkSrc aRefSrc ) const;

        /// Configure the U3 switch
        void configureU3( uint SelForOut0, uint SelForOut1, uint SelForOut2, uint SelForOut3 ) const;

        /// Configure the U15 switch
        void configureU15( uint SelForOut0, uint SelForOut1, uint SelForOut2, uint SelForOut3 ) const;

        /// Configure the U36 switch
        void configureU36( uint SelForOut0, uint SelForOut1, uint SelForOut2, uint SelForOut3 ) const;

        /// Reset the SI5326
        void si5326Reset( ) const;

        // Wait for SI5326 configuration to complete
        void si5326WaitConfigured( uint32_t aMaxTries=1000 ) const;

        /// Check the SI5326 loss of lock
        bool si5326LossOfLock( ) const;

        /// What is this?
        bool si5326Interrupt( ) const;

    protected:

        // PROTECTED METHODS
        void configureUX( const std::string& chip, uint SelForOut0, uint SelForOut1, uint SelForOut2, uint SelForOut3 ) const;

    private:

    };


}



#endif	/* _mp7_XpointNode_hpp_ */


