-- Top-level design for MP7 base firmware
--
-- Dave Newbold, July 2012

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.ipbus.all;
use work.ipbus_trans_decl.all;

entity top is port(
		eth_clkp, eth_clkn: in std_logic;
		eth_txp, eth_txn: out std_logic;
		eth_rxp, eth_rxn: in std_logic;
		leds: out std_logic_vector(2 downto 0);
		clk_ctrl: out std_logic_vector(7 downto 0);
		clk40_in_p: in std_logic;
		clk40_in_n: in std_logic;
		ttc_in_p: in std_logic;
		ttc_in_n: in std_logic
	);
end top;

architecture rtl of top is

	signal clk_125, rst_125, clk_ipb, rst_ipb, clk_p40, clk_fr, rst: std_logic;
	signal clk200, clk40, clk240, clk40_rst, clk40_sel, clk40_lock, clk40_stop: std_logic;
	signal ipb_in_ttc, ipb_in_ttc_ctr, ipb_in_ttc_buf: ipb_wbus;
	signal ipb_out_ttc, ipb_out_ttc_ctr, ipb_out_ttc_buf: ipb_rbus;
	
begin

	ctrl: entity work.glib_ctrl
		port map(
			gt_clkp => eth_clkp,
			gt_clkn => eth_clkn,
			gt_txp => eth_txp,
			gt_txn => eth_txn,
			gt_rxp => eth_rxp,
			gt_rxn => eth_rxn,
			leds => leds,
			brd_ctrl => clk_ctrl,
			clk_ipb => clk_ipb,
			rst_ipb => rst_ipb,
			clk40 => clk_p40,
			clk_fr => clk_fr,
			clk200 => clk200,
			rsto => rst,
			ipb_in_ttc => ipb_out_ttc,
			ipb_out_ttc => ipb_in_ttc,
			ipb_in_ttc_ctr => ipb_out_ttc_ctr,
			ipb_out_ttc_ctr => ipb_in_ttc_ctr,
			ipb_in_ttc_buf => ipb_out_ttc_buf,
			ipb_out_ttc_buf => ipb_in_ttc_buf,
			clk40_rst => clk40_rst,
			clk40_sel => clk40_sel,
			clk40_lock => clk40_lock,
			clk40_stop => clk40_stop
		);

	ttc: entity work.mp7_ttc
		port map(
			clk => clk_ipb,
			rst => rst_ipb,
			clki200 => clk200,
			mmcm_rst => clk40_rst,
			sel => clk40_sel,
			lock => clk40_lock,
			stop => clk40_stop,
			ipb_in => ipb_in_ttc,
			ipb_out => ipb_out_ttc,
			ipb_in_ctr => ipb_in_ttc_ctr,
			ipb_out_ctr => ipb_out_ttc_ctr,
			ipb_in_buf => ipb_in_ttc_buf,
			ipb_out_buf => ipb_out_ttc_buf,
			clk40_in_p => clk40_in_p,
			clk40_in_n => clk40_in_n,
			clk_p40 => clk_p40,
			ttc_in_p => ttc_in_p,
			ttc_in_n => ttc_in_n
		);

end rtl;

