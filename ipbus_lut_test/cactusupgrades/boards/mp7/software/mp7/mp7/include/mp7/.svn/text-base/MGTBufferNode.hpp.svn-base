#ifndef _mp7_TransBufferNode2g_hpp_
#define	_mp7_TransBufferNode2g_hpp_

// MP7 Headers
#include "uhal/DerivedNode.hpp"

namespace mp7 {
    /*!
     * @class MGTBufferNode
     * @brief Class to control the transciever buffer interface
     *
     * @author Alessandro Thea
     * @date 2013
     */


    class MGTBufferNode : public uhal::Node {
        UHAL_DERIVEDNODE( MGTBufferNode );
    public:
        // PUBLIC ENUMS

        enum Mode {
            Disabled=0,
            Capure=1,
            Playback=2,
            Pattern=3
        };

        // PUBLIC METHODS
        MGTBufferNode( const uhal::Node& aNode );
        virtual ~MGTBufferNode( );

        uint32_t getDepth() const { return mDepth; }
        
        void waitLock( ) const;
        void waitCaptureDone( ) const;

        /// Set the rx/tx modes
        void configure( uint32_t rxmode, uint32_t txmode ) const;

        /// Configure capture mode
        /// FIXME: Thrash the enable
        void captureRange( uint32_t low, uint32_t high, bool enable=true ) const;

        /// Configure playback mode
        /// FIXME: Thrash the enable
        void playbackRange( uint32_t low, uint32_t high, bool enable=true ) const;

        /// configure the loops
        void internalLoop( bool =true ) const;
        void externalLoop( bool =true ) const;

        /// upload a block of data to the transmitter buffer , all entries assumed valid
        void uploadTx( std::vector<uint32_t> data ) const;
        /// upload a block of data to the receiver buffer , all entries assumed valid
        void uploadRx( std::vector<uint32_t> data ) const;

        /// upload a block of data to the transmitter buffer with valid data information
        void uploadValidTx( std::vector<uint64_t> data ) const;
        /// upload a block of data to the receiver buffer with valid data information
        void uploadValidRx( std::vector<uint64_t> data ) const;

        /// Clear the transmitter buffer
        void clearTx( ) const;
        /// Clear the receiver buffer
        void clearRx( ) const;

        /// Download the content of the transmitter buffer
        std::vector<uint32_t> downloadTx( size_t size ) const;
        /// Download the content of the receiver buffer
        std::vector<uint32_t> downloadRx( size_t size ) const;

        /// Download the content of the transmitter buffer
        std::vector<uint64_t> downloadValidTx( size_t size ) const;
        /// Download the content of the receiver buffer
        std::vector<uint64_t> downloadValidRx( size_t size ) const;

        std::vector<uint32_t> readRawRx( uint32_t size ) const;
        std::vector<uint32_t> readRawTx( uint32_t size ) const;

        void writeRawRx( std::vector<uint32_t> rawdata ) const;
        void writeRawTx( std::vector<uint32_t> rawdata ) const;

    protected:
        // PROTECTED METHODS
        void clear( const std::string& ) const;
        void upload( const std::string&, std::vector<uint32_t> data ) const;
        std::vector<uint32_t> download( const std::string&, size_t depth ) const;

        void uploadValid( const std::string&, std::vector<uint64_t> data ) const;
        std::vector<uint64_t> downloadValid( const std::string&, size_t depth ) const;

        /// Raw buffer access
        std::vector<uint32_t> readRaw( const std::string& name, uint32_t size ) const;
        void writeRaw( const std::string& name, std::vector<uint32_t> rawdata ) const;

    private:
        static const size_t mDepth;
    };

}

#endif	/* _mp7_TransBufferNode2g_hpp_ */


