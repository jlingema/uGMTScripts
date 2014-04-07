#include "mp7/MGTBufferNode.hpp"

// MP7 Headers
#include "mp7/helpers.hpp"
#include "mp7/exception.hpp"

// uHal Headers
#include "uhal/log/log.hpp"

// C++ Headers
#include <algorithm>

// Boost headers
#include <boost/lexical_cast.hpp>

// Namespace resolution
using namespace std;
using namespace uhal;

/*

 * Notes
 * =====
 *
 * cap  registers: Rx buffer
 * play registers: Tx buffer
 *
 * Capture range
 * buffers.csr.cap_bx.bx_high c00
 * buffers.csr.cap_bx.bx_low 0
 *
 * Playback range
 * buffers.csr.play_bx.bx_high c00
 * buffers.csr.play_bx.bx_low 0
 *
 * TX and RX buffer modes
 *  buffer modes (both rx and tx):
 *  0 disabled
 *  1 capture
 *  2 playback
 *  3 pattern
 * buffers.csr.mode.tx_buf_mode 3
 * buffers.csr.mode.rx_buf_mode 3
 *
 * Capture/Playback range (Rx/Tx) switches
 * buffers.csr.mode.cap_bx_en 0
 * buffers.csr.mode.play_bx_en 1
 *
 * Loopbacks:
 * External
 * buffers.csr.mode.loopback_en 0

 * Internal
 * buffers.csr.mode.rx_datasrc 0
 */

namespace mp7 {
    UHAL_REGISTER_DERIVED_NODE( MGTBufferNode );

    // Static methods
    const size_t MGTBufferNode::mDepth = 0x400; /// 1024 locations

    // PUBLIC METHODS

    MGTBufferNode::MGTBufferNode( const uhal::Node& aNode ) :
    uhal::Node( aNode ) {
//        const boost::unordered_map<string, string> lPars = this->getNode("buffers").getParameters();
//        boost::unordered_map<string, string>::const_iterator par;
//        
//        if( (par = lPars.find("depth")) != lPars.end() ) {
//            mDepth = (boost::lexical_cast< mp7::stoul<uint32_t> > (par->second) & 0x7f);
//        } else {
//            throw runtime_error("Parameter 'depth' not found");
//        }
    }

    MGTBufferNode::~MGTBufferNode( ) {
    }

    void
    MGTBufferNode::waitLock( ) const {
        uhal::ValWord< uint32_t > locked(0);
        int countdown = 100;

        while( countdown > 0 ) {
            locked = this->getNode("csr.stat.locked").read();
            this->getClient().dispatch();

            if( locked.value() ) break;


            millisleep(1);
            countdown--;
        }
        if( countdown == 0 ) {
            exception::BufferLockFailed lExc;
            log(lExc, "Timed out while waiting for buffers to lock (", uhal::Integer(countdown), " ms)");
            throw lExc;
        }
        log(Notice(), "Buffers Locked");
    }

    void
    MGTBufferNode::waitCaptureDone( ) const {
        uhal::ValWord< uint32_t > cap_done(0);
        int countdown = 100;

        while( countdown > 0 ) {
            cap_done = this->getNode("csr.stat.cap_done").read();
            this->getClient().dispatch();

            if( cap_done ) {
                countdown = -100;
            } else {
                countdown -= 1;
            }

            millisleep(1);
        }

        if( countdown == 0 ) {
            throw runtime_error("timed out waiting for buffer capture done signal");
        }

        log(Notice(), "Capture completed");
    }

    void
    MGTBufferNode::configure( uint32_t rxmode, uint32_t txmode ) const {
        // Configure the rx block
        getNode("csr.mode.rx_buf_mode").write(rxmode);
        // Configure the tx block
        getNode("csr.mode.tx_buf_mode").write(txmode);
        getClient().dispatch();
    }

    void
    MGTBufferNode::playbackRange( uint32_t low, uint32_t high, bool enable ) const {
        // Enable the bx playback if low and high are not 0
        //  getNode("csr.mode.play_bx_en").write((low || high) ? 1 : 0);
        getNode("csr.mode.play_bx_en").write(enable);
        getNode("csr.play_bx.bx_low").write(low);
        getNode("csr.play_bx.bx_high").write(high);
        getClient().dispatch();
    }

    void
    MGTBufferNode::captureRange( uint32_t low, uint32_t high, bool enable ) const {
        // Enable the bx playback if low and high are not 0
        getNode("csr.mode.cap_bx_en").write(enable);
        getNode("csr.cap_bx.bx_low").write(low);
        getNode("csr.cap_bx.bx_high").write(high);
        getClient().dispatch();
    }

    void
    MGTBufferNode::internalLoop( bool enable ) const {
        getNode("csr.mode.rx_datasrc").write(enable ? 1 : 0);
        getClient().dispatch();
    }

    void
    MGTBufferNode::externalLoop( bool enable ) const {
        getNode("csr.mode.loopback_en").write(enable ? 1 : 0);
        getClient().dispatch();
    }

    void
    MGTBufferNode::writeRaw( const std::string& name, std::vector<uint32_t> rawdata ) const {
        // set the write pointer to 0
        getNode("buffers." + name + "_addr").write(0x0);
        // Upload zeroes into the buffer
        getNode("buffers." + name + "_data").writeBlock(rawdata);
    }

    std::vector<uint32_t>
    MGTBufferNode::readRaw( const std::string& name, uint32_t size ) const {
        // Set the port pointer to 0
        getNode("buffers." + name + "_addr").write(0x0);
        // Read twice the amount of data
        uhal::ValVector< uint32_t > valid_data = getNode("buffers." + name + "_data").readBlock(size);
        getClient().dispatch();
        return valid_data.value();
    }

    void
    MGTBufferNode::clear( const std::string& name ) const {
        vector<uint32_t> zeroes(mDepth * 2, 0x0);
        writeRaw(name, zeroes);
    }

    void
    MGTBufferNode::upload( const std::string& name, std::vector<uint32_t> data ) const {
        size_t size = std::min(mDepth, data.size());
        // Prepare the data to write to the port ram
        vector<uint32_t> valid_data(size * 2);

        for( size_t i(0); i < size; ++i ) {
            // Even address: 16 LSB bits
            valid_data[2 * i] = data[i] & 0xffff;
            // Odd address: 1 valid + 16 MSB
            valid_data[2 * i + 1] = (data[i] >> 16) | (0x1 << 16);
        }

        writeRaw(name, valid_data);
    }

    std::vector<uint32_t>
    MGTBufferNode::download( const std::string& name, size_t depth ) const {
        // Don't read more than the real depth
        uint32_t size = std::min(depth, mDepth);
        vector<uint32_t> valid_data = readRaw(name, size * 2);
        vector<uint32_t> data(size);

        for( size_t i(0); i < data.size(); ++i ) {
            data[i] = valid_data[2 * i];
            // drop the valid bit and shift by 16
            data[i] += (valid_data[2 * i + 1] & 0xffff) << 16;
        }

        return data;
    }

    void
    MGTBufferNode::uploadValid( const std::string& name, std::vector<uint64_t> data ) const {
        size_t size = std::min(mDepth, data.size());
        // Prepare the data to write to the port ram
        vector<uint32_t> valid_data(size * 2);

        for( size_t i(0); i < size; ++i ) {
            // Even address: 16 LSB bits
            valid_data[2 * i] = data[i] & 0xffff;
            // Odd address: 1 valid + 16 MSB.
            valid_data[2 * i + 1] = (data[i] >> 16) & 0x1ffff;
        }

        writeRaw(name, valid_data);
    }

    std::vector<uint64_t>
    MGTBufferNode::downloadValid( const std::string& name, size_t depth ) const {
        // Don't read more than the real depth
        uint32_t size = std::min(depth, mDepth);
        vector<uint32_t> valid_data = readRaw(name, size * 2);
        vector<uint64_t> data(size);

        for( size_t i(0); i < data.size(); ++i ) {
            data[i] = valid_data[2 * i];
            // cast to 64bits and shift by 16
            data[i] += (( uint64_t ) valid_data[2 * i + 1]) << 16;
        }

        return data;
    }

    // PUBLIC METHODS

    std::vector<uint32_t>
    MGTBufferNode::readRawRx( uint32_t size ) const {
        return this->readRaw("rx", size);
    }

    std::vector<uint32_t>
    MGTBufferNode::readRawTx( uint32_t size ) const {
        return this->readRaw("tx", size);
    }

    void
    MGTBufferNode::writeRawRx( std::vector<uint32_t> rawdata ) const {
        this->writeRaw("rx", rawdata);
    }

    void
    MGTBufferNode::writeRawTx( std::vector<uint32_t> rawdata ) const {
        this->writeRaw("tx", rawdata);
    }

    void
    MGTBufferNode::uploadRx( std::vector<uint32_t> data ) const {
        this->upload("rx", data);
    }

    void
    MGTBufferNode::uploadTx( std::vector<uint32_t> data ) const {
        this->upload("tx", data);
    }

    std::vector<uint32_t>
    MGTBufferNode::downloadRx( size_t size ) const {
        return this->download("rx", size);
    }

    std::vector<uint32_t>
    MGTBufferNode::downloadTx( size_t size ) const {
        return this->download("tx", size);
    }

    void
    MGTBufferNode::clearRx( ) const {
        this->clear("rx");
    }

    void
    MGTBufferNode::clearTx( ) const {
        this->clear("tx");
    }

    void
    MGTBufferNode::uploadValidRx( std::vector<uint64_t> data ) const {
        this->uploadValid("rx", data);
    }

    void
    MGTBufferNode::uploadValidTx( std::vector<uint64_t> data ) const {
        this->uploadValid("tx", data);
    }

    std::vector<uint64_t>
    MGTBufferNode::downloadValidRx( size_t size ) const {
        return this->downloadValid("rx", size);
    }

    std::vector<uint64_t>
    MGTBufferNode::downloadValidTx( size_t size ) const {
        return this->downloadValid("tx", size);
    }

}
