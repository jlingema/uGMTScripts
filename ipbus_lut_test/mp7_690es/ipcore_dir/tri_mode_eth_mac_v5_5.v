////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.68d
//  \   \         Application: netgen
//  /   /         Filename: tri_mode_eth_mac_v5_5.v
// /___/   /\     Timestamp: Tue Apr  1 12:33:29 2014
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog /home/scratch/vhdl/uGMT/dev/ipbus_lut_test/mp7_690es/ipcore_dir/tmp/_cg/tri_mode_eth_mac_v5_5.ngc /home/scratch/vhdl/uGMT/dev/ipbus_lut_test/mp7_690es/ipcore_dir/tmp/_cg/tri_mode_eth_mac_v5_5.v 
// Device	: 7vx690tffg1927-2
// Input file	: /home/scratch/vhdl/uGMT/dev/ipbus_lut_test/mp7_690es/ipcore_dir/tmp/_cg/tri_mode_eth_mac_v5_5.ngc
// Output file	: /home/scratch/vhdl/uGMT/dev/ipbus_lut_test/mp7_690es/ipcore_dir/tmp/_cg/tri_mode_eth_mac_v5_5.v
// # of Modules	: 1
// Design Name	: tri_mode_eth_mac_v5_5
// Xilinx        : /opt/Xilinx/14.6/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module tri_mode_eth_mac_v5_5 (
  glbl_rstn, rx_axi_rstn, tx_axi_rstn, rx_axi_clk, tx_axi_clk, tx_axis_mac_tvalid, tx_axis_mac_tlast, pause_req, gmii_rx_dv, gmii_rx_er, rx_reset_out
, rx_axis_mac_tvalid, rx_axis_mac_tlast, rx_axis_mac_tuser, rx_statistics_valid, tx_reset_out, tx_axis_mac_tready, tx_statistics_valid, speed_is_100, 
speed_is_10_100, gmii_tx_en, gmii_tx_er, tx_axis_mac_tdata, tx_axis_mac_tuser, tx_ifg_delay, pause_val, gmii_rxd, rx_mac_config_vector, 
tx_mac_config_vector, rx_axis_mac_tdata, rx_statistics_vector, tx_statistics_vector, gmii_txd
)/* synthesis syn_black_box syn_noprune=1 */;
  input glbl_rstn;
  input rx_axi_rstn;
  input tx_axi_rstn;
  input rx_axi_clk;
  input tx_axi_clk;
  input tx_axis_mac_tvalid;
  input tx_axis_mac_tlast;
  input pause_req;
  input gmii_rx_dv;
  input gmii_rx_er;
  output rx_reset_out;
  output rx_axis_mac_tvalid;
  output rx_axis_mac_tlast;
  output rx_axis_mac_tuser;
  output rx_statistics_valid;
  output tx_reset_out;
  output tx_axis_mac_tready;
  output tx_statistics_valid;
  output speed_is_100;
  output speed_is_10_100;
  output gmii_tx_en;
  output gmii_tx_er;
  input [7 : 0] tx_axis_mac_tdata;
  input [0 : 0] tx_axis_mac_tuser;
  input [7 : 0] tx_ifg_delay;
  input [15 : 0] pause_val;
  input [7 : 0] gmii_rxd;
  input [79 : 0] rx_mac_config_vector;
  input [79 : 0] tx_mac_config_vector;
  output [7 : 0] rx_axis_mac_tdata;
  output [27 : 0] rx_statistics_vector;
  output [31 : 0] tx_statistics_vector;
  output [7 : 0] gmii_txd;
  
  // synthesis translate_off
  
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/resync_promiscuous_mode/data_in ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_rx_enable/data_in ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_tx_enable/data_in ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXSTATSADDRESSMATCH_DEL_203 ;
  wire \NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/PAUSE_VECTOR_0 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/NUMBER_OF_BYTES_232 ;
  wire \NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tvalid_262 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tlast_263 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tuser_264 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VALID_265 ;
  wire \NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ;
  wire NlwRenamedSig_OI_tx_axis_mac_tready;
  wire NlwRenamedSig_OI_gmii_tx_en;
  wire N0;
  wire NlwRenamedSig_OI_N1;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R2_272 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R1_273 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R3_274 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R3_PWR_21_o_MUX_14_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R2_276 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R1_277 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R3_278 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R3_PWR_21_o_MUX_14_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_RST_ASYNCH ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_RX_RST_ASYNCH ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rxstatsaddressmatch_282 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/specialpauseaddressmatch_283 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pauseaddressmatch_284 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcastaddressmatch_285 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_filtered_data_valid_286 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_OUT_287 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_VLAN_ENABLE_OUT ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_UNDERRUN_OUT ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_DATA_VALID_OUT ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_VALID_INT_291 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_BAD_FRAME_INT_292 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_GOOD_FRAME_INT_293 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_underrun_310 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_valid_311 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CONTROL_FRAME_320 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/ADD_CONTROL_FRAME_321 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/BAD_FRAME_INT_322 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_FINAL_324 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/DATA_VALID_EARLY ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_END_OF_TX ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_ACK_IN ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/CRC_MODE_INV_77_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_CRS_345 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_TX_EN_DELAY_EARLY ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_TX_EN_DELAY_347 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/CAPTURE_348 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_IFG_DEL_EN_349 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_VLAN_ENABLE_350 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_ENABLE_351 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_JUMBO_ENABLE_352 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_CRC_MODE_353 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_FCS_GND_37_o_MUX_363_o11 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0996_inv11 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n08242 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_REG_TX_CONTROL_GND_37_o_MUX_510_o11 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_FRAME_GOOD_GND_37_o_MUX_371_o11 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n08331 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_cst1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Msub_GND_37_o_GND_37_o_sub_12_OUT<7:0>_xor<7>11 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_IFG_COUNT[7]_GND_37_o_mux_33_OUT51_362 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_TX_FAIL_DELAY_AND_167_o1_363 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1020_inv1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_lut<4>_380 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_cy<3>_381 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_lut<3>_382 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_cy<2>_383 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_lut<2>_384 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_cy<1>_385 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_lut<1>_386 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_cy<0>_387 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_lut<0>_388 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1218_inv ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_CRC_COUNT1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_CRC_COUNT ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_PRE_COUNT2 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_PRE_COUNT1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_PRE_COUNT ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable25 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable17 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable13 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<7>1_413 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<6>1_414 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<4>1_415 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<2>1_416 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<0>1_417 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/GND_37_o_GND_37_o_sub_12_OUT<3>1_418 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1199_inv ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1106_inv ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1012_inv_421 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0942_inv_422 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0934_inv ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0926_inv ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0871_inv ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1212_inv ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_BROADCAST ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_TX_FAIL_DELAY_AND_167_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/GND_37_o_GND_37_o_sub_12_OUT[2] ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/GND_37_o_GND_37_o_sub_12_OUT[4] ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/GND_37_o_GND_37_o_sub_12_OUT[5] ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/GND_37_o_GND_37_o_sub_12_OUT[6] ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/GND_37_o_GND_37_o_sub_12_OUT[7] ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<1> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<3> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<5> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0833 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_CRC_MODE_463 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_DATA_VALID_464 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STOP_MAX_PKT_465 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_SCSH_466 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_TX_VLAN_467 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_TX_CONTROL_468 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE5_MATCH_469 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_MULTI_MATCH_470 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE4_MATCH_471 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE3_MATCH_472 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE2_MATCH_473 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE1_MATCH_474 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE0_MATCH_475 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_SUCCESS_476 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_UNDERRUN2_477 ;
  wire \NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_STATUS_VALID ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_STATUS_VALID_479 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CR178124_FIX_480 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PAD_PIPE_481 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_483 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PAD_484 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TRANSMIT_485 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_PREAMBLE_486 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_487 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_SEEN_488 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MAX_PKT_LEN_REACHED_489 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIN_PKT_LEN_REACHED_490 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_PREAMBLE_DONE_491 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CLIENT_FRAME_DONE_492 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_493 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_OK_494 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_BAD_495 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_GOOD_496 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/SCSH_497 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FCS_498 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_499 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CFL_500 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_DA_501 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_502 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CDS_504 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IDL_505 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_ENABLE_506 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_EN_522 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_VLAN_EN_523 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_JUMBO_EN_524 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_SCSH_GND_37_o_MUX_514_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_TX_VLAN_GND_37_o_MUX_512_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_TX_CONTROL_GND_37_o_MUX_510_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_MULTI_MATCH_GND_37_o_MUX_505_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE4_MATCH_GND_37_o_MUX_503_o_537 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE3_MATCH_GND_37_o_MUX_501_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE2_MATCH_GND_37_o_MUX_499_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE1_MATCH_GND_37_o_MUX_497_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE0_MATCH_GND_37_o_MUX_495_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_STATUS_VALID_GND_37_o_MUX_479_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_STATUS_VALID_GND_37_o_MUX_474_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CR178124_FIX_GND_37_o_MUX_472_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PAD_PIPE_GND_37_o_MUX_470_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_GND_37_o_MUX_454_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_GND_37_o_MUX_420_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PAD_GND_37_o_MUX_418_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TRANSMIT_GND_37_o_MUX_416_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_PREAMBLE_GND_37_o_MUX_414_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_GND_37_o_MUX_412_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<0> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<1> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<2> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<3> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<4> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<5> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<6> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<7> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_PREAMBLE_DONE_GND_37_o_MUX_389_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_GND_37_o_MUX_383_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_DA_GND_37_o_MUX_351_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_GND_37_o_MUX_348_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CDS_GND_37_o_MUX_340_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_ENABLE_GND_37_o_MUX_324_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<0> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<1> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<2> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<3> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<4> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<5> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<6> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<7> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<8> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<9> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<10> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<11> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<12> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<13> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<14> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_EN_GND_37_o_MUX_320_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_VLAN_EN_GND_37_o_MUX_316_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_JUMBO_EN_GND_37_o_MUX_314_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_CRC_MODE_GND_37_o_MUX_312_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_2_617 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_3_618 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_4_619 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[13] ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[0] ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[1] ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[3] ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[4] ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[5] ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<12>_bdd6 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<14>_bdd6 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<23>_bdd2 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<0> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<1> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<2>_708 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<3>_709 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<4>_710 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<5> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<6>_712 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<7>_713 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<8> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<9> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<10> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<11> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<12>_718 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<13> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<14>_720 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<15> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<16>_722 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<17> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<18>_724 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<19> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<20> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<21> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<22> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<23> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<24>_730 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<25> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<26>_732 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<27> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<28>_734 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<29> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<30> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<31> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<31> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<30> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<29> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<28>_789 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<27> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<26>_791 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<25> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<24>_793 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<23> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<22> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<21> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<20> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<19> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<18>_799 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<17> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<16>_801 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<15> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<14>_803 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<13> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<12>_805 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<11> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<10> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<9> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<8> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<7>_810 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<6>_811 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<5> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<4>_813 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<3>_814 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<2>_815 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<1> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<0> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<23>_bdd2 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<14>_bdd6 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<12>_bdd6 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Reset_OR_DriverANDClockEnable1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_RX_DV_REG6_AND_324_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/PWR_44_o_RX_ERR_REG6_AND_322_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_SUCCESS_FRAME_FAILURE_MUX_880_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_FRAME_SUCCESS_MUX_879_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ALIGNMENT_ERR_REG_CRC_ERR_AND_318_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/CRC_ERR_ALIGNMENT_ERR_REG_AND_317_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/PRE_FALSE_CARR_FLAG ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/PRE_IFG_FLAG ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/VALIDATE_REQUIRED_846 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_EARLY_INT_847 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MATCH_FRAME_INT_848 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FALSE_CARR_FLAG_849 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/IFG_FLAG_850 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/EXTENSION_FLAG_851 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/SFD_FLAG_852 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_ENABLE_HELD_853 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/PAUSE_LT_CHECK_HELD_854 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/LT_CHECK_HELD_855 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/CRC_MODE_HELD_856 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/VLAN_ENABLE_HELD_857 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/JUMBO_FRAMES_HELD_858 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG7_884 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG6_885 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG1_886 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG7_887 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG6_888 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG3_889 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG1_890 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ALIGNMENT_ERR_REG_891 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/BAD_FRAME_892 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/GOOD_FRAME_893 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/LENGTH_TYPE_ERR_894 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/OUT_OF_BOUNDS_ERR_895 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/CRC_ERR_896 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/STATISTICS_VALID_897 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/MULTICAST_FRAME_906 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/VLAN_FRAME_907 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/TYPE_PACKET_908 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_VALID_910 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_MATCH_911 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/PADDED_FRAME_912 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/EXT_FIELD_942 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/CRC_FIELD_943 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/DAT_FIELD_944 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/LEN_FIELD_945 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/SRC_ADDRESS_FIELD_946 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/DEST_ADDRESS_FIELD_947 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FCS_949 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_DATA_950 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG5 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG5 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG2 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/BROADCASTADDRESSMATCH_DELAY ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<0> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<1> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<2> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<3> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<4> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<5> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<6> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<7> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<8> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<9> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<10> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<11> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<12> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<13> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<14> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/RX_DV_REG6_RX_ERR_REG6_OR_198_o_984 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/GND_45_o_FIELD_CONTROL[0]_MUX_693_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PWR_47_o_FIELD_CONTROL[5]_MUX_694_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/RX_ERR_REG5_END_EXT_AND_333_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/CRC_FIELD_END_DATA_OR_205_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL[1]_GND_45_o_MUX_698_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL[2]_GND_45_o_MUX_697_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL[3]_GND_45_o_MUX_696_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL[4]_GND_45_o_MUX_695_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/RX_DV_REG6_DAT_FIELD_AND_353_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/RX_DV_REG6_LEN_FIELD_AND_350_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/RX_DV_REG6_DEST_ADDRESS_FIELD_AND_344_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_EXT_996 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_LT_CHECK_DISABLE_AND_371_o1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<9>_998 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<8>_999 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<7>_1000 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<6>_1001 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<5>_1002 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<4>_1003 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<3>_1004 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<2>_1005 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<1>_1006 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<0>_1007 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_lut<0> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<14>1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<13>1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<12>1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<11>1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<10>1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<9>1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<8>1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<7>1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<6>1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<5>1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<4>1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<3>1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<2>1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<1>1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<0>1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_val ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0404_inv ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0387_inv ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0368_inv11 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0476_inv1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Reset_OR_DriverANDClockEnable ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/GND_46_o_RXD[7]_equal_9_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/VLAN_MATCH[1]_GND_46_o_MUX_826_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<0> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<1> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<2> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<3> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<4> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<5> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<6> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<7> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<8> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<9> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<10> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/SFD_FLAG_DATA_NO_FCS_OR_232_o_1069 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/SFD_FLAG_CRC_COMPUTE_OR_217_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_LT_CHECK_DISABLE_AND_371_o_1072 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_LT_CHECK_DISABLE_AND_375_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/PWR_48_o_RXD[7]_equal_15_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_FIELD_COUNTER[1]_AND_376_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_NO_FCS_DATA_WITH_FCS_MUX_790_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/VLAN_ENABLE_PWR_48_o_AND_410_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CONTROL_FRAME_INT_1089 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/MULTICAST_MATCH_1090 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/ADD_CONTROL_ENABLE_1091 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_1105 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/ADD_CONTROL_FRAME_INT_1106 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CONTROL_MATCH_1107 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_NO_FCS_1108 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_WITH_FCS_1109 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_ONE_1110 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_ZERO_1111 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LESS_THAN_256_1112 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n01482 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/Reset_OR_DriverANDClockEnable ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/END_OF_FRAME_SFD_FLAG_AND_418_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FCS_ERR_EXTENSION_FIELD_OR_256_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FCS_ERR_CRC_ENGINE_ERR_OR_268_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FRAME_LEN_ERR_END_OF_DATA_OR_242_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/MIN_LENGTH_MATCH_EXCEEDED_MIN_LEN_OR_236_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/GND_47_o_FRAME_COUNTER[7]_equal_1_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/MAX_LENGTH_ERR_1121 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/INHIBIT_FRAME_1122 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FCS_ERR_1123 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/CRC_ENGINE_ERR_1124 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FRAME_LEN_ERR_1125 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/EXCEEDED_MIN_LEN_1126 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/MIN_LENGTH_MATCH_1127 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/Mmux_tx_data[7]_tx_mac_tdata[7]_mux_66_OUT11 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd9_1129 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd3-In ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd6-In ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd7-In_1132 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/_n0280_inv ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_mac_tlast_tx_mac_tvalid_OR_21_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_PWR_24_o_equal_77_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_GND_25_o_equal_75_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_GND_25_o_equal_74_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_GND_25_o_equal_73_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_tx_enable_reg_AND_28_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_GND_25_o_equal_30_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd2_1142 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd3_1143 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd6_1144 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd8_1145 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd1_1146 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd10_1147 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd4_1148 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd7_1149 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd5_1150 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_burst2_1151 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_burst1_1152 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_assert_1153 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_deassert_1154 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_underrun_1155 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/ignore_packet_1156 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/two_byte_tx_1157 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tlast_reg_1158 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_end_1159 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_mac_tready_reg_1160 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/no_burst_1161 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/gate_tready_1162 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<0> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<1> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<2> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<3> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<4> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<5> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<6> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<7> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_rx_enable/data_sync1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_rx_duplex/data_sync1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_tx_enable/data_sync1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_tx_duplex/data_sync1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_ENABLE_REG_1183 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_UNDERRUN_INT_1184 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_tx_duplex/data_sync2 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_tx_enable/data_sync2 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/COUNT_SET_1187 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_STATUS_INT_1188 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_ENABLE_REG_1189 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_rx_duplex/data_sync2 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_rx_enable/data_sync2 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_REQ_TO_TX_1192 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_in ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/CONTROL_COMPLETE ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/PAUSE_REQ_LOCAL ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_BAD_FRAME_COMB ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_GOOD_FRAME_COMB ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/GND_27_o_DATA[7]_equal_8_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n00811 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0127_inv ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0123_inv1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0100_inv ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/BAD_OPCODE_INT_1270 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_REQ_INT_1271 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_Mux_26_o11_1280 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mcount_DATA_COUNT_val ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0200_inv_1285 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2_1286 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd1-In_1287 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2-In ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0183_inv ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<0> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<1> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<2> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<3> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<4> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<5> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<6> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<7> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_Mux_26_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0156_1300 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0150_1301 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/END_OF_TX_INV_38_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_COMB ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_REQ_INT_1309 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/END_OF_TX_HELD_1311 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/END_OF_TX_REG_1312 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_CONTROL_1321 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_INT_1330 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_IN_REG_1331 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd1_1332 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/GOOD_FRAME_IN1_GOOD_FRAME_IN3_OR_86_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/GOOD_FRAME_IN1_1398 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/GOOD_FRAME_IN3_1399 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/GOOD_FRAME_IN2_1400 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mmux_COUNT_SET_GND_31_o_MUX_237_o12_1401 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT15 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT14 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT13 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT12 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT11 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT10 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT9 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT8 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT7 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT6 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT5 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT4 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT3 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT2 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/_n0068_inv_1449 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA5 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA4 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA3 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA2 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT[15]_GND_31_o_equal_8_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/GOOD_FRAME_IN_TX_REG_1458 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/COUNT_SET_REG_1465 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync2 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_counter_xor<5>11 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result<2>1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result<1>1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result<0>1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_load_count_val ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_counter_val ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/_n0301_inv ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/sync_update/data_sync1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/resync_promiscuous_mode/data_sync1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Reset_OR_DriverANDClockEnable ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter[5]_GND_50_o_equal_14_o1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_PWR_52_o_LessThan_17_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe[2]_PWR_52_o_LessThan_20_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<0> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<1> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<2> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<3> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<4> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<5> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<6> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<7> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcast_byte_match_rx_data[7]_MUX_938_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/specialpauseaddressmatch_int_1528 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pauseaddressmatch_int_1529 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcastaddressmatch_int_1530 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/address_match_1531 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_1532 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_1533 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcast_match_1534 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/promiscuous_mode_sample_1535 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/update_pause_ad_sync_reg_1536 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_1537 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_reg1_1541 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_srl16_reg2_1542 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_srl16_reg1_1543 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_reg_1544 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_reg_1545 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcast_byte_match_1546 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_reg2_1547 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/resync_promiscuous_mode/data_sync2 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_srl16 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/sync_update/data_sync2 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_comb ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_reg_rx_data[7]_MUX_958_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd2_1569 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd2-In ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state[1]_next_rx_state[1]_OR_9_o_0 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/next_rx_state[1]_rx_enable_AND_7_o ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd1_1575 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state[1]_GND_24_o_equal_28_o ;
  wire N2;
  wire N4;
  wire N6;
  wire N8;
  wire N12;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_REG_TX_CONTROL_GND_37_o_MUX_510_o111_1590 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_REG_TX_CONTROL_GND_37_o_MUX_510_o112_1591 ;
  wire N18;
  wire N20;
  wire N22;
  wire N24;
  wire N26;
  wire N28;
  wire N30;
  wire N32;
  wire N34;
  wire N36;
  wire N38;
  wire N40;
  wire N42;
  wire N44;
  wire N46;
  wire N48;
  wire N50;
  wire N52;
  wire N54;
  wire N56;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT5 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT51_1613 ;
  wire N58;
  wire N60;
  wire N62;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT28 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT281_1618 ;
  wire N66;
  wire N68;
  wire N70;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT28 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT281_1623 ;
  wire N72;
  wire N74;
  wire N76;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT5 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT51_1628 ;
  wire N80;
  wire N82;
  wire N84;
  wire N86;
  wire N88;
  wire N90;
  wire N92;
  wire N94;
  wire N96;
  wire N98;
  wire N100;
  wire N102;
  wire N104;
  wire N106;
  wire N108;
  wire N110;
  wire N122;
  wire N124;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER[10]_LENGTH_TYPE[10]_equal_8_o11 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER[10]_LENGTH_TYPE[10]_equal_8_o111_1648 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER[10]_LENGTH_TYPE[10]_equal_8_o113 ;
  wire N128;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n01481_1651 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n01483_1652 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n01484_1653 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n014821_1654 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n014822_1655 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n014823_1656 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n014824_1657 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FRAME_LEN_ERR_END_OF_DATA_OR_242_o1_1658 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FRAME_LEN_ERR_END_OF_DATA_OR_242_o2_1659 ;
  wire N130;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd3-In1_1661 ;
  wire N132;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o1_1663 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o2_1664 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o3_1665 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o4_1666 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o5_1667 ;
  wire N134;
  wire N136;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_tx_state[3]_OR_24_o1_1670 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_tx_state[3]_OR_24_o2_1671 ;
  wire N138;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/GND_27_o_DATA[7]_equal_8_o<7> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/GND_27_o_DATA[7]_equal_8_o<7>1_1674 ;
  wire N144;
  wire N146;
  wire N148;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2-In1_1678 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2-In2_1679 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT10 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT101_1681 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT102_1682 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT103_1683 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT7 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT71_1685 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT72_1686 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT14 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT141_1688 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT142_1689 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT12 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT121_1691 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT122_1692 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT3 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT31_1694 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT32_1695 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT5 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT51_1697 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT52_1698 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT53_1699 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT16 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT161_1701 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT162_1702 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT163_1703 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT19 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT191_1705 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT192_1706 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT193_1707 ;
  wire N152;
  wire N154;
  wire N156;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mmux_COUNT_SET_GND_31_o_MUX_237_o1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mmux_COUNT_SET_GND_31_o_MUX_237_o11_1712 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mmux_COUNT_SET_GND_31_o_MUX_237_o13_1713 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT[15]_GND_31_o_equal_8_o<15> ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT[15]_GND_31_o_equal_8_o<15>1_1715 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT7 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT71_1717 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT6 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT61_1719 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT5 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT51_1721 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT4 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT41_1723 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT3 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT31_1725 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT2 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT21_1727 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT1 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT11_1729 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_comb8 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_comb81_1731 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_reg_rx_data[7]_MUX_958_o8 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_reg_rx_data[7]_MUX_958_o81_1733 ;
  wire N158;
  wire N160;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_TX_EN_DELAY_glue_set_1736 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_2_glue_rst_1737 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_3_glue_rst_1738 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_4_glue_set_1739 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_13_glue_set_1740 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_12_glue_set_1741 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_11_glue_set_1742 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_10_glue_set_1743 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_9_glue_set_1744 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_8_glue_set_1745 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_7_glue_set_1746 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_6_glue_set_1747 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_5_glue_set_1748 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_4_glue_set_1749 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_3_glue_set_1750 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_2_glue_set_1751 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_1_glue_set_1752 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_0_glue_set_1753 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/VALIDATE_REQUIRED_glue_set_1754 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_EARLY_INT_glue_set_1755 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/EXT_FIELD_glue_set_1756 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_glue_set_1757 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/MAX_LENGTH_ERR_glue_set_1758 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_burst2_glue_set_1759 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_assert_glue_set_1760 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_burst1_glue_set_1761 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_deassert_glue_set_1762 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_underrun_glue_set_1763 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/ignore_packet_glue_set_1764 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_valid_glue_set_1765 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tlast_reg_glue_set ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_underrun_glue_set ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/PAUSE_VECTOR_0_glue_set_1768 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_REQ_INT_glue_set_1769 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/BAD_OPCODE_INT_glue_set_1770 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT_0_glue_rst_1771 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT_4_glue_rst_1772 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT_1_glue_rst_1773 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_REQ_INT_glue_set_1774 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_glue_ce_1775 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/END_OF_TX_HELD_glue_set_1776 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_STATUS_INT_glue_set_1777 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_glue_set_1778 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_glue_set_1779 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcast_match_glue_set_1780 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rxstatsaddressmatch_glue_set_1781 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/address_match_glue_set_1782 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<13>_rt_1783 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<12>_rt_1784 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<11>_rt_1785 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<10>_rt_1786 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<9>_rt_1787 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<8>_rt_1788 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<7>_rt_1789 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<6>_rt_1790 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<5>_rt_1791 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<4>_rt_1792 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<3>_rt_1793 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<2>_rt_1794 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<1>_rt_1795 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<9>_rt_1796 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<8>_rt_1797 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<7>_rt_1798 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<6>_rt_1799 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<5>_rt_1800 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<4>_rt_1801 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<3>_rt_1802 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<2>_rt_1803 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<1>_rt_1804 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<13>_rt_1805 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<12>_rt_1806 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<11>_rt_1807 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<10>_rt_1808 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<9>_rt_1809 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<8>_rt_1810 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<7>_rt_1811 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<6>_rt_1812 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<5>_rt_1813 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<4>_rt_1814 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<3>_rt_1815 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<2>_rt_1816 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<1>_rt_1817 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_xor<14>_rt_1818 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_xor<10>_rt_1819 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_xor<14>_rt_1820 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STOP_MAX_PKT_rstpot_1821 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_SEEN_rstpot_1822 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIN_PKT_LEN_REACHED_rstpot_1823 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE5_MATCH_rstpot_1824 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_SUCCESS_rstpot_1825 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_UNDERRUN2_rstpot_1826 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MAX_PKT_LEN_REACHED_rstpot ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CLIENT_FRAME_DONE_rstpot_1828 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_rstpot_1829 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_OK_rstpot_1830 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_GOOD_rstpot_1831 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/SCSH_rstpot_1832 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_BAD_rstpot_1833 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FCS_rstpot_1834 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_rstpot_1835 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CFL_rstpot_1836 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_DA_rstpot_1837 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_rstpot_1838 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_rstpot_1839 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CDS_rstpot_1840 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IDL_rstpot_1841 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MATCH_FRAME_INT_rstpot_1842 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/TYPE_PACKET_rstpot_1843 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/BAD_FRAME_rstpot ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/two_byte_tx_rstpot_1846 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/COUNT_SET_rstpot_1847 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/promiscuous_mode_sample_rstpot_1848 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd1_rstpot_1849 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/no_burst_rstpot_1850 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/update_pause_ad_sync_reg_rstpot_1851 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_filtered_data_valid_rstpot_1852 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd1_rstpot_1853 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tvalid_rstpot ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tlast_rstpot ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_2_rstpot ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_end_rstpot_1857 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_rstpot_1858 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/NUMBER_OF_BYTES_rstpot1_1859 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_2_rstpot1_1860 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_FINAL_rstpot1_1861 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_DATA_rstpot1_1862 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/SRC_ADDRESS_FIELD_rstpot1_1863 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FCS_rstpot1_1864 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_MATCH_rstpot1_1865 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CONTROL_FRAME_INT_rstpot1_1866 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/ADD_CONTROL_ENABLE_rstpot1_1867 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/MULTICAST_MATCH_rstpot1_1868 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_WITH_FCS_rstpot1_1869 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/PADDED_FRAME_rstpot1_1870 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/LENGTH_TYPE_ERR_rstpot1_1871 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/STATISTICS_VALID_rstpot1_1872 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/BAD_FRAME_rstpot1_1873 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/GOOD_FRAME_rstpot1_1874 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/CRC_ENGINE_ERR_rstpot1_1875 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_ENABLE_REG_rstpot1_1876 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_ENABLE_REG_rstpot1_1877 ;
  wire N162;
  wire N163;
  wire N167;
  wire N169;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MAX_PKT_LEN_REACHED_rstpot_lut_1882 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_l1 ;
  wire N173;
  wire N179;
  wire N181;
  wire N183;
  wire N197;
  wire N199;
  wire N201;
  wire N203;
  wire N205;
  wire N207;
  wire N209;
  wire N211;
  wire N213;
  wire N217;
  wire N219;
  wire N221;
  wire N223;
  wire N225;
  wire N227;
  wire N229;
  wire N231;
  wire N233;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter_1_1_1906 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter_0_1_1907 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter_2_1_1908 ;
  wire N235;
  wire N236;
  wire N237;
  wire N238;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mshreg_PREAMBLE_PIPE_13_1913 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE_131_1914 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Mshreg_STATISTICS_VECTOR_22_1915 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift1_1916 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift2_1917 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift3_1918 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift4_1919 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift5_1920 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift6_1921 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift7_1922 ;
  wire \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE_1311_1923 ;
  wire \NLW_U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/delay_rx_data_valid_Q15_UNCONNECTED ;
  wire \NLW_U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[7].header_field_dist_ram_SPO_UNCONNECTED ;
  wire \NLW_U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[6].header_field_dist_ram_SPO_UNCONNECTED ;
  wire \NLW_U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[5].header_field_dist_ram_SPO_UNCONNECTED ;
  wire \NLW_U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[4].header_field_dist_ram_SPO_UNCONNECTED ;
  wire \NLW_U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[3].header_field_dist_ram_SPO_UNCONNECTED ;
  wire \NLW_U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[2].header_field_dist_ram_SPO_UNCONNECTED ;
  wire \NLW_U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[1].header_field_dist_ram_SPO_UNCONNECTED ;
  wire \NLW_U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[0].header_field_dist_ram_SPO_UNCONNECTED ;
  wire \NLW_U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mshreg_PREAMBLE_PIPE_13_Q15_UNCONNECTED ;
  wire \NLW_U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Mshreg_STATISTICS_VECTOR_22_Q15_UNCONNECTED ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata ;
  wire [24 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR ;
  wire [19 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_DATA_OUT ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 ;
  wire [13 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy ;
  wire [0 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_lut ;
  wire [14 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result ;
  wire [14 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT ;
  wire [14 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH ;
  wire [31 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 ;
  wire [1 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_DELAY_HELD ;
  wire [7 : 2] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_MASKED ;
  wire [13 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 ;
  wire [1 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COUNT ;
  wire [2 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT ;
  wire [14 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 ;
  wire [15 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN ;
  wire [1 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TRANSMIT_PIPE ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4 ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 ;
  wire [31 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC ;
  wire [14 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8 ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 ;
  wire [14 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER ;
  wire [13 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH ;
  wire [5 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 ;
  wire [13 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy ;
  wire [0 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_lut ;
  wire [10 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result ;
  wire [10 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> ;
  wire [10 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE ;
  wire [1 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/VLAN_MATCH ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold ;
  wire [15 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT ;
  wire [15 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE ;
  wire [4 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Result ;
  wire [15 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 ;
  wire [4 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY ;
  wire [4 : 2] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Result ;
  wire [4 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL ;
  wire [47 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD ;
  wire [15 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD ;
  wire [15 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut ;
  wire [14 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy ;
  wire [5 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA ;
  wire [15 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT ;
  wire [5 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter ;
  wire [2 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count ;
  wire [5 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_addr_lut ;
  wire [2 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/expected_pause_data ;
  wire [0 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/next_rx_state ;
  wire [0 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/fsmfake0 ;
  wire [7 : 0] \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg ;
  assign
    \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/resync_promiscuous_mode/data_in  = rx_mac_config_vector[11],
    \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_rx_enable/data_in  = rx_mac_config_vector[5],
    \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_tx_enable/data_in  = tx_mac_config_vector[5],
    rx_axis_mac_tdata[7] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata [7],
    rx_axis_mac_tdata[6] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata [6],
    rx_axis_mac_tdata[5] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata [5],
    rx_axis_mac_tdata[4] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata [4],
    rx_axis_mac_tdata[3] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata [3],
    rx_axis_mac_tdata[2] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata [2],
    rx_axis_mac_tdata[1] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata [1],
    rx_axis_mac_tdata[0] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata [0],
    rx_statistics_vector[27] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXSTATSADDRESSMATCH_DEL_203 ,
    rx_statistics_vector[26] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [24],
    rx_statistics_vector[25] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [23],
    rx_statistics_vector[22] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [22],
    rx_statistics_vector[21] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [21],
    rx_statistics_vector[20] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [20],
    rx_statistics_vector[19] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [19],
    rx_statistics_vector[18] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [18],
    rx_statistics_vector[17] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [17],
    rx_statistics_vector[16] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [16],
    rx_statistics_vector[15] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [15],
    rx_statistics_vector[14] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [14],
    rx_statistics_vector[13] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [13],
    rx_statistics_vector[12] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [12],
    rx_statistics_vector[11] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [11],
    rx_statistics_vector[10] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [10],
    rx_statistics_vector[9] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [9],
    rx_statistics_vector[8] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [8],
    rx_statistics_vector[7] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [7],
    rx_statistics_vector[6] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [6],
    rx_statistics_vector[5] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [5],
    rx_statistics_vector[4] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [4],
    rx_statistics_vector[3] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [3],
    rx_statistics_vector[2] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [2],
    rx_statistics_vector[1] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [1],
    rx_statistics_vector[0] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [0],
    tx_statistics_vector[31] = \NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/PAUSE_VECTOR_0 ,
    tx_statistics_vector[30] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/NUMBER_OF_BYTES_232 ,
    tx_statistics_vector[29] = NlwRenamedSig_OI_N1,
    tx_statistics_vector[28] = NlwRenamedSig_OI_N1,
    tx_statistics_vector[27] = NlwRenamedSig_OI_N1,
    tx_statistics_vector[26] = NlwRenamedSig_OI_N1,
    tx_statistics_vector[25] = NlwRenamedSig_OI_N1,
    tx_statistics_vector[24] = NlwRenamedSig_OI_N1,
    tx_statistics_vector[23] = NlwRenamedSig_OI_N1,
    tx_statistics_vector[22] = NlwRenamedSig_OI_N1,
    tx_statistics_vector[21] = NlwRenamedSig_OI_N1,
    tx_statistics_vector[20] = NlwRenamedSig_OI_N1,
    tx_statistics_vector[19] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [19],
    tx_statistics_vector[18] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [18],
    tx_statistics_vector[17] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [17],
    tx_statistics_vector[16] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [16],
    tx_statistics_vector[15] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [15],
    tx_statistics_vector[14] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [14],
    tx_statistics_vector[13] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [13],
    tx_statistics_vector[12] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [12],
    tx_statistics_vector[11] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [11],
    tx_statistics_vector[10] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [10],
    tx_statistics_vector[9] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [9],
    tx_statistics_vector[8] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [8],
    tx_statistics_vector[7] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [7],
    tx_statistics_vector[6] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [6],
    tx_statistics_vector[5] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [5],
    tx_statistics_vector[4] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [4],
    tx_statistics_vector[3] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [3],
    tx_statistics_vector[2] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [2],
    tx_statistics_vector[1] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [1],
    tx_statistics_vector[0] = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [0],
    rx_reset_out = \NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ,
    rx_axis_mac_tvalid = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tvalid_262 ,
    rx_axis_mac_tlast = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tlast_263 ,
    rx_axis_mac_tuser = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tuser_264 ,
    rx_statistics_valid = \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VALID_265 ,
    tx_reset_out = \NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ,
    tx_axis_mac_tready = NlwRenamedSig_OI_tx_axis_mac_tready,
    tx_statistics_valid = \NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_STATUS_VALID ,
    speed_is_100 = NlwRenamedSig_OI_N1,
    speed_is_10_100 = NlwRenamedSig_OI_N1,
    gmii_tx_en = NlwRenamedSig_OI_gmii_tx_en;
  VCC   XST_VCC (
    .P(N0)
  );
  GND   XST_GND (
    .G(NlwRenamedSig_OI_N1)
  );
  FDP #(
    .INIT ( 1'b1 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R1  (
    .C(rx_axi_clk),
    .D(NlwRenamedSig_OI_N1),
    .PRE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_RX_RST_ASYNCH ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R1_273 )
  );
  FDP #(
    .INIT ( 1'b1 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R2  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R1_273 ),
    .PRE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_RX_RST_ASYNCH ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R2_272 )
  );
  FDP #(
    .INIT ( 1'b1 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R1  (
    .C(tx_axi_clk),
    .D(NlwRenamedSig_OI_N1),
    .PRE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_RST_ASYNCH ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R1_277 )
  );
  FDP #(
    .INIT ( 1'b1 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R2  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R1_277 ),
    .PRE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_RST_ASYNCH ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R2_276 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXSTATSADDRESSMATCH_DEL  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rxstatsaddressmatch_282 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXSTATSADDRESSMATCH_DEL_203 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/BYTECNTSRL  (
    .A0(NlwRenamedSig_OI_N1),
    .A1(N0),
    .A2(N0),
    .A3(NlwRenamedSig_OI_N1),
    .CE(N0),
    .CLK(tx_axi_clk),
    .D(NlwRenamedSig_OI_gmii_tx_en),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_TX_EN_DELAY_EARLY )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_CRS  (
    .C(tx_axi_clk),
    .D(NlwRenamedSig_OI_N1),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_CRS_345 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_VLAN_ENABLE  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_VLAN_ENABLE_OUT ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_VLAN_ENABLE_350 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_ENABLE  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(tx_mac_config_vector[1]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_ENABLE_351 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_IFG_DEL_EN  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(tx_mac_config_vector[8]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_IFG_DEL_EN_349 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_JUMBO_ENABLE  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(tx_mac_config_vector[4]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_JUMBO_ENABLE_352 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_CRC_MODE  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/CRC_MODE_INV_77_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_CRC_MODE_353 )
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_xor<14>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [13]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_xor<14>_rt_1818 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [14])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_xor<13>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [12]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<13>_rt_1783 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [13])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<13>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [12]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<13>_rt_1783 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [13])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_xor<12>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [11]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<12>_rt_1784 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [12])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<12>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [11]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<12>_rt_1784 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [12])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_xor<11>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [10]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<11>_rt_1785 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [11])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<11>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [10]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<11>_rt_1785 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [11])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_xor<10>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [9]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<10>_rt_1786 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [10])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<10>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [9]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<10>_rt_1786 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [10])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_xor<9>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [8]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<9>_rt_1787 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [9])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<9>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [8]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<9>_rt_1787 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [9])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_xor<8>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [7]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<8>_rt_1788 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [8])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<8>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [7]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<8>_rt_1788 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [8])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_xor<7>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [6]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<7>_rt_1789 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [7])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<7>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [6]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<7>_rt_1789 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [7])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_xor<6>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [5]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<6>_rt_1790 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [6])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<6>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [5]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<6>_rt_1790 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [6])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_xor<5>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [4]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<5>_rt_1791 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [5])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<5>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [4]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<5>_rt_1791 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [5])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_xor<4>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [3]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<4>_rt_1792 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [4])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<4>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [3]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<4>_rt_1792 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [4])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_xor<3>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [2]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<3>_rt_1793 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [3])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<3>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [2]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<3>_rt_1793 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [3])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_xor<2>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [1]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<2>_rt_1794 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [2])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<2>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [1]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<2>_rt_1794 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [2])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_xor<1>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [0]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<1>_rt_1795 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [1])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<1>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [0]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<1>_rt_1795 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [1])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_xor<0>  (
    .CI(NlwRenamedSig_OI_N1),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_lut [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [0])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<0>  (
    .CI(NlwRenamedSig_OI_N1),
    .DI(N0),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_lut [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy [0])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_cy<4>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_cy<3>_381 ),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_lut<4>_380 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o )
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_lut<4>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [12]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [12]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [13]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [13]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [14]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_lut<4>_380 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_cy<3>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_cy<2>_383 ),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_lut<3>_382 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_cy<3>_381 )
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_lut<3>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [9]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [9]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [10]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [10]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [11]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [11]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_lut<3>_382 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_cy<2>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_cy<1>_385 ),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_lut<2>_384 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_cy<2>_383 )
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_lut<2>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [6]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [6]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [7]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [7]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [8]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [8]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_lut<2>_384 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_cy<1>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_cy<0>_387 ),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_lut<1>_386 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_cy<1>_385 )
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_lut<1>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_3_618 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [4]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_4_619 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [5]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_lut<1>_386 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_cy<0>  (
    .CI(N0),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_lut<0>_388 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_cy<0>_387 )
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_lut<0>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [2]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_2_617 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcompar_FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_lut<0>_388 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_6  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1218_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [6]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_cst1 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_14  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1218_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [14]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_cst1 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [14])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_13  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1218_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [13]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_cst1 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [13])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_11  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1218_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [11]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_cst1 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [11])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_10  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1218_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [10]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_cst1 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [10])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_12  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1218_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [12]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_cst1 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [12])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_9  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1218_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [9]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_cst1 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [9])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_8  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1218_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [8]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_cst1 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_5  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1218_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [5]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_cst1 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_7  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1218_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [7]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_cst1 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_4  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1218_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [4]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_cst1 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_3  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1218_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [3]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_cst1 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_1  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1218_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [1]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_cst1 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_0  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1218_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [0]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_cst1 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [0])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COUNT_1  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_CRC_COUNT1 ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COUNT [1])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COUNT_0  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_CRC_COUNT ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COUNT [0])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT_2  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_PRE_COUNT2 ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [2])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT_1  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_PRE_COUNT1 ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [1])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT_0  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_PRE_COUNT ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4_7  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [7]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4 [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4_6  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [6]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4 [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4_5  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [5]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4 [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4_4  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [4]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4 [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4_3  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [3]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4 [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4_2  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [2]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4 [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4_1  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [1]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4 [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4_0  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [0]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4 [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3_7  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [7]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable25 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3_6  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [6]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable25 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3_5  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [5]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable25 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3_4  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [4]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable25 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3_3  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [3]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable25 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3_2  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [2]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable25 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3_1  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [1]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable25 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3_0  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [0]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable25 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2_7  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [7]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable17 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2_6  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [6]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable17 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2_5  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [5]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable17 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2_4  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [4]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable17 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2_3  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [3]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable17 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2_2  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [2]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable17 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2_1  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [1]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable17 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2_0  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [0]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable17 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN_15  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[13] ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [7]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [15])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN_14  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[13] ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [6]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [14])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN_13  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[13] ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [5]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [13])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN_12  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[13] ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [4]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [12])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN_11  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[13] ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [3]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [11])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN_10  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[13] ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [2]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [10])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN_9  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[13] ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [1]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [9])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN_8  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[13] ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [0]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [8])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN_7  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[13] ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [7]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN_6  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[13] ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [6]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN_5  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[13] ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [5]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN_4  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[13] ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [4]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN_3  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[13] ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [3]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN_2  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[13] ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [2]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN_1  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[13] ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [1]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN_0  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[13] ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [0]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_19  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_TX_VLAN_467 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [19])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_18  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [13]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [18])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_17  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [12]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [17])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_16  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [11]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [16])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_15  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [10]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [15])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_14  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [9]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [14])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_13  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [8]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [13])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_12  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [7]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [12])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_11  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [6]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [11])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_10  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [5]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [10])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_9  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [4]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [9])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_8  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [3]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [8])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_7  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [2]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_6  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [1]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_5  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [0]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_4  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_TX_CONTROL_468 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_3  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_UNDERRUN2_477 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_1  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_BROADCAST ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_0  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_SUCCESS_476 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1_7  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<7>1_413 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1_6  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<6>1_414 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1_5  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<5> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable13 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1_4  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<4>1_415 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1_3  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<3> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable13 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1_2  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<2>1_416 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1_1  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<1> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable13 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1_0  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<0>1_417 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [0])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH_14  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0871_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<14> ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [14])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH_13  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0871_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<13> ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [13])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH_12  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0871_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<12> ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [12])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH_11  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0871_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<11> ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [11])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH_10  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0871_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<10> ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [10])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH_9  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0871_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<9> ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [9])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH_8  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0871_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<8> ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [8])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH_7  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0871_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<7> ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [7])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH_6  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0871_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<6> ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [6])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH_5  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0871_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<5> ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [5])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH_4  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0871_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<4> ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [4])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH_3  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0871_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<3> ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [3])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH_2  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0871_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<2> ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [2])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH_1  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0871_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<1> ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [1])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH_0  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0871_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<0> ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_MASKED_7  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/GND_37_o_GND_37_o_sub_12_OUT[7] ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_MASKED [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_MASKED_6  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/GND_37_o_GND_37_o_sub_12_OUT[6] ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_MASKED [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_MASKED_5  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/GND_37_o_GND_37_o_sub_12_OUT[5] ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_MASKED [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_MASKED_4  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/GND_37_o_GND_37_o_sub_12_OUT[4] ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_MASKED [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_MASKED_3  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/GND_37_o_GND_37_o_sub_12_OUT<3>1_418 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_MASKED [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_MASKED_2  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/GND_37_o_GND_37_o_sub_12_OUT[2] ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_MASKED [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TRANSMIT_PIPE_1  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TRANSMIT_PIPE [0]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TRANSMIT_PIPE [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TRANSMIT_PIPE_0  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TRANSMIT_485 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TRANSMIT_PIPE [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE_5  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[4] ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[5] )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE_4  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[3] ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[4] )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE_3  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[3] )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE_2  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[1] ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE_1  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[0] ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[1] )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE_0  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_487 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[0] )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_DELAY_HELD_1  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [1]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_DELAY_HELD [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_DELAY_HELD_0  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [0]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_DELAY_HELD [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0_14  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n08331 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [14]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [14])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0_13  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n08331 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [13]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [13])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0_12  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n08331 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [12]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [12])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0_11  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n08331 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [11]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [11])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0_10  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n08331 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [10]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [10])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0_9  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n08331 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [9]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [9])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0_8  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n08331 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [8]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [8])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0_7  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n08331 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [7]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0_6  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n08331 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [6]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0_5  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n08331 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [5]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0_4  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n08331 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [4]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0_3  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n08331 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [3]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0_2  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n08331 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [2]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0_1  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n08331 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [1]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0_0  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n08331 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [0]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT_7  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1212_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<7> ),
    .R(NlwRenamedSig_OI_N1),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT_6  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1212_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<6> ),
    .R(NlwRenamedSig_OI_N1),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT_5  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1212_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<5> ),
    .R(NlwRenamedSig_OI_N1),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT_4  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1212_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<4> ),
    .R(NlwRenamedSig_OI_N1),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT_3  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1212_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<3> ),
    .R(NlwRenamedSig_OI_N1),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT_2  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1212_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<2> ),
    .R(NlwRenamedSig_OI_N1),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT_1  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1212_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<1> ),
    .R(NlwRenamedSig_OI_N1),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [1])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT_0  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1212_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<0> ),
    .S(NlwRenamedSig_OI_N1),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0_7  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_DATA_OUT [7]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0_6  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_DATA_OUT [6]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0_5  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_DATA_OUT [5]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0_4  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_DATA_OUT [4]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0_3  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_DATA_OUT [3]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0_2  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_DATA_OUT [2]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0_1  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_DATA_OUT [1]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0_0  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_DATA_OUT [0]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY_7  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .D(tx_ifg_delay[7]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY_6  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .D(tx_ifg_delay[6]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY_5  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .D(tx_ifg_delay[5]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY_4  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .D(tx_ifg_delay[4]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY_3  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .D(tx_ifg_delay[3]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY_2  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .D(tx_ifg_delay[2]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY_1  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .D(tx_ifg_delay[1]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY_0  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .D(tx_ifg_delay[0]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_31  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<31> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [31])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_30  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<30> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [30])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_29  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<29> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [29])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_28  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<28>_734 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [28])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_27  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<27> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [27])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_26  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<26>_732 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [26])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_25  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<25> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [25])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_24  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<24>_730 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [24])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_23  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<23> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [23])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_22  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<22> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [22])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_21  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<21> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [21])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_20  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<20> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [20])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_19  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<19> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [19])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_18  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<18>_724 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [18])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_17  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<17> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [17])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_16  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<16>_722 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [16])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_15  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<15> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [15])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_14  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<14>_720 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [14])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_13  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<13> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [13])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_12  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<12>_718 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [12])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_11  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<11> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [11])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_10  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<10> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [10])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_9  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<9> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [9])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_8  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<8> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [8])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_7  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<7>_713 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_6  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<6>_712 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_5  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<5> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_4  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<4>_710 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_3  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<3>_709 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_2  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<2>_708 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_1  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<1> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC_0  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<0> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_0  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<0> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_1  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<1> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_2  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<2>_815 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_3  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<3>_814 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_4  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<4>_813 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_5  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<5> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_6  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<6>_811 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_7  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<7>_810 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_8  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<8> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [8])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_9  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<9> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [9])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_10  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<10> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [10])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_11  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<11> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [11])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_12  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<12>_805 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [12])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_13  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<13> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [13])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_14  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<14>_803 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [14])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_15  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<15> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [15])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_16  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<16>_801 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [16])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_17  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<17> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [17])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_18  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<18>_799 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [18])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_19  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<19> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [19])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_20  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<20> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [20])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_21  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<21> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [21])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_22  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<22> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [22])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_23  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<23> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [23])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_24  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<24>_793 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [24])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_25  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<25> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [25])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_26  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<26>_791 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [26])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_27  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<27> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [27])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_28  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<28>_789 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [28])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_29  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<29> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [29])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_30  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<30> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [30])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC_31  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<31> ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [31])
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DELAY_RX_ERR  (
    .A0(N0),
    .A1(NlwRenamedSig_OI_N1),
    .A2(N0),
    .A3(NlwRenamedSig_OI_N1),
    .CE(N0),
    .CLK(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG1_886 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG5 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DELAY_RX_DV2  (
    .A0(NlwRenamedSig_OI_N1),
    .A1(N0),
    .A2(NlwRenamedSig_OI_N1),
    .A3(NlwRenamedSig_OI_N1),
    .CE(N0),
    .CLK(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG3_889 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG5 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DELAY_RX_DV1  (
    .A0(N0),
    .A1(NlwRenamedSig_OI_N1),
    .A2(NlwRenamedSig_OI_N1),
    .A3(NlwRenamedSig_OI_N1),
    .CE(N0),
    .CLK(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG1_890 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG2 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DELAY_RXD_BUS[0].DELAY_RXD  (
    .A0(N0),
    .A1(NlwRenamedSig_OI_N1),
    .A2(N0),
    .A3(NlwRenamedSig_OI_N1),
    .CE(N0),
    .CLK(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [0]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [0])
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DELAY_RXD_BUS[1].DELAY_RXD  (
    .A0(N0),
    .A1(NlwRenamedSig_OI_N1),
    .A2(N0),
    .A3(NlwRenamedSig_OI_N1),
    .CE(N0),
    .CLK(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [1]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [1])
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DELAY_RXD_BUS[2].DELAY_RXD  (
    .A0(N0),
    .A1(NlwRenamedSig_OI_N1),
    .A2(N0),
    .A3(NlwRenamedSig_OI_N1),
    .CE(N0),
    .CLK(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [2]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [2])
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DELAY_RXD_BUS[3].DELAY_RXD  (
    .A0(N0),
    .A1(NlwRenamedSig_OI_N1),
    .A2(N0),
    .A3(NlwRenamedSig_OI_N1),
    .CE(N0),
    .CLK(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [3]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [3])
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DELAY_RXD_BUS[4].DELAY_RXD  (
    .A0(N0),
    .A1(NlwRenamedSig_OI_N1),
    .A2(N0),
    .A3(NlwRenamedSig_OI_N1),
    .CE(N0),
    .CLK(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [4]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [4])
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DELAY_RXD_BUS[5].DELAY_RXD  (
    .A0(N0),
    .A1(NlwRenamedSig_OI_N1),
    .A2(N0),
    .A3(NlwRenamedSig_OI_N1),
    .CE(N0),
    .CLK(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [5]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [5])
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DELAY_RXD_BUS[6].DELAY_RXD  (
    .A0(N0),
    .A1(NlwRenamedSig_OI_N1),
    .A2(N0),
    .A3(NlwRenamedSig_OI_N1),
    .CE(N0),
    .CLK(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [6]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [6])
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DELAY_RXD_BUS[7].DELAY_RXD  (
    .A0(N0),
    .A1(NlwRenamedSig_OI_N1),
    .A2(N0),
    .A3(NlwRenamedSig_OI_N1),
    .CE(N0),
    .CLK(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [7]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [7])
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DELAY_BROADCASTADDRESSMATCH  (
    .A0(N0),
    .A1(NlwRenamedSig_OI_N1),
    .A2(N0),
    .A3(NlwRenamedSig_OI_N1),
    .CE(N0),
    .CLK(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcastaddressmatch_285 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/BROADCASTADDRESSMATCH_DELAY )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/BAD_FRAME_INT  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_SUCCESS_FRAME_FAILURE_MUX_880_o ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Reset_OR_DriverANDClockEnable1 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/BAD_FRAME_INT_322 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_FRAME_SUCCESS_MUX_879_o ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Reset_OR_DriverANDClockEnable1 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_24  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ALIGNMENT_ERR_REG_CRC_ERR_AND_318_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [24])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_23  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/LENGTH_TYPE_ERR_894 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [23])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_21  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/VLAN_FRAME_907 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [21])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_20  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/OUT_OF_BOUNDS_ERR_895 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [20])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_19  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CONTROL_FRAME_320 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [19])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_18  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [13]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [18])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_17  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [12]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [17])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_16  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [11]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [16])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_15  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [10]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [15])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_14  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [9]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [14])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_13  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [8]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [13])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_12  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [7]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [12])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_11  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [6]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [11])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_10  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [5]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [10])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_9  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [4]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [9])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_8  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [3]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [8])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_7  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [2]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_6  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [1]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_5  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [0]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_4  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/MULTICAST_FRAME_906 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_3  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/BROADCASTADDRESSMATCH_DELAY ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_2  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/CRC_ERR_ALIGNMENT_ERR_REG_AND_317_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_1  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/BAD_FRAME_892 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_0  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/GOOD_FRAME_893 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VALID  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/STATISTICS_VALID_897 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VALID_265 )
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ALIGNMENT_ERR_REG  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(NlwRenamedSig_OI_N1),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ALIGNMENT_ERR_REG_891 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_7  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8 [7]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_6  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8 [6]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_5  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8 [5]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_4  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8 [4]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_3  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8 [3]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_2  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8 [2]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_1  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8 [1]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_0  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8 [0]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG7  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG6_888 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG7_887 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8_7  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8 [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8_6  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [6]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8 [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8_5  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [5]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8 [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8_4  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [4]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8 [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8_3  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8 [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8_2  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [2]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8 [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8_1  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [1]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8 [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8_0  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG8 [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG6  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG5 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG6_888 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7_7  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [7]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7_6  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [6]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7_5  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [5]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7_4  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [4]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7_3  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [3]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7_2  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [2]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7_1  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [1]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7_0  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [0]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG7  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG6_885 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG7_884 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6_7  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [7]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6_6  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [6]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6_5  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [5]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6_4  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [4]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6_3  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [3]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6_2  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [2]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6_1  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [1]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6_0  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [0]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG6  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG5 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG6_885 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG3  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG2 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG3_889 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD_14  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<14> ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [14])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD_13  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<13> ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [13])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD_12  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<12> ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [12])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD_11  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<11> ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [11])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD_10  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<10> ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [10])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD_9  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<9> ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [9])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD_8  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<8> ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [8])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD_7  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<7> ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [7])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD_6  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<6> ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [6])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD_5  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<5> ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD_4  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<4> ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [4])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD_3  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<3> ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [3])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD_2  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<2> ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [2])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD_1  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<1> ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD_0  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<0> ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FALSE_CARR_FLAG  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/PRE_FALSE_CARR_FLAG ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FALSE_CARR_FLAG_849 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/IFG_FLAG  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/PRE_IFG_FLAG ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/IFG_FLAG_850 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/SFD_FLAG  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/PWR_44_o_RX_ERR_REG6_AND_322_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/SFD_FLAG_852 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_ENABLE_HELD  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .D(rx_mac_config_vector[14]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_ENABLE_HELD_853 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/EXTENSION_FLAG  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_RX_DV_REG6_AND_324_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/EXTENSION_FLAG_851 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/PAUSE_LT_CHECK_HELD  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .D(rx_mac_config_vector[9]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/PAUSE_LT_CHECK_HELD_854 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/LT_CHECK_HELD  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .D(rx_mac_config_vector[8]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/LT_CHECK_HELD_855 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/CRC_MODE_HELD  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .D(rx_mac_config_vector[3]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/CRC_MODE_HELD_856 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/VLAN_ENABLE_HELD  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .D(rx_mac_config_vector[2]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/VLAN_ENABLE_HELD_857 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(rx_mac_config_vector[1]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/JUMBO_FRAMES_HELD  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .D(rx_mac_config_vector[4]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/JUMBO_FRAMES_HELD_858 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG1  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(gmii_rx_er),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG1_886 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG1  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(gmii_rx_dv),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG1_890 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1_7  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(gmii_rxd[7]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1_6  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(gmii_rxd[6]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1_5  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(gmii_rxd[5]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1_4  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(gmii_rxd[4]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1_3  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(gmii_rxd[3]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1_2  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(gmii_rxd[2]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1_1  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(gmii_rxd[1]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1_0  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(gmii_rxd[0]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL_5  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL[4]_GND_45_o_MUX_695_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL_4  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL[3]_GND_45_o_MUX_696_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL_3  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL[2]_GND_45_o_MUX_697_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL_2  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL[1]_GND_45_o_MUX_698_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL_1  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/GND_45_o_FIELD_CONTROL[0]_MUX_693_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [1])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL_0  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PWR_47_o_FIELD_CONTROL[5]_MUX_694_o ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/CRC_FIELD  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/CRC_FIELD_END_DATA_OR_205_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/CRC_FIELD_943 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/DAT_FIELD  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/RX_DV_REG6_DAT_FIELD_AND_353_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/DAT_FIELD_944 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/LEN_FIELD  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/RX_DV_REG6_LEN_FIELD_AND_350_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/LEN_FIELD_945 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/DEST_ADDRESS_FIELD  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/RX_DV_REG6_DEST_ADDRESS_FIELD_AND_344_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/DEST_ADDRESS_FIELD_947 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_EXT  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/RX_ERR_REG5_END_EXT_AND_333_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_EXT_996 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/RX_DV_REG6_RX_ERR_REG6_OR_198_o_984 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 )
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_xor<10>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<9>_998 ),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_xor<10>_rt_1819 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result [10])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_xor<9>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<8>_999 ),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<9>_rt_1796 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result [9])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<9>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<8>_999 ),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<9>_rt_1796 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<9>_998 )
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_xor<8>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<7>_1000 ),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<8>_rt_1797 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result [8])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<8>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<7>_1000 ),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<8>_rt_1797 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<8>_999 )
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_xor<7>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<6>_1001 ),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<7>_rt_1798 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result [7])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<7>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<6>_1001 ),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<7>_rt_1798 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<7>_1000 )
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_xor<6>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<5>_1002 ),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<6>_rt_1799 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result [6])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<6>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<5>_1002 ),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<6>_rt_1799 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<6>_1001 )
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_xor<5>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<4>_1003 ),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<5>_rt_1800 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result [5])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<5>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<4>_1003 ),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<5>_rt_1800 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<5>_1002 )
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_xor<4>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<3>_1004 ),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<4>_rt_1801 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result [4])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<4>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<3>_1004 ),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<4>_rt_1801 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<4>_1003 )
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_xor<3>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<2>_1005 ),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<3>_rt_1802 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result [3])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<3>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<2>_1005 ),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<3>_rt_1802 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<3>_1004 )
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_xor<2>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<1>_1006 ),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<2>_rt_1803 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result [2])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<2>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<1>_1006 ),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<2>_rt_1803 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<2>_1005 )
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_xor<1>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<0>_1007 ),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<1>_rt_1804 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result [1])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<1>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<0>_1007 ),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<1>_rt_1804 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<1>_1006 )
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_xor<0>  (
    .CI(NlwRenamedSig_OI_N1),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_lut<0> ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result [0])
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<0>  (
    .CI(NlwRenamedSig_OI_N1),
    .DI(N0),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_lut<0> ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<0>_1007 )
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_xor<14>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [13]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_xor<14>_rt_1820 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<14>1 )
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_xor<13>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [12]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<13>_rt_1805 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<13>1 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<13>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [12]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<13>_rt_1805 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [13])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_xor<12>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [11]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<12>_rt_1806 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<12>1 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<12>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [11]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<12>_rt_1806 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [12])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_xor<11>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [10]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<11>_rt_1807 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<11>1 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<11>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [10]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<11>_rt_1807 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [11])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_xor<10>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [9]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<10>_rt_1808 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<10>1 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<10>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [9]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<10>_rt_1808 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [10])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_xor<9>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [8]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<9>_rt_1809 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<9>1 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<9>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [8]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<9>_rt_1809 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [9])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_xor<8>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [7]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<8>_rt_1810 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<8>1 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<8>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [7]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<8>_rt_1810 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [8])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_xor<7>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [6]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<7>_rt_1811 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<7>1 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<7>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [6]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<7>_rt_1811 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [7])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_xor<6>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [5]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<6>_rt_1812 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<6>1 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<6>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [5]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<6>_rt_1812 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [6])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_xor<5>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [4]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<5>_rt_1813 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<5>1 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<5>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [4]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<5>_rt_1813 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [5])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_xor<4>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [3]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<4>_rt_1814 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<4>1 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<4>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [3]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<4>_rt_1814 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [4])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_xor<3>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [2]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<3>_rt_1815 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<3>1 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<3>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [2]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<3>_rt_1815 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [3])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_xor<2>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [1]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<2>_rt_1816 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<2>1 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<2>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [1]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<2>_rt_1816 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [2])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_xor<1>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [0]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<1>_rt_1817 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<1>1 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<1>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [0]),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<1>_rt_1817 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [1])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_xor<0>  (
    .CI(NlwRenamedSig_OI_N1),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_lut [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<0>1 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<0>  (
    .CI(NlwRenamedSig_OI_N1),
    .DI(N0),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_lut [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy [0])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0>_0  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0404_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result [0]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER_13  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<13>1 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [13])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER_12  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<12>1 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [12])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER_14  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<14>1 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [14])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER_10  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<10>1 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [10])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER_9  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<9>1 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [9])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER_11  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<11>1 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [11])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER_7  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<7>1 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER_6  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<6>1 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER_8  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<8>1 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [8])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER_5  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<5>1 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER_4  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<4>1 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER_3  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<3>1 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER_2  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<2>1 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER_0  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<0>1 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER_1  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result<1>1 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0>_9  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0404_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result [9]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [9])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0>_8  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0404_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result [8]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0>_10  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0404_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result [10]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [10])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0>_7  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0404_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result [7]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0>_6  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0404_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result [6]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0>_5  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0404_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result [5]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0>_4  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0404_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result [4]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0>_2  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0404_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result [2]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0>_1  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0404_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result [1]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0>_3  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0404_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Result [3]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/VLAN_FRAME  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/VLAN_MATCH [1]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/VLAN_FRAME_907 )
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE_10  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0387_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<10> ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [10])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE_9  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0387_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<9> ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [9])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE_8  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0387_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<8> ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [8])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE_7  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0387_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<7> ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [7])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE_6  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0387_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<6> ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [6])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE_5  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0387_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<5> ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [5])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE_4  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0387_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<4> ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [4])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE_3  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0387_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<3> ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [3])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE_2  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0387_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<2> ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [2])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE_1  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0387_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<1> ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [1])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE_0  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0387_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<0> ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/VLAN_MATCH_1  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/VLAN_MATCH[1]_GND_46_o_MUX_826_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/VLAN_MATCH [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/VLAN_MATCH_0  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/VLAN_ENABLE_PWR_48_o_AND_410_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/VLAN_MATCH [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/ADD_CONTROL_FRAME  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/ADD_CONTROL_FRAME_INT_1106 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/ADD_CONTROL_FRAME_321 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CONTROL_FRAME  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CONTROL_FRAME_INT_1089 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CONTROL_FRAME_320 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/MULTICAST_FRAME  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/MULTICAST_MATCH_1090 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/MULTICAST_FRAME_906 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/ADD_CONTROL_FRAME_INT  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/ADD_CONTROL_ENABLE_1091 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/ADD_CONTROL_FRAME_INT_1106 )
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH_13  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [13]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [13])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH_12  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [12]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [12])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH_11  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [11]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [11])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH_10  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [10]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [10])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH_9  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [9]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [9])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH_8  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [8]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [8])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH_7  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [7]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [7])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH_6  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [6]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [6])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH_5  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [5]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [5])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH_4  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [4]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [4])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH_3  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [3]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [3])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH_2  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [2]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [2])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH_1  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [1]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [1])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH_0  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [0]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/STATISTICS_LENGTH [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/SFD_FLAG_CRC_COMPUTE_OR_217_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG7_887 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_1105 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CONTROL_MATCH  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/PWR_48_o_RXD[7]_equal_15_o ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CONTROL_MATCH_1107 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_NO_FCS  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/SFD_FLAG_DATA_NO_FCS_OR_232_o_1069 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_NO_FCS_1108 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_VALID  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_NO_FCS_DATA_WITH_FCS_MUX_790_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_VALID_910 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_ONE  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_LT_CHECK_DISABLE_AND_371_o_1072 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_ONE_1110 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_ZERO  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_LT_CHECK_DISABLE_AND_375_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_ZERO_1111 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LESS_THAN_256  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/GND_46_o_RXD[7]_equal_9_o ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LESS_THAN_256_1112 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/OUT_OF_BOUNDS_ERR  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/MAX_LENGTH_ERR_1121 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/OUT_OF_BOUNDS_ERR_895 )
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/INHIBIT_FRAME  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/END_OF_FRAME_SFD_FLAG_AND_418_o ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/INHIBIT_FRAME_1122 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/CRC_ERR  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FCS_ERR_CRC_ENGINE_ERR_OR_268_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/CRC_ERR_896 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FCS_ERR  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FCS_ERR_EXTENSION_FIELD_OR_256_o ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FCS_ERR_1123 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FRAME_LEN_ERR  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FRAME_LEN_ERR_END_OF_DATA_OR_242_o ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FRAME_LEN_ERR_1125 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/MIN_LENGTH_MATCH  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/GND_47_o_FRAME_COUNTER[7]_equal_1_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/MIN_LENGTH_MATCH_1127 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/EXCEEDED_MIN_LEN  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/MIN_LENGTH_MATCH_EXCEEDED_MIN_LEN_OR_236_o ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/EXCEEDED_MIN_LEN_1126 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd2  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_GND_25_o_equal_75_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd2_1142 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd4  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_PWR_24_o_equal_77_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd4_1148 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd5  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_GND_25_o_equal_74_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd5_1150 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd3  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd3-In ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd3_1143 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd6  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd6-In ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd6_1144 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd7  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd7-In_1132 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd7_1149 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd9  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_GND_25_o_equal_30_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd9_1129 )
  );
  FDS   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd10  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_tx_enable_reg_AND_28_o ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd10_1147 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd8  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_GND_25_o_equal_73_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd8_1145 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_7  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/_n0280_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<7> ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_6  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/_n0280_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<6> ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_5  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/_n0280_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<5> ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_4  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/_n0280_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<4> ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_3  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/_n0280_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<3> ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_2  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/_n0280_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<2> ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_1  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/_n0280_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<1> ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_0  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/_n0280_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<0> ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data [0])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_mac_tready_reg  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_mac_tready_reg_1160 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/gate_tready  (
    .C(tx_axi_clk),
    .D(N0),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/gate_tready_1162 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold_7  (
    .C(tx_axi_clk),
    .CE(NlwRenamedSig_OI_tx_axis_mac_tready),
    .D(tx_axis_mac_tdata[7]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold_6  (
    .C(tx_axi_clk),
    .CE(NlwRenamedSig_OI_tx_axis_mac_tready),
    .D(tx_axis_mac_tdata[6]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold_5  (
    .C(tx_axi_clk),
    .CE(NlwRenamedSig_OI_tx_axis_mac_tready),
    .D(tx_axis_mac_tdata[5]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold_4  (
    .C(tx_axi_clk),
    .CE(NlwRenamedSig_OI_tx_axis_mac_tready),
    .D(tx_axis_mac_tdata[4]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold_3  (
    .C(tx_axi_clk),
    .CE(NlwRenamedSig_OI_tx_axis_mac_tready),
    .D(tx_axis_mac_tdata[3]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold_2  (
    .C(tx_axi_clk),
    .CE(NlwRenamedSig_OI_tx_axis_mac_tready),
    .D(tx_axis_mac_tdata[2]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold_1  (
    .C(tx_axi_clk),
    .CE(NlwRenamedSig_OI_tx_axis_mac_tready),
    .D(tx_axis_mac_tdata[1]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold_0  (
    .C(tx_axi_clk),
    .CE(NlwRenamedSig_OI_tx_axis_mac_tready),
    .D(tx_axis_mac_tdata[0]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_rx_enable/data_sync  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_rx_enable/data_in ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_rx_enable/data_sync1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_rx_enable/data_sync_reg  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_rx_enable/data_sync1 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_rx_enable/data_sync2 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_rx_duplex/data_sync  (
    .C(rx_axi_clk),
    .D(NlwRenamedSig_OI_N1),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_rx_duplex/data_sync1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_rx_duplex/data_sync_reg  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_rx_duplex/data_sync1 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_rx_duplex/data_sync2 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_tx_enable/data_sync  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_tx_enable/data_in ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_tx_enable/data_sync1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_tx_enable/data_sync_reg  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_tx_enable/data_sync1 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_tx_enable/data_sync2 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_tx_duplex/data_sync  (
    .C(tx_axi_clk),
    .D(NlwRenamedSig_OI_N1),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_tx_duplex/data_sync1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_tx_duplex/data_sync_reg  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_tx_duplex/data_sync1 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_tx_duplex/data_sync2 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_BAD_FRAME_INT  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_BAD_FRAME_COMB ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_BAD_FRAME_INT_292 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_GOOD_FRAME_INT  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_GOOD_FRAME_COMB ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_GOOD_FRAME_INT_293 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_UNDERRUN_INT  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_underrun_310 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_UNDERRUN_INT_1184 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_VALID_INT  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_FINAL_324 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_VALID_INT_291 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT_7  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [7]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT_6  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [6]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT_5  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [5]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT_4  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [4]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT_3  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [3]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT_2  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [2]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT_1  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [1]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT_0  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [0]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT_7  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data [7]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT_6  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data [6]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT_5  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data [5]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT_4  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data [4]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT_3  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data [3]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT_2  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data [2]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT_1  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data [1]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT_0  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data [0]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT_0  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0127_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Result [0]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT_4  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0127_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Result [4]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT_3  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0127_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Result [3]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT_1  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0127_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Result [1]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT_2  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0127_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Result [2]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE_15  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0123_inv1 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [0]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [15])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE_14  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0123_inv1 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [1]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [14])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE_13  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0123_inv1 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [2]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [13])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE_12  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0123_inv1 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [3]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [12])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE_11  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0123_inv1 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [4]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [11])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE_10  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0123_inv1 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [5]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [10])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE_9  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0123_inv1 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [6]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [9])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE_8  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0123_inv1 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [7]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [8])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE_7  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0123_inv1 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [8]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE_6  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0123_inv1 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [9]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE_5  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0123_inv1 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [10]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE_4  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0123_inv1 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [11]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE_3  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0123_inv1 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [12]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE_2  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0123_inv1 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [13]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE_1  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0123_inv1 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [14]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE_0  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0123_inv1 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [15]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY_7  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0100_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [7]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY_6  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0100_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [6]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY_5  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0100_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [5]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY_4  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0100_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [4]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY_3  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0100_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [3]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY_2  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0100_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [2]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY_1  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0100_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [1]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY_0  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0100_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [0]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY [0])
  );
  MUXF5   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_ACK_OUT  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_ACK_IN ),
    .I1(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_COMB )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT_3  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0200_inv_1285 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Result [3]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mcount_DATA_COUNT_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT_2  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0200_inv_1285 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Result [2]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mcount_DATA_COUNT_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [2])
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd1  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd1-In_1287 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd1_1332 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2-In ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2_1286 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL_7  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<7> ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL_6  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<6> ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL_5  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<5> ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL_4  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<4> ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL_3  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<3> ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL_2  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<2> ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL_1  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<1> ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL_0  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<0> ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_CONTROL  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_Mux_26_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_CONTROL_1321 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_OUT  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_COMB ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_OUT_287 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE_7  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0183_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [7]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE_6  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0183_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [6]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE_5  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0183_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [5]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE_4  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0183_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [4]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE_3  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0183_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [3]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE_2  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0183_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [2]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE_1  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0183_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [1]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE_0  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0183_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [0]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE [0])
  );
  FDSE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/END_OF_TX_REG  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/END_OF_TX_INV_38_o ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/END_OF_TX_REG_1312 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_INT  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_ACK_IN ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_INT_1330 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_IN_REG  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_valid_311 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_IN_REG_1331 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD_15  (
    .C(tx_axi_clk),
    .CE(pause_req),
    .D(pause_val[15]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [15])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD_14  (
    .C(tx_axi_clk),
    .CE(pause_req),
    .D(pause_val[14]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [14])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD_13  (
    .C(tx_axi_clk),
    .CE(pause_req),
    .D(pause_val[13]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [13])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD_12  (
    .C(tx_axi_clk),
    .CE(pause_req),
    .D(pause_val[12]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [12])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD_11  (
    .C(tx_axi_clk),
    .CE(pause_req),
    .D(pause_val[11]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [11])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD_10  (
    .C(tx_axi_clk),
    .CE(pause_req),
    .D(pause_val[10]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [10])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD_9  (
    .C(tx_axi_clk),
    .CE(pause_req),
    .D(pause_val[9]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [9])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD_8  (
    .C(tx_axi_clk),
    .CE(pause_req),
    .D(pause_val[8]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [8])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD_7  (
    .C(tx_axi_clk),
    .CE(pause_req),
    .D(pause_val[7]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD_6  (
    .C(tx_axi_clk),
    .CE(pause_req),
    .D(pause_val[6]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD_5  (
    .C(tx_axi_clk),
    .CE(pause_req),
    .D(pause_val[5]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD_4  (
    .C(tx_axi_clk),
    .CE(pause_req),
    .D(pause_val[4]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD_3  (
    .C(tx_axi_clk),
    .CE(pause_req),
    .D(pause_val[3]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD_2  (
    .C(tx_axi_clk),
    .CE(pause_req),
    .D(pause_val[2]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD_1  (
    .C(tx_axi_clk),
    .CE(pause_req),
    .D(pause_val[1]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD_0  (
    .C(tx_axi_clk),
    .CE(pause_req),
    .D(pause_val[0]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_47  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[79]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [47])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_46  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[78]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [46])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_45  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[77]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [45])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_44  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[76]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [44])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_43  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[75]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [43])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_42  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[74]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [42])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_41  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[73]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [41])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_40  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[72]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [40])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_39  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[71]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [39])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_38  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[70]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [38])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_37  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[69]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [37])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_36  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[68]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [36])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_35  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[67]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [35])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_34  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[66]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [34])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_33  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[65]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [33])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_32  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[64]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [32])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_31  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[63]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [31])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_30  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[62]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [30])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_29  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[61]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [29])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_28  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[60]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [28])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_27  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[59]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [27])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_26  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[58]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [26])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_25  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[57]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [25])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_24  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[56]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [24])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_23  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[55]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [23])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_22  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[54]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [22])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_21  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[53]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [21])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_20  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[52]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [20])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_19  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[51]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [19])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_18  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[50]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [18])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_17  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[49]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [17])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_16  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[48]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [16])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_15  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[47]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [15])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_14  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[46]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [14])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_13  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[45]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [13])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_12  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[44]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [12])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_11  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[43]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [11])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_10  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[42]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [10])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_9  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[41]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [9])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_8  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[40]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [8])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_7  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[39]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_6  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[38]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_5  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[37]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_4  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[36]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_3  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[35]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_2  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[34]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_1  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[33]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD_0  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv ),
    .D(tx_mac_config_vector[32]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/GOOD_FRAME_IN3  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/GOOD_FRAME_IN2_1400 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/GOOD_FRAME_IN3_1399 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/GOOD_FRAME_IN2  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/GOOD_FRAME_IN1_1398 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/GOOD_FRAME_IN2_1400 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_REQ_TO_TX  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/PAUSE_REQ_LOCAL ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_REQ_TO_TX_1192 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/GOOD_FRAME_TO_TX  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/GOOD_FRAME_IN1_GOOD_FRAME_IN3_OR_86_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_in )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/GOOD_FRAME_IN1  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/GOOD_FRAME_IN1_1398 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX_15  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [15]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [15])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX_14  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [14]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [14])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX_13  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [13]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [13])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX_12  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [12]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [12])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX_11  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [11]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [11])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX_10  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [10]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [10])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX_9  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [9]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [9])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX_8  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [8]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [8])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX_7  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [7]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX_6  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [6]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX_5  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [5]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX_4  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [4]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX_3  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [3]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX_2  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [2]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX_1  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [1]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX_0  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [0]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA_5  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA5 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA_4  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA4 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA_3  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA3 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA_2  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA2 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA_1  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA1 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA_0  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT_15  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/_n0068_inv_1449 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT15 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [15])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT_14  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/_n0068_inv_1449 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT14 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [14])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT_13  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/_n0068_inv_1449 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT13 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [13])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT_12  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/_n0068_inv_1449 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT12 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [12])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT_11  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/_n0068_inv_1449 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT11 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [11])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT_10  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/_n0068_inv_1449 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT10 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [10])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT_9  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/_n0068_inv_1449 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT9 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [9])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT_8  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/_n0068_inv_1449 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT8 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [8])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT_7  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/_n0068_inv_1449 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT7 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [7])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT_6  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/_n0068_inv_1449 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT6 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [6])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT_5  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/_n0068_inv_1449 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT5 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT_4  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/_n0068_inv_1449 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT4 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT_3  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/_n0068_inv_1449 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT3 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT_2  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/_n0068_inv_1449 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT2 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT_1  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/_n0068_inv_1449 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT1 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT_0  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/_n0068_inv_1449 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [0])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_xor<15>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [14]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [15]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT15 )
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_xor<14>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [13]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT14 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy<14>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [13]),
    .DI(N0),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [14])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_xor<13>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [12]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [13]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT13 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy<13>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [12]),
    .DI(N0),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [13]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [13])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_xor<12>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [11]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [12]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT12 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy<12>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [11]),
    .DI(N0),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [12]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [12])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_xor<11>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [10]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [11]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT11 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy<11>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [10]),
    .DI(N0),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [11]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [11])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_xor<10>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [9]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [10]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT10 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy<10>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [9]),
    .DI(N0),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [10]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [10])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_xor<9>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [8]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [9]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT9 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy<9>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [8]),
    .DI(N0),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [9]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [9])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_xor<8>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [7]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [8]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT8 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy<8>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [7]),
    .DI(N0),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [8]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [8])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_xor<7>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [6]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [7]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT7 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy<7>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [6]),
    .DI(N0),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [7]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [7])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_xor<6>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [5]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [6]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT6 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy<6>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [5]),
    .DI(N0),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [6]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [6])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_xor<5>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [4]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT5 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy<5>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [4]),
    .DI(N0),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [5])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_xor<4>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [3]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [4]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT4 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy<4>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [3]),
    .DI(N0),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [4]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [4])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_xor<3>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [2]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [3]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT3 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy<3>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [2]),
    .DI(N0),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [3]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [3])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_xor<2>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [1]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT2 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy<2>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [1]),
    .DI(N0),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [2])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_xor<1>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [0]),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT1 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy<1>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [0]),
    .DI(N0),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [1])
  );
  XORCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_xor<0>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mmux_COUNT_SET_GND_31_o_MUX_237_o12_1401 ),
    .LI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy<0>  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mmux_COUNT_SET_GND_31_o_MUX_237_o12_1401 ),
    .DI(N0),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_cy [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_in ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync_reg  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync1 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync2 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/COUNT_SET_REG  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/COUNT_SET_1187 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/COUNT_SET_REG_1465 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/GOOD_FRAME_IN_TX_REG  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync2 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/GOOD_FRAME_IN_TX_REG_1458 )
  );
  LUT3 #(
    .INIT ( 8'h06 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_address[7].LUT3_special_pause_inst  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter_0_1_1907 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_addr_lut [7])
  );
  LUT3 #(
    .INIT ( 8'h04 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_address[6].LUT3_special_pause_inst  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_addr_lut [6])
  );
  LUT3 #(
    .INIT ( 8'h00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_address[5].LUT3_special_pause_inst  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_addr_lut [5])
  );
  LUT3 #(
    .INIT ( 8'h00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_address[4].LUT3_special_pause_inst  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_addr_lut [4])
  );
  LUT3 #(
    .INIT ( 8'h00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_address[3].LUT3_special_pause_inst  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_addr_lut [3])
  );
  LUT3 #(
    .INIT ( 8'h00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_address[2].LUT3_special_pause_inst  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_addr_lut [2])
  );
  LUT3 #(
    .INIT ( 8'h04 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_address[1].LUT3_special_pause_inst  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter_0_1_1907 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter_1_1_1906 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter_2_1_1908 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_addr_lut [1])
  );
  LUT3 #(
    .INIT ( 8'h21 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_address[0].LUT3_special_pause_inst  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_addr_lut [0])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/delay_rx_data_valid  (
    .A0(N0),
    .A1(NlwRenamedSig_OI_N1),
    .A2(N0),
    .A3(NlwRenamedSig_OI_N1),
    .CE(N0),
    .CLK(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/DATA_VALID_EARLY ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_srl16 ),
    .Q15(\NLW_U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/delay_rx_data_valid_Q15_UNCONNECTED )
  );
  RAM64X1D #(
    .INIT ( 64'h0000000000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[7].header_field_dist_ram  (
    .A0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [0]),
    .A1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [1]),
    .A2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [2]),
    .A3(NlwRenamedSig_OI_N1),
    .A4(NlwRenamedSig_OI_N1),
    .A5(NlwRenamedSig_OI_N1),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data [7]),
    .DPRA0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [0]),
    .DPRA1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [1]),
    .DPRA2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [2]),
    .DPRA3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [3]),
    .DPRA4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [4]),
    .DPRA5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [5]),
    .WCLK(rx_axi_clk),
    .WE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_1537 ),
    .SPO(\NLW_U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[7].header_field_dist_ram_SPO_UNCONNECTED ),
    .DPO(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/expected_pause_data [7])
  );
  RAM64X1D #(
    .INIT ( 64'h0000000000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[6].header_field_dist_ram  (
    .A0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [0]),
    .A1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [1]),
    .A2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [2]),
    .A3(NlwRenamedSig_OI_N1),
    .A4(NlwRenamedSig_OI_N1),
    .A5(NlwRenamedSig_OI_N1),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data [6]),
    .DPRA0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [0]),
    .DPRA1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [1]),
    .DPRA2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [2]),
    .DPRA3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [3]),
    .DPRA4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [4]),
    .DPRA5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [5]),
    .WCLK(rx_axi_clk),
    .WE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_1537 ),
    .SPO(\NLW_U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[6].header_field_dist_ram_SPO_UNCONNECTED ),
    .DPO(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/expected_pause_data [6])
  );
  RAM64X1D #(
    .INIT ( 64'h0000000000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[5].header_field_dist_ram  (
    .A0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [0]),
    .A1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [1]),
    .A2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [2]),
    .A3(NlwRenamedSig_OI_N1),
    .A4(NlwRenamedSig_OI_N1),
    .A5(NlwRenamedSig_OI_N1),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data [5]),
    .DPRA0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [0]),
    .DPRA1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [1]),
    .DPRA2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [2]),
    .DPRA3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [3]),
    .DPRA4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [4]),
    .DPRA5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [5]),
    .WCLK(rx_axi_clk),
    .WE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_1537 ),
    .SPO(\NLW_U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[5].header_field_dist_ram_SPO_UNCONNECTED ),
    .DPO(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/expected_pause_data [5])
  );
  RAM64X1D #(
    .INIT ( 64'h0000000000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[4].header_field_dist_ram  (
    .A0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [0]),
    .A1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [1]),
    .A2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [2]),
    .A3(NlwRenamedSig_OI_N1),
    .A4(NlwRenamedSig_OI_N1),
    .A5(NlwRenamedSig_OI_N1),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data [4]),
    .DPRA0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [0]),
    .DPRA1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [1]),
    .DPRA2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [2]),
    .DPRA3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [3]),
    .DPRA4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [4]),
    .DPRA5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [5]),
    .WCLK(rx_axi_clk),
    .WE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_1537 ),
    .SPO(\NLW_U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[4].header_field_dist_ram_SPO_UNCONNECTED ),
    .DPO(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/expected_pause_data [4])
  );
  RAM64X1D #(
    .INIT ( 64'h0000000000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[3].header_field_dist_ram  (
    .A0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [0]),
    .A1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [1]),
    .A2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [2]),
    .A3(NlwRenamedSig_OI_N1),
    .A4(NlwRenamedSig_OI_N1),
    .A5(NlwRenamedSig_OI_N1),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data [3]),
    .DPRA0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [0]),
    .DPRA1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [1]),
    .DPRA2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [2]),
    .DPRA3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [3]),
    .DPRA4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [4]),
    .DPRA5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [5]),
    .WCLK(rx_axi_clk),
    .WE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_1537 ),
    .SPO(\NLW_U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[3].header_field_dist_ram_SPO_UNCONNECTED ),
    .DPO(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/expected_pause_data [3])
  );
  RAM64X1D #(
    .INIT ( 64'h0000000000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[2].header_field_dist_ram  (
    .A0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [0]),
    .A1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [1]),
    .A2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [2]),
    .A3(NlwRenamedSig_OI_N1),
    .A4(NlwRenamedSig_OI_N1),
    .A5(NlwRenamedSig_OI_N1),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data [2]),
    .DPRA0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [0]),
    .DPRA1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [1]),
    .DPRA2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [2]),
    .DPRA3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [3]),
    .DPRA4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [4]),
    .DPRA5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [5]),
    .WCLK(rx_axi_clk),
    .WE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_1537 ),
    .SPO(\NLW_U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[2].header_field_dist_ram_SPO_UNCONNECTED ),
    .DPO(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/expected_pause_data [2])
  );
  RAM64X1D #(
    .INIT ( 64'h0000000000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[1].header_field_dist_ram  (
    .A0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [0]),
    .A1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [1]),
    .A2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [2]),
    .A3(NlwRenamedSig_OI_N1),
    .A4(NlwRenamedSig_OI_N1),
    .A5(NlwRenamedSig_OI_N1),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data [1]),
    .DPRA0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [0]),
    .DPRA1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [1]),
    .DPRA2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [2]),
    .DPRA3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [3]),
    .DPRA4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [4]),
    .DPRA5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [5]),
    .WCLK(rx_axi_clk),
    .WE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_1537 ),
    .SPO(\NLW_U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[1].header_field_dist_ram_SPO_UNCONNECTED ),
    .DPO(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/expected_pause_data [1])
  );
  RAM64X1D #(
    .INIT ( 64'h0000000000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[0].header_field_dist_ram  (
    .A0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [0]),
    .A1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [1]),
    .A2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [2]),
    .A3(NlwRenamedSig_OI_N1),
    .A4(NlwRenamedSig_OI_N1),
    .A5(NlwRenamedSig_OI_N1),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data [0]),
    .DPRA0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [0]),
    .DPRA1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [1]),
    .DPRA2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [2]),
    .DPRA3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [3]),
    .DPRA4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [4]),
    .DPRA5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [5]),
    .WCLK(rx_axi_clk),
    .WE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_1537 ),
    .SPO(\NLW_U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/byte_wide_ram[0].header_field_dist_ram_SPO_UNCONNECTED ),
    .DPO(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/expected_pause_data [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_2  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_PWR_52_o_LessThan_17_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result<2>1 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_load_count_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_0  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_PWR_52_o_LessThan_17_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result<0>1 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_load_count_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter_0  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/_n0301_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result [0]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_counter_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_1  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_PWR_52_o_LessThan_17_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result<1>1 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_load_count_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [1])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter_5  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/_n0301_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result [5]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_counter_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [5])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter_4  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/_n0301_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result [4]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_counter_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [4])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter_3  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/_n0301_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result [3]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_counter_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [3])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter_2  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/_n0301_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result [2]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_counter_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [2])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter_1  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/_n0301_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result [1]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_counter_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/sync_update/data_sync  (
    .C(rx_axi_clk),
    .D(NlwRenamedSig_OI_N1),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/sync_update/data_sync1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/sync_update/data_sync_reg  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/sync_update/data_sync1 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/sync_update/data_sync2 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/resync_promiscuous_mode/data_sync  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/resync_promiscuous_mode/data_in ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/resync_promiscuous_mode/data_sync1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/resync_promiscuous_mode/data_sync_reg  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/resync_promiscuous_mode/data_sync1 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/resync_promiscuous_mode/data_sync2 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pauseaddressmatch  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pauseaddressmatch_int_1529 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pauseaddressmatch_284 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pauseaddressmatch_int  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter[5]_GND_50_o_equal_14_o1 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_1533 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pauseaddressmatch_int_1529 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_reg  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_reg_rx_data[7]_MUX_958_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_reg_1545 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/specialpauseaddressmatch  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/specialpauseaddressmatch_int_1528 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/specialpauseaddressmatch_283 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/specialpauseaddressmatch_int  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter[5]_GND_50_o_equal_14_o1 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_1532 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/specialpauseaddressmatch_int_1528 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe[2]_PWR_52_o_LessThan_20_o ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_load_count_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_1537 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_reg  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_comb ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_reg_1544 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcastaddressmatch  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcastaddressmatch_int_1530 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcastaddressmatch_285 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data_7  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<7> ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data [7])
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data_6  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<6> ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data [6])
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data_5  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<5> ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data [5])
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data_4  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<4> ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data [4])
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data_3  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<3> ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data [3])
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data_2  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<2> ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data [2])
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data_1  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<1> ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data [1])
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data_0  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<0> ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_wr_data [0])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcastaddressmatch_int  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter[5]_GND_50_o_equal_14_o1 ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcast_match_1534 ),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Reset_OR_DriverANDClockEnable ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcastaddressmatch_int_1530 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe_2  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [2]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_load_count_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [2])
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe_1  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [1]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_load_count_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [1])
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe_0  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [0]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_load_count_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [0])
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_srl16_reg2  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_srl16_reg1_1543 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_srl16_reg2_1542 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_srl16_reg1  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_srl16 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_srl16_reg1_1543 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_reg2  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_reg1_1541 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_reg2_1547 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_reg1  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/DATA_VALID_EARLY ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_reg1_1541 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcast_byte_match  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcast_byte_match_rx_data[7]_MUX_938_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcast_byte_match_1546 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd2  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd2-In ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd2_1569 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/fsmfake0_0  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/next_rx_state [0]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/fsmfake0 [0])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata_7  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state[1]_GND_24_o_equal_28_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg [7]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata [7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata_6  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state[1]_GND_24_o_equal_28_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg [6]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata [6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata_5  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state[1]_GND_24_o_equal_28_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg [5]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata [5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata_4  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state[1]_GND_24_o_equal_28_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg [4]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata [4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata_3  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state[1]_GND_24_o_equal_28_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg [3]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata [3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata_2  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state[1]_GND_24_o_equal_28_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg [2]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata [2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata_1  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state[1]_GND_24_o_equal_28_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg [1]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata [1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata_0  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state[1]_GND_24_o_equal_28_o ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg [0]),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tdata [0])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tuser  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/next_rx_state[1]_rx_enable_AND_7_o ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tuser_264 )
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg_7  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT [7]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg [7])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg_6  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT [6]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg [6])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg_5  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT [5]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg [5])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg_4  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT [4]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg [4])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg_3  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT [3]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg [3])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg_2  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT [2]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg [2])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg_1  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT [1]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg [1])
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg_0  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_INT [0]),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_data_reg [0])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/Mmux_R3_PWR_21_o_MUX_14_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R2_272 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R3_274 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R3_PWR_21_o_MUX_14_o )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/Mmux_R3_PWR_21_o_MUX_14_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R2_276 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R3_278 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R3_PWR_21_o_MUX_14_o )
  );
  LUT3 #(
    .INIT ( 8'hF7 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_RST_ASYNCH1  (
    .I0(tx_axi_rstn),
    .I1(glbl_rstn),
    .I2(tx_mac_config_vector[0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_RST_ASYNCH )
  );
  LUT3 #(
    .INIT ( 8'hF7 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_RX_RST_ASYNCH1  (
    .I0(rx_axi_rstn),
    .I1(glbl_rstn),
    .I2(rx_mac_config_vector[0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_RX_RST_ASYNCH )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/CRC_MODE_INV_77_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .I1(tx_mac_config_vector[3]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/CRC_MODE_INV_77_o )
  );
  LUT5 #(
    .INIT ( 32'h00000002 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_TX_GND_37_o_MUX_348_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_GND_37_o_MUX_348_o )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_REG_PREAMBLE_DONE_GND_37_o_MUX_389_o11  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_PREAMBLE_DONE_GND_37_o_MUX_389_o )
  );
  LUT4 #(
    .INIT ( 16'hAAA9 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Msub_GND_37_o_GND_37_o_sub_12_OUT<7:0>_xor<5>11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [5]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [3]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [4]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/GND_37_o_GND_37_o_sub_12_OUT[5] )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Msub_GND_37_o_GND_37_o_sub_12_OUT<7:0>_xor<7>111  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [6]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [3]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [4]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Msub_GND_37_o_GND_37_o_sub_12_OUT<7:0>_xor<7>11 )
  );
  LUT6 #(
    .INIT ( 64'h00CC00C300AA00AA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_IFG_COUNT[7]_GND_37_o_mux_33_OUT61  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_MASKED [5]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [4]),
    .I3(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_IFG_COUNT[7]_GND_37_o_mux_33_OUT51_362 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_TX_FAIL_DELAY_AND_167_o ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<5> )
  );
  LUT4 #(
    .INIT ( 16'hF3F7 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable331  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [7]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_EN_522 ),
    .I2(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Msub_GND_37_o_GND_37_o_sub_12_OUT<7:0>_xor<7>11 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable )
  );
  LUT5 #(
    .INIT ( 32'hFFF8FFF0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0926_inv1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_ENABLE_351 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IDL_505 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .I3(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_DATA_VALID_OUT ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0926_inv )
  );
  LUT5 #(
    .INIT ( 32'hFFF8FFF0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0934_inv1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_ENABLE_351 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IDL_505 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_502 ),
    .I3(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_DATA_VALID_OUT ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0934_inv )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1020_inv11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_493 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_502 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CFL_500 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FCS_498 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/SCSH_497 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_499 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1020_inv1 )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_IFG_COUNT[7]_GND_37_o_mux_33_OUT511  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [3]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_IFG_COUNT[7]_GND_37_o_mux_33_OUT51_362 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000010000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_TRANSMIT_GND_37_o_MUX_416_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_499 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_483 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .I3(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_502 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CFL_500 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TRANSMIT_GND_37_o_MUX_416_o )
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable131  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_487 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_PREAMBLE_DONE_491 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable13 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<7>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_487 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [7]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_PREAMBLE_DONE_491 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<7>1_413 )
  );
  LUT6 #(
    .INIT ( 64'h5554545411101010 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_GND_37_o_MUX_383_o1  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_CRC_MODE_463 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_499 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CFL_500 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIN_PKT_LEN_REACHED_490 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0996_inv11 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_GND_37_o_MUX_383_o )
  );
  LUT6 #(
    .INIT ( 64'hA888A888A8880000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_FCS_GND_37_o_MUX_363_o111  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_CRC_MODE_463 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_499 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CFL_500 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIN_PKT_LEN_REACHED_490 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COUNT [0]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COUNT [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_FCS_GND_37_o_MUX_363_o11 )
  );
  LUT6 #(
    .INIT ( 64'h0000004000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n082421  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_ENABLE_506 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_VLAN_EN_523 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [11]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [3]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_REG_TX_CONTROL_GND_37_o_MUX_510_o11 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n08242 )
  );
  LUT6 #(
    .INIT ( 64'h0000004000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_REG_TX_VLAN_GND_37_o_MUX_512_o11  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_VLAN_EN_523 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [11]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [3]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_REG_TX_CONTROL_GND_37_o_MUX_510_o11 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_TX_VLAN_GND_37_o_MUX_512_o )
  );
  LUT4 #(
    .INIT ( 16'hA9FF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_PRE_COUNT_xor<2>11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_PRE_COUNT2 )
  );
  LUT3 #(
    .INIT ( 8'hA9 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Msub_GND_37_o_GND_37_o_sub_12_OUT<7:0>_xor<4>11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [3]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/GND_37_o_GND_37_o_sub_12_OUT[4] )
  );
  LUT6 #(
    .INIT ( 64'hFFFFCCC3FFFFAAAA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_IFG_COUNT[7]_GND_37_o_mux_33_OUT31  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_MASKED [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [0]),
    .I4(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_TX_FAIL_DELAY_AND_167_o ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<2> )
  );
  LUT3 #(
    .INIT ( 8'h54 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_CRC_COMPUTE_GND_37_o_MUX_454_o11  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PAD_484 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TRANSMIT_PIPE [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_GND_37_o_MUX_454_o )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFF54 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_EN1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CR178124_FIX_480 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_483 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TRANSMIT_PIPE [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[2] ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PAD_PIPE_481 ),
    .O(NlwRenamedSig_OI_gmii_tx_en)
  );
  LUT6 #(
    .INIT ( 64'h2EEE0CCC22220000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_FRAME_GOOD_GND_37_o_MUX_371_o111  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIN_PKT_LEN_REACHED_490 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_CRC_MODE_463 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_SEEN_488 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MAX_PKT_LEN_REACHED_489 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CFL_500 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0996_inv11 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_FRAME_GOOD_GND_37_o_MUX_371_o11 )
  );
  LUT3 #(
    .INIT ( 8'h9F ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/GND_37_o_GND_37_o_sub_12_OUT<3>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_EN_522 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/GND_37_o_GND_37_o_sub_12_OUT<3>1_418 )
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1218_inv1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [14]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CFL_500 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FCS_498 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_502 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1218_inv )
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0996_inv111  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COUNT [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COUNT [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FCS_498 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0996_inv11 )
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable1611  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE0_MATCH_475 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE1_MATCH_474 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE2_MATCH_473 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE3_MATCH_472 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE4_MATCH_471 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE5_MATCH_469 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_BROADCAST )
  );
  LUT5 #(
    .INIT ( 32'h00400000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_REG_TX_CONTROL_GND_37_o_MUX_510_o12  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [11]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [3]),
    .I3(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_REG_TX_CONTROL_GND_37_o_MUX_510_o11 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_TX_CONTROL_GND_37_o_MUX_510_o )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_TX_FAIL_DELAY_AND_167_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [7]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [6]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [5]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [4]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_IFG_COUNT[7]_GND_37_o_mux_33_OUT51_362 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_TX_FAIL_DELAY_AND_167_o1_363 )
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n083311  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FCS_498 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_493 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_SCSH_466 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n08331 )
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_cst11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FCS_498 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_502 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CFL_500 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_cst1 )
  );
  LUT4 #(
    .INIT ( 16'h4000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_INT_TX_STATUS_VALID_GND_37_o_MUX_474_o11  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CLIENT_FRAME_DONE_492 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IDL_505 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_493 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_STATUS_VALID_GND_37_o_MUX_474_o )
  );
  LUT4 #(
    .INIT ( 16'h4000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_CR178124_FIX_GND_37_o_MUX_472_o11  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_SEEN_488 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MAX_PKT_LEN_REACHED_489 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/SCSH_497 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CR178124_FIX_GND_37_o_MUX_472_o )
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_CRC_GND_37_o_MUX_420_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FCS_498 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CFL_500 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_GND_37_o_MUX_420_o )
  );
  LUT5 #(
    .INIT ( 32'h00000002 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_PAD_GND_37_o_MUX_418_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CFL_500 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FCS_498 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/SCSH_497 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_502 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PAD_GND_37_o_MUX_418_o )
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_PREAMBLE_GND_37_o_MUX_412_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_502 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_GND_37_o_MUX_412_o )
  );
  LUT3 #(
    .INIT ( 8'h9F ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_CRC_COUNT_xor<1>11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COUNT [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FCS_498 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_CRC_COUNT1 )
  );
  LUT3 #(
    .INIT ( 8'h9F ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_PRE_COUNT_xor<1>11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_PRE_COUNT1 )
  );
  LUT3 #(
    .INIT ( 8'hF1 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable171  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TRANSMIT_485 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_PREAMBLE_486 ),
    .I2(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable17 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<6>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [6]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_487 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<6>1_414 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<2>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_487 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<2>1_416 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<0>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_487 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<0>1_417 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<4>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_487 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<4>1_415 )
  );
  LUT2 #(
    .INIT ( 4'h7 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_CRC_COUNT_xor<0>11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FCS_498 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_CRC_COUNT )
  );
  LUT2 #(
    .INIT ( 4'h7 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_PRE_COUNT_xor<0>11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_PRE_COUNT )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_DATA_REG_OUT11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_483 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [31]),
    .O(gmii_txd[0])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_DATA_REG_OUT21  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_483 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [30]),
    .O(gmii_txd[1])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_DATA_REG_OUT31  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_483 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [29]),
    .O(gmii_txd[2])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_DATA_REG_OUT41  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_483 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [28]),
    .O(gmii_txd[3])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_DATA_REG_OUT51  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_483 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [27]),
    .O(gmii_txd[4])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_DATA_REG_OUT61  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_483 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [26]),
    .O(gmii_txd[5])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_DATA_REG_OUT71  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_483 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [6]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [25]),
    .O(gmii_txd[6])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_DATA_REG_OUT81  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_483 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [7]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [24]),
    .O(gmii_txd[7])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_STATUS_VALID_GND_37_o_MUX_479_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_STATUS_VALID_479 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_STATUS_VALID_GND_37_o_MUX_479_o )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_DATA_REG[0][7]_GND_37_o_mux_60_OUT21  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_487 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<1> )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_DATA_REG[0][7]_GND_37_o_mux_60_OUT41  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_487 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<3> )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_DATA_REG[0][7]_GND_37_o_mux_60_OUT61  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [5]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_487 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG[0][7]_GND_37_o_mux_60_OUT<5> )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_REG_SCSH_GND_37_o_MUX_514_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/SCSH_497 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_SCSH_GND_37_o_MUX_514_o )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_DST_ADDR_MULTI_MATCH_GND_37_o_MUX_505_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4 [0]),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_MULTI_MATCH_GND_37_o_MUX_505_o )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_PAD_PIPE_GND_37_o_MUX_470_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PAD_484 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PAD_PIPE_GND_37_o_MUX_470_o )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_REG_PREAMBLE_GND_37_o_MUX_414_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_487 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_PREAMBLE_GND_37_o_MUX_414_o )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_INT_MAX_FRAME_ENABLE_GND_37_o_MUX_324_o11  (
    .I0(tx_mac_config_vector[14]),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_ENABLE_GND_37_o_MUX_324_o )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_INT_IFG_DEL_EN_GND_37_o_MUX_320_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_IFG_DEL_EN_349 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_EN_GND_37_o_MUX_320_o )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_INT_VLAN_EN_GND_37_o_MUX_316_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_VLAN_ENABLE_350 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_VLAN_EN_GND_37_o_MUX_316_o )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_INT_CRC_MODE_GND_37_o_MUX_312_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_CRC_MODE_353 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_CRC_MODE_GND_37_o_MUX_312_o )
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT16  (
    .I0(tx_mac_config_vector[14]),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I2(tx_mac_config_vector[16]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<0> )
  );
  LUT3 #(
    .INIT ( 8'hEF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT21  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(tx_mac_config_vector[26]),
    .I2(tx_mac_config_vector[14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<10> )
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT31  (
    .I0(tx_mac_config_vector[14]),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I2(tx_mac_config_vector[27]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<11> )
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT41  (
    .I0(tx_mac_config_vector[14]),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I2(tx_mac_config_vector[28]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<12> )
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT51  (
    .I0(tx_mac_config_vector[14]),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I2(tx_mac_config_vector[29]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<13> )
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT61  (
    .I0(tx_mac_config_vector[14]),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I2(tx_mac_config_vector[30]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<14> )
  );
  LUT3 #(
    .INIT ( 8'hEF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT71  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(tx_mac_config_vector[17]),
    .I2(tx_mac_config_vector[14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<1> )
  );
  LUT3 #(
    .INIT ( 8'hEF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT81  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(tx_mac_config_vector[18]),
    .I2(tx_mac_config_vector[14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<2> )
  );
  LUT3 #(
    .INIT ( 8'hEF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT91  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(tx_mac_config_vector[19]),
    .I2(tx_mac_config_vector[14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<3> )
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT101  (
    .I0(tx_mac_config_vector[14]),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I2(tx_mac_config_vector[20]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<4> )
  );
  LUT3 #(
    .INIT ( 8'hEF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT111  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(tx_mac_config_vector[21]),
    .I2(tx_mac_config_vector[14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<5> )
  );
  LUT3 #(
    .INIT ( 8'hEF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT121  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(tx_mac_config_vector[22]),
    .I2(tx_mac_config_vector[14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<6> )
  );
  LUT3 #(
    .INIT ( 8'hEF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT131  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(tx_mac_config_vector[23]),
    .I2(tx_mac_config_vector[14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<7> )
  );
  LUT3 #(
    .INIT ( 8'hEF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT141  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(tx_mac_config_vector[24]),
    .I2(tx_mac_config_vector[14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<8> )
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT151  (
    .I0(tx_mac_config_vector[14]),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I2(tx_mac_config_vector[25]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH[14]_GND_37_o_mux_7_OUT<9> )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_INT_JUMBO_EN_GND_37_o_MUX_314_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_JUMBO_ENABLE_352 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_JUMBO_EN_GND_37_o_MUX_314_o )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable251  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PAD_484 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Reset_OR_DriverANDClockEnable25 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1106_inv1  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[4] ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1106_inv )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0871_inv1  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0871_inv )
  );
  LUT4 #(
    .INIT ( 16'h0020 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_ACK1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_487 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_ACK_IN )
  );
  LUT4 #(
    .INIT ( 16'h6CC6 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<21>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [13]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [29]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<21> )
  );
  LUT4 #(
    .INIT ( 16'h6CC6 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<31>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [23]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [29]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<31> )
  );
  LUT4 #(
    .INIT ( 16'h6996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<12>41  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [30]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [29]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [25]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<12>_bdd6 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<14>41  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [30]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [27]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<14>_bdd6 )
  );
  LUT4 #(
    .INIT ( 16'h6CC6 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<20>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [12]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [3]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [28]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<20> )
  );
  LUT4 #(
    .INIT ( 16'h6CC6 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<22>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [14]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [7]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [24]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<22> )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<23>21  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [30]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [25]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<23>_bdd2 )
  );
  LUT5 #(
    .INIT ( 32'hD7287D82 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<17>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [6]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [9]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<12>_bdd6 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<17> )
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<23>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [7]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [6]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [24]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [15]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<23>_bdd2 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<23> )
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<29>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [31]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [21]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<14>_bdd6 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<29> )
  );
  LUT6 #(
    .INIT ( 64'hE44E4EE44EE4E44E ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT13  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [30]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [24]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [7]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<0> )
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT111  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [27]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [4]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [31]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [11]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<19> )
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT181  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [27]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [4]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [26]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [17]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<25> )
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT241  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [31]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [28]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [22]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [3]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<30> )
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT241  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [31]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [28]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [22]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<30> )
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT181  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [27]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [4]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [26]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [17]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<25> )
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT111  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [27]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [4]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [31]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [11]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<19> )
  );
  LUT6 #(
    .INIT ( 64'hE44E4EE44EE4E44E ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [30]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [24]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<0> )
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<29>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [31]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [21]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<14>_bdd6 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<29> )
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<23>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [6]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [24]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [15]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<23>_bdd2 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<23> )
  );
  LUT5 #(
    .INIT ( 32'hD7287D82 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<17>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [6]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [9]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<12>_bdd6 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<17> )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<23>21  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [30]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [25]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<23>_bdd2 )
  );
  LUT4 #(
    .INIT ( 16'h6CC6 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<22>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [14]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [24]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<22> )
  );
  LUT4 #(
    .INIT ( 16'h6CC6 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<20>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [12]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [28]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<20> )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<14>41  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [30]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [27]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<14>_bdd6 )
  );
  LUT4 #(
    .INIT ( 16'h6996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<12>41  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [30]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [29]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [25]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<12>_bdd6 )
  );
  LUT4 #(
    .INIT ( 16'h6CC6 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<31>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [23]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [29]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<31> )
  );
  LUT4 #(
    .INIT ( 16'h6CC6 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<21>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [13]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [29]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<21> )
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Mmux_FRAME_SUCCESS_FRAME_FAILURE_MUX_880_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/GOOD_FRAME_893 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MATCH_FRAME_INT_848 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/BAD_FRAME_892 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_SUCCESS_FRAME_FAILURE_MUX_880_o )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Mmux_GND_42_o_FRAME_SUCCESS_MUX_879_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MATCH_FRAME_INT_848 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/GOOD_FRAME_893 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_FRAME_SUCCESS_MUX_879_o )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Mmux_GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT16  (
    .I0(rx_mac_config_vector[14]),
    .I1(rx_mac_config_vector[16]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<0> )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Mmux_GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT21  (
    .I0(rx_mac_config_vector[26]),
    .I1(rx_mac_config_vector[14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<10> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Mmux_GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT31  (
    .I0(rx_mac_config_vector[14]),
    .I1(rx_mac_config_vector[27]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<11> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Mmux_GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT41  (
    .I0(rx_mac_config_vector[14]),
    .I1(rx_mac_config_vector[28]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<12> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Mmux_GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT51  (
    .I0(rx_mac_config_vector[14]),
    .I1(rx_mac_config_vector[29]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<13> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Mmux_GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT61  (
    .I0(rx_mac_config_vector[14]),
    .I1(rx_mac_config_vector[30]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<14> )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Mmux_GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT71  (
    .I0(rx_mac_config_vector[17]),
    .I1(rx_mac_config_vector[14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<1> )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Mmux_GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT81  (
    .I0(rx_mac_config_vector[18]),
    .I1(rx_mac_config_vector[14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<2> )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Mmux_GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT91  (
    .I0(rx_mac_config_vector[19]),
    .I1(rx_mac_config_vector[14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<3> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Mmux_GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT101  (
    .I0(rx_mac_config_vector[14]),
    .I1(rx_mac_config_vector[20]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<4> )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Mmux_GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT111  (
    .I0(rx_mac_config_vector[21]),
    .I1(rx_mac_config_vector[14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<5> )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Mmux_GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT121  (
    .I0(rx_mac_config_vector[22]),
    .I1(rx_mac_config_vector[14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<6> )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Mmux_GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT131  (
    .I0(rx_mac_config_vector[23]),
    .I1(rx_mac_config_vector[14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<7> )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Mmux_GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT141  (
    .I0(rx_mac_config_vector[24]),
    .I1(rx_mac_config_vector[14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<8> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Mmux_GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT151  (
    .I0(rx_mac_config_vector[14]),
    .I1(rx_mac_config_vector[25]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_MAX_FRAME_LENGTH[14]_mux_2_OUT<9> )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Reset_OR_DriverANDClockEnable11  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/VALIDATE_REQUIRED_846 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Reset_OR_DriverANDClockEnable1 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_EARLY1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_EARLY_INT_847 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG1_890 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/DATA_VALID_EARLY )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ALIGNMENT_ERR_REG_CRC_ERR_AND_318_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ALIGNMENT_ERR_REG_891 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/CRC_ERR_896 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ALIGNMENT_ERR_REG_CRC_ERR_AND_318_o )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/CRC_ERR_ALIGNMENT_ERR_REG_AND_317_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/CRC_ERR_896 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ALIGNMENT_ERR_REG_891 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/CRC_ERR_ALIGNMENT_ERR_REG_AND_317_o )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/SFD_FLAG_852 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG )
  );
  LUT5 #(
    .INIT ( 32'h44444000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/RX_DV_REG6_DAT_FIELD_AND_353_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_DATA_950 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG6_888 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/LEN_FIELD_945 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/DAT_FIELD_944 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/RX_DV_REG6_DAT_FIELD_AND_353_o )
  );
  LUT5 #(
    .INIT ( 32'h44444000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/RX_DV_REG6_LEN_FIELD_AND_350_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG6_888 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [5]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/SRC_ADDRESS_FIELD_946 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/LEN_FIELD_945 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/RX_DV_REG6_LEN_FIELD_AND_350_o )
  );
  LUT6 #(
    .INIT ( 64'h4444444440004040 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/RX_DV_REG6_DEST_ADDRESS_FIELD_AND_344_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [5]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG6_888 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/SFD_FLAG_852 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG7_887 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/DEST_ADDRESS_FIELD_947 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/RX_DV_REG6_DEST_ADDRESS_FIELD_AND_344_o )
  );
  LUT6 #(
    .INIT ( 64'h4444444444444440 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/Mmux_GND_45_o_FIELD_CONTROL[0]_MUX_693_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/CRC_FIELD_943 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/DEST_ADDRESS_FIELD_947 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/LEN_FIELD_945 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/SRC_ADDRESS_FIELD_946 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/GND_45_o_FIELD_CONTROL[0]_MUX_693_o )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFF0001 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/Mmux_PWR_47_o_FIELD_CONTROL[5]_MUX_694_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/LEN_FIELD_945 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/SRC_ADDRESS_FIELD_946 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/CRC_FIELD_943 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/DEST_ADDRESS_FIELD_947 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PWR_47_o_FIELD_CONTROL[5]_MUX_694_o )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/Mmux_FIELD_CONTROL[1]_GND_45_o_MUX_698_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL[1]_GND_45_o_MUX_698_o )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/Mmux_FIELD_CONTROL[3]_GND_45_o_MUX_696_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL[3]_GND_45_o_MUX_696_o )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/Mmux_FIELD_CONTROL[4]_GND_45_o_MUX_695_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL[4]_GND_45_o_MUX_695_o )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/Mmux_FIELD_CONTROL[2]_GND_45_o_MUX_697_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL[2]_GND_45_o_MUX_697_o )
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/CRC_FIELD_END_DATA_OR_205_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/CRC_FIELD_943 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FCS_949 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_DATA_950 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/CRC_FIELD_END_DATA_OR_205_o )
  );
  LUT3 #(
    .INIT ( 8'hF7 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Reset_OR_DriverANDClockEnable3  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/LEN_FIELD_945 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [0]),
    .I2(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Reset_OR_DriverANDClockEnable )
  );
  LUT4 #(
    .INIT ( 16'h4000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/PWR_48_o_RXD[7]_equal_15_o<7>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_LT_CHECK_DISABLE_AND_371_o1 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/PWR_48_o_RXD[7]_equal_15_o )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF444E4444 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0476_inv11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/DEST_ADDRESS_FIELD_947 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcastaddressmatch_285 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_DATA_950 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/CRC_FIELD_943 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [0]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0476_inv1 )
  );
  LUT6 #(
    .INIT ( 64'h8888888D88888888 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mmux_DATA_NO_FCS_DATA_WITH_FCS_MUX_790_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/CRC_MODE_HELD_856 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_WITH_FCS_1109 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/EXT_FIELD_942 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_ZERO_1111 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_NO_FCS_1108 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_NO_FCS_DATA_WITH_FCS_MUX_790_o )
  );
  LUT4 #(
    .INIT ( 16'h0100 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/GND_46_o_RXD[7]_equal_9_o<7>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_LT_CHECK_DISABLE_AND_371_o1 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/GND_46_o_RXD[7]_equal_9_o )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_LT_CHECK_DISABLE_AND_371_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [6]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [4]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [5]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_LT_CHECK_DISABLE_AND_371_o1 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_val1  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/Reset_OR_DriverANDClockEnable )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0404_inv1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/CRC_FIELD_943 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/LEN_FIELD_945 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/DAT_FIELD_944 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/EXT_FIELD_942 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0404_inv )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_1105 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/RX_DV_REG_FRAME_COUNTER[14]_AND_403_o )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_FIELD_COUNTER[1]_AND_376_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/LEN_FIELD_945 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_FIELD_COUNTER[1]_AND_376_o )
  );
  LUT4 #(
    .INIT ( 16'h7770 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/END_OF_FRAME_SFD_FLAG_AND_418_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/SFD_FLAG_852 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/INHIBIT_FRAME_1122 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/END_OF_FRAME_SFD_FLAG_AND_418_o )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF4040FF40 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FCS_ERR_EXTENSION_FIELD_OR_256_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG7_887 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG7_884 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/EXT_FIELD_942 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/EXTENSION_FLAG_851 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FCS_ERR_CRC_ENGINE_ERR_OR_268_o ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FCS_ERR_EXTENSION_FIELD_OR_256_o )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FCS_ERR_CRC_ENGINE_ERR_OR_268_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FCS_ERR_1123 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/CRC_ENGINE_ERR_1124 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FCS_ERR_CRC_ENGINE_ERR_OR_268_o )
  );
  LUT6 #(
    .INIT ( 64'hFFFEFFFEFFFFFFFE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/MAX_LENGTH_ERR_RUNT_FRAME_ERR_OR_262_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FRAME_LEN_ERR_1125 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/MAX_LENGTH_ERR_1121 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/CRC_ENGINE_ERR_1124 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FCS_ERR_1123 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/EXCEEDED_MIN_LEN_1126 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/BAD_FRAME_rstpot )
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/MIN_LENGTH_MATCH_EXCEEDED_MIN_LEN_OR_236_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/EXCEEDED_MIN_LEN_1126 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/MIN_LENGTH_MATCH_1127 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/DAT_FIELD_944 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/MIN_LENGTH_MATCH_EXCEEDED_MIN_LEN_OR_236_o )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_mac_tlast_tx_mac_tready_int_AND_22_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_mac_tready_reg_1160 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/gate_tready_1162 ),
    .I2(tx_axis_mac_tlast),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tlast_reg_glue_set )
  );
  LUT6 #(
    .INIT ( 64'h4444F5F4F5F4F5F4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd6-In1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_OUT_287 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd1_1146 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd8_1145 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd6_1144 ),
    .I4(tx_axis_mac_tlast),
    .I5(tx_axis_mac_tuser[0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd6-In )
  );
  LUT3 #(
    .INIT ( 8'h2A ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd8-In1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd9_1129 ),
    .I1(tx_axis_mac_tlast),
    .I2(tx_axis_mac_tuser[0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_GND_25_o_equal_73_o )
  );
  LUT5 #(
    .INIT ( 32'h00000400 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd9-In1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/ignore_packet_1156 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd10_1147 ),
    .I2(tx_axis_mac_tuser[0]),
    .I3(tx_axis_mac_tvalid),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/no_burst_1161 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_GND_25_o_equal_30_o )
  );
  LUT4 #(
    .INIT ( 16'h4000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd5-In1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_OUT_287 ),
    .I1(tx_axis_mac_tuser[0]),
    .I2(tx_axis_mac_tlast),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd6_1144 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_GND_25_o_equal_74_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/Mmux_tx_data[7]_tx_mac_tdata[7]_mux_66_OUT81  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/Mmux_tx_data[7]_tx_mac_tdata[7]_mux_66_OUT11 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold [0]),
    .I2(tx_axis_mac_tdata[0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<0> )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/Mmux_tx_data[7]_tx_mac_tdata[7]_mux_66_OUT71  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/Mmux_tx_data[7]_tx_mac_tdata[7]_mux_66_OUT11 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold [1]),
    .I2(tx_axis_mac_tdata[1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<1> )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/Mmux_tx_data[7]_tx_mac_tdata[7]_mux_66_OUT61  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/Mmux_tx_data[7]_tx_mac_tdata[7]_mux_66_OUT11 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold [2]),
    .I2(tx_axis_mac_tdata[2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<2> )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/Mmux_tx_data[7]_tx_mac_tdata[7]_mux_66_OUT51  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/Mmux_tx_data[7]_tx_mac_tdata[7]_mux_66_OUT11 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold [3]),
    .I2(tx_axis_mac_tdata[3]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<3> )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/Mmux_tx_data[7]_tx_mac_tdata[7]_mux_66_OUT41  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/Mmux_tx_data[7]_tx_mac_tdata[7]_mux_66_OUT11 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold [4]),
    .I2(tx_axis_mac_tdata[4]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<4> )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/Mmux_tx_data[7]_tx_mac_tdata[7]_mux_66_OUT31  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/Mmux_tx_data[7]_tx_mac_tdata[7]_mux_66_OUT11 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold [5]),
    .I2(tx_axis_mac_tdata[5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<5> )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/Mmux_tx_data[7]_tx_mac_tdata[7]_mux_66_OUT21  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/Mmux_tx_data[7]_tx_mac_tdata[7]_mux_66_OUT11 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold [6]),
    .I2(tx_axis_mac_tdata[6]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<6> )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/Mmux_tx_data[7]_tx_mac_tdata[7]_mux_66_OUT12  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/Mmux_tx_data[7]_tx_mac_tdata[7]_mux_66_OUT11 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_hold [7]),
    .I2(tx_axis_mac_tdata[7]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data[7]_tx_mac_tdata[7]_mux_66_OUT<7> )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFF8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/Mmux_tx_data[7]_tx_mac_tdata[7]_mux_66_OUT111  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_OUT_287 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd1_1146 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd2_1142 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd4_1148 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd10_1147 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/Mmux_tx_data[7]_tx_mac_tdata[7]_mux_66_OUT11 )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/_n0280_inv1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd2_1142 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_OUT_287 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd4_1148 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd10_1147 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/_n0280_inv )
  );
  LUT4 #(
    .INIT ( 16'h88D8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd2-In1  (
    .I0(tx_axis_mac_tvalid),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd7_1149 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd2_1142 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_OUT_287 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_GND_25_o_equal_75_o )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_mac_tready_int1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_mac_tready_reg_1160 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/gate_tready_1162 ),
    .O(NlwRenamedSig_OI_tx_axis_mac_tready)
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_mac_tlast_tx_mac_tvalid_OR_21_o1  (
    .I0(tx_axis_mac_tlast),
    .I1(tx_axis_mac_tvalid),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_mac_tlast_tx_mac_tvalid_OR_21_o )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_VLAN_ENABLE_OUT1  (
    .I0(tx_mac_config_vector[2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_VLAN_ENABLE_OUT )
  );
  LUT4 #(
    .INIT ( 16'h6AAA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Result<3>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Result [3])
  );
  LUT5 #(
    .INIT ( 32'h6CCCCCCC ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Result<4>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Result [4])
  );
  LUT6 #(
    .INIT ( 64'h0000000004000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n008111  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/BAD_FRAME_INT_322 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [2]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [1]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n00811 )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0100_inv1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n00811 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0100_inv )
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_xor<2>11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Result [2])
  );
  LUT4 #(
    .INIT ( 16'hAA2A ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mmux_GOOD_FRAME_OUT11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/ADD_CONTROL_FRAME_321 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_ENABLE_REG_1189 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/BAD_OPCODE_INT_1270 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_GOOD_FRAME_COMB )
  );
  LUT6 #(
    .INIT ( 64'hAAAAAAAAA8AAAAAA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0127_inv1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_FINAL_324 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [4]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0127_inv )
  );
  LUT5 #(
    .INIT ( 32'hFFFF2000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mmux_BAD_FRAME_OUT11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/BAD_OPCODE_INT_1270 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/ADD_CONTROL_FRAME_321 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_ENABLE_REG_1189 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/BAD_FRAME_INT_322 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_BAD_FRAME_COMB )
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val1  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/BAD_FRAME_INT_322 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_val )
  );
  LUT6 #(
    .INIT ( 64'hEEEEEEEEEEEEEEFE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0123_inv11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/BAD_FRAME_INT_322 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [4]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [3]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [2]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0123_inv1 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_xor<1>11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Result [1])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mmux__n010517  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [7]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [15]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [0])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mmux__n010521  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [10])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mmux__n010531  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [4]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [11])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mmux__n010541  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [3]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [12])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mmux__n010551  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [13])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mmux__n010561  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [14])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mmux__n010571  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [15])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mmux__n010581  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [6]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [1])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mmux__n010591  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [13]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [2])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mmux__n0105101  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [12]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [3])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mmux__n0105111  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [11]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [4])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mmux__n0105121  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [10]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [5])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mmux__n0105131  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [9]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [6])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mmux__n0105141  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [8]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [7])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mmux__n0105151  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [7]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [7]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [8])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mmux__n0105161  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_VALUE [6]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [6]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n0105 [9])
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/BAD_OPCODE1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/BAD_OPCODE_INT_1270 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CONTROL_FRAME_320 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .O(rx_statistics_vector[24])
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_REQ1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/ADD_CONTROL_FRAME_321 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_ENABLE_REG_1189 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_REQ_INT_1271 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/PAUSE_REQ_LOCAL )
  );
  LUT5 #(
    .INIT ( 32'h6CCCCCCC ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mcount_DATA_COUNT_xor<4>11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [2]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [3]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Result [4])
  );
  LUT4 #(
    .INIT ( 16'h6AAA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mcount_DATA_COUNT_xor<3>11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Result [3])
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mcount_DATA_COUNT_xor<2>11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Result [2])
  );
  LUT4 #(
    .INIT ( 16'h0002 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_Mux_26_o111  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_Mux_26_o11_1280 )
  );
  LUT6 #(
    .INIT ( 64'h5557555755575556 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_Mux_26_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [3]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/END_OF_TX_REG_1312 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_Mux_26_o )
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_AVAIL_OUT11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_CONTROL_1321 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_IN_REG_1331 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_DATA_VALID_OUT )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_UNDERRUN_OUT11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_UNDERRUN_INT_1184 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_UNDERRUN_OUT )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_OUT11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_DATA_OUT [0])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_OUT21  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_DATA_OUT [1])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_OUT31  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_DATA_OUT [2])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_OUT41  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL [3]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_DATA_OUT [3])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_OUT51  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL [4]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_DATA_OUT [4])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_OUT61  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL [5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_DATA_OUT [5])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_OUT71  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT [6]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL [6]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_DATA_OUT [6])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_OUT81  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_DATA_INT [7]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_CONTROL [7]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_DATA_OUT [7])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_REQ_INT_1309 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2_1286 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0172_inv )
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/CONTROL_COMPLETE<1>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/CONTROL_COMPLETE )
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/GOOD_FRAME_IN1_GOOD_FRAME_IN3_OR_86_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/GOOD_FRAME_IN2_1400 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/GOOD_FRAME_IN3_1399 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/GOOD_FRAME_IN1_1398 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/GOOD_FRAME_IN1_GOOD_FRAME_IN3_OR_86_o )
  );
  LUT6 #(
    .INIT ( 64'h7F807F8000007F80 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA_xor<3>11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [3]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/COUNT_SET_1187 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2_1286 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA3 )
  );
  LUT5 #(
    .INIT ( 32'h78780078 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA_xor<2>11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/COUNT_SET_1187 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2_1286 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA2 )
  );
  LUT4 #(
    .INIT ( 16'h6606 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA_xor<1>11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/COUNT_SET_1187 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2_1286 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA1 )
  );
  LUT3 #(
    .INIT ( 8'h45 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA_xor<0>11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2_1286 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/COUNT_SET_1187 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA )
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mmux_COUNT_SET_GND_31_o_MUX_237_o121  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_REQ_TO_TX_1192 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/GOOD_FRAME_IN_TX_REG_1458 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync2 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mmux_COUNT_SET_GND_31_o_MUX_237_o12_1401 )
  );
  LUT6 #(
    .INIT ( 64'h444444444444444F ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter[5]_GND_50_o_equal_14_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_reg2_1547 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_reg1_1541 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [5]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [4]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [3]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_counter_xor<5>11 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter[5]_GND_50_o_equal_14_o1 )
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Reset_OR_DriverANDClockEnable1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_reg1_1541 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_reg2_1547 ),
    .I2(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Reset_OR_DriverANDClockEnable )
  );
  LUT4 #(
    .INIT ( 16'h6AAA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_counter_xor<3>11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result [3])
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_load_count_xor<2>11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result<2>1 )
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_counter_xor<2>11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result [2])
  );
  LUT3 #(
    .INIT ( 8'h7F ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_counter_xor<5>111  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_counter_xor<5>11 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_counter_xor<1>11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result [1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_load_count_xor<1>11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result<1>1 )
  );
  LUT3 #(
    .INIT ( 8'h57 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_PWR_52_o_LessThan_17_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_PWR_52_o_LessThan_17_o )
  );
  LUT3 #(
    .INIT ( 8'h57 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe[2]_PWR_52_o_LessThan_20_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count_pipe[2]_PWR_52_o_LessThan_20_o )
  );
  LUT6 #(
    .INIT ( 64'hBBBABBBABBBAB990 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/Mmux_next_rx_state11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd2_1569 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd1_1575 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_VALID_INT_291 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/fsmfake0 [0]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_GOOD_FRAME_INT_293 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_BAD_FRAME_INT_292 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/next_rx_state [0])
  );
  LUT5 #(
    .INIT ( 32'h040404AE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd2-In1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd2_1569 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_VALID_INT_291 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd1_1575 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_BAD_FRAME_INT_292 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_GOOD_FRAME_INT_293 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd2-In )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_rx_state[1]_GND_24_o_equal_28_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd2_1569 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd1_1575 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state[1]_GND_24_o_equal_28_o )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_ER_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [0]),
    .O(N2)
  );
  LUT6 #(
    .INIT ( 64'hFF03AA02AA02AA02 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_ER  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_UNDERRUN_OUT ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [2]),
    .I2(N2),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_502 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_499 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MAX_PKT_LEN_REACHED_489 ),
    .O(gmii_tx_er)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0942_inv_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .O(N4)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFBFFFFFFFA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0942_inv  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CDS_504 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_COUNT [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_499 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CFL_500 ),
    .I4(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I5(N4),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0942_inv_422 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_IFG_COUNT[7]_GND_37_o_mux_33_OUT7_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [5]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [4]),
    .O(N6)
  );
  LUT6 #(
    .INIT ( 64'h0C0C0C030A0A0A0A ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_IFG_COUNT[7]_GND_37_o_mux_33_OUT7  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_MASKED [6]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [6]),
    .I2(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I3(N6),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_IFG_COUNT[7]_GND_37_o_mux_33_OUT51_362 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_TX_FAIL_DELAY_AND_167_o ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<6> )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_IFG_COUNT[7]_GND_37_o_mux_33_OUT8_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [6]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [4]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_IFG_COUNT[7]_GND_37_o_mux_33_OUT51_362 ),
    .O(N8)
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_IFG_COUNT[7]_GND_37_o_mux_33_OUT4_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [1]),
    .O(N12)
  );
  LUT6 #(
    .INIT ( 64'h00CC00C300AA00AA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_IFG_COUNT[7]_GND_37_o_mux_33_OUT4  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_MASKED [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [2]),
    .I3(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I4(N12),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_TX_FAIL_DELAY_AND_167_o ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<3> )
  );
  LUT6 #(
    .INIT ( 64'h0000000000010000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_REG_TX_CONTROL_GND_37_o_MUX_510_o111  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [12]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [13]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [14]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [15]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [7]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [8]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_REG_TX_CONTROL_GND_37_o_MUX_510_o111_1590 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_REG_TX_CONTROL_GND_37_o_MUX_510_o112  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [10]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [9]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [4]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [5]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [6]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_REG_TX_CONTROL_GND_37_o_MUX_510_o112_1591 )
  );
  LUT3 #(
    .INIT ( 8'h40 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_REG_TX_CONTROL_GND_37_o_MUX_510_o113  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/LEN [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_REG_TX_CONTROL_GND_37_o_MUX_510_o111_1590 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_REG_TX_CONTROL_GND_37_o_MUX_510_o112_1591 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_REG_TX_CONTROL_GND_37_o_MUX_510_o11 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Msub_GND_37_o_GND_37_o_sub_12_OUT<7:0>_xor<7>1_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [5]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [4]),
    .O(N18)
  );
  LUT6 #(
    .INIT ( 64'hCCCCCCCD00000001 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Msub_GND_37_o_GND_37_o_sub_12_OUT<7:0>_xor<7>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [6]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [7]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [3]),
    .I4(N18),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Msub_GND_37_o_GND_37_o_sub_12_OUT<7:0>_xor<7>11 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/GND_37_o_GND_37_o_sub_12_OUT[7] )
  );
  LUT5 #(
    .INIT ( 32'h80000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE4_MATCH_GND_37_o_MUX_503_o_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_DA_501 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [7]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [6]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [5]),
    .O(N20)
  );
  LUT6 #(
    .INIT ( 64'h4000000000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE4_MATCH_GND_37_o_MUX_503_o  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [4]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_0 [3]),
    .I5(N20),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE4_MATCH_GND_37_o_MUX_503_o_537 )
  );
  LUT5 #(
    .INIT ( 32'h80000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_DST_ADDR_BYTE3_MATCH_GND_37_o_MUX_501_o1_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_DA_501 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [7]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [6]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [5]),
    .O(N22)
  );
  LUT6 #(
    .INIT ( 64'h4000000000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_DST_ADDR_BYTE3_MATCH_GND_37_o_MUX_501_o1  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [4]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_1 [3]),
    .I5(N22),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE3_MATCH_GND_37_o_MUX_501_o )
  );
  LUT5 #(
    .INIT ( 32'h80000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_DST_ADDR_BYTE2_MATCH_GND_37_o_MUX_499_o1_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_DA_501 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [7]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [6]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [5]),
    .O(N24)
  );
  LUT6 #(
    .INIT ( 64'h4000000000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_DST_ADDR_BYTE2_MATCH_GND_37_o_MUX_499_o1  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [4]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_2 [3]),
    .I5(N24),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE2_MATCH_GND_37_o_MUX_499_o )
  );
  LUT5 #(
    .INIT ( 32'h80000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_DST_ADDR_BYTE0_MATCH_GND_37_o_MUX_495_o1_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4 [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_DA_501 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4 [7]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4 [6]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4 [5]),
    .O(N26)
  );
  LUT6 #(
    .INIT ( 64'h4000000000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_DST_ADDR_BYTE0_MATCH_GND_37_o_MUX_495_o1  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4 [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4 [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4 [4]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_4 [3]),
    .I5(N26),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE0_MATCH_GND_37_o_MUX_495_o )
  );
  LUT5 #(
    .INIT ( 32'hF7FFFFFF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_DST_ADDR_BYTE1_MATCH_GND_37_o_MUX_497_o1_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [6]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [2]),
    .I2(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_DA_501 ),
    .O(N28)
  );
  LUT6 #(
    .INIT ( 64'h4000000000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_DST_ADDR_BYTE1_MATCH_GND_37_o_MUX_497_o1  (
    .I0(N28),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [3]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [0]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [7]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE1_MATCH_GND_37_o_MUX_497_o )
  );
  LUT6 #(
    .INIT ( 64'h9669699669969669 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<12>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [26]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [28]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [7]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [6]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [2]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [24]),
    .O(N30)
  );
  LUT6 #(
    .INIT ( 64'h6996FF009669FF00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<12>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<12>_bdd6 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [3]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [4]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I5(N30),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<12>_718 )
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<26>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [28]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [7]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [24]),
    .O(N32)
  );
  LUT6 #(
    .INIT ( 64'h6996FF009669FF00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<26>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<14>_bdd6 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [3]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [18]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I5(N32),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<26>_732 )
  );
  LUT5 #(
    .INIT ( 32'h96696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<2>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [26]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [31]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [7]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [6]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [24]),
    .O(N34)
  );
  LUT6 #(
    .INIT ( 64'hE44E4EE44EE4E44E ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<2>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<23>_bdd2 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [5]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [0]),
    .I5(N34),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<2>_708 )
  );
  LUT4 #(
    .INIT ( 16'h9669 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<4>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [26]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [28]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [7]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [24]),
    .O(N36)
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<4>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<14>_bdd6 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [5]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [3]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [4]),
    .I5(N36),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<4>_710 )
  );
  LUT5 #(
    .INIT ( 32'h96696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<6>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [26]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [28]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [31]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [2]),
    .O(N38)
  );
  LUT6 #(
    .INIT ( 64'h6996FF009669FF00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<6>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<12>_bdd6 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [3]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [6]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I5(N38),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<6>_712 )
  );
  LUT6 #(
    .INIT ( 64'h9669699669969669 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<7>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [26]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [31]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [24]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [27]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [29]),
    .O(N40)
  );
  LUT6 #(
    .INIT ( 64'h6996FF009669FF00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<7>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [5]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [7]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I5(N40),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<7>_713 )
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<16>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [24]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [29]),
    .O(N42)
  );
  LUT6 #(
    .INIT ( 64'h6996FF009669FF00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<16>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [28]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [7]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [8]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I5(N42),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<16>_722 )
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<18>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [31]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [30]),
    .O(N44)
  );
  LUT6 #(
    .INIT ( 64'h6996FF009669FF00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<18>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [5]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [26]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [10]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I5(N44),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<18>_724 )
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<24>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [31]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [6]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [25]),
    .O(N46)
  );
  LUT6 #(
    .INIT ( 64'h6996FF009669FF00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<24>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [5]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [26]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [16]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I5(N46),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<24>_730 )
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<28>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [29]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [30]),
    .O(N48)
  );
  LUT6 #(
    .INIT ( 64'h6996FF009669FF00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<28>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [5]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [26]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [20]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I5(N48),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<28>_734 )
  );
  LUT5 #(
    .INIT ( 32'h96696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<3>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [26]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [31]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [6]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [25]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [27]),
    .O(N50)
  );
  LUT6 #(
    .INIT ( 64'hE44E4EE44EE4E44E ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<3>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [5]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [4]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [0]),
    .I5(N50),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<3>_709 )
  );
  LUT5 #(
    .INIT ( 32'h96696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<14>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [26]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [28]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [31]),
    .O(N52)
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<14>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<14>_bdd6 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [5]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [4]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [6]),
    .I5(N52),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<14>_720 )
  );
  LUT5 #(
    .INIT ( 32'h96696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT2_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [7]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [24]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [27]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [29]),
    .O(N54)
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT2  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [4]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [26]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [2]),
    .I5(N54),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<10> )
  );
  LUT5 #(
    .INIT ( 32'h96696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT3_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [7]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [6]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [24]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [25]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [27]),
    .O(N56)
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT3  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [3]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [28]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [3]),
    .I5(N56),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<11> )
  );
  LUT6 #(
    .INIT ( 64'h9669699669969669 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT51  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [6]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [5]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [25]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [27]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [26]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT5 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT52  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [30]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [29]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT51_1613 )
  );
  LUT5 #(
    .INIT ( 32'h69FF6900 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT53  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT51_1613 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [31]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT5 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<13> )
  );
  LUT5 #(
    .INIT ( 32'h96696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT7_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [28]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [31]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [27]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [29]),
    .O(N58)
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT7  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [3]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [0]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [7]),
    .I5(N58),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<15> )
  );
  LUT4 #(
    .INIT ( 16'h9669 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT12_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [6]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [24]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [25]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [30]),
    .O(N60)
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT12  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [31]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [7]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [1]),
    .I5(N60),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<1> )
  );
  LUT5 #(
    .INIT ( 32'h96696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT20_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [31]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [6]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [25]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [29]),
    .O(N62)
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT20  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [28]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [19]),
    .I5(N62),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<27> )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT281  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [29]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [30]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [7]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [24]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT28 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT282  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [28]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [27]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [4]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [6]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [25]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT281_1618 )
  );
  LUT6 #(
    .INIT ( 64'h6996FFFF69960000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT283  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT281_1618 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [31]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT28 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<5> )
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT31  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [3]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [28]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [0]),
    .I5(N56),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<8> )
  );
  LUT5 #(
    .INIT ( 32'h96696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT32_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [28]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [6]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [25]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [29]),
    .O(N66)
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/Mmux_CALC[23]_CALC[23]_mux_3_OUT32  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DATA_REG_3 [3]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [26]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC [1]),
    .I5(N66),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRCGEN/CALC[23]_CALC[23]_mux_3_OUT<9> )
  );
  LUT5 #(
    .INIT ( 32'h96696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT32_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [26]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [28]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [6]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [25]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [29]),
    .O(N68)
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT32  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [5]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [1]),
    .I5(N68),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<9> )
  );
  LUT5 #(
    .INIT ( 32'h96696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT31_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [6]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [24]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [25]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [27]),
    .O(N70)
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT31  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [4]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [28]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [0]),
    .I5(N70),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<8> )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT281  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [29]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [30]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [24]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT28 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT282  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [28]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [27]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [4]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [6]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [25]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT281_1623 )
  );
  LUT6 #(
    .INIT ( 64'h6996FFFF69960000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT283  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT281_1623 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [31]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT28 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<5> )
  );
  LUT5 #(
    .INIT ( 32'h96696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT20_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [28]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [31]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [6]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [25]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [29]),
    .O(N72)
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT20  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [19]),
    .I5(N72),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<27> )
  );
  LUT4 #(
    .INIT ( 16'h9669 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT12_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [6]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [24]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [25]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [30]),
    .O(N74)
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT12  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [31]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [1]),
    .I5(N74),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<1> )
  );
  LUT5 #(
    .INIT ( 32'h96696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT7_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [28]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [31]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [27]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [29]),
    .O(N76)
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT7  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [4]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [7]),
    .I5(N76),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<15> )
  );
  LUT6 #(
    .INIT ( 64'h9669699669969669 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT51  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [6]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [5]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [25]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [27]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [26]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT5 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT52  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [30]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [29]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT51_1628 )
  );
  LUT5 #(
    .INIT ( 32'h69FF6900 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT53  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT51_1628 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [31]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT5 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<13> )
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT3  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [4]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [28]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [3]),
    .I5(N70),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<11> )
  );
  LUT5 #(
    .INIT ( 32'h96696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT2_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [26]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [24]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [27]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [29]),
    .O(N80)
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/Mmux_CALC[23]_CALC[23]_mux_3_OUT2  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [5]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [4]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [2]),
    .I5(N80),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<10> )
  );
  LUT5 #(
    .INIT ( 32'h96696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<14>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [26]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [28]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [31]),
    .O(N82)
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<14>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<14>_bdd6 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [5]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [6]),
    .I5(N82),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<14>_803 )
  );
  LUT5 #(
    .INIT ( 32'h96696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<3>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [26]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [31]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [6]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [25]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [27]),
    .O(N84)
  );
  LUT6 #(
    .INIT ( 64'hE44E4EE44EE4E44E ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<3>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [5]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [4]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I5(N84),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<3>_814 )
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<28>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [29]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [30]),
    .O(N86)
  );
  LUT6 #(
    .INIT ( 64'h6996FF009669FF00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<28>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [26]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [20]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I5(N86),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<28>_789 )
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<24>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [31]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [6]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [25]),
    .O(N88)
  );
  LUT6 #(
    .INIT ( 64'h6996FF009669FF00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<24>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [5]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [26]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [16]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I5(N88),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<24>_793 )
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<18>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [31]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [30]),
    .O(N90)
  );
  LUT6 #(
    .INIT ( 64'h6996FF009669FF00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<18>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [5]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [26]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [10]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I5(N90),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<18>_799 )
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<16>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [24]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [29]),
    .O(N92)
  );
  LUT6 #(
    .INIT ( 64'h6996FF009669FF00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<16>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [28]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [8]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I5(N92),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<16>_801 )
  );
  LUT6 #(
    .INIT ( 64'h9669699669969669 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<7>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [26]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [31]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [24]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [27]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [29]),
    .O(N94)
  );
  LUT6 #(
    .INIT ( 64'h6996FF009669FF00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<7>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [4]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I5(N94),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<7>_810 )
  );
  LUT5 #(
    .INIT ( 32'h96696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<6>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [5]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [26]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [28]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [31]),
    .O(N96)
  );
  LUT6 #(
    .INIT ( 64'h6996FF009669FF00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<6>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<12>_bdd6 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [6]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I5(N96),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<6>_811 )
  );
  LUT4 #(
    .INIT ( 16'h9669 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<4>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [26]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [28]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [24]),
    .O(N98)
  );
  LUT6 #(
    .INIT ( 64'hD77D28827DD78228 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<4>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<14>_bdd6 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [5]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [4]),
    .I5(N98),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<4>_813 )
  );
  LUT5 #(
    .INIT ( 32'h96696996 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<2>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [26]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [31]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [6]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [24]),
    .O(N100)
  );
  LUT6 #(
    .INIT ( 64'hE44E4EE44EE4E44E ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<2>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<23>_bdd2 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [5]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I5(N100),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<2>_815 )
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<26>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [28]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [24]),
    .O(N102)
  );
  LUT6 #(
    .INIT ( 64'h6996FF009669FF00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<26>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<14>_bdd6 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [4]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [18]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I5(N102),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<26>_791 )
  );
  LUT6 #(
    .INIT ( 64'h9669699669969669 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<12>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [5]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [26]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [28]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [6]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [24]),
    .O(N104)
  );
  LUT6 #(
    .INIT ( 64'h6996FF009669FF00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<12>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<12>_bdd6 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [4]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I5(N104),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC[23]_CALC[23]_mux_3_OUT<12>_805 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFEFFF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_RX_DV_REG6_AND_324_o2_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [6]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [0]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [5]),
    .O(N106)
  );
  LUT6 #(
    .INIT ( 64'h0000004000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_RX_DV_REG6_AND_324_o2  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG6_888 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG6_885 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [3]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [7]),
    .I4(N106),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GND_42_o_RX_DV_REG6_AND_324_o )
  );
  LUT5 #(
    .INIT ( 32'hF7FFFFFF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/PWR_44_o_RX_ERR_REG6_AND_322_o1_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [6]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [5]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [2]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [0]),
    .O(N108)
  );
  LUT6 #(
    .INIT ( 64'h0000000001000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/PWR_44_o_RX_ERR_REG6_AND_322_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG6_885 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG6_888 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG6 [7]),
    .I5(N108),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/PWR_44_o_RX_ERR_REG6_AND_322_o )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/PRE_FALSE_CARR_FLAG2_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [6]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [4]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG5 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [0]),
    .O(N110)
  );
  LUT6 #(
    .INIT ( 64'h0000000000800000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/PRE_FALSE_CARR_FLAG2  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG5 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [7]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [3]),
    .I5(N110),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/PRE_FALSE_CARR_FLAG )
  );
  LUT6 #(
    .INIT ( 64'h0000000000010000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/PRE_IFG_FLAG1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [7]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG5 ),
    .I5(N110),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/PRE_IFG_FLAG )
  );
  LUT5 #(
    .INIT ( 32'hFFFF5755 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/SFD_FLAG_DATA_NO_FCS_OR_232_o_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_NO_FCS_1108 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/TYPE_PACKET_908 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/LT_CHECK_HELD_855 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_MATCH_911 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_ONE_1110 ),
    .O(N122)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF00010101 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/SFD_FLAG_DATA_NO_FCS_OR_232_o  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_ZERO_1111 ),
    .I2(N122),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_DATA_950 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/DAT_FIELD_944 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/SFD_FLAG_DATA_NO_FCS_OR_232_o_1069 )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_LT_CHECK_DISABLE_AND_371_o_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/LT_CHECK_HELD_855 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LESS_THAN_256_1112 ),
    .O(N124)
  );
  LUT6 #(
    .INIT ( 64'h0000004000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_LT_CHECK_DISABLE_AND_371_o  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_FIELD_COUNTER[1]_AND_376_o ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .I4(N124),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_LT_CHECK_DISABLE_AND_371_o1 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_LT_CHECK_DISABLE_AND_371_o_1072 )
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER[10]_LENGTH_TYPE[10]_equal_8_o111  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [5]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [9]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [9]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [8]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [8]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER[10]_LENGTH_TYPE[10]_equal_8_o11 )
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER[10]_LENGTH_TYPE[10]_equal_8_o112  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [6]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [6]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [10]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [10]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [7]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [7]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER[10]_LENGTH_TYPE[10]_equal_8_o111_1648 )
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER[10]_LENGTH_TYPE[10]_equal_8_o114  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [2]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [1]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER[10]_LENGTH_TYPE[10]_equal_8_o113 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/VLAN_ENABLE_PWR_48_o_AND_410_o<0>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/LEN_FIELD_945 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/VLAN_ENABLE_HELD_857 ),
    .O(N128)
  );
  LUT6 #(
    .INIT ( 64'h4000000000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/VLAN_ENABLE_PWR_48_o_AND_410_o<0>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_LT_CHECK_DISABLE_AND_371_o1 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [0]),
    .I5(N128),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/VLAN_ENABLE_PWR_48_o_AND_410_o )
  );
  LUT6 #(
    .INIT ( 64'h9009000000009001 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n01481  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [3]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [3]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [2]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n01481_1651 )
  );
  LUT6 #(
    .INIT ( 64'h00200020AAAA0020 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n01483  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [4]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [3]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/VLAN_FRAME_907 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_ENABLE_HELD_853 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n01483_1652 )
  );
  LUT6 #(
    .INIT ( 64'hBBBFBBBB000F0000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n01484  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_ENABLE_HELD_853 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/VLAN_FRAME_907 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [3]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [2]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n01483_1652 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n01481_1651 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n01484_1653 )
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n014821  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [13]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [13]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [14]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n014821_1654 )
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n014822  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [9]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [9]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [8]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [8]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n014822_1655 )
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n014823  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [5]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [12]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [12]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [11]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [11]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n014823_1656 )
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n014824  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [10]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [10]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [7]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [7]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [6]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MAX_FRAME_LENGTH_HELD [6]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n014824_1657 )
  );
  LUT5 #(
    .INIT ( 32'h40000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n014825  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/EXT_FIELD_942 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n014824_1657 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n014821_1654 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n014823_1656 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n014822_1655 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n01482 )
  );
  LUT6 #(
    .INIT ( 64'h00B000B0BBBB00B0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FRAME_LEN_ERR_END_OF_DATA_OR_242_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/EXCEEDED_MIN_LEN_1126 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/MIN_LENGTH_MATCH_1127 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CONTROL_FRAME_320 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/PAUSE_LT_CHECK_HELD_854 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/PADDED_FRAME_912 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/LT_CHECK_HELD_855 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FRAME_LEN_ERR_END_OF_DATA_OR_242_o1_1658 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FRAME_LEN_ERR_END_OF_DATA_OR_242_o2  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/PADDED_FRAME_912 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/TYPE_PACKET_908 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/LT_CHECK_HELD_855 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_MATCH_911 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FRAME_LEN_ERR_END_OF_DATA_OR_242_o2_1659 )
  );
  LUT6 #(
    .INIT ( 64'hFFA8FFA8FFFFFFA8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FRAME_LEN_ERR_END_OF_DATA_OR_242_o3  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_DATA_950 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FRAME_LEN_ERR_END_OF_DATA_OR_242_o2_1659 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FRAME_LEN_ERR_END_OF_DATA_OR_242_o1_1658 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FRAME_LEN_ERR_1125 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/CRC_FIELD_943 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/EXCEEDED_MIN_LEN_1126 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FRAME_LEN_ERR_END_OF_DATA_OR_242_o )
  );
  LUT3 #(
    .INIT ( 8'hEF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/GND_47_o_FRAME_COUNTER[7]_equal_1_o<7>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [1]),
    .O(N130)
  );
  LUT6 #(
    .INIT ( 64'h0000004000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/GND_47_o_FRAME_COUNTER[7]_equal_1_o<7>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [7]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [5]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [6]),
    .I4(N130),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [4]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/GND_47_o_FRAME_COUNTER[7]_equal_1_o )
  );
  LUT6 #(
    .INIT ( 64'hAAA8A8A8A8A8A8A8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd3-In1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd4_1148 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_deassert_1154 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/two_byte_tx_1157 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/gate_tready_1162 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_mac_tready_reg_1160 ),
    .I5(tx_axis_mac_tlast),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd3-In1_1661 )
  );
  LUT5 #(
    .INIT ( 32'hFFFF0040 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd3-In2  (
    .I0(tx_axis_mac_tvalid),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd7_1149 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_end_1159 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_OUT_287 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd3-In1_1661 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd3-In )
  );
  LUT6 #(
    .INIT ( 64'h0004040404040404 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd4-In_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_deassert_1154 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd4_1148 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/two_byte_tx_1157 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/gate_tready_1162 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_mac_tready_reg_1160 ),
    .I5(tx_axis_mac_tlast),
    .O(N132)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFAAAA88A8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd4-In  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_OUT_287 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd1_1146 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd7_1149 ),
    .I3(tx_axis_mac_tvalid),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd6_1144 ),
    .I5(N132),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_PWR_24_o_equal_77_o )
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_deassert_1154 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/two_byte_tx_1157 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o1_1663 )
  );
  LUT4 #(
    .INIT ( 16'h2AAA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o2  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd4_1148 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_mac_tready_reg_1160 ),
    .I2(tx_axis_mac_tlast),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/gate_tready_1162 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o2_1664 )
  );
  LUT6 #(
    .INIT ( 64'hFFFF0000FE000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o3  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd7_1149 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd6_1144 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd1_1146 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_OUT_287 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o1_1663 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o2_1664 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o3_1665 )
  );
  LUT6 #(
    .INIT ( 64'hA8A8A8A8A8AAA8A8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o4  (
    .I0(tx_axis_mac_tvalid),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd2_1142 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd7_1149 ),
    .I3(tx_axis_mac_tuser[0]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd10_1147 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/no_burst_1161 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o4_1666 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF54444444 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o5  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_OUT_287 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd2_1142 ),
    .I2(tx_axis_mac_tlast),
    .I3(tx_axis_mac_tuser[0]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd6_1144 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/ignore_packet_1156 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o5_1667 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFEEFE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o6  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o5_1667 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o4_1666 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd9_1129 ),
    .I3(tx_axis_mac_tlast),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o3_1665 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_ignore_packet_OR_49_o )
  );
  LUT4 #(
    .INIT ( 16'h8880 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd7-In_SW0  (
    .I0(tx_axis_mac_tlast),
    .I1(tx_axis_mac_tuser[0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd8_1145 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd9_1129 ),
    .O(N134)
  );
  LUT6 #(
    .INIT ( 64'hEEEEEEEEEEEEEEFE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd7-In  (
    .I0(N134),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd5_1150 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd7_1149 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_OUT_287 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_end_1159 ),
    .I5(tx_axis_mac_tvalid),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd7-In_1132 )
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd10-In_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/no_burst_1161 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/ignore_packet_1156 ),
    .I2(tx_axis_mac_tuser[0]),
    .O(N136)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFB3A2A2A2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd10-In  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd10_1147 ),
    .I1(tx_axis_mac_tvalid),
    .I2(N136),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_OUT_287 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd2_1142 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd3_1143 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_tx_enable_reg_AND_28_o )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_tx_state[3]_OR_24_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/two_byte_tx_1157 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd4_1148 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_tx_state[3]_OR_24_o1_1670 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFF88A8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_tx_state[3]_OR_24_o2  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_OUT_287 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_deassert_1154 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd2_1142 ),
    .I3(tx_axis_mac_tvalid),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd3_1143 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_tx_state[3]_OR_24_o1_1670 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_tx_state[3]_OR_24_o2_1671 )
  );
  LUT4 #(
    .INIT ( 16'h8088 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_mac_tready_int_tx_ack_OR_32_o_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd4_1148 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/gate_tready_1162 ),
    .I2(tx_axis_mac_tuser[0]),
    .I3(tx_axis_mac_tvalid),
    .O(N138)
  );
  LUT6 #(
    .INIT ( 64'hFFFF222022202220 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_mac_tready_int_tx_ack_OR_32_o  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_underrun_1155 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd1_1146 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_OUT_287 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_end_1159 ),
    .I4(N138),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_mac_tready_reg_1160 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_underrun_glue_set )
  );
  LUT6 #(
    .INIT ( 64'h0000000000010000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/GND_27_o_DATA[7]_equal_8_o<7>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY [3]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [0]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY [4]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/GND_27_o_DATA[7]_equal_8_o<7> )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/GND_27_o_DATA[7]_equal_8_o<7>2  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY [6]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_OPCODE_EARLY [7]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [2]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [3]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/GND_27_o_DATA[7]_equal_8_o<7>1_1674 )
  );
  LUT6 #(
    .INIT ( 64'h0001000000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/GND_27_o_DATA[7]_equal_8_o<7>3  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [7]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [6]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [4]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA [5]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/GND_27_o_DATA[7]_equal_8_o<7> ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/GND_27_o_DATA[7]_equal_8_o<7>1_1674 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/GND_27_o_DATA[7]_equal_8_o )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0150_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_STATUS_INT_1188 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_REQ_INT_1309 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2_1286 ),
    .I3(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .O(N144)
  );
  LUT6 #(
    .INIT ( 64'h0000131300001353 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0150  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/END_OF_TX_HELD_1311 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/COUNT_SET_1187 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_IN_REG_1331 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .I4(N144),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_END_OF_TX ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0150_1301 )
  );
  LUT4 #(
    .INIT ( 16'hFFBF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0200_inv_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [3]),
    .O(N146)
  );
  LUT6 #(
    .INIT ( 64'h8888880008080800 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0200_inv  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_REQ_INT_1309 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_INT_1330 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd1_1332 ),
    .I5(N146),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0200_inv_1285 )
  );
  LUT5 #(
    .INIT ( 32'hFDFFFFFF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0156_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .O(N148)
  );
  LUT6 #(
    .INIT ( 64'h0004444444444444 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0156  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_REQ_INT_1309 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd1_1332 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_INT_1330 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .I5(N148),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0156_1300 )
  );
  LUT5 #(
    .INIT ( 32'hFFFF0010 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2-In1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_STATUS_INT_1188 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_IN_REG_1331 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/END_OF_TX_HELD_1311 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_REQ_INT_1309 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2-In1_1678 )
  );
  LUT5 #(
    .INIT ( 32'h7474FE74 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2-In3  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd1_1332 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2_1286 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2-In1_1678 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2-In2_1679 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/CONTROL_COMPLETE ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2-In )
  );
  LUT4 #(
    .INIT ( 16'hAC00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT101  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [11]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_Mux_26_o11_1280 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT10 )
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT102  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [43]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [35]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT101_1681 )
  );
  LUT6 #(
    .INIT ( 64'h7776676655544544 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT103  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [19]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [27]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT101_1681 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT102_1682 )
  );
  LUT5 #(
    .INIT ( 32'h88800800 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT104  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [3]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [11]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT103_1683 )
  );
  LUT5 #(
    .INIT ( 32'hFFFF5410 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT105  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT103_1683 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT102_1682 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT10 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<3> )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT71  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [18]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [34]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [42]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [26]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT7 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT72  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [10]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT71_1685 )
  );
  LUT6 #(
    .INIT ( 64'h1404040410000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT73  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT71_1685 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT7 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT72_1686 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFA820 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT74  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_Mux_26_o11_1280 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [10]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE [2]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT72_1686 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<2> )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT141  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [21]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [37]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [45]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [29]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT14 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT142  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [13]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT141_1688 )
  );
  LUT6 #(
    .INIT ( 64'h1404040410000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT143  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT141_1688 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT14 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT142_1689 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFA820 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT144  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_Mux_26_o11_1280 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [13]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE [5]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT142_1689 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<5> )
  );
  LUT6 #(
    .INIT ( 64'hF0F0FF00CCCCAAAA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT121  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [20]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [36]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [44]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [28]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT12 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT122  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [12]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT121_1691 )
  );
  LUT6 #(
    .INIT ( 64'h1404040410000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT123  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT121_1691 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT12 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT122_1692 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFA820 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT124  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_Mux_26_o11_1280 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [12]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE [4]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT122_1692 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<4> )
  );
  LUT6 #(
    .INIT ( 64'hDDA2DD8099A29980 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT31  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [40]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [2]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [24]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [8]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT3 )
  );
  LUT6 #(
    .INIT ( 64'h5499109954111011 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT32  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [16]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [3]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [32]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT31_1694 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT33  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [8]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT32_1695 )
  );
  LUT6 #(
    .INIT ( 64'hFFFF514051405140 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT34  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT3 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT31_1694 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_Mux_26_o11_1280 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT32_1695 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<0> )
  );
  LUT4 #(
    .INIT ( 16'hAC00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT51  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [9]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_Mux_26_o11_1280 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT5 )
  );
  LUT6 #(
    .INIT ( 64'h4440040004000400 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT52  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [9]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT51_1697 )
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT53  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [41]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [25]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT52_1698 )
  );
  LUT6 #(
    .INIT ( 64'hFB44EA4451444044 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT54  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [33]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [3]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [17]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT52_1698 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT53_1699 )
  );
  LUT5 #(
    .INIT ( 32'hFFFF5150 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT55  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT51_1697 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT53_1699 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT5 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<1> )
  );
  LUT4 #(
    .INIT ( 16'hAC00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT161  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE [6]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [14]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_Mux_26_o11_1280 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT16 )
  );
  LUT6 #(
    .INIT ( 64'h4440040004000400 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT162  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [6]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [14]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT161_1701 )
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT163  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [46]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [30]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT162_1702 )
  );
  LUT6 #(
    .INIT ( 64'hFB44EA4451444044 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT164  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [38]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [3]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [22]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT162_1702 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT163_1703 )
  );
  LUT5 #(
    .INIT ( 32'hFFFF5150 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT165  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT161_1701 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT163_1703 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT16 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<6> )
  );
  LUT4 #(
    .INIT ( 16'hAC00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT191  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_SAMPLE [7]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_VALUE_HELD [15]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_Mux_26_o11_1280 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT19 )
  );
  LUT4 #(
    .INIT ( 16'hA0CF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT192  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [47]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [39]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [3]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT191_1705 )
  );
  LUT6 #(
    .INIT ( 64'h54FF10FF54101010 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT193  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [7]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [2]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [15]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT191_1705 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT192_1706 )
  );
  LUT5 #(
    .INIT ( 32'h75226422 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT194  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [31]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [3]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_SOURCE_HELD [23]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT193_1707 )
  );
  LUT5 #(
    .INIT ( 32'hFFFF5410 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT195  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT193_1707 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT192_1706 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mmux_DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT19 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT[4]_GND_28_o_wide_mux_25_OUT<7> )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA_xor<4>1_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2_1286 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/COUNT_SET_1187 ),
    .O(N152)
  );
  LUT6 #(
    .INIT ( 64'h2888888888888888 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA_xor<4>1  (
    .I0(N152),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [3]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA4 )
  );
  LUT3 #(
    .INIT ( 8'h7F ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA_xor<5>1_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [0]),
    .O(N154)
  );
  LUT6 #(
    .INIT ( 64'h88884888AAAA5AAA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA_xor<5>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [5]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2_1286 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [1]),
    .I4(N154),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/COUNT_SET_1187 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_QUANTA5 )
  );
  LUT4 #(
    .INIT ( 16'hFF7F ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/_n0068_inv_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [5]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_STATUS_INT_1188 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/COUNT_SET_1187 ),
    .O(N156)
  );
  LUT6 #(
    .INIT ( 64'hFFFF0000FFFF8000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/_n0068_inv  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_QUANTA [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mmux_COUNT_SET_GND_31_o_MUX_237_o12_1401 ),
    .I5(N156),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/_n0068_inv_1449 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mmux_COUNT_SET_GND_31_o_MUX_237_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [6]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [7]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [8]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [9]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mmux_COUNT_SET_GND_31_o_MUX_237_o1 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mmux_COUNT_SET_GND_31_o_MUX_237_o12  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [14]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [15]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [2]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [3]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mmux_COUNT_SET_GND_31_o_MUX_237_o1 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mmux_COUNT_SET_GND_31_o_MUX_237_o11_1712 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mmux_COUNT_SET_GND_31_o_MUX_237_o13  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [10]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [11]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [12]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [13]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mmux_COUNT_SET_GND_31_o_MUX_237_o11_1712 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mmux_COUNT_SET_GND_31_o_MUX_237_o13_1713 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT[15]_GND_31_o_equal_8_o<15>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [3]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [4]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT[15]_GND_31_o_equal_8_o<15> )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT[15]_GND_31_o_equal_8_o<15>2  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [7]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [6]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [8]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [9]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [10]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [11]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT[15]_GND_31_o_equal_8_o<15>1_1715 )
  );
  LUT6 #(
    .INIT ( 64'h0001000000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT[15]_GND_31_o_equal_8_o<15>3  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [15]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [14]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [12]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [13]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT[15]_GND_31_o_equal_8_o<15>1_1715 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT[15]_GND_31_o_equal_8_o<15> ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT[15]_GND_31_o_equal_8_o )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT71  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [2]),
    .I2(rx_mac_config_vector[46]),
    .I3(rx_mac_config_vector[78]),
    .I4(rx_mac_config_vector[70]),
    .I5(rx_mac_config_vector[38]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT7 )
  );
  LUT5 #(
    .INIT ( 32'hFBEA5140 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT72  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [0]),
    .I2(rx_mac_config_vector[62]),
    .I3(rx_mac_config_vector[54]),
    .I4(rx_mac_config_vector[38]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT71_1717 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT73  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT7 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT71_1717 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<6> )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT61  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [2]),
    .I2(rx_mac_config_vector[45]),
    .I3(rx_mac_config_vector[77]),
    .I4(rx_mac_config_vector[69]),
    .I5(rx_mac_config_vector[37]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT6 )
  );
  LUT5 #(
    .INIT ( 32'hFBEA5140 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT62  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [0]),
    .I2(rx_mac_config_vector[61]),
    .I3(rx_mac_config_vector[53]),
    .I4(rx_mac_config_vector[37]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT61_1719 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT63  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT6 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT61_1719 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<5> )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT51  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [2]),
    .I2(rx_mac_config_vector[44]),
    .I3(rx_mac_config_vector[76]),
    .I4(rx_mac_config_vector[68]),
    .I5(rx_mac_config_vector[36]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT5 )
  );
  LUT5 #(
    .INIT ( 32'hFBEA5140 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT52  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [0]),
    .I2(rx_mac_config_vector[60]),
    .I3(rx_mac_config_vector[52]),
    .I4(rx_mac_config_vector[36]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT51_1721 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT53  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT5 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT51_1721 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<4> )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT41  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [2]),
    .I2(rx_mac_config_vector[43]),
    .I3(rx_mac_config_vector[75]),
    .I4(rx_mac_config_vector[67]),
    .I5(rx_mac_config_vector[35]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT4 )
  );
  LUT5 #(
    .INIT ( 32'hFBEA5140 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT42  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [0]),
    .I2(rx_mac_config_vector[59]),
    .I3(rx_mac_config_vector[51]),
    .I4(rx_mac_config_vector[35]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT41_1723 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT43  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT4 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT41_1723 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<3> )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT31  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [2]),
    .I2(rx_mac_config_vector[42]),
    .I3(rx_mac_config_vector[74]),
    .I4(rx_mac_config_vector[66]),
    .I5(rx_mac_config_vector[34]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT3 )
  );
  LUT5 #(
    .INIT ( 32'hFBEA5140 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT32  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [0]),
    .I2(rx_mac_config_vector[58]),
    .I3(rx_mac_config_vector[50]),
    .I4(rx_mac_config_vector[34]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT31_1725 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT33  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT3 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT31_1725 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<2> )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT21  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [2]),
    .I2(rx_mac_config_vector[41]),
    .I3(rx_mac_config_vector[73]),
    .I4(rx_mac_config_vector[65]),
    .I5(rx_mac_config_vector[33]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT2 )
  );
  LUT5 #(
    .INIT ( 32'hFBEA5140 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT22  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [0]),
    .I2(rx_mac_config_vector[57]),
    .I3(rx_mac_config_vector[49]),
    .I4(rx_mac_config_vector[33]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT21_1727 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT23  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT2 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT21_1727 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<1> )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [2]),
    .I2(rx_mac_config_vector[40]),
    .I3(rx_mac_config_vector[72]),
    .I4(rx_mac_config_vector[64]),
    .I5(rx_mac_config_vector[32]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT1 )
  );
  LUT5 #(
    .INIT ( 32'hFBEA5140 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT12  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [0]),
    .I2(rx_mac_config_vector[56]),
    .I3(rx_mac_config_vector[48]),
    .I4(rx_mac_config_vector[32]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT11_1729 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT13  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT1 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT11_1729 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<0> )
  );
  LUT6 #(
    .INIT ( 64'h8008400420021001 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_comb81  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [6]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [7]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_addr_lut [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_addr_lut [6]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_addr_lut [7]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_comb8 )
  );
  LUT6 #(
    .INIT ( 64'h8040201008040201 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_comb82  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [5]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_addr_lut [3]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_addr_lut [4]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_addr_lut [5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_comb81_1731 )
  );
  LUT6 #(
    .INIT ( 64'h8421000000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_comb83  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_addr_lut [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_addr_lut [2]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_comb8 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_comb81_1731 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_comb )
  );
  LUT6 #(
    .INIT ( 64'h8040201008040201 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_reg_rx_data[7]_MUX_958_o81  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [6]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [7]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/expected_pause_data [6]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/expected_pause_data [7]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/expected_pause_data [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_reg_rx_data[7]_MUX_958_o8 )
  );
  LUT6 #(
    .INIT ( 64'h8040201008040201 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_reg_rx_data[7]_MUX_958_o82  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [5]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/expected_pause_data [3]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/expected_pause_data [4]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/expected_pause_data [5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_reg_rx_data[7]_MUX_958_o81_1733 )
  );
  LUT6 #(
    .INIT ( 64'h8421000000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_reg_rx_data[7]_MUX_958_o83  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/expected_pause_data [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/expected_pause_data [2]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_reg_rx_data[7]_MUX_958_o8 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_reg_rx_data[7]_MUX_958_o81_1733 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_reg_rx_data[7]_MUX_958_o )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcast_byte_match_rx_data[7]_MUX_938_o<7>_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [5]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [0]),
    .O(N158)
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcast_byte_match_rx_data[7]_MUX_938_o<7>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [7]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [6]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [4]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [3]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [1]),
    .I5(N158),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcast_byte_match_rx_data[7]_MUX_938_o )
  );
  LUT6 #(
    .INIT ( 64'h2222222220202000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/next_rx_state[1]_rx_enable_AND_7_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd2_1569 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_GOOD_FRAME_INT_293 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd1_1575 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_VALID_INT_291 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/fsmfake0 [0]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_BAD_FRAME_INT_292 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/next_rx_state[1]_rx_enable_AND_7_o )
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state[1]_next_rx_state[1]_OR_9_o1_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_GOOD_FRAME_INT_293 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_BAD_FRAME_INT_292 ),
    .O(N160)
  );
  LUT6 #(
    .INIT ( 64'hFFFF1F7FFFFF0F0F ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state[1]_next_rx_state[1]_OR_9_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/fsmfake0 [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_VALID_INT_291 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd2_1569 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd1_1575 ),
    .I4(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .I5(N160),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state[1]_next_rx_state[1]_OR_9_o_0 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_TX_EN_DELAY  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_TX_EN_DELAY_glue_set_1736 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_TX_EN_DELAY_347 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/CAPTURE  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_TX_EN_DELAY_EARLY ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/CAPTURE_348 )
  );
  FDS   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_2  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_2_glue_rst_1737 ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_2_617 )
  );
  FDS   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_3  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_3_glue_rst_1738 ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_3_618 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_4  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_4_glue_set_1739 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_4_619 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_4_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n08242 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_4_glue_set_1739 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_13  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_13_glue_set_1740 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [13])
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_12  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_12_glue_set_1741 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [12])
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_11  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_11_glue_set_1742 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [11])
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_10  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_10_glue_set_1743 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [10])
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_9  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_9_glue_set_1744 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [9])
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_8  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_8_glue_set_1745 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [8])
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_7  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_7_glue_set_1746 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [7])
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_6  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_6_glue_set_1747 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [6])
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_5  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_5_glue_set_1748 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [5])
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_4  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_4_glue_set_1749 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [4])
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_3  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_3_glue_set_1750 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [3])
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_2  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_2_glue_set_1751 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [2])
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_1  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_1_glue_set_1752 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [1])
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_0  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_0_glue_set_1753 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [0])
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/VALIDATE_REQUIRED  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/VALIDATE_REQUIRED_glue_set_1754 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/VALIDATE_REQUIRED_846 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_EARLY_INT  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_EARLY_INT_glue_set_1755 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_EARLY_INT_847 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/EXT_FIELD  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/EXT_FIELD_glue_set_1756 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/EXT_FIELD_942 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_glue_set_1757 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/MAX_LENGTH_ERR  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/MAX_LENGTH_ERR_glue_set_1758 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/MAX_LENGTH_ERR_1121 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_burst2  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_burst2_glue_set_1759 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_burst2_1151 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_assert  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_assert_glue_set_1760 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_assert_1153 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_burst1  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_burst1_glue_set_1761 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_burst1_1152 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_deassert  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_deassert_glue_set_1762 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_deassert_1154 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_underrun  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_underrun_glue_set_1763 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_underrun_1155 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/ignore_packet  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/ignore_packet_glue_set_1764 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/ignore_packet_1156 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_valid  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_valid_glue_set_1765 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_valid_311 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tlast_reg  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tlast_reg_glue_set ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tlast_reg_1158 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_underrun  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_underrun_glue_set ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_underrun_310 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/PAUSE_VECTOR_0  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/PAUSE_VECTOR_0_glue_set_1768 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/PAUSE_VECTOR_0 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_REQ_INT  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_REQ_INT_glue_set_1769 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_REQ_INT_1271 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/BAD_OPCODE_INT  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/BAD_OPCODE_INT_glue_set_1770 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/BAD_OPCODE_INT_1270 )
  );
  FDS   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT_0  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT_0_glue_rst_1771 ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0])
  );
  FDS   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT_4  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT_4_glue_rst_1772 ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [4])
  );
  FDS   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT_1  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT_1_glue_rst_1773 ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1])
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_REQ_INT  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_REQ_INT_glue_set_1774 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_REQ_INT_1309 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/END_OF_TX_HELD  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/END_OF_TX_HELD_glue_set_1776 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/END_OF_TX_HELD_1311 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_STATUS_INT  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_STATUS_INT_glue_set_1777 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_STATUS_INT_1188 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_glue_set_1778 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_1533 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_glue_set_1779 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_1532 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcast_match  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcast_match_glue_set_1780 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcast_match_1534 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rxstatsaddressmatch  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rxstatsaddressmatch_glue_set_1781 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rxstatsaddressmatch_282 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/address_match  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/address_match_glue_set_1782 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/address_match_1531 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<13>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [13]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<13>_rt_1783 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<12>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [12]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<12>_rt_1784 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<11>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [11]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<11>_rt_1785 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<10>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [10]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<10>_rt_1786 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<9>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [9]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<9>_rt_1787 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<8>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [8]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<8>_rt_1788 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<7>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [7]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<7>_rt_1789 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<6>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [6]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<6>_rt_1790 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<5>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<5>_rt_1791 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<4>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [4]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<4>_rt_1792 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<3>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [3]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<3>_rt_1793 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<2>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<2>_rt_1794 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<1>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_cy<1>_rt_1795 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<9>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [9]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<9>_rt_1796 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<8>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [8]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<8>_rt_1797 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<7>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [7]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<7>_rt_1798 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<6>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [6]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<6>_rt_1799 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<5>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<5>_rt_1800 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<4>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [4]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<4>_rt_1801 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<3>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [3]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<3>_rt_1802 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<2>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<2>_rt_1803 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<1>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_cy<1>_rt_1804 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<13>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [13]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<13>_rt_1805 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<12>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [12]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<12>_rt_1806 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<11>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [11]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<11>_rt_1807 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<10>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [10]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<10>_rt_1808 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<9>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [9]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<9>_rt_1809 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<8>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [8]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<8>_rt_1810 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<7>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [7]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<7>_rt_1811 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<6>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [6]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<6>_rt_1812 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<5>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<5>_rt_1813 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<4>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [4]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<4>_rt_1814 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<3>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [3]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<3>_rt_1815 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<2>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<2>_rt_1816 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<1>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_cy<1>_rt_1817 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_xor<14>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_xor<14>_rt_1818 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_xor<10>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [10]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_xor<10>_rt_1819 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_xor<14>_rt  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_xor<14>_rt_1820 )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_rstpot  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_493 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_GND_37_o_MUX_383_o ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1012_inv_421 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_rstpot_1829 )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_rstpot  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_502 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_GND_37_o_MUX_348_o ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0942_inv_422 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_rstpot_1838 )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_rstpot  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CDS_GND_37_o_MUX_340_o ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0934_inv ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_rstpot_1839 )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CDS_rstpot  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CDS_504 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CDS_GND_37_o_MUX_340_o ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0926_inv ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CDS_rstpot_1840 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MATCH_FRAME_INT_rstpot  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FCS_949 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MATCH_FRAME_INT_848 ),
    .I2(N0),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MATCH_FRAME_INT_rstpot_1842 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MATCH_FRAME_INT  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MATCH_FRAME_INT_rstpot_1842 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/MATCH_FRAME_INT_848 )
  );
  FDS   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/TYPE_PACKET  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/TYPE_PACKET_rstpot_1843 ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/TYPE_PACKET_908 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/two_byte_tx  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/two_byte_tx_rstpot_1846 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/two_byte_tx_1157 )
  );
  FDR   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/COUNT_SET  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/COUNT_SET_rstpot_1847 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/COUNT_SET_1187 )
  );
  FDS   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/promiscuous_mode_sample  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/promiscuous_mode_sample_rstpot_1848 ),
    .S(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/promiscuous_mode_sample_1535 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd1  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd1_rstpot_1849 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd1_1146 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/no_burst  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/no_burst_rstpot_1850 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/no_burst_1161 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/update_pause_ad_sync_reg  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/update_pause_ad_sync_reg_rstpot_1851 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/update_pause_ad_sync_reg_1536 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_filtered_data_valid  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_filtered_data_valid_rstpot_1852 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_filtered_data_valid_286 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd1  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd1_rstpot_1853 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd1_1575 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tvalid  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tvalid_rstpot ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tvalid_262 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tlast  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tlast_rstpot ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tlast_263 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_2  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_2_rstpot ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [2])
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_end  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_end_rstpot_1857 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_end_1159 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_rstpot_1858 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/NUMBER_OF_BYTES  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/NUMBER_OF_BYTES_rstpot1_1859 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/NUMBER_OF_BYTES_232 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_2  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_2_rstpot1_1860 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR [2])
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_FINAL  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_FINAL_rstpot1_1861 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_FINAL_324 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_DATA  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_DATA_rstpot1_1862 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_DATA_950 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/SRC_ADDRESS_FIELD  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/SRC_ADDRESS_FIELD_rstpot1_1863 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/SRC_ADDRESS_FIELD_946 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FCS  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FCS_rstpot1_1864 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FCS_949 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_MATCH  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_MATCH_rstpot1_1865 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_MATCH_911 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CONTROL_FRAME_INT  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CONTROL_FRAME_INT_rstpot1_1866 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CONTROL_FRAME_INT_1089 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/ADD_CONTROL_ENABLE  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/ADD_CONTROL_ENABLE_rstpot1_1867 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/ADD_CONTROL_ENABLE_1091 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/MULTICAST_MATCH  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/MULTICAST_MATCH_rstpot1_1868 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/MULTICAST_MATCH_1090 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_WITH_FCS  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_WITH_FCS_rstpot1_1869 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_WITH_FCS_1109 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/PADDED_FRAME  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/PADDED_FRAME_rstpot1_1870 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/PADDED_FRAME_912 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/LENGTH_TYPE_ERR  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/LENGTH_TYPE_ERR_rstpot1_1871 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/LENGTH_TYPE_ERR_894 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/STATISTICS_VALID  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/STATISTICS_VALID_rstpot1_1872 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/STATISTICS_VALID_897 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/BAD_FRAME  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/BAD_FRAME_rstpot1_1873 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/BAD_FRAME_892 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/GOOD_FRAME  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/GOOD_FRAME_rstpot1_1874 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/GOOD_FRAME_893 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/CRC_ENGINE_ERR  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/CRC_ENGINE_ERR_rstpot1_1875 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/CRC_ENGINE_ERR_1124 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_ENABLE_REG  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_ENABLE_REG_rstpot1_1876 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_ENABLE_REG_1183 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_ENABLE_REG  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_ENABLE_REG_rstpot1_1877 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_ENABLE_REG_1189 )
  );
  LUT6 #(
    .INIT ( 64'hAAA2FFE2AAA2FFF3 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/RX_DV_REG6_RX_ERR_REG6_OR_198_o_SW0_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG7_887 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG6_888 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG6_885 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_EXT_996 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG7_884 ),
    .O(N162)
  );
  LUT6 #(
    .INIT ( 64'hFFFF333354551011 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/RX_DV_REG6_RX_ERR_REG6_OR_198_o_SW0_SW1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_EXT_996 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG7_887 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG6_885 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG7_884 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG6_888 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 ),
    .O(N163)
  );
  LUT3 #(
    .INIT ( 8'h32 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_rstpot  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0150_1301 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_glue_ce_1775 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_rstpot_1858 )
  );
  LUT6 #(
    .INIT ( 64'h4040004040000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/END_OF_TX1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_SEEN_488 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_DATA_VALID_464 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_499 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_CONTROL_1321 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_IN_REG_1331 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_END_OF_TX )
  );
  LUT3 #(
    .INIT ( 8'h8A ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_2_glue_rst  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [2]),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n08242 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_2_glue_rst_1737 )
  );
  LUT3 #(
    .INIT ( 8'h8A ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_3_glue_rst  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_LENGTH [3]),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n08242 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_MAX_3_glue_rst_1738 )
  );
  LUT3 #(
    .INIT ( 8'h81 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/RX_DV_REG6_RX_ERR_REG6_OR_198_o_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [1]),
    .O(N167)
  );
  LUT6 #(
    .INIT ( 64'h3333333335333333 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/RX_DV_REG6_RX_ERR_REG6_OR_198_o  (
    .I0(N163),
    .I1(N162),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [7]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG5 ),
    .I4(N167),
    .I5(N110),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/RX_DV_REG6_RX_ERR_REG6_OR_198_o_984 )
  );
  LUT4 #(
    .INIT ( 16'hDFFF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/PRE_FALSE_CARR_FLAG2_SW1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [7]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG5 [1]),
    .O(N169)
  );
  LUT6 #(
    .INIT ( 64'h4044404440444444 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/RX_ERR_REG5_END_EXT_AND_333_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_EXT_996 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/EXT_FIELD_942 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG5 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG5 ),
    .I4(N169),
    .I5(N110),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/RX_ERR_REG5_END_EXT_AND_333_o )
  );
  LUT4 #(
    .INIT ( 16'hDDD0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rxstatsaddressmatch_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_srl16 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_srl16_reg1_1543 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_filtered_data_valid_286 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rxstatsaddressmatch_282 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rxstatsaddressmatch_glue_set_1781 )
  );
  LUT4 #(
    .INIT ( 16'h80FA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_TX_EN_DELAY_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_TX_EN_DELAY_347 ),
    .I1(NlwRenamedSig_OI_gmii_tx_en),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_TX_EN_DELAY_EARLY ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/CAPTURE_348 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_TX_EN_DELAY_glue_set_1736 )
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_DATA_rstpot1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG3_889 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG2 ),
    .I2(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_DATA_rstpot1_1862 )
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FCS_rstpot1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG6_888 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG5 ),
    .I2(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FCS_rstpot1_1864 )
  );
  LUT5 #(
    .INIT ( 32'h45557555 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut<0>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/GOOD_FRAME_IN_TX_REG_1458 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync2 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_REQ_TO_TX_1192 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [0])
  );
  LUT5 #(
    .INIT ( 32'h45557555 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut<1>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/GOOD_FRAME_IN_TX_REG_1458 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync2 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_REQ_TO_TX_1192 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [1])
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MAX_PKT_LEN_REACHED_rstpot_lut  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_JUMBO_EN_524 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_493 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MAX_PKT_LEN_REACHED_rstpot_lut_1882 )
  );
  MUXCY   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MAX_PKT_LEN_REACHED_rstpot_cy  (
    .CI(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o ),
    .DI(NlwRenamedSig_OI_N1),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MAX_PKT_LEN_REACHED_rstpot_lut_1882 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_l1 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R3_PWR_21_o_MUX_14_o ),
    .Q(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R3  (
    .C(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R2_272 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R3_274 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R3_PWR_21_o_MUX_14_o ),
    .Q(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R3  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R2_276 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R3_278 )
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_MULTI_MATCH  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1106_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_MULTI_MATCH_GND_37_o_MUX_505_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_MULTI_MATCH_470 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_STATUS_VALID  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_STATUS_VALID_GND_37_o_MUX_479_o ),
    .Q(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_STATUS_VALID )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_SCSH  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_SCSH_GND_37_o_MUX_514_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_SCSH_466 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PAD_PIPE  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PAD_PIPE_GND_37_o_MUX_470_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PAD_PIPE_481 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_PREAMBLE  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_PREAMBLE_GND_37_o_MUX_414_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_PREAMBLE_486 )
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_CRC_MODE  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0871_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_CRC_MODE_GND_37_o_MUX_312_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_CRC_MODE_463 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_DATA_VALID  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_DA_GND_37_o_MUX_351_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_DATA_VALID_464 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_TX_VLAN  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_TX_VLAN_GND_37_o_MUX_512_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_TX_VLAN_467 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_TX_CONTROL  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_TX_CONTROL_GND_37_o_MUX_510_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_TX_CONTROL_468 )
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE4_MATCH  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1106_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE4_MATCH_GND_37_o_MUX_503_o_537 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE4_MATCH_471 )
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE3_MATCH  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1106_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE3_MATCH_GND_37_o_MUX_501_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE3_MATCH_472 )
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE2_MATCH  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1106_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE2_MATCH_GND_37_o_MUX_499_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE2_MATCH_473 )
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE1_MATCH  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1106_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE1_MATCH_GND_37_o_MUX_497_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE1_MATCH_474 )
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE0_MATCH  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1106_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE0_MATCH_GND_37_o_MUX_495_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE0_MATCH_475 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_STATUS_VALID  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_STATUS_VALID_GND_37_o_MUX_474_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_STATUS_VALID_479 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CR178124_FIX  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CR178124_FIX_GND_37_o_MUX_472_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CR178124_FIX_480 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_GND_37_o_MUX_454_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COMPUTE_482 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_GND_37_o_MUX_420_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_483 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PAD  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PAD_GND_37_o_MUX_418_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PAD_484 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TRANSMIT  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TRANSMIT_GND_37_o_MUX_416_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TRANSMIT_485 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_GND_37_o_MUX_412_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_487 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_PREAMBLE_DONE  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_PREAMBLE_DONE_GND_37_o_MUX_389_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_PREAMBLE_DONE_491 )
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_ENABLE  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0871_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_ENABLE_GND_37_o_MUX_324_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_MAX_FRAME_ENABLE_506 )
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_EN  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0871_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_EN_GND_37_o_MUX_320_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_EN_522 )
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_VLAN_EN  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0871_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_VLAN_EN_GND_37_o_MUX_316_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_VLAN_EN_523 )
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_JUMBO_EN  (
    .C(tx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0871_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_JUMBO_EN_GND_37_o_MUX_314_o ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_JUMBO_EN_524 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STOP_MAX_PKT  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STOP_MAX_PKT_rstpot_1821 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STOP_MAX_PKT_465 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_SEEN  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_SEEN_rstpot_1822 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_SEEN_488 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIN_PKT_LEN_REACHED  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIN_PKT_LEN_REACHED_rstpot_1823 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIN_PKT_LEN_REACHED_490 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE5_MATCH  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE5_MATCH_rstpot_1824 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE5_MATCH_469 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_SUCCESS  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_SUCCESS_rstpot_1825 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_SUCCESS_476 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_UNDERRUN2  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_UNDERRUN2_rstpot_1826 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_UNDERRUN2_477 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MAX_PKT_LEN_REACHED  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MAX_PKT_LEN_REACHED_rstpot ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MAX_PKT_LEN_REACHED_489 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CLIENT_FRAME_DONE  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CLIENT_FRAME_DONE_rstpot_1828 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CLIENT_FRAME_DONE_492 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_rstpot_1829 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_493 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_OK  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_OK_rstpot_1830 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_OK_494 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_GOOD  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_GOOD_rstpot_1831 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_GOOD_496 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/SCSH  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/SCSH_rstpot_1832 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/SCSH_497 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_BAD  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_BAD_rstpot_1833 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_BAD_495 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FCS  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FCS_rstpot_1834 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FCS_498 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_rstpot_1835 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_499 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CFL  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CFL_rstpot_1836 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CFL_500 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_DA  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_DA_rstpot_1837 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_DA_501 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_rstpot_1838 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_502 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_rstpot_1839 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CDS  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CDS_rstpot_1840 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CDS_504 )
  );
  FD   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IDL  (
    .C(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IDL_rstpot_1841 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IDL_505 )
  );
  LUT5 #(
    .INIT ( 32'hFBEA5140 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_2_rstpot1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_cst1 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [14]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Result [2]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_CRC_MODE_463 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT_2_rstpot )
  );
  LUT6 #(
    .INIT ( 64'hFFFF5050FFFFDC50 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IDL_rstpot  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CDS_504 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CLIENT_FRAME_DONE_492 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IDL_505 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_493 ),
    .I4(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_TX_FAIL_DELAY_AND_167_o1_363 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IDL_rstpot_1841 )
  );
  LUT4 #(
    .INIT ( 16'h00CE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_STATUS_INT_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/COUNT_SET_REG_1465 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_STATUS_INT_1188 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2_1286 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT[15]_GND_31_o_equal_8_o ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_STATUS_INT_glue_set_1777 )
  );
  LUT4 #(
    .INIT ( 16'h5510 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_GOOD_rstpot  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_493 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_GOOD_496 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_FRAME_GOOD_GND_37_o_MUX_371_o11 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_GOOD_rstpot_1831 )
  );
  LUT4 #(
    .INIT ( 16'hFEF4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_13_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1199_inv ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [13]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0833 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [13]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_13_glue_set_1740 )
  );
  LUT4 #(
    .INIT ( 16'hFEF4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_12_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1199_inv ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [12]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0833 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [12]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_12_glue_set_1741 )
  );
  LUT4 #(
    .INIT ( 16'hFEF4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_11_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1199_inv ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [11]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0833 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [11]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_11_glue_set_1742 )
  );
  LUT4 #(
    .INIT ( 16'hFEF4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_10_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1199_inv ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [10]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0833 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [10]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_10_glue_set_1743 )
  );
  LUT4 #(
    .INIT ( 16'hFEF4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_9_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1199_inv ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [9]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0833 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [9]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_9_glue_set_1744 )
  );
  LUT4 #(
    .INIT ( 16'hFEF4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_8_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1199_inv ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [8]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0833 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [8]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_8_glue_set_1745 )
  );
  LUT4 #(
    .INIT ( 16'hFEF4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_7_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1199_inv ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [7]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0833 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [7]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_7_glue_set_1746 )
  );
  LUT4 #(
    .INIT ( 16'hFEF4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_6_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1199_inv ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [6]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0833 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [6]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_6_glue_set_1747 )
  );
  LUT4 #(
    .INIT ( 16'hFEF4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_5_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1199_inv ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0833 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_5_glue_set_1748 )
  );
  LUT4 #(
    .INIT ( 16'hFEF4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_4_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1199_inv ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0833 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [4]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_4_glue_set_1749 )
  );
  LUT4 #(
    .INIT ( 16'hFEF4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_3_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1199_inv ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0833 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [3]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_3_glue_set_1750 )
  );
  LUT4 #(
    .INIT ( 16'hFEF4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_2_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1199_inv ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0833 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_2_glue_set_1751 )
  );
  LUT4 #(
    .INIT ( 16'hFEF4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_1_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1199_inv ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0833 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_1_glue_set_1752 )
  );
  LUT4 #(
    .INIT ( 16'hFEF4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_0_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1199_inv ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1 [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0833 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_1_0_glue_set_1753 )
  );
  LUT4 #(
    .INIT ( 16'h00CA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT_4_glue_rst  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Result [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0200_inv_1285 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0156_1300 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT_4_glue_rst_1772 )
  );
  LUT4 #(
    .INIT ( 16'hF0E4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/SCSH_rstpot  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_OK_494 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/SCSH_497 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_GND_37_o_MUX_383_o ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1012_inv_421 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/SCSH_rstpot_1832 )
  );
  LUT4 #(
    .INIT ( 16'h00FE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tlast_rstpot1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_BAD_FRAME_INT_292 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_GOOD_FRAME_INT_293 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd1_1575 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state[1]_next_rx_state[1]_OR_9_o_0 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tlast_rstpot )
  );
  LUT6 #(
    .INIT ( 64'h6FF6FFFFFFFF6FF6 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/RXD_REG[7]_INV_467_o3_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [24]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [31]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [30]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [1]),
    .O(N173)
  );
  LUT6 #(
    .INIT ( 64'h00CA00EA000A00AA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_IFG_COUNT[7]_GND_37_o_mux_33_OUT8  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_MASKED [7]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [7]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_493 ),
    .I3(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_TX_FAIL_DELAY_AND_167_o1_363 ),
    .I5(N8),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<7> )
  );
  LUT6 #(
    .INIT ( 64'h0000C3AA0000AAAA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_IFG_COUNT[7]_GND_37_o_mux_33_OUT21  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_DELAY_HELD [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_493 ),
    .I4(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_TX_FAIL_DELAY_AND_167_o1_363 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<1> )
  );
  LUT6 #(
    .INIT ( 64'h00CA003A00AA00AA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_IFG_COUNT[7]_GND_37_o_mux_33_OUT51  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DEL_MASKED [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_493 ),
    .I3(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_IFG_COUNT[7]_GND_37_o_mux_33_OUT51_362 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_TX_FAIL_DELAY_AND_167_o1_363 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<4> )
  );
  LUT5 #(
    .INIT ( 32'hFF3AFFAA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_IFG_COUNT[7]_GND_37_o_mux_33_OUT11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_DELAY_HELD [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_493 ),
    .I3(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_TX_FAIL_DELAY_AND_167_o1_363 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT[7]_GND_37_o_mux_33_OUT<0> )
  );
  LUT6 #(
    .INIT ( 64'hFFFF10F0FFFFF0F0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mcount_DATA_COUNT_val1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_INT_1330 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd1_1332 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_REQ_INT_1309 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .I4(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I5(N148),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/Mcount_DATA_COUNT_val )
  );
  LUT5 #(
    .INIT ( 32'h45557555 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut<2>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/GOOD_FRAME_IN_TX_REG_1458 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync2 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_REQ_TO_TX_1192 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [2])
  );
  LUT5 #(
    .INIT ( 32'h45557555 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut<3>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/GOOD_FRAME_IN_TX_REG_1458 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync2 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_REQ_TO_TX_1192 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [3]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [3])
  );
  LUT5 #(
    .INIT ( 32'h45557555 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut<4>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/GOOD_FRAME_IN_TX_REG_1458 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync2 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_REQ_TO_TX_1192 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [4]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [4])
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1199_inv1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FCS_498 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_493 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_SCSH_466 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [14]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STOP_MAX_PKT_465 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1199_inv )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0368_inv111  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/SFD_FLAG_852 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/LEN_FIELD_945 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0368_inv11 )
  );
  LUT5 #(
    .INIT ( 32'h45557555 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut<5>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [5]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/GOOD_FRAME_IN_TX_REG_1458 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync2 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_REQ_TO_TX_1192 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [5])
  );
  LUT5 #(
    .INIT ( 32'h45557555 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut<6>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [6]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/GOOD_FRAME_IN_TX_REG_1458 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync2 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_REQ_TO_TX_1192 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [6]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [6])
  );
  LUT5 #(
    .INIT ( 32'h45557555 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut<7>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [7]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/GOOD_FRAME_IN_TX_REG_1458 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync2 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_REQ_TO_TX_1192 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [7]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [7])
  );
  LUT5 #(
    .INIT ( 32'h45557555 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut<8>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [8]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/GOOD_FRAME_IN_TX_REG_1458 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync2 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_REQ_TO_TX_1192 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [8]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [8])
  );
  LUT5 #(
    .INIT ( 32'h45557555 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut<9>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [9]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/GOOD_FRAME_IN_TX_REG_1458 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync2 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_REQ_TO_TX_1192 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [9]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [9])
  );
  LUT5 #(
    .INIT ( 32'h45557555 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut<10>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [10]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/GOOD_FRAME_IN_TX_REG_1458 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync2 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_REQ_TO_TX_1192 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [10]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [10])
  );
  LUT5 #(
    .INIT ( 32'h45557555 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut<11>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [11]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/GOOD_FRAME_IN_TX_REG_1458 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync2 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_REQ_TO_TX_1192 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [11]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [11])
  );
  LUT5 #(
    .INIT ( 32'h45557555 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut<12>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [12]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/GOOD_FRAME_IN_TX_REG_1458 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync2 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_REQ_TO_TX_1192 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [12]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [12])
  );
  LUT5 #(
    .INIT ( 32'h45557555 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut<13>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [13]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/GOOD_FRAME_IN_TX_REG_1458 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync2 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_REQ_TO_TX_1192 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [13]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [13])
  );
  LUT5 #(
    .INIT ( 32'h45557555 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut<14>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [14]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/GOOD_FRAME_IN_TX_REG_1458 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync2 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_REQ_TO_TX_1192 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [14]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [14])
  );
  LUT4 #(
    .INIT ( 16'h8421 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/RXD_REG[7]_INV_467_o5_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [29]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [28]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .O(N179)
  );
  LUT6 #(
    .INIT ( 64'hFFFF0000FFFE0000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_TX_FAIL_DELAY_AND_167_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [7]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [6]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [5]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IFG_COUNT [4]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_493 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_IFG_COUNT[7]_GND_37_o_mux_33_OUT51_362 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_TX_FAIL_DELAY_AND_167_o )
  );
  LUT4 #(
    .INIT ( 16'h5510 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FCS_rstpot  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/SCSH_497 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FCS_498 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mmux_FCS_GND_37_o_MUX_363_o11 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FCS_rstpot_1834 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFDDDF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/ADD_CONTROL_ENABLE_rstpot1_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pauseaddressmatch_284 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/specialpauseaddressmatch_283 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .O(N181)
  );
  LUT6 #(
    .INIT ( 64'h0100010051500100 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/ADD_CONTROL_ENABLE_rstpot1  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CONTROL_MATCH_1107 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/ADD_CONTROL_ENABLE_1091 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_LT_CHECK_DISABLE_AND_371_o1 ),
    .I5(N181),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/ADD_CONTROL_ENABLE_rstpot1_1867 )
  );
  LUT6 #(
    .INIT ( 64'h0415040404040404 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_OK_rstpot  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_OK_494 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_493 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_BAD_495 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_GOOD_496 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/SCSH_497 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_OK_rstpot_1830 )
  );
  LUT5 #(
    .INIT ( 32'h44444044 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd1_rstpot  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd2_1569 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_BAD_FRAME_INT_292 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_VALID_INT_291 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_GOOD_FRAME_INT_293 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd1_rstpot_1853 )
  );
  LUT4 #(
    .INIT ( 16'h2220 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_FINAL_rstpot1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_VALID_910 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/VALIDATE_REQUIRED_846 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_filtered_data_valid_286 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_FINAL_rstpot1_1861 )
  );
  LUT5 #(
    .INIT ( 32'h22022000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/SRC_ADDRESS_FIELD_rstpot1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG6_888 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [5]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/DEST_ADDRESS_FIELD_947 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/SRC_ADDRESS_FIELD_946 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/SRC_ADDRESS_FIELD_rstpot1_1863 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_UNDERRUN2_rstpot_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_502 ),
    .O(N183)
  );
  LUT6 #(
    .INIT ( 64'h1111111110101000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_UNDERRUN2_rstpot  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_STATUS_VALID ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_UNDERRUN_OUT ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FCS_498 ),
    .I4(N183),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_UNDERRUN2_477 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_UNDERRUN2_rstpot_1826 )
  );
  LUT4 #(
    .INIT ( 16'h0004 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/GOOD_FRAME_rstpot1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/BAD_FRAME_rstpot ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/INHIBIT_FRAME_1122 ),
    .I3(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/GOOD_FRAME_rstpot1_1874 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/ignore_packet_glue_set_SW0  (
    .I0(tx_axis_mac_tuser[0]),
    .I1(tx_axis_mac_tvalid),
    .O(N197)
  );
  LUT6 #(
    .INIT ( 64'h00404040AAEAEAEA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/ignore_packet_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/ignore_packet_1156 ),
    .I1(N197),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd10_1147 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_mac_tready_reg_1160 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/gate_tready_1162 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_mac_tlast_tx_mac_tvalid_OR_21_o ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/ignore_packet_glue_set_1764 )
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/NUMBER_OF_BYTES_rstpot1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_TX_EN_DELAY_347 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I2(NlwRenamedSig_OI_gmii_tx_en),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/NUMBER_OF_BYTES_rstpot1_1859 )
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_2_rstpot1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_MULTI_MATCH_470 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_BROADCAST ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STATUS_VECTOR_2_rstpot1_1860 )
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd1_rstpot  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd2_1142 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I2(tx_axis_mac_tvalid),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd1_rstpot_1849 )
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/no_burst_rstpot  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd3_1143 ),
    .I1(tx_axis_mac_tvalid),
    .I2(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/no_burst_rstpot_1850 )
  );
  LUT4 #(
    .INIT ( 16'h2220 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_filtered_data_valid_rstpot  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_srl16_reg2_1542 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/address_match_1531 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/promiscuous_mode_sample_1535 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_filtered_data_valid_rstpot_1852 )
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/LENGTH_TYPE_ERR_rstpot1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/FRAME_LEN_ERR_1125 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/TYPE_PACKET_908 ),
    .I2(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/LENGTH_TYPE_ERR_rstpot1_1871 )
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/STATISTICS_VALID_rstpot1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/INHIBIT_FRAME_1122 ),
    .I2(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/STATISTICS_VALID_rstpot1_1872 )
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_ENABLE_REG_rstpot1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_tx_enable/data_sync2 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_tx_duplex/data_sync2 ),
    .I2(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_ENABLE_REG_rstpot1_1876 )
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_ENABLE_REG_rstpot1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_rx_enable/data_sync2 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/sync_rx_duplex/data_sync2 ),
    .I2(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_ENABLE_REG_rstpot1_1877 )
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_valid_glue_set_SW0  (
    .I0(tx_axis_mac_tvalid),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/no_burst_1161 ),
    .I2(tx_axis_mac_tuser[0]),
    .O(N199)
  );
  LUT6 #(
    .INIT ( 64'hAFAAAAAAAFEEAAEE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_valid_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_assert_1153 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_valid_311 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/ignore_packet_1156 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd10_1147 ),
    .I4(N199),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/next_tx_state[3]_tx_state[3]_OR_24_o2_1671 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_valid_glue_set_1765 )
  );
  LUT6 #(
    .INIT ( 64'h555511515555DD5D ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CFL_rstpot  (
    .I0(N201),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_502 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_DATA_VALID_OUT ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_UNDERRUN_OUT ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MAX_PKT_LEN_REACHED_489 ),
    .I5(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CFL_rstpot_1836 )
  );
  LUT5 #(
    .INIT ( 32'h84210000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/CRC_ENGINE_ERR_rstpot1_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [27]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [26]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [4]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [5]),
    .I4(N179),
    .O(N203)
  );
  LUT6 #(
    .INIT ( 64'h2222022022222222 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/CRC_ENGINE_ERR_rstpot1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/CRC_FIELD_943 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [6]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FCS_CHECK/CALC [25]),
    .I4(N173),
    .I5(N203),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/CRC_ENGINE_ERR_rstpot1_1875 )
  );
  LUT5 #(
    .INIT ( 32'hF4444444 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_burst1_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_OUT_287 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_burst1_1152 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tlast_reg_1158 ),
    .I3(tx_axis_mac_tvalid),
    .I4(N205),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_burst1_glue_set_1761 )
  );
  LUT6 #(
    .INIT ( 64'h0100010011100100 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_MATCH_rstpot1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/DAT_FIELD_944 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_MATCH_911 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER[10]_LENGTH_TYPE[10]_equal_8_o11 ),
    .I5(N207),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_MATCH_rstpot1_1865 )
  );
  LUT5 #(
    .INIT ( 32'h3FFF1555 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_BAD_rstpot_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_499 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_SEEN_488 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MAX_PKT_LEN_REACHED_489 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0996_inv11 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_CRC_MODE_463 ),
    .O(N209)
  );
  LUT5 #(
    .INIT ( 32'h11100100 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/MULTICAST_MATCH_rstpot1  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .I1(N211),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0476_inv1 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/MULTICAST_MATCH_1090 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/MULTICAST_MATCH_rstpot1_1868 )
  );
  LUT5 #(
    .INIT ( 32'hFFDFFFFF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CONTROL_FRAME_INT_rstpot1_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CONTROL_MATCH_1107 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_LT_CHECK_DISABLE_AND_371_o1 ),
    .O(N213)
  );
  LUT6 #(
    .INIT ( 64'h0020002230203322 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CONTROL_FRAME_INT_rstpot1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CONTROL_FRAME_INT_1089 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_FIELD_COUNTER[1]_AND_376_o ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0368_inv11 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .I5(N213),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CONTROL_FRAME_INT_rstpot1_1866 )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_rstpot_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/SCSH_497 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_499 ),
    .O(N217)
  );
  LUT6 #(
    .INIT ( 64'h1000100010005555 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_rstpot  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CFL_500 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MAX_PKT_LEN_REACHED_489 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_502 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FCS_498 ),
    .I5(N217),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_rstpot_1835 )
  );
  LUT6 #(
    .INIT ( 64'h66F644F4FFFFFFFF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_assert_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_burst1_1152 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_burst2_1151 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_assert_1153 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_valid_311 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_OUT_287 ),
    .I5(N219),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_assert_glue_set_1760 )
  );
  LUT3 #(
    .INIT ( 8'h06 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT_0_glue_rst  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0200_inv_1285 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0156_1300 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT_0_glue_rst_1771 )
  );
  LUT4 #(
    .INIT ( 16'h006A ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT_1_glue_rst  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0200_inv_1285 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0156_1300 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT_1_glue_rst_1773 )
  );
  LUT4 #(
    .INIT ( 16'hFE02 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE5_MATCH_rstpot  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE5_MATCH_469 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[5] ),
    .I2(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE4_MATCH_GND_37_o_MUX_503_o_537 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/DST_ADDR_BYTE5_MATCH_rstpot_1824 )
  );
  LUT6 #(
    .INIT ( 64'hFF02020202020202 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_REQ_INT_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_REQ_INT_1271 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/BAD_FRAME_INT_322 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n00811 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/GND_27_o_DATA[7]_equal_8_o ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_REQ_INT_glue_set_1769 )
  );
  LUT6 #(
    .INIT ( 64'h02020202FF020202 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/BAD_OPCODE_INT_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/BAD_OPCODE_INT_1270 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/BAD_FRAME_INT_322 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/_n00811 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/GND_27_o_DATA[7]_equal_8_o ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/BAD_OPCODE_INT_glue_set_1770 )
  );
  LUT5 #(
    .INIT ( 32'h05040404 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/MAX_LENGTH_ERR_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/JUMBO_FRAMES_HELD_858 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/MAX_LENGTH_ERR_1121 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n01484_1653 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/_n01482 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/MAX_LENGTH_ERR_glue_set_1758 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFA2AA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2-In2  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_IN_REG_1331 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_DATA_VALID_464 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_SEEN_488 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_499 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2-In2_1679 )
  );
  LUT6 #(
    .INIT ( 64'h4040004040000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CDS_GND_37_o_MUX_340_o1  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/INT_ENABLE_351 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IDL_505 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_CONTROL_1321 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_IN_REG_1331 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CDS_GND_37_o_MUX_340_o )
  );
  LUT5 #(
    .INIT ( 32'h00000002 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n08332  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/BYTE_COUNT_0 [14]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STOP_MAX_PKT_465 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FCS_498 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_493 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_SCSH_466 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n0833 )
  );
  LUT6 #(
    .INIT ( 64'h4440400044444444 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tvalid_rstpot1  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd2_1569 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/fsmfake0 [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_state_FSM_FFd1_1575 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_DATA_VALID_INT_291 ),
    .I5(N160),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/rx_axi_shim/rx_mac_tvalid_rstpot )
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_val1  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/SFD_FLAG_852 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_val )
  );
  LUT5 #(
    .INIT ( 32'hFFFF0770 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_load_count_val1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_EARLY_INT_847 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG1_890 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/sync_update/data_sync2 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/update_pause_ad_sync_reg_1536 ),
    .I4(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_load_count_val )
  );
  LUT4 #(
    .INIT ( 16'hFF2A ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_counter_val1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_reg1_1541 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_EARLY_INT_847 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG1_890 ),
    .I3(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_counter_val )
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0387_inv1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/LEN_FIELD_945 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/SFD_FLAG_852 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/_n0387_inv )
  );
  LUT5 #(
    .INIT ( 32'h00000002 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0183_inv1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [3]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [2]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/_n0183_inv )
  );
  LUT5 #(
    .INIT ( 32'h45557555 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut<15>  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_COUNT [15]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/GOOD_FRAME_IN_TX_REG_1458 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync2 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_REQ_TO_TX_1192 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_VALUE_TO_TX [15]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mcount_PAUSE_COUNT_lut [15])
  );
  LUT5 #(
    .INIT ( 32'hAAAAAAA9 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Msub_GND_37_o_GND_37_o_sub_12_OUT<7:0>_xor<6>11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [6]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [2]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [3]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [4]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/GND_37_o_GND_37_o_sub_12_OUT[6] )
  );
  LUT5 #(
    .INIT ( 32'hFF8FF888 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mmux_LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT17  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/SFD_FLAG_852 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<0> )
  );
  LUT5 #(
    .INIT ( 32'hFF8FF888 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mmux_LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT21  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/SFD_FLAG_852 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [2]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [10]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<10> )
  );
  LUT5 #(
    .INIT ( 32'hFF8FF888 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mmux_LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT81  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/SFD_FLAG_852 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<1> )
  );
  LUT5 #(
    .INIT ( 32'hFF8FF888 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mmux_LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT91  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/SFD_FLAG_852 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [2]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<2> )
  );
  LUT5 #(
    .INIT ( 32'hFF8FF888 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mmux_LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT101  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/SFD_FLAG_852 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [3]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<3> )
  );
  LUT5 #(
    .INIT ( 32'hFF8FF888 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mmux_LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT111  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/SFD_FLAG_852 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [4]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [4]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<4> )
  );
  LUT5 #(
    .INIT ( 32'hFF8FF888 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mmux_LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT121  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/SFD_FLAG_852 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [5]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [5]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<5> )
  );
  LUT5 #(
    .INIT ( 32'hFF8FF888 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mmux_LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT131  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/SFD_FLAG_852 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [6]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [6]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<6> )
  );
  LUT5 #(
    .INIT ( 32'hFF8FF888 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mmux_LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT141  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/SFD_FLAG_852 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [7]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<7> )
  );
  LUT5 #(
    .INIT ( 32'hFF8FF888 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mmux_LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT151  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/SFD_FLAG_852 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [0]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [8]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<8> )
  );
  LUT5 #(
    .INIT ( 32'hFF8FF888 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mmux_LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT161  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/SFD_FLAG_852 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [9]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE[15]_PWR_48_o_mux_2_OUT<9> )
  );
  LUT5 #(
    .INIT ( 32'h888888F8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/SFD_FLAG_CRC_COMPUTE_OR_217_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/SFD_FLAG_852 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/CRC_COMPUTE_909 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_DATA_950 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/SFD_FLAG_CRC_COMPUTE_OR_217_o )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF777FF7FF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/END_OF_TX_INV_38_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_DATA_VALID_464 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_499 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_IN_REG_1331 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_CONTROL_1321 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_SEEN_488 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/END_OF_TX_INV_38_o )
  );
  LUT6 #(
    .INIT ( 64'h6CCCCCCCCCCCCCCC ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_counter_xor<5>12  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [4]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [3]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result [5])
  );
  LUT5 #(
    .INIT ( 32'h6CCCCCCC ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_counter_xor<4>11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [2]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [3]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result [4])
  );
  LUT4 #(
    .INIT ( 16'hABA8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/two_byte_tx_rstpot  (
    .I0(tx_axis_mac_tlast),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd1_1146 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd8_1145 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/two_byte_tx_1157 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/two_byte_tx_rstpot_1846 )
  );
  LUT4 #(
    .INIT ( 16'hBA8A ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/promiscuous_mode_sample_rstpot  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/promiscuous_mode_sample_1535 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_reg2_1547 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_reg1_1541 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/resync_promiscuous_mode/data_sync2 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/promiscuous_mode_sample_rstpot_1848 )
  );
  LUT4 #(
    .INIT ( 16'hFEFC ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1212_inv1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_493 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .I2(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_TX_FAIL_DELAY_AND_167_o1_363 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1212_inv )
  );
  LUT5 #(
    .INIT ( 32'h20000000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_LT_CHECK_DISABLE_AND_375_o1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LESS_THAN_256_1112 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/LT_CHECK_HELD_855 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/LEN_FIELD_945 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/GND_46_o_RXD[7]_equal_9_o ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_LT_CHECK_DISABLE_AND_375_o )
  );
  LUT6 #(
    .INIT ( 64'hF444044404440444 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mmux_VLAN_MATCH[1]_GND_46_o_MUX_826_o11  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/VLAN_MATCH [1]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/LEN_FIELD_945 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/VLAN_MATCH [0]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/GND_46_o_RXD[7]_equal_9_o ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/VLAN_MATCH[1]_GND_46_o_MUX_826_o )
  );
  LUT6 #(
    .INIT ( 64'h8888888808888888 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/_n0301_inv1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_EARLY_INT_847 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG1_890 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [5]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [4]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [3]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_counter_xor<5>11 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/_n0301_inv )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/PAUSE_VECTOR<1>1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/ADD_CONTROL_FRAME_321 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_ENABLE_REG_1189 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/PAUSE_REQ_INT_1271 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/GOOD_FRAME_INT_323 ),
    .O(rx_statistics_vector[23])
  );
  LUT6 #(
    .INIT ( 64'hF0F030F0FAFA32FA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd1-In_SW1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_IN_REG_1331 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_END_OF_TX ),
    .O(N221)
  );
  LUT4 #(
    .INIT ( 16'hEA40 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd1-In  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd1_1332 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_INT_1330 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd2_1286 ),
    .I3(N221),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/STATE_COUNT_FSM_FFd1-In_1287 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFDFFF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_EARLY_INT_glue_set_SW1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [3]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [6]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [7]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [5]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG1_886 ),
    .O(N223)
  );
  LUT6 #(
    .INIT ( 64'hAAAAAAAA00000800 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_EARLY_INT_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG1_890 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG1 [2]),
    .I4(N223),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_EARLY_INT_847 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_EARLY_INT_glue_set_1755 )
  );
  LUT6 #(
    .INIT ( 64'h0010001000100000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/EXT_FIELD_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/IFG_FLAG_850 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FALSE_CARR_FLAG_849 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_ERR_REG6_885 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG6_888 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/EXT_FIELD_942 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/CRC_FIELD_943 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/EXT_FIELD_glue_set_1756 )
  );
  LUT5 #(
    .INIT ( 32'h11111000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/VALIDATE_REQUIRED_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/GOOD_FRAME_893 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/BAD_FRAME_892 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_filtered_data_valid_286 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_VALID_910 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/VALIDATE_REQUIRED_846 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/VALIDATE_REQUIRED_glue_set_1754 )
  );
  LUT5 #(
    .INIT ( 32'h888888F8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_end_rstpot  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_OUT_287 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd5_1150 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_end_1159 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd10_1147 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd7_1149 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_end_rstpot_1857 )
  );
  LUT4 #(
    .INIT ( 16'h1011 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_BAD_rstpot  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_493 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_BAD_495 ),
    .I3(N209),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_BAD_rstpot_1833 )
  );
  LUT5 #(
    .INIT ( 32'h0808AA08 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG6_888 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/SFD_FLAG_852 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/ENABLE_REG_859 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG7_887 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_glue_set_1757 )
  );
  LUT3 #(
    .INIT ( 8'hA8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/END_OF_TX_HELD_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_IN_REG_1331 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_END_OF_TX ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/END_OF_TX_HELD_1311 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/END_OF_TX_HELD_glue_set_1776 )
  );
  LUT4 #(
    .INIT ( 16'hAA08 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_reg_1545 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_reg1_1541 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_reg2_1547 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_1533 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/pause_match_glue_set_1778 )
  );
  LUT4 #(
    .INIT ( 16'hAA08 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_reg_1544 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_reg1_1541 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_reg2_1547 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_1532 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/special_pause_match_glue_set_1779 )
  );
  LUT4 #(
    .INIT ( 16'hAA08 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcast_match_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcast_byte_match_1546 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_reg1_1541 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_reg2_1547 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcast_match_1534 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcast_match_glue_set_1780 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFEFEFFFFAAFE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_glue_ce  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_STATUS_INT_1188 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_REQ_INT_1309 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/COUNT_SET_1187 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_IN_REG_1331 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_END_OF_TX ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_glue_ce_1775 )
  );
  LUT6 #(
    .INIT ( 64'hFFFF800080008000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_burst2_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tlast_reg_1158 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/two_byte_tx_1157 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd6_1144 ),
    .I3(tx_axis_mac_tvalid),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_burst1_1152 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_burst2_1151 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_burst2_glue_set_1759 )
  );
  LUT4 #(
    .INIT ( 16'h0020 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/BAD_FRAME_rstpot1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/BAD_FRAME_rstpot ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/INHIBIT_FRAME_1122 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_CHECKER/BAD_FRAME_rstpot1_1873 )
  );
  LUT4 #(
    .INIT ( 16'hFFFB ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CFL_rstpot_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/SCSH_497 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CFL_500 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FCS_498 ),
    .I3(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .O(N201)
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_burst1_glue_set_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_deassert_1154 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd1_1146 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd8_1145 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/two_byte_tx_1157 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd6_1144 ),
    .O(N205)
  );
  LUT6 #(
    .INIT ( 64'h6FF6FFFFFFFFFFFF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_MATCH_rstpot1_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_TYPE [4]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [4]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER[10]_LENGTH_TYPE[10]_equal_8_o111_1648 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER[10]_LENGTH_TYPE[10]_equal_8_o113 ),
    .O(N207)
  );
  LUT6 #(
    .INIT ( 64'hA8AAFFFFA8AAAAAA ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/MULTICAST_MATCH_rstpot1_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FRAME_1844 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_DATA_950 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/CRC_FIELD_943 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [0]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/DEST_ADDRESS_FIELD_947 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/broadcastaddressmatch_285 ),
    .O(N211)
  );
  LUT4 #(
    .INIT ( 16'hFFFB ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/address_match_glue_set_SW1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [3]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [2]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [4]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [5]),
    .O(N225)
  );
  LUT6 #(
    .INIT ( 64'hCCCCFCCC44445444 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/address_match_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_reg1_1541 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/address_match_1531 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [0]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [1]),
    .I4(N225),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/rx_data_valid_reg2_1547 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/address_match_glue_set_1782 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFEEE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/TYPE_PACKET_rstpot_SW1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [5]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [2]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [6]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .O(N227)
  );
  LUT6 #(
    .INIT ( 64'hFFF7FFF7FFF78880 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/TYPE_PACKET_rstpot  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/FIELD_CONTROL [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/LEN_FIELD_945 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .I3(N227),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RECLOCK_RX_CONFIG ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/TYPE_PACKET_908 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/TYPE_PACKET_rstpot_1843 )
  );
  LUT5 #(
    .INIT ( 32'hFDFFFFFF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_deassert_glue_set_SW1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/gate_tready_1162 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd4_1148 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd10_1147 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_mac_tready_reg_1160 ),
    .I4(tx_axis_mac_tlast),
    .O(N229)
  );
  LUT6 #(
    .INIT ( 64'h00202020FFFF2020 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_deassert_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_data_valid_311 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/two_byte_tx_1157 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_deassert_1154 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd2_1142 ),
    .I4(tx_axis_mac_tvalid),
    .I5(N229),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_deassert_glue_set_1762 )
  );
  LUT3 #(
    .INIT ( 8'hF7 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_underrun_glue_set_SW1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_mac_tready_reg_1160 ),
    .I1(tx_axis_mac_tuser[0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd4_1148 ),
    .O(N231)
  );
  LUT6 #(
    .INIT ( 64'h0010001055550010 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_underrun_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd10_1147 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd1_1146 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_underrun_1155 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/ACK_OUT_287 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/gate_tready_1162 ),
    .I5(N231),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_underrun_glue_set_1763 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFA8888888 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/PADDED_FRAME_rstpot1_SW1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [5]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [4]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [2]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [3]),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [7]),
    .O(N233)
  );
  LUT6 #(
    .INIT ( 64'h1010101010105410 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/PADDED_FRAME_rstpot1  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LENGTH_FIELD_FIELD_COUNTER[1]_AND_376_o ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/PADDED_FRAME_912 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/LESS_THAN_256_1112 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RXD_REG7 [6]),
    .I5(N233),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/PADDED_FRAME_rstpot1_1870 )
  );
  LUT4 #(
    .INIT ( 16'h5140 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_DA_GND_37_o_MUX_351_o1  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_CONTROL_1321 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_IN_REG_1331 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_DA_GND_37_o_MUX_351_o )
  );
  LUT5 #(
    .INIT ( 32'h04550404 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_SUCCESS_rstpot  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_OK_494 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_UNDERRUN2_477 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_SUCCESS_476 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_SUCCESS_rstpot_1825 )
  );
  LUT5 #(
    .INIT ( 32'hF4FFF4F4 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CLIENT_FRAME_DONE_rstpot  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CLIENT_FRAME_DONE_492 ),
    .I2(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/INT_TX_DATA_VALID_OUT ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1020_inv1 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CLIENT_FRAME_DONE_rstpot_1828 )
  );
  LUT4 #(
    .INIT ( 16'h5510 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STOP_MAX_PKT_rstpot  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STOP_MAX_PKT_465 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MAX_PKT_LEN_REACHED_489 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/STOP_MAX_PKT_rstpot_1821 )
  );
  LUT5 #(
    .INIT ( 32'h55550100 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_SEEN_rstpot  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IDL_505 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_SEEN_488 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_499 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_SEEN_rstpot_1822 )
  );
  LUT4 #(
    .INIT ( 16'h5510 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIN_PKT_LEN_REACHED_rstpot  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PRE_503 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIN_PKT_LEN_REACHED_490 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [6]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIN_PKT_LEN_REACHED_rstpot_1823 )
  );
  LUT5 #(
    .INIT ( 32'h44544444 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/PAUSE_VECTOR_0_glue_set  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/REG_STATUS_VALID ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/PAUSE_VECTOR_0 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [4]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/PAUSE_VECTOR_0_glue_set_1768 )
  );
  LUT6 #(
    .INIT ( 64'hDFDFDF00DF00DF00 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_REQ_INT_glue_set  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [4]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [0]),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_COUNT [1]),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_REQ_INT_1309 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_ENABLE_REG_1183 ),
    .I5(pause_req),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/PAUSE_REQ_INT_glue_set_1774 )
  );
  LUT6 #(
    .INIT ( 64'h22F2222222022222 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/COUNT_SET_rstpot  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/COUNT_SET_1187 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/PAUSE_STATUS_INT_1188 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/sync_good_rx/data_sync2 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/GOOD_FRAME_IN_TX_REG_1458 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX_PAUSE/PAUSE_REQ_TO_TX_1192 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/Mmux_COUNT_SET_GND_31_o_MUX_237_o13_1713 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX_PAUSE/COUNT_SET_rstpot_1847 )
  );
  LUT5 #(
    .INIT ( 32'h11111000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_WITH_FCS_rstpot1  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/END_FCS_949 ),
    .I1(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_RX_RESET_I/R4 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/SFD_FLAG_852 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_SM/PREAMBLE_948 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_WITH_FCS_1109 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_WITH_FCS_rstpot1_1869 )
  );
  LUT6 #(
    .INIT ( 64'h5515511144044000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_DA_rstpot  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/TX_502 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/MUX_CONTROL_1310 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_CONTROL_1321 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/TX/DATA_AVAIL_IN_REG_1331 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_DA_501 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_TX_DA_rstpot_1837 )
  );
  LUT4 #(
    .INIT ( 16'hEA2A ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/update_pause_ad_sync_reg_rstpot  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/sync_update/data_sync2 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/DATA_VALID_EARLY_INT_847 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/RX_DV_REG1_890 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/update_pause_ad_sync_reg_1536 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/update_pause_ad_sync_reg_rstpot_1851 )
  );
  LUT4 #(
    .INIT ( 16'hDFFF ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/force_assert_glue_set_SW0  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/early_deassert_1154 ),
    .I1(tx_axis_mac_tlast),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/G_AXI_SHIM.tx_axi_shim/tx_state_FSM_FFd2_1142 ),
    .I3(tx_axis_mac_tvalid),
    .O(N219)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF00440004 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MAX_PKT_LEN_REACHED_rstpot_cy1_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy_cy  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_JUMBO_EN_524 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MAX_PKT_LEN_REACHED_489 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_493 ),
    .I3(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIFG_TX_FAIL_DELAY_AND_167_o1_363 ),
    .I5(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT[14]_FRAME_MAX[14]_equal_51_o_l1 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MAX_PKT_LEN_REACHED_rstpot )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter_1_1  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/_n0301_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result [1]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_counter_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter_1_1_1906 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter_0_1  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/_n0301_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result [0]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_counter_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter_0_1_1907 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter_2_1  (
    .C(rx_axi_clk),
    .CE(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/_n0301_inv ),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result [2]),
    .R(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_counter_val ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter_2_1_1908 )
  );
  INV   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_lut<0>_INV_0  (
    .I(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FRAME_COUNT [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mcount_FRAME_COUNT_lut [0])
  );
  INV   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_lut<0>_INV_0  (
    .I(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_COUNTER<14:0> [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_DATA_COUNTER<14:0>_lut<0> )
  );
  INV   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_lut<0>_INV_0  (
    .I(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/FRAME_COUNTER [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/Mcount_FRAME_COUNTER_lut [0])
  );
  INV   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Msub_GND_37_o_GND_37_o_sub_12_OUT<7:0>_xor<2>11_INV_0  (
    .I(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_IFG_DELAY [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/GND_37_o_GND_37_o_sub_12_OUT[2] )
  );
  INV   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Mcount_DATA_COUNT_xor<0>11_INV_0  (
    .I(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/DATA_COUNT [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/FLOW/RX/Result [0])
  );
  INV   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_counter_xor<0>11_INV_0  (
    .I(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/counter [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result [0])
  );
  INV   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mcount_load_count_xor<0>11_INV_0  (
    .I(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [0]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Result<0>1 )
  );
  MUXF7   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT83  (
    .I0(N235),
    .I1(N236),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [2]),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count[2]_pause_addr[7]_wide_mux_27_OUT<7> )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT83_F  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [0]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [1]),
    .I2(rx_mac_config_vector[47]),
    .I3(rx_mac_config_vector[63]),
    .I4(rx_mac_config_vector[55]),
    .I5(rx_mac_config_vector[39]),
    .O(N235)
  );
  LUT5 #(
    .INIT ( 32'hFBEA5140 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/Mmux_load_count[2]_pause_addr[7]_wide_mux_27_OUT83_G  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [1]),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/addr_filter_top/address_filter_inst/load_count [0]),
    .I2(rx_mac_config_vector[79]),
    .I3(rx_mac_config_vector[71]),
    .I4(rx_mac_config_vector[39]),
    .O(N236)
  );
  MUXF7   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1012_inv  (
    .I0(N237),
    .I1(N238),
    .S(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/INT_CRC_MODE_463 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1012_inv_421 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFF8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1012_inv_F  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CFL_500 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/MIN_PKT_LEN_REACHED_490 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/COF_499 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IDL_505 ),
    .I4(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .O(N237)
  );
  LUT5 #(
    .INIT ( 32'hEEEEEEFE ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/_n1012_inv_G  (
    .I0(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/IDL_505 ),
    .I2(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/FCS_498 ),
    .I3(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COUNT [0]),
    .I4(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/CRC_COUNT [1]),
    .O(N238)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mshreg_PREAMBLE_PIPE_13  (
    .A0(N0),
    .A1(NlwRenamedSig_OI_N1),
    .A2(N0),
    .A3(NlwRenamedSig_OI_N1),
    .CE(N0),
    .CLK(tx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[5] ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mshreg_PREAMBLE_PIPE_13_1913 ),
    .Q15(\NLW_U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mshreg_PREAMBLE_PIPE_13_Q15_UNCONNECTED )
  );
  FDE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE_131  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/Mshreg_PREAMBLE_PIPE_13_1913 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE_131_1914 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Mshreg_STATISTICS_VECTOR_22  (
    .A0(NlwRenamedSig_OI_N1),
    .A1(NlwRenamedSig_OI_N1),
    .A2(NlwRenamedSig_OI_N1),
    .A3(NlwRenamedSig_OI_N1),
    .CE(N0),
    .CLK(rx_axi_clk),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/FRAME_DECODER/DATA_WITH_FCS_1109 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Mshreg_STATISTICS_VECTOR_22_1915 ),
    .Q15(\NLW_U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Mshreg_STATISTICS_VECTOR_22_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR_22  (
    .C(rx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/Mshreg_STATISTICS_VECTOR_22_1915 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/RXGEN/STATISTICS_VECTOR [22])
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift1  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(N0),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift1_1916 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift2  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift1_1916 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift2_1917 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift3  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift2_1917 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift3_1918 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift4  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift3_1918 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift4_1919 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift5  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift4_1919 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift5_1920 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift6  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift5_1920 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift6_1921 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift7  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift6_1921 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift7_1922 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE_1311  (
    .I0(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE_131_1914 ),
    .I1(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4_shift7_1922 ),
    .O(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE_1311_1923 )
  );
  FDRE   \U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE_13  (
    .C(tx_axi_clk),
    .CE(N0),
    .D(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE_1311_1923 ),
    .R(\NlwRenamedSig_OI_U0/trimac_top/TRI_SPEED.TRIMAC_INST/SYNC_TX_RESET_I/R4 ),
    .Q(\U0/trimac_top/TRI_SPEED.TRIMAC_INST/TXGEN/TX_SM1/PREAMBLE_PIPE[13] )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
