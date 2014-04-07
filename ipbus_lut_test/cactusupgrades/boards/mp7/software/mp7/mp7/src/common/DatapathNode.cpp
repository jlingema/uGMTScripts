#include "mp7/DatapathNode.hpp"

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
 * Selectable from the main ctrl register
 *  * quad
 *  * channel
 *  * rx/tx buffer
 * 
 *  datapath.csr registers
 *    mode: defines the behavior of the buffer
 *      0 = latency buffer, 1 = capture, 2 = playback, 3 = repeating playback
 *    datasrc: controls the data switch (where the data are coming from)
 *      0 = normal data, 1 = playback, 2 = pattern, 3 = zeroes
 *    daq_bank: what daq bank 
 *    trig_bx: This is the BX number *before* you want to start capturing / playing 
 *      data. i.e. to send from bx0 onwards, set this to 0xdeb (i.e. one less than
 *      the bunch length).
 *    max_word: This is the last location in the buffer to use, i.e. to send 16 words,
 *       set this to 0xf. Note that this is in 240MHz samples, not BX - multiply 
 *       BX by six as the TMT is currently configured.
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
    UHAL_REGISTER_DERIVED_NODE( DatapathNode );

    // PUBLIC METHODS
    DatapathNode::DatapathNode( const uhal::Node& aNode ) :
    uhal::Node( aNode ),
    mBufferSize( aNode.getNode("buffers.data").getSize()/2 ) {
    }

    DatapathNode::~DatapathNode( ) {
    }


    void
    DatapathNode::waitCaptureDone( ) const {
        uhal::ValWord< uint32_t > cap_done(0);
        int countdown = 100;

        while( countdown > 0 ) {
            cap_done = this->getNode("csr.stat.cap_done").read();
            this->getClient().dispatch();

            if( cap_done.value() ) break;

            millisleep(1);
            countdown--;

        }

        if( countdown == 0 ) {
            throw runtime_error("timed out waiting for buffer capture done signal");
        }

        log(Notice(), "Capture completed");
    }

    void
    DatapathNode::configure( BufMode aMode, DataSrc aDataSrc ) const {
        // Set the buffer mode
        getNode("csr.mode.mode").write(aMode);
        // Set the datasrc
        getNode("csr.mode.datasrc").write(aDataSrc);

        // Memento for the future
        // getNode("csr.mode.daq_bank").write(0x1);
        getClient().dispatch();
    }

    void
    DatapathNode::setRange( uint32_t trig_bx, uint32_t max_word ) const {
        // Cant
        max_word = std::min(max_word,(uint32_t)mBufferSize);
        getNode("csr.mode.trig_bx").write(trig_bx);
        getNode("csr.mode.max_word").write(max_word);
        getClient().dispatch();
    }

    void
    DatapathNode::writeRaw( std::vector<uint32_t> aRawData ) const {
        // set the write pointer to 0
        getNode("buffers.addr").write(0x0);
        // Upload data into the buffer
        getNode("buffers.data").writeBlock(aRawData);
    }

    std::vector<uint32_t>
    DatapathNode::readRaw( uint32_t aSize ) const {
        // Set the port pointer to 0
        getNode("buffers.addr").write(0x0);
        // Block read from the data register
        uhal::ValVector< uint32_t > valid_data = getNode("buffers.data").readBlock(aSize);
        getClient().dispatch();
        return valid_data.value();
    }

    void
    DatapathNode::clear() const {
        vector<uint32_t> zeroes(mBufferSize * 2, 0x0);
        writeRaw(zeroes);
    }

    void
    DatapathNode::upload( std::vector<uint32_t> data ) const {
        size_t size = std::min(mBufferSize, data.size());
        // Prepare the data to write to the port ram
        vector<uint32_t> valid_data(size * 2);

        for( size_t i(0); i < size; ++i ) {
            // Even address: 16 LSB bits
            valid_data[2 * i] = data[i] & 0xffff;
            // Odd address: 1 valid + 16 MSB
            valid_data[2 * i + 1] = (data[i] >> 16) | (0x1 << 16);
        }

        writeRaw(valid_data);
    }

    std::vector<uint32_t>
    DatapathNode::download( size_t aSize ) const {
        // Don't read more than the real depth
        uint32_t size = std::min(aSize, mBufferSize);
        vector<uint32_t> valid_data = readRaw( size * 2);
        vector<uint32_t> data(size);

        for( size_t i(0); i < data.size(); ++i ) {
            data[i] = valid_data[2 * i];
            // drop the valid bit and shift by 16
            data[i] += (valid_data[2 * i + 1] & 0xffff) << 16;
        }

        return data;
    }

    void
    DatapathNode::uploadValid( std::vector<uint64_t> aData ) const {
        size_t size = std::min(mBufferSize, aData.size());
        // Prepare the data to write to the port ram
        vector<uint32_t> valid_data(size * 2);

        for( size_t i(0); i < size; ++i ) {
            // Even address: 16 LSB bits
            valid_data[2 * i] = aData[i] & 0xffff;
            // Odd address: 1 valid + 16 MSB.
            valid_data[2 * i + 1] = (aData[i] >> 16) & 0x1ffff;
        }

        writeRaw(valid_data);
    }

    std::vector<uint64_t>
    DatapathNode::downloadValid( size_t aSize ) const {
        // Don't read more than the real depth
        uint32_t size = std::min(aSize, mBufferSize);
        vector<uint32_t> valid_data = readRaw(size * 2);
        vector<uint64_t> data(size);

        for( size_t i(0); i < data.size(); ++i ) {
            data[i] = valid_data[2 * i];
            // cast to 64bits and shift by 16
            data[i] += (( uint64_t ) valid_data[2 * i + 1]) << 16;
        }

        return data;
    }


}
