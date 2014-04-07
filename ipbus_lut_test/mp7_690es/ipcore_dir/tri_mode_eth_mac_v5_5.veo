/*******************************************************************************
*     This file is owned and controlled by Xilinx and must be used solely      *
*     for design, simulation, implementation and creation of design files      *
*     limited to Xilinx devices or technologies. Use with non-Xilinx           *
*     devices or technologies is expressly prohibited and immediately          *
*     terminates your license.                                                 *
*                                                                              *
*     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY     *
*     FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY     *
*     PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE              *
*     IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS       *
*     MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY       *
*     CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY        *
*     RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY        *
*     DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE    *
*     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR           *
*     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF          *
*     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A    *
*     PARTICULAR PURPOSE.                                                      *
*                                                                              *
*     Xilinx products are not intended for use in life support appliances,     *
*     devices, or systems.  Use in such applications are expressly             *
*     prohibited.                                                              *
*                                                                              *
*     (c) Copyright 1995-2014 Xilinx, Inc.                                     *
*     All rights reserved.                                                     *
*******************************************************************************/

/*******************************************************************************
*     Generated from core with identifier:                                     *
*     xilinx.com:ip:tri_mode_eth_mac:5.5                                       *
*                                                                              *
*     Rev 1. The TEMAC LogiCORE(TM) is designed to the IEEE 802.3-2008         *
*     standard specification and supports full and half duplex operation at    *
*     10Mbps, 100Mbps and 1Gbps speeds. In addition, it provides support       *
*     for VLAN and JUMBO frames, as well as network management options such    *
*     as statistics gathering and flow control. The core can be configured     *
*     and monitored through an AXI interface, providing users with the         *
*     flexibility to select the processor best suited to their specific        *
*     application.  The standalone core provides either a Gigabit Media        *
*     Independent Interface (GMII) or a Reduced Gigabit Media Independent      *
*     Interface (RGMII), both of which can carry ethernet traffic at all       *
*     three speeds and are suitable for connection to all industry standard    *
*     PHYs of all media types.  In addition, the core seemlessly interfaces    *
*     to the Ethernet 1000BASE-X PCS/PMA or SGMII LogiCORE which can           *
*     provide a Serial-GMII (SGMII) or can alternatively extend the            *
*     functionality of the core to provide a 1000BASE-X PCS/PMA (1Gb/s         *
*     Optical PHY Standard) creating a complete GigE MAC core solution.        *
*******************************************************************************/

// Interfaces:
//    AXI4Stream_MASTER_rx_axis_filter
//        RX filter control
//    AXI4Stream_MASTER_tx_axis_mac
//        TX data output
//    AXI4Stream_MASTER_rx_axis_mac
//        RX data output
//    axi4stream_slave_tx_axis_av
//        AVB AV data input
//    axi4stream_master_rx_axis_ts
//        Rx Timestamp data output
//    axi4stream_master_tx_axis_ts
//        Tx Timestamp data output
//    axi4stream_master_rx_axis_av
//        AVB AV data output

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
tri_mode_eth_mac_v5_5 your_instance_name (
  .glbl_rstn(glbl_rstn), // input glbl_rstn
  .rx_axi_rstn(rx_axi_rstn), // input rx_axi_rstn
  .tx_axi_rstn(tx_axi_rstn), // input tx_axi_rstn
  .rx_axi_clk(rx_axi_clk), // input rx_axi_clk
  .rx_reset_out(rx_reset_out), // output rx_reset_out
  .rx_axis_mac_tdata(rx_axis_mac_tdata), // output [7 : 0] rx_axis_mac_tdata
  .rx_axis_mac_tvalid(rx_axis_mac_tvalid), // output rx_axis_mac_tvalid
  .rx_axis_mac_tlast(rx_axis_mac_tlast), // output rx_axis_mac_tlast
  .rx_axis_mac_tuser(rx_axis_mac_tuser), // output rx_axis_mac_tuser
  .rx_statistics_vector(rx_statistics_vector), // output [27 : 0] rx_statistics_vector
  .rx_statistics_valid(rx_statistics_valid), // output rx_statistics_valid
  .tx_axi_clk(tx_axi_clk), // input tx_axi_clk
  .tx_reset_out(tx_reset_out), // output tx_reset_out
  .tx_axis_mac_tdata(tx_axis_mac_tdata), // input [7 : 0] tx_axis_mac_tdata
  .tx_axis_mac_tvalid(tx_axis_mac_tvalid), // input tx_axis_mac_tvalid
  .tx_axis_mac_tlast(tx_axis_mac_tlast), // input tx_axis_mac_tlast
  .tx_axis_mac_tuser(tx_axis_mac_tuser), // input [0 : 0] tx_axis_mac_tuser
  .tx_axis_mac_tready(tx_axis_mac_tready), // output tx_axis_mac_tready
  .tx_ifg_delay(tx_ifg_delay), // input [7 : 0] tx_ifg_delay
  .tx_statistics_vector(tx_statistics_vector), // output [31 : 0] tx_statistics_vector
  .tx_statistics_valid(tx_statistics_valid), // output tx_statistics_valid
  .pause_req(pause_req), // input pause_req
  .pause_val(pause_val), // input [15 : 0] pause_val
  .speed_is_100(speed_is_100), // output speed_is_100
  .speed_is_10_100(speed_is_10_100), // output speed_is_10_100
  .gmii_txd(gmii_txd), // output [7 : 0] gmii_txd
  .gmii_tx_en(gmii_tx_en), // output gmii_tx_en
  .gmii_tx_er(gmii_tx_er), // output gmii_tx_er
  .gmii_rxd(gmii_rxd), // input [7 : 0] gmii_rxd
  .gmii_rx_dv(gmii_rx_dv), // input gmii_rx_dv
  .gmii_rx_er(gmii_rx_er), // input gmii_rx_er
  .rx_mac_config_vector(rx_mac_config_vector), // input [79 : 0] rx_mac_config_vector
  .tx_mac_config_vector(tx_mac_config_vector) // input [79 : 0] tx_mac_config_vector
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file tri_mode_eth_mac_v5_5.v when simulating
// the core, tri_mode_eth_mac_v5_5. When compiling the wrapper file, be sure to
// reference the XilinxCoreLib Verilog simulation library. For detailed
// instructions, please refer to the "CORE Generator Help".

