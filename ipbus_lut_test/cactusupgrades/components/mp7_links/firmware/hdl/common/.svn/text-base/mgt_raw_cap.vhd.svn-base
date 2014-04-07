library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
library unimacro;
use unimacro.vcomponents.all;

entity mgt_raw_cap is
	port(
		clk: in std_logic;
		rst: in std_logic;
		q: out std_logic_vector(37 downto 0);
		phase: in std_logic;
		wclk: in std_logic;
		d: in std_logic_vector(35 downto 0)
	);

end mgt_raw_cap;

architecture rtl of mgt_raw_cap is

	signal rdc, wdc: std_logic_vector(8 downto 0);

begin

	fifo: fifo_dualclock_macro
		generic map(
			DATA_WIDTH => 36
		)
		port map(
			do => q(35 downto 0),
			empty => q(36),
			full => q(37),
			rdcount => rdc,
			wrcount => wdc,
			di => d,
			rdclk => clk,
			rden => '1',
			rst => rst,
			wrclk => wclk,
			wren => '1'
		);

end rtl;

