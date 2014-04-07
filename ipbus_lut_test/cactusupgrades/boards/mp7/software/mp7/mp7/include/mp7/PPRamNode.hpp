#ifndef _mp7_PPRamNode_hpp_
#define	_mp7_PPRamNode_hpp_

// MP7 Headers
#include "uhal/DerivedNode.hpp"

namespace mp7 {
    /*!@class PPRamNode
     * @brief Specialised node to control the channel alignment mechanism
     * 
     * To fill
     * 
     * @author Alessandro Thea
     * @date  2013
     */

    class PPRamNode : public uhal::Node {
        UHAL_DERIVEDNODE( PPRamNode )
    public:
        PPRamNode( const uhal::Node& aNode );
        virtual ~PPRamNode( );

        ///
        void upload( const std::vector<uint32_t>& frames, uint32_t offset ); //FIXME

        std::vector<uint32_t> dumpRAM( uint32_t id, uint32_t depth ) const {
            return readRAM(id, depth);
        }

        /// upload frames with datavalid flag (0:32 data, 33, datavalid)
        void upload64( const std::vector<uint64_t>& frames, uint32_t offset ); //FIXME

    protected:
        /// write the payload into one of the rams
        void writePayload64( uint32_t id, const std::vector<uint64_t>& data ) const; // FIXME

        ///
        void writePayload( uint32_t id, const std::vector<uint32_t>& data, uint32_t vfirst, uint32_t vlast ) const; // FIXME

        ///
        void writeRAM( uint32_t id, const std::vector<uint32_t>& data ) const;

        ///
        std::vector<uint32_t> readRAM( uint32_t id, uint32_t depth ) const;

    private:
        static const size_t m_depth;
    };
}

#endif /* _mp7_PPRamNode_hpp_ */

