-- bunch_ctr
--
-- General-purpose bunch counter, locked to BC0 signal
--
-- Free-running with period dictated by LHC_BUNCH_COUNT until a bc0 input
-- arrives - then it will lock to that and subsequently raise 'err' if bc0
-- does not arrive in the right place.
--
-- CLOCK_RATIO is the ratio between clk and clk40.
-- CLK_DIV is the division of the clock for bctr
--   The divider count is available on pctr
--   NB: CLK_DIV should be a factor of CLOCK_RATIO
-- OFFSET is useful for making an 'early' counter required for ram address
--   lines, etc. It's specified in terms of clock cycles, not BX.
-- LOCK_CTR controls lock / error check mode of counter
-- VAR_OFFSET enables del_bx and del_p; note that the setting must take account
--	 of any static offset also required
--
-- FIXME: VAR_OFFSET is pretty hideous... is there a better way?
--
-- Dave Newbold, July 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity bunch_ctr is
	generic(
		CLOCK_RATIO: positive := 1;
		CLK_DIV: positive := 1;
		CTR_WIDTH: positive := 12;
		LHC_BUNCH_COUNT: positive;
		OFFSET: natural := 0;
		LOCK_CTR: boolean := true;
		VAR_OFFSET: boolean := false
	);
	port(
		clk: in std_logic;
		rst: in std_logic;
		clr: in std_logic;
		bc0: in std_logic; -- clk40 domain
		bc0_out: out std_logic;
		del_bx: in std_logic_vector(7 downto 0) := X"00";
		del_p: in std_logic_vector(2 downto 0) := "000";
		bctr: out std_logic_vector(CTR_WIDTH - 1 downto 0);
		pctr: out std_logic_vector(2 downto 0);
		bmax: out std_logic;
		lock: out std_logic;
		err: out std_logic
	);

begin

	assert 2 ** CTR_WIDTH > LHC_BUNCH_COUNT * CLOCK_RATIO / CLK_DIV
		report "Not enough bits in bunch counter"
		severity failure;

	assert CLK_DIV < 9
		report "Division ratio too high"
		severity failure;
		
end bunch_ctr;

architecture rtl of bunch_ctr is

	constant OFF: integer := (OFFSET + 2) / CLK_DIV;
	constant P_OFF: integer := (OFFSET + 2) mod CLK_DIV;

	signal bctr_i: unsigned(CTR_WIDTH - 1 downto 0) := (others => '0');
	signal pctr_i: unsigned(2 downto 0) := (others => '0');
	signal lock_i: std_logic := '0';
	signal bc0r, bc0_d, bc0_i, bc0_ir, sync, bmax_i, pmax_i: std_logic;
	
begin

	process(clk)
	begin
		if rising_edge(clk) then

			bc0r <= bc0; -- CDC (related clocks)
			bc0_d <= bc0r;
			
			if rst = '1' or clr = '1' then
				bctr_i <= (others => '0');
				pctr_i <= (others => '0');
				lock_i <= '0';
			elsif lock_i = '0' and sync = '1' then
				if VAR_OFFSET then
					bctr_i(7 downto 0) <= unsigned(del_bx);
					bctr_i(CTR_WIDTH - 1 downto 8) <= (others => '0');
					pctr_i <= unsigned(del_p);
				else
					bctr_i <= to_unsigned(OFF, CTR_WIDTH);
					pctr_i <= to_unsigned(P_OFF, 3);
				end if;
				if LOCK_CTR then
					lock_i <= '1';
				end if;
			elsif pmax_i = '1' then
				pctr_i <= "000";
				if bmax_i = '1' then
					bctr_i <= (others => '0');
				else
					bctr_i <= bctr_i + 1;
				end if;
			else
				pctr_i <= pctr_i + 1;
			end if;

			if rst = '1' or clr = '1' then
				err <= '0';
			elsif lock_i = '1' and (bc0_ir xor sync) = '1' then
				err <= '1';
			end if;

		end if;
	end process;
	
	sync <= '1' when bc0r = '1' and bc0_d = '0' else '0';
	pmax_i <= '1' when pctr_i = to_unsigned(CLK_DIV - 1, 3) else '0';
	bmax_i <= '1' when bctr_i = to_unsigned(LHC_BUNCH_COUNT * CLOCK_RATIO / CLK_DIV - 1, CTR_WIDTH) else '0';

	process(clk)
	begin
		if rising_edge(clk) then
			if pmax_i = '1' then
				bc0_i <= bmax_i;
			end if;
			bc0_ir <= bc0_i;
		end if;
	end process;

	bc0_out <= bc0_i;
	bctr <= std_logic_vector(bctr_i);
	pctr <= std_logic_vector(pctr_i);
	lock <= lock_i;	
	bmax <= bmax_i and pmax_i;
	
end rtl;
