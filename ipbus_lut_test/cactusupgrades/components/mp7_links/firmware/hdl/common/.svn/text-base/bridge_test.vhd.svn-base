-- bridge_test
--
-- Safely moves data from a slow clock domain to a fast clock domain with padding
--
-- There are restrictions on the relative clock speeds...
--
-- Dave Newbold, July 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;
use work.ipbus_reg_types.all;

entity bridge_test is
	port(
		clk: in std_logic;
		reset: in std_logic;
		ipbus_in: in ipb_wbus;
		ipbus_out: out ipb_rbus;
		dclk: in std_logic;
		qclk: in std_logic;
	);
		
end bridge_test;

architecture rtl of bridge_test is
	
	signal ctrl, stat: ipb_reg_v(0 downto 0);
	signal ctr: unsigned(15 downto 0) := X"0000";
	signal d, q: std_logic_vector(15 downto 0);
	signal pad: std_logic;

begin

	reg: entity work.ipbus_syncreg_v
		generic map(
			N_CTRL => 1,
			N_STAT => 1
		)
		port map(
			clk => clk,
			rst => reset,
			ipb_in => ipbus_in,
			ipb_out => ipbus_out,
			slv_clk => dclk,
			d => stat,
			q => ctrl,
			stb => open
		);
		
	process(dclk)
	begin
		if rising_edge(dclk) then
			ctr <= ctr + 1;
		end if;
	end process;
	
	d <= std_logic_vector(ctr);
	
	bridge: entity work.data_bridge
		generic map(
			N_BITS => 16,
			DEL_CYC => 6
		)
		port map(
			d => d,
			dclk => dclk,
			q => q,
			pad => pad,
			qclk => qclk
		);
		
	
			

end rtl;

