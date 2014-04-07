-- mp7_ttc
--
-- TTC decoder, counters, LHC clock distribution, etc
--
-- Dave Newbold, June 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;
use work.ipbus_reg_types.all;
use work.ipbus_decode_mp7_ttc.all;

entity mp7_ttc is
	generic(
		LHC_BUNCH_COUNT: integer
	);
	port(
		clk: in std_logic; -- ipbus clock & rst
		rst: in std_logic;
		mmcm_rst: in std_logic; -- clock domain full reset
		sel: in std_logic; -- TTC clock / internal clock select
		lock: out std_logic; -- MMCM lock status
		stop: out std_logic; -- MMCM clock status
		ipb_in: in ipb_wbus; -- ipbus
		ipb_out: out ipb_rbus;
		clk40_in_p: in std_logic; -- TTC backplane clock signals
		clk40_in_n: in std_logic;
		clk40ish_in: in std_logic; -- internal pseudo-40MHz clock
		clk40: out std_logic; -- clock outputs
		clk160: out std_logic;
		clk240: out std_logic;
		rsto40: out std_logic; -- clock domain reset outputs
		rsto160: out std_logic;
		rsto240: out std_logic;
		ttc_in_p: in std_logic; -- TTC protocol backplane signas
		ttc_in_n: in std_logic;
		ttc_cmd: out std_logic_vector(3 downto 0); -- TTC b command output
		ttc_cmd_dist: out std_logic_vector(3 downto 0);
		ttc_l1a: out std_logic; -- L1A output
		dist_lock: in std_logic;
		bunch_ctr: out std_logic_vector(11 downto 0);
		evt_ctr: out std_logic_vector(23 downto 0);
		orb_ctr: out std_logic_vector(23 downto 0);
		monclk: in std_logic_vector(2 downto 0) -- clock monitoring inputs from MGTs
	);

end mp7_ttc;

architecture rtl of mp7_ttc is

	signal clk40_i, rst40_i, clk40s, clk40_div, rsti: std_logic;
	signal l1a, l1a_del, psinc, hist_go, bc0_fr, ctr_clr: std_logic;
	signal cmd, cmd_del: std_logic_vector(3 downto 0);
	signal bunch_ctr_i: std_logic_vector(11 downto 0);
	signal evt_ctr_i, orb_ctr_i: std_logic_vector(23 downto 0);
	signal sinerr_ctr, dberr_ctr: std_logic_vector(15 downto 0);
	signal stat: ipb_reg_v(3 downto 0);
	signal ctrl: ipb_reg_v(0 downto 0);
	signal stb: std_logic_vector(0 downto 0);
	signal bc0_lock, bc0_err, dist_lock_i: std_logic;
	signal ipbw: ipb_wbus_array(N_SLAVES - 1 downto 0);
	signal ipbr: ipb_rbus_array(N_SLAVES - 1 downto 0);

begin

-- ipbus address decode
		
	fabric: entity work.ipbus_fabric_sel
    generic map(
    	NSLV => N_SLAVES,
    	SEL_WIDTH => IPBUS_SEL_WIDTH)
    port map(
      ipb_in => ipb_in,
      ipb_out => ipb_out,
      sel => ipbus_sel_mp7_ttc(ipb_in.ipb_addr),
      ipb_to_slaves => ipbw,
      ipb_from_slaves => ipbr
    );
    
-- TTC control registers

	reg: entity work.ipbus_syncreg_v
		generic map(
			N_CTRL => 1,
			N_STAT => 4
		)
		port map(
			clk => clk,
			rst => rst,
			ipb_in => ipbw(N_SLV_CSR),
			ipb_out => ipbr(N_SLV_CSR),
			slv_clk => clk40_i,
			d => stat,
			q => ctrl,
			stb => stb
		);

-- MMCM for clock multiplication / phase adjustment

	rsti <= rst or ctrl(0)(2);

	clocks: entity work.ttc_clocks
		port map(
			clk40_in_p => clk40_in_p,
			clk40_in_n => clk40_in_n,
			clk_p40 => clk40ish_in,
			clko_40 => clk40_i,
			clko_160 => clk160,
			clko_240 => clk240,
			rsto_40 => rst40_i,
			rsto_160 => rsto160,
			rsto_240 => rsto240,
			clko_40s => clk40s,
			stopped => stop,
			locked => lock,
			rst_mmcm => mmcm_rst,
			rsti => rsti,
			clksel => sel,
			psclk => clk40_i,
			psinc => psinc
		);

	psinc <= ctrl(0)(6) and stb(0);
		
	clk40 <= clk40_i;
	rsto40 <= rst40_i;

-- TTC protocol decoder
	
	ttccmd: entity work.ttc_cmd
		generic map(
			LHC_BUNCH_COUNT => LHC_BUNCH_COUNT
		)
		port map(
			clk => clk40_i,
			rst => rst40_i,
			sclk => clk40s,
			ttc_in_p => ttc_in_p,
			ttc_in_n => ttc_in_n,
			l1a => l1a,
			cmd => cmd,
			sinerr_ctr => sinerr_ctr,
			dberr_ctr => dberr_ctr,
			c_delay => ctrl(0)(28 downto 24),
			en_ttc => ctrl(0)(0),
			en_int_bc0 => ctrl(0)(3),
			bc0_fr => bc0_fr,
			ext_stb => stb(0),
			ext_cmd => ctrl(0)(19 downto 16),
			err_rst => ctrl(0)(1)
		);
		
	process(clk40_i)
	begin
		if rising_edge(clk40_i) then
			ttc_cmd_dist <= cmd;
		end if;
	end process;

-- Counters

	ctr_clr <= ctrl(0)(7) and stb(0);

	ttcctr: entity work.ttc_ctrs
		generic map(
			LHC_BUNCH_COUNT => LHC_BUNCH_COUNT,
			BXDEL => 4
		)
		port map(
			clk => clk40_i,
			rst => rst40_i,
			ttc_cmd => cmd,
			l1a => l1a,
			clr => ctr_clr,
			en_int_bc0 => ctrl(0)(3),
			bc0_lock => bc0_lock,
			bc0_err => bc0_err,
			bc0_fr => bc0_fr,
			ttc_cmd_out => cmd_del,
			l1a_out => l1a_del,
			bunch_ctr => bunch_ctr_i,
			evt_ctr => evt_ctr_i,
			orb_ctr => orb_ctr_i
		);
		
	ttc_cmd <= cmd_del;
	ttc_l1a <= l1a_del;
	bunch_ctr <= bunch_ctr_i;
	evt_ctr <= evt_ctr_i;
	orb_ctr <= orb_ctr_i;

-- Status reg

	process(clk40_i)
	begin
		if rising_edge(clk40_i) then
			dist_lock_i <= dist_lock; -- CDC (related clocks)
		end if;
	end process;

	stat(0) <= std_logic_vector(to_unsigned(LHC_BUNCH_COUNT, 12)) & '0' & dist_lock_i & bc0_err & bc0_lock & X"0" & bunch_ctr_i;
	stat(1) <= X"00" & evt_ctr_i;
	stat(2) <= X"00" & orb_ctr_i;
	stat(3) <= dberr_ctr & sinerr_ctr;
		
-- clk40 frequency monitoring	

	div: entity work.freq_ctr_div
		port map(
			clk(0) => clk40_i,
			clkdiv(0) => clk40_div
		);

-- Clock frequency monitor

	ctr: entity work.freq_ctr
		generic map(
			N_CLK => 4
		)
		port map(
			clk => clk,
			rst => rst,
			ipb_in => ipbw(N_SLV_FREQ),
			ipb_out => ipbr(N_SLV_FREQ),
			clkdiv(0) => clk40_div,
			clkdiv(3 downto 1) => monclk
		);

-- TTC history buffer

	hist_go <= ctrl(0)(5) and stb(0);

	hist: entity work.ttc_history
		port map(
			clk => clk,
			rst => rst,
			ipb_in => ipbw(N_SLV_HIST),
			ipb_out => ipbr(N_SLV_HIST),
			ttc_clk => clk40_i,
			go => hist_go,
			mask_bc0 => ctrl(0)(4),
			ttc_l1a => l1a_del,
			ttc_cmd => cmd_del,
			ttc_bx => bunch_ctr_i,
			ttc_orb => orb_ctr_i
		);
	
end rtl;

