#include "mp7/MGTAlignmentNode.hpp"

// MP7 Headers
#include "mp7/helpers.hpp"

// uHAL Headers
#include "uhal/log/log.hpp"

// Namespace resolution
using namespace std;
using namespace uhal;

namespace mp7 {
    UHAL_REGISTER_DERIVED_NODE( MGTAlignmentNode );

    //PUBLIC METHODS

    MGTAlignmentNode::MGTAlignmentNode( const uhal::Node& aNode ) : uhal::Node( aNode ) {
    }

    MGTAlignmentNode::~MGTAlignmentNode( ) {
    }

    void
    MGTAlignmentNode::align( bool force ) const {
//        getNode("ctrl.margin").write(0x3);
        getNode("ctrl.margin").write(0x3);
        getNode("ctrl.enable").write(0x1);
        getNode("ctrl.enable").write(0x0);
        getClient().dispatch();

        if( force ) {
            millisleep(1000);
            return;
        }

        // check the
        uhal::ValWord< uint32_t > align_ok(0), align_operating(0), stat;
        int countdown = 100;

        while( countdown > 0 ) {
            align_ok = getNode("stat.align_ok").read();
            align_operating = getNode("stat.align_operating").read();
            stat = getNode("stat").read();
            getClient().dispatch();

            if( align_ok && align_operating ) {
                countdown = -100;
            } else {
                countdown -= 1;
            }

            millisleep(100);
            //    cout << std::hex << stat << " | c = " << std::hex << countdown << endl;
        }

        if( countdown == 0 ) {
            log(Error(), "Alignment Failed");
            throw runtime_error("Timed out waiting for alignment to complete. Align Failed!");
        }

        log(Notice(), "Capture completed");
    }

    bool
    MGTAlignmentNode::check( ) const {
        // check the
        uhal::ValWord< uint32_t > align_ok(0), align_operating(0);
        align_ok = getNode("stat.align_ok").read();
        align_operating = getNode("stat.align_operating").read();
        getClient().dispatch();
        log(Notice(), "Capture completed");
        bool error = !(align_ok && align_operating);
        return error;
    }

    void
    MGTAlignmentNode::enable( std::vector<bool> channels ) const {
        // The current version supports 72 channels
        uint32_t disable_ch23_ch00(0x0), disable_ch55_ch24(0x0), disable_ch71_ch56(0x0);
        uint8_t a, b;

        if( channels.size() != 72 ) {
            throw runtime_error("The align channel mask must be of size 72'");
        }

        // 00 to 23
        a = 0;
        b = 24;

        for( size_t i(a); i < b; ++i ) {
            if( channels[i] ) {
                continue;
            }

            disable_ch23_ch00 |= (1 << (i - a));
        }

        // 24 to 55
        a = 24;
        b = 56;

        for( size_t i(a); i < b; ++i ) {
            if( channels[i] ) {
                continue;
            }

            disable_ch55_ch24 |= (1 << (i - a));
        }

        // 72 to 56
        a = 56;
        b = 72;

        for( size_t i(a); i < b; ++i ) {
            if( channels[i] ) {
                continue;
            }

            disable_ch71_ch56 |= (1 << (i - a));
        }

        getNode("ctrl.disable_ch23_ch00").write(disable_ch23_ch00);
        getNode("ctrl_r1.disable_ch55_ch24").write(disable_ch55_ch24);
        getNode("ctrl_r2.disable_ch71_ch56").write(disable_ch71_ch56);
        getClient().dispatch();
        log(Notice(), "disable_ch23_ch00: ", Integer(disable_ch23_ch00, IntFmt< uhal::hex >()));
        log(Notice(), "disable_ch55_ch24: ", Integer(disable_ch55_ch24, IntFmt< uhal::hex >()));
        log(Notice(), "disable_ch71_ch56: ", Integer(disable_ch71_ch56, IntFmt< uhal::hex >()));
    }

}
