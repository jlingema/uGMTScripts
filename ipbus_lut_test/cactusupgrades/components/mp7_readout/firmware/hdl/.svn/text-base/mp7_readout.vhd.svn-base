-- mp7_readout
--
-- All the stuff to read out data from the MP7 via ipbus or AMC13
--
-- Dave Newbold, March 2014

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.ipbus.all;
use work.mp7_readout_decl.all;

entity mp7_readout is
	generic(
		CLOCK_RATIO: positive
	);
	port(
		clk: in std_logic; -- ipbus clock, rst, bus
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		clk40: in std_logic;
		rst40: in std_logic;
		ttc_cmd: in std_logic_vector(3 downto 0);
		l1a: in std_logic;
		bunch_ctr: in std_logic_vector(11 downto 0);
		evt_ctr: in std_logic_vector(23 downto 0);
		orb_ctr: in std_logic_vector(23 downto 0);
		clk_p: in std_logic; -- data clock, rst
		rst_p: in std_logic;
		cap_bus: out daq_cap_bus; -- data capture strobes
		daq_bus_out: out daq_bus; -- DAQ daisy-chain bus
		daq_bus_in: in daq_bus
	);

end mp7_readout;

architecture rtl of mp7_readout is

	signal resync: std_logic;

begin

	resync <= '1' when ttc_cmd = X"5" else '0';

	roc: entity work.fake_roc
		port map(
			clk => clk,
			rst => rst,
			ipb_in => ipb_in,
			ipb_out => ipb_out,
			resync => resync,
			bunch_ctr => bunch_ctr,
			l1a => l1a,
			clk_p => clk_p,
			rst_p => rst_p,
			cap_bus => cap_bus,
			daq_bus_out => daq_bus_out,
			daq_bus_in => daq_bus_in
		);

end rtl;

