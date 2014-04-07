#include "mp7/TTCNode.hpp"

// MP7 Headers
#include "mp7/helpers.hpp"
#include "mp7/exception.hpp"

// uHAL Headers
#include "uhal/log/log.hpp"

// Namespace resolution
using namespace std;
using namespace uhal;

namespace mp7 {
    UHAL_REGISTER_DERIVED_NODE( TTCNode );

    // PRIVATE CONSTANTS
    const uint32_t TTCNode::mBTestCode = 0xc;
    
    // PUBLIC METHODS

    TTCNode::TTCNode( const uhal::Node& aNode ) :
    uhal::Node( aNode ) {
    }

    TTCNode::~TTCNode( ) {
    }

    //  void
    //  TTCNode::enable(bool enable) const {
    //    getNode("csr.ctrl.ttc_enable").write(enable);
    //    getClient().dispatch();
    //  }

    void
    TTCNode::clear( ) const {
        getNode("csr.ctrl.err_ctr_clear").write(1);
        getNode("csr.ctrl.err_ctr_clear").write(0);
        getNode("csr.ctrl.ctr_clear").write(1);
        getNode("csr.ctrl.ctr_clear").write(0);
        getClient().dispatch();
    }
    
    void
    TTCNode::sendBGo(uint32_t aCode) const {
        getNode("csr.ctrl.b_send").write(aCode);
        getClient().dispatch();
    }
    
    void
    TTCNode::sendBTest() const {
        this->sendBGo( mBTestCode );
    }
    
    void
    TTCNode::captureData( double wait ) const {
        log(Notice(), "Capturing (", wait, " sec)");
        getNode("csr.ctrl.buf_go").write(1);
        getClient().dispatch();
        // wait a while. capture is only triggered at begin of orbit
        millisleep(wait * 1000);
        getNode("csr.ctrl.buf_go").write(0);
        getClient().dispatch();
        log(Notice(), "Capture completed");
    }

    std::vector<uint64_t>
    TTCNode::captureBGOs( bool aMaskBC0, double aWaitSec ) const {
        // Resets the TTC history buffer and dumps the TTC commands collected over hte last X seconds
        log(Notice(), "Capturing BGOs (", aWaitSec, " sec)");
        getNode("csr.ctrl.mask_hist_bc0").write(aMaskBC0);
        // flush the fifo
        getNode("hist").readBlock(0x1000);
        //    getClient().dispatch();
        // trigger capture
        getNode("csr.ctrl.fill_hist_buf").write(0x1);
        getNode("csr.ctrl.fill_hist_buf").write(0x0);
        getClient().dispatch();
        millisleep(aWaitSec * 1000);
        log(Notice(), "Capture completed");
        uhal::ValVector<uint32_t> fifoBlock = getNode("hist").readBlock(0x2000);
        getClient().dispatch();
        size_t depth = 0x2000;
        vector<uint64_t> history;
        history.reserve(depth);

        // Each entry is made of 2 words
        for( uint32_t i(0); i < fifoBlock.size(); i += 2 ) {
            uint64_t h = (( uint64_t ) fifoBlock[i + 1] << 32) + ( uint64_t ) fifoBlock[i];
            // Decoded values
            bool valid = (h >> 31) & 1;

            if( !valid ) {
                break;
            }

            history.push_back(h);
        }

        return history;

        for( uint32_t i(0); i < depth; ++i ) {
            ValWord<uint32_t> v1 = getNode("hist").read();
            ValWord<uint32_t> v2 = getNode("hist").read();
            getClient().dispatch();
            uint64_t h = (( uint64_t ) v2 << 32) + v1;
            // Decoded values
            bool valid = (h >> 31) & 1;
            //      bool isL1A = (h >> 24) & 1;
            //      uint32_t orbit = (h >> 32) & 0xffffff;
            //      uint32_t bx = (h >> 8) & 0xfff;
            //      uint32_t cmd = (h & 0xff);
            //    ostringstream oss;
            //    oss << setw(4) << i << '|'
            //      << " V: "   << (int) valid
            //      << " L1A: " << (int) isL1A
            //      << " orb: " << uintHexStr(orbit, 6)
            //      << " bx: "  << uintHexStr(bx, 3)
            //      << " cmd: " << uintHexStr(cmd, 2);

            if( !valid ) {
                break;
            }

            //      history.push_back(
            //              strprintf("%4d | V:%1d L1A:%1d orb:0x%06x bx:0x%03x cmd:%02x", i, valid, isL1A, orbit, bx, cmd)
            //              );
            history.push_back(h);
        }

        return history;
    }

    void
    TTCNode::waitBC0Lock( ) const {
        uhal::ValWord< uint32_t > bc0_lock(0);
        int countdown = 100;

        while( countdown > 0 ) {
            bc0_lock = this->getNode("csr.stat0.bc0_lock").read();
            this->getClient().dispatch();

            if( bc0_lock ) {
                break;
            }

            //countdown = -100;
            //else
            //countdown -= 1;
            countdown--;
            millisleep(10);
        }

        if( countdown == 0 ) {
            exception::BC0LockFailed lExc;
            log(lExc, "Timed out waiting for bc0_lock signal");
            throw lExc;
        }

        log(Notice(), "TTC BC0 Locked");
    }

    //    f = board.getNode("csr.freq.freq.count").read()
    //    fv = board.getNode("csr.freq.freq.valid").read()
    //    board.dispatch()
    //    print "  Status:", hex(v), "BC0 stat:", hex(int(s0) >> 16), "Bunch", hex(int(s0) & 0xfff), "Evt:", hex(int(s1) & 0xffffff), "Orb:", hex(int(s2) & 0xffffff)
    //    print "  Serr:", hex(int(s3) & 0xffff), "Derr:", hex(int(s3) >> 16)
    //    print "  Freq:", int(f) * 119.20928 / 1000000, "Valid:", int(fv)

    double
    TTCNode::freqClk40( double aWait ) const {

        getNode("freq.chan_sel").write(Clock40);
        getClient().dispatch();
        millisleep(aWait * 1000);
        uhal::ValWord<uint32_t> f40 = getNode("freq.freq.count").read();
        uhal::ValWord<uint32_t> fv = getNode("freq.freq.valid").read();
        getClient().dispatch();

        if( fv == 0 ) {
            exception::TTCFrequencyInvalid lExc;
            log(lExc,"TTC Frequency Measurement not valid");
            throw lExc;
        }

        return int ( f40 ) * 119.20928 / 1000000;
    }

    //double
    //mp7::TTCNode::freqClk240() const {
    //  uhal::ValWord<uint32_t> f240 = getNode("freq.clk40_freq").read();
    //  getClient().dispatch();
    //
    //  return 31.25 * (int(f240) / 65536.0);
    ////  "Freq 40/240:", 31.25 * (int(f40) / 65536.0), 31.25 * (int(f240) / 65536.0)
    //
    //}

}

