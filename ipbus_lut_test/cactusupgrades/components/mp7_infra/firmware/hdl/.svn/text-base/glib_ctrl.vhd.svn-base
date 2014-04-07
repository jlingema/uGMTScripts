-- mp7_ctrl
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
use work.ipbus_reg_types.all;

entity glib_ctrl is
	generic(
		MAC_ADDR: std_logic_vector(47 downto 0) := X"000A3501EAF2";
		IP_ADDR: std_logic_vector(31 downto 0) := X"c0a80081"
	);
	port(
		gt_clkp, gt_clkn: in std_logic; -- eth serdes signals
		gt_txp, gt_txn: out std_logic;
		gt_rxp, gt_rxn: in std_logic;
		leds: out std_logic_vector(2 downto 0); -- status LEDs
		brd_ctrl: out std_logic_vector(7 downto 0); -- Clock control pins, etc
		clk_ipb: out std_logic; -- ipbus clock (nominally ~30MHz) & reset
		rst_ipb: out std_logic;
		qsel: out std_logic_vector(6 downto 0);
		buf_cfg: out std_logic_vector(5 downto 0);
		clk40: out std_logic;
		clk_fr: out std_logic; -- 125MHz free-running clock
		clk200: out std_logic; -- No BUFG on this clock (for idelayctrl)
		rsto: out std_logic;
		ipb_in_ttc: in ipb_rbus;
		ipb_out_ttc: out ipb_wbus;
		ipb_in_ttc_ctr: in ipb_rbus;
		ipb_out_ttc_ctr: out ipb_wbus;
		ipb_in_ttc_buf: in ipb_rbus;
		ipb_out_ttc_buf: out ipb_wbus;
		clk40_rst: out std_logic;
		clk40_sel: out std_logic;
		clk40_lock: in std_logic;
		clk40_stop: in std_logic
	);

end glib_ctrl;

architecture rtl of glib_ctrl is

	signal clk125_fr, clk125, clk100, ipb_clk, clk_locked, locked, eth_locked: std_logic;
	signal rsti_125, rsti_ipb, rsti_eth, onehz: std_logic;
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
	constant NSLV: positive := 6;
	signal ipbw: ipb_wbus_array(NSLV - 1 downto 0);
	signal ipbr, ipbr_d: ipb_rbus_array(NSLV - 1 downto 0);
	signal ctrl: ipb_reg_v(1 downto 0);
	signal stat: ipb_reg_v(0 downto 0);
	
begin

--	DCM clock generation for ipbus, ethernet, POR

	clocks: entity work.clocks_v6_serdes_noxtal
		port map(
			clki_125_fr => clk125_fr,
			clki_125 => clk125,
			clko_ipb => ipb_clk,
			clko_p40 => clk40,
			clko_200 => clk200,
			eth_locked => eth_locked,
			locked => clk_locked,
			nuke => ctrl(0)(0),
			rsto_125 => rsti_125,
			rsto_ipb => rsti_ipb,
			rsto_eth => rsti_eth,
			rsto => rsto,
			onehz => onehz
		);
		
	locked <= clk_locked and eth_locked;
	leds <= pkt_rx_led & locked & onehz;
	
-- Clocks for rest of logic

	clk_ipb <= ipb_clk;
	rst_ipb <= rsti_ipb;
	clk_fr <= clk125_fr;
	
--	Ethernet MAC core and PHY interface
	
	eth: entity work.eth_v6_basex
		port map(
			gt_clkp => gt_clkp,
			gt_clkn => gt_clkn,
			gt_txp => gt_txp,
			gt_txn => gt_txn,
			gt_rxp => gt_rxp,
			gt_rxn => gt_rxn,
			clk125_o => clk125,
			clk125_fr => clk125_fr,
			rst => rsti_eth,
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
			N_OOB => 0
		)
		port map(
			mac_clk => clk125,
			rst_macclk => rsti_125,
			ipb_clk => ipb_clk,
			rst_ipb => rsti_ipb,
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
			pkt_tx_led => pkt_tx_led
		);
		
	fabric: entity work.ipbus_fabric
    generic map(NSLV => NSLV)
    port map(
      ipb_clk => ipb_clk,
      rst => rsti_ipb,
      ipb_in => ipb_out_m,
      ipb_out => ipb_in_m,
      ipb_to_slaves => ipbw,
      ipb_from_slaves => ipbr
    );

  ipbr(0).ipb_rdata <= X"abcd1234";
  ipbr(0).ipb_ack <= ipbw(0).ipb_strobe;
  ipbr(0).ipb_err <= '0';
    
	slave0: entity work.ipbus_ctrlreg_v
	  generic map(
   		ctrl_addr_width => 1
   	)
		port map(
			clk => ipb_clk,
			reset => rsti_ipb,
			ipbus_in => ipbw(1),
			ipbus_out => ipbr(1),
			d => stat,
			q => ctrl
		);
	
	stat(0) <= X"0000000" & "00" & clk40_stop & clk40_lock;	
	
	clk40_rst <= ctrl(0)(2);
	clk40_sel <= ctrl(0)(3);
	buf_cfg <= ctrl(0)(13 downto 8);
	qsel <= ctrl(0)(22 downto 16);
	brd_ctrl <= ctrl(1)(7 downto 0);
		
	ipb_out_ttc <= ipbw(3);
	ipbr(3) <= ipb_in_ttc;
	
	ipb_out_ttc_ctr <= ipbw(4);
	ipbr(4) <= ipb_in_ttc_ctr;
	
	ipb_out_ttc_buf <= ipbw(5);
	ipbr(5) <= ipb_in_ttc_buf;

end rtl;

