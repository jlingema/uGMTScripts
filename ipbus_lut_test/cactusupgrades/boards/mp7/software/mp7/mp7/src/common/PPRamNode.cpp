#include "mp7/PPRamNode.hpp"

// uHAL Headers
#include "uhal/log/log.hpp"

// C++ Headers
#include <algorithm>

// Namespace resolution
using namespace uhal;
using namespace std;

namespace mp7 {
    UHAL_REGISTER_DERIVED_NODE( PPRamNode );

    // Static data members initialization
    const size_t PPRamNode::m_depth = 0x200;

    // PUBLIC METHODS

    PPRamNode::PPRamNode( const uhal::Node& aNode ) :
    uhal::Node( aNode ) {
    }

    PPRamNode::~PPRamNode( ) {
    }

    void
    PPRamNode::upload( const std::vector<uint32_t>& frames, uint32_t offset ) {
        /*
         * The RAMs are 1K deep, 1/2 available to the data = 512 data words
         * The bx 0-4 need to be empty
         * Bx 5 contains the header
         * Only full bx must be loaded
         * 512-6*(5+1) = 476 frames
         * which go down to 474 (0x1da) loadable frames
         * Total: 79 bx
         */
        uint8_t nrams = 5;
        // Words per bx
        uint8_t wpbx = 6;
        // Frames per event
        uint8_t fpe = nrams*wpbx;
        // Number of bx filled with 0 at the beginning of the orbit
        // Note: they're added at the beginning of all the rams
        //        uint8_t zsize = zbx;
        // Number of available frames
        //        size_t available = (m_depth/wpbx-zsize)*fpe;
        size_t available = (m_depth - offset) / wpbx*fpe;
        // Only full events will go in
        size_t usable = (frames.size() / fpe) * fpe;
        // The number of frames that can be uploaded is then
        size_t ngoodframes = std::min(available, usable);

        if( frames.size() > ngoodframes ) {
            log(Warning(), "Frames beyond ", Integer(available), " dropped");
        }

        log(Debug(), "Writing ", Integer(ngoodframes), ", ", Integer(ngoodframes / nrams), " per RAM");
        // Prepare the empty arrays
        vector< vector< uint32_t > > rams(nrams);

        for( int iram(0); iram < nrams; ++iram )
            // Initialise the RAMs with 0s
        {
            rams[iram].resize(m_depth, 0x0);
        }

        // Re-arrange the frames as expected in the rams
        // 0:5 ->RAM0
        // ...
        // 26:30 ->RAM5
        // 30:35 ->RAM0

        // Put some sort of header 3 frames earlier. Why? don't know
        for( uint32_t iram(0); iram < nrams; ++iram ) {
            //          rams[iram][zsize*wpbx-3] = 0x55555555;
            //          rams[iram][zsize*wpbx-2] = 0xcccccccc;
            //          rams[iram][zsize*wpbx-1] = 0x33333333;
            rams[iram][offset - 3] = 0x55555555;
            rams[iram][offset - 2] = 0xcccccccc;
            rams[iram][offset - 1] = 0x33333333;
        }

        //        uint32_t offset = zsize*wpbx;
        // fill the rams arrays in one go
        for( uint32_t i(0); i < ngoodframes; ++i ) {
            // bunch crossing
            uint32_t bx = i / fpe;
            // eta index
            uint32_t eta = i % fpe;
            // ram index
            uint32_t iram = eta / wpbx;
            // location index
            uint32_t j = (bx * wpbx) + eta % wpbx + offset;
            rams[iram][j] = frames[i];
        }

        // The range of validity starts at the end of the zeros, ends after ngoodframes
        // Raise data valid earlier than the payload. Why 1? Don't know.
        //        uint32_t valid_first = zsize*wpbx-1 ;
        //        uint32_t valid_last  = zsize*wpbx+ngoodframes/nrams;
        uint32_t valid_first = offset - 1;
        uint32_t valid_last = offset + ngoodframes / nrams;

        // Write the payload the different RAMs
        for( int iram(0); iram < nrams; ++iram ) {
            this->writePayload(iram, rams[iram], valid_first, valid_last);
        }

        log(Notice(), Integer(frames.size()), " frames loaded");
    }

    void
    PPRamNode::writePayload( uint32_t id, const std::vector<uint32_t>& data, uint32_t vfirst, uint32_t vlast ) const {
        vector<uint32_t> ppdata(data.size() *2, 0x0);
        //  cout << "vrange: " << std::dec << vfirst << "," << vlast << endl;

        // apply a frame offset
        for( size_t i(0); i < data.size(); ++i ) {
            ppdata[2 * i] = data[i];
            // Set the data-valid for frames above voffset
            ppdata[2 * i + 1] = ((vfirst <= i && i < vlast) ? 0xff : 0x00);
        }

        this->writeRAM(id, ppdata);
    }

    void
    PPRamNode::upload64( const std::vector<uint64_t>& frames, uint32_t offset ) {
        /*
         * The RAMs are 1K deep, 1/2 available to the data = 512 data words
         * The bx 0-4 need to be empty
         * Bx 5 contains the header
         * Only full bx must be loaded
         * 512-6*(5+1) = 476 frames
         * which go down to 474 (0x1da) loadable frames
         * Total: 79 bx
         */
        uint8_t nrams = 5;
        // Words per bx
        uint8_t wpbx = 6;
        // Frames per event
        uint8_t fpe = nrams*wpbx;
        // Number of available frames
        size_t available = (m_depth - offset) / wpbx*fpe;
        // Only full events will go in
        size_t usable = (frames.size() / fpe) * fpe;
        // The number of frames that can be uploaded is then
        size_t ngoodframes = std::min(available, usable);

        if( frames.size() > ngoodframes ) {
            log(Warning(), "Frames beyond ", Integer(available), " dropped");
        }

        log(Debug(), "Writing ", Integer(ngoodframes), ", ", Integer(ngoodframes / nrams), " per RAM");
        // Prepare the empty arrays
        vector< vector< uint64_t > > rams(nrams);

        for( int iram(0); iram < nrams; ++iram )
            // Initialize the RAMs with 0s
        {
            rams[iram].resize(m_depth, 0x0);
        }

        // Re-arrange the frames as expected in the rams
        // 0:5 ->RAM0
        // ...
        // 26:30 ->RAM5
        // 30:35 ->RAM0

        // Put some sort of header 3 frames earlier. Why? don't know
        for( uint32_t iram(0); iram < nrams; ++iram ) {
            rams[iram][offset - 3] = 0x55555555;
            rams[iram][offset - 2] = 0xcccccccc;
            rams[iram][offset - 1] = 0x33333333;
        }

        // fill the rams arrays in one go
        for( uint32_t i(0); i < ngoodframes; ++i ) {
            // bunch crossing
            uint32_t bx = i / fpe;
            // eta index
            uint32_t eta = i % fpe;
            // ram index
            uint32_t iram = eta / wpbx;
            // location index
            uint32_t j = (bx * wpbx) + eta % wpbx + offset;
            rams[iram][j] = frames[i];
        }

        // Write the payload the different RAMs
        for( int iram(0); iram < nrams; ++iram ) {
            this->writePayload64(iram, rams[iram]);
        }

        log(Notice(), Integer(frames.size()), " frames loaded");
    }

    void
    PPRamNode::writePayload64( uint32_t id, const std::vector<uint64_t>& data ) const {
        vector<uint32_t> ppdata(data.size() *2, 0x0);
        //  cout << "vrange: " << std::dec << vfirst << "," << vlast << endl;

        // apply a frame offset
        for( size_t i(0); i < data.size(); ++i ) {
            // first 32 bits are the data
            ppdata[2 * i] = data[i] & 0xffffffff;
            // 33rd bit is the data valid. Translated into 0xff because Greg says so.
            ppdata[2 * i + 1] = (((data[i] >> 32) & 0x1) ? 0xff : 0x00);
            //    cout << "data[i]: " << std::hex <<  data[i] << "  " << ( (data[i] >> 32) & 0x1 ) << endl;
        }

        this->writeRAM(id, ppdata);
    }

    void
    PPRamNode::writeRAM( uint32_t id, const std::vector<uint32_t>& data ) const {
        // hook to the pp logic
        uint32_t pp_base_addr = getNode("pp").getAddress();
        // offset of the ram to write to
        uint32_t ram_addr = id << 10;
        log(Notice(), "Writing to address: ", Integer(pp_base_addr + ram_addr, IntFmt< uhal::hex >()), " offset: ", Integer(ram_addr, IntFmt< uhal::hex >()));
        // write!
        getClient().writeBlock(pp_base_addr + ram_addr, data);
        getClient().dispatch();
    }

    std::vector<uint32_t>
    PPRamNode::readRAM( uint32_t id, uint32_t depth ) const {
        // hook to the pp logic
        uint32_t pp_base_addr = getNode("pp").getAddress();
        // offset of the ram to write to
        uint32_t ram_addr = id << 10;
        log(Notice(), "Reading from address: ", Integer(pp_base_addr + ram_addr, IntFmt< uhal::hex >()), " offset: ", Integer(ram_addr, IntFmt< uhal::hex >()));
        // read!
        uhal::ValVector<uint32_t> ram_content = getClient().readBlock(pp_base_addr + ram_addr, depth);
        getClient().dispatch();
        return ram_content.value();
    }

}

