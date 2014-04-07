#ifndef _mp7_SI5236_hpp_
#define	_mp7_SI5236_hpp_

#include "mp7/OpenCoresI2C.hpp"

namespace mp7 {
    /*!
     * @class SI5326Node
     * @brief
     * @author Alessandro Thea
     * @date August 2013
     */

    class SI5326Node : public OpenCoresI2C {
        UHAL_DERIVEDNODE( SI5326Node );
    public:
        SI5326Node( const uhal::Node& aNode );
        virtual ~SI5326Node( );

        void configure( const std::string& aFilename ) const;
        void reset( ) const;
        void intcalib( ) const;
        void sleep( const bool& s ) const;
        void debug( ) const;

        std::map<uint32_t, uint32_t> registers( ) const;
    private:

        static const uint8_t m_slaveAddress;

    };
}

#endif	/* _mp7_SI5236_hpp_ */


