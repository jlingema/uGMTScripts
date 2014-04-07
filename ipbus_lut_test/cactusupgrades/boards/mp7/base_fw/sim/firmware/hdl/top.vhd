-- Top-level design for MP7 base firmware
--
-- Dave Newbold, July 2012

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.ipbus.all;
use work.ipbus_trans_decl.all;
use work.mp7_data_types.all;
use work.mp7_readout_decl.all;

entity top is
end top;

architecture rtl of top is

	constant LHC_BUNCH_COUNT: integer := 128; -- Nota bene!
	constant NQUAD: integer := 4;
	constant NQUAD_MAX: integer := 18;
	constant CLOCK_RATIO: integer := 6;
	constant NREFCLK: integer := 6;

	signal clk_ipb, rst_ipb, clk160, rst160, clk240, rst240, clk40, rst40: std_logic;
	signal clk40_rst, clk40_sel, clk40_lock, clk40_stop, nuke, soft_rst: std_logic;
	signal clk_p, rst_p: std_logic;

	signal ipb_in_ctrl, ipb_in_ttc, ipb_in_datapath, ipb_in_readout, ipb_in_payload: ipb_wbus;
	signal ipb_out_ctrl, ipb_out_ttc, ipb_out_datapath, ipb_out_readout, ipb_out_payload: ipb_rbus;

	signal payload_d, payload_q: ldata(NQUAD * 4  - 1 downto 0);
	signal qsel: std_logic_vector(7 downto 0);
	signal ttc_l1a, dist_lock: std_logic;
	signal ttc_cmd, ttc_cmd_dist: std_logic_vector(3 downto 0);
	signal bunch_ctr: std_logic_vector(11 downto 0);
	signal evt_ctr, orb_ctr: std_logic_vector(23 downto 0);

	signal clkmon: std_logic_vector(2 downto 0);

	signal cap_bus: daq_cap_bus;
	signal daq_bus_top, daq_bus_bot: daq_bus;

begin

-- Clocks and control IO

	infra: entity work.mp7_infra_sim
		generic map(
			MAC_ADDR => X"000A3501EDF0",
			IP_ADDR => X"c0a8c902"
		)
		port map(
			clk_ipb => clk_ipb,
			rst_ipb => rst_ipb,
			nuke => nuke,
			soft_rst => soft_rst,			
			ipb_in_ctrl => ipb_out_ctrl,
			ipb_out_ctrl => ipb_in_ctrl,
			ipb_in_ttc => ipb_out_ttc,
			ipb_out_ttc => ipb_in_ttc,
			ipb_in_datapath => ipb_out_datapath,
			ipb_out_datapath => ipb_in_datapath,
			ipb_in_readout => ipb_out_readout,
			ipb_out_readout => ipb_in_readout,
			ipb_in_payload => ipb_out_payload,
			ipb_out_payload => ipb_in_payload
		);

-- Control registers
		
	ctrl: entity work.mp7_ctrl
		generic map(
			LHC_BUNCH_COUNT => LHC_BUNCH_COUNT,
			NQUAD => NQUAD,
			CLOCK_RATIO => CLOCK_RATIO
		)
		port map(
			clk => clk_ipb,
			rst => rst_ipb,
			ipb_in => ipb_in_ctrl,
			ipb_out => ipb_out_ctrl,
			nuke => nuke,
			soft_rst => soft_rst,			
			qsel => qsel,
			clk40_rst => clk40_rst,
			clk40_sel => clk40_sel,
			clk40_lock => clk40_lock,
			clk40_stop => clk40_stop
		);	

-- TTC signal handling		
	
	ttc: entity work.mp7_ttc_sim
		generic map(
			LHC_BUNCH_COUNT => LHC_BUNCH_COUNT
		)
		port map(
			clk => clk_ipb,
			rst => rst_ipb,
			mmcm_rst => clk40_rst,
			sel => clk40_sel,
			lock => clk40_lock,
			stop => clk40_stop,
			ipb_in => ipb_in_ttc,
			ipb_out => ipb_out_ttc,
			clk40 => clk40,
			rsto40 => rst40,
			clk160 => clk160,
			rsto160 => rst160,
			clk240 => clk240,
			rsto240 => rst240,
			ttc_in_p => '0',
			ttc_in_n => '1',
			ttc_cmd => ttc_cmd,
			ttc_cmd_dist => ttc_cmd_dist,
			ttc_l1a => ttc_l1a,
			dist_lock => dist_lock,
			bunch_ctr => bunch_ctr,
			evt_ctr => evt_ctr,
			orb_ctr => orb_ctr,
			monclk => clkmon
		);
		
	clk_p <= clk240 when CLOCK_RATIO = 6 else clk160;
	rst_p <= rst240 when CLOCK_RATIO = 6 else rst160;

-- MGTs, buffers and TTC fanout
		
	datapath: entity work.mp7_datapath
		generic map(
			NQUAD => NQUAD,
			NQUAD_MAX => NQUAD_MAX,
			CLOCK_RATIO => CLOCK_RATIO,
			LHC_BUNCH_COUNT => LHC_BUNCH_COUNT,
			NREFCLK => NREFCLK
		)
		port map(
			clk => clk_ipb,
			rst => rst_ipb,
			ipb_in => ipb_in_datapath,
			ipb_out => ipb_out_datapath,
			qsel => qsel,
			clk40 => clk40,
			clk_p => clk_p,
			rst_p => rst_p,
			ttc_cmd => ttc_cmd_dist,
			lock => dist_lock,
			cap_bus => cap_bus,
			daq_bus_in => daq_bus_top,
			daq_bus_out => daq_bus_bot,
			refclkp => (others => '0'),
			refclkn => (others => '0'),
			rxp => (others => '0'),
			rxn => (others => '0'),
			txp => open,
			txn => open,
			clkmon => clkmon,
			payload_d => payload_d,
			payload_q => payload_q
		);

-- Readout
		
	readout: entity work.mp7_readout
		generic map(
			CLOCK_RATIO => CLOCK_RATIO
		)
		port map(
			clk => clk_ipb,
			rst => rst_ipb,
			ipb_in => ipb_in_readout,
			ipb_out => ipb_out_readout,
			clk40 => clk40,
			rst40 => rst40,
			ttc_cmd => ttc_cmd,
			l1a => ttc_l1a,
			bunch_ctr => bunch_ctr,
			evt_ctr => evt_ctr,
			orb_ctr => orb_ctr,
			clk_p => clk_p,
			rst_p => rst_p,
			cap_bus => cap_bus,
			daq_bus_out => daq_bus_top,
			daq_bus_in => daq_bus_bot
		);
		
-- Payload
		
	payload: entity work.mp7_payload
		generic map(
			NCHAN => 4 * NQUAD,
			PIPELINE_STAGES => CLOCK_RATIO
		)
		port map(
			clk => clk_ipb,
			rst => rst_ipb,
			ipb_in => ipb_in_payload,
			ipb_out => ipb_out_payload,			
			clk_p => clk_p,
			d => payload_d,
			q => payload_q
		);
		
end rtl;

