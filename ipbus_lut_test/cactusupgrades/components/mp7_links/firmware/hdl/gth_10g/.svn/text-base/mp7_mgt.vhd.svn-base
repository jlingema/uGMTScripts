-- mp7_mgt
--
-- Wrapper for MGT quads - this version for equal width interfaces only
-- Equal number of input and output channels for now
--
-- Dave Newbold, July 2013

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library unisim;
use unisim.vcomponents.all;

use work.ipbus.all;
use work.drp_decl.all;
use work.mp7_data_types.all;
use work.mgt_decl.all;
use work.ipbus_reg_types.all;
use work.package_links.all;

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
		rst_ctrl: in std_logic;
		bc0: in std_logic_vector(NQUAD - 1 downto 0); -- Not used right now
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

	assert NREFCLK = 8
		report "Refclk number does not match"
		severity failure;

	assert CLOCK_RATIO = 6
		report "Clock ratio does not match"
		severity failure;		

end mp7_mgt;

architecture rtl of mp7_mgt is

  constant LINKS: integer := 4 * NQUAD; 
  constant ALIGN_MASTER_LINK: integer := 0;
	constant ZERO_VECTOR: bit_vector(LINKS-1 downto 0) := (others => '0');

	-- Would normally be 
	signal ipb_in_q: ipb_wbus_array(N_QUAD_MAX - 1 downto 0);
	signal ipb_out_q: ipb_rbus_array(N_QUAD_MAX - 1 downto 0);
	signal refclk: std_logic_vector(NREFCLK - 1 downto 0);
	signal bctr: std_logic_vector(15 downto 0);
	
  -- External Rx buffer control
  signal buf_master: std_logic_vector(LINKS-1 downto 0) := (others => '0');
  signal buf_rst: std_logic := '0';
  signal buf_ptr_inc: std_logic_vector(LINKS-1 downto 0) := (others => '0');
  signal buf_ptr_dec: std_logic_vector(LINKS-1 downto 0) := (others => '0');
  -- Synchronisation signals
  signal align_marker, align_marker_r: std_logic_vector(LINKS-1 downto 0) := (others => '0');
  signal align_enable, align_master, align_status: std_logic := '0';
  -- Misc
  signal status : std_logic_vector(5 downto 0);

	signal ctrl: ipb_reg_v(2 downto 0);
	signal stat: ipb_reg_v(0 downto 0);
	signal refclk_buf, refclk_mon_v: std_logic_vector(NREFCLK - 1 downto 0);
	signal rxclk_mon_v: std_logic_vector(4 * N_QUAD_MAX - 1 downto 0);
	signal qplllock, txclk_mon_v: std_logic_vector(N_QUAD_MAX - 1 downto 0);
	
	signal drp_out, drp_out_com: drp_wbus;
	signal drp_in, drp_in_com: drp_rbus;
	signal drp_out_bus: drp_wbus_array(4 * N_QUAD_MAX - 1 downto 0);
	signal drp_in_bus: drp_rbus_array(4 * N_QUAD_MAX - 1 downto 0);
	signal drp_out_com_bus: drp_wbus_array(N_QUAD_MAX - 1 downto 0);
	signal drp_in_com_bus: drp_rbus_array(N_QUAD_MAX - 1 downto 0);	

	signal align_margin: std_logic_vector(3 downto 0);  -- How far to back off after rd/wt ptr clash
	signal align_disable: std_logic_vector(4 * N_QUAD_MAX - 1  downto 0); -- Disable channels from alignment process

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

-- ipbus mux
		
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
		
-- DRP ipbus mux

	drp: entity work.ipbus_drp_bridge
		port map(
			clk => clk,
			rst => rst,
			ipb_in => ipb_in_drp,
			ipb_out => ipb_out_drp,
			drp_out => drp_out,
			drp_in => drp_in
		);
		
	drp_mux: entity work.drp_mux
		generic map(
			N_DRP => 4 * N_QUAD_MAX
		)
		port map(
			sel => qsel(6 downto 0),
			drp_in => drp_out,
			drp_out => drp_in,
			slv_drp_in => drp_in_bus,
			slv_drp_out => drp_out_bus
		);
		
	drp_com: entity work.ipbus_drp_bridge
		port map(
			clk => clk,
			rst => rst,
			ipb_in => ipb_in_drp_com,
			ipb_out => ipb_out_drp_com,
			drp_out => drp_out_com,
			drp_in => drp_in_com
		);
		
	drp_com_mux: entity work.drp_mux
		generic map(
			N_DRP => N_QUAD_MAX
		)
		port map(
			sel => qsel(6 downto 2),
			drp_in => drp_out_com,
			drp_out => drp_in_com,
			slv_drp_in => drp_in_com_bus,
			slv_drp_out => drp_out_com_bus
		);

	qgen: for i in NQUAD - 1 downto 0 generate
	
		constant hi: integer := (i + 1) * 4 - 1;
		constant li: integer := i * 4;
		signal local_buf_rst: std_logic;
		signal local_inc, local_dec: std_logic_vector(3 downto 0);
		attribute EQUIVALENT_REGISTER_REMOVAL: string;
		attribute EQUIVALENT_REGISTER_REMOVAL of local_buf_rst: signal is "no";
		attribute EQUIVALENT_REGISTER_REMOVAL of local_inc: signal is "no";
		attribute EQUIVALENT_REGISTER_REMOVAL of local_dec: signal is "no";

	begin
	
		process(clk_p)
		begin
			if rising_edge(clk_p) then	
				local_buf_rst <= buf_rst;
				local_inc <= buf_ptr_inc(hi downto li);
				local_dec <= buf_ptr_dec(hi downto li);				
			end if;
		end process;
	
		quad: entity work.quad_wrapper_gth
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
				d => d(hi downto li),
				q => q(hi downto li),
				refclk => refclk(qp(i).refclk),
				rxp => rxp(hi downto li),
				rxn => rxn(hi downto li),
				txp => txp(hi downto li),
				txn => txn(hi downto li),
				qplllock => qplllock(i),
				buf_master => buf_master(hi downto li),
				buf_rst => local_buf_rst,
				buf_ptr_inc => local_inc,
				buf_ptr_dec => local_dec,
				align_marker => align_marker(hi downto li),
				txclk_mon => txclk_mon_v(i),
				rxclk_mon => rxclk_mon_v(hi downto li),
				drp_in => drp_out_bus(hi downto li),
				drp_out => drp_in_bus(hi downto li),
				drp_in_com => drp_out_com_bus(i),
				drp_out_com => drp_in_com_bus(i)
			);		
					
	end generate;
	
	ipb_out_q(N_QUAD_MAX - 1 downto NQUAD) <= (others => IPB_RBUS_NULL);
	txclk_mon_v(N_QUAD_MAX - 1 downto NQUAD) <= (others => '0');
	rxclk_mon_v(4 * N_QUAD_MAX - 1 downto 4 * NQUAD) <= (others => '0');
	
	refclk_mon <= refclk_mon_v(qp(to_integer(unsigned(qsel(6 downto 2)))).refclk);
	txclk_mon <= txclk_mon_v(to_integer(unsigned(qsel(6 downto 2))));
	rxclk_mon <= rxclk_mon_v(to_integer(unsigned(qsel(6 downto 0))));

	reg: entity work.ipbus_ctrlreg_v
		generic map(
			N_CTRL => 3,
			N_STAT => 1
		)
		port map(
			clk => clk,
			reset => rst,
			ipbus_in => ipb_in_align,
			ipbus_out => ipb_out_align,
			d => stat,
			q => ctrl
		);
 
	process(clk_p)
	begin
		if rising_edge(clk_p) then
			align_enable <= ctrl(0)(0);	
			align_margin <= ctrl(0)(4 downto 1); 
			align_disable(23 downto 0) <= ctrl(0)(31 downto 8); 
			align_disable(55 downto 24) <= ctrl(1); 
			align_disable(71 downto 56) <= ctrl(2)(15 downto 0); 
			stat(0)(3 downto 0) <= status(3 downto 0);
			stat(0)(4) <= qplllock(to_integer(unsigned(qsel(6 downto 2))));
			stat(0)(29 downto 5) <= (others => '0');
			stat(0)(31 downto 30) <= status(5 downto 4);
			align_marker_r <= align_marker;
		end if;
	end process;
	
	---------------------------------------------------------------------------------------------------
	-- Controller for rxdata_simple_cdc_buf.  Aligns links and minimises latency.
	-- Note that alignment status of all links has deliberately left outside the 
	-- state machine to allow the user to use several clk cycles to determine whether 
	-- all teh links are aligned.
	--
	-- Note, if the user uses several clk cycles to perform a staged and_reduce of all 
	-- all links to generate "align_status_in" then align_slaves_in and align_master_in
	-- should also be delayed by the same quantity.
	---------------------------------------------------------------------------------------------------

	buf_master <= std_logic_vector(shift_left(to_unsigned(1, LINKS), ALIGN_MASTER_LINK));
	
	align_master <= align_marker_r(ALIGN_MASTER_LINK);

	-- If you clk align_status make sure you also clk align_slaves and align_master
	--align_status <= and_reduce(align_marker); 

	rxdata_simple_cdc_ctrl_inst: rxdata_simple_cdc_ctrl
		generic map(
			NQUAD => NQUAD,
			LOCAL_LHC_CLK_MULTIPLE => CLOCK_RATIO,
			LOCAL_LHC_BUNCH_COUNT => LHC_BUNCH_COUNT
		)  
		port map(
			local_rst_in => rst_ctrl,
			local_clk_in => clk_p,
			align_enable_in => align_enable,  
			align_marker_in => align_marker_r,
			align_master_in => align_master, 
			align_margin_in => align_margin,
			align_disable_in => align_disable(4*NQUAD-1 downto 0),
			buf_rst_out => buf_rst,
			buf_ptr_inc_out => buf_ptr_inc,
			buf_ptr_dec_out => buf_ptr_dec,
			status_out => status
		);
		
end rtl;

