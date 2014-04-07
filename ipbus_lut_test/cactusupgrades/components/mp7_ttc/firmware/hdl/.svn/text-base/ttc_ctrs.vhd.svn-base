-- ttc_ctrs
--
-- Bunch / orbit / event counters
--
-- Dave Newbold, March 2014

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
library unisim;
use unisim.VComponents.all;

use work.mp7_counters_decl.all;

entity ttc_ctrs is
	generic(
		LHC_BUNCH_COUNT: integer;
		BXDEL: integer
	);
	port(
		clk: in std_logic; -- Main TTC clock
		rst: in std_logic;
		ttc_cmd: in std_logic_vector(3 downto 0);
		l1a: in std_logic;
		clr: in std_logic;
		en_int_bc0: in std_logic;
		bc0_lock: out std_logic;
		bc0_err: out std_logic;
		bc0_fr: out std_logic;
		ttc_cmd_out: out std_logic_vector(3 downto 0);
		l1a_out: out std_logic;
		bunch_ctr: out std_logic_vector(11 downto 0); -- TTC counters
		evt_ctr: out std_logic_vector(23 downto 0);
		orb_ctr: out std_logic_vector(23 downto 0)
	);

end ttc_ctrs;

architecture rtl of ttc_ctrs is
	
	signal cmd_d: std_logic_vector(3 downto 0);
	signal bunch_ctr_i: std_logic_vector(11 downto 0);
	signal evt_ctr_i: unsigned(23 downto 0);
	signal orb_ctr_i: unsigned(23 downto 0);
	signal bc0, bmax, l1a_i: std_logic;

begin

	ctrdel: entity work.del_array
		generic map(
			DWIDTH => 5,
			DELAY => TTC_DEL + 1
		)
		port map(
			clk => clk,
			d(3 downto 0) => ttc_cmd,
			d(4) => l1a,
			q(3 downto 0) => cmd_d,
			q(4) => l1a_i
		);

	ttc_cmd_out <= cmd_d;		
	l1a_out <= l1a_i;
	bc0 <= '1' when cmd_d = X"1" and en_int_bc0 = '1' else '0';

	bctr: entity work.bunch_ctr
		generic map(
			CLOCK_RATIO => 1,
			CTR_WIDTH => 12,
			LHC_BUNCH_COUNT => LHC_BUNCH_COUNT
		)
		port map(
			clk => clk,
			rst => rst,
			clr => clr,
			bc0 => bc0,
			bctr => bunch_ctr_i,
			bmax => bmax,
			lock => bc0_lock,
			err => bc0_err
		);

	bunch_ctr <= bunch_ctr_i;		
	bc0_fr <= '1' when bunch_ctr_i = std_logic_vector(to_unsigned(LHC_BUNCH_COUNT - BXDEL, bunch_ctr'length)) else '0';

	process(clk)
	begin
		if rising_edge(clk) then
			if cmd_d = X"7" or rst = '1' or clr = '1' then -- EC0 command
				evt_ctr_i <= X"000001"; -- CMS rules; first event is 1, not zero
			elsif l1a_i = '1' then
				evt_ctr_i <= evt_ctr_i + 1;
			end if;
			if cmd_d = X"8"  or rst = '1' or clr = '1' then -- OC0 command
				orb_ctr_i <= X"000000"; -- Is this right? Who knows?
			elsif bmax = '1' then
				orb_ctr_i <= orb_ctr_i + 1;
			end if;
		end if;
	end process;
	
	evt_ctr <= std_logic_vector(evt_ctr_i);
	orb_ctr <= std_logic_vector(orb_ctr_i);	

end rtl;
