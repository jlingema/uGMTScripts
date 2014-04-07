#include "mp7/CtrlNode.hpp"

// MP7 Headers
#include "mp7/helpers.hpp"
#include "mp7/exception.hpp"

// uHal Headers
#include "uhal/log/log.hpp"

// Namespace resolution
using namespace std;
using namespace uhal;

namespace mp7 {
    UHAL_REGISTER_DERIVED_NODE( CtrlNode );

    // PUBLIC METHODS

    CtrlNode::CtrlNode( const uhal::Node& node ) : uhal::Node( node ) {
    }

    CtrlNode::~CtrlNode( ) {
    }

    void
    CtrlNode::nuke( double aMilliSleep ) const {
        getNode("csr.ctrl.nuke").write(0x1);
        getClient().dispatch();
        millisleep(aMilliSleep);
    }
    
    void
    CtrlNode::softReset() const {
        getNode("csr.ctrl.soft_rst").write(0x1);
        getClient().dispatch();
    }

    void
    CtrlNode::selectClk40Source( bool aExternalClock, double aMilliSleep ) const {
        getNode("csr.ctrl.clk40_rst").write(0x1);
        getNode("csr.ctrl.clk40_sel").write(( int ) aExternalClock);
        getNode("csr.ctrl.clk40_rst").write(0x0);
        getClient().dispatch();
        millisleep(aMilliSleep);
        waitClk40Lock();
    }

    void
    CtrlNode::waitClk40Lock( uint32_t aMaxTries ) const {
        uhal::ValWord< uint32_t > clk40_lck(0);
        int32_t countdown(aMaxTries);

        while( countdown > 0 ) {
            clk40_lck = this->getNode("csr.stat.clk40_lock").read();
            this->getClient().dispatch();
            if( clk40_lck.value() ) {
                break;
            }

            millisleep(1);
            countdown--;
        }

        if( countdown == 0 ) {
            log(Error(), "timed out waiting for clock40 lock signal");
            //throw runtime_error("timed out waiting for clock40 lock signal");
            exception::Clock40LockFailed lExc;
            log(lExc, "Timed out while waiting for Clock40 to lock (", uhal::Integer(aMaxTries), " ms)");
            throw lExc;
        } else {
            log(Notice(), "Clock 40 Locked after ", uhal::Integer(aMaxTries - countdown), " ms");
        }
    }

    void
    CtrlNode::selectChannel( uint32_t channel ) const {
        // throw here if channel > 4
        getNode("csr.ctrl.chan_sel").write(channel);
        getClient().dispatch();
    }

    void
    CtrlNode::selectQuad( uint32_t quad ) const {
        //
        getNode("csr.ctrl.quad_sel").write(quad);
        getClient().dispatch();
    }

    void
    CtrlNode::selectQuadChan( uint32_t quad, uint32_t chan ) const {
        getNode("csr.ctrl.quad_sel").write(quad);
        getNode("csr.ctrl.chan_sel").write(chan);
        getClient().dispatch();
    }

    void
    CtrlNode::selectLink( uint32_t link ) const {
        log(Debug(), "Selecting link ", uhal::Integer(link));
        this->selectQuadChan(link / 4, link % 4);
    }

    void
    CtrlNode::selectLinkBuffer( uint32_t aLink, BufferSelect aBuffer ) const {
        log(Debug(), "Selecting link buffer ", uhal::Integer(aLink));
        getNode("csr.ctrl.quad_sel").write(aLink / 4);
        getNode("csr.ctrl.chan_sel").write(aLink % 4);
        getNode("csr.ctrl.txrx_sel").write( aBuffer );
        getClient().dispatch();
    }
     
    bool
    CtrlNode::clock40Locked( ) const {
        uhal::ValWord<uint32_t> lock = getNode("csr.stat.clk40_lock").read();
        getClient().dispatch();
        return( bool) lock.value();
    }

}

