/*
 * File:   MP7690Driver.cpp
 * Author: ale
 *
 * Created on February 5, 2014, 9:55 AM
 */

#include "mp7/MP7690Driver.hpp"

// uHAL Headers
#include "uhal/log/log.hpp"

// MP7 Headers
#include "mp7/helpers.hpp"

// Namespace resolution
using namespace uhal;

namespace mp7 {

    MP7690Driver::MP7690Driver( const uhal::HwInterface& aInterface ) :
    mBoard( aInterface ),
    mCsr( aInterface.getNode( "ctrl.csr" ) ),
    mTtc( aInterface.getNode( "ttc" ) ),
    mXpoint( aInterface.getNode( "ctrl.xpoint" ) ),
    mSi5326( aInterface.getNode( "ctrl.i2c_clk" ) ),
    mGth( aInterface.getNode( "mgt" ) ),
    mBuf( aInterface.getNode( "buffers" ) ),
    mAlign( aInterface.getNode( "mgt_align" ) ) {

    }

    MP7690Driver::~MP7690Driver( ) {
    }

    void
    MP7690Driver::reset( bool extClk40Src ) const {
        /*
            Reset the board status and configure clocking.
         */

        // Meaningful configurations
        // - internal clock can be only 250
        // - SI5326 configuration is needed for 160/240 only

        // self._log.warn('Resetting board %s',board.id())

        mCsr.nuke();

        log(Info(), "Reset done");

        log(Info(), "Configuring clock 40");
        // leave clk40 in reset until the xpoint is set
        mCsr.getNode("ctrl.clk40_rst").write(0x1);
        mCsr.getNode("ctrl.clk40_sel").write(extClk40Src); //<--- put a parameter here
        mCsr.getClient().dispatch();

        //-- xpoint configuration is pure routing
        log(Info(), "Configuring Xpoint");


        if( !extClk40Src ) {
            mXpoint.configure(XpointNode::IntSrc, XpointNode::Oscillator);
        } else {
            mXpoint.configure(XpointNode::ExtAMC13, XpointNode::ClockCleaner);

            log(Warning(), "The SI5326 chip configuration is hardcoded!");
            // Configure the si5326 clock only if in external mode
            log(Info(), "Configuring SI5326");
            std::string sicfg = "etc/config/mp7/si5326/MP7_SI5326_20130606_40.1MHz_CKIN1_to_160.4MHz_CKOUT1_NoIncDec_Regs.txt";
            log(Info(), "   Using ", sicfg);

            // reset the chip
            mXpoint.si5326Reset();

            // sleep
            millisleep(1000);

            // and then reconfigure
            mSi5326.configure(sicfg);

            millisleep(500);

            // Wait the si5326 to recover
            mXpoint.si5326WaitConfigured();

            mSi5326.debug();
        }
        // All steps completed, release clock 40
        mCsr.getNode("ctrl.clk40_rst").write(0x0);
        mCsr.getClient().dispatch();
        mCsr.waitClk40Lock();
    }

    void
    MP7690Driver::enableTTC( bool aEnable ) {

    }

    void
    MP7690Driver::generateBC0s( bool aGenerate ) {

    }
}

