-- ttc_clocks
--
-- Clock generation for LHC clocks
--
-- Dave Newbold, June 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library unisim;
use unisim.VComponents.all;

entity ttc_clocks is
	port(
		clk40_in_p: in std_logic;		
		clk40_in_n: in std_logic;
		clk_p40: in std_logic;
		clko_40: out std_logic;
		clko_160: out std_logic;
		clko_240: out std_logic;
		rsto_40: out std_logic;
		rsto_160: out std_logic;
		rsto_240: out std_logic;
		clko_40s: out std_logic;
		stopped: out std_logic;
		locked: out std_logic;
		locked_fr: out std_logic;
		rst_mmcm: in std_logic;
		rsti: in std_logic;
		clksel: in std_logic;
		psclk: in std_logic;
		psinc: in std_logic
	);

end ttc_clocks;

architecture rtl of ttc_clocks is

	signal clk40_bp, clk40_bp_u, clk_fb, clk_fb_fr, clk_p40_b: std_logic;
	signal clk40_u, clk160_u, clk240_u, clk40s_u, clk40_i, clk160_i, clk240_i: std_logic;
	signal locked_i: std_logic;
	
	attribute KEEP: string;
	attribute KEEP of clk40_i: signal is "TRUE";
	attribute KEEP of clk160_i: signal is "TRUE";	
	attribute KEEP of clk240_i: signal is "TRUE";	
	
begin

	ibuf_clk40: IBUFGDS
		port map(
			i => clk40_in_p,
			ib => clk40_in_n,
			o => clk40_bp_u
		);
		
	bufr_clk40: BUFH
		port map(
			i => clk40_bp_u,
			o => clk40_bp
		);
	
	bufr_clk40_fr: BUFH
		port map(
			i => clk_p40,
			o => clk_p40_b
		);

	mmcm: MMCM_ADV
		generic map(
			clkin1_period => 25.0,
			clkin2_period => 25.0,
			clkfbout_mult_f => 24.0,
			clkout1_divide => 24,
			clkout2_divide => 24,
			clkout2_phase => 225.0, -- Adjust on test
			clkout2_use_fine_ps => true,
			clkout4_divide => 6,
			clkout5_divide => 4
		)
		port map(
			clkin1 => clk40_bp,
			clkin2 => clk_p40_b,
			clkinsel => clksel,
			clkfbin => clk_fb,
			clkfbout => clk_fb,
			clkout1 => clk40_u,
			clkout2 => clk40s_u,
			clkout4 => clk160_u,
			clkout5 => clk240_u,
			rst => rst_mmcm,
			pwrdwn => '0',
			clkinstopped => stopped,
			locked => locked_i,
			daddr => "0000000",
			di => X"0000",
			dwe => '0',
			den => '0',
			dclk => '0',
			psclk => psclk,
			psen => psinc,
			psincdec => '1'
		);
		
	locked <= locked_i;	
	
	bufg_40: BUFG
		port map(
			i => clk40_u,
			o => clk40_i
		);
		
	clko_40 <= clk40_i;

	process(clk40_i)
	begin
		if rising_edge(clk40_i) then
			rsto_40 <= rsti or not locked_i;
		end if;
	end process;
	
	bufg_160: BUFG
		port map(
			i => clk160_u,
			o => clk160_i
		);
		
	clko_160 <= clk160_i;
		
	process(clk160_i)
	begin
		if rising_edge(clk160_i) then
			rsto_160 <= rsti or not locked_i;
		end if;
	end process;
		
	bufg_240: BUFG
		port map(
			i => clk240_u,
			o => clk240_i
		);
		
	clko_240 <= clk240_i;
		
	process(clk240_i)
	begin
		if rising_edge(clk240_i) then
			rsto_240 <= rsti or not locked_i;
		end if;
	end process;
	
	bufr_40s: BUFR
		port map(
			i => clk40s_u,
			ce => '1',
			clr => '0',
			o => clko_40s
		);

end rtl;
