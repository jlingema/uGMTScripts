-- mp7_mgt
--
-- Wrapper for MGT quads - this version for equal width interfaces only
-- Equal number of input and output channels for now
--
-- Dave Newbold, July 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library unisim;
use unisim.VComponents.all;

use work.ipbus.all;
use work.mp7_data_types.all;
use work.mgt_decl.all;
use work.ipbus_reg_types.all;

entity mp7_mgt is
	generic(
		NQUAD: positive;
		CLOCK_RATIO: positive;
		LHC_BUNCH_COUNT: integer;
		NREFCLK: integer
	);
	port(
		clk: in std_logic;
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		ipb_in_align: in ipb_wbus;
		ipb_out_align: out ipb_rbus;
		ipb_in_drp: in ipb_wbus;
		ipb_out_drp: out ipb_rbus;
		ipb_in_drp_com: in ipb_wbus;
		ipb_out_drp_com: out ipb_rbus;		
		qsel: in std_logic_vector(6 downto 0);
		clk_p: in std_logic;
		rst_p: in std_logic_vector(NQUAD - 1 downto 0);
		rst_ctrl: in std_logic; -- Not used right now
		bc0: in std_logic_vector(NQUAD - 1 downto 0);
		d: in ldata(NQUAD * 4 - 1 downto 0);
		q: out ldata(NQUAD * 4 - 1 downto 0);
		refclkp: in std_logic_vector(NREFCLK - 1 downto 0);
		refclkn: in std_logic_vector(NREFCLK - 1 downto 0);
		rxp: in std_logic_vector(NQUAD * 4 - 1 downto 0);
		rxn: in std_logic_vector(NQUAD * 4 - 1 downto 0);
		txp: out std_logic_vector(NQUAD * 4 - 1 downto 0);
		txn: out std_logic_vector(NQUAD * 4 - 1 downto 0);
		refclk_mon: out std_logic;
		txclk_mon: out std_logic;
		rxclk_mon: out std_logic
	);
	
begin

	assert NREFCLK = 6
		report "Refclk number does not match"
		severity failure;

	assert CLOCK_RATIO = 4
		report "Clock ratio does not match"
		severity failure;		

end mp7_mgt;

architecture rtl of mp7_mgt is

	signal ipb_in_q: ipb_wbus_array(N_QUAD_MAX - 1 downto 0);
	signal ipb_out_q: ipb_rbus_array(N_QUAD_MAX - 1 downto 0);
	signal refclk: std_logic_vector(NREFCLK - 1 downto 0);
	signal ctrl, stat: ipb_reg_v(0 downto 0);
	signal refclk_buf, refclk_mon_v: std_logic_vector(NREFCLK - 1 downto 0);
	signal rxclk_mon_v: std_logic_vector(4 * N_QUAD_MAX - 1 downto 0);
	signal qplllock, txclk_mon_v: std_logic_vector(N_QUAD_MAX - 1 downto 0);
	
begin

-- Refclocks

	rgen: for i in refclk'range generate
	
		ibuf: IBUFDS_GTE2
			port map(
				i => refclkp(i),
				ib => refclkn(i),
				o => refclk(i),
				ceb => '0'
			);
			
		bufh_refclk: bufh
			port map(
				i => refclk(i),
				o => refclk_buf(i)
			);
		
	end generate;
	
	refclk_div: entity work.freq_ctr_div
		generic map(
			N_CLK => NREFCLK
		)
		port map(
			clk => refclk_buf,
			clkdiv => refclk_mon_v
		);

	fabric: entity work.ipbus_fabric_sel
		generic map(
			NSLV => N_QUAD_MAX,
			SEL_WIDTH => 5
		)
		port map(
			sel => qsel(6 downto 2),
			ipb_in => ipb_in,
			ipb_out => ipb_out,
			ipb_to_slaves => ipb_in_q,
			ipb_from_slaves => ipb_out_q
		);
		
	reg: entity work.ipbus_syncreg_v
		generic map(
			N_CTRL => 1,
			N_STAT => 1
		)
		port map(
			clk => clk,
			rst => rst,
			ipb_in => ipb_in_align,
			ipb_out => ipb_out_align,
			slv_clk => clk_p,
			d => stat,
			q => ctrl
		);
	
	stat(0)(3 downto 0) <= X"0";
	stat(0)(4) <= qplllock(to_integer(unsigned(qsel(6 downto 2))));
	stat(0)(31 downto 5) <= (others => '0');

	quad_gen: for i in NQUAD - 1 downto 0 generate
	
		signal bctr: std_logic_vector(15 downto 0);
		constant hi: integer := (i + 1) * 4 - 1;
		constant li: integer := i * 4;
		attribute EQUIVALENT_REGISTER_REMOVAL: string;
		attribute EQUIVALENT_REGISTER_REMOVAL of local_rst: signal is "no";
	
	begin

	-- Cycle counter

		ctr: entity work.bunch_ctr -- FIXME: take this from the quad's main bunch counter
			generic map(
				CLOCK_RATIO => CLOCK_RATIO,
				CTR_WIDTH => 16,
				LHC_BUNCH_COUNT => LHC_BUNCH_COUNT
			)
			port map(
				clk => clk_p,
				rst => rst_p(i),
				clr => '0',
				bc0 => bc0(i),
				bctr => bctr
			);
	
		quad: entity work.quad_wrapper_gtx
			generic map(
				X_LOC => qp(i).xloc,
				Y_LOC => qp(i).yloc,
				LHC_BUNCH_COUNT => LHC_BUNCH_COUNT
			)
			port map(
				clk => clk,
				rst => rst,
				ipb_in => ipb_in_q(i),
				ipb_out => ipb_out_q(i),
				sysclk => clk,
				clk_p => clk_p,
				rst_p => rst_p(i),
				bctr => bctr,
				d => d(hi downto li),
				q => q(hi downto li),
				refclk => refclk(qp(i).refclk),
				rxp => rxp(hi downto li),
				rxn => rxn(hi downto li),
				txp => txp(hi downto li),
				txn => txn(hi downto li),
				qplllock => qplllock(i),
				txclk_mon => txclk_mon_v(i),
				rxclk_mon => rxclk_mon_v(hi downto li)
			);
			
	end generate;
	
	ipb_out_q(N_QUAD_MAX - 1 downto NQUAD) <= (others => IPB_RBUS_NULL);
	txclk_mon_v(N_QUAD_MAX - 1 downto NQUAD) <= (others => '0');
	rxclk_mon_v(4 * N_QUAD_MAX - 1 downto 4 * NQUAD) <= (others => '0');
	
	refclk_mon <= refclk_mon_v(qp(to_integer(unsigned(qsel(6 downto 2)))).refclk);
	txclk_mon <= txclk_mon_v(to_integer(unsigned(qsel(6 downto 2))));
	rxclk_mon <= rxclk_mon_v(to_integer(unsigned(qsel(6 downto 0))));
	
end rtl;

