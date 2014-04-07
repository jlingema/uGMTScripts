
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 


use work.ipbus.all;
use work.ipbus_trans_decl.all;
use work.mp7_data_types.all;
use work.mp7_counters_decl.all;


entity data_driver_with_tmux_tb is
	generic(
		LHC_BUNCH_COUNT: integer := 120;
		NQUAD: integer := 1; --9; -- 18;
		CLOCK_RATIO: integer := 6
	);
end entity data_driver_with_tmux_tb;


architecture behave of data_driver_with_tmux_tb is

	signal clk40, rst40, lock: std_logic := '0';	
	signal clk240, rst240: std_logic := '0';	
	signal clk40_in_p, clk40_in_n: std_logic := '0';	
	signal clk_ipb, rst_ipb: std_logic := '0';
			
	signal algo_rst: std_logic := '1';	
	signal ipb_in_pp: ipb_wbus;
	signal ipb_out_pp: ipb_rbus;

	signal ppsel: std_logic_vector(5 downto 0) := "000000";	
	signal pp_data_sel: std_logic := '0';	
	signal bc0: std_logic := '0';	
	signal bctrs: bctr_array(NQUAD - 1 downto 0);
	signal pctrs: pctr_array(NQUAD - 1 downto 0);
	signal bmax, b_lock: std_logic_vector(NQUAD - 1 downto 0);
	
	signal bx_cnt, orb_cnt: integer := 0;
	signal rst_mmcm, rst: std_logic := '1';


begin

	rst_mmcm <= '0' after 10 ns;
	rst <= '0' after 100 ns;

	ppsel <= "000000";
	-- algo_rst <= not lock after 200 ns;

  algo_rst <= '0' when orb_cnt = 3;

  clk40_in_p <= not clk40_in_p after 12.5 ns;
	clk40_in_n <= not clk40_in_p;

	clk_ipb <= not clk_ipb after 100 ns;
	rst_ipb <= '0' after 100 ns;
	
	bc0_proc: process(clk40)
	begin
		if rising_edge(clk40) then
			if rst40 = '1' then
			  orb_cnt <= 0;
				bx_cnt <= 0;					
				bc0 <= '0';
			else
				if bx_cnt = LHC_BUNCH_COUNT - 1 then
				  orb_cnt <= orb_cnt + 1;
					bx_cnt <= 0;
					bc0 <= '1';
				else
					bx_cnt <= bx_cnt + 1;
					bc0 <= '0';
				end if;
			end if;
		end if;
	end process;

	
	clocks: entity work.ttc_clocks
		port map(
			clk40_in_p => '0', --clk40_in_p,
			clk40_in_n => '1', --clk40_in_n,
			clk_p40 => clk40_in_p,
			clko_40 => clk40,
			clko_160 => open,
			clko_240 => clk240,
			rsto_40 => rst40,
			rsto_160 => open,
			rsto_240 => rst240,
			clko_40s => open,
			stopped => open,
			locked => lock,
			rst_mmcm => rst_mmcm,
			rsti => rst,
			clksel => '0',
			psclk => '0',
			psinc => '0'
		);
	cnt: entity work.mp7_counters
		generic map(
			NQUAD => NQUAD,
			CLOCK_RATIO => CLOCK_RATIO,
			LHC_BUNCH_COUNT => LHC_BUNCH_COUNT
		)
		port map(
			clk_p => clk240,
			rst_p => rst240,
			bc0 => bc0,
			bctr => bctrs,
			pctr => pctrs,
			bmax => bmax,
			lock => b_lock
		);

	pp_core: entity work.pp_core	
		generic map(
			NQUAD => NQUAD,
			DET_PP_LINKS => 5,
			PP_MP_LINKS => 12, 
			BITS_PER_WORD => 32,
			WORDS_PER_BX => CLOCK_RATIO,
			BX_PER_ORBIT => LHC_BUNCH_COUNT)
		port map(
			clk => clk_ipb,
			rst => rst_ipb,
			ipb_in => ipb_in_pp,
			ipb_out => ipb_out_pp,
			ipb_sel => ppsel, 
			bctr => bctrs,
			pctr => pctrs,
			data_sel => pp_data_sel, 
			clk_p => clk240,
			rst_p => rst240,
			rst_pb => algo_rst,
			q => open
		);


end architecture behave;



