#include "mp7/XpointNode.hpp"

// C++ Headers
#include <stdexcept>

// MP7 Headers
#include "mp7/helpers.hpp"
#include "mp7/exception.hpp"
// uHal headers
#include "uhal/ValMem.hpp"

// Namespace resolution
using namespace std;
using namespace uhal;

namespace mp7 {
    UHAL_REGISTER_DERIVED_NODE( XpointNode );

    XpointNode::XpointNode( const uhal::Node& node ) :
    uhal::Node( node ) {
    }

    XpointNode::~XpointNode( ) {
    }

    void
    XpointNode::configure( Clk40Src aClk40Src, RefClkSrc aRefSrc ) const {

        switch( aClk40Src ) {
            case ExtAMC13:
                // Clock 40 routing from AMC13
                this->configureU36(3, 3, 0, 0);
                break;
            case ExtMCH:
                // Clock 40 routing from MCH, external clock generator
                this->configureU36(1, 1, 0, 0);
                break;
            case IntSrc:
                // From internal oscillator
                // U36 don't matter. Best to have a default anyway?
                break;
            default:
                throw runtime_error("Invalid clock 40 source");
        }

        switch( aRefSrc ) {
            case Oscillator:
                // Refclock from the internal oscillator
                this->configureU3(1, 1, 1, 1);
                this->configureU15(1, 1, 1, 1);
                break;
            case ClockCleaner:
                // Refclock from clock chip
                this->configureU3(3, 3, 3, 3);
                this->configureU15(3, 3, 3, 3);
                break;
            default:
                throw runtime_error("Invalid reference clock source");
                break;
        }
    }

    void
    XpointNode::configureUX( const std::string& aChip, uint SelForOut0, uint SelForOut1, uint SelForOut2, uint SelForOut3 ) const {

        const Node& ctrl = this->getNode("ctrl");
        ctrl.getNode("selforout1_" + aChip).write(SelForOut0);
        ctrl.getNode("selforout2_" + aChip).write(SelForOut1);
        ctrl.getNode("selforout3_" + aChip).write(SelForOut2);
        ctrl.getNode("selforout4_" + aChip).write(SelForOut3);

        ctrl.getNode("prog_" + aChip).write(1);
        this->getClient().dispatch();
        usleep(10);
        ctrl.getNode("prog_" + aChip).write(0);
        this->getClient().dispatch();
        // wait for the cross point switch to assert its done signal
        const string stat_done = "stat.done_" + aChip;
        ValWord< uint32_t > done(0);
        int countdown = 100;

        while( countdown > 0 ) {
            done = this->getNode(stat_done).read();
            this->getClient().dispatch();

            if( done ) {
                break;
            }

            --countdown;
        }

        if( countdown == 0 ) {
            exception::XpointConfigTimeout lExc;
            log(lExc, "Timed out while waiting for Xpoint ", aChip, " to complete configuration ( 100 tries)");
            throw lExc;
        }
    }

    void
    XpointNode::configureU3( uint SelForOut0, uint SelForOut1, uint SelForOut2, uint SelForOut3 ) const {
        // Inputs to xpoint_u3          	 Outputs to xpoint_u3
        // ===================          	 ===================
        // Input 0 = osc2               	 Output 0 = refclk0
        // Input 1 = osc1               	 Output 1 = refclk1
        // Input 2 = clk2               	 Output 2 = refclk2
        // Input 3 = clk1               	 Output 3 = refclk3
        this->configureUX("u3", SelForOut0, SelForOut1, SelForOut2, SelForOut3);
    }

    void
    XpointNode::configureU15( uint SelForOut0, uint SelForOut1, uint SelForOut2, uint SelForOut3 ) const {
        // Inputs to xpoint_u15            Outputs to xpoint_u15
        // ===================             ===================
        // Input 0 = osc2                  Output 0 = refclk4
        // Input 1 = osc1                  Output 1 = refclk5
        // Input 2 = clk2                  Output 2 = refclk6
        // Input 3 = clk1                  Output 3 = refclk7
        this->configureUX("u15", SelForOut0, SelForOut1, SelForOut2, SelForOut3);
    }

    void
    XpointNode::configureU36( uint SelForOut0, uint SelForOut1, uint SelForOut2, uint SelForOut3 ) const {
        // Inputs to xpoint_u36           	 Outputs to xpoint_u36
        // Input 0 = si5326 clk1 output   	 Output 0 = si5326 clk1 input
        // Input 1 = TCLK-C               	 Output 1 = clk3
        // Input 2 = TCLK-A               	 Output 2 = clk2
        // Input 3 = FCLK-A               	 Output 3 = clk1
        // ---------------------------------------------------------------------
        // Wish to send MCH TCLK-A (input-2) to si5326 (output-0) and for all
        // other outputs to be driven by si5326 (input-0)
        // ---------------------------------------------------------------------
        this->configureUX("u36", SelForOut0, SelForOut1, SelForOut2, SelForOut3);
    }

    void
    XpointNode::si5326Reset( ) const {
        // Reset the si5326
        this->getNode("ctrl.rst_si5326").write(0);
        this->getClient().dispatch();
        // minimum reset pulse width is 1 microsecond, we go for 5
        usleep(5);
        this->getNode("ctrl.rst_si5326").write(1);
        this->getClient().dispatch();
    }

    void
    XpointNode::si5326WaitConfigured( uint32_t aMaxTries ) const {
        uint32_t countdown(aMaxTries);
        while( countdown > 0 ) {
            ValWord<uint32_t> si5326_lol = this->getNode("stat.si5326_lol").read();
            ValWord<uint32_t> si5326_int = this->getNode("stat.si5326_int").read();
            this->getClient().dispatch();

            if( si5326_lol.value() == 0 && si5326_int.value() == 0 ) {
                break;
            }

            millisleep(1);
            --countdown;
        }

        if( countdown == 0 ) {
            log(Error(), "timed out waiting for si5326 to recover from configuration");
            exception::SI5326ConfigurationTimeout lExc;
            log(lExc, "Timed out while waiting for SI5326 to compltete configuration (", uhal::Integer(aMaxTries), " ms)");
            throw lExc;
        } else {
            log(Notice(), "SI5326 finished configuring after ", uhal::Integer(aMaxTries - countdown), " ms");
        }
    }

    bool
    XpointNode::si5326LossOfLock( ) const {
        ValWord<uint32_t> si5326_lol = this->getNode("stat.si5326_lol").read();
        this->getClient().dispatch();
        return( bool) si5326_lol;
    }

    bool
    XpointNode::si5326Interrupt( ) const {
        ValWord<uint32_t> si5326_int = this->getNode("stat.si5326_int").read();
        this->getClient().dispatch();
        return( bool) si5326_int;
    }

}

