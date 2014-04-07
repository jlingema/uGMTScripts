--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.68d
--  \   \         Application: netgen
--  /   /         Filename: gig_eth_pcs_pma_v11_5.vhd
-- /___/   /\     Timestamp: Tue Apr  1 12:36:55 2014
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -w -sim -ofmt vhdl /home/scratch/vhdl/uGMT/dev/ipbus_lut_test/mp7_690es/ipcore_dir/tmp/_cg/gig_eth_pcs_pma_v11_5.ngc /home/scratch/vhdl/uGMT/dev/ipbus_lut_test/mp7_690es/ipcore_dir/tmp/_cg/gig_eth_pcs_pma_v11_5.vhd 
-- Device	: 7vx690tffg1927-2
-- Input file	: /home/scratch/vhdl/uGMT/dev/ipbus_lut_test/mp7_690es/ipcore_dir/tmp/_cg/gig_eth_pcs_pma_v11_5.ngc
-- Output file	: /home/scratch/vhdl/uGMT/dev/ipbus_lut_test/mp7_690es/ipcore_dir/tmp/_cg/gig_eth_pcs_pma_v11_5.vhd
-- # of Entities	: 1
-- Design Name	: gig_eth_pcs_pma_v11_5
-- Xilinx	: /opt/Xilinx/14.6/ISE_DS/ISE/
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------


-- synthesis translate_off
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity gig_eth_pcs_pma_v11_5 is
  port (
    reset : in STD_LOGIC := 'X'; 
    signal_detect : in STD_LOGIC := 'X'; 
    userclk : in STD_LOGIC := 'X'; 
    userclk2 : in STD_LOGIC := 'X'; 
    dcm_locked : in STD_LOGIC := 'X'; 
    txbuferr : in STD_LOGIC := 'X'; 
    gmii_tx_en : in STD_LOGIC := 'X'; 
    gmii_tx_er : in STD_LOGIC := 'X'; 
    mgt_rx_reset : out STD_LOGIC; 
    mgt_tx_reset : out STD_LOGIC; 
    powerdown : out STD_LOGIC; 
    txchardispmode : out STD_LOGIC; 
    txchardispval : out STD_LOGIC; 
    txcharisk : out STD_LOGIC; 
    enablealign : out STD_LOGIC; 
    gmii_rx_dv : out STD_LOGIC; 
    gmii_rx_er : out STD_LOGIC; 
    gmii_isolate : out STD_LOGIC; 
    rxbufstatus : in STD_LOGIC_VECTOR ( 1 downto 0 ); 
    rxchariscomma : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
    rxcharisk : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
    rxclkcorcnt : in STD_LOGIC_VECTOR ( 2 downto 0 ); 
    rxdata : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
    rxdisperr : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
    rxnotintable : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
    rxrundisp : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
    gmii_txd : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
    configuration_vector : in STD_LOGIC_VECTOR ( 4 downto 0 ); 
    txdata : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    gmii_rxd : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    status_vector : out STD_LOGIC_VECTOR ( 15 downto 0 ) 
  );
end gig_eth_pcs_pma_v11_5;

architecture STRUCTURE of gig_eth_pcs_pma_v11_5 is
  signal U0_gpcs_pma_inst_RXNOTINTABLE_REG_51 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDISPERR_REG_52 : STD_LOGIC; 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_RECEIVER_RX_INVALID : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RUDI_I_54 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RUDI_C_55 : STD_LOGIC; 
  signal NlwRenamedSignal_U0_gpcs_pma_inst_STATUS_VECTOR_0 : STD_LOGIC; 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT : STD_LOGIC; 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXCHARDISPMODE_60 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXCHARDISPVAL_61 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXCHARISK_62 : STD_LOGIC; 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN : STD_LOGIC; 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_RECEIVER_RX_DV : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_ER_65 : STD_LOGIC; 
  signal N0 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_68 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_69 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_70 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_71 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_In : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_In : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_In : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_75 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_76 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_77 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_78 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_In : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_In : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_In : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNC_SIGNAL_DETECT_data_sync1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SRESET_PIPE_PWR_15_o_MUX_1_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RESET_INT_RXBUFSTATUS_INT_1_OR_116_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RESET_INT_TXBUFERR_INT_OR_115_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXCHARDISPVAL_INT_GND_15_o_MUX_194_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXCHARDISPMODE_INT_TXEVEN_MUX_193_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXCHARISK_INT_TXEVEN_MUX_192_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_2_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_3_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_4_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_5_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_6_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_3_GND_15_o_Mux_17_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_3_GND_15_o_Mux_13_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXBUFERR_INT_99 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXNOTINTABLE_INT_104 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDISPERR_INT_105 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXCHARISK_INT_114 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXCHARISCOMMA_INT_115 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SRESET_117 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SRESET_PIPE_118 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_119 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_120 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXNOTINTABLE_SRL : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDISPERR_SRL : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RESET_INT_PIPE_123 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RESET_INT_124 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SIGNAL_DETECT_REG : STD_LOGIC; 
  signal U0_gpcs_pma_inst_DCM_LOCKED_SOFT_RESET_OR_2_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL_127 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPMODE_128 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TXCHARISK_129 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXNOTINTABLE_0_GND_15_o_MUX_182_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDISPERR_0_GND_15_o_MUX_183_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_2_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_3_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_4_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_5_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_6_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_22_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_22_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_22_OUT_2_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXCHARISK_0_TXCHARISK_INT_MUX_185_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXCHARISCOMMA_0_TXCHARISK_INT_MUX_186_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXBUFSTATUS_1_GND_15_o_mux_21_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT511 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_22_o_Mux_5_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_S_OR_12_o_0 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_DISP5 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_T_OR_14_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_EN_EVEN_AND_8_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_CODE_GRP_CNT_1_MUX_73_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_GND_22_o_MUX_79_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_2_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_3_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_4_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_5_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_6_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_EVEN_AND_42_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_2_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_3_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_4_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_5_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_6_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_184 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_V_185 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_R_186 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_187 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_188 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_XMIT_DATA_INT_189 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_190 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_192 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_193 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T_194 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_T_195 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_S_196 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_S_197 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_ER_REG1_210 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_211 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In1_0 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_221 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_222 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_223 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_224 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In2_225 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_In2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_In2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_In3 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_n0103_inv : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_PWR_20_o_equal_19_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_GND_24_o_mux_30_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_GND_24_o_mux_30_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_SIGNAL_DETECT_REG_236 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_111_o1_237 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_REG2_238 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_D21p5_AND_116_o_norst : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_IDLE_REG_1_IDLE_REG_2_OR_114_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_0_RX_CONFIG_VALID_REG_3_OR_113_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_REG1_C_REG3_OR_59_o_242 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_64_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_D0p0_244 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_203_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3_EXT_ILLEGAL_K_REG2_OR_83_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EOP_EXTEND_OR_65_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_2_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_3_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_4_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_5_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_6_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_K28p5_REG1_AND_167_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_S_WAIT_FOR_K_AND_144_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_ISOLATE_AND_182_o_258 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_C_REG1_AND_125_o_259 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EVEN_RXCHARISK_AND_115_o_260 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_EVEN_AND_127_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K28p5 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_7_RXNOTINTABLE_AND_211_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K23p7 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_111_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K29p7 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXFIFO_ERR_RXDISPERR_OR_36_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_51_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXTEND_269 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RECEIVE_270 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_271 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_272 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_280 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_K_281 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_282 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG2_283 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG1_284 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_285 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXTEND_ERR_286 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG2_287 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG1_288 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_289 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_290 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EOP_REG1_291 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EOP_292 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_SOP_293 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FROM_RX_CX_294 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_296 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_REG_297 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_298 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_CGBAD_REG3_299 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_CGBAD_300 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_R_301 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3_310 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_311 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_SOP_REG3_312 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_SOP_REG2_313 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_315 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_CGBAD_REG2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_317 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_REG3_318 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_REG1_319 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_I_REG_320 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_R_REG1_321 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_T_REG2_322 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_T_REG1_323 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_D0p0_REG_324 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_325 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_326 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_I_327 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_T_328 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_S_329 : STD_LOGIC; 
  signal N2 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal N8 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_20_o1_333 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_20_o2_334 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT1 : STD_LOGIC; 
  signal N14 : STD_LOGIC; 
  signal N18 : STD_LOGIC; 
  signal N20 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_38_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_38_o1_341 : STD_LOGIC; 
  signal N22 : STD_LOGIC; 
  signal N24 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o12_345 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o13_346 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o14_347 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_64_o1_348 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_T_REG2_R_REG1_OR_79_o1_349 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_T_REG2_R_REG1_OR_79_o2_350 : STD_LOGIC; 
  signal N26 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_V_glue_set_352 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_glue_set_353 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_R_glue_set_354 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_glue_rst_355 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_glue_set_356 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RECEIVE_glue_set_357 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_INVALID_glue_set_358 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_DV_glue_set_359 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXTEND_glue_set_360 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_glue_set_361 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_glue_set_362 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_rstpot_363 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_rstpot_364 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_rstpot_365 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_rstpot_366 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL_rstpot_367 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T_rstpot_368 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_S_rstpot_369 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_0_rstpot_370 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_rstpot_371 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_rstpot_372 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_rstpot_373 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_rstpot_374 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_rstpot_375 : STD_LOGIC; 
  signal N28 : STD_LOGIC; 
  signal N34 : STD_LOGIC; 
  signal N38 : STD_LOGIC; 
  signal N39 : STD_LOGIC; 
  signal N43 : STD_LOGIC; 
  signal N45 : STD_LOGIC; 
  signal N57 : STD_LOGIC; 
  signal N59 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN_rstpot_384 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_rstpot_385 : STD_LOGIC; 
  signal N71 : STD_LOGIC; 
  signal N73 : STD_LOGIC; 
  signal N75 : STD_LOGIC; 
  signal N77 : STD_LOGIC; 
  signal N79 : STD_LOGIC; 
  signal N81 : STD_LOGIC; 
  signal N83 : STD_LOGIC; 
  signal N84 : STD_LOGIC; 
  signal N85 : STD_LOGIC; 
  signal N86 : STD_LOGIC; 
  signal N87 : STD_LOGIC; 
  signal N88 : STD_LOGIC; 
  signal N89 : STD_LOGIC; 
  signal N90 : STD_LOGIC; 
  signal N91 : STD_LOGIC; 
  signal N92 : STD_LOGIC; 
  signal N93 : STD_LOGIC; 
  signal N94 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_0_404 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_7_405 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_6_406 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_5_407 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_2_408 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_4_409 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_3_410 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_EXTEND_REG3_411 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_1_412 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_0_413 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_SOP_REG2_414 : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_0_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_7_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_6_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_5_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_2_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_4_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_3_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_EXTEND_REG3_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_1_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_0_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_CGBAD_REG2_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_SOP_REG2_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_FALSE_CARRIER_REG2_Q15_UNCONNECTED : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal U0_gpcs_pma_inst_RECEIVER_RXD : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG : STD_LOGIC_VECTOR ( 3 downto 2 ); 
  signal U0_gpcs_pma_inst_RXCLKCORCNT_INT : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal U0_gpcs_pma_inst_RXBUFSTATUS_INT : STD_LOGIC_VECTOR ( 1 downto 1 ); 
  signal U0_gpcs_pma_inst_RXDATA_INT : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG : STD_LOGIC_VECTOR ( 1 downto 1 ); 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal U0_gpcs_pma_inst_TRANSMITTER_TXDATA : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal U0_gpcs_pma_inst_TRANSMITTER_Result : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal U0_gpcs_pma_inst_TRANSMITTER_n0235 : STD_LOGIC_VECTOR ( 1 downto 1 ); 
  signal U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal U0_gpcs_pma_inst_RECEIVER_IDLE_REG : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal NlwRenamedSig_OI_status_vector : STD_LOGIC_VECTOR ( 7 downto 7 ); 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
begin
  txdata(7) <= U0_gpcs_pma_inst_TXDATA(7);
  txdata(6) <= U0_gpcs_pma_inst_TXDATA(6);
  txdata(5) <= U0_gpcs_pma_inst_TXDATA(5);
  txdata(4) <= U0_gpcs_pma_inst_TXDATA(4);
  txdata(3) <= U0_gpcs_pma_inst_TXDATA(3);
  txdata(2) <= U0_gpcs_pma_inst_TXDATA(2);
  txdata(1) <= U0_gpcs_pma_inst_TXDATA(1);
  txdata(0) <= U0_gpcs_pma_inst_TXDATA(0);
  gmii_rxd(7) <= U0_gpcs_pma_inst_RECEIVER_RXD(7);
  gmii_rxd(6) <= U0_gpcs_pma_inst_RECEIVER_RXD(6);
  gmii_rxd(5) <= U0_gpcs_pma_inst_RECEIVER_RXD(5);
  gmii_rxd(4) <= U0_gpcs_pma_inst_RECEIVER_RXD(4);
  gmii_rxd(3) <= U0_gpcs_pma_inst_RECEIVER_RXD(3);
  gmii_rxd(2) <= U0_gpcs_pma_inst_RECEIVER_RXD(2);
  gmii_rxd(1) <= U0_gpcs_pma_inst_RECEIVER_RXD(1);
  gmii_rxd(0) <= U0_gpcs_pma_inst_RECEIVER_RXD(0);
  status_vector(15) <= NlwRenamedSig_OI_status_vector(7);
  status_vector(14) <= NlwRenamedSig_OI_status_vector(7);
  status_vector(13) <= NlwRenamedSig_OI_status_vector(7);
  status_vector(12) <= NlwRenamedSig_OI_status_vector(7);
  status_vector(11) <= NlwRenamedSig_OI_status_vector(7);
  status_vector(10) <= NlwRenamedSig_OI_status_vector(7);
  status_vector(9) <= NlwRenamedSig_OI_status_vector(7);
  status_vector(8) <= NlwRenamedSig_OI_status_vector(7);
  status_vector(7) <= NlwRenamedSig_OI_status_vector(7);
  status_vector(6) <= U0_gpcs_pma_inst_RXNOTINTABLE_REG_51;
  status_vector(5) <= U0_gpcs_pma_inst_RXDISPERR_REG_52;
  status_vector(4) <= NlwRenamedSig_OI_U0_gpcs_pma_inst_RECEIVER_RX_INVALID;
  status_vector(3) <= U0_gpcs_pma_inst_RECEIVER_RUDI_I_54;
  status_vector(2) <= U0_gpcs_pma_inst_RECEIVER_RUDI_C_55;
  status_vector(1) <= NlwRenamedSignal_U0_gpcs_pma_inst_STATUS_VECTOR_0;
  status_vector(0) <= NlwRenamedSignal_U0_gpcs_pma_inst_STATUS_VECTOR_0;
  mgt_rx_reset <= NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT;
  mgt_tx_reset <= NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT;
  powerdown <= NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(2);
  txchardispmode <= U0_gpcs_pma_inst_TXCHARDISPMODE_60;
  txchardispval <= U0_gpcs_pma_inst_TXCHARDISPVAL_61;
  txcharisk <= U0_gpcs_pma_inst_TXCHARISK_62;
  enablealign <= NlwRenamedSig_OI_U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN;
  gmii_rx_dv <= NlwRenamedSig_OI_U0_gpcs_pma_inst_RECEIVER_RX_DV;
  gmii_rx_er <= U0_gpcs_pma_inst_RECEIVER_RX_ER_65;
  gmii_isolate <= NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3);
  XST_VCC : VCC
    port map (
      P => N0
    );
  XST_GND : GND
    port map (
      G => NlwRenamedSig_OI_status_vector(7)
    );
  U0_gpcs_pma_inst_DELAY_RXNOTINTABLE : SRL16
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_status_vector(7),
      A1 => NlwRenamedSig_OI_status_vector(7),
      A2 => N0,
      A3 => NlwRenamedSig_OI_status_vector(7),
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXNOTINTABLE_INT_104,
      Q => U0_gpcs_pma_inst_RXNOTINTABLE_SRL
    );
  U0_gpcs_pma_inst_DELAY_RXDISPERR : SRL16
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_status_vector(7),
      A1 => NlwRenamedSig_OI_status_vector(7),
      A2 => N0,
      A3 => NlwRenamedSig_OI_status_vector(7),
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDISPERR_INT_105,
      Q => U0_gpcs_pma_inst_RXDISPERR_SRL
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_In,
      R => U0_gpcs_pma_inst_RESET_INT_RXBUFSTATUS_INT_1_OR_116_o,
      Q => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_69
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_In,
      R => U0_gpcs_pma_inst_RESET_INT_RXBUFSTATUS_INT_1_OR_116_o,
      Q => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_70
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_In,
      R => U0_gpcs_pma_inst_RESET_INT_RXBUFSTATUS_INT_1_OR_116_o,
      Q => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_68
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_In,
      R => U0_gpcs_pma_inst_RESET_INT_TXBUFERR_INT_OR_115_o,
      Q => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_75
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_In,
      R => U0_gpcs_pma_inst_RESET_INT_TXBUFERR_INT_OR_115_o,
      Q => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_76
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_In,
      R => U0_gpcs_pma_inst_RESET_INT_TXBUFERR_INT_OR_115_o,
      Q => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_77
    );
  U0_gpcs_pma_inst_SYNC_SIGNAL_DETECT_data_sync : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => signal_detect,
      Q => U0_gpcs_pma_inst_SYNC_SIGNAL_DETECT_data_sync1
    );
  U0_gpcs_pma_inst_SYNC_SIGNAL_DETECT_data_sync_reg : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNC_SIGNAL_DETECT_data_sync1,
      Q => U0_gpcs_pma_inst_SIGNAL_DETECT_REG
    );
  U0_gpcs_pma_inst_RXNOTINTABLE_REG : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXNOTINTABLE_SRL,
      Q => U0_gpcs_pma_inst_RXNOTINTABLE_REG_51
    );
  U0_gpcs_pma_inst_RXDISPERR_REG : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDISPERR_SRL,
      Q => U0_gpcs_pma_inst_RXDISPERR_REG_52
    );
  U0_gpcs_pma_inst_TXCHARDISPVAL : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXCHARDISPVAL_INT_GND_15_o_MUX_194_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXCHARDISPVAL_61
    );
  U0_gpcs_pma_inst_TXCHARDISPMODE : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXCHARDISPMODE_INT_TXEVEN_MUX_193_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXCHARDISPMODE_60
    );
  U0_gpcs_pma_inst_TXCHARISK : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXCHARISK_INT_TXEVEN_MUX_192_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXCHARISK_62
    );
  U0_gpcs_pma_inst_TXDATA_7 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_7_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(7)
    );
  U0_gpcs_pma_inst_TXDATA_6 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_6_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(6)
    );
  U0_gpcs_pma_inst_TXDATA_5 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_5_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(5)
    );
  U0_gpcs_pma_inst_TXDATA_4 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_4_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(4)
    );
  U0_gpcs_pma_inst_TXDATA_3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_3_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(3)
    );
  U0_gpcs_pma_inst_TXDATA_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_2_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(2)
    );
  U0_gpcs_pma_inst_TXDATA_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_1_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(1)
    );
  U0_gpcs_pma_inst_TXDATA_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_0_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(0)
    );
  U0_gpcs_pma_inst_RXCHARISK_INT : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXCHARISK_0_TXCHARISK_INT_MUX_185_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXCHARISK_INT_114
    );
  U0_gpcs_pma_inst_RXCHARISCOMMA_INT : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXCHARISCOMMA_0_TXCHARISK_INT_MUX_186_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXCHARISCOMMA_INT_115
    );
  U0_gpcs_pma_inst_RXDATA_INT_7 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_7_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(7)
    );
  U0_gpcs_pma_inst_RXDATA_INT_6 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_6_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(6)
    );
  U0_gpcs_pma_inst_RXDATA_INT_5 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_5_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(5)
    );
  U0_gpcs_pma_inst_RXDATA_INT_4 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_4_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(4)
    );
  U0_gpcs_pma_inst_RXDATA_INT_3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_3_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(3)
    );
  U0_gpcs_pma_inst_RXDATA_INT_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_2_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(2)
    );
  U0_gpcs_pma_inst_RXDATA_INT_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_1_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(1)
    );
  U0_gpcs_pma_inst_RXDATA_INT_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_0_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(0)
    );
  U0_gpcs_pma_inst_RXCLKCORCNT_INT_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_22_OUT_2_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXCLKCORCNT_INT(2)
    );
  U0_gpcs_pma_inst_RXCLKCORCNT_INT_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_22_OUT_1_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXCLKCORCNT_INT(1)
    );
  U0_gpcs_pma_inst_RXCLKCORCNT_INT_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_22_OUT_0_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXCLKCORCNT_INT(0)
    );
  U0_gpcs_pma_inst_RXBUFSTATUS_INT_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXBUFSTATUS_1_GND_15_o_mux_21_OUT_1_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1)
    );
  U0_gpcs_pma_inst_RXNOTINTABLE_INT : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXNOTINTABLE_0_GND_15_o_MUX_182_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXNOTINTABLE_INT_104
    );
  U0_gpcs_pma_inst_RXDISPERR_INT : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDISPERR_0_GND_15_o_MUX_183_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDISPERR_INT_105
    );
  U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_3 : FDR
    port map (
      C => userclk2,
      D => configuration_vector(3),
      R => U0_gpcs_pma_inst_SRESET_117,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3)
    );
  U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_2 : FDR
    port map (
      C => userclk2,
      D => configuration_vector(2),
      R => U0_gpcs_pma_inst_SRESET_117,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(2)
    );
  U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1 : FDR
    port map (
      C => userclk2,
      D => configuration_vector(1),
      R => U0_gpcs_pma_inst_SRESET_117,
      Q => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1)
    );
  U0_gpcs_pma_inst_SRESET : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SRESET_PIPE_PWR_15_o_MUX_1_o,
      Q => U0_gpcs_pma_inst_SRESET_117
    );
  U0_gpcs_pma_inst_TXBUFERR_INT : FDR
    port map (
      C => userclk2,
      D => txbuferr,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXBUFERR_INT_99
    );
  U0_gpcs_pma_inst_SRESET_PIPE : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RESET_INT_124,
      Q => U0_gpcs_pma_inst_SRESET_PIPE_118
    );
  U0_gpcs_pma_inst_MGT_RX_RESET_INT : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RX_RST_SM_3_GND_15_o_Mux_17_o,
      S => U0_gpcs_pma_inst_RESET_INT_RXBUFSTATUS_INT_1_OR_116_o,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT
    );
  U0_gpcs_pma_inst_MGT_TX_RESET_INT : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TX_RST_SM_3_GND_15_o_Mux_13_o,
      S => U0_gpcs_pma_inst_RESET_INT_TXBUFERR_INT_OR_115_o,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT
    );
  U0_gpcs_pma_inst_RESET_INT : FDP
    port map (
      C => userclk,
      D => U0_gpcs_pma_inst_RESET_INT_PIPE_123,
      PRE => U0_gpcs_pma_inst_DCM_LOCKED_SOFT_RESET_OR_2_o,
      Q => U0_gpcs_pma_inst_RESET_INT_124
    );
  U0_gpcs_pma_inst_RESET_INT_PIPE : FDP
    port map (
      C => userclk,
      D => NlwRenamedSig_OI_status_vector(7),
      PRE => U0_gpcs_pma_inst_DCM_LOCKED_SOFT_RESET_OR_2_o,
      Q => U0_gpcs_pma_inst_RESET_INT_PIPE_123
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_Result(1),
      S => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_0 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_Result(0),
      S => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_7 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_7_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(7)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_6 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_6_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(6)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_5 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_5_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(5)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_4 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_4_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(4)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_3_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(3)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_2_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(2)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_1_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(1)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_0_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(0)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXCHARISK : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_GND_22_o_MUX_79_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXCHARISK_129
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_7_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(7)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_6 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_6_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(6)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_5 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_5_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(5)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_4 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_4_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(4)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_3 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_3_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(3)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_2 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_2_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(2)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_1_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(1)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_0 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_0_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(0)
    );
  U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_CODE_GRP_CNT_1_MUX_73_o,
      Q => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_193
    );
  U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT : FDSE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_22_o_Mux_5_o,
      D => NlwRenamedSig_OI_status_vector(7),
      S => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_188
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPMODE : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_EVEN_AND_42_o,
      S => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPMODE_128
    );
  U0_gpcs_pma_inst_TRANSMITTER_XMIT_DATA_INT : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_22_o_Mux_5_o,
      D => N0,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_XMIT_DATA_INT_189
    );
  U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_S : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_EVEN_AND_8_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_S_196
    );
  U0_gpcs_pma_inst_TRANSMITTER_T : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_T_OR_14_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_T_195
    );
  U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_22_o_Mux_5_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(3)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_7_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(2)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_n0235(1),
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(1)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_ER_REG1 : FD
    port map (
      C => userclk2,
      D => gmii_tx_er,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TX_ER_REG1_210
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1 : FD
    port map (
      C => userclk2,
      D => gmii_tx_en,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_211
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_7 : FD
    port map (
      C => userclk2,
      D => gmii_txd(7),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(7)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_6 : FD
    port map (
      C => userclk2,
      D => gmii_txd(6),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(6)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_5 : FD
    port map (
      C => userclk2,
      D => gmii_txd(5),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(5)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_4 : FD
    port map (
      C => userclk2,
      D => gmii_txd(4),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(4)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_3 : FD
    port map (
      C => userclk2,
      D => gmii_txd(3),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(3)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_2 : FD
    port map (
      C => userclk2,
      D => gmii_txd(2),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(2)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_1 : FD
    port map (
      C => userclk2,
      D => gmii_txd(1),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(1)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_0 : FD
    port map (
      C => userclk2,
      D => gmii_txd(0),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(0)
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_In2,
      R => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In1_0,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_221
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_In2,
      R => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In1_0,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_222
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In2_225,
      R => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In1_0,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_224
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_In3,
      R => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In1_0,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_223
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_SYNCHRONISATION_n0103_inv,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_GND_24_o_mux_30_OUT_1_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(1)
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_0 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_SYNCHRONISATION_n0103_inv,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_GND_24_o_mux_30_OUT_0_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(0)
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_SIGNAL_DETECT_REG : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SIGNAL_DETECT_REG,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_SIGNAL_DETECT_REG_236
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_7 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_7_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(7)
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_6 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_6_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(6)
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_5 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_5_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(5)
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_4 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_4_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(4)
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_3_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(3)
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_2_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(2)
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_1_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(1)
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_0_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(0)
    );
  U0_gpcs_pma_inst_RECEIVER_C_REG3 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_C_REG2_238,
      Q => U0_gpcs_pma_inst_RECEIVER_C_REG3_318
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG2,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_51_o,
      Q => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_296
    );
  U0_gpcs_pma_inst_RECEIVER_CGBAD_REG3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_CGBAD_REG2,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_CGBAD_REG3_299
    );
  U0_gpcs_pma_inst_RECEIVER_SOP_REG3 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_SOP_REG2_313,
      Q => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_312
    );
  U0_gpcs_pma_inst_RECEIVER_C_REG2 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_C_REG1_319,
      Q => U0_gpcs_pma_inst_RECEIVER_C_REG2_238
    );
  U0_gpcs_pma_inst_RECEIVER_IDLE_REG_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_IDLE_REG(1),
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_IDLE_REG(2)
    );
  U0_gpcs_pma_inst_RECEIVER_IDLE_REG_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_IDLE_REG(0),
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_IDLE_REG(1)
    );
  U0_gpcs_pma_inst_RECEIVER_IDLE_REG_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_I_REG_320,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_IDLE_REG(0)
    );
  U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG1_284,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_51_o,
      Q => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG2_283
    );
  U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG1_288,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_51_o,
      Q => U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG2_287
    );
  U0_gpcs_pma_inst_RECEIVER_C_REG1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_C_326,
      Q => U0_gpcs_pma_inst_RECEIVER_C_REG1_319
    );
  U0_gpcs_pma_inst_RECEIVER_T_REG2 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_T_REG1_323,
      Q => U0_gpcs_pma_inst_RECEIVER_T_REG2_322
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(2),
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(3)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(1),
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(2)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(0),
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(1)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_298,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(0)
    );
  U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_285,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_51_o,
      Q => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG1_284
    );
  U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_289,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_51_o,
      Q => U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG1_288
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXTEND_269,
      Q => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_311
    );
  U0_gpcs_pma_inst_RECEIVER_I_REG : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_I_327,
      Q => U0_gpcs_pma_inst_RECEIVER_I_REG_320
    );
  U0_gpcs_pma_inst_RECEIVER_R_REG1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_R_301,
      Q => U0_gpcs_pma_inst_RECEIVER_R_REG1_321
    );
  U0_gpcs_pma_inst_RECEIVER_T_REG1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_T_328,
      Q => U0_gpcs_pma_inst_RECEIVER_T_REG1_323
    );
  U0_gpcs_pma_inst_RECEIVER_RUDI_I : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_IDLE_REG_1_IDLE_REG_2_OR_114_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RUDI_I_54
    );
  U0_gpcs_pma_inst_RECEIVER_RUDI_C : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_0_RX_CONFIG_VALID_REG_3_OR_113_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RUDI_C_55
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_K : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_7_RXNOTINTABLE_AND_211_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_FALSE_K_281
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_DATA : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_203_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_282
    );
  U0_gpcs_pma_inst_RECEIVER_RX_ER : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_ISOLATE_AND_182_o_258,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_ER_65
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_ERR : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3_EXT_ILLEGAL_K_REG2_OR_83_o,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_51_o,
      Q => U0_gpcs_pma_inst_RECEIVER_EXTEND_ERR_286
    );
  U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_K28p5_REG1_AND_167_o,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_51_o,
      Q => U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_289
    );
  U0_gpcs_pma_inst_RECEIVER_EOP : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_64_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_EOP_292
    );
  U0_gpcs_pma_inst_RECEIVER_SOP : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_S_WAIT_FOR_K_AND_144_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_SOP_293
    );
  U0_gpcs_pma_inst_RECEIVER_EOP_REG1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EOP_EXTEND_OR_65_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_EOP_REG1_291
    );
  U0_gpcs_pma_inst_RECEIVER_FROM_RX_CX : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_C_REG1_C_REG3_OR_59_o_242,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_51_o,
      Q => U0_gpcs_pma_inst_RECEIVER_FROM_RX_CX_294
    );
  U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_REG : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_119,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_51_o,
      Q => U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_REG_297
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_C_REG1_AND_125_o_259,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_298
    );
  U0_gpcs_pma_inst_RECEIVER_R : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_K23p7,
      Q => U0_gpcs_pma_inst_RECEIVER_R_301
    );
  U0_gpcs_pma_inst_RECEIVER_CGBAD : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXFIFO_ERR_RXDISPERR_OR_36_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_CGBAD_300
    );
  U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXCHARISK_INT_114,
      Q => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_317
    );
  U0_gpcs_pma_inst_RECEIVER_D0p0_REG : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_D0p0_244,
      Q => U0_gpcs_pma_inst_RECEIVER_D0p0_REG_324
    );
  U0_gpcs_pma_inst_RECEIVER_K28p5_REG1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_K28p5,
      Q => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_325
    );
  U0_gpcs_pma_inst_RECEIVER_I : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EVEN_RXCHARISK_AND_115_o_260,
      Q => U0_gpcs_pma_inst_RECEIVER_I_327
    );
  U0_gpcs_pma_inst_RECEIVER_S : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_111_o,
      Q => U0_gpcs_pma_inst_RECEIVER_S_329
    );
  U0_gpcs_pma_inst_RECEIVER_T : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_K29p7,
      Q => U0_gpcs_pma_inst_RECEIVER_T_328
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_In1 : LUT4
    generic map(
      INIT => X"EA6A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_76,
      I1 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_78,
      I2 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_77,
      I3 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_75,
      O => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_In
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_In1 : LUT4
    generic map(
      INIT => X"EA6A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_69,
      I1 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_71,
      I2 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_70,
      I3 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_68,
      O => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_In
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_In1 : LUT4
    generic map(
      INIT => X"E666"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_70,
      I1 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_71,
      I2 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_68,
      I3 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_69,
      O => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_In
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_In1 : LUT4
    generic map(
      INIT => X"E666"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_77,
      I1 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_78,
      I2 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_75,
      I3 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_76,
      O => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_In
    );
  U0_gpcs_pma_inst_Mmux_TXCHARDISPVAL_INT_GND_15_o_MUX_194_o11 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL_127,
      O => U0_gpcs_pma_inst_TXCHARDISPVAL_INT_GND_15_o_MUX_194_o
    );
  U0_gpcs_pma_inst_Mmux_TXCHARDISPMODE_INT_TXEVEN_MUX_193_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPMODE_128,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TXCHARDISPMODE_INT_TXEVEN_MUX_193_o
    );
  U0_gpcs_pma_inst_Mmux_TXCHARISK_INT_TXEVEN_MUX_192_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXCHARISK_129,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TXCHARISK_INT_TXEVEN_MUX_192_o
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_30_OUT11 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(0),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_0_Q
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_30_OUT21 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(1),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_1_Q
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_30_OUT31 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(2),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_2_Q
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_30_OUT41 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(3),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_3_Q
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_30_OUT51 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(4),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_4_Q
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_30_OUT61 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(5),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_5_Q
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_30_OUT71 : LUT3
    generic map(
      INIT => X"4E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(6),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_6_Q
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_30_OUT81 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(7),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_30_OUT_7_Q
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_20_OUT11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => rxdata(0),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(0),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_0_Q
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_20_OUT21 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => rxdata(1),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(1),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_1_Q
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_20_OUT31 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => rxdata(2),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(2),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_2_Q
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_20_OUT41 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => rxdata(3),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(3),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_3_Q
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_20_OUT51 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => rxdata(4),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(4),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_4_Q
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_20_OUT61 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => rxdata(5),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(5),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_5_Q
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_20_OUT71 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => rxdata(6),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(6),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_6_Q
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_20_OUT81 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => rxdata(7),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(7),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_20_OUT_7_Q
    );
  U0_gpcs_pma_inst_Mmux_RXCHARISCOMMA_0_TXCHARISK_INT_MUX_186_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => rxchariscomma(0),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXCHARISK_129,
      O => U0_gpcs_pma_inst_RXCHARISCOMMA_0_TXCHARISK_INT_MUX_186_o
    );
  U0_gpcs_pma_inst_Mmux_RXCHARISK_0_TXCHARISK_INT_MUX_185_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => rxcharisk(0),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXCHARISK_129,
      O => U0_gpcs_pma_inst_RXCHARISK_0_TXCHARISK_INT_MUX_185_o
    );
  U0_gpcs_pma_inst_Mmux_SRESET_PIPE_PWR_15_o_MUX_1_o11 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RESET_INT_124,
      I1 => U0_gpcs_pma_inst_SRESET_PIPE_118,
      O => U0_gpcs_pma_inst_SRESET_PIPE_PWR_15_o_MUX_1_o
    );
  U0_gpcs_pma_inst_Mmux_RXNOTINTABLE_0_GND_15_o_MUX_182_o11 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => rxnotintable(0),
      O => U0_gpcs_pma_inst_RXNOTINTABLE_0_GND_15_o_MUX_182_o
    );
  U0_gpcs_pma_inst_Mmux_RXDISPERR_0_GND_15_o_MUX_183_o11 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => rxdisperr(0),
      O => U0_gpcs_pma_inst_RXDISPERR_0_GND_15_o_MUX_183_o
    );
  U0_gpcs_pma_inst_Mmux_RXCLKCORCNT_2_GND_15_o_mux_22_OUT11 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => rxclkcorcnt(0),
      O => U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_22_OUT_0_Q
    );
  U0_gpcs_pma_inst_Mmux_RXCLKCORCNT_2_GND_15_o_mux_22_OUT21 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => rxclkcorcnt(1),
      O => U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_22_OUT_1_Q
    );
  U0_gpcs_pma_inst_Mmux_RXCLKCORCNT_2_GND_15_o_mux_22_OUT31 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => rxclkcorcnt(2),
      O => U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_22_OUT_2_Q
    );
  U0_gpcs_pma_inst_Mmux_RXBUFSTATUS_1_GND_15_o_mux_21_OUT21 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I1 => rxbufstatus(1),
      O => U0_gpcs_pma_inst_RXBUFSTATUS_1_GND_15_o_mux_21_OUT_1_Q
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_In1 : LUT4
    generic map(
      INIT => X"FF80"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_71,
      I1 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_70,
      I2 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_69,
      I3 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_68,
      O => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_In
    );
  U0_gpcs_pma_inst_RX_RST_SM_RX_RST_SM_3_GND_15_o_Mux_17_o1 : LUT4
    generic map(
      INIT => X"DFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_70,
      I1 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_71,
      I2 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_68,
      I3 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_69,
      O => U0_gpcs_pma_inst_RX_RST_SM_3_GND_15_o_Mux_17_o
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_In1 : LUT4
    generic map(
      INIT => X"FF80"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_78,
      I1 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_77,
      I2 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_76,
      I3 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_75,
      O => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_In
    );
  U0_gpcs_pma_inst_TX_RST_SM_TX_RST_SM_3_GND_15_o_Mux_13_o1 : LUT4
    generic map(
      INIT => X"DFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_77,
      I1 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_78,
      I2 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_75,
      I3 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_76,
      O => U0_gpcs_pma_inst_TX_RST_SM_3_GND_15_o_Mux_13_o
    );
  U0_gpcs_pma_inst_RESET_INT_RXBUFSTATUS_INT_1_OR_116_o1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RESET_INT_124,
      I1 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      O => U0_gpcs_pma_inst_RESET_INT_RXBUFSTATUS_INT_1_OR_116_o
    );
  U0_gpcs_pma_inst_RESET_INT_TXBUFERR_INT_OR_115_o1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RESET_INT_124,
      I1 => U0_gpcs_pma_inst_TXBUFERR_INT_99,
      O => U0_gpcs_pma_inst_RESET_INT_TXBUFERR_INT_OR_115_o
    );
  U0_gpcs_pma_inst_DCM_LOCKED_SOFT_RESET_OR_2_o1 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => reset,
      I1 => dcm_locked,
      O => U0_gpcs_pma_inst_DCM_LOCKED_SOFT_RESET_OR_2_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT51 : LUT4
    generic map(
      INIT => X"CFCA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(4),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(2),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_188,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT511,
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_4_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT61 : LUT4
    generic map(
      INIT => X"CFCA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(5),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(2),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_188,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT511,
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_5_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT81 : LUT4
    generic map(
      INIT => X"CFCA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(7),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(2),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_188,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT511,
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_7_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT5111 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_R_186,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_V_185,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_T_195,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_187,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_S_197,
      I5 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      O => U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT511
    );
  U0_gpcs_pma_inst_TRANSMITTER_DISP51 : LUT5
    generic map(
      INIT => X"E881811F"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(3),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(4),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(1),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(2),
      I4 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_DISP5
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_7_1 : LUT3
    generic map(
      INIT => X"15"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_190,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_7_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_T_OR_14_o1 : LUT6
    generic map(
      INIT => X"FFFF444044404440"
    )
    port map (
      I0 => gmii_tx_en,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_211,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_S_197,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_187,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T_194,
      I5 => U0_gpcs_pma_inst_TRANSMITTER_V_185,
      O => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_T_OR_14_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_S_OR_12_o11 : LUT6
    generic map(
      INIT => X"FFFFFFFF45455545"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_S_196,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_211,
      I2 => gmii_tx_en,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I4 => U0_gpcs_pma_inst_TRANSMITTER_TX_ER_REG1_210,
      I5 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      O => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_S_OR_12_o_0
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mcount_CODE_GRP_CNT_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_Result(1)
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_22_o_Mux_5_o1 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_22_o_Mux_5_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_EN_EVEN_AND_8_o1 : LUT4
    generic map(
      INIT => X"0040"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_TX_ER_REG1_210,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I2 => gmii_tx_en,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_211,
      O => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_EVEN_AND_8_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_EVEN_AND_42_o1 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_193,
      O => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_EVEN_AND_42_o
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_Mmux_GOOD_CGS_1_GND_24_o_mux_30_OUT21 : LUT6
    generic map(
      INIT => X"0000577757770000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_224,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_221,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_222,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_223,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(0),
      I5 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(1),
      O => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_GND_24_o_mux_30_OUT_1_Q
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_n0103_inv1 : LUT5
    generic map(
      INIT => X"A888FFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_224,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_221,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_223,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_222,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_n0103_inv
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_Mmux_GOOD_CGS_1_GND_24_o_mux_30_OUT11 : LUT5
    generic map(
      INIT => X"01115555"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(0),
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_221,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_223,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_222,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_224,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_GND_24_o_mux_30_OUT_0_Q
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_In21 : LUT6
    generic map(
      INIT => X"D8B0D8B0E8E0F8F0"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_224,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_222,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_221,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_223,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_PWR_20_o_equal_19_o,
      I5 => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_In2
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In1_01 : LUT3
    generic map(
      INIT => X"F1"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_SIGNAL_DETECT_REG_236,
      I1 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(1),
      I2 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In1_0
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_PWR_20_o_equal_19_o_1_1 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(0),
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(1),
      O => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_PWR_20_o_equal_19_o
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD1 : LUT5
    generic map(
      INIT => X"FFFEFEFE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I1 => U0_gpcs_pma_inst_RXNOTINTABLE_INT_104,
      I2 => U0_gpcs_pma_inst_RXDISPERR_INT_105,
      I3 => U0_gpcs_pma_inst_RXCHARISCOMMA_INT_115,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_120,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_25_o_mux_9_OUT21 : LUT4
    generic map(
      INIT => X"5554"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_312,
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_311,
      I2 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_296,
      I3 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(1),
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_1_Q
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_25_o_mux_9_OUT41 : LUT4
    generic map(
      INIT => X"5554"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_312,
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_311,
      I2 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_296,
      I3 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(3),
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_3_Q
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_25_o_mux_9_OUT31 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(2),
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_311,
      I2 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_296,
      I3 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_312,
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_2_Q
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_25_o_mux_9_OUT61 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(5),
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_311,
      I2 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_312,
      I3 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_296,
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_5_Q
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_25_o_mux_9_OUT81 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(7),
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_311,
      I2 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_312,
      I3 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_296,
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_7_Q
    );
  U0_gpcs_pma_inst_RECEIVER_K29p71 : LUT4
    generic map(
      INIT => X"0800"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I3 => U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_111_o1_237,
      O => U0_gpcs_pma_inst_RECEIVER_K29p7
    );
  U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_111_o11 : LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(0),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I5 => U0_gpcs_pma_inst_RXCHARISK_INT_114,
      O => U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_111_o1_237
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_25_o_mux_9_OUT11 : LUT4
    generic map(
      INIT => X"FF54"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_296,
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_311,
      I2 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(0),
      I3 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_312,
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_0_Q
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_25_o_mux_9_OUT51 : LUT5
    generic map(
      INIT => X"FFFF4540"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_296,
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_ERR_286,
      I2 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_311,
      I3 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(4),
      I4 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_312,
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_4_Q
    );
  U0_gpcs_pma_inst_RECEIVER_S_WAIT_FOR_K_AND_144_o1 : LUT5
    generic map(
      INIT => X"08080800"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_119,
      I1 => U0_gpcs_pma_inst_RECEIVER_S_329,
      I2 => U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_272,
      I3 => U0_gpcs_pma_inst_RECEIVER_EXTEND_269,
      I4 => U0_gpcs_pma_inst_RECEIVER_I_REG_320,
      O => U0_gpcs_pma_inst_RECEIVER_S_WAIT_FOR_K_AND_144_o
    );
  U0_gpcs_pma_inst_RECEIVER_K23p71 : LUT4
    generic map(
      INIT => X"2000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I3 => U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_111_o1_237,
      O => U0_gpcs_pma_inst_RECEIVER_K23p7
    );
  U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_111_o1 : LUT5
    generic map(
      INIT => X"00200000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I3 => U0_gpcs_pma_inst_RECEIVER_RXFIFO_ERR_RXDISPERR_OR_36_o,
      I4 => U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_111_o1_237,
      O => U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_111_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_25_o_mux_9_OUT71 : LUT4
    generic map(
      INIT => X"FF10"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_296,
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_311,
      I2 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(6),
      I3 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_312,
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_25_o_mux_9_OUT_6_Q
    );
  U0_gpcs_pma_inst_RECEIVER_IDLE_REG_1_IDLE_REG_2_OR_114_o1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_IDLE_REG(1),
      I1 => U0_gpcs_pma_inst_RECEIVER_IDLE_REG(2),
      O => U0_gpcs_pma_inst_RECEIVER_IDLE_REG_1_IDLE_REG_2_OR_114_o
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_0_RX_CONFIG_VALID_REG_3_OR_113_o_0_1 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(0),
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(1),
      I2 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(2),
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(3),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_0_RX_CONFIG_VALID_REG_3_OR_113_o
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3_EXT_ILLEGAL_K_REG2_OR_83_o1 : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG2_283,
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3_310,
      I2 => U0_gpcs_pma_inst_RECEIVER_CGBAD_REG3_299,
      O => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3_EXT_ILLEGAL_K_REG2_OR_83_o
    );
  U0_gpcs_pma_inst_RECEIVER_EOP_EXTEND_OR_65_o1 : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_EOP_292,
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_269,
      I2 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_311,
      O => U0_gpcs_pma_inst_RECEIVER_EOP_EXTEND_OR_65_o
    );
  U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_K28p5_REG1_AND_167_o1 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_317,
      I1 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_325,
      I2 => U0_gpcs_pma_inst_RECEIVER_R_301,
      I3 => U0_gpcs_pma_inst_RECEIVER_T_328,
      O => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_K28p5_REG1_AND_167_o
    );
  U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_EVEN_AND_127_o1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_325,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_120,
      O => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_EVEN_AND_127_o
    );
  U0_gpcs_pma_inst_RECEIVER_RXFIFO_ERR_RXDISPERR_OR_36_o1 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I1 => U0_gpcs_pma_inst_RXNOTINTABLE_INT_104,
      I2 => U0_gpcs_pma_inst_RXDISPERR_INT_105,
      O => U0_gpcs_pma_inst_RECEIVER_RXFIFO_ERR_RXDISPERR_OR_36_o
    );
  U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_51_o1 : LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_119,
      I1 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      O => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_51_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT3_SW0 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_V_185,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(2),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_T_195,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_R_186,
      O => N2
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT3 : LUT6
    generic map(
      INIT => X"FFFFBBAB55551101"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_188,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_S_197,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_187,
      I3 => N2,
      I4 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      I5 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(2),
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_2_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT4_SW0 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_V_185,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_T_195,
      I2 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_S_197,
      O => N6
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT4 : LUT6
    generic map(
      INIT => X"FFFFBBAB55551101"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_188,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_R_186,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_187,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(3),
      I4 => N6,
      I5 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(3),
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_3_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT7_SW0 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_V_185,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_T_195,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_R_186,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_S_197,
      O => N8
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT7 : LUT6
    generic map(
      INIT => X"DDDDDCCC11111000"
    )
    port map (
      I0 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_188,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_187,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(6),
      I4 => N8,
      I5 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(1),
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_6_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_20_o1 : LUT6
    generic map(
      INIT => X"FFFFFFFDFFFFFFFF"
    )
    port map (
      I0 => gmii_txd(3),
      I1 => gmii_txd(7),
      I2 => gmii_txd(4),
      I3 => gmii_txd(5),
      I4 => gmii_txd(6),
      I5 => gmii_txd(2),
      O => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_20_o1_333
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_20_o2 : LUT6
    generic map(
      INIT => X"A8AAAAAA20222222"
    )
    port map (
      I0 => gmii_tx_er,
      I1 => gmii_tx_en,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_20_o1_333,
      I3 => gmii_txd(0),
      I4 => gmii_txd(1),
      I5 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_187,
      O => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_20_o2_334
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT21 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF5540"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_T_195,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(1),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_187,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_R_186,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_S_197,
      I5 => U0_gpcs_pma_inst_TRANSMITTER_V_185,
      O => U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT2
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT22 : LUT4
    generic map(
      INIT => X"8B88"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_188,
      I2 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT2,
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_1_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT11 : LUT6
    generic map(
      INIT => X"FFFFFFFF55555540"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_V_185,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(0),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_187,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_T_195,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_R_186,
      I5 => U0_gpcs_pma_inst_TRANSMITTER_S_197,
      O => U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT1
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT12 : LUT4
    generic map(
      INIT => X"8B88"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(0),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_188,
      I2 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_18_o_CONFIG_DATA_7_mux_21_OUT1,
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_18_o_CONFIG_DATA_7_mux_21_OUT_0_Q
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_ISOLATE_AND_182_o_SW0 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      I1 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(2),
      O => N14
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_ISOLATE_AND_182_o : LUT6
    generic map(
      INIT => X"5555555144444440"
    )
    port map (
      I0 => N14,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_119,
      I2 => U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_290,
      I3 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_296,
      I4 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_311,
      I5 => U0_gpcs_pma_inst_RECEIVER_RECEIVE_270,
      O => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_ISOLATE_AND_182_o_258
    );
  U0_gpcs_pma_inst_RECEIVER_EVEN_RXCHARISK_AND_115_o_SW0 : LUT4
    generic map(
      INIT => X"AAA8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_I_REG_320,
      I1 => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_280,
      I2 => U0_gpcs_pma_inst_RECEIVER_FALSE_K_281,
      I3 => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_282,
      O => N18
    );
  U0_gpcs_pma_inst_RECEIVER_EVEN_RXCHARISK_AND_115_o : LUT6
    generic map(
      INIT => X"00000000A0A88088"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_120,
      I1 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_325,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_119,
      I3 => U0_gpcs_pma_inst_RXCHARISK_INT_114,
      I4 => N18,
      I5 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_D21p5_AND_116_o_norst,
      O => U0_gpcs_pma_inst_RECEIVER_EVEN_RXCHARISK_AND_115_o_260
    );
  U0_gpcs_pma_inst_RECEIVER_K28p51_SW0 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(0),
      I1 => U0_gpcs_pma_inst_RXCHARISK_INT_114,
      O => N20
    );
  U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_38_o1 : LUT6
    generic map(
      INIT => X"4000000000000000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(0),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I5 => U0_gpcs_pma_inst_RXDATA_INT(5),
      O => U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_38_o
    );
  U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_38_o2 : LUT6
    generic map(
      INIT => X"0000000400000000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I5 => U0_gpcs_pma_inst_RXDATA_INT(1),
      O => U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_38_o1_341
    );
  U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_38_o3 : LUT6
    generic map(
      INIT => X"0013001100030000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(0),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I3 => U0_gpcs_pma_inst_RXCHARISK_INT_114,
      I4 => U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_38_o,
      I5 => U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_38_o1_341,
      O => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_D21p5_AND_116_o_norst
    );
  U0_gpcs_pma_inst_RECEIVER_D0p0_SW0 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I2 => U0_gpcs_pma_inst_RXCHARISK_INT_114,
      I3 => U0_gpcs_pma_inst_RXDATA_INT(0),
      O => N22
    );
  U0_gpcs_pma_inst_RECEIVER_D0p0 : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I5 => N22,
      O => U0_gpcs_pma_inst_RECEIVER_D0p0_244
    );
  U0_gpcs_pma_inst_RECEIVER_C_REG1_C_REG3_OR_59_o_SW0 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_C_REG1_319,
      I1 => U0_gpcs_pma_inst_RECEIVER_C_REG2_238,
      O => N24
    );
  U0_gpcs_pma_inst_RECEIVER_C_REG1_C_REG3_OR_59_o : LUT6
    generic map(
      INIT => X"FFFF8AAACEEE8AAA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_C_REG3_318,
      I1 => U0_gpcs_pma_inst_RECEIVER_CGBAD_300,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_120,
      I3 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_325,
      I4 => N24,
      I5 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_317,
      O => U0_gpcs_pma_inst_RECEIVER_C_REG1_C_REG3_OR_59_o_242
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o11 : LUT6
    generic map(
      INIT => X"E8FFFFFFFFFFFFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I1 => U0_gpcs_pma_inst_RXDISPERR_INT_105,
      I2 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I5 => U0_gpcs_pma_inst_RXDATA_INT(3),
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o1
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o13 : LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I2 => U0_gpcs_pma_inst_RXCHARISK_INT_114,
      I3 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(3),
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o13_346
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o14 : LUT4
    generic map(
      INIT => X"FF17"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I1 => U0_gpcs_pma_inst_RXDISPERR_INT_105,
      I2 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I3 => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o13_346,
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o14_347
    );
  U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_64_o1 : LUT5
    generic map(
      INIT => X"88888000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_T_REG2_322,
      I1 => U0_gpcs_pma_inst_RECEIVER_R_REG1_321,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_120,
      I3 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_325,
      I4 => U0_gpcs_pma_inst_RECEIVER_R_301,
      O => U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_64_o1_348
    );
  U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_64_o2 : LUT6
    generic map(
      INIT => X"FFFFFF80FF80FF80"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_C_REG1_319,
      I1 => U0_gpcs_pma_inst_RECEIVER_D0p0_REG_324,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_120,
      I3 => U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_64_o1_348,
      I4 => U0_gpcs_pma_inst_RECEIVER_I_REG_320,
      I5 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_325,
      O => U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_64_o
    );
  U0_gpcs_pma_inst_RECEIVER_T_REG2_R_REG1_OR_79_o1 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_I_REG_320,
      I1 => U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG2_287,
      I2 => U0_gpcs_pma_inst_RECEIVER_C_REG1_319,
      I3 => U0_gpcs_pma_inst_RECEIVER_CGBAD_REG3_299,
      O => U0_gpcs_pma_inst_RECEIVER_T_REG2_R_REG1_OR_79_o1_349
    );
  U0_gpcs_pma_inst_RECEIVER_T_REG2_R_REG1_OR_79_o2 : LUT5
    generic map(
      INIT => X"54545554"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_R_REG1_321,
      I1 => U0_gpcs_pma_inst_RECEIVER_T_REG2_322,
      I2 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_325,
      I3 => U0_gpcs_pma_inst_RECEIVER_R_301,
      I4 => U0_gpcs_pma_inst_RECEIVER_T_REG1_323,
      O => U0_gpcs_pma_inst_RECEIVER_T_REG2_R_REG1_OR_79_o2_350
    );
  U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_C_REG1_AND_125_o_SW0 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_317,
      I1 => U0_gpcs_pma_inst_RECEIVER_CGBAD_300,
      O => N26
    );
  U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_C_REG1_AND_125_o : LUT6
    generic map(
      INIT => X"0010001000100000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXFIFO_ERR_RXDISPERR_OR_36_o,
      I1 => U0_gpcs_pma_inst_RXCHARISK_INT_114,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_119,
      I3 => N26,
      I4 => U0_gpcs_pma_inst_RECEIVER_C_REG1_319,
      I5 => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_315,
      O => U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_C_REG1_AND_125_o_259
    );
  U0_gpcs_pma_inst_TRANSMITTER_V : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_V_glue_set_352,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_V_185
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_glue_set_353,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_187
    );
  U0_gpcs_pma_inst_TRANSMITTER_R : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_R_glue_set_354,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_R_186
    );
  U0_gpcs_pma_inst_TRANSMITTER_DISPARITY : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_glue_rst_355,
      S => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_184
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_EVEN : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_glue_set_356,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_120
    );
  U0_gpcs_pma_inst_RECEIVER_RECEIVE : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RECEIVE_glue_set_357,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_51_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RECEIVE_270
    );
  U0_gpcs_pma_inst_RECEIVER_RX_INVALID : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_INVALID_glue_set_358,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_51_o,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_RECEIVER_RX_INVALID
    );
  U0_gpcs_pma_inst_RECEIVER_RX_DV : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_DV_glue_set_359,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_RECEIVER_RX_DV
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXTEND_glue_set_360,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_51_o,
      Q => U0_gpcs_pma_inst_RECEIVER_EXTEND_269
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_glue_set_361,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_51_o,
      Q => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_271
    );
  U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_glue_set_362,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_51_o,
      Q => U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_272
    );
  U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_rstpot_363,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_190
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_rstpot_364,
      Q => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_71
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_rstpot_365,
      Q => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_78
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_rstpot_366,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_192
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL_rstpot_367,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL_127
    );
  U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T_rstpot_368,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T_194
    );
  U0_gpcs_pma_inst_TRANSMITTER_S_rstpot : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_S_OR_12_o_0,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_DATA_INT_189,
      O => U0_gpcs_pma_inst_TRANSMITTER_S_rstpot_369
    );
  U0_gpcs_pma_inst_TRANSMITTER_S : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_S_rstpot_369,
      Q => U0_gpcs_pma_inst_TRANSMITTER_S_197
    );
  U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_0 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_0_rstpot_370,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(0)
    );
  U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_rstpot_371,
      Q => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_315
    );
  U0_gpcs_pma_inst_RECEIVER_C : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_C_rstpot_372,
      Q => U0_gpcs_pma_inst_RECEIVER_C_326
    );
  U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_rstpot_373,
      Q => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_285
    );
  U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_rstpot_374,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_290
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o12 : LUT6
    generic map(
      INIT => X"FFFFFFFFA9999995"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(0),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I2 => U0_gpcs_pma_inst_RXDISPERR_INT_105,
      I3 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I5 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o12_345
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_NIT : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_rstpot_375,
      Q => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_280
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o15_SW0 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I1 => U0_gpcs_pma_inst_RXCHARISK_INT_114,
      O => N28
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_rstpot : LUT6
    generic map(
      INIT => X"0400000004440044"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o12_345,
      I1 => U0_gpcs_pma_inst_RXNOTINTABLE_INT_104,
      I2 => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o1,
      I3 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I4 => N28,
      I5 => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_108_o14_347,
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_rstpot_375
    );
  U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_rstpot_SW0 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_R_301,
      I1 => U0_gpcs_pma_inst_RECEIVER_T_REG2_322,
      O => N34
    );
  U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_rstpot : LUT6
    generic map(
      INIT => X"00000000AAAAAA02"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RECEIVE_270,
      I1 => N34,
      I2 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_EVEN_AND_127_o,
      I3 => U0_gpcs_pma_inst_RECEIVER_T_REG2_R_REG1_OR_79_o1_349,
      I4 => U0_gpcs_pma_inst_RECEIVER_T_REG2_R_REG1_OR_79_o2_350,
      I5 => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_51_o,
      O => U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_rstpot_374
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_203_o4_SW0 : LUT5
    generic map(
      INIT => X"E8FFFFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(0),
      O => N38
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_203_o4_SW1 : LUT5
    generic map(
      INIT => X"FCBDFFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(0),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(2),
      O => N39
    );
  U0_gpcs_pma_inst_RECEIVER_K28p51_SW1 : LUT4
    generic map(
      INIT => X"DFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(2),
      O => N43
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_7_RXNOTINTABLE_AND_211_o1 : LUT6
    generic map(
      INIT => X"0010000000000010"
    )
    port map (
      I0 => N20,
      I1 => U0_gpcs_pma_inst_RXNOTINTABLE_INT_104,
      I2 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I3 => N43,
      I4 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I5 => U0_gpcs_pma_inst_RXDATA_INT(6),
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_7_RXNOTINTABLE_AND_211_o
    );
  U0_gpcs_pma_inst_RECEIVER_K28p51_SW2 : LUT3
    generic map(
      INIT => X"BF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(2),
      O => N45
    );
  U0_gpcs_pma_inst_RECEIVER_K28p52 : LUT6
    generic map(
      INIT => X"0000000004000000"
    )
    port map (
      I0 => N20,
      I1 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I5 => N45,
      O => U0_gpcs_pma_inst_RECEIVER_K28p5
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_203_o4_SW2 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXCHARISK_INT_114,
      I1 => U0_gpcs_pma_inst_RXNOTINTABLE_INT_104,
      O => N57
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_203_o5 : LUT6
    generic map(
      INIT => X"0000000400200024"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I3 => N57,
      I4 => N38,
      I5 => N39,
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_203_o
    );
  U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_38_o3_SW0 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXCHARISK_INT_114,
      I1 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_325,
      O => N59
    );
  U0_gpcs_pma_inst_RECEIVER_C_rstpot : LUT6
    generic map(
      INIT => X"0013000300110000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(0),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I3 => N59,
      I4 => U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_38_o1_341,
      I5 => U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_38_o,
      O => U0_gpcs_pma_inst_RECEIVER_C_rstpot_372
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN_rstpot_384,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_rstpot_385,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_119
    );
  U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_rstpot : LUT4
    generic map(
      INIT => X"6A2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_190,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_188,
      O => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_rstpot_363
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_glue_set : LUT3
    generic map(
      INIT => X"2F"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXCHARISCOMMA_INT_115,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_119,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_120,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_glue_set_356
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_rstpot : LUT6
    generic map(
      INIT => X"0001010101010101"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RESET_INT_124,
      I1 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I2 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_71,
      I3 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_69,
      I4 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_70,
      I5 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_68,
      O => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_rstpot_364
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_rstpot : LUT6
    generic map(
      INIT => X"0001010101010101"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RESET_INT_124,
      I1 => U0_gpcs_pma_inst_TXBUFERR_INT_99,
      I2 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_78,
      I3 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_76,
      I4 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_77,
      I5 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_75,
      O => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_rstpot_365
    );
  U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_0_rstpot : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I1 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_190,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      O => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_0_rstpot_370
    );
  U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_glue_set : LUT5
    generic map(
      INIT => X"2AFF2A2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_272,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_120,
      I2 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_325,
      I3 => U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_REG_297,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_119,
      O => U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_glue_set_362
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_glue_set : LUT3
    generic map(
      INIT => X"BA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_S_197,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_T_195,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_187,
      O => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_glue_set_353
    );
  U0_gpcs_pma_inst_RECEIVER_RECEIVE_glue_set : LUT3
    generic map(
      INIT => X"BA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_SOP_REG2_313,
      I1 => U0_gpcs_pma_inst_RECEIVER_EOP_292,
      I2 => U0_gpcs_pma_inst_RECEIVER_RECEIVE_270,
      O => U0_gpcs_pma_inst_RECEIVER_RECEIVE_glue_set_357
    );
  U0_gpcs_pma_inst_RECEIVER_RX_INVALID_glue_set : LUT3
    generic map(
      INIT => X"BA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_FROM_RX_CX_294,
      I1 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_325,
      I2 => NlwRenamedSig_OI_U0_gpcs_pma_inst_RECEIVER_RX_INVALID,
      O => U0_gpcs_pma_inst_RECEIVER_RX_INVALID_glue_set_358
    );
  U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T_rstpot : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_211,
      I1 => gmii_tx_en,
      I2 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      O => U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T_rstpot_368
    );
  U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_rstpot : LUT4
    generic map(
      INIT => X"0040"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(1),
      I1 => U0_gpcs_pma_inst_RECEIVER_C_REG2_238,
      I2 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(0),
      I3 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(2),
      O => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_rstpot_371
    );
  U0_gpcs_pma_inst_TRANSMITTER_R_glue_set : LUT5
    generic map(
      INIT => X"FFFF4440"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_S_197,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_R_186,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_TX_ER_REG1_210,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_T_195,
      O => U0_gpcs_pma_inst_TRANSMITTER_R_glue_set_354
    );
  U0_gpcs_pma_inst_RECEIVER_RX_DV_glue_set_SW0 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_EOP_REG1_291,
      I1 => NlwRenamedSig_OI_U0_gpcs_pma_inst_RECEIVER_RX_DV,
      O => N71
    );
  U0_gpcs_pma_inst_RECEIVER_RX_DV_glue_set : LUT6
    generic map(
      INIT => X"0200FFFF0200AAAA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_119,
      I1 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      I2 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(2),
      I3 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_312,
      I4 => N71,
      I5 => U0_gpcs_pma_inst_RECEIVER_RECEIVE_270,
      O => U0_gpcs_pma_inst_RECEIVER_RX_DV_glue_set_359
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_glue_set_SW1 : LUT4
    generic map(
      INIT => X"FFDF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_I_REG_320,
      I1 => U0_gpcs_pma_inst_RECEIVER_S_329,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_119,
      I3 => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_280,
      O => N73
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_glue_set : LUT6
    generic map(
      INIT => X"44444445CCCCCCCD"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_325,
      I1 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_271,
      I2 => N73,
      I3 => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_282,
      I4 => U0_gpcs_pma_inst_RECEIVER_FALSE_K_281,
      I5 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_120,
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_glue_set_361
    );
  U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_glue_rst_SW1 : LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_193,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I2 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      O => N75
    );
  U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_glue_rst : LUT6
    generic map(
      INIT => X"00000000857A7A85"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(5),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(7),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(6),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_184,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_DISP5,
      I5 => N75,
      O => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_glue_rst_355
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_glue_set_SW0 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RECEIVE_270,
      I1 => U0_gpcs_pma_inst_RECEIVER_R_REG1_321,
      O => N77
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_glue_set : LUT6
    generic map(
      INIT => X"FFFF022202220222"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_EXTEND_269,
      I1 => U0_gpcs_pma_inst_RECEIVER_S_329,
      I2 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_325,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_120,
      I4 => N77,
      I5 => U0_gpcs_pma_inst_RECEIVER_R_301,
      O => U0_gpcs_pma_inst_RECEIVER_EXTEND_glue_set_360
    );
  U0_gpcs_pma_inst_TRANSMITTER_V_glue_set_SW1 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_187,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TX_ER_REG1_210,
      O => N79
    );
  U0_gpcs_pma_inst_TRANSMITTER_V_glue_set : LUT6
    generic map(
      INIT => X"FFFF8A888A888A88"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_DATA_INT_189,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_20_o2_334,
      I2 => N79,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_211,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_V_185,
      I5 => U0_gpcs_pma_inst_TRANSMITTER_S_197,
      O => U0_gpcs_pma_inst_TRANSMITTER_V_glue_set_352
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_rstpot_SW0 : LUT4
    generic map(
      INIT => X"FFFB"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_T_195,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_187,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_S_197,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_V_185,
      O => N81
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_rstpot : LUT6
    generic map(
      INIT => X"5F5F0F0F5F5C0F0C"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_R_186,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_188,
      I3 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      I4 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I5 => N81,
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_rstpot_366
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRPISK_GND_22_o_MUX_79_o11 : LUT3
    generic map(
      INIT => X"2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_192,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_193,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_GND_22_o_MUX_79_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_22_o_mux_24_OUT11 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(0),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_193,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_184,
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_0_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_22_o_mux_24_OUT21 : LUT3
    generic map(
      INIT => X"2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_193,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_1_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_22_o_mux_24_OUT31 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(2),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_193,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_184,
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_2_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_22_o_mux_24_OUT41 : LUT3
    generic map(
      INIT => X"2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(3),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_193,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_3_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_22_o_mux_24_OUT51 : LUT4
    generic map(
      INIT => X"2AEA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(4),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_193,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_184,
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_4_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_22_o_mux_24_OUT61 : LUT3
    generic map(
      INIT => X"2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(5),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_193,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_5_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_22_o_mux_24_OUT71 : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(6),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_193,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_6_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_22_o_mux_24_OUT81 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(7),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_193,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_184,
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_22_o_mux_24_OUT_7_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_n0235_1_1 : LUT3
    generic map(
      INIT => X"20"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_190,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_n0235(1)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL_rstpot : LUT4
    generic map(
      INIT => X"0040"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_184,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_193,
      I3 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      O => U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL_rstpot_367
    );
  U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_rstpot : LUT6
    generic map(
      INIT => X"0000000000000008"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_119,
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_311,
      I2 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      I3 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_EVEN_AND_127_o,
      I4 => U0_gpcs_pma_inst_RECEIVER_R_301,
      I5 => U0_gpcs_pma_inst_RECEIVER_S_329,
      O => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_rstpot_373
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In2 : MUXF7
    port map (
      I0 => N83,
      I1 => N84,
      S => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In2_225
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In2_F : LUT6
    generic map(
      INIT => X"F0F4540400040404"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_224,
      I1 => U0_gpcs_pma_inst_RXCHARISCOMMA_INT_115,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_221,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_223,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_222,
      I5 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_PWR_20_o_equal_19_o,
      O => N83
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In2_G : LUT5
    generic map(
      INIT => X"DBDB8988"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_223,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_222,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_224,
      I3 => U0_gpcs_pma_inst_RXCHARISCOMMA_INT_115,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_221,
      O => N84
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN_rstpot : MUXF7
    port map (
      I0 => N85,
      I1 => N86,
      S => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN_rstpot_384
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN_rstpot_F : LUT6
    generic map(
      INIT => X"AAAAAA2AAAAAAB2B"
    )
    port map (
      I0 => NlwRenamedSig_OI_U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_222,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_224,
      I3 => U0_gpcs_pma_inst_RXCHARISK_INT_114,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_223,
      I5 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_221,
      O => N85
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN_rstpot_G : LUT5
    generic map(
      INIT => X"FFFFA889"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_221,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_222,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_223,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_224,
      I4 => NlwRenamedSig_OI_U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN,
      O => N86
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_rstpot : MUXF7
    port map (
      I0 => N87,
      I1 => N88,
      S => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_rstpot_385
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_rstpot_F : LUT6
    generic map(
      INIT => X"AAAAAAA8AEAAAEA8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_119,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_222,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_223,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_224,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_221,
      I5 => U0_gpcs_pma_inst_RXCHARISK_INT_114,
      O => N87
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_rstpot_G : LUT5
    generic map(
      INIT => X"222A22A8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_119,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_221,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_224,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_222,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_223,
      O => N88
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_In22 : MUXF7
    port map (
      I0 => N89,
      I1 => N90,
      S => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_In2
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_In22_F : LUT6
    generic map(
      INIT => X"F212E2A2F69AE6AA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_222,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_224,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_221,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_223,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_PWR_20_o_equal_19_o,
      I5 => U0_gpcs_pma_inst_RXCHARISK_INT_114,
      O => N89
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_In22_G : LUT3
    generic map(
      INIT => X"20"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_223,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_224,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_222,
      O => N90
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_TX_PACKET_CODE_GRP_CNT_1_MUX_73_o11 : MUXF7
    port map (
      I0 => N91,
      I1 => N92,
      S => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_188,
      O => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_CODE_GRP_CNT_1_MUX_73_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_TX_PACKET_CODE_GRP_CNT_1_MUX_73_o11_F : LUT6
    generic map(
      INIT => X"FFFFFFFF00000001"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_S_197,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_V_185,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_T_195,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_R_186,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_187,
      I5 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      O => N91
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_TX_PACKET_CODE_GRP_CNT_1_MUX_73_o11_G : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => N92
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_In32 : MUXF7
    port map (
      I0 => N93,
      I1 => N94,
      S => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_224,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_In3
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_In32_F : LUT6
    generic map(
      INIT => X"AA8AAB8AAA8AAA8A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_223,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_222,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_221,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(0),
      I5 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(1),
      O => N93
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_In32_G : LUT4
    generic map(
      INIT => X"5501"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_223,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      I2 => U0_gpcs_pma_inst_RXCHARISK_INT_114,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_221,
      O => N94
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mcount_CODE_GRP_CNT_xor_0_11_INV_0 : INV
    port map (
      I => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_Result(0)
    );
  U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_0 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_status_vector(7),
      A1 => NlwRenamedSig_OI_status_vector(7),
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_119,
      Q => U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_0_404,
      Q15 => NLW_U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_0_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_STATUS_VECTOR_0 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_0_404,
      Q => NlwRenamedSignal_U0_gpcs_pma_inst_STATUS_VECTOR_0
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_7 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => N0,
      A1 => N0,
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(7),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_7_405,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_7_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_7_405,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(7)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_6 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => N0,
      A1 => N0,
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(6),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_6_406,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_6_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_6 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_6_406,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(6)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_5 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => N0,
      A1 => N0,
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(5),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_5_407,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_5_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_5 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_5_407,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(5)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_2 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => N0,
      A1 => N0,
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(2),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_2_408,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_2_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_2 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_2_408,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(2)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_4 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => N0,
      A1 => N0,
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(4),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_4_409,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_4_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_4 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_4_409,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(4)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_3 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => N0,
      A1 => N0,
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(3),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_3_410,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_3_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_3 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_3_410,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(3)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_EXTEND_REG3 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_status_vector(7),
      A1 => NlwRenamedSig_OI_status_vector(7),
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_311,
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_EXTEND_REG3_411,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_EXTEND_REG3_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_EXTEND_REG3_411,
      Q => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3_310
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_1 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => N0,
      A1 => N0,
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(1),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_1_412,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_1_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_1 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_1_412,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(1)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_0 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => N0,
      A1 => N0,
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(0),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_0_413,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_0_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_0 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_0_413,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(0)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_CGBAD_REG2 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => N0,
      A1 => NlwRenamedSig_OI_status_vector(7),
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_CGBAD_300,
      Q => U0_gpcs_pma_inst_RECEIVER_CGBAD_REG2,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_CGBAD_REG2_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_SOP_REG2 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_status_vector(7),
      A1 => NlwRenamedSig_OI_status_vector(7),
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_SOP_293,
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_SOP_REG2_414,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_SOP_REG2_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_SOP_REG2 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_SOP_REG2_414,
      Q => U0_gpcs_pma_inst_RECEIVER_SOP_REG2_313
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_FALSE_CARRIER_REG2 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => N0,
      A1 => NlwRenamedSig_OI_status_vector(7),
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_271,
      Q => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG2,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_FALSE_CARRIER_REG2_Q15_UNCONNECTED
    );

end STRUCTURE;

-- synthesis translate_on
