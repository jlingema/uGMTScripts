#!/bin/sh

rm -rf simv* csrc DVEfiles AN.DB

echo "Compiling Core Simulation Models"
vlogan +v2k -v2005 \
      ../../../tri_mode_eth_mac_v5_5.v \
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
      ../../example_design/tri_mode_eth_mac_v5_5_example_design.v \
      ../tri_mode_eth_mac_v5_5_frame_typ.v \
      ../demo_tb.v

echo "Elaborating design"
vcs +vcs+lic+wait \
      -y unisims_ver \
      -y unimacro_ver \
      -y simprims_ver \
    -debug -PP \
    demo_tb glbl

echo "Starting simulation"
./simv -ucli -i ucli_commands.key

dve -vpd vcdplus.vpd -session vcs_session.tcl


