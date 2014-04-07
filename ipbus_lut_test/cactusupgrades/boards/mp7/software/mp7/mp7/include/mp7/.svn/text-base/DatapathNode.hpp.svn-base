#ifndef _mp7_DatapathNode_hpp_
#define	_mp7_DatapathNode_hpp_

// MP7 Headers
#include "uhal/DerivedNode.hpp"

namespace mp7 {
    /*!
     * @class DatapathNode
     * @brief Class to control the transciever buffer interface
     *
     * buffer mode: 0: latency buf; 1: capture; 2: play once; 3: play repeat
     * data source: 0: input data; 1: buffer playback; 2: pattern gen; 3: zeroes
     *
     * Data source: 
     * @author Alessandro Thea
     * @date 2013
     */


    class DatapathNode : public uhal::Node {
        UHAL_DERIVEDNODE( DatapathNode );
    public:
        // PUBLIC ENUMS
        enum BufMode {
            Latency  = 0, // Latency buffer
            Capture  = 1, // Capture buffer
            PlayOnce = 2, // Playback
            PlayLoop = 3  // Repeating playback
        };

        enum DataSrc {
            Input   = 0, // input data
            Buffer  = 1, // buffer playback
            Pattern = 2, // Hard-coded pattern
            Zeroes  = 3  // 
        };

        // PUBLIC METHODS
        DatapathNode( const uhal::Node& aNode );
        virtual ~DatapathNode( );

        /// size of the buffer block
        uint32_t getBufferSize() const { return mBufferSize; }
        
        /// wait for the buffer capture to be completed
        void waitCaptureDone( ) const;

        /// Configure buffer mode and data source
        void configure( BufMode aMode, DataSrc aDataSrc ) const;

        void setRange( uint32_t trig_bx, uint32_t words ) const;

        /// Clear the buffer block. Fills it with zeroes
        void clear() const;

        /// Uploads data into the buffer up to the buffer maximum size
        void upload( std::vector<uint32_t> aData ) const;
        std::vector<uint32_t> download( size_t aSize ) const;

        void uploadValid( std::vector<uint64_t> aData ) const;
        std::vector<uint64_t> downloadValid( size_t aSize ) const;

        /// Raw buffer access
        std::vector<uint32_t> readRaw( uint32_t aSize ) const;
        void writeRaw( std::vector<uint32_t> aRawData ) const;



    private:
        const size_t mBufferSize;
    };

}

#endif	/* _mp7_DatapathNode_hpp_ */


