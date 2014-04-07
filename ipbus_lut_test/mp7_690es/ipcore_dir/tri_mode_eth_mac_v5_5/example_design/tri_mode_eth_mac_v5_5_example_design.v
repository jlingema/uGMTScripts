//------------------------------------------------------------------------------
// File       : tri_mode_eth_mac_v5_5_example_design.v
// Author     : Xilinx Inc.
// -----------------------------------------------------------------------------
// (c) Copyright 2004-2009 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES. 
// -----------------------------------------------------------------------------
// Description:  This is the Verilog example design for the Tri-Mode
//               Ethernet MAC core. It is intended that this example design
//               can be quickly adapted and downloaded onto an FPGA to provide
//               a real hardware test environment.
//
//               This level:
//
//               * Instantiates the FIFO Block wrapper, containing the
//                 block level wrapper and an RX and TX FIFO with an
//                 AXI-S interface;
//
//               * Instantiates a simple AXI-S example design,
//                 providing an address swap and a simple
//                 loopback function;
//
//               * Instantiates transmitter clocking circuitry
//                   -the User side of the FIFOs are clocked at gtx_clk
//                    at all times
//
//               * Instantiates a state machine which drives the configuration
//                 vector to bring the TEMAC up in the correct state
//
//               * Serializes the Statistics vectors to prevent logic being
//                 optimized out
//
//               * Ties unused inputs off to reduce the number of IO
//
//               Please refer to the Datasheet, Getting Started Guide, and
//               the Tri-Mode Ethernet MAC User Gude for further information.
//
//
//    ---------------------------------------------------------------------
//    | EXAMPLE DESIGN WRAPPER                                            |
//    |           --------------------------------------------------------|
//    |           |FIFO BLOCK WRAPPER                                     |
//    |           |                                                       |
//    |           |                                                       |
//    |           |              -----------------------------------------|
//    |           |              | BLOCK LEVEL WRAPPER                    |
//    | --------  |              |                                        |
//    | |      |  |              |                                        |
//    | | CNFG |--|--------------|---------------                         |
//    | | VEC  |  |              |              |                         |
//    | | SM   |  |              |              |                         |
//    | |      |<-|--------------|----------    |                         |
//    | |      |  |              |         |    |                         |
//    | --------  |              |         |    |                         |
//    |           |              |    ---------------------               |
//    |           |              |    | ETHERNET MAC CORE |               |
//    |           |              |    |                   |               |
//    |           |              |    |                   |               |
//    |           |              |    |                   |               |
//    |           |              |    |                   |               |
//    | --------  |  ----------  |    |                   |               |
//    | |      |  |  |        |  |    |                   |               |
//    | |      |->|->|        |--|--->| Tx            Tx  |-------------->|
//    | |  PAT |  |  |        |  |    | AXI-S         PHY |               |
//    | |  GEN |  |  |        |  |    | I/F           I/F |               |
//    | |(ADDR |  |  |  AXI-S |  |    |                   |               |
//    | | SWAP)|  |  |  FIFO  |  |    |                   |               |
//    | |      |  |  |        |  |    |                   |               |
//    | |      |  |  |        |  |    | Rx            Rx  |               |
//    | |      |  |  |        |  |    | AXI-S         PHY |               |
//    | |      |<-|<-|        |<-|----| I/F           I/F |<--------------|
//    | |      |  |  |        |  |    |                   |               |
//    | --------  |  ----------  |    |                   |               |
//    |           |              |    ---------------------               |
//    |           |              |                                        |
//    |           |              -----------------------------------------|
//    |           --------------------------------------------------------|
//    ---------------------------------------------------------------------
//
//------------------------------------------------------------------------------

`timescale 1 ps/1 ps


//------------------------------------------------------------------------------
// The entity declaration for the example_design level wrapper.
//------------------------------------------------------------------------------

module tri_mode_eth_mac_v5_5_example_design
   (
      // asynchronous reset
      input         glbl_rst,

      // clock from internal phy
      input         gtx_clk,

      output        speedis100,
      output        speedis10100,

      // GMII Interface
      //---------------

      output reg [7:0] gmii_txd,
      output reg    gmii_tx_en,
      output reg    gmii_tx_er,
      input  [7:0]  gmii_rxd,
      input         gmii_rx_dv,
      input         gmii_rx_er,

      // Serialised statistics vectors
      //------------------------------
      output        tx_statistics_s,
      output        rx_statistics_s,

      // Serialised Pause interface controls
      //------------------------------------
      input         pause_req_s,

      // Main example design controls
      //-----------------------------
      input  [1:0]  mac_speed,
      input         update_speed,
      //input         serial_command, // tied to pause_req_s
      input         config_board,
      output        serial_response,
      input         gen_tx_data,
      input         chk_tx_data,
      input         reset_error,
      output        frame_error,
      output        frame_errorn,
      output        activity_flash,
      output        activity_flashn

    );

   //----------------------------------------------------------------------------
   // Parameters used in this top level wrapper.
   //----------------------------------------------------------------------------

   //----------------------------------------------------------------------------
   // internal signals used in this top level wrapper.
   //----------------------------------------------------------------------------

   // example design clocks
   (* KEEP = "TRUE" *)
   wire                 gtx_clk_bufg;
   (* KEEP = "TRUE" *)
   wire                 s_axi_aclk;
   // resets (and reset generation)
   wire                 vector_reset_int;
   reg                  vector_pre_resetn = 0;
   reg                  vector_resetn = 0;
   wire                 chk_reset_int;
   reg                  chk_pre_resetn = 0;
   reg                  chk_resetn = 0;
   wire                 gtx_clk_reset_int;
   reg                  gtx_pre_resetn = 0;
   reg                  gtx_resetn = 0;
   wire                 rx_reset;
   wire                 tx_reset;

   wire                 glbl_rst_intn;

   wire  [7:0]          gmii_txd_int;
   wire                 gmii_tx_en_int;
   wire                 gmii_tx_er_int;
   reg   [7:0]          gmii_rxd_int;
   reg                  gmii_rx_dv_int;
   reg                  gmii_rx_er_int;

   // USER side RX AXI-S interface
   wire                 rx_fifo_clock;
   wire                 rx_fifo_resetn;
   wire  [7:0]          rx_axis_fifo_tdata;
   wire                 rx_axis_fifo_tvalid;
   wire                 rx_axis_fifo_tlast;
   wire                 rx_axis_fifo_tready;

   // USER side TX AXI-S interface
   wire                 tx_fifo_clock;
   wire                 tx_fifo_resetn;
   wire  [7:0]          tx_axis_fifo_tdata;
   wire                 tx_axis_fifo_tvalid;
   wire                 tx_axis_fifo_tlast;
   wire                 tx_axis_fifo_tready;

   // RX Statistics serialisation signals
   (* KEEP = "TRUE" *)
   wire                 rx_statistics_valid;
   reg                  rx_statistics_valid_reg;
   (* KEEP = "TRUE" *)
   wire  [27:0]         rx_statistics_vector;
   reg   [29:0]         rx_stats_shift;

   // TX Statistics serialisation signals
   (* KEEP = "TRUE" *)
   wire                 tx_statistics_valid;
   reg                  tx_statistics_valid_reg;
   (* KEEP = "TRUE" *)
   wire  [31:0]         tx_statistics_vector;
   reg   [33:0]         tx_stats_shift;

   // Pause interface DESerialisation
   reg   [18:0]         pause_shift;
   reg                  pause_req;
   reg   [15:0]         pause_val;

   (* KEEP = "TRUE" *)
   wire  [79:0]         rx_configuration_vector;
   (* KEEP = "TRUE" *)
   wire  [79:0]         tx_configuration_vector;



   // set board defaults - only updated when reprogrammed
   reg                  enable_address_swap = 1;
   reg                  enable_phy_loopback = 0;

   // signal tie offs
   wire  [7:0]          tx_ifg_delay = 0;    // not used in this example

   assign frame_errorn = !frame_error;
   assign activity_flashn = !activity_flash;

   assign serial_response = 0;

  // when the config_board button is pushed capture and hold the
  // state of the gne/chek tx_data inputs.  These values will persist until the
  // board is reprogrammed or config_board is pushed again
  always @(posedge gtx_clk_bufg)
  begin
     if (config_board) begin
        enable_address_swap   <= gen_tx_data;
     end
  end

  always @(posedge s_axi_aclk)
  begin
     if (config_board) begin
        enable_phy_loopback   <= chk_tx_data;
     end
  end


  //----------------------------------------------------------------------------
  // Pipeline the gmii_tx outputs - this is only necessary for the example design
  // and can be removed when connected internally
  //----------------------------------------------------------------------------
  always @(posedge gtx_clk_bufg)
  begin
     gmii_txd        <= gmii_txd_int;
     gmii_tx_en      <= gmii_tx_en_int;
     gmii_tx_er      <= gmii_tx_er_int;
     gmii_rxd_int    <= gmii_rxd;
     gmii_rx_dv_int  <= gmii_rx_dv;
     gmii_rx_er_int  <= gmii_rx_er;
  end

  assign glbl_rst_intn = !glbl_rst;

  //----------------------------------------------------------------------------
  // Transmitter Clock logic for gtx_clk
  //----------------------------------------------------------------------------

  // route gtx_clk through a BUFG and onto global clock routing
  BUFG bufg_gtx_clk (.I(gtx_clk), .O(gtx_clk_bufg));

  //----------------------------------------------------------------------------
  // Generate the s_axi_aclk for configuration by processor .
  //----------------------------------------------------------------------------
  // we only have one clock source (gtx_clk) so  it will be derived from that
  BUFG bufg_axi_clk (.I(gtx_clk), .O(s_axi_aclk));


  //----------------------------------------------------------------------------
  // Generate the user side clocks for the axi fifos
  //----------------------------------------------------------------------------
  assign tx_fifo_clock = gtx_clk_bufg;
  assign rx_fifo_clock = gtx_clk_bufg;

  //----------------------------------------------------------------------------
  // Generate resets required for the fifo side signals etc
  //----------------------------------------------------------------------------
  // in each case the async reset is first captured and then synchronised
  //---------------
  // Vector controller reset
   tri_mode_eth_mac_v5_5_reset_sync vector_reset_gen (
      .clk              (gtx_clk_bufg),
      .enable           (1'b1),
      .reset_in         (glbl_rst),
      .reset_out        (vector_reset_int)
   );

   // Create fully synchronous reset in the s_axi clock domain.
   always @(posedge gtx_clk_bufg)
   begin
     if (vector_reset_int) begin
       vector_pre_resetn <= 0;
       vector_resetn     <= 0;
     end
     else begin
       vector_pre_resetn <= 1;
       vector_resetn     <= vector_pre_resetn;
     end
   end

  //---------------
  // gtx_clk reset
   tri_mode_eth_mac_v5_5_reset_sync gtx_reset_gen (
      .clk              (gtx_clk_bufg),
      .enable           (1'b1),
      .reset_in         (glbl_rst || rx_reset || tx_reset),
      .reset_out        (gtx_clk_reset_int)
   );

   // Create fully synchronous reset in the gtx_clk domain.
   always @(posedge gtx_clk_bufg)
   begin
     if (gtx_clk_reset_int) begin
       gtx_pre_resetn  <= 0;
       gtx_resetn      <= 0;
     end
     else begin
       gtx_pre_resetn  <= 1;
       gtx_resetn      <= gtx_pre_resetn;
     end
   end

  //---------------
  // data check reset
   tri_mode_eth_mac_v5_5_reset_sync chk_reset_gen (
      .clk              (gtx_clk_bufg),
      .enable           (1'b1),
      .reset_in         (glbl_rst || reset_error),
      .reset_out        (chk_reset_int)
   );

   // Create fully synchronous reset in the gtx_clk domain.
   always @(posedge gtx_clk_bufg)
   begin
     if (chk_reset_int) begin
       chk_pre_resetn  <= 0;
       chk_resetn      <= 0;
     end
     else begin
       chk_pre_resetn  <= 1;
       chk_resetn      <= chk_pre_resetn;
     end
   end


   // generate the user side resets for the axi fifos
   assign tx_fifo_resetn = gtx_resetn;
   assign rx_fifo_resetn = gtx_resetn;

  //----------------------------------------------------------------------------
  // Serialize the stats vectors
  // This is a single bit approach, retimed onto gtx_clk
  // this code is only present to prevent code being stripped..
  //----------------------------------------------------------------------------

  // RX STATS

  // when an update is txd load shifter (plus start/stop bit)
  // shifter always runs (no power concerns as this is an example design)
  always @(posedge gtx_clk_bufg)
  begin
     rx_statistics_valid_reg <= rx_statistics_valid;
     if (!rx_statistics_valid_reg & rx_statistics_valid) begin
        rx_stats_shift <= {1'b1, rx_statistics_vector, 1'b1};
     end
     else begin
        rx_stats_shift <= {rx_stats_shift[28:0], 1'b0};
     end
  end

  assign rx_statistics_s = rx_stats_shift[29];

  // TX STATS

  // when an update is txd load shifter (plus start/stop bit)
  // shifter always runs (no power concerns as this is an example design)
  always @(posedge gtx_clk_bufg)
  begin
     tx_statistics_valid_reg <= tx_statistics_valid;
     if (!tx_statistics_valid_reg & tx_statistics_valid) begin
        tx_stats_shift <= {1'b1, tx_statistics_vector, 1'b1};
     end
     else begin
        tx_stats_shift <= {tx_stats_shift[32:0], 1'b0};
     end
  end

  assign tx_statistics_s = tx_stats_shift[33];

  //----------------------------------------------------------------------------
  // DESerialize the Pause interface
  // This is a single bit approachtimed on gtx_clk
  // this code is only present to prevent code being stripped..
  //----------------------------------------------------------------------------
  // the serialised pause info has a start bit followed by the quanta and a stop bit
  // capture the quanta when the start bit hits the msb and the stop bit is in the lsb
  always @(posedge gtx_clk_bufg)
  begin
     pause_shift <= {pause_shift[17:0], pause_req_s};
  end

  always @(posedge gtx_clk_bufg)
  begin
     if (pause_shift[18] === 1'b0 & pause_shift[17] === 1'b1 & pause_shift[0] === 1'b1) begin
        pause_req <= 1'b1;
        pause_val <= pause_shift[16:1];
     end
     else begin
        pause_req <= 1'b0;
        pause_val <= 0;
     end
  end

  //----------------------------------------------------------------------------
  // Instantiate the Config vector controller Controller
   tri_mode_eth_mac_v5_5_config_vector_sm config_vector_controller (
      .gtx_clk                      (gtx_clk_bufg),
      .gtx_resetn                   (vector_resetn),

      .mac_speed                    (mac_speed),
      .update_speed                 (update_speed),   // may need glitch protection on this..

      .rx_configuration_vector      (rx_configuration_vector),
      .tx_configuration_vector      (tx_configuration_vector)
   );


  //----------------------------------------------------------------------------
  // Instantiate the TRIMAC core fifo block wrapper
  //----------------------------------------------------------------------------
  tri_mode_eth_mac_v5_5_fifo_block trimac_fifo_block (
      .gtx_clk                      (gtx_clk_bufg),
      // asynchronous reset
      .glbl_rstn                    (glbl_rst_intn),
      .rx_axi_rstn                  (1'b1),
      .tx_axi_rstn                  (1'b1),

      // Receiver Statistics Interface
      //---------------------------------------
      .rx_reset                     (rx_reset),
      .rx_statistics_vector         (rx_statistics_vector),
      .rx_statistics_valid          (rx_statistics_valid),

      // Receiver (AXI-S) Interface
      //----------------------------------------
      .rx_fifo_clock                (rx_fifo_clock),
      .rx_fifo_resetn               (rx_fifo_resetn),
      .rx_axis_fifo_tdata           (rx_axis_fifo_tdata),
      .rx_axis_fifo_tvalid          (rx_axis_fifo_tvalid),
      .rx_axis_fifo_tready          (rx_axis_fifo_tready),
      .rx_axis_fifo_tlast           (rx_axis_fifo_tlast),
      // Transmitter Statistics Interface
      //------------------------------------------
      .tx_reset                     (tx_reset),
      .tx_ifg_delay                 (tx_ifg_delay),
      .tx_statistics_vector         (tx_statistics_vector),
      .tx_statistics_valid          (tx_statistics_valid),

      // Transmitter (AXI-S) Interface
      //-------------------------------------------
      .tx_fifo_clock                (tx_fifo_clock),
      .tx_fifo_resetn               (tx_fifo_resetn),
      .tx_axis_fifo_tdata           (tx_axis_fifo_tdata),
      .tx_axis_fifo_tvalid          (tx_axis_fifo_tvalid),
      .tx_axis_fifo_tready          (tx_axis_fifo_tready),
      .tx_axis_fifo_tlast           (tx_axis_fifo_tlast),

      // MAC Control Interface
      //------------------------
      .pause_req                    (pause_req),
      .pause_val                    (pause_val),

      // GMII Interface
      //-----------------
      .gmii_txd                     (gmii_txd_int),
      .gmii_tx_en                   (gmii_tx_en_int),
      .gmii_tx_er                   (gmii_tx_er_int),
      .gmii_rxd                     (gmii_rxd_int),
      .gmii_rx_dv                   (gmii_rx_dv_int),
      .gmii_rx_er                   (gmii_rx_er_int),
      .speedis100                   (speedis100),
      .speedis10100                 (speedis10100),
      // Configuration Vectors
      //-----------------------
      .rx_configuration_vector      (rx_configuration_vector),
      .tx_configuration_vector      (tx_configuration_vector)
   );


  //----------------------------------------------------------------------------
  //  Instantiate the address swapping module and simple pattern generator
  //----------------------------------------------------------------------------
   tri_mode_eth_mac_v5_5_basic_pat_gen basic_pat_gen_inst (
      .axi_tclk                     (tx_fifo_clock),
      .axi_tresetn                  (tx_fifo_resetn),
      .check_resetn                 (chk_resetn),

      .enable_pat_gen               (gen_tx_data),
      .enable_pat_chk               (chk_tx_data),
      .enable_address_swap          (enable_address_swap),
      .speed                        (mac_speed),

      .rx_axis_tdata                (rx_axis_fifo_tdata),
      .rx_axis_tvalid               (rx_axis_fifo_tvalid),
      .rx_axis_tlast                (rx_axis_fifo_tlast),
      .rx_axis_tuser                (1'b0), // the FIFO drops all bad frames
      .rx_axis_tready               (rx_axis_fifo_tready),

      .tx_axis_tdata                (tx_axis_fifo_tdata),
      .tx_axis_tvalid               (tx_axis_fifo_tvalid),
      .tx_axis_tlast                (tx_axis_fifo_tlast),
      .tx_axis_tready               (tx_axis_fifo_tready),

      .frame_error                  (frame_error),
      .activity_flash               (activity_flash)
   );



endmodule
