-- ttc_clocks
--
-- Clock generation for LHC clocks
--
-- Dave Newbold, June 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ttc_clocks_sim is
	port(
		clko_40: out std_logic;
		clko_160: out std_logic;
		clko_240: out std_logic;
		rsto_40: out std_logic;
		rsto_160: out std_logic;
		rsto_240: out std_logic;
		stopped: out std_logic;
		locked: out std_logic;
		rst_mmcm: in std_logic;
		rsti: in std_logic
	);

end ttc_clocks_sim;

architecture rtl of ttc_clocks_sim is

	signal clk40, clk160, clk240: std_logic := '1';
	
begin

	clk40 <= not clk40 after 12 ns;
	clk160 <= not clk160 after 3 ns;
	clk240 <= not clk240 after 2 ns;

	clko_40 <= clk40;
	clko_160 <= clk160;
	clko_240 <= clk240;
	rsto_40 <= rsti or rst_mmcm;
	rsto_160 <= rsti or rst_mmcm;
	rsto_240 <= rsti or rst_mmcm;
	stopped <= '0';
	locked <= '1';

end rtl;
