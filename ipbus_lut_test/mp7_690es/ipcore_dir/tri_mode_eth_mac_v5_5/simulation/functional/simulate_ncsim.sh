#!/bin/sh
mkdir work

echo "Compiling Tri-Mode Ethernet MAC Core Simulation Models"
ncvlog -work work ../../../tri_mode_eth_mac_v5_5.v

echo "Compiling Example Design"
ncvlog -work work \
../../example_design/fifo/tri_mode_eth_mac_v5_5_tx_client_fifo.v \
../../example_design/fifo/tri_mode_eth_mac_v5_5_rx_client_fifo.v \
../../example_design/fifo/tri_mode_eth_mac_v5_5_ten_100_1g_eth_fifo.v \
../../example_design/common/tri_mode_eth_mac_v5_5_reset_sync.v \
../../example_design/common/tri_mode_eth_mac_v5_5_sync_block.v \
../../example_design/pat_gen/tri_mode_eth_mac_v5_5_address_swap.v \
../../example_design/pat_gen/tri_mode_eth_mac_v5_5_axi_mux.v \
../../example_design/pat_gen/tri_mode_eth_mac_v5_5_axi_pat_gen.v \
../../example_design/pat_gen/tri_mode_eth_mac_v5_5_axi_pat_check.v \
../../example_design/pat_gen/tri_mode_eth_mac_v5_5_axi_pipe.v \
../../example_design/pat_gen/tri_mode_eth_mac_v5_5_basic_pat_gen.v \
../../example_design/control/tri_mode_eth_mac_v5_5_config_vector_sm.v \
../../example_design/tri_mode_eth_mac_v5_5_block.v \
../../example_design/tri_mode_eth_mac_v5_5_fifo_block.v \
../../example_design/tri_mode_eth_mac_v5_5_example_design.v

echo "Compiling Test Bench"
ncvlog -work work ../tri_mode_eth_mac_v5_5_frame_typ.v
ncvlog -work work ../demo_tb.v

echo "Elaborating design"
ncelab -access +rw work.demo_tb glbl

echo "Starting simulation"
ncsim -gui -input @"simvision -input wave_ncsim.sv" work.demo_tb
