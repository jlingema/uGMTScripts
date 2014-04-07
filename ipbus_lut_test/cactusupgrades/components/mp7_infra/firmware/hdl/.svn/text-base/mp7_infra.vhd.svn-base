-- mp7_infra
--
-- Wrapper for ethernet, ipbus, MMC link and associated clock / system reset
--
-- All clocks are derived from 125MHz xtal clock for backplane ethernet serdes
--
-- Dave Newbold, June 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.ipbus.all;
use work.ipbus_trans_decl.all;
use work.ipbus_decode_mp7_infra.all;

entity mp7_infra is
	generic(
		MAC_ADDR: std_logic_vector(47 downto 0);
		IP_ADDR: std_logic_vector(31 downto 0)
	);
	port(
		gt_clkp, gt_clkn: in std_logic; -- ethernet serdes signals
		gt_txp, gt_txn: out std_logic;
		gt_rxp, gt_rxn: in std_logic;
		leds: out std_logic_vector(11 downto 0); -- status LEDs
    uc_pipe_nrd: in std_logic; -- IO interface to MMC
    uc_pipe_nwe: in std_logic;
    uc_pipe: inout std_logic_vector(15 downto 0);
    uc_spi_miso: out std_logic;
    uc_spi_mosi: in std_logic;
    uc_spi_sck: in std_logic;
    uc_spi_cs_b: in std_logic;
		clk_ipb: out std_logic; -- ipbus clock (nominally ~30MHz) & reset
		rst_ipb: out std_logic;
		clk40ish: out std_logic; -- "pseudo 40MHz" clock for running without TTC
--		clk_fr: out std_logic; -- 125MHz free-running clock & reset (for reset state machines)
--		rst_fr: out std_logic;
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

end mp7_infra;

architecture rtl of mp7_infra is

	signal clk125_fr, clk125, clk200, ipb_clk, clk_locked, locked, eth_locked: std_logic;
	signal rsti_125, rsti_ipb, rsti_eth, rsti_ipb_ctrl, onehz, rsti_fr: std_logic;
	signal mac_tx_data, mac_rx_data: std_logic_vector(7 downto 0);
	signal mac_tx_valid, mac_tx_last, mac_tx_error, mac_tx_ready, mac_rx_valid, mac_rx_last, mac_rx_error: std_logic;
	signal pkt_rx_led, pkt_tx_led: std_logic;
	signal ipb_out_m: ipb_wbus;
	signal ipb_in_m: ipb_rbus;
	signal oob_in: ipbus_trans_in;
	signal oob_out: ipbus_trans_out;
	signal uc_wdata, test_wdata, uc_rdata, test_rdata, mmc_wdata, mmc_rdata: std_logic_vector(15 downto 0);
	signal uc_we, test_we, uc_re, test_re, mmc_we, mmc_re: std_logic;
	signal uc_req, test_req, uc_bdone, test_bdone, mmc_req, mmc_done: std_logic;
	signal ipbw: ipb_wbus_array(N_SLAVES - 1 downto 0);
	signal ipbr: ipb_rbus_array(N_SLAVES - 1 downto 0);
	
begin

-- DCM clock generation for ipbus, ethernet, POR

	clocks: entity work.clocks_7s_serdes
		port map(
			clki_fr => clk125_fr,
			clki_125 => clk125,
			clko_ipb => ipb_clk,
			clko_p40 => clk40ish,
			clko_200 => clk200,
			eth_locked => eth_locked,
			locked => clk_locked,
			nuke => nuke,
			soft_rst => soft_rst,
			rsto_125 => rsti_125,
			rsto_ipb => rsti_ipb,
			rsto_eth => rsti_eth,
			rsto_ipb_ctrl => rsti_ipb_ctrl,
			rsto_fr => rsti_fr,
			onehz => onehz
		);
		
	locked <= clk_locked and eth_locked;
	leds <= "11" & not pkt_tx_led & "11" & not pkt_rx_led & '1' & not locked & "111" & not onehz;

-- Clocks for rest of logic

	clk_ipb <= ipb_clk;
	rst_ipb <= rsti_ipb;
--	clk_fr <= clk125_fr;
--	rst_fr <= rsti_fr;

-- Ethernet MAC core and PHY interface
	
	eth: entity work.eth_7s_1000basex
		port map(
			gt_clkp => gt_clkp,
			gt_clkn => gt_clkn,
			gt_txp => gt_txp,
			gt_txn => gt_txn,
			gt_rxp => gt_rxp,
			gt_rxn => gt_rxn,
			clk125_out => clk125,
			clk125_fr => clk125_fr,
			rsti => rsti_eth,
			locked => eth_locked,
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
		generic map(
--      MAC_CFG => INTERNAL, -- Do not change this in base_fw yet!!!
--      IP_CFG => INTERNAL,
			N_OOB => 1
		)
		port map(
			mac_clk => clk125,
			rst_macclk => rsti_125,
			ipb_clk => ipb_clk,
			rst_ipb => rsti_ipb_ctrl,
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
			ip_addr => IP_ADDR,
			pkt_rx_led => pkt_rx_led,
			pkt_tx_led => pkt_tx_led,
			oob_in(0) => oob_in,
			oob_out(0) => oob_out
		);

-- MMC interface		

	-- uc_if: entity work.uc_if
		-- port map(
			-- clk125 => clk125_fr,
			-- rst125 => rsti_fr,
      -- clk200 => clk200,
      -- uc_pipe_nrd => uc_pipe_nrd,
      -- uc_pipe_nwe => uc_pipe_nwe,
      -- uc_pipe => uc_pipe,
      -- uc_spi_miso => uc_spi_miso,
      -- uc_spi_mosi => uc_spi_mosi,
      -- uc_spi_sck => uc_spi_sck,
      -- uc_spi_cs_b => uc_spi_cs_b,
			-- clk_ipb => ipb_clk,
			-- rst_ipb => rsti_ipb,
			-- ipb_in => ipbw(N_SLV_UC),
			-- ipb_out => ipbr(N_SLV_UC),
			-- oob_in => oob_out,
			-- oob_out => oob_in
		-- );

	ipbr(N_SLV_UC) <= IPB_RBUS_NULL;
		
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

