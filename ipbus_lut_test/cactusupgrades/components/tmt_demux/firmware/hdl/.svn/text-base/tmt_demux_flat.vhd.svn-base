-- tmt_demux_flat
--
-- Demuxes data from an MP into a single sample in time for forwarding on
-- Also checks for consistency between data streams and BX alignment
--
-- Dave Newbold, September 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.mp7_data_types.all;

entity tmt_demux_flat is
	generic(
		LINKS: positive;
		FL_BX: positive;
		CLOCK_RATIO: positive
	);
	port(
		clk_p: in std_logic;
		rst_p: in std_logic;
		d: in ldata(LINKS - 1 downto 0);
		q: out ldata(LINKS * FL_BX - 1 downto 0);
		bx: in std_logic_vector(11 downto 0);
		p: in std_logic;
		match: out std_logic;
		stat: out std_logic_vector(3 downto 0);
		clr: in std_logic
	);

end tmt_demux_flat;

architecture rtl of tmt_demux_flat is

	constant BANKS: integer := FL_BX - 1;
	type qi_t is array(BANKS - 1 downto 0) of ldata(CLOCK_RATIO - 1 downto 0);
	type qi_a_t is array(LINKS - 1 downto 0) of qi_t;
	signal qi: qi_a_t;
	signal start, link_match: std_logic_vector(LINKS - 1 downto 0);
	signal ctr: unsigned(4 downto 0);
	signal match_i, active, ef: std_logic;
	signal err, stat_i: std_logic_vector(2 downto 0);

begin

	lgen: for i in LINKS - 1 downto 0 generate
	
		signal vd, bx_match: std_logic;
		signal hdr: std_logic_vector(31 downto 0);
		
	begin
		
		sr0_gen: if BANKS /= 0 generate -- Shift register input
			process(clk_p)
			begin
				if rising_edge(clk_p) then
					qi(i)(0)(0) <= d(i);
					qi(i)(0)(CLOCK_RATIO - 1 downto 1) <= qi(i)(0)(CLOCK_RATIO - 2 downto 0);
				end if;
			end process;
		end generate;
		
		sr_gen: for ib in BANKS - 1 downto 1 generate -- Shift register input
			process(clk_p)
			begin
				if rising_edge(clk_p) then
					qi(i)(ib)(0) <= qi(i)(ib - 1)(CLOCK_RATIO - 1);
					qi(i)(ib)(CLOCK_RATIO - 1 downto 1) <= qi(i)(ib)(CLOCK_RATIO - 2 downto 0);
				end if;
			end process;
		end generate;
	
		process(clk_p) -- Prompt data output
		begin
			if rising_edge(clk_p) then
				if d(i).valid = '1' then
					q(i * FL_BX).data <= d(i).data;
				else
					q(i * FL_BX).data <= (others => '0');
				end if;
			end if;
		end process;
		
		q(i * FL_BX).valid <= '0';
		
		q_gen: for ib in BANKS - 1 downto 0 generate -- Shift register output
			process(clk_p)
			begin
				if rising_edge(clk_p) then
					if qi(i)(ib)(CLOCK_RATIO - 1).valid = '1' then
						q(i * FL_BX + ib + 1).data <= qi(i)(ib)(CLOCK_RATIO - 1).data;
					else
						q(i * FL_BX + ib + 1).data <= (others => '0');
					end if;
				end if;
			end process;
			q(i * FL_BX + ib + 1).valid <= '0';
		end generate;

		process(clk_p)
		begin
			if rising_edge(clk_p) then
				vd <= d(i).valid;
				if start(i) = '1' then
					hdr <= d(i).data;
				end if;
				link_match(i) <= (link_match(i) or (start(i) and bx_match and p)) and d(i).valid and not ef and not (rst_p or clr);
			end if;
		end process;
		
		bx_match <= '1' when hdr(11 downto 0) = bx else '0';
		start(i) <= d(i).valid and not vd;	
		
	end generate;

	process(clk_p)
	begin
		if rising_edge(clk_p) then
			if rst_p = '1' or clr = '1' then
				ctr <= "11111";
			elsif start = (LINKS - 1 downto 0 => '1') then
				ctr <= (others => '0');
			elsif ctr /= "11111" then
				ctr <= ctr + 1;
			end if;
		end if;
	end process;
	
	match <= '1' when ctr = CLOCK_RATIO * BANKS and link_match(0) = '1' else '0';
	
	process(start, link_match)
	begin
		if start /= (LINKS - 1 downto 0 => '0') and start /= (LINKS - 1 downto 0 => '1') then
			err <= "001";
		elsif link_match /= (LINKS - 1 downto 0 => '0') and link_match /= (LINKS - 1 downto 0 => '1') then
			err <= "010";
		else
			err <= "000";
		end if;
	end process;
	
	process(clk_p)
	begin
		if rising_edge(clk_p) then

			active <= (active or match_i) and not (rst_p or clr);

			if rst_p = '1' or clr = '1' then
				stat_i <= "000";
				elsif err /= "000" then
				stat_i <= err;
			end if;

		end if;
	end process;
	
	ef <= '1' when stat_i /= "000" else '0';
	stat <= stat_i & active;

end rtl;

