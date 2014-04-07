-- ttc_cmd
--
-- Decoder for TTC commands
--
-- All signals synchronous to clk unless stated
-- Priority for commands is:
--	external TTC
--	internal BC0 (highest priority)
--	internal
--	no action (default)
--
-- Dave Newbold, July 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
library unisim;
use unisim.VComponents.all;

entity ttc_cmd is
	generic(
		LHC_BUNCH_COUNT: integer
	);
	port(
		clk: in std_logic; -- Main TTC clock
		rst: in std_logic;
		sclk: in std_logic; -- Sampling clock for TTC data
		ttc_in_p: in std_logic; -- TTC datastream from AMC13
		ttc_in_n: in std_logic;
		l1a: out std_logic; -- L1A output
		cmd: out std_logic_vector(3 downto 0); -- B-command output (zero if no command)
		sinerr_ctr: out std_logic_vector(15 downto 0);
		dberr_ctr: out std_logic_vector(15 downto 0);
		c_delay: in std_logic_vector(4 downto 0); -- Coarse delay for TTC signals
		en_ttc: in std_logic; -- enable TTC inputs
		en_int_bc0: in std_logic; -- enable internally-generated BC0
		bc0_fr: in std_logic; -- internally-generated BC0
		ext_stb: in std_logic; -- Strobe input for external signals below
		ext_cmd: in std_logic_vector(3 downto 0); -- External B cmd input
		err_rst: in std_logic -- Err ctr reset
	);

end ttc_cmd;

architecture rtl of ttc_cmd is

	signal ttc_data, ttc_data_d: std_logic_vector(1 downto 0);
	signal ttc_in, ttc_in_d, sinerr, dberr, stb_ttc: std_logic;
	signal cmd_ttc: std_logic_vector(7 downto 0);
	signal cmda, cmdb, cmdc, ext_cmd_i: std_logic_vector(3 downto 0);
	signal ttc_l1a, ext_cmd_pend, ext_cmd_rx, cmd_slot: std_logic;
	signal sinerr_ctr_i, dberr_ctr_i: unsigned(15 downto 0);

begin

	buf: IBUFDS
		port map(
			i => ttc_in_p,
			ib => ttc_in_n,
			o => ttc_in
		);

	ddr: IDDR
		generic map(
			DDR_CLK_EDGE => "SAME_EDGE"
		)
		port map(
			q1 => ttc_data(0),
			q2 => ttc_data(1),
			c => sclk,
			ce => '1',
			d => ttc_in,
			r => '0',
			s => '0'
		);
		
	cdel0: SRLC32E
		port map(
			q => ttc_data_d(0),
			d => ttc_data(0),
			clk => clk,
			ce => '1',
			a => c_delay
		);

	cdel1: SRLC32E
		port map(
			q => ttc_data_d(1),
			d => ttc_data(1),
			clk => clk,
			ce => '1',
			a => c_delay
		);

	decode: entity work.ttc_decoder
		port map(
			ttc_clk => clk,
			ttc_data => ttc_data_d,
			l1accept => ttc_l1a,
			sinerrstr => sinerr,
			dberrstr => dberr,
			brcststr => stb_ttc,
			brcst => cmd_ttc
		);

	l1a <= ttc_l1a and en_ttc;
		
	cmda <= cmd_ttc(3 downto 0) when stb_ttc = '1' else X"0";
	cmdb <= X"1" when bc0_fr = '1' and en_int_bc0 = '1' else X"0";
	cmdc <= cmda when en_ttc = '1' else cmdb;

	cmd_slot <= '1' when cmdc = X"0" else '0';
	ext_cmd_rx <= '1' when ext_stb = '1' and ext_cmd /= X"0" else '0';
	
	process(clk)
	begin
		if rising_edge(clk) then
			if ext_cmd_rx = '1' then
				ext_cmd_i <= ext_cmd;
			end if;
			ext_cmd_pend <= ((ext_cmd_pend and not cmd_slot) or ext_cmd_rx) and not rst;
		end if;
	end process;
	
	cmd <= ext_cmd_i when cmd_slot = '1' and ext_cmd_pend = '1' else cmdc;
	
	process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' or (err_rst = '1' and ext_stb = '1') then
				sinerr_ctr_i <= (others => '0');
				dberr_ctr_i <= (others => '0');
			else
				if sinerr = '1' and sinerr_ctr_i /= X"ffff" then
					sinerr_ctr_i <= sinerr_ctr_i + 1;
				end if;
				if dberr = '1' and dberr_ctr_i /= X"ffff" then
					dberr_ctr_i <= dberr_ctr_i + 1;
				end if;
			end if;			
		end if;
	end process;

	sinerr_ctr <= std_logic_vector(sinerr_ctr_i);
	dberr_ctr <= std_logic_vector(dberr_ctr_i);

end rtl;
