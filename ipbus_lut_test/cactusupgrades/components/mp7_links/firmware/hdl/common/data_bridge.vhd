-- data_bridge
--
-- Safely moves data from a slow clock domain to a fast clock domain with padding
--
-- There are restrictions on the relative clock speeds...
--
-- Dave Newbold, July 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity data_bridge is
	generic(
		N_BITS: positive;
		DEL_CYC: positive
		);
	port(
		d: in std_logic_vector(N_BITS - 1 downto 0);
		dclk: in std_logic;
		q: out std_logic_vector(N_BITS - 1 downto 0);
		pad: out std_logic;
		qclk: in std_logic;
	);
		
end data_bridge;

architecture rtl of data_bridge is

	signal df, s, sf: std_logic_vector(N_BITS - 1 downto 0);
	signal t, tf, u, uf: std_logic := '0';
	signal p: std_logic_vector(DEL_CYC + 1 downto 0) := (others => '0');
	
begin

	process(dclk)
	begin
		if rising_edge(dclk) then
			t <= not t;
		end if;
	end process;

	process(dclk)
	begin
		if falling_edge(dclk) then
			df <= d;
			tf <= t;
		end if;
	end process;
	
	process(qclk)
	begin
		if rising_edge(qclk) then
			s <= d;
			sf <= df;
			u <= t;
			uf <= tf;
			p(0) <= u xor uf;
			p(DEL_CYC downto 1) <= p(DEL_CYC - 1 downto 0);
		end if;
	end process;
	
	q <= s when p(DEL_CYC - 1) = '0' else sf;
	pad <= p(DEL_CYC) and not p(DEL_CYC - 1);

end rtl;

