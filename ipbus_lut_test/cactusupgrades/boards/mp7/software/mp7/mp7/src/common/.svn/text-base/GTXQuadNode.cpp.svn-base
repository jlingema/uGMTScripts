#include "mp7/GTXQuadNode.hpp"

// uHAL Headers
#include "uhal/ValMem.hpp"
#include "uhal/log/log.hpp"

// MP7 Headers
#include "mp7/helpers.hpp"

// Boost Headers
#include <boost/assign/std/vector.hpp> // for 'operator+=()'

// Namespace resolution
using namespace std;
using namespace uhal;
using namespace boost::assign;

namespace mp7 {
    UHAL_REGISTER_DERIVED_NODE( GTXQuadNode );

    // PUBLIC METHODS

    GTXQuadNode::GTXQuadNode( const uhal::Node& node ) :
    uhal::Node( node ) {
    }

    GTXQuadNode::~GTXQuadNode( ) {
    }

    void
    GTXQuadNode::softReset( ) const {
        getNode("rw_regs.common.control.soft_reset").write(1);
        getClient().dispatch();
        millisleep(100);
        getNode("rw_regs.common.control.soft_reset").write(0);
        getClient().dispatch();
        log(Notice(), "GTX Quad soft rest completed");
    }

    void
    GTXQuadNode::resetFSMs( ) const {
        // get the list of nodes for TX and RX fsm reset
        vector< string > rx_rst = getNodes("rw_regs.ch(0|1|2|3).control.rx.fsm_reset");
        vector< string > tx_rst = getNodes("rw_regs.ch(0|1|2|3).control.tx.fsm_reset");

        // Hold the TX resets
        for( vector<string>::iterator it = tx_rst.begin(); it != tx_rst.end(); ++it ) {
            getNode(*it).write(1);
        }

        // Hold the RX resets
        for( vector<string>::iterator it = rx_rst.begin(); it != rx_rst.end(); ++it ) {
            getNode(*it).write(1);
        }

        getClient().dispatch();
        millisleep(1);

        // Release the TX resets and sleep 1ms
        for( vector<string>::iterator it = tx_rst.begin(); it != tx_rst.end(); ++it ) {
            getNode(*it).write(0);
        }

        getClient().dispatch();
        millisleep(100);

        // Release the RX resets and sleep 1ms
        for( vector<string>::iterator it = rx_rst.begin(); it != rx_rst.end(); ++it ) {
            getNode(*it).write(0);
        }

        getClient().dispatch();
        millisleep(2000);
        log(Notice(), "Channel FSM reset completed");
    }

    void
    GTXQuadNode::configure( uint32_t Loop0, uint32_t Loop1, uint32_t Loop2, uint32_t Loop3 ) const {
        // Configure the MP7 Links
        // Crude implementation, it's actually taken from the configAndTestLinks method.
        // Can certainly be improved
        // Possible values
        // 0 no loopback
        // 2 internal loopback
        log(Notice(), "GTX channel loopbaks set to ", Integer(Loop0), ", ", Integer(Loop1), ", ", Integer(Loop2), ", ", Integer(Loop3));
        getNode("rw_regs.ch0.control.loopback").write(Loop0);
        getNode("rw_regs.ch1.control.loopback").write(Loop1);
        getNode("rw_regs.ch2.control.loopback").write(Loop2);
        getNode("rw_regs.ch3.control.loopback").write(Loop3);
        getClient().dispatch();
        softReset();
        resetFSMs();
    }

    void
    GTXQuadNode::alignOnce( ) const {
        // Dave's
        std::string base_ro_path = "ro_regs";
        std::string base_rw_path = "rw_regs";
        vector<string> nodes_ro = getNodes("ro_regs.ch(0|1|2|3)");
        vector<string> nodes_rw = getNodes("rw_regs.ch(0|1|2|3)");
        std::vector<const uhal::Node*> chs_ro;

        for( vector<string>::iterator it = nodes_ro.begin(); it != nodes_ro.end(); ++it ) {
            chs_ro.push_back(&getNode(*it));
        }

        std::vector<const uhal::Node*> chs_rw;

        for( vector<string>::iterator it = nodes_rw.begin(); it != nodes_rw.end(); ++it ) {
            chs_rw.push_back(&getNode(*it));
        }

        //  millisleep(10);
        // Create the iterators
        std::vector<const uhal::Node*>::const_iterator it_ro, b_ro = chs_ro.begin(), e_ro = chs_ro.end();
        std::vector<const uhal::Node*>::const_iterator it_rw, b_rw = chs_rw.begin(), e_rw = chs_rw.end();
        // Debug routines starting here
        ValWord< uint32_t > lTemp;
        //bool error = false;
        log(Notice(), "Clearing and aligning all the channels");

        for( it_rw = b_rw; it_rw != e_rw; ++it_rw ) {
            const uhal::Node* chX_rw = *it_rw;
            chX_rw->getNode("control.sync_lost_clear").write(1);
            chX_rw->getNode("control.sync_lost_clear").write(0);
            chX_rw->getNode("control.orbit_location_req").write(0x30);
            //Don't use 1.  You will not get a sensible RxClkOut
            chX_rw->getNode("control.align_once").write(0);
            getClient().dispatch();
            chX_rw->getNode("control.align_once").write(1);
            getClient().dispatch();
            chX_rw->getNode("control.align_once").write(0);
            getClient().dispatch();
        }

        log(Notice(), "Align once issued");
        millisleep(50);
        log(Notice(), "Sleeping 50 msec");
        log(Notice(), "Resetting counters");

        for( it_rw = b_rw; it_rw != e_rw; ++it_rw ) {
            const uhal::Node* chX_rw = *it_rw;
            chX_rw->getNode("control.reset_crc_counters").write(1);
            chX_rw->getNode("control.reset_crc_counters").write(0);
            chX_rw->getNode("control.sync_lost_clear").write(0);
            chX_rw->getNode("control.sync_lost_clear").write(1);
            getClient().dispatch();
        }

        millisleep(1);
    }

    bool
    GTXQuadNode::check( ) const {
        // Dave's
        std::string base_ro_path = "ro_regs";
        std::string base_rw_path = "rw_regs";
        // Common nodes
        const uhal::Node* cmm_ro = &getNode(base_ro_path + ".common");
        // Channel 0 nodes
        const uhal::Node* ch0_ro = &getNode(base_ro_path + ".ch0");
        const uhal::Node* ch0_rw = &getNode(base_rw_path + ".ch0");
        // Channel 1 nodes
        const uhal::Node* ch1_ro = &getNode(base_ro_path + ".ch1");
        const uhal::Node* ch1_rw = &getNode(base_rw_path + ".ch1");
        // Channel 2 nodes
        const uhal::Node* ch2_ro = &getNode(base_ro_path + ".ch2");
        const uhal::Node* ch2_rw = &getNode(base_rw_path + ".ch2");
        // Channel 3 nodes
        const uhal::Node* ch3_ro = &getNode(base_ro_path + ".ch3");
        const uhal::Node* ch3_rw = &getNode(base_rw_path + ".ch3");
        // Create the containers to loop over the channels
        std::vector<const uhal::Node*> chs_ro;
        chs_ro += ch0_ro, ch1_ro, ch2_ro, ch3_ro;
        std::vector<const uhal::Node*> chs_rw;
        chs_rw += ch0_rw, ch1_rw, ch2_rw, ch3_rw;
        // Create the iterators
        std::vector<const uhal::Node*>::const_iterator it_ro, b_ro = chs_ro.begin(), e_ro = chs_ro.end();
        std::vector<const uhal::Node*>::const_iterator it_rw, b_rw = chs_rw.begin(), e_rw = chs_rw.end();
        uhal::ValWord< uint32_t > lTemp;
        bool error = false;
        //  lTemp = cmm_ro->getNode("refclkrate").read();
        //  getClient().dispatch();
        //  if (floor((lTemp.value() + 10000) / 1000000) != 160) {
        //    error = true;
        //    log( Notice(), "refclkrate (MHz) = ", Real( lTemp / 1000000.0 ) );
        //  }
        //  lTemp = cmm_ro->getNode("drpclkrate").read();
        //  getClient().dispatch();
        //  if (floor((lTemp.value() + 10000) / 1000000) != 31) {
        //    error = true;
        //    log( Warning(),  "drpclkrate (MHz) = ", Real( lTemp / 1000000.0 ) );
        //  }
        lTemp = cmm_ro->getNode("status.qplllock").read();
        getClient().dispatch();

        if( lTemp.value() != 1 ) {
            error = true;
            log(Warning(), "qplllock = ", Integer(lTemp.value(), IntFmt< uhal::hex >()));
        }

        log(Notice(), "Testing all channels");

        for( it_ro = b_ro; it_ro != e_ro; ++it_ro ) {
            const uhal::Node* chX_ro = *it_ro;
            string chid = "[" + chX_ro->getId() + "]";
            //    lTemp = chX_ro->getNode("txusrclkrate").read();
            //    getClient().dispatch();
            //    log( Notice(), chid , " txusrclkrate (MHz) = ", Real ( lTemp.value() / 1000000.0 ) ) ;
            //    if (floor((lTemp.value() + 10000) / 1000000) != 160) {
            //      error = true;
            //      log( Warning(), chid , " txusrclkrate (MHz) = ", Real ( lTemp.value() / 1000000.0 ) ) ;
            //    }
            //
            //    lTemp = chX_ro->getNode("rxusrclkrate").read();
            //    getClient().dispatch();
            //    log( Notice(), chid , " rxusrclkrate (MHz) = ", Real ( lTemp.value() / 1000000.0 ) );
            //    if (floor((lTemp.value() + 10000) / 1000000) != 160) {
            //      error = true;
            //      log( Warning(), chid , " rxusrclkrate (MHz) = ", Real ( lTemp.value() / 1000000.0 ) );
            //    }
            lTemp = chX_ro->getNode("tx_crc_checked_cnt").read();
            getClient().dispatch();

            if( lTemp.value() == 0 ) {
                error = true;
                log(Warning(), chid, " tx_crc_checked_cnt = ", Integer(lTemp.value(), IntFmt< uhal::hex >()));
            }

            lTemp = chX_ro->getNode("tx_crc_error_cnt").read();
            getClient().dispatch();

            if( lTemp.value() != 0 ) {
                error = true;
                log(Warning(), chid, " tx_crc_error_cnt = ", Integer(lTemp.value(), IntFmt< uhal::hex >()));
            }

            lTemp = chX_ro->getNode("crc_checked_cnt").read();
            getClient().dispatch();
            log(Notice(), chid, " crc_checked_cnt = ", Integer(lTemp.value(), IntFmt< uhal::hex >()));

            if( lTemp.value() == 0 ) {
                error = true;
                log(Warning(), "crc_checked_cnt = ", Integer(lTemp.value(), IntFmt< uhal::hex >()));
            }

            lTemp = chX_ro->getNode("crc_error_cnt").read();
            getClient().dispatch();
            log(Notice(), chid, " crc_error_cnt = ", Integer(lTemp.value(), IntFmt< uhal::hex >()));

            if( lTemp.value() != 0 )
                //if (lTemp.value() > 1)
            {
                error = true;
                millisleep(10);
                lTemp = chX_ro->getNode("crc_checked_cnt").read();
                getClient().dispatch();
                log(Warning(), chid, " crc_checked_cnt = ", Integer(lTemp.value(), IntFmt< uhal::hex >()));
                lTemp = chX_ro->getNode("crc_error_cnt").read();
                getClient().dispatch();
                log(Warning(), chid, " crc_error_cnt = ", Integer(lTemp.value(), IntFmt< uhal::hex >()));
            }

            lTemp = chX_ro->getNode("status.txusrrst").read();
            getClient().dispatch();

            if( lTemp.value() == 1 ) {
                error = true;
                log(Warning(), chid, " txusrrst = ", Integer(lTemp.value(), IntFmt< uhal::hex >()));
            }

            lTemp = chX_ro->getNode("status.rxusrrst").read();
            getClient().dispatch();

            if( lTemp.value() == 1 ) {
                error = true;
                log(Warning(), chid, " rxusrrst = ", Integer(lTemp.value(), IntFmt< uhal::hex >()));
            }

            lTemp = chX_ro->getNode("status.sync_lost_latch").read();
            getClient().dispatch();

            if( lTemp.value() == 1 ) {
                error = true;
                log(Warning(), chid, " sync_lost_latch = ", Integer(lTemp.value(), IntFmt< uhal::hex >()));
            }

            lTemp = chX_ro->getNode("orbit_lock_range.orbit_location_max").read();
            getClient().dispatch();
            log(Notice(), chid, " orbit_location_max = ", Integer(lTemp.value(), IntFmt< uhal::hex >()));
            lTemp = chX_ro->getNode("orbit_lock_range.orbit_location_min").read();
            getClient().dispatch();
            log(Notice(), chid, " orbit_location_min = ", Integer(lTemp.value(), IntFmt< uhal::hex >()));
            lTemp = chX_ro->getNode("status.align_operating").read();
            getClient().dispatch();

            if( lTemp.value() == 0 ) {
                error = true;
                log(Warning(), chid, " align_operating = ", Integer(lTemp.value(), IntFmt< uhal::hex >()));
            }

            lTemp = chX_ro->getNode("align_checks").read();
            getClient().dispatch();

            if( lTemp.value() == 0 ) {
                error = true;
                log(Warning(), chid, " align_checks = ", Integer(lTemp.value(), IntFmt< uhal::hex >()));
            }

            lTemp = chX_ro->getNode("status.align_ok").read();
            getClient().dispatch();

            if( lTemp.value() == 0 ) {
                error = true;
                log(Warning(), chid, " align_ok = ", Integer(lTemp.value(), IntFmt< uhal::hex >()));
            }

            lTemp = chX_ro->getNode("status.align_error_byte").read();
            getClient().dispatch();

            if( lTemp.value() == 1 ) {
                error = true;
                log(Warning(), chid, " align_error_byte = ", Integer(lTemp.value(), IntFmt< uhal::hex >()));
            }

            lTemp = chX_ro->getNode("status.align_error_no_valid_fifoout_location").read();
            getClient().dispatch();

            if( lTemp.value() == 1 ) {
                error = true;
                log(Warning(), chid, " align_error_no_valid_fifoout_location = ", Integer(lTemp.value(), IntFmt< uhal::hex >()));
            }

            lTemp = chX_ro->getNode("status.align_error_tag_not_at_orbit_location").read();
            getClient().dispatch();

            if( lTemp.value() == 1 ) {
                error = true;
                //log ( Warning() , "[",chX_ro->getId(),"] " ,  "align_error_tag_not_at_orbit_location = " ,  Integer ( lTemp.value(), IntFmt< uhal::hex >() ) );
                log(Warning(), chid, " align_error_tag_not_at_orbit_location = ", Integer(lTemp.value(), IntFmt< uhal::hex >()));
            }

            lTemp = chX_ro->getNode("status.align_error_tag_at_wrong_orbit_location").read();
            getClient().dispatch();

            if( lTemp.value() == 1 ) {
                error = true;
                //log ( Warning() , "[",chX_ro->getId(),"] " ,  "align_error_tag_at_wrong_orbit_location = " ,  Integer ( lTemp.value(), IntFmt< uhal::hex >() ) );
                log(Warning(), chid, " align_error_tag_at_wrong_orbit_location = ", Integer(lTemp.value(), IntFmt< uhal::hex >()));
            }
        }

        return error;
    }

}
