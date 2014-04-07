-- mp7_infra_sim
--
-- Simulation wrapper for ethernet, ipbus, MMC link and associated clock / system reset
--
-- Dave Newbold, June 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.ipbus.all;
use work.ipbus_trans_decl.all;
use work.ipbus_decode_mp7_infra.all;

entity mp7_infra_sim is
	generic(
		MAC_ADDR: std_logic_vector(47 downto 0);
		IP_ADDR: std_logic_vector(31 downto 0)
	);
	port(
		clk_ipb: out std_logic; -- ipbus clock (nominally ~30MHz) & reset
		rst_ipb: out std_logic;
		nuke: in std_logic; -- The signal of doom
		soft_rst: in std_logic; -- The signal of lesser doom
		ipb_in_ctrl: in ipb_rbus; -- ipbus signals to top-level slaves
		ipb_out_ctrl: out ipb_wbus;
		ipb_in_ttc: in ipb_rbus;
		ipb_out_ttc: out ipb_wbus;
		ipb_in_datapath: in ipb_rbus;
		ipb_out_datapath: out ipb_wbus;
		ipb_in_readout: in ipb_rbus;
		ipb_out_readout: out ipb_wbus;
		ipb_in_payload: in ipb_rbus;
		ipb_out_payload: out ipb_wbus
	);

end mp7_infra_sim;

architecture rtl of mp7_infra_sim is

	signal clk125_g, ipb_clk_g, clk40_g, rst_g, rst_ctrl, clk125_fr, clk125, ipb_clk: std_logic;
	signal mac_tx_data, mac_rx_data: std_logic_vector(7 downto 0);
	signal mac_tx_valid, mac_tx_last, mac_tx_error, mac_tx_ready, mac_rx_valid, mac_rx_last, mac_rx_error: std_logic;
	signal ipb_out_m: ipb_wbus;
	signal ipb_in_m: ipb_rbus;
	signal ipbw: ipb_wbus_array(N_SLAVES - 1 downto 0);
	signal ipbr: ipb_rbus_array(N_SLAVES - 1 downto 0);
		
begin

-- Clock generation for ipbus, ethernet, POR

	clocks: entity work.clock_sim
		port map(
			clko125 => clk125_g,
			clko25 => ipb_clk_g,
			clko40 => clk40_g,
			nuke => nuke,
			soft_rst => soft_rst,
			rsto => rst_g,
			rsto_ctrl => rst_ctrl
		);

-- Clocks for rest of logic

	clk125 <= clk125_g;
	ipb_clk <= ipb_clk_g;
	clk_ipb <= ipb_clk_g;
	rst_ipb <= rst_g;
	
--	Ethernet MAC core and PHY interface

	eth: entity work.eth_mac_sim
		generic map(
			MULTI_PACKET => true
		)
		port map(
			clk => clk125,
			rst => rst_ctrl,
			tx_data => mac_tx_data,
			tx_valid => mac_tx_valid,
			tx_last => mac_tx_last,
			tx_error => mac_tx_error,
			tx_ready => mac_tx_ready,
			rx_data => mac_rx_data,
			rx_valid => mac_rx_valid,
			rx_last => mac_rx_last,
			rx_error => mac_rx_error
		);
	
-- ipbus control logic

	ipbus: entity work.ipbus_ctrl
		port map(
			mac_clk => clk125,
			rst_macclk => rst_ctrl,
			ipb_clk => ipb_clk,
			rst_ipb => rst_ctrl,
			mac_rx_data => mac_rx_data,
			mac_rx_valid => mac_rx_valid,
			mac_rx_last => mac_rx_last,
			mac_rx_error => mac_rx_error,
			mac_tx_data => mac_tx_data,
			mac_tx_valid => mac_tx_valid,
			mac_tx_last => mac_tx_last,
			mac_tx_error => mac_tx_error,
			mac_tx_ready => mac_tx_ready,
			ipb_out => ipb_out_m,
			ipb_in => ipb_in_m,
			mac_addr => MAC_ADDR,
			ip_addr => IP_ADDR
		);

-- ipbus address decode
	
	fabric: entity work.ipbus_fabric_sel
    generic map(
    	NSLV => N_SLAVES,
    	SEL_WIDTH => IPBUS_SEL_WIDTH)
    port map(
      ipb_in => ipb_out_m,
      ipb_out => ipb_in_m,
      sel => ipbus_sel_mp7_infra(ipb_out_m.ipb_addr),
      ipb_to_slaves => ipbw,
      ipb_from_slaves => ipbr
    );

	ipb_out_ctrl <= ipbw(N_SLV_CTRL);
	ipbr(N_SLV_CTRL) <= ipb_in_ctrl;
	ipb_out_ttc <= ipbw(N_SLV_TTC);
	ipbr(N_SLV_TTC) <= ipb_in_ttc;
	ipb_out_datapath <= ipbw(N_SLV_DATAPATH);
	ipbr(N_SLV_DATAPATH) <= ipb_in_datapath;
	ipb_out_readout <= ipbw(N_SLV_READOUT);
	ipbr(N_SLV_READOUT) <= ipb_in_readout;
	ipb_out_payload <= ipbw(N_SLV_PAYLOAD);
	ipbr(N_SLV_PAYLOAD) <= ipb_in_payload;

end rtl;

