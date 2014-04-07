#ifndef _mp7_MP7690Driver_hpp_
#define	_mp7_MP7690Driver_hpp_


// MP7 Headers
#include "uhal/HwInterface.hpp"



#include "mp7/CtrlNode.hpp"
#include "mp7/TTCNode.hpp"
#include "mp7/XpointNode.hpp"
#include "mp7/SI5326Node.hpp"
#include "mp7/GTHQuadNode.hpp"
#include "mp7/MGTBufferNode.hpp"
#include "mp7/MGTAlignmentNode.hpp"

namespace mp7 {
    /*!
     * @class MP7690Driver
     * @brief High level access class for MP7s
     *
     * @author Alessandro Thea
     * @date January 2014
     */

    class MP7690Driver {
    public:
        MP7690Driver( const uhal::HwInterface& );
        virtual ~MP7690Driver( );

        void reset( bool aExtClk40Src ) const;

        void enableTTC( bool aEnable );
        void generateBC0s( bool aGenerate );


    private:

        uhal::HwInterface mBoard;
        CtrlNode mCsr;
        TTCNode mTtc;
        XpointNode mXpoint;
        SI5326Node mSi5326;
        GTHQuadNode mGth;
        MGTBufferNode mBuf;
        MGTAlignmentNode mAlign;

    };

}

#endif	/* _mp7_MP7690Driver_hpp_ */


