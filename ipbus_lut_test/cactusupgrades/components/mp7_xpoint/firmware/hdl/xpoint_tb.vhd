
library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.vcomponents.all;

library work;
use work.package_utilities.all;
use work.package_types.all;

entity xpoint_tb is
end xpoint_tb;

architecture behavioral of xpoint_tb is

	signal clk, rst: std_logic := '1';

begin

	clk <= not clk after 10 ns;
	rst <= '0' after 7 ns;

	xpoint_u15: entity work.xpoint
	port map ( 
			clk_i => clk,
			rst_i => rst,
			prog_i => '1',
			done_o => open,
			sel_for_out0_i => "01",
			sel_for_out1_i => "01",
			sel_for_out2_i => "01",
			sel_for_out3_i => "11",
			load_o => open,
			config_o => open,
			sin_o => open,
			sout_o => open);

end behavioral;