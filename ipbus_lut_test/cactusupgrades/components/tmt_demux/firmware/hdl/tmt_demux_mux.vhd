-- tmt_demux_mux
--
-- Multiplexes data from several streams onto a single stream based on match flag
--
-- Dave Newbold, September 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.mp7_data_types.all;

entity tmt_demux_mux is
	generic(
		N_MP: positive;
		CHAN: positive
	);
	port(
		clk_p: in std_logic;
		rst_p: in std_logic;
		d: in ldata(N_MP * CHAN - 1 downto 0);
		q: out ldata(CHAN - 1 downto 0);
		p: in std_logic;
		resync: in std_logic;
		match: in std_logic_vector(N_MP - 1 downto 0);
		good_ctr: out std_logic_vector(31 downto 0);
		empty_ctr: out std_logic_vector(31 downto 0);
		bust_ctr: out std_logic_vector(31 downto 0)
	);

end tmt_demux_mux;

architecture rtl of tmt_demux_mux is

	signal s, sr: integer;
	signal nmatch, mmatch, empty_i, bust_i, p_d: std_logic;
	signal dd: ldata(N_MP * CHAN - 1 downto 0);
	signal good_ctr_i, empty_ctr_i, bust_ctr_i: unsigned(31 downto 0);

begin

	nmatch <= '1' when match = (N_MP - 1 downto 0 => '0') else '0';

	process(match) -- Priority encoder
		variable c: integer;
		variable b, bd: std_logic;
	begin
		c := 0;
		b := '0';
		bd := '0';
		for i in N_MP - 1 downto 0 loop
			if match(i) = '1' then
				c := i;
				if b = '1' then
					bd := '1';
				end if;
				b := '1';
			end if;
		end loop;
		s <= c;
		mmatch <= bd;
	end process;
	
	process(clk_p)
	begin
		if rising_edge(clk_p) then
			dd <= d;
			p_d <= p;
			if p_d = '1' then
				empty_i <= nmatch;
				bust_i <= mmatch;
				sr <= s;
			end if;
		end if;
	end process;

	q_gen: for i in CHAN - 1 downto 0 generate
		
		process(clk_p)
		begin
			if rising_edge(clk_p) then
				if empty_i = '0' and bust_i = '0' then
					q(i).data <= dd(sr * CHAN + i).data;
					q(i).valid <= '1';
				else
					q(i).data <= (others => '0');
					q(i).valid <= '0';
				end if;
			end if;
		end process;

	end generate;
		
	process(clk_p)
	begin
		if rising_edge(clk_p) then
			if rst_p = '1' or resync = '1' then
				good_ctr_i <= (others => '0');
				empty_ctr_i <= (others => '0');
				bust_ctr_i <= (others => '0');
			elsif p = '1' then
				if empty_i = '0' and bust_i = '0' then
					good_ctr_i <= good_ctr_i + 1;
				end if;
				if empty_i = '1' then
					empty_ctr_i <= empty_ctr_i + 1;
				end if;
				if bust_i = '1' then
					bust_ctr_i <= bust_ctr_i + 1;
				end if;
			end if;
		end if;
	end process;
	
	good_ctr <= std_logic_vector(good_ctr_i);
	empty_ctr <= std_logic_vector(empty_ctr_i);
	bust_ctr <= std_logic_vector(bust_ctr_i);
	
end rtl;

