-- mp7_derand
--
-- Generic block memory for MP7 derandomiser
--
-- Dave Newbold, March 2014

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.mp7_data_types.all;

entity mp7_derand is
	generic(
		ADDR_WIDTH: positive
	);
	port(
		clk: in std_logic;
		waddr: in std_logic_vector(ADDR_WIDTH - 1 downto 0);
		we: in std_logic;
		d: in lword;
		raddr: in std_logic_vector(ADDR_WIDTH - 1 downto 0);
		q: out lword
	);
	
end mp7_derand;

architecture rtl of mp7_derand is

	type ram_array is array(2 ** ADDR_WIDTH - 1 downto 0) of std_logic_vector(32 downto 0);
	signal ram: ram_array;
	signal rsel, wsel: integer range 0 to 2 ** ADDR_WIDTH - 1 := 0;
	signal qi: std_logic_vector(32 downto 0);

begin
	
	rsel <= to_integer(unsigned(raddr));
	wsel <= to_integer(unsigned(waddr));

	process(clk)
	begin
		if rising_edge(clk) then
			qi <= ram(rsel); -- Order of statements is important to infer read-first RAM!
			if we = '1' then
				ram(wsel) <= d.valid & d.data;
			end if;
		end if;
	end process;

	q.data <= qi(31 downto 0);
	q.valid <= qi(32);

	
end rtl;
