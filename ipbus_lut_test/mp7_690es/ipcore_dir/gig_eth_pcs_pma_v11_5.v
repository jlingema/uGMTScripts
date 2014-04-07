////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.68d
//  \   \         Application: netgen
//  /   /         Filename: gig_eth_pcs_pma_v11_5.v
// /___/   /\     Timestamp: Tue Apr  1 12:36:56 2014
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog /home/scratch/vhdl/uGMT/dev/ipbus_lut_test/mp7_690es/ipcore_dir/tmp/_cg/gig_eth_pcs_pma_v11_5.ngc /home/scratch/vhdl/uGMT/dev/ipbus_lut_test/mp7_690es/ipcore_dir/tmp/_cg/gig_eth_pcs_pma_v11_5.v 
// Device	: 7vx690tffg1927-2
// Input file	: /home/scratch/vhdl/uGMT/dev/ipbus_lut_test/mp7_690es/ipcore_dir/tmp/_cg/gig_eth_pcs_pma_v11_5.ngc
// Output file	: /home/scratch/vhdl/uGMT/dev/ipbus_lut_test/mp7_690es/ipcore_dir/tmp/_cg/gig_eth_pcs_pma_v11_5.v
// # of Modules	: 1
// Design Name	: gig_eth_pcs_pma_v11_5
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

module gig_eth_pcs_pma_v11_5 (
  reset, signal_detect, userclk, userclk2, dcm_locked, txbuferr, gmii_tx_en, gmii_tx_er, mgt_rx_reset, mgt_tx_reset, powerdown, txchardispmode, 
txchardispval, txcharisk, enablealign, gmii_rx_dv, gmii_rx_er, gmii_isolate, rxbufstatus, rxchariscomma, rxcharisk, rxclkcorcnt, rxdata, rxdisperr, 
rxnotintable, rxrundisp, gmii_txd, configuration_vector, txdata, gmii_rxd, status_vector
)/* synthesis syn_black_box syn_noprune=1 */;
  input reset;
  input signal_detect;
  input userclk;
  input userclk2;
  input dcm_locked;
  input txbuferr;
  input gmii_tx_en;
  input gmii_tx_er;
  output mgt_rx_reset;
  output mgt_tx_reset;
  output powerdown;
  output txchardispmode;
  output txchardispval;
  output txcharisk;
  output enablealign;
  output gmii_rx_dv;
  output gmii_rx_er;
  output gmii_isolate;
  input [1 : 0] rxbufstatus;
  input [0 : 0] rxchariscomma;
  input [0 : 0] rxcharisk;
  input [2 : 0] rxclkcorcnt;
  input [7 : 0] rxdata;
  input [0 : 0] rxdisperr;
  input [0 : 0] rxnotintable;
  input [0 : 0] rxrundisp;
  input [7 : 0] gmii_txd;
  input [4 : 0] configuration_vector;
  output [7 : 0] txdata;
  output [7 : 0] gmii_rxd;
  output [15 : 0] status_vector;
  
  // synthesis translate_off
  
  wire \U0/gpcs_pma_inst/RXNOTINTABLE_REG_51 ;
  wire \U0/gpcs_pma_inst/RXDISPERR_REG_52 ;
  wire \NlwRenamedSig_OI_U0/gpcs_pma_inst/RECEIVER/RX_INVALID ;
  wire \U0/gpcs_pma_inst/RECEIVER/RUDI_I_54 ;
  wire \U0/gpcs_pma_inst/RECEIVER/RUDI_C_55 ;
  wire \NlwRenamedSignal_U0/gpcs_pma_inst/STATUS_VECTOR_0 ;
  wire \NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ;
  wire \NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ;
  wire \U0/gpcs_pma_inst/TXCHARDISPMODE_60 ;
  wire \U0/gpcs_pma_inst/TXCHARDISPVAL_61 ;
  wire \U0/gpcs_pma_inst/TXCHARISK_62 ;
  wire \NlwRenamedSig_OI_U0/gpcs_pma_inst/SYNCHRONISATION/ENCOMMAALIGN ;
  wire \NlwRenamedSig_OI_U0/gpcs_pma_inst/RECEIVER/RX_DV ;
  wire \U0/gpcs_pma_inst/RECEIVER/RX_ER_65 ;
  wire N0;
  wire \U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd1_68 ;
  wire \U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd2_69 ;
  wire \U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd3_70 ;
  wire \U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd4_71 ;
  wire \U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd1-In ;
  wire \U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd2-In ;
  wire \U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd3-In ;
  wire \U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd1_75 ;
  wire \U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd2_76 ;
  wire \U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd3_77 ;
  wire \U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd4_78 ;
  wire \U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd1-In ;
  wire \U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd2-In ;
  wire \U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd3-In ;
  wire \U0/gpcs_pma_inst/SYNC_SIGNAL_DETECT/data_sync1 ;
  wire \U0/gpcs_pma_inst/SRESET_PIPE_PWR_15_o_MUX_1_o ;
  wire \U0/gpcs_pma_inst/RESET_INT_RXBUFSTATUS_INT[1]_OR_116_o ;
  wire \U0/gpcs_pma_inst/RESET_INT_TXBUFERR_INT_OR_115_o ;
  wire \U0/gpcs_pma_inst/TXCHARDISPVAL_INT_GND_15_o_MUX_194_o ;
  wire \U0/gpcs_pma_inst/TXCHARDISPMODE_INT_TXEVEN_MUX_193_o ;
  wire \U0/gpcs_pma_inst/TXCHARISK_INT_TXEVEN_MUX_192_o ;
  wire \U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<0> ;
  wire \U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<1> ;
  wire \U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<2> ;
  wire \U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<3> ;
  wire \U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<4> ;
  wire \U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<5> ;
  wire \U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<6> ;
  wire \U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<7> ;
  wire \U0/gpcs_pma_inst/RX_RST_SM[3]_GND_15_o_Mux_17_o ;
  wire \U0/gpcs_pma_inst/TX_RST_SM[3]_GND_15_o_Mux_13_o ;
  wire \U0/gpcs_pma_inst/TXBUFERR_INT_99 ;
  wire \U0/gpcs_pma_inst/RXNOTINTABLE_INT_104 ;
  wire \U0/gpcs_pma_inst/RXDISPERR_INT_105 ;
  wire \U0/gpcs_pma_inst/RXCHARISK_INT_114 ;
  wire \U0/gpcs_pma_inst/RXCHARISCOMMA_INT_115 ;
  wire \U0/gpcs_pma_inst/SRESET_117 ;
  wire \U0/gpcs_pma_inst/SRESET_PIPE_118 ;
  wire \U0/gpcs_pma_inst/SYNCHRONISATION/SYNC_STATUS_119 ;
  wire \U0/gpcs_pma_inst/SYNCHRONISATION/EVEN_120 ;
  wire \U0/gpcs_pma_inst/RXNOTINTABLE_SRL ;
  wire \U0/gpcs_pma_inst/RXDISPERR_SRL ;
  wire \U0/gpcs_pma_inst/RESET_INT_PIPE_123 ;
  wire \U0/gpcs_pma_inst/RESET_INT_124 ;
  wire \U0/gpcs_pma_inst/SIGNAL_DETECT_REG ;
  wire \U0/gpcs_pma_inst/DCM_LOCKED_SOFT_RESET_OR_2_o ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/TXCHARDISPVAL_127 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/TXCHARDISPMODE_128 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/TXCHARISK_129 ;
  wire \U0/gpcs_pma_inst/RXNOTINTABLE[0]_GND_15_o_MUX_182_o ;
  wire \U0/gpcs_pma_inst/RXDISPERR[0]_GND_15_o_MUX_183_o ;
  wire \U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<0> ;
  wire \U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<1> ;
  wire \U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<2> ;
  wire \U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<3> ;
  wire \U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<4> ;
  wire \U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<5> ;
  wire \U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<6> ;
  wire \U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<7> ;
  wire \U0/gpcs_pma_inst/RXCLKCORCNT[2]_GND_15_o_mux_22_OUT<0> ;
  wire \U0/gpcs_pma_inst/RXCLKCORCNT[2]_GND_15_o_mux_22_OUT<1> ;
  wire \U0/gpcs_pma_inst/RXCLKCORCNT[2]_GND_15_o_mux_22_OUT<2> ;
  wire \U0/gpcs_pma_inst/RXCHARISK[0]_TXCHARISK_INT_MUX_185_o ;
  wire \U0/gpcs_pma_inst/RXCHARISCOMMA[0]_TXCHARISK_INT_MUX_186_o ;
  wire \U0/gpcs_pma_inst/RXBUFSTATUS[1]_GND_15_o_mux_21_OUT<1> ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT511 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/Mram_CODE_GRP_CNT[1]_GND_22_o_Mux_5_o ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/TX_EN_TRIGGER_S_OR_12_o_0 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT[1]_TX_CONFIG[15]_wide_mux_4_OUT<7> ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/DISP5 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/TX_EN_TRIGGER_T_OR_14_o ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/TX_EN_EVEN_AND_8_o ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/TX_PACKET_CODE_GRP_CNT[1]_MUX_73_o ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRPISK_GND_22_o_MUX_79_o ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<0> ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<1> ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<2> ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<3> ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<4> ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<5> ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<6> ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<7> ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/SYNC_DISPARITY_EVEN_AND_42_o ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<0> ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<1> ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<2> ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<3> ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<4> ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<5> ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<6> ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<7> ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/DISPARITY_184 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/V_185 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/R_186 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/TX_PACKET_187 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/XMIT_CONFIG_INT_188 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/XMIT_DATA_INT_189 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/C1_OR_C2_190 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRPISK_192 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/SYNC_DISPARITY_193 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/TRIGGER_T_194 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/T_195 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/TRIGGER_S_196 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/S_197 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/TX_ER_REG1_210 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/TX_EN_REG1_211 ;
  wire \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4-In1_0 ;
  wire \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd1_221 ;
  wire \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd2_222 ;
  wire \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd3_223 ;
  wire \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4_224 ;
  wire \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4-In2_225 ;
  wire \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd1-In2 ;
  wire \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd2-In2 ;
  wire \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd3-In3 ;
  wire \U0/gpcs_pma_inst/SYNCHRONISATION/_n0103_inv ;
  wire \U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS[1]_PWR_20_o_equal_19_o ;
  wire \U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS[1]_GND_24_o_mux_30_OUT<0> ;
  wire \U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS[1]_GND_24_o_mux_30_OUT<1> ;
  wire \U0/gpcs_pma_inst/SYNCHRONISATION/CGBAD ;
  wire \U0/gpcs_pma_inst/SYNCHRONISATION/SIGNAL_DETECT_REG_236 ;
  wire \U0/gpcs_pma_inst/RECEIVER/K27p7_RXFIFO_ERR_AND_111_o1_237 ;
  wire \U0/gpcs_pma_inst/RECEIVER/C_REG2_238 ;
  wire \U0/gpcs_pma_inst/RECEIVER/K28p5_REG1_D21p5_AND_116_o_norst ;
  wire \U0/gpcs_pma_inst/RECEIVER/IDLE_REG[1]_IDLE_REG[2]_OR_114_o ;
  wire \U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_REG[0]_RX_CONFIG_VALID_REG[3]_OR_113_o ;
  wire \U0/gpcs_pma_inst/RECEIVER/C_REG1_C_REG3_OR_59_o_242 ;
  wire \U0/gpcs_pma_inst/RECEIVER/I_REG_T_REG2_OR_64_o ;
  wire \U0/gpcs_pma_inst/RECEIVER/D0p0_244 ;
  wire \U0/gpcs_pma_inst/RECEIVER/FALSE_DATA_POS_RXNOTINTABLE_AND_203_o ;
  wire \U0/gpcs_pma_inst/RECEIVER/EXTEND_REG3_EXT_ILLEGAL_K_REG2_OR_83_o ;
  wire \U0/gpcs_pma_inst/RECEIVER/EOP_EXTEND_OR_65_o ;
  wire \U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<0> ;
  wire \U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<1> ;
  wire \U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<2> ;
  wire \U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<3> ;
  wire \U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<4> ;
  wire \U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<5> ;
  wire \U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<6> ;
  wire \U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<7> ;
  wire \U0/gpcs_pma_inst/RECEIVER/RXCHARISK_REG1_K28p5_REG1_AND_167_o ;
  wire \U0/gpcs_pma_inst/RECEIVER/S_WAIT_FOR_K_AND_144_o ;
  wire \U0/gpcs_pma_inst/RECEIVER/EXTEND_REG1_ISOLATE_AND_182_o_258 ;
  wire \U0/gpcs_pma_inst/RECEIVER/SYNC_STATUS_C_REG1_AND_125_o_259 ;
  wire \U0/gpcs_pma_inst/RECEIVER/EVEN_RXCHARISK_AND_115_o_260 ;
  wire \U0/gpcs_pma_inst/RECEIVER/K28p5_REG1_EVEN_AND_127_o ;
  wire \U0/gpcs_pma_inst/RECEIVER/K28p5 ;
  wire \U0/gpcs_pma_inst/RECEIVER/RXDATA[7]_RXNOTINTABLE_AND_211_o ;
  wire \U0/gpcs_pma_inst/RECEIVER/K23p7 ;
  wire \U0/gpcs_pma_inst/RECEIVER/K27p7_RXFIFO_ERR_AND_111_o ;
  wire \U0/gpcs_pma_inst/RECEIVER/K29p7 ;
  wire \U0/gpcs_pma_inst/RECEIVER/RXFIFO_ERR_RXDISPERR_OR_36_o ;
  wire \U0/gpcs_pma_inst/RECEIVER/RESET_SYNC_STATUS_OR_51_o ;
  wire \U0/gpcs_pma_inst/RECEIVER/EXTEND_269 ;
  wire \U0/gpcs_pma_inst/RECEIVER/RECEIVE_270 ;
  wire \U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_271 ;
  wire \U0/gpcs_pma_inst/RECEIVER/WAIT_FOR_K_272 ;
  wire \U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_280 ;
  wire \U0/gpcs_pma_inst/RECEIVER/FALSE_K_281 ;
  wire \U0/gpcs_pma_inst/RECEIVER/FALSE_DATA_282 ;
  wire \U0/gpcs_pma_inst/RECEIVER/EXT_ILLEGAL_K_REG2_283 ;
  wire \U0/gpcs_pma_inst/RECEIVER/EXT_ILLEGAL_K_REG1_284 ;
  wire \U0/gpcs_pma_inst/RECEIVER/EXT_ILLEGAL_K_285 ;
  wire \U0/gpcs_pma_inst/RECEIVER/EXTEND_ERR_286 ;
  wire \U0/gpcs_pma_inst/RECEIVER/ILLEGAL_K_REG2_287 ;
  wire \U0/gpcs_pma_inst/RECEIVER/ILLEGAL_K_REG1_288 ;
  wire \U0/gpcs_pma_inst/RECEIVER/ILLEGAL_K_289 ;
  wire \U0/gpcs_pma_inst/RECEIVER/RX_DATA_ERROR_290 ;
  wire \U0/gpcs_pma_inst/RECEIVER/EOP_REG1_291 ;
  wire \U0/gpcs_pma_inst/RECEIVER/EOP_292 ;
  wire \U0/gpcs_pma_inst/RECEIVER/SOP_293 ;
  wire \U0/gpcs_pma_inst/RECEIVER/FROM_RX_CX_294 ;
  wire \U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_REG3_296 ;
  wire \U0/gpcs_pma_inst/RECEIVER/SYNC_STATUS_REG_297 ;
  wire \U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_INT_298 ;
  wire \U0/gpcs_pma_inst/RECEIVER/CGBAD_REG3_299 ;
  wire \U0/gpcs_pma_inst/RECEIVER/CGBAD_300 ;
  wire \U0/gpcs_pma_inst/RECEIVER/R_301 ;
  wire \U0/gpcs_pma_inst/RECEIVER/EXTEND_REG3_310 ;
  wire \U0/gpcs_pma_inst/RECEIVER/EXTEND_REG1_311 ;
  wire \U0/gpcs_pma_inst/RECEIVER/SOP_REG3_312 ;
  wire \U0/gpcs_pma_inst/RECEIVER/SOP_REG2_313 ;
  wire \U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_REG2 ;
  wire \U0/gpcs_pma_inst/RECEIVER/C_HDR_REMOVED_REG_315 ;
  wire \U0/gpcs_pma_inst/RECEIVER/CGBAD_REG2 ;
  wire \U0/gpcs_pma_inst/RECEIVER/RXCHARISK_REG1_317 ;
  wire \U0/gpcs_pma_inst/RECEIVER/C_REG3_318 ;
  wire \U0/gpcs_pma_inst/RECEIVER/C_REG1_319 ;
  wire \U0/gpcs_pma_inst/RECEIVER/I_REG_320 ;
  wire \U0/gpcs_pma_inst/RECEIVER/R_REG1_321 ;
  wire \U0/gpcs_pma_inst/RECEIVER/T_REG2_322 ;
  wire \U0/gpcs_pma_inst/RECEIVER/T_REG1_323 ;
  wire \U0/gpcs_pma_inst/RECEIVER/D0p0_REG_324 ;
  wire \U0/gpcs_pma_inst/RECEIVER/K28p5_REG1_325 ;
  wire \U0/gpcs_pma_inst/RECEIVER/C_326 ;
  wire \U0/gpcs_pma_inst/RECEIVER/I_327 ;
  wire \U0/gpcs_pma_inst/RECEIVER/T_328 ;
  wire \U0/gpcs_pma_inst/RECEIVER/S_329 ;
  wire N2;
  wire N6;
  wire N8;
  wire \U0/gpcs_pma_inst/TRANSMITTER/TX_EN_REG1_XMIT_DATA_INT_AND_20_o1_333 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/TX_EN_REG1_XMIT_DATA_INT_AND_20_o2_334 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT2 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT1 ;
  wire N14;
  wire N18;
  wire N20;
  wire \U0/gpcs_pma_inst/RECEIVER/D21p5_D2p2_OR_38_o ;
  wire \U0/gpcs_pma_inst/RECEIVER/D21p5_D2p2_OR_38_o1_341 ;
  wire N22;
  wire N24;
  wire \U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o1 ;
  wire \U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o12_345 ;
  wire \U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o13_346 ;
  wire \U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o14_347 ;
  wire \U0/gpcs_pma_inst/RECEIVER/I_REG_T_REG2_OR_64_o1_348 ;
  wire \U0/gpcs_pma_inst/RECEIVER/T_REG2_R_REG1_OR_79_o1_349 ;
  wire \U0/gpcs_pma_inst/RECEIVER/T_REG2_R_REG1_OR_79_o2_350 ;
  wire N26;
  wire \U0/gpcs_pma_inst/TRANSMITTER/V_glue_set_352 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/TX_PACKET_glue_set_353 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/R_glue_set_354 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/DISPARITY_glue_rst_355 ;
  wire \U0/gpcs_pma_inst/SYNCHRONISATION/EVEN_glue_set_356 ;
  wire \U0/gpcs_pma_inst/RECEIVER/RECEIVE_glue_set_357 ;
  wire \U0/gpcs_pma_inst/RECEIVER/RX_INVALID_glue_set_358 ;
  wire \U0/gpcs_pma_inst/RECEIVER/RX_DV_glue_set_359 ;
  wire \U0/gpcs_pma_inst/RECEIVER/EXTEND_glue_set_360 ;
  wire \U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_glue_set_361 ;
  wire \U0/gpcs_pma_inst/RECEIVER/WAIT_FOR_K_glue_set_362 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/C1_OR_C2_rstpot_363 ;
  wire \U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd4_rstpot_364 ;
  wire \U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd4_rstpot_365 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRPISK_rstpot_366 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/TXCHARDISPVAL_rstpot_367 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/TRIGGER_T_rstpot_368 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/S_rstpot_369 ;
  wire \U0/gpcs_pma_inst/TRANSMITTER/CONFIG_DATA_0_rstpot_370 ;
  wire \U0/gpcs_pma_inst/RECEIVER/C_HDR_REMOVED_REG_rstpot_371 ;
  wire \U0/gpcs_pma_inst/RECEIVER/C_rstpot_372 ;
  wire \U0/gpcs_pma_inst/RECEIVER/EXT_ILLEGAL_K_rstpot_373 ;
  wire \U0/gpcs_pma_inst/RECEIVER/RX_DATA_ERROR_rstpot_374 ;
  wire \U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_rstpot_375 ;
  wire N28;
  wire N34;
  wire N38;
  wire N39;
  wire N43;
  wire N45;
  wire N57;
  wire N59;
  wire \U0/gpcs_pma_inst/SYNCHRONISATION/ENCOMMAALIGN_rstpot_384 ;
  wire \U0/gpcs_pma_inst/SYNCHRONISATION/SYNC_STATUS_rstpot_385 ;
  wire N71;
  wire N73;
  wire N75;
  wire N77;
  wire N79;
  wire N81;
  wire N83;
  wire N84;
  wire N85;
  wire N86;
  wire N87;
  wire N88;
  wire N89;
  wire N90;
  wire N91;
  wire N92;
  wire N93;
  wire N94;
  wire \U0/gpcs_pma_inst/Mshreg_STATUS_VECTOR_0_404 ;
  wire \U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_7_405 ;
  wire \U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_6_406 ;
  wire \U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_5_407 ;
  wire \U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_2_408 ;
  wire \U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_4_409 ;
  wire \U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_3_410 ;
  wire \U0/gpcs_pma_inst/RECEIVER/Mshreg_EXTEND_REG3_411 ;
  wire \U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_1_412 ;
  wire \U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_0_413 ;
  wire \U0/gpcs_pma_inst/RECEIVER/Mshreg_SOP_REG2_414 ;
  wire \NLW_U0/gpcs_pma_inst/Mshreg_STATUS_VECTOR_0_Q15_UNCONNECTED ;
  wire \NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_7_Q15_UNCONNECTED ;
  wire \NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_6_Q15_UNCONNECTED ;
  wire \NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_5_Q15_UNCONNECTED ;
  wire \NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_2_Q15_UNCONNECTED ;
  wire \NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_4_Q15_UNCONNECTED ;
  wire \NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_3_Q15_UNCONNECTED ;
  wire \NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_EXTEND_REG3_Q15_UNCONNECTED ;
  wire \NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_1_Q15_UNCONNECTED ;
  wire \NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_0_Q15_UNCONNECTED ;
  wire \NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_CGBAD_REG2_Q15_UNCONNECTED ;
  wire \NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_SOP_REG2_Q15_UNCONNECTED ;
  wire \NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_FALSE_CARRIER_REG2_Q15_UNCONNECTED ;
  wire [7 : 0] \U0/gpcs_pma_inst/TXDATA ;
  wire [7 : 0] \U0/gpcs_pma_inst/RECEIVER/RXD ;
  wire [3 : 2] \NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG ;
  wire [2 : 0] \U0/gpcs_pma_inst/RXCLKCORCNT_INT ;
  wire [1 : 1] \U0/gpcs_pma_inst/RXBUFSTATUS_INT ;
  wire [7 : 0] \U0/gpcs_pma_inst/RXDATA_INT ;
  wire [1 : 1] \U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG ;
  wire [1 : 0] \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT ;
  wire [7 : 0] \U0/gpcs_pma_inst/TRANSMITTER/TXDATA ;
  wire [1 : 0] \U0/gpcs_pma_inst/TRANSMITTER/Result ;
  wire [1 : 1] \U0/gpcs_pma_inst/TRANSMITTER/_n0235 ;
  wire [3 : 0] \U0/gpcs_pma_inst/TRANSMITTER/CONFIG_DATA ;
  wire [7 : 0] \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP ;
  wire [7 : 0] \U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1 ;
  wire [1 : 0] \U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS ;
  wire [2 : 0] \U0/gpcs_pma_inst/RECEIVER/IDLE_REG ;
  wire [3 : 0] \U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_REG ;
  wire [7 : 7] NlwRenamedSig_OI_status_vector;
  wire [7 : 0] \U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5 ;
  assign
    txdata[7] = \U0/gpcs_pma_inst/TXDATA [7],
    txdata[6] = \U0/gpcs_pma_inst/TXDATA [6],
    txdata[5] = \U0/gpcs_pma_inst/TXDATA [5],
    txdata[4] = \U0/gpcs_pma_inst/TXDATA [4],
    txdata[3] = \U0/gpcs_pma_inst/TXDATA [3],
    txdata[2] = \U0/gpcs_pma_inst/TXDATA [2],
    txdata[1] = \U0/gpcs_pma_inst/TXDATA [1],
    txdata[0] = \U0/gpcs_pma_inst/TXDATA [0],
    gmii_rxd[7] = \U0/gpcs_pma_inst/RECEIVER/RXD [7],
    gmii_rxd[6] = \U0/gpcs_pma_inst/RECEIVER/RXD [6],
    gmii_rxd[5] = \U0/gpcs_pma_inst/RECEIVER/RXD [5],
    gmii_rxd[4] = \U0/gpcs_pma_inst/RECEIVER/RXD [4],
    gmii_rxd[3] = \U0/gpcs_pma_inst/RECEIVER/RXD [3],
    gmii_rxd[2] = \U0/gpcs_pma_inst/RECEIVER/RXD [2],
    gmii_rxd[1] = \U0/gpcs_pma_inst/RECEIVER/RXD [1],
    gmii_rxd[0] = \U0/gpcs_pma_inst/RECEIVER/RXD [0],
    status_vector[15] = NlwRenamedSig_OI_status_vector[7],
    status_vector[14] = NlwRenamedSig_OI_status_vector[7],
    status_vector[13] = NlwRenamedSig_OI_status_vector[7],
    status_vector[12] = NlwRenamedSig_OI_status_vector[7],
    status_vector[11] = NlwRenamedSig_OI_status_vector[7],
    status_vector[10] = NlwRenamedSig_OI_status_vector[7],
    status_vector[9] = NlwRenamedSig_OI_status_vector[7],
    status_vector[8] = NlwRenamedSig_OI_status_vector[7],
    status_vector[7] = NlwRenamedSig_OI_status_vector[7],
    status_vector[6] = \U0/gpcs_pma_inst/RXNOTINTABLE_REG_51 ,
    status_vector[5] = \U0/gpcs_pma_inst/RXDISPERR_REG_52 ,
    status_vector[4] = \NlwRenamedSig_OI_U0/gpcs_pma_inst/RECEIVER/RX_INVALID ,
    status_vector[3] = \U0/gpcs_pma_inst/RECEIVER/RUDI_I_54 ,
    status_vector[2] = \U0/gpcs_pma_inst/RECEIVER/RUDI_C_55 ,
    status_vector[1] = \NlwRenamedSignal_U0/gpcs_pma_inst/STATUS_VECTOR_0 ,
    status_vector[0] = \NlwRenamedSignal_U0/gpcs_pma_inst/STATUS_VECTOR_0 ,
    mgt_rx_reset = \NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ,
    mgt_tx_reset = \NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ,
    powerdown = \NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [2],
    txchardispmode = \U0/gpcs_pma_inst/TXCHARDISPMODE_60 ,
    txchardispval = \U0/gpcs_pma_inst/TXCHARDISPVAL_61 ,
    txcharisk = \U0/gpcs_pma_inst/TXCHARISK_62 ,
    enablealign = \NlwRenamedSig_OI_U0/gpcs_pma_inst/SYNCHRONISATION/ENCOMMAALIGN ,
    gmii_rx_dv = \NlwRenamedSig_OI_U0/gpcs_pma_inst/RECEIVER/RX_DV ,
    gmii_rx_er = \U0/gpcs_pma_inst/RECEIVER/RX_ER_65 ,
    gmii_isolate = \NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [3];
  VCC   XST_VCC (
    .P(N0)
  );
  GND   XST_GND (
    .G(NlwRenamedSig_OI_status_vector[7])
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/gpcs_pma_inst/DELAY_RXNOTINTABLE  (
    .A0(NlwRenamedSig_OI_status_vector[7]),
    .A1(NlwRenamedSig_OI_status_vector[7]),
    .A2(N0),
    .A3(NlwRenamedSig_OI_status_vector[7]),
    .CLK(userclk2),
    .D(\U0/gpcs_pma_inst/RXNOTINTABLE_INT_104 ),
    .Q(\U0/gpcs_pma_inst/RXNOTINTABLE_SRL )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/gpcs_pma_inst/DELAY_RXDISPERR  (
    .A0(NlwRenamedSig_OI_status_vector[7]),
    .A1(NlwRenamedSig_OI_status_vector[7]),
    .A2(N0),
    .A3(NlwRenamedSig_OI_status_vector[7]),
    .CLK(userclk2),
    .D(\U0/gpcs_pma_inst/RXDISPERR_INT_105 ),
    .Q(\U0/gpcs_pma_inst/RXDISPERR_SRL )
  );
  FDR   \U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd2  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd2-In ),
    .R(\U0/gpcs_pma_inst/RESET_INT_RXBUFSTATUS_INT[1]_OR_116_o ),
    .Q(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd2_69 )
  );
  FDR   \U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd3  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd3-In ),
    .R(\U0/gpcs_pma_inst/RESET_INT_RXBUFSTATUS_INT[1]_OR_116_o ),
    .Q(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd3_70 )
  );
  FDR   \U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd1  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd1-In ),
    .R(\U0/gpcs_pma_inst/RESET_INT_RXBUFSTATUS_INT[1]_OR_116_o ),
    .Q(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd1_68 )
  );
  FDR   \U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd1  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd1-In ),
    .R(\U0/gpcs_pma_inst/RESET_INT_TXBUFERR_INT_OR_115_o ),
    .Q(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd1_75 )
  );
  FDR   \U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd2  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd2-In ),
    .R(\U0/gpcs_pma_inst/RESET_INT_TXBUFERR_INT_OR_115_o ),
    .Q(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd2_76 )
  );
  FDR   \U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd3  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd3-In ),
    .R(\U0/gpcs_pma_inst/RESET_INT_TXBUFERR_INT_OR_115_o ),
    .Q(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd3_77 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/gpcs_pma_inst/SYNC_SIGNAL_DETECT/data_sync  (
    .C(userclk2),
    .D(signal_detect),
    .Q(\U0/gpcs_pma_inst/SYNC_SIGNAL_DETECT/data_sync1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/gpcs_pma_inst/SYNC_SIGNAL_DETECT/data_sync_reg  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/SYNC_SIGNAL_DETECT/data_sync1 ),
    .Q(\U0/gpcs_pma_inst/SIGNAL_DETECT_REG )
  );
  FD   \U0/gpcs_pma_inst/RXNOTINTABLE_REG  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RXNOTINTABLE_SRL ),
    .Q(\U0/gpcs_pma_inst/RXNOTINTABLE_REG_51 )
  );
  FD   \U0/gpcs_pma_inst/RXDISPERR_REG  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RXDISPERR_SRL ),
    .Q(\U0/gpcs_pma_inst/RXDISPERR_REG_52 )
  );
  FDR   \U0/gpcs_pma_inst/TXCHARDISPVAL  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TXCHARDISPVAL_INT_GND_15_o_MUX_194_o ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TXCHARDISPVAL_61 )
  );
  FDR   \U0/gpcs_pma_inst/TXCHARDISPMODE  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TXCHARDISPMODE_INT_TXEVEN_MUX_193_o ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TXCHARDISPMODE_60 )
  );
  FDR   \U0/gpcs_pma_inst/TXCHARISK  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TXCHARISK_INT_TXEVEN_MUX_192_o ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TXCHARISK_62 )
  );
  FDR   \U0/gpcs_pma_inst/TXDATA_7  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<7> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TXDATA [7])
  );
  FDR   \U0/gpcs_pma_inst/TXDATA_6  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<6> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TXDATA [6])
  );
  FDR   \U0/gpcs_pma_inst/TXDATA_5  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<5> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TXDATA [5])
  );
  FDR   \U0/gpcs_pma_inst/TXDATA_4  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<4> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TXDATA [4])
  );
  FDR   \U0/gpcs_pma_inst/TXDATA_3  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<3> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TXDATA [3])
  );
  FDR   \U0/gpcs_pma_inst/TXDATA_2  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<2> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TXDATA [2])
  );
  FDR   \U0/gpcs_pma_inst/TXDATA_1  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<1> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TXDATA [1])
  );
  FDR   \U0/gpcs_pma_inst/TXDATA_0  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<0> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TXDATA [0])
  );
  FDR   \U0/gpcs_pma_inst/RXCHARISK_INT  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RXCHARISK[0]_TXCHARISK_INT_MUX_185_o ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RXCHARISK_INT_114 )
  );
  FDR   \U0/gpcs_pma_inst/RXCHARISCOMMA_INT  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RXCHARISCOMMA[0]_TXCHARISK_INT_MUX_186_o ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RXCHARISCOMMA_INT_115 )
  );
  FDR   \U0/gpcs_pma_inst/RXDATA_INT_7  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<7> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RXDATA_INT [7])
  );
  FDR   \U0/gpcs_pma_inst/RXDATA_INT_6  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<6> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RXDATA_INT [6])
  );
  FDR   \U0/gpcs_pma_inst/RXDATA_INT_5  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<5> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RXDATA_INT [5])
  );
  FDR   \U0/gpcs_pma_inst/RXDATA_INT_4  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<4> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RXDATA_INT [4])
  );
  FDR   \U0/gpcs_pma_inst/RXDATA_INT_3  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<3> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RXDATA_INT [3])
  );
  FDR   \U0/gpcs_pma_inst/RXDATA_INT_2  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<2> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RXDATA_INT [2])
  );
  FDR   \U0/gpcs_pma_inst/RXDATA_INT_1  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<1> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RXDATA_INT [1])
  );
  FDR   \U0/gpcs_pma_inst/RXDATA_INT_0  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<0> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RXDATA_INT [0])
  );
  FDR   \U0/gpcs_pma_inst/RXCLKCORCNT_INT_2  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RXCLKCORCNT[2]_GND_15_o_mux_22_OUT<2> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RXCLKCORCNT_INT [2])
  );
  FDR   \U0/gpcs_pma_inst/RXCLKCORCNT_INT_1  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RXCLKCORCNT[2]_GND_15_o_mux_22_OUT<1> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RXCLKCORCNT_INT [1])
  );
  FDR   \U0/gpcs_pma_inst/RXCLKCORCNT_INT_0  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RXCLKCORCNT[2]_GND_15_o_mux_22_OUT<0> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RXCLKCORCNT_INT [0])
  );
  FDR   \U0/gpcs_pma_inst/RXBUFSTATUS_INT_1  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RXBUFSTATUS[1]_GND_15_o_mux_21_OUT<1> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RXBUFSTATUS_INT [1])
  );
  FDR   \U0/gpcs_pma_inst/RXNOTINTABLE_INT  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RXNOTINTABLE[0]_GND_15_o_MUX_182_o ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RXNOTINTABLE_INT_104 )
  );
  FDR   \U0/gpcs_pma_inst/RXDISPERR_INT  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RXDISPERR[0]_GND_15_o_MUX_183_o ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RXDISPERR_INT_105 )
  );
  FDR   \U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG_3  (
    .C(userclk2),
    .D(configuration_vector[3]),
    .R(\U0/gpcs_pma_inst/SRESET_117 ),
    .Q(\NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [3])
  );
  FDR   \U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG_2  (
    .C(userclk2),
    .D(configuration_vector[2]),
    .R(\U0/gpcs_pma_inst/SRESET_117 ),
    .Q(\NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [2])
  );
  FDR   \U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG_1  (
    .C(userclk2),
    .D(configuration_vector[1]),
    .R(\U0/gpcs_pma_inst/SRESET_117 ),
    .Q(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1])
  );
  FD   \U0/gpcs_pma_inst/SRESET  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/SRESET_PIPE_PWR_15_o_MUX_1_o ),
    .Q(\U0/gpcs_pma_inst/SRESET_117 )
  );
  FDR   \U0/gpcs_pma_inst/TXBUFERR_INT  (
    .C(userclk2),
    .D(txbuferr),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TXBUFERR_INT_99 )
  );
  FD   \U0/gpcs_pma_inst/SRESET_PIPE  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RESET_INT_124 ),
    .Q(\U0/gpcs_pma_inst/SRESET_PIPE_118 )
  );
  FDS   \U0/gpcs_pma_inst/MGT_RX_RESET_INT  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RX_RST_SM[3]_GND_15_o_Mux_17_o ),
    .S(\U0/gpcs_pma_inst/RESET_INT_RXBUFSTATUS_INT[1]_OR_116_o ),
    .Q(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT )
  );
  FDS   \U0/gpcs_pma_inst/MGT_TX_RESET_INT  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TX_RST_SM[3]_GND_15_o_Mux_13_o ),
    .S(\U0/gpcs_pma_inst/RESET_INT_TXBUFERR_INT_OR_115_o ),
    .Q(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT )
  );
  FDP   \U0/gpcs_pma_inst/RESET_INT  (
    .C(userclk),
    .D(\U0/gpcs_pma_inst/RESET_INT_PIPE_123 ),
    .PRE(\U0/gpcs_pma_inst/DCM_LOCKED_SOFT_RESET_OR_2_o ),
    .Q(\U0/gpcs_pma_inst/RESET_INT_124 )
  );
  FDP   \U0/gpcs_pma_inst/RESET_INT_PIPE  (
    .C(userclk),
    .D(NlwRenamedSig_OI_status_vector[7]),
    .PRE(\U0/gpcs_pma_inst/DCM_LOCKED_SOFT_RESET_OR_2_o ),
    .Q(\U0/gpcs_pma_inst/RESET_INT_PIPE_123 )
  );
  FDS   \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT_1  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/Result [1]),
    .S(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [1])
  );
  FDS   \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT_0  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/Result [0]),
    .S(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0])
  );
  FDR   \U0/gpcs_pma_inst/TRANSMITTER/TXDATA_7  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<7> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [7])
  );
  FDR   \U0/gpcs_pma_inst/TRANSMITTER/TXDATA_6  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<6> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [6])
  );
  FDR   \U0/gpcs_pma_inst/TRANSMITTER/TXDATA_5  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<5> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [5])
  );
  FDR   \U0/gpcs_pma_inst/TRANSMITTER/TXDATA_4  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<4> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [4])
  );
  FDR   \U0/gpcs_pma_inst/TRANSMITTER/TXDATA_3  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<3> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [3])
  );
  FDR   \U0/gpcs_pma_inst/TRANSMITTER/TXDATA_2  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<2> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [2])
  );
  FDR   \U0/gpcs_pma_inst/TRANSMITTER/TXDATA_1  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<1> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [1])
  );
  FDR   \U0/gpcs_pma_inst/TRANSMITTER/TXDATA_0  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<0> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [0])
  );
  FDR   \U0/gpcs_pma_inst/TRANSMITTER/TXCHARISK  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRPISK_GND_22_o_MUX_79_o ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TXCHARISK_129 )
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_7  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<7> ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [7])
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_6  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<6> ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [6])
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_5  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<5> ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [5])
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_4  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<4> ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [4])
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_3  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<3> ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [3])
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_2  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<2> ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [2])
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_1  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<1> ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [1])
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_0  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<0> ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [0])
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/SYNC_DISPARITY  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/TX_PACKET_CODE_GRP_CNT[1]_MUX_73_o ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/SYNC_DISPARITY_193 )
  );
  FDSE   \U0/gpcs_pma_inst/TRANSMITTER/XMIT_CONFIG_INT  (
    .C(userclk2),
    .CE(\U0/gpcs_pma_inst/TRANSMITTER/Mram_CODE_GRP_CNT[1]_GND_22_o_Mux_5_o ),
    .D(NlwRenamedSig_OI_status_vector[7]),
    .S(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/XMIT_CONFIG_INT_188 )
  );
  FDS   \U0/gpcs_pma_inst/TRANSMITTER/TXCHARDISPMODE  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/SYNC_DISPARITY_EVEN_AND_42_o ),
    .S(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TXCHARDISPMODE_128 )
  );
  FDRE   \U0/gpcs_pma_inst/TRANSMITTER/XMIT_DATA_INT  (
    .C(userclk2),
    .CE(\U0/gpcs_pma_inst/TRANSMITTER/Mram_CODE_GRP_CNT[1]_GND_22_o_Mux_5_o ),
    .D(N0),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/XMIT_DATA_INT_189 )
  );
  FDR   \U0/gpcs_pma_inst/TRANSMITTER/TRIGGER_S  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/TX_EN_EVEN_AND_8_o ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TRIGGER_S_196 )
  );
  FDR   \U0/gpcs_pma_inst/TRANSMITTER/T  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/TX_EN_TRIGGER_T_OR_14_o ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/T_195 )
  );
  FDR   \U0/gpcs_pma_inst/TRANSMITTER/CONFIG_DATA_3  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/Mram_CODE_GRP_CNT[1]_GND_22_o_Mux_5_o ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/CONFIG_DATA [3])
  );
  FDR   \U0/gpcs_pma_inst/TRANSMITTER/CONFIG_DATA_2  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT[1]_TX_CONFIG[15]_wide_mux_4_OUT<7> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/CONFIG_DATA [2])
  );
  FDR   \U0/gpcs_pma_inst/TRANSMITTER/CONFIG_DATA_1  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/_n0235 [1]),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/CONFIG_DATA [1])
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/TX_ER_REG1  (
    .C(userclk2),
    .D(gmii_tx_er),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TX_ER_REG1_210 )
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/TX_EN_REG1  (
    .C(userclk2),
    .D(gmii_tx_en),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TX_EN_REG1_211 )
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1_7  (
    .C(userclk2),
    .D(gmii_txd[7]),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1 [7])
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1_6  (
    .C(userclk2),
    .D(gmii_txd[6]),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1 [6])
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1_5  (
    .C(userclk2),
    .D(gmii_txd[5]),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1 [5])
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1_4  (
    .C(userclk2),
    .D(gmii_txd[4]),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1 [4])
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1_3  (
    .C(userclk2),
    .D(gmii_txd[3]),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1 [3])
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1_2  (
    .C(userclk2),
    .D(gmii_txd[2]),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1 [2])
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1_1  (
    .C(userclk2),
    .D(gmii_txd[1]),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1 [1])
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1_0  (
    .C(userclk2),
    .D(gmii_txd[0]),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1 [0])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd1  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd1-In2 ),
    .R(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4-In1_0 ),
    .Q(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd1_221 )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd2  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd2-In2 ),
    .R(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4-In1_0 ),
    .Q(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd2_222 )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4-In2_225 ),
    .R(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4-In1_0 ),
    .Q(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4_224 )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd3  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd3-In3 ),
    .R(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4-In1_0 ),
    .Q(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd3_223 )
  );
  FDRE   \U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS_1  (
    .C(userclk2),
    .CE(\U0/gpcs_pma_inst/SYNCHRONISATION/_n0103_inv ),
    .D(\U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS[1]_GND_24_o_mux_30_OUT<1> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS [1])
  );
  FDRE   \U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS_0  (
    .C(userclk2),
    .CE(\U0/gpcs_pma_inst/SYNCHRONISATION/_n0103_inv ),
    .D(\U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS[1]_GND_24_o_mux_30_OUT<0> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS [0])
  );
  FD   \U0/gpcs_pma_inst/SYNCHRONISATION/SIGNAL_DETECT_REG  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/SIGNAL_DETECT_REG ),
    .Q(\U0/gpcs_pma_inst/SYNCHRONISATION/SIGNAL_DETECT_REG_236 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/RXD_7  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<7> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [3]),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RXD [7])
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/RXD_6  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<6> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [3]),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RXD [6])
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/RXD_5  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<5> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [3]),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RXD [5])
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/RXD_4  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<4> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [3]),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RXD [4])
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/RXD_3  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<3> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [3]),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RXD [3])
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/RXD_2  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<2> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [3]),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RXD [2])
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/RXD_1  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<1> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [3]),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RXD [1])
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/RXD_0  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<0> ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [3]),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RXD [0])
  );
  FD   \U0/gpcs_pma_inst/RECEIVER/C_REG3  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/C_REG2_238 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/C_REG3_318 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_REG3  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_REG2 ),
    .R(\U0/gpcs_pma_inst/RECEIVER/RESET_SYNC_STATUS_OR_51_o ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_REG3_296 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/CGBAD_REG3  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/CGBAD_REG2 ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/CGBAD_REG3_299 )
  );
  FD   \U0/gpcs_pma_inst/RECEIVER/SOP_REG3  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/SOP_REG2_313 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/SOP_REG3_312 )
  );
  FD   \U0/gpcs_pma_inst/RECEIVER/C_REG2  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/C_REG1_319 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/C_REG2_238 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/IDLE_REG_2  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/IDLE_REG [1]),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/IDLE_REG [2])
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/IDLE_REG_1  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/IDLE_REG [0]),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/IDLE_REG [1])
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/IDLE_REG_0  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/I_REG_320 ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/IDLE_REG [0])
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/EXT_ILLEGAL_K_REG2  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/EXT_ILLEGAL_K_REG1_284 ),
    .R(\U0/gpcs_pma_inst/RECEIVER/RESET_SYNC_STATUS_OR_51_o ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/EXT_ILLEGAL_K_REG2_283 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/ILLEGAL_K_REG2  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/ILLEGAL_K_REG1_288 ),
    .R(\U0/gpcs_pma_inst/RECEIVER/RESET_SYNC_STATUS_OR_51_o ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/ILLEGAL_K_REG2_287 )
  );
  FD   \U0/gpcs_pma_inst/RECEIVER/C_REG1  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/C_326 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/C_REG1_319 )
  );
  FD   \U0/gpcs_pma_inst/RECEIVER/T_REG2  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/T_REG1_323 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/T_REG2_322 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_REG_3  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_REG [2]),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_REG [3])
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_REG_2  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_REG [1]),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_REG [2])
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_REG_1  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_REG [0]),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_REG [1])
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_REG_0  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_INT_298 ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_REG [0])
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/EXT_ILLEGAL_K_REG1  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/EXT_ILLEGAL_K_285 ),
    .R(\U0/gpcs_pma_inst/RECEIVER/RESET_SYNC_STATUS_OR_51_o ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/EXT_ILLEGAL_K_REG1_284 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/ILLEGAL_K_REG1  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/ILLEGAL_K_289 ),
    .R(\U0/gpcs_pma_inst/RECEIVER/RESET_SYNC_STATUS_OR_51_o ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/ILLEGAL_K_REG1_288 )
  );
  FD   \U0/gpcs_pma_inst/RECEIVER/EXTEND_REG1  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/EXTEND_269 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/EXTEND_REG1_311 )
  );
  FD   \U0/gpcs_pma_inst/RECEIVER/I_REG  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/I_327 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/I_REG_320 )
  );
  FD   \U0/gpcs_pma_inst/RECEIVER/R_REG1  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/R_301 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/R_REG1_321 )
  );
  FD   \U0/gpcs_pma_inst/RECEIVER/T_REG1  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/T_328 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/T_REG1_323 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/RUDI_I  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/IDLE_REG[1]_IDLE_REG[2]_OR_114_o ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RUDI_I_54 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/RUDI_C  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_REG[0]_RX_CONFIG_VALID_REG[3]_OR_113_o ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RUDI_C_55 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/FALSE_K  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/RXDATA[7]_RXNOTINTABLE_AND_211_o ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/FALSE_K_281 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/FALSE_DATA  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/FALSE_DATA_POS_RXNOTINTABLE_AND_203_o ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/FALSE_DATA_282 )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/gpcs_pma_inst/RECEIVER/RX_ER  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/EXTEND_REG1_ISOLATE_AND_182_o_258 ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RX_ER_65 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/EXTEND_ERR  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/EXTEND_REG3_EXT_ILLEGAL_K_REG2_OR_83_o ),
    .R(\U0/gpcs_pma_inst/RECEIVER/RESET_SYNC_STATUS_OR_51_o ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/EXTEND_ERR_286 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/ILLEGAL_K  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/RXCHARISK_REG1_K28p5_REG1_AND_167_o ),
    .R(\U0/gpcs_pma_inst/RECEIVER/RESET_SYNC_STATUS_OR_51_o ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/ILLEGAL_K_289 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/EOP  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/I_REG_T_REG2_OR_64_o ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/EOP_292 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/SOP  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/S_WAIT_FOR_K_AND_144_o ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/SOP_293 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/EOP_REG1  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/EOP_EXTEND_OR_65_o ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/EOP_REG1_291 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/FROM_RX_CX  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/C_REG1_C_REG3_OR_59_o_242 ),
    .R(\U0/gpcs_pma_inst/RECEIVER/RESET_SYNC_STATUS_OR_51_o ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/FROM_RX_CX_294 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/SYNC_STATUS_REG  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/SYNCHRONISATION/SYNC_STATUS_119 ),
    .R(\U0/gpcs_pma_inst/RECEIVER/RESET_SYNC_STATUS_OR_51_o ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/SYNC_STATUS_REG_297 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_INT  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/SYNC_STATUS_C_REG1_AND_125_o_259 ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_INT_298 )
  );
  FD   \U0/gpcs_pma_inst/RECEIVER/R  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/K23p7 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/R_301 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/CGBAD  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/RXFIFO_ERR_RXDISPERR_OR_36_o ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/CGBAD_300 )
  );
  FD   \U0/gpcs_pma_inst/RECEIVER/RXCHARISK_REG1  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RXCHARISK_INT_114 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RXCHARISK_REG1_317 )
  );
  FD   \U0/gpcs_pma_inst/RECEIVER/D0p0_REG  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/D0p0_244 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/D0p0_REG_324 )
  );
  FD   \U0/gpcs_pma_inst/RECEIVER/K28p5_REG1  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/K28p5 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/K28p5_REG1_325 )
  );
  FD   \U0/gpcs_pma_inst/RECEIVER/I  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/EVEN_RXCHARISK_AND_115_o_260 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/I_327 )
  );
  FD   \U0/gpcs_pma_inst/RECEIVER/S  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/K27p7_RXFIFO_ERR_AND_111_o ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/S_329 )
  );
  FD   \U0/gpcs_pma_inst/RECEIVER/T  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/K29p7 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/T_328 )
  );
  LUT4 #(
    .INIT ( 16'hEA6A ))
  \U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd2-In1  (
    .I0(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd2_76 ),
    .I1(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd4_78 ),
    .I2(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd3_77 ),
    .I3(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd1_75 ),
    .O(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd2-In )
  );
  LUT4 #(
    .INIT ( 16'hEA6A ))
  \U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd2-In1  (
    .I0(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd2_69 ),
    .I1(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd4_71 ),
    .I2(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd3_70 ),
    .I3(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd1_68 ),
    .O(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd2-In )
  );
  LUT4 #(
    .INIT ( 16'hE666 ))
  \U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd3-In1  (
    .I0(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd3_70 ),
    .I1(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd4_71 ),
    .I2(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd1_68 ),
    .I3(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd2_69 ),
    .O(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd3-In )
  );
  LUT4 #(
    .INIT ( 16'hE666 ))
  \U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd3-In1  (
    .I0(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd3_77 ),
    .I1(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd4_78 ),
    .I2(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd1_75 ),
    .I3(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd2_76 ),
    .O(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd3-In )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \U0/gpcs_pma_inst/Mmux_TXCHARDISPVAL_INT_GND_15_o_MUX_194_o11  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/TXCHARDISPVAL_127 ),
    .O(\U0/gpcs_pma_inst/TXCHARDISPVAL_INT_GND_15_o_MUX_194_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/gpcs_pma_inst/Mmux_TXCHARDISPMODE_INT_TXEVEN_MUX_193_o11  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/TXCHARDISPMODE_128 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .O(\U0/gpcs_pma_inst/TXCHARDISPMODE_INT_TXEVEN_MUX_193_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/gpcs_pma_inst/Mmux_TXCHARISK_INT_TXEVEN_MUX_192_o11  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/TXCHARISK_129 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .O(\U0/gpcs_pma_inst/TXCHARISK_INT_TXEVEN_MUX_192_o )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \U0/gpcs_pma_inst/Mmux_TXDATA_INT[7]_GND_15_o_mux_30_OUT11  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [0]),
    .O(\U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<0> )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \U0/gpcs_pma_inst/Mmux_TXDATA_INT[7]_GND_15_o_mux_30_OUT21  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [1]),
    .O(\U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<1> )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/gpcs_pma_inst/Mmux_TXDATA_INT[7]_GND_15_o_mux_30_OUT31  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [2]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .O(\U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<2> )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/gpcs_pma_inst/Mmux_TXDATA_INT[7]_GND_15_o_mux_30_OUT41  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [3]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .O(\U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<3> )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/gpcs_pma_inst/Mmux_TXDATA_INT[7]_GND_15_o_mux_30_OUT51  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [4]),
    .O(\U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<4> )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/gpcs_pma_inst/Mmux_TXDATA_INT[7]_GND_15_o_mux_30_OUT61  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [5]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .O(\U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<5> )
  );
  LUT3 #(
    .INIT ( 8'h4E ))
  \U0/gpcs_pma_inst/Mmux_TXDATA_INT[7]_GND_15_o_mux_30_OUT71  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [6]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .O(\U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<6> )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/gpcs_pma_inst/Mmux_TXDATA_INT[7]_GND_15_o_mux_30_OUT81  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [7]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .O(\U0/gpcs_pma_inst/TXDATA_INT[7]_GND_15_o_mux_30_OUT<7> )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/gpcs_pma_inst/Mmux_RXDATA[7]_TXDATA_INT[7]_mux_20_OUT11  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(rxdata[0]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [0]),
    .O(\U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<0> )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/gpcs_pma_inst/Mmux_RXDATA[7]_TXDATA_INT[7]_mux_20_OUT21  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(rxdata[1]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [1]),
    .O(\U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<1> )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/gpcs_pma_inst/Mmux_RXDATA[7]_TXDATA_INT[7]_mux_20_OUT31  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(rxdata[2]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [2]),
    .O(\U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<2> )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/gpcs_pma_inst/Mmux_RXDATA[7]_TXDATA_INT[7]_mux_20_OUT41  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(rxdata[3]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [3]),
    .O(\U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<3> )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/gpcs_pma_inst/Mmux_RXDATA[7]_TXDATA_INT[7]_mux_20_OUT51  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(rxdata[4]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [4]),
    .O(\U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<4> )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/gpcs_pma_inst/Mmux_RXDATA[7]_TXDATA_INT[7]_mux_20_OUT61  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(rxdata[5]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [5]),
    .O(\U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<5> )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/gpcs_pma_inst/Mmux_RXDATA[7]_TXDATA_INT[7]_mux_20_OUT71  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(rxdata[6]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [6]),
    .O(\U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<6> )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/gpcs_pma_inst/Mmux_RXDATA[7]_TXDATA_INT[7]_mux_20_OUT81  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(rxdata[7]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/TXDATA [7]),
    .O(\U0/gpcs_pma_inst/RXDATA[7]_TXDATA_INT[7]_mux_20_OUT<7> )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/gpcs_pma_inst/Mmux_RXCHARISCOMMA[0]_TXCHARISK_INT_MUX_186_o11  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(rxchariscomma[0]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/TXCHARISK_129 ),
    .O(\U0/gpcs_pma_inst/RXCHARISCOMMA[0]_TXCHARISK_INT_MUX_186_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/gpcs_pma_inst/Mmux_RXCHARISK[0]_TXCHARISK_INT_MUX_185_o11  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(rxcharisk[0]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/TXCHARISK_129 ),
    .O(\U0/gpcs_pma_inst/RXCHARISK[0]_TXCHARISK_INT_MUX_185_o )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/gpcs_pma_inst/Mmux_SRESET_PIPE_PWR_15_o_MUX_1_o11  (
    .I0(\U0/gpcs_pma_inst/RESET_INT_124 ),
    .I1(\U0/gpcs_pma_inst/SRESET_PIPE_118 ),
    .O(\U0/gpcs_pma_inst/SRESET_PIPE_PWR_15_o_MUX_1_o )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \U0/gpcs_pma_inst/Mmux_RXNOTINTABLE[0]_GND_15_o_MUX_182_o11  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(rxnotintable[0]),
    .O(\U0/gpcs_pma_inst/RXNOTINTABLE[0]_GND_15_o_MUX_182_o )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \U0/gpcs_pma_inst/Mmux_RXDISPERR[0]_GND_15_o_MUX_183_o11  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(rxdisperr[0]),
    .O(\U0/gpcs_pma_inst/RXDISPERR[0]_GND_15_o_MUX_183_o )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \U0/gpcs_pma_inst/Mmux_RXCLKCORCNT[2]_GND_15_o_mux_22_OUT11  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(rxclkcorcnt[0]),
    .O(\U0/gpcs_pma_inst/RXCLKCORCNT[2]_GND_15_o_mux_22_OUT<0> )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \U0/gpcs_pma_inst/Mmux_RXCLKCORCNT[2]_GND_15_o_mux_22_OUT21  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(rxclkcorcnt[1]),
    .O(\U0/gpcs_pma_inst/RXCLKCORCNT[2]_GND_15_o_mux_22_OUT<1> )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \U0/gpcs_pma_inst/Mmux_RXCLKCORCNT[2]_GND_15_o_mux_22_OUT31  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(rxclkcorcnt[2]),
    .O(\U0/gpcs_pma_inst/RXCLKCORCNT[2]_GND_15_o_mux_22_OUT<2> )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \U0/gpcs_pma_inst/Mmux_RXBUFSTATUS[1]_GND_15_o_mux_21_OUT21  (
    .I0(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I1(rxbufstatus[1]),
    .O(\U0/gpcs_pma_inst/RXBUFSTATUS[1]_GND_15_o_mux_21_OUT<1> )
  );
  LUT4 #(
    .INIT ( 16'hFF80 ))
  \U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd1-In1  (
    .I0(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd4_71 ),
    .I1(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd3_70 ),
    .I2(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd2_69 ),
    .I3(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd1_68 ),
    .O(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd1-In )
  );
  LUT4 #(
    .INIT ( 16'hDFFF ))
  \U0/gpcs_pma_inst/RX_RST_SM_RX_RST_SM[3]_GND_15_o_Mux_17_o1  (
    .I0(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd3_70 ),
    .I1(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd4_71 ),
    .I2(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd1_68 ),
    .I3(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd2_69 ),
    .O(\U0/gpcs_pma_inst/RX_RST_SM[3]_GND_15_o_Mux_17_o )
  );
  LUT4 #(
    .INIT ( 16'hFF80 ))
  \U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd1-In1  (
    .I0(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd4_78 ),
    .I1(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd3_77 ),
    .I2(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd2_76 ),
    .I3(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd1_75 ),
    .O(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd1-In )
  );
  LUT4 #(
    .INIT ( 16'hDFFF ))
  \U0/gpcs_pma_inst/TX_RST_SM_TX_RST_SM[3]_GND_15_o_Mux_13_o1  (
    .I0(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd3_77 ),
    .I1(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd4_78 ),
    .I2(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd1_75 ),
    .I3(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd2_76 ),
    .O(\U0/gpcs_pma_inst/TX_RST_SM[3]_GND_15_o_Mux_13_o )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/gpcs_pma_inst/RESET_INT_RXBUFSTATUS_INT[1]_OR_116_o1  (
    .I0(\U0/gpcs_pma_inst/RESET_INT_124 ),
    .I1(\U0/gpcs_pma_inst/RXBUFSTATUS_INT [1]),
    .O(\U0/gpcs_pma_inst/RESET_INT_RXBUFSTATUS_INT[1]_OR_116_o )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/gpcs_pma_inst/RESET_INT_TXBUFERR_INT_OR_115_o1  (
    .I0(\U0/gpcs_pma_inst/RESET_INT_124 ),
    .I1(\U0/gpcs_pma_inst/TXBUFERR_INT_99 ),
    .O(\U0/gpcs_pma_inst/RESET_INT_TXBUFERR_INT_OR_115_o )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \U0/gpcs_pma_inst/DCM_LOCKED_SOFT_RESET_OR_2_o1  (
    .I0(reset),
    .I1(dcm_locked),
    .O(\U0/gpcs_pma_inst/DCM_LOCKED_SOFT_RESET_OR_2_o )
  );
  LUT4 #(
    .INIT ( 16'hCFCA ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT51  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1 [4]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/CONFIG_DATA [2]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/XMIT_CONFIG_INT_188 ),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT511 ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<4> )
  );
  LUT4 #(
    .INIT ( 16'hCFCA ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT61  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1 [5]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/CONFIG_DATA [2]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/XMIT_CONFIG_INT_188 ),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT511 ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<5> )
  );
  LUT4 #(
    .INIT ( 16'hCFCA ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT81  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1 [7]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/CONFIG_DATA [2]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/XMIT_CONFIG_INT_188 ),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT511 ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<7> )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFEFF ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT5111  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/R_186 ),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/V_185 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/T_195 ),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/TX_PACKET_187 ),
    .I4(\U0/gpcs_pma_inst/TRANSMITTER/S_197 ),
    .I5(\NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [3]),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT511 )
  );
  LUT5 #(
    .INIT ( 32'hE881811F ))
  \U0/gpcs_pma_inst/TRANSMITTER/DISP51  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [3]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [4]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [1]),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [2]),
    .I4(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [0]),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/DISP5 )
  );
  LUT3 #(
    .INIT ( 8'h15 ))
  \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT[1]_TX_CONFIG[15]_wide_mux_4_OUT<7>1  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [1]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/C1_OR_C2_190 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT[1]_TX_CONFIG[15]_wide_mux_4_OUT<7> )
  );
  LUT6 #(
    .INIT ( 64'hFFFF444044404440 ))
  \U0/gpcs_pma_inst/TRANSMITTER/TX_EN_TRIGGER_T_OR_14_o1  (
    .I0(gmii_tx_en),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/TX_EN_REG1_211 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/S_197 ),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/TX_PACKET_187 ),
    .I4(\U0/gpcs_pma_inst/TRANSMITTER/TRIGGER_T_194 ),
    .I5(\U0/gpcs_pma_inst/TRANSMITTER/V_185 ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/TX_EN_TRIGGER_T_OR_14_o )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF45455545 ))
  \U0/gpcs_pma_inst/TRANSMITTER/TX_EN_TRIGGER_S_OR_12_o11  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/TRIGGER_S_196 ),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/TX_EN_REG1_211 ),
    .I2(gmii_tx_en),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .I4(\U0/gpcs_pma_inst/TRANSMITTER/TX_ER_REG1_210 ),
    .I5(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/TX_EN_TRIGGER_S_OR_12_o_0 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mcount_CODE_GRP_CNT_xor<1>11  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [1]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/Result [1])
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mram_CODE_GRP_CNT[1]_GND_22_o_Mux_5_o1  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [1]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/Mram_CODE_GRP_CNT[1]_GND_22_o_Mux_5_o )
  );
  LUT4 #(
    .INIT ( 16'h0040 ))
  \U0/gpcs_pma_inst/TRANSMITTER/TX_EN_EVEN_AND_8_o1  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/TX_ER_REG1_210 ),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .I2(gmii_tx_en),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/TX_EN_REG1_211 ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/TX_EN_EVEN_AND_8_o )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \U0/gpcs_pma_inst/TRANSMITTER/SYNC_DISPARITY_EVEN_AND_42_o1  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/SYNC_DISPARITY_193 ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/SYNC_DISPARITY_EVEN_AND_42_o )
  );
  LUT6 #(
    .INIT ( 64'h0000577757770000 ))
  \U0/gpcs_pma_inst/SYNCHRONISATION/Mmux_GOOD_CGS[1]_GND_24_o_mux_30_OUT21  (
    .I0(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4_224 ),
    .I1(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd1_221 ),
    .I2(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd2_222 ),
    .I3(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd3_223 ),
    .I4(\U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS [0]),
    .I5(\U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS [1]),
    .O(\U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS[1]_GND_24_o_mux_30_OUT<1> )
  );
  LUT5 #(
    .INIT ( 32'hA888FFFF ))
  \U0/gpcs_pma_inst/SYNCHRONISATION/_n0103_inv1  (
    .I0(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4_224 ),
    .I1(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd1_221 ),
    .I2(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd3_223 ),
    .I3(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd2_222 ),
    .I4(\U0/gpcs_pma_inst/SYNCHRONISATION/CGBAD ),
    .O(\U0/gpcs_pma_inst/SYNCHRONISATION/_n0103_inv )
  );
  LUT5 #(
    .INIT ( 32'h01115555 ))
  \U0/gpcs_pma_inst/SYNCHRONISATION/Mmux_GOOD_CGS[1]_GND_24_o_mux_30_OUT11  (
    .I0(\U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS [0]),
    .I1(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd1_221 ),
    .I2(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd3_223 ),
    .I3(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd2_222 ),
    .I4(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4_224 ),
    .O(\U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS[1]_GND_24_o_mux_30_OUT<0> )
  );
  LUT6 #(
    .INIT ( 64'hD8B0D8B0E8E0F8F0 ))
  \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd1-In21  (
    .I0(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4_224 ),
    .I1(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd2_222 ),
    .I2(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd1_221 ),
    .I3(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd3_223 ),
    .I4(\U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS[1]_PWR_20_o_equal_19_o ),
    .I5(\U0/gpcs_pma_inst/SYNCHRONISATION/CGBAD ),
    .O(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd1-In2 )
  );
  LUT3 #(
    .INIT ( 8'hF1 ))
  \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4-In1_01  (
    .I0(\U0/gpcs_pma_inst/SYNCHRONISATION/SIGNAL_DETECT_REG_236 ),
    .I1(\U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [1]),
    .I2(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .O(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4-In1_0 )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS[1]_PWR_20_o_equal_19_o<1>1  (
    .I0(\U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS [0]),
    .I1(\U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS [1]),
    .O(\U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS[1]_PWR_20_o_equal_19_o )
  );
  LUT5 #(
    .INIT ( 32'hFFFEFEFE ))
  \U0/gpcs_pma_inst/SYNCHRONISATION/CGBAD1  (
    .I0(\U0/gpcs_pma_inst/RXBUFSTATUS_INT [1]),
    .I1(\U0/gpcs_pma_inst/RXNOTINTABLE_INT_104 ),
    .I2(\U0/gpcs_pma_inst/RXDISPERR_INT_105 ),
    .I3(\U0/gpcs_pma_inst/RXCHARISCOMMA_INT_115 ),
    .I4(\U0/gpcs_pma_inst/SYNCHRONISATION/EVEN_120 ),
    .O(\U0/gpcs_pma_inst/SYNCHRONISATION/CGBAD )
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  \U0/gpcs_pma_inst/RECEIVER/Mmux_RXDATA_REG5[7]_GND_25_o_mux_9_OUT21  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/SOP_REG3_312 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/EXTEND_REG1_311 ),
    .I2(\U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_REG3_296 ),
    .I3(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5 [1]),
    .O(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<1> )
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  \U0/gpcs_pma_inst/RECEIVER/Mmux_RXDATA_REG5[7]_GND_25_o_mux_9_OUT41  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/SOP_REG3_312 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/EXTEND_REG1_311 ),
    .I2(\U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_REG3_296 ),
    .I3(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5 [3]),
    .O(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<3> )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \U0/gpcs_pma_inst/RECEIVER/Mmux_RXDATA_REG5[7]_GND_25_o_mux_9_OUT31  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5 [2]),
    .I1(\U0/gpcs_pma_inst/RECEIVER/EXTEND_REG1_311 ),
    .I2(\U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_REG3_296 ),
    .I3(\U0/gpcs_pma_inst/RECEIVER/SOP_REG3_312 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<2> )
  );
  LUT4 #(
    .INIT ( 16'h0002 ))
  \U0/gpcs_pma_inst/RECEIVER/Mmux_RXDATA_REG5[7]_GND_25_o_mux_9_OUT61  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5 [5]),
    .I1(\U0/gpcs_pma_inst/RECEIVER/EXTEND_REG1_311 ),
    .I2(\U0/gpcs_pma_inst/RECEIVER/SOP_REG3_312 ),
    .I3(\U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_REG3_296 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<5> )
  );
  LUT4 #(
    .INIT ( 16'h0002 ))
  \U0/gpcs_pma_inst/RECEIVER/Mmux_RXDATA_REG5[7]_GND_25_o_mux_9_OUT81  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5 [7]),
    .I1(\U0/gpcs_pma_inst/RECEIVER/EXTEND_REG1_311 ),
    .I2(\U0/gpcs_pma_inst/RECEIVER/SOP_REG3_312 ),
    .I3(\U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_REG3_296 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<7> )
  );
  LUT4 #(
    .INIT ( 16'h0800 ))
  \U0/gpcs_pma_inst/RECEIVER/K29p71  (
    .I0(\U0/gpcs_pma_inst/RXDATA_INT [2]),
    .I1(\U0/gpcs_pma_inst/RXDATA_INT [3]),
    .I2(\U0/gpcs_pma_inst/RXDATA_INT [1]),
    .I3(\U0/gpcs_pma_inst/RECEIVER/K27p7_RXFIFO_ERR_AND_111_o1_237 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/K29p7 )
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  \U0/gpcs_pma_inst/RECEIVER/K27p7_RXFIFO_ERR_AND_111_o11  (
    .I0(\U0/gpcs_pma_inst/RXDATA_INT [5]),
    .I1(\U0/gpcs_pma_inst/RXDATA_INT [0]),
    .I2(\U0/gpcs_pma_inst/RXDATA_INT [6]),
    .I3(\U0/gpcs_pma_inst/RXDATA_INT [7]),
    .I4(\U0/gpcs_pma_inst/RXDATA_INT [4]),
    .I5(\U0/gpcs_pma_inst/RXCHARISK_INT_114 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/K27p7_RXFIFO_ERR_AND_111_o1_237 )
  );
  LUT4 #(
    .INIT ( 16'hFF54 ))
  \U0/gpcs_pma_inst/RECEIVER/Mmux_RXDATA_REG5[7]_GND_25_o_mux_9_OUT11  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_REG3_296 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/EXTEND_REG1_311 ),
    .I2(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5 [0]),
    .I3(\U0/gpcs_pma_inst/RECEIVER/SOP_REG3_312 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<0> )
  );
  LUT5 #(
    .INIT ( 32'hFFFF4540 ))
  \U0/gpcs_pma_inst/RECEIVER/Mmux_RXDATA_REG5[7]_GND_25_o_mux_9_OUT51  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_REG3_296 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/EXTEND_ERR_286 ),
    .I2(\U0/gpcs_pma_inst/RECEIVER/EXTEND_REG1_311 ),
    .I3(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5 [4]),
    .I4(\U0/gpcs_pma_inst/RECEIVER/SOP_REG3_312 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<4> )
  );
  LUT5 #(
    .INIT ( 32'h08080800 ))
  \U0/gpcs_pma_inst/RECEIVER/S_WAIT_FOR_K_AND_144_o1  (
    .I0(\U0/gpcs_pma_inst/SYNCHRONISATION/SYNC_STATUS_119 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/S_329 ),
    .I2(\U0/gpcs_pma_inst/RECEIVER/WAIT_FOR_K_272 ),
    .I3(\U0/gpcs_pma_inst/RECEIVER/EXTEND_269 ),
    .I4(\U0/gpcs_pma_inst/RECEIVER/I_REG_320 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/S_WAIT_FOR_K_AND_144_o )
  );
  LUT4 #(
    .INIT ( 16'h2000 ))
  \U0/gpcs_pma_inst/RECEIVER/K23p71  (
    .I0(\U0/gpcs_pma_inst/RXDATA_INT [2]),
    .I1(\U0/gpcs_pma_inst/RXDATA_INT [3]),
    .I2(\U0/gpcs_pma_inst/RXDATA_INT [1]),
    .I3(\U0/gpcs_pma_inst/RECEIVER/K27p7_RXFIFO_ERR_AND_111_o1_237 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/K23p7 )
  );
  LUT5 #(
    .INIT ( 32'h00200000 ))
  \U0/gpcs_pma_inst/RECEIVER/K27p7_RXFIFO_ERR_AND_111_o1  (
    .I0(\U0/gpcs_pma_inst/RXDATA_INT [1]),
    .I1(\U0/gpcs_pma_inst/RXDATA_INT [2]),
    .I2(\U0/gpcs_pma_inst/RXDATA_INT [3]),
    .I3(\U0/gpcs_pma_inst/RECEIVER/RXFIFO_ERR_RXDISPERR_OR_36_o ),
    .I4(\U0/gpcs_pma_inst/RECEIVER/K27p7_RXFIFO_ERR_AND_111_o1_237 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/K27p7_RXFIFO_ERR_AND_111_o )
  );
  LUT4 #(
    .INIT ( 16'hFF10 ))
  \U0/gpcs_pma_inst/RECEIVER/Mmux_RXDATA_REG5[7]_GND_25_o_mux_9_OUT71  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_REG3_296 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/EXTEND_REG1_311 ),
    .I2(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5 [6]),
    .I3(\U0/gpcs_pma_inst/RECEIVER/SOP_REG3_312 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5[7]_GND_25_o_mux_9_OUT<6> )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/gpcs_pma_inst/RECEIVER/IDLE_REG[1]_IDLE_REG[2]_OR_114_o1  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/IDLE_REG [1]),
    .I1(\U0/gpcs_pma_inst/RECEIVER/IDLE_REG [2]),
    .O(\U0/gpcs_pma_inst/RECEIVER/IDLE_REG[1]_IDLE_REG[2]_OR_114_o )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_REG[0]_RX_CONFIG_VALID_REG[3]_OR_113_o<0>1  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_REG [0]),
    .I1(\U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_REG [1]),
    .I2(\U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_REG [2]),
    .I3(\U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_REG [3]),
    .O(\U0/gpcs_pma_inst/RECEIVER/RX_CONFIG_VALID_REG[0]_RX_CONFIG_VALID_REG[3]_OR_113_o )
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  \U0/gpcs_pma_inst/RECEIVER/EXTEND_REG3_EXT_ILLEGAL_K_REG2_OR_83_o1  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/EXT_ILLEGAL_K_REG2_283 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/EXTEND_REG3_310 ),
    .I2(\U0/gpcs_pma_inst/RECEIVER/CGBAD_REG3_299 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/EXTEND_REG3_EXT_ILLEGAL_K_REG2_OR_83_o )
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  \U0/gpcs_pma_inst/RECEIVER/EOP_EXTEND_OR_65_o1  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/EOP_292 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/EXTEND_269 ),
    .I2(\U0/gpcs_pma_inst/RECEIVER/EXTEND_REG1_311 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/EOP_EXTEND_OR_65_o )
  );
  LUT4 #(
    .INIT ( 16'h0002 ))
  \U0/gpcs_pma_inst/RECEIVER/RXCHARISK_REG1_K28p5_REG1_AND_167_o1  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/RXCHARISK_REG1_317 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/K28p5_REG1_325 ),
    .I2(\U0/gpcs_pma_inst/RECEIVER/R_301 ),
    .I3(\U0/gpcs_pma_inst/RECEIVER/T_328 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/RXCHARISK_REG1_K28p5_REG1_AND_167_o )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/gpcs_pma_inst/RECEIVER/K28p5_REG1_EVEN_AND_127_o1  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/K28p5_REG1_325 ),
    .I1(\U0/gpcs_pma_inst/SYNCHRONISATION/EVEN_120 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/K28p5_REG1_EVEN_AND_127_o )
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \U0/gpcs_pma_inst/RECEIVER/RXFIFO_ERR_RXDISPERR_OR_36_o1  (
    .I0(\U0/gpcs_pma_inst/RXBUFSTATUS_INT [1]),
    .I1(\U0/gpcs_pma_inst/RXNOTINTABLE_INT_104 ),
    .I2(\U0/gpcs_pma_inst/RXDISPERR_INT_105 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/RXFIFO_ERR_RXDISPERR_OR_36_o )
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \U0/gpcs_pma_inst/RECEIVER/RESET_SYNC_STATUS_OR_51_o1  (
    .I0(\U0/gpcs_pma_inst/SYNCHRONISATION/SYNC_STATUS_119 ),
    .I1(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .O(\U0/gpcs_pma_inst/RECEIVER/RESET_SYNC_STATUS_OR_51_o )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT3_SW0  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/V_185 ),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1 [2]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/T_195 ),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/R_186 ),
    .O(N2)
  );
  LUT6 #(
    .INIT ( 64'hFFFFBBAB55551101 ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT3  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/XMIT_CONFIG_INT_188 ),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/S_197 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/TX_PACKET_187 ),
    .I3(N2),
    .I4(\NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [3]),
    .I5(\U0/gpcs_pma_inst/TRANSMITTER/CONFIG_DATA [2]),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<2> )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT4_SW0  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/V_185 ),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/T_195 ),
    .I2(\NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [3]),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/S_197 ),
    .O(N6)
  );
  LUT6 #(
    .INIT ( 64'hFFFFBBAB55551101 ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT4  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/XMIT_CONFIG_INT_188 ),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/R_186 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/TX_PACKET_187 ),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1 [3]),
    .I4(N6),
    .I5(\U0/gpcs_pma_inst/TRANSMITTER/CONFIG_DATA [3]),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<3> )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT7_SW0  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/V_185 ),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/T_195 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/R_186 ),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/S_197 ),
    .O(N8)
  );
  LUT6 #(
    .INIT ( 64'hDDDDDCCC11111000 ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT7  (
    .I0(\NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [3]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/XMIT_CONFIG_INT_188 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/TX_PACKET_187 ),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1 [6]),
    .I4(N8),
    .I5(\U0/gpcs_pma_inst/TRANSMITTER/CONFIG_DATA [1]),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<6> )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFDFFFFFFFF ))
  \U0/gpcs_pma_inst/TRANSMITTER/TX_EN_REG1_XMIT_DATA_INT_AND_20_o1  (
    .I0(gmii_txd[3]),
    .I1(gmii_txd[7]),
    .I2(gmii_txd[4]),
    .I3(gmii_txd[5]),
    .I4(gmii_txd[6]),
    .I5(gmii_txd[2]),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/TX_EN_REG1_XMIT_DATA_INT_AND_20_o1_333 )
  );
  LUT6 #(
    .INIT ( 64'hA8AAAAAA20222222 ))
  \U0/gpcs_pma_inst/TRANSMITTER/TX_EN_REG1_XMIT_DATA_INT_AND_20_o2  (
    .I0(gmii_tx_er),
    .I1(gmii_tx_en),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/TX_EN_REG1_XMIT_DATA_INT_AND_20_o1_333 ),
    .I3(gmii_txd[0]),
    .I4(gmii_txd[1]),
    .I5(\U0/gpcs_pma_inst/TRANSMITTER/TX_PACKET_187 ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/TX_EN_REG1_XMIT_DATA_INT_AND_20_o2_334 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFF5540 ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT21  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/T_195 ),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1 [1]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/TX_PACKET_187 ),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/R_186 ),
    .I4(\U0/gpcs_pma_inst/TRANSMITTER/S_197 ),
    .I5(\U0/gpcs_pma_inst/TRANSMITTER/V_185 ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT2 )
  );
  LUT4 #(
    .INIT ( 16'h8B88 ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT22  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/CONFIG_DATA [1]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/XMIT_CONFIG_INT_188 ),
    .I2(\NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [3]),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT2 ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<1> )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF55555540 ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT11  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/V_185 ),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/TXD_REG1 [0]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/TX_PACKET_187 ),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/T_195 ),
    .I4(\U0/gpcs_pma_inst/TRANSMITTER/R_186 ),
    .I5(\U0/gpcs_pma_inst/TRANSMITTER/S_197 ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT1 )
  );
  LUT4 #(
    .INIT ( 16'h8B88 ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT12  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/CONFIG_DATA [0]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/XMIT_CONFIG_INT_188 ),
    .I2(\NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [3]),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/Mmux_PWR_18_o_CONFIG_DATA[7]_mux_21_OUT1 ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/PWR_18_o_CONFIG_DATA[7]_mux_21_OUT<0> )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/gpcs_pma_inst/RECEIVER/EXTEND_REG1_ISOLATE_AND_182_o_SW0  (
    .I0(\NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [3]),
    .I1(\NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [2]),
    .O(N14)
  );
  LUT6 #(
    .INIT ( 64'h5555555144444440 ))
  \U0/gpcs_pma_inst/RECEIVER/EXTEND_REG1_ISOLATE_AND_182_o  (
    .I0(N14),
    .I1(\U0/gpcs_pma_inst/SYNCHRONISATION/SYNC_STATUS_119 ),
    .I2(\U0/gpcs_pma_inst/RECEIVER/RX_DATA_ERROR_290 ),
    .I3(\U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_REG3_296 ),
    .I4(\U0/gpcs_pma_inst/RECEIVER/EXTEND_REG1_311 ),
    .I5(\U0/gpcs_pma_inst/RECEIVER/RECEIVE_270 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/EXTEND_REG1_ISOLATE_AND_182_o_258 )
  );
  LUT4 #(
    .INIT ( 16'hAAA8 ))
  \U0/gpcs_pma_inst/RECEIVER/EVEN_RXCHARISK_AND_115_o_SW0  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/I_REG_320 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_280 ),
    .I2(\U0/gpcs_pma_inst/RECEIVER/FALSE_K_281 ),
    .I3(\U0/gpcs_pma_inst/RECEIVER/FALSE_DATA_282 ),
    .O(N18)
  );
  LUT6 #(
    .INIT ( 64'h00000000A0A88088 ))
  \U0/gpcs_pma_inst/RECEIVER/EVEN_RXCHARISK_AND_115_o  (
    .I0(\U0/gpcs_pma_inst/SYNCHRONISATION/EVEN_120 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/K28p5_REG1_325 ),
    .I2(\U0/gpcs_pma_inst/SYNCHRONISATION/SYNC_STATUS_119 ),
    .I3(\U0/gpcs_pma_inst/RXCHARISK_INT_114 ),
    .I4(N18),
    .I5(\U0/gpcs_pma_inst/RECEIVER/K28p5_REG1_D21p5_AND_116_o_norst ),
    .O(\U0/gpcs_pma_inst/RECEIVER/EVEN_RXCHARISK_AND_115_o_260 )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \U0/gpcs_pma_inst/RECEIVER/K28p51_SW0  (
    .I0(\U0/gpcs_pma_inst/RXDATA_INT [0]),
    .I1(\U0/gpcs_pma_inst/RXCHARISK_INT_114 ),
    .O(N20)
  );
  LUT6 #(
    .INIT ( 64'h4000000000000000 ))
  \U0/gpcs_pma_inst/RECEIVER/D21p5_D2p2_OR_38_o1  (
    .I0(\U0/gpcs_pma_inst/RXDATA_INT [6]),
    .I1(\U0/gpcs_pma_inst/RXDATA_INT [7]),
    .I2(\U0/gpcs_pma_inst/RXDATA_INT [0]),
    .I3(\U0/gpcs_pma_inst/RXDATA_INT [2]),
    .I4(\U0/gpcs_pma_inst/RXDATA_INT [4]),
    .I5(\U0/gpcs_pma_inst/RXDATA_INT [5]),
    .O(\U0/gpcs_pma_inst/RECEIVER/D21p5_D2p2_OR_38_o )
  );
  LUT6 #(
    .INIT ( 64'h0000000400000000 ))
  \U0/gpcs_pma_inst/RECEIVER/D21p5_D2p2_OR_38_o2  (
    .I0(\U0/gpcs_pma_inst/RXDATA_INT [5]),
    .I1(\U0/gpcs_pma_inst/RXDATA_INT [6]),
    .I2(\U0/gpcs_pma_inst/RXDATA_INT [4]),
    .I3(\U0/gpcs_pma_inst/RXDATA_INT [7]),
    .I4(\U0/gpcs_pma_inst/RXDATA_INT [2]),
    .I5(\U0/gpcs_pma_inst/RXDATA_INT [1]),
    .O(\U0/gpcs_pma_inst/RECEIVER/D21p5_D2p2_OR_38_o1_341 )
  );
  LUT6 #(
    .INIT ( 64'h0013001100030000 ))
  \U0/gpcs_pma_inst/RECEIVER/D21p5_D2p2_OR_38_o3  (
    .I0(\U0/gpcs_pma_inst/RXDATA_INT [0]),
    .I1(\U0/gpcs_pma_inst/RXDATA_INT [3]),
    .I2(\U0/gpcs_pma_inst/RXDATA_INT [1]),
    .I3(\U0/gpcs_pma_inst/RXCHARISK_INT_114 ),
    .I4(\U0/gpcs_pma_inst/RECEIVER/D21p5_D2p2_OR_38_o ),
    .I5(\U0/gpcs_pma_inst/RECEIVER/D21p5_D2p2_OR_38_o1_341 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/K28p5_REG1_D21p5_AND_116_o_norst )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \U0/gpcs_pma_inst/RECEIVER/D0p0_SW0  (
    .I0(\U0/gpcs_pma_inst/RXDATA_INT [5]),
    .I1(\U0/gpcs_pma_inst/RXDATA_INT [4]),
    .I2(\U0/gpcs_pma_inst/RXCHARISK_INT_114 ),
    .I3(\U0/gpcs_pma_inst/RXDATA_INT [0]),
    .O(N22)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \U0/gpcs_pma_inst/RECEIVER/D0p0  (
    .I0(\U0/gpcs_pma_inst/RXDATA_INT [7]),
    .I1(\U0/gpcs_pma_inst/RXDATA_INT [3]),
    .I2(\U0/gpcs_pma_inst/RXDATA_INT [2]),
    .I3(\U0/gpcs_pma_inst/RXDATA_INT [1]),
    .I4(\U0/gpcs_pma_inst/RXDATA_INT [6]),
    .I5(N22),
    .O(\U0/gpcs_pma_inst/RECEIVER/D0p0_244 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/gpcs_pma_inst/RECEIVER/C_REG1_C_REG3_OR_59_o_SW0  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/C_REG1_319 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/C_REG2_238 ),
    .O(N24)
  );
  LUT6 #(
    .INIT ( 64'hFFFF8AAACEEE8AAA ))
  \U0/gpcs_pma_inst/RECEIVER/C_REG1_C_REG3_OR_59_o  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/C_REG3_318 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/CGBAD_300 ),
    .I2(\U0/gpcs_pma_inst/SYNCHRONISATION/EVEN_120 ),
    .I3(\U0/gpcs_pma_inst/RECEIVER/K28p5_REG1_325 ),
    .I4(N24),
    .I5(\U0/gpcs_pma_inst/RECEIVER/RXCHARISK_REG1_317 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/C_REG1_C_REG3_OR_59_o_242 )
  );
  LUT6 #(
    .INIT ( 64'hE8FFFFFFFFFFFFFF ))
  \U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o11  (
    .I0(\U0/gpcs_pma_inst/RXDATA_INT [7]),
    .I1(\U0/gpcs_pma_inst/RXDISPERR_INT_105 ),
    .I2(\U0/gpcs_pma_inst/RXDATA_INT [1]),
    .I3(\U0/gpcs_pma_inst/RXDATA_INT [6]),
    .I4(\U0/gpcs_pma_inst/RXDATA_INT [4]),
    .I5(\U0/gpcs_pma_inst/RXDATA_INT [3]),
    .O(\U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o1 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o13  (
    .I0(\U0/gpcs_pma_inst/RXDATA_INT [4]),
    .I1(\U0/gpcs_pma_inst/RXDATA_INT [6]),
    .I2(\U0/gpcs_pma_inst/RXCHARISK_INT_114 ),
    .I3(\U0/gpcs_pma_inst/RXDATA_INT [2]),
    .I4(\U0/gpcs_pma_inst/RXDATA_INT [3]),
    .O(\U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o13_346 )
  );
  LUT4 #(
    .INIT ( 16'hFF17 ))
  \U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o14  (
    .I0(\U0/gpcs_pma_inst/RXDATA_INT [7]),
    .I1(\U0/gpcs_pma_inst/RXDISPERR_INT_105 ),
    .I2(\U0/gpcs_pma_inst/RXDATA_INT [1]),
    .I3(\U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o13_346 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o14_347 )
  );
  LUT5 #(
    .INIT ( 32'h88888000 ))
  \U0/gpcs_pma_inst/RECEIVER/I_REG_T_REG2_OR_64_o1  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/T_REG2_322 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/R_REG1_321 ),
    .I2(\U0/gpcs_pma_inst/SYNCHRONISATION/EVEN_120 ),
    .I3(\U0/gpcs_pma_inst/RECEIVER/K28p5_REG1_325 ),
    .I4(\U0/gpcs_pma_inst/RECEIVER/R_301 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/I_REG_T_REG2_OR_64_o1_348 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFF80FF80FF80 ))
  \U0/gpcs_pma_inst/RECEIVER/I_REG_T_REG2_OR_64_o2  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/C_REG1_319 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/D0p0_REG_324 ),
    .I2(\U0/gpcs_pma_inst/SYNCHRONISATION/EVEN_120 ),
    .I3(\U0/gpcs_pma_inst/RECEIVER/I_REG_T_REG2_OR_64_o1_348 ),
    .I4(\U0/gpcs_pma_inst/RECEIVER/I_REG_320 ),
    .I5(\U0/gpcs_pma_inst/RECEIVER/K28p5_REG1_325 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/I_REG_T_REG2_OR_64_o )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \U0/gpcs_pma_inst/RECEIVER/T_REG2_R_REG1_OR_79_o1  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/I_REG_320 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/ILLEGAL_K_REG2_287 ),
    .I2(\U0/gpcs_pma_inst/RECEIVER/C_REG1_319 ),
    .I3(\U0/gpcs_pma_inst/RECEIVER/CGBAD_REG3_299 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/T_REG2_R_REG1_OR_79_o1_349 )
  );
  LUT5 #(
    .INIT ( 32'h54545554 ))
  \U0/gpcs_pma_inst/RECEIVER/T_REG2_R_REG1_OR_79_o2  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/R_REG1_321 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/T_REG2_322 ),
    .I2(\U0/gpcs_pma_inst/RECEIVER/K28p5_REG1_325 ),
    .I3(\U0/gpcs_pma_inst/RECEIVER/R_301 ),
    .I4(\U0/gpcs_pma_inst/RECEIVER/T_REG1_323 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/T_REG2_R_REG1_OR_79_o2_350 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/gpcs_pma_inst/RECEIVER/SYNC_STATUS_C_REG1_AND_125_o_SW0  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/RXCHARISK_REG1_317 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/CGBAD_300 ),
    .O(N26)
  );
  LUT6 #(
    .INIT ( 64'h0010001000100000 ))
  \U0/gpcs_pma_inst/RECEIVER/SYNC_STATUS_C_REG1_AND_125_o  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/RXFIFO_ERR_RXDISPERR_OR_36_o ),
    .I1(\U0/gpcs_pma_inst/RXCHARISK_INT_114 ),
    .I2(\U0/gpcs_pma_inst/SYNCHRONISATION/SYNC_STATUS_119 ),
    .I3(N26),
    .I4(\U0/gpcs_pma_inst/RECEIVER/C_REG1_319 ),
    .I5(\U0/gpcs_pma_inst/RECEIVER/C_HDR_REMOVED_REG_315 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/SYNC_STATUS_C_REG1_AND_125_o_259 )
  );
  FDR   \U0/gpcs_pma_inst/TRANSMITTER/V  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/V_glue_set_352 ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/V_185 )
  );
  FDR   \U0/gpcs_pma_inst/TRANSMITTER/TX_PACKET  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/TX_PACKET_glue_set_353 ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TX_PACKET_187 )
  );
  FDR   \U0/gpcs_pma_inst/TRANSMITTER/R  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/R_glue_set_354 ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/R_186 )
  );
  FDS   \U0/gpcs_pma_inst/TRANSMITTER/DISPARITY  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/DISPARITY_glue_rst_355 ),
    .S(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/DISPARITY_184 )
  );
  FDR   \U0/gpcs_pma_inst/SYNCHRONISATION/EVEN  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/SYNCHRONISATION/EVEN_glue_set_356 ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/SYNCHRONISATION/EVEN_120 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/RECEIVE  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/RECEIVE_glue_set_357 ),
    .R(\U0/gpcs_pma_inst/RECEIVER/RESET_SYNC_STATUS_OR_51_o ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RECEIVE_270 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/RX_INVALID  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/RX_INVALID_glue_set_358 ),
    .R(\U0/gpcs_pma_inst/RECEIVER/RESET_SYNC_STATUS_OR_51_o ),
    .Q(\NlwRenamedSig_OI_U0/gpcs_pma_inst/RECEIVER/RX_INVALID )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/gpcs_pma_inst/RECEIVER/RX_DV  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/RX_DV_glue_set_359 ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .Q(\NlwRenamedSig_OI_U0/gpcs_pma_inst/RECEIVER/RX_DV )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/EXTEND  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/EXTEND_glue_set_360 ),
    .R(\U0/gpcs_pma_inst/RECEIVER/RESET_SYNC_STATUS_OR_51_o ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/EXTEND_269 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_glue_set_361 ),
    .R(\U0/gpcs_pma_inst/RECEIVER/RESET_SYNC_STATUS_OR_51_o ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_271 )
  );
  FDR   \U0/gpcs_pma_inst/RECEIVER/WAIT_FOR_K  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/WAIT_FOR_K_glue_set_362 ),
    .R(\U0/gpcs_pma_inst/RECEIVER/RESET_SYNC_STATUS_OR_51_o ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/WAIT_FOR_K_272 )
  );
  FDR   \U0/gpcs_pma_inst/TRANSMITTER/C1_OR_C2  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/C1_OR_C2_rstpot_363 ),
    .R(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/C1_OR_C2_190 )
  );
  FD   \U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd4  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd4_rstpot_364 ),
    .Q(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd4_71 )
  );
  FD   \U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd4  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd4_rstpot_365 ),
    .Q(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd4_78 )
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRPISK  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRPISK_rstpot_366 ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRPISK_192 )
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/TXCHARDISPVAL  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/TXCHARDISPVAL_rstpot_367 ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TXCHARDISPVAL_127 )
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/TRIGGER_T  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/TRIGGER_T_rstpot_368 ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/TRIGGER_T_194 )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \U0/gpcs_pma_inst/TRANSMITTER/S_rstpot  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/TX_EN_TRIGGER_S_OR_12_o_0 ),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/XMIT_DATA_INT_189 ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/S_rstpot_369 )
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/S  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/S_rstpot_369 ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/S_197 )
  );
  FD   \U0/gpcs_pma_inst/TRANSMITTER/CONFIG_DATA_0  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/TRANSMITTER/CONFIG_DATA_0_rstpot_370 ),
    .Q(\U0/gpcs_pma_inst/TRANSMITTER/CONFIG_DATA [0])
  );
  FD   \U0/gpcs_pma_inst/RECEIVER/C_HDR_REMOVED_REG  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/C_HDR_REMOVED_REG_rstpot_371 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/C_HDR_REMOVED_REG_315 )
  );
  FD   \U0/gpcs_pma_inst/RECEIVER/C  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/C_rstpot_372 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/C_326 )
  );
  FD   \U0/gpcs_pma_inst/RECEIVER/EXT_ILLEGAL_K  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/EXT_ILLEGAL_K_rstpot_373 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/EXT_ILLEGAL_K_285 )
  );
  FD   \U0/gpcs_pma_inst/RECEIVER/RX_DATA_ERROR  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/RX_DATA_ERROR_rstpot_374 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RX_DATA_ERROR_290 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFA9999995 ))
  \U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o12  (
    .I0(\U0/gpcs_pma_inst/RXDATA_INT [0]),
    .I1(\U0/gpcs_pma_inst/RXDATA_INT [5]),
    .I2(\U0/gpcs_pma_inst/RXDISPERR_INT_105 ),
    .I3(\U0/gpcs_pma_inst/RXDATA_INT [7]),
    .I4(\U0/gpcs_pma_inst/RXDATA_INT [1]),
    .I5(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .O(\U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o12_345 )
  );
  FD   \U0/gpcs_pma_inst/RECEIVER/FALSE_NIT  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_rstpot_375 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_280 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o15_SW0  (
    .I0(\U0/gpcs_pma_inst/RXDATA_INT [2]),
    .I1(\U0/gpcs_pma_inst/RXCHARISK_INT_114 ),
    .O(N28)
  );
  LUT6 #(
    .INIT ( 64'h0400000004440044 ))
  \U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_rstpot  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o12_345 ),
    .I1(\U0/gpcs_pma_inst/RXNOTINTABLE_INT_104 ),
    .I2(\U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o1 ),
    .I3(\U0/gpcs_pma_inst/RXDATA_INT [5]),
    .I4(N28),
    .I5(\U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o14_347 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_rstpot_375 )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \U0/gpcs_pma_inst/RECEIVER/RX_DATA_ERROR_rstpot_SW0  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/R_301 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/T_REG2_322 ),
    .O(N34)
  );
  LUT6 #(
    .INIT ( 64'h00000000AAAAAA02 ))
  \U0/gpcs_pma_inst/RECEIVER/RX_DATA_ERROR_rstpot  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/RECEIVE_270 ),
    .I1(N34),
    .I2(\U0/gpcs_pma_inst/RECEIVER/K28p5_REG1_EVEN_AND_127_o ),
    .I3(\U0/gpcs_pma_inst/RECEIVER/T_REG2_R_REG1_OR_79_o1_349 ),
    .I4(\U0/gpcs_pma_inst/RECEIVER/T_REG2_R_REG1_OR_79_o2_350 ),
    .I5(\U0/gpcs_pma_inst/RECEIVER/RESET_SYNC_STATUS_OR_51_o ),
    .O(\U0/gpcs_pma_inst/RECEIVER/RX_DATA_ERROR_rstpot_374 )
  );
  LUT5 #(
    .INIT ( 32'hE8FFFFFF ))
  \U0/gpcs_pma_inst/RECEIVER/FALSE_DATA_POS_RXNOTINTABLE_AND_203_o4_SW0  (
    .I0(\U0/gpcs_pma_inst/RXDATA_INT [4]),
    .I1(\U0/gpcs_pma_inst/RXDATA_INT [3]),
    .I2(\U0/gpcs_pma_inst/RXDATA_INT [2]),
    .I3(\U0/gpcs_pma_inst/RXDATA_INT [1]),
    .I4(\U0/gpcs_pma_inst/RXDATA_INT [0]),
    .O(N38)
  );
  LUT5 #(
    .INIT ( 32'hFCBDFFFF ))
  \U0/gpcs_pma_inst/RECEIVER/FALSE_DATA_POS_RXNOTINTABLE_AND_203_o4_SW1  (
    .I0(\U0/gpcs_pma_inst/RXDATA_INT [3]),
    .I1(\U0/gpcs_pma_inst/RXDATA_INT [0]),
    .I2(\U0/gpcs_pma_inst/RXDATA_INT [1]),
    .I3(\U0/gpcs_pma_inst/RXDATA_INT [4]),
    .I4(\U0/gpcs_pma_inst/RXDATA_INT [2]),
    .O(N39)
  );
  LUT4 #(
    .INIT ( 16'hDFFF ))
  \U0/gpcs_pma_inst/RECEIVER/K28p51_SW1  (
    .I0(\U0/gpcs_pma_inst/RXDATA_INT [4]),
    .I1(\U0/gpcs_pma_inst/RXDATA_INT [1]),
    .I2(\U0/gpcs_pma_inst/RXDATA_INT [3]),
    .I3(\U0/gpcs_pma_inst/RXDATA_INT [2]),
    .O(N43)
  );
  LUT6 #(
    .INIT ( 64'h0010000000000010 ))
  \U0/gpcs_pma_inst/RECEIVER/RXDATA[7]_RXNOTINTABLE_AND_211_o1  (
    .I0(N20),
    .I1(\U0/gpcs_pma_inst/RXNOTINTABLE_INT_104 ),
    .I2(\U0/gpcs_pma_inst/RXDATA_INT [7]),
    .I3(N43),
    .I4(\U0/gpcs_pma_inst/RXDATA_INT [5]),
    .I5(\U0/gpcs_pma_inst/RXDATA_INT [6]),
    .O(\U0/gpcs_pma_inst/RECEIVER/RXDATA[7]_RXNOTINTABLE_AND_211_o )
  );
  LUT3 #(
    .INIT ( 8'hBF ))
  \U0/gpcs_pma_inst/RECEIVER/K28p51_SW2  (
    .I0(\U0/gpcs_pma_inst/RXDATA_INT [1]),
    .I1(\U0/gpcs_pma_inst/RXDATA_INT [3]),
    .I2(\U0/gpcs_pma_inst/RXDATA_INT [2]),
    .O(N45)
  );
  LUT6 #(
    .INIT ( 64'h0000000004000000 ))
  \U0/gpcs_pma_inst/RECEIVER/K28p52  (
    .I0(N20),
    .I1(\U0/gpcs_pma_inst/RXDATA_INT [7]),
    .I2(\U0/gpcs_pma_inst/RXDATA_INT [6]),
    .I3(\U0/gpcs_pma_inst/RXDATA_INT [5]),
    .I4(\U0/gpcs_pma_inst/RXDATA_INT [4]),
    .I5(N45),
    .O(\U0/gpcs_pma_inst/RECEIVER/K28p5 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \U0/gpcs_pma_inst/RECEIVER/FALSE_DATA_POS_RXNOTINTABLE_AND_203_o4_SW2  (
    .I0(\U0/gpcs_pma_inst/RXCHARISK_INT_114 ),
    .I1(\U0/gpcs_pma_inst/RXNOTINTABLE_INT_104 ),
    .O(N57)
  );
  LUT6 #(
    .INIT ( 64'h0000000400200024 ))
  \U0/gpcs_pma_inst/RECEIVER/FALSE_DATA_POS_RXNOTINTABLE_AND_203_o5  (
    .I0(\U0/gpcs_pma_inst/RXDATA_INT [5]),
    .I1(\U0/gpcs_pma_inst/RXDATA_INT [6]),
    .I2(\U0/gpcs_pma_inst/RXDATA_INT [7]),
    .I3(N57),
    .I4(N38),
    .I5(N39),
    .O(\U0/gpcs_pma_inst/RECEIVER/FALSE_DATA_POS_RXNOTINTABLE_AND_203_o )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \U0/gpcs_pma_inst/RECEIVER/D21p5_D2p2_OR_38_o3_SW0  (
    .I0(\U0/gpcs_pma_inst/RXCHARISK_INT_114 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/K28p5_REG1_325 ),
    .O(N59)
  );
  LUT6 #(
    .INIT ( 64'h0013000300110000 ))
  \U0/gpcs_pma_inst/RECEIVER/C_rstpot  (
    .I0(\U0/gpcs_pma_inst/RXDATA_INT [0]),
    .I1(\U0/gpcs_pma_inst/RXDATA_INT [3]),
    .I2(\U0/gpcs_pma_inst/RXDATA_INT [1]),
    .I3(N59),
    .I4(\U0/gpcs_pma_inst/RECEIVER/D21p5_D2p2_OR_38_o1_341 ),
    .I5(\U0/gpcs_pma_inst/RECEIVER/D21p5_D2p2_OR_38_o ),
    .O(\U0/gpcs_pma_inst/RECEIVER/C_rstpot_372 )
  );
  FD   \U0/gpcs_pma_inst/SYNCHRONISATION/ENCOMMAALIGN  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/SYNCHRONISATION/ENCOMMAALIGN_rstpot_384 ),
    .Q(\NlwRenamedSig_OI_U0/gpcs_pma_inst/SYNCHRONISATION/ENCOMMAALIGN )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/gpcs_pma_inst/SYNCHRONISATION/SYNC_STATUS  (
    .C(userclk2),
    .D(\U0/gpcs_pma_inst/SYNCHRONISATION/SYNC_STATUS_rstpot_385 ),
    .Q(\U0/gpcs_pma_inst/SYNCHRONISATION/SYNC_STATUS_119 )
  );
  LUT4 #(
    .INIT ( 16'h6A2A ))
  \U0/gpcs_pma_inst/TRANSMITTER/C1_OR_C2_rstpot  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/C1_OR_C2_190 ),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [1]),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/XMIT_CONFIG_INT_188 ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/C1_OR_C2_rstpot_363 )
  );
  LUT3 #(
    .INIT ( 8'h2F ))
  \U0/gpcs_pma_inst/SYNCHRONISATION/EVEN_glue_set  (
    .I0(\U0/gpcs_pma_inst/RXCHARISCOMMA_INT_115 ),
    .I1(\U0/gpcs_pma_inst/SYNCHRONISATION/SYNC_STATUS_119 ),
    .I2(\U0/gpcs_pma_inst/SYNCHRONISATION/EVEN_120 ),
    .O(\U0/gpcs_pma_inst/SYNCHRONISATION/EVEN_glue_set_356 )
  );
  LUT6 #(
    .INIT ( 64'h0001010101010101 ))
  \U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd4_rstpot  (
    .I0(\U0/gpcs_pma_inst/RESET_INT_124 ),
    .I1(\U0/gpcs_pma_inst/RXBUFSTATUS_INT [1]),
    .I2(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd4_71 ),
    .I3(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd2_69 ),
    .I4(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd3_70 ),
    .I5(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd1_68 ),
    .O(\U0/gpcs_pma_inst/RX_RST_SM_FSM_FFd4_rstpot_364 )
  );
  LUT6 #(
    .INIT ( 64'h0001010101010101 ))
  \U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd4_rstpot  (
    .I0(\U0/gpcs_pma_inst/RESET_INT_124 ),
    .I1(\U0/gpcs_pma_inst/TXBUFERR_INT_99 ),
    .I2(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd4_78 ),
    .I3(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd2_76 ),
    .I4(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd3_77 ),
    .I5(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd1_75 ),
    .O(\U0/gpcs_pma_inst/TX_RST_SM_FSM_FFd4_rstpot_365 )
  );
  LUT4 #(
    .INIT ( 16'h0002 ))
  \U0/gpcs_pma_inst/TRANSMITTER/CONFIG_DATA_0_rstpot  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .I1(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/C1_OR_C2_190 ),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [1]),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/CONFIG_DATA_0_rstpot_370 )
  );
  LUT5 #(
    .INIT ( 32'h2AFF2A2A ))
  \U0/gpcs_pma_inst/RECEIVER/WAIT_FOR_K_glue_set  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/WAIT_FOR_K_272 ),
    .I1(\U0/gpcs_pma_inst/SYNCHRONISATION/EVEN_120 ),
    .I2(\U0/gpcs_pma_inst/RECEIVER/K28p5_REG1_325 ),
    .I3(\U0/gpcs_pma_inst/RECEIVER/SYNC_STATUS_REG_297 ),
    .I4(\U0/gpcs_pma_inst/SYNCHRONISATION/SYNC_STATUS_119 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/WAIT_FOR_K_glue_set_362 )
  );
  LUT3 #(
    .INIT ( 8'hBA ))
  \U0/gpcs_pma_inst/TRANSMITTER/TX_PACKET_glue_set  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/S_197 ),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/T_195 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/TX_PACKET_187 ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/TX_PACKET_glue_set_353 )
  );
  LUT3 #(
    .INIT ( 8'hBA ))
  \U0/gpcs_pma_inst/RECEIVER/RECEIVE_glue_set  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/SOP_REG2_313 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/EOP_292 ),
    .I2(\U0/gpcs_pma_inst/RECEIVER/RECEIVE_270 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/RECEIVE_glue_set_357 )
  );
  LUT3 #(
    .INIT ( 8'hBA ))
  \U0/gpcs_pma_inst/RECEIVER/RX_INVALID_glue_set  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/FROM_RX_CX_294 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/K28p5_REG1_325 ),
    .I2(\NlwRenamedSig_OI_U0/gpcs_pma_inst/RECEIVER/RX_INVALID ),
    .O(\U0/gpcs_pma_inst/RECEIVER/RX_INVALID_glue_set_358 )
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \U0/gpcs_pma_inst/TRANSMITTER/TRIGGER_T_rstpot  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/TX_EN_REG1_211 ),
    .I1(gmii_tx_en),
    .I2(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/TRIGGER_T_rstpot_368 )
  );
  LUT4 #(
    .INIT ( 16'h0040 ))
  \U0/gpcs_pma_inst/RECEIVER/C_HDR_REMOVED_REG_rstpot  (
    .I0(\U0/gpcs_pma_inst/RXCLKCORCNT_INT [1]),
    .I1(\U0/gpcs_pma_inst/RECEIVER/C_REG2_238 ),
    .I2(\U0/gpcs_pma_inst/RXCLKCORCNT_INT [0]),
    .I3(\U0/gpcs_pma_inst/RXCLKCORCNT_INT [2]),
    .O(\U0/gpcs_pma_inst/RECEIVER/C_HDR_REMOVED_REG_rstpot_371 )
  );
  LUT5 #(
    .INIT ( 32'hFFFF4440 ))
  \U0/gpcs_pma_inst/TRANSMITTER/R_glue_set  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/S_197 ),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/R_186 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/TX_ER_REG1_210 ),
    .I4(\U0/gpcs_pma_inst/TRANSMITTER/T_195 ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/R_glue_set_354 )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \U0/gpcs_pma_inst/RECEIVER/RX_DV_glue_set_SW0  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/EOP_REG1_291 ),
    .I1(\NlwRenamedSig_OI_U0/gpcs_pma_inst/RECEIVER/RX_DV ),
    .O(N71)
  );
  LUT6 #(
    .INIT ( 64'h0200FFFF0200AAAA ))
  \U0/gpcs_pma_inst/RECEIVER/RX_DV_glue_set  (
    .I0(\U0/gpcs_pma_inst/SYNCHRONISATION/SYNC_STATUS_119 ),
    .I1(\NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [3]),
    .I2(\NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [2]),
    .I3(\U0/gpcs_pma_inst/RECEIVER/SOP_REG3_312 ),
    .I4(N71),
    .I5(\U0/gpcs_pma_inst/RECEIVER/RECEIVE_270 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/RX_DV_glue_set_359 )
  );
  LUT4 #(
    .INIT ( 16'hFFDF ))
  \U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_glue_set_SW1  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/I_REG_320 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/S_329 ),
    .I2(\U0/gpcs_pma_inst/SYNCHRONISATION/SYNC_STATUS_119 ),
    .I3(\U0/gpcs_pma_inst/RECEIVER/FALSE_NIT_280 ),
    .O(N73)
  );
  LUT6 #(
    .INIT ( 64'h44444445CCCCCCCD ))
  \U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_glue_set  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/K28p5_REG1_325 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_271 ),
    .I2(N73),
    .I3(\U0/gpcs_pma_inst/RECEIVER/FALSE_DATA_282 ),
    .I4(\U0/gpcs_pma_inst/RECEIVER/FALSE_K_281 ),
    .I5(\U0/gpcs_pma_inst/SYNCHRONISATION/EVEN_120 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_glue_set_361 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \U0/gpcs_pma_inst/TRANSMITTER/DISPARITY_glue_rst_SW1  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/SYNC_DISPARITY_193 ),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .I2(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .O(N75)
  );
  LUT6 #(
    .INIT ( 64'h00000000857A7A85 ))
  \U0/gpcs_pma_inst/TRANSMITTER/DISPARITY_glue_rst  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [5]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [7]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [6]),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/DISPARITY_184 ),
    .I4(\U0/gpcs_pma_inst/TRANSMITTER/DISP5 ),
    .I5(N75),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/DISPARITY_glue_rst_355 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/gpcs_pma_inst/RECEIVER/EXTEND_glue_set_SW0  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/RECEIVE_270 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/R_REG1_321 ),
    .O(N77)
  );
  LUT6 #(
    .INIT ( 64'hFFFF022202220222 ))
  \U0/gpcs_pma_inst/RECEIVER/EXTEND_glue_set  (
    .I0(\U0/gpcs_pma_inst/RECEIVER/EXTEND_269 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/S_329 ),
    .I2(\U0/gpcs_pma_inst/RECEIVER/K28p5_REG1_325 ),
    .I3(\U0/gpcs_pma_inst/SYNCHRONISATION/EVEN_120 ),
    .I4(N77),
    .I5(\U0/gpcs_pma_inst/RECEIVER/R_301 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/EXTEND_glue_set_360 )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \U0/gpcs_pma_inst/TRANSMITTER/V_glue_set_SW1  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/TX_PACKET_187 ),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/TX_ER_REG1_210 ),
    .O(N79)
  );
  LUT6 #(
    .INIT ( 64'hFFFF8A888A888A88 ))
  \U0/gpcs_pma_inst/TRANSMITTER/V_glue_set  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/XMIT_DATA_INT_189 ),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/TX_EN_REG1_XMIT_DATA_INT_AND_20_o2_334 ),
    .I2(N79),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/TX_EN_REG1_211 ),
    .I4(\U0/gpcs_pma_inst/TRANSMITTER/V_185 ),
    .I5(\U0/gpcs_pma_inst/TRANSMITTER/S_197 ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/V_glue_set_352 )
  );
  LUT4 #(
    .INIT ( 16'hFFFB ))
  \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRPISK_rstpot_SW0  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/T_195 ),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/TX_PACKET_187 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/S_197 ),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/V_185 ),
    .O(N81)
  );
  LUT6 #(
    .INIT ( 64'h5F5F0F0F5F5C0F0C ))
  \U0/gpcs_pma_inst/TRANSMITTER/CODE_GRPISK_rstpot  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [1]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/R_186 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/XMIT_CONFIG_INT_188 ),
    .I3(\NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [3]),
    .I4(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .I5(N81),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRPISK_rstpot_366 )
  );
  LUT3 #(
    .INIT ( 8'h2A ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_CODE_GRPISK_GND_22_o_MUX_79_o11  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRPISK_192 ),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/SYNC_DISPARITY_193 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRPISK_GND_22_o_MUX_79_o )
  );
  LUT4 #(
    .INIT ( 16'hEA2A ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_CODE_GRP[7]_GND_22_o_mux_24_OUT11  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [0]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/SYNC_DISPARITY_193 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/DISPARITY_184 ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<0> )
  );
  LUT3 #(
    .INIT ( 8'h2A ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_CODE_GRP[7]_GND_22_o_mux_24_OUT21  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [1]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/SYNC_DISPARITY_193 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<1> )
  );
  LUT4 #(
    .INIT ( 16'hEA2A ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_CODE_GRP[7]_GND_22_o_mux_24_OUT31  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [2]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/SYNC_DISPARITY_193 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/DISPARITY_184 ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<2> )
  );
  LUT3 #(
    .INIT ( 8'h2A ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_CODE_GRP[7]_GND_22_o_mux_24_OUT41  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [3]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/SYNC_DISPARITY_193 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<3> )
  );
  LUT4 #(
    .INIT ( 16'h2AEA ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_CODE_GRP[7]_GND_22_o_mux_24_OUT51  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [4]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/SYNC_DISPARITY_193 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/DISPARITY_184 ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<4> )
  );
  LUT3 #(
    .INIT ( 8'h2A ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_CODE_GRP[7]_GND_22_o_mux_24_OUT61  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [5]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/SYNC_DISPARITY_193 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<5> )
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_CODE_GRP[7]_GND_22_o_mux_24_OUT71  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [6]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/SYNC_DISPARITY_193 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<6> )
  );
  LUT4 #(
    .INIT ( 16'hEA2A ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_CODE_GRP[7]_GND_22_o_mux_24_OUT81  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP [7]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/SYNC_DISPARITY_193 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/DISPARITY_184 ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP[7]_GND_22_o_mux_24_OUT<7> )
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \U0/gpcs_pma_inst/TRANSMITTER/_n0235<1>1  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/C1_OR_C2_190 ),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [1]),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/_n0235 [1])
  );
  LUT4 #(
    .INIT ( 16'h0040 ))
  \U0/gpcs_pma_inst/TRANSMITTER/TXCHARDISPVAL_rstpot  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/DISPARITY_184 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/SYNC_DISPARITY_193 ),
    .I3(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_TX_RESET_INT ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/TXCHARDISPVAL_rstpot_367 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000008 ))
  \U0/gpcs_pma_inst/RECEIVER/EXT_ILLEGAL_K_rstpot  (
    .I0(\U0/gpcs_pma_inst/SYNCHRONISATION/SYNC_STATUS_119 ),
    .I1(\U0/gpcs_pma_inst/RECEIVER/EXTEND_REG1_311 ),
    .I2(\NlwRenamedSig_OI_U0/gpcs_pma_inst/MGT_RX_RESET_INT ),
    .I3(\U0/gpcs_pma_inst/RECEIVER/K28p5_REG1_EVEN_AND_127_o ),
    .I4(\U0/gpcs_pma_inst/RECEIVER/R_301 ),
    .I5(\U0/gpcs_pma_inst/RECEIVER/S_329 ),
    .O(\U0/gpcs_pma_inst/RECEIVER/EXT_ILLEGAL_K_rstpot_373 )
  );
  MUXF7   \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4-In2  (
    .I0(N83),
    .I1(N84),
    .S(\U0/gpcs_pma_inst/SYNCHRONISATION/CGBAD ),
    .O(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4-In2_225 )
  );
  LUT6 #(
    .INIT ( 64'hF0F4540400040404 ))
  \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4-In2_F  (
    .I0(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4_224 ),
    .I1(\U0/gpcs_pma_inst/RXCHARISCOMMA_INT_115 ),
    .I2(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd1_221 ),
    .I3(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd3_223 ),
    .I4(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd2_222 ),
    .I5(\U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS[1]_PWR_20_o_equal_19_o ),
    .O(N83)
  );
  LUT5 #(
    .INIT ( 32'hDBDB8988 ))
  \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4-In2_G  (
    .I0(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd3_223 ),
    .I1(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd2_222 ),
    .I2(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4_224 ),
    .I3(\U0/gpcs_pma_inst/RXCHARISCOMMA_INT_115 ),
    .I4(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd1_221 ),
    .O(N84)
  );
  MUXF7   \U0/gpcs_pma_inst/SYNCHRONISATION/ENCOMMAALIGN_rstpot  (
    .I0(N85),
    .I1(N86),
    .S(\U0/gpcs_pma_inst/SYNCHRONISATION/CGBAD ),
    .O(\U0/gpcs_pma_inst/SYNCHRONISATION/ENCOMMAALIGN_rstpot_384 )
  );
  LUT6 #(
    .INIT ( 64'hAAAAAA2AAAAAAB2B ))
  \U0/gpcs_pma_inst/SYNCHRONISATION/ENCOMMAALIGN_rstpot_F  (
    .I0(\NlwRenamedSig_OI_U0/gpcs_pma_inst/SYNCHRONISATION/ENCOMMAALIGN ),
    .I1(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd2_222 ),
    .I2(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4_224 ),
    .I3(\U0/gpcs_pma_inst/RXCHARISK_INT_114 ),
    .I4(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd3_223 ),
    .I5(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd1_221 ),
    .O(N85)
  );
  LUT5 #(
    .INIT ( 32'hFFFFA889 ))
  \U0/gpcs_pma_inst/SYNCHRONISATION/ENCOMMAALIGN_rstpot_G  (
    .I0(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd1_221 ),
    .I1(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd2_222 ),
    .I2(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd3_223 ),
    .I3(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4_224 ),
    .I4(\NlwRenamedSig_OI_U0/gpcs_pma_inst/SYNCHRONISATION/ENCOMMAALIGN ),
    .O(N86)
  );
  MUXF7   \U0/gpcs_pma_inst/SYNCHRONISATION/SYNC_STATUS_rstpot  (
    .I0(N87),
    .I1(N88),
    .S(\U0/gpcs_pma_inst/SYNCHRONISATION/CGBAD ),
    .O(\U0/gpcs_pma_inst/SYNCHRONISATION/SYNC_STATUS_rstpot_385 )
  );
  LUT6 #(
    .INIT ( 64'hAAAAAAA8AEAAAEA8 ))
  \U0/gpcs_pma_inst/SYNCHRONISATION/SYNC_STATUS_rstpot_F  (
    .I0(\U0/gpcs_pma_inst/SYNCHRONISATION/SYNC_STATUS_119 ),
    .I1(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd2_222 ),
    .I2(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd3_223 ),
    .I3(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4_224 ),
    .I4(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd1_221 ),
    .I5(\U0/gpcs_pma_inst/RXCHARISK_INT_114 ),
    .O(N87)
  );
  LUT5 #(
    .INIT ( 32'h222A22A8 ))
  \U0/gpcs_pma_inst/SYNCHRONISATION/SYNC_STATUS_rstpot_G  (
    .I0(\U0/gpcs_pma_inst/SYNCHRONISATION/SYNC_STATUS_119 ),
    .I1(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd1_221 ),
    .I2(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4_224 ),
    .I3(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd2_222 ),
    .I4(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd3_223 ),
    .O(N88)
  );
  MUXF7   \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd2-In22  (
    .I0(N89),
    .I1(N90),
    .S(\U0/gpcs_pma_inst/SYNCHRONISATION/CGBAD ),
    .O(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd2-In2 )
  );
  LUT6 #(
    .INIT ( 64'hF212E2A2F69AE6AA ))
  \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd2-In22_F  (
    .I0(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd2_222 ),
    .I1(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4_224 ),
    .I2(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd1_221 ),
    .I3(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd3_223 ),
    .I4(\U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS[1]_PWR_20_o_equal_19_o ),
    .I5(\U0/gpcs_pma_inst/RXCHARISK_INT_114 ),
    .O(N89)
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd2-In22_G  (
    .I0(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd3_223 ),
    .I1(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4_224 ),
    .I2(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd2_222 ),
    .O(N90)
  );
  MUXF7   \U0/gpcs_pma_inst/TRANSMITTER/Mmux_TX_PACKET_CODE_GRP_CNT[1]_MUX_73_o11  (
    .I0(N91),
    .I1(N92),
    .S(\U0/gpcs_pma_inst/TRANSMITTER/XMIT_CONFIG_INT_188 ),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/TX_PACKET_CODE_GRP_CNT[1]_MUX_73_o )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF00000001 ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_TX_PACKET_CODE_GRP_CNT[1]_MUX_73_o11_F  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/S_197 ),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/V_185 ),
    .I2(\U0/gpcs_pma_inst/TRANSMITTER/T_195 ),
    .I3(\U0/gpcs_pma_inst/TRANSMITTER/R_186 ),
    .I4(\U0/gpcs_pma_inst/TRANSMITTER/TX_PACKET_187 ),
    .I5(\NlwRenamedSig_OI_U0/gpcs_pma_inst/CONFIGURATION_VECTOR_REG [3]),
    .O(N91)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \U0/gpcs_pma_inst/TRANSMITTER/Mmux_TX_PACKET_CODE_GRP_CNT[1]_MUX_73_o11_G  (
    .I0(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [1]),
    .I1(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .O(N92)
  );
  MUXF7   \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd3-In32  (
    .I0(N93),
    .I1(N94),
    .S(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd4_224 ),
    .O(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd3-In3 )
  );
  LUT6 #(
    .INIT ( 64'hAA8AAB8AAA8AAA8A ))
  \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd3-In32_F  (
    .I0(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd3_223 ),
    .I1(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd2_222 ),
    .I2(\U0/gpcs_pma_inst/SYNCHRONISATION/CGBAD ),
    .I3(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd1_221 ),
    .I4(\U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS [0]),
    .I5(\U0/gpcs_pma_inst/SYNCHRONISATION/GOOD_CGS [1]),
    .O(N93)
  );
  LUT4 #(
    .INIT ( 16'h5501 ))
  \U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd3-In32_G  (
    .I0(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd3_223 ),
    .I1(\U0/gpcs_pma_inst/SYNCHRONISATION/CGBAD ),
    .I2(\U0/gpcs_pma_inst/RXCHARISK_INT_114 ),
    .I3(\U0/gpcs_pma_inst/SYNCHRONISATION/STATE_FSM_FFd1_221 ),
    .O(N94)
  );
  INV   \U0/gpcs_pma_inst/TRANSMITTER/Mcount_CODE_GRP_CNT_xor<0>11_INV_0  (
    .I(\U0/gpcs_pma_inst/TRANSMITTER/CODE_GRP_CNT [0]),
    .O(\U0/gpcs_pma_inst/TRANSMITTER/Result [0])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \U0/gpcs_pma_inst/Mshreg_STATUS_VECTOR_0  (
    .A0(NlwRenamedSig_OI_status_vector[7]),
    .A1(NlwRenamedSig_OI_status_vector[7]),
    .A2(NlwRenamedSig_OI_status_vector[7]),
    .A3(NlwRenamedSig_OI_status_vector[7]),
    .CE(N0),
    .CLK(userclk2),
    .D(\U0/gpcs_pma_inst/SYNCHRONISATION/SYNC_STATUS_119 ),
    .Q(\U0/gpcs_pma_inst/Mshreg_STATUS_VECTOR_0_404 ),
    .Q15(\NLW_U0/gpcs_pma_inst/Mshreg_STATUS_VECTOR_0_Q15_UNCONNECTED )
  );
  FDE   \U0/gpcs_pma_inst/STATUS_VECTOR_0  (
    .C(userclk2),
    .CE(N0),
    .D(\U0/gpcs_pma_inst/Mshreg_STATUS_VECTOR_0_404 ),
    .Q(\NlwRenamedSignal_U0/gpcs_pma_inst/STATUS_VECTOR_0 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_7  (
    .A0(N0),
    .A1(N0),
    .A2(NlwRenamedSig_OI_status_vector[7]),
    .A3(NlwRenamedSig_OI_status_vector[7]),
    .CE(N0),
    .CLK(userclk2),
    .D(\U0/gpcs_pma_inst/RXDATA_INT [7]),
    .Q(\U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_7_405 ),
    .Q15(\NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_7_Q15_UNCONNECTED )
  );
  FDE   \U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5_7  (
    .C(userclk2),
    .CE(N0),
    .D(\U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_7_405 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5 [7])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_6  (
    .A0(N0),
    .A1(N0),
    .A2(NlwRenamedSig_OI_status_vector[7]),
    .A3(NlwRenamedSig_OI_status_vector[7]),
    .CE(N0),
    .CLK(userclk2),
    .D(\U0/gpcs_pma_inst/RXDATA_INT [6]),
    .Q(\U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_6_406 ),
    .Q15(\NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_6_Q15_UNCONNECTED )
  );
  FDE   \U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5_6  (
    .C(userclk2),
    .CE(N0),
    .D(\U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_6_406 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5 [6])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_5  (
    .A0(N0),
    .A1(N0),
    .A2(NlwRenamedSig_OI_status_vector[7]),
    .A3(NlwRenamedSig_OI_status_vector[7]),
    .CE(N0),
    .CLK(userclk2),
    .D(\U0/gpcs_pma_inst/RXDATA_INT [5]),
    .Q(\U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_5_407 ),
    .Q15(\NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_5_Q15_UNCONNECTED )
  );
  FDE   \U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5_5  (
    .C(userclk2),
    .CE(N0),
    .D(\U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_5_407 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5 [5])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_2  (
    .A0(N0),
    .A1(N0),
    .A2(NlwRenamedSig_OI_status_vector[7]),
    .A3(NlwRenamedSig_OI_status_vector[7]),
    .CE(N0),
    .CLK(userclk2),
    .D(\U0/gpcs_pma_inst/RXDATA_INT [2]),
    .Q(\U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_2_408 ),
    .Q15(\NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_2_Q15_UNCONNECTED )
  );
  FDE   \U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5_2  (
    .C(userclk2),
    .CE(N0),
    .D(\U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_2_408 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5 [2])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_4  (
    .A0(N0),
    .A1(N0),
    .A2(NlwRenamedSig_OI_status_vector[7]),
    .A3(NlwRenamedSig_OI_status_vector[7]),
    .CE(N0),
    .CLK(userclk2),
    .D(\U0/gpcs_pma_inst/RXDATA_INT [4]),
    .Q(\U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_4_409 ),
    .Q15(\NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_4_Q15_UNCONNECTED )
  );
  FDE   \U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5_4  (
    .C(userclk2),
    .CE(N0),
    .D(\U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_4_409 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5 [4])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_3  (
    .A0(N0),
    .A1(N0),
    .A2(NlwRenamedSig_OI_status_vector[7]),
    .A3(NlwRenamedSig_OI_status_vector[7]),
    .CE(N0),
    .CLK(userclk2),
    .D(\U0/gpcs_pma_inst/RXDATA_INT [3]),
    .Q(\U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_3_410 ),
    .Q15(\NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_3_Q15_UNCONNECTED )
  );
  FDE   \U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5_3  (
    .C(userclk2),
    .CE(N0),
    .D(\U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_3_410 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5 [3])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \U0/gpcs_pma_inst/RECEIVER/Mshreg_EXTEND_REG3  (
    .A0(NlwRenamedSig_OI_status_vector[7]),
    .A1(NlwRenamedSig_OI_status_vector[7]),
    .A2(NlwRenamedSig_OI_status_vector[7]),
    .A3(NlwRenamedSig_OI_status_vector[7]),
    .CE(N0),
    .CLK(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/EXTEND_REG1_311 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/Mshreg_EXTEND_REG3_411 ),
    .Q15(\NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_EXTEND_REG3_Q15_UNCONNECTED )
  );
  FDE   \U0/gpcs_pma_inst/RECEIVER/EXTEND_REG3  (
    .C(userclk2),
    .CE(N0),
    .D(\U0/gpcs_pma_inst/RECEIVER/Mshreg_EXTEND_REG3_411 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/EXTEND_REG3_310 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_1  (
    .A0(N0),
    .A1(N0),
    .A2(NlwRenamedSig_OI_status_vector[7]),
    .A3(NlwRenamedSig_OI_status_vector[7]),
    .CE(N0),
    .CLK(userclk2),
    .D(\U0/gpcs_pma_inst/RXDATA_INT [1]),
    .Q(\U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_1_412 ),
    .Q15(\NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_1_Q15_UNCONNECTED )
  );
  FDE   \U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5_1  (
    .C(userclk2),
    .CE(N0),
    .D(\U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_1_412 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5 [1])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_0  (
    .A0(N0),
    .A1(N0),
    .A2(NlwRenamedSig_OI_status_vector[7]),
    .A3(NlwRenamedSig_OI_status_vector[7]),
    .CE(N0),
    .CLK(userclk2),
    .D(\U0/gpcs_pma_inst/RXDATA_INT [0]),
    .Q(\U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_0_413 ),
    .Q15(\NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_0_Q15_UNCONNECTED )
  );
  FDE   \U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5_0  (
    .C(userclk2),
    .CE(N0),
    .D(\U0/gpcs_pma_inst/RECEIVER/Mshreg_RXDATA_REG5_0_413 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/RXDATA_REG5 [0])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \U0/gpcs_pma_inst/RECEIVER/Mshreg_CGBAD_REG2  (
    .A0(N0),
    .A1(NlwRenamedSig_OI_status_vector[7]),
    .A2(NlwRenamedSig_OI_status_vector[7]),
    .A3(NlwRenamedSig_OI_status_vector[7]),
    .CE(N0),
    .CLK(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/CGBAD_300 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/CGBAD_REG2 ),
    .Q15(\NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_CGBAD_REG2_Q15_UNCONNECTED )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \U0/gpcs_pma_inst/RECEIVER/Mshreg_SOP_REG2  (
    .A0(NlwRenamedSig_OI_status_vector[7]),
    .A1(NlwRenamedSig_OI_status_vector[7]),
    .A2(NlwRenamedSig_OI_status_vector[7]),
    .A3(NlwRenamedSig_OI_status_vector[7]),
    .CE(N0),
    .CLK(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/SOP_293 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/Mshreg_SOP_REG2_414 ),
    .Q15(\NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_SOP_REG2_Q15_UNCONNECTED )
  );
  FDE   \U0/gpcs_pma_inst/RECEIVER/SOP_REG2  (
    .C(userclk2),
    .CE(N0),
    .D(\U0/gpcs_pma_inst/RECEIVER/Mshreg_SOP_REG2_414 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/SOP_REG2_313 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \U0/gpcs_pma_inst/RECEIVER/Mshreg_FALSE_CARRIER_REG2  (
    .A0(N0),
    .A1(NlwRenamedSig_OI_status_vector[7]),
    .A2(NlwRenamedSig_OI_status_vector[7]),
    .A3(NlwRenamedSig_OI_status_vector[7]),
    .CE(N0),
    .CLK(userclk2),
    .D(\U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_271 ),
    .Q(\U0/gpcs_pma_inst/RECEIVER/FALSE_CARRIER_REG2 ),
    .Q15(\NLW_U0/gpcs_pma_inst/RECEIVER/Mshreg_FALSE_CARRIER_REG2_Q15_UNCONNECTED )
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
