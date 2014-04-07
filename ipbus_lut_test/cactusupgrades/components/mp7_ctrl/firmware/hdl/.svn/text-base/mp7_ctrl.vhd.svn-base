-- mp7_ctrl
--
-- General control / status registers for MP7, plus IO interfaces for ancillary devices
--
-- All clocks are derived from 125MHz xtal clock for backplane ethernet serdes
--
-- Dave Newbold, June 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.ipbus.all;
use work.ipbus_trans_decl.all;
use work.ipbus_reg_types.all;
use work.ipbus_decode_mp7_ctrl.all;

entity mp7_ctrl is
	generic(
		FW_REV: std_logic_vector(31 downto 0) := (others => '0');
		LHC_BUNCH_COUNT: integer;
		NQUAD: integer;
		CLOCK_RATIO: integer
	);
	port(
		clk: in std_logic; -- ipbus clock (nominally ~30MHz) & reset
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		nuke: out std_logic;
		soft_rst: out std_logic;
		qsel: out std_logic_vector(7 downto 0); -- MGT / buffer channel select
		ppsel: out std_logic_vector(5 downto 0); -- PP channel select
		pp_data_sel: out std_logic; -- PP configuration (prob. remove this later)
		board_loc: out std_logic_vector(31 downto 0); -- board location register
		debug: in std_logic_vector(7 downto 0) := X"00"; -- General debug input
		clk40_rst: out std_logic; -- TTC clock control and status
		clk40_sel: out std_logic;
		clk40_lock: in std_logic;
		clk40_stop: in std_logic;
		clk_cntrl: out std_logic_vector(17 downto 0); -- IO signals to clock mux devices
		si5326_rst: out std_logic; -- IO signals to SI5326 clock device
		si5326_int: in std_logic := '0';
		si5326_lol: in std_logic := '0';
		si5326_scl: out std_logic;
		si5326_sda_i: in std_logic := '0';
		si5326_sda_o: out std_logic;
		minipod_top_rst_b: out std_logic; -- IO signals for top minipods
		minipod_top_scl: out std_logic;
		minipod_top_sda_o: out std_logic;
		minipod_top_sda_i: in std_logic := '0';
		minipod_bot_rst_b: out std_logic; -- IO signals for bottom minipods
		minipod_bot_scl: out std_logic;
		minipod_bot_sda_o: out std_logic;
		minipod_bot_sda_i: in std_logic := '0'
	);

end mp7_ctrl;

architecture rtl of mp7_ctrl is

	signal ipbw: ipb_wbus_array(N_SLAVES - 1 downto 0);
	signal ipbr: ipb_rbus_array(N_SLAVES - 1 downto 0);
	signal ctrl, stat, loc_q: ipb_reg_v(0 downto 0);
	
begin
		
	fabric: entity work.ipbus_fabric_sel
    generic map(
    	NSLV => N_SLAVES,
    	SEL_WIDTH => IPBUS_SEL_WIDTH)
    port map(
      ipb_in => ipb_in,
      ipb_out => ipb_out,
      sel => ipbus_sel_mp7_ctrl(ipb_in.ipb_addr),
      ipb_to_slaves => ipbw,
      ipb_from_slaves => ipbr
    );

	id: entity work.board_id
		generic map(
			FW_REV => FW_REV,
			LHC_BUNCH_COUNT => LHC_BUNCH_COUNT,
			NQUAD => NQUAD,
			CLOCK_RATIO => CLOCK_RATIO
		)
		port map(
			clk => clk,
			rst => rst,
			ipb_in => ipbw(N_SLV_ID),
			ipb_out => ipbr(N_SLV_ID)
		);
		
	loc: entity work.ipbus_reg_v
		generic map(
			N_REG => 1
		)
		port map(
			clk => clk,
			reset => rst,
			ipbus_in => ipbw(N_SLV_LOC),
			ipbus_out => ipbr(N_SLV_LOC),
			q => loc_q
		);
	
	board_loc <= loc_q(0);

	xpoint: entity work.mp7_xpoint
		port map(
			clk => clk,
			rst => rst,
			ipb_in => ipbw(N_SLV_XPOINT),
			ipb_out => ipbr(N_SLV_XPOINT),
			clk_cntrl => clk_cntrl,
			si5326_rst => si5326_rst,
			si5326_int => si5326_int,
			si5326_lol => si5326_lol
		);
		
	csr: entity work.ipbus_ctrlreg_v
		generic map(
			N_CTRL => 1,
			N_STAT => 1
		)
		port map(
			clk => clk,
			reset => rst,
			ipbus_in => ipbw(N_SLV_CSR),
			ipbus_out => ipbr(N_SLV_CSR),
			d => stat,
			q => ctrl
		);
	
	stat(0) <= X"0000" & debug & "000000" & clk40_stop & clk40_lock;
	
	nuke <= ctrl(0)(0);
	clk40_rst <= ctrl(0)(2);
	clk40_sel <= ctrl(0)(3);
	qsel <= ctrl(0)(23 downto 16);
	ppsel <= ctrl(0)(29 downto 24);
	pp_data_sel <= ctrl(0)(4);
	soft_rst <= ctrl(0)(5);	

	i2c_clk: entity work.ipbus_i2c_master
		port map(
			clk => clk,
			rst => rst,
			ipb_in => ipbw(N_SLV_I2C_CLK),
			ipb_out => ipbr(N_SLV_I2C_CLK),
			scl => si5326_scl,
			sda_o => si5326_sda_o,
			sda_i => si5326_sda_i
	);
	
	i2c_top: entity work.ipbus_i2c_master
		port map(
			clk => clk,
			rst => rst,
			ipb_in => ipbw(N_SLV_I2C_TOP),
			ipb_out => ipbr(N_SLV_I2C_TOP),
			scl => minipod_top_scl,
			sda_o => minipod_top_sda_o,
			sda_i => minipod_top_sda_i
		);

	minipod_top_rst_b <= '1';	
	
	i2c_bot: entity work.ipbus_i2c_master
		port map(
			clk => clk,
			rst => rst,
			ipb_in => ipbw(N_SLV_I2C_BOT),
			ipb_out => ipbr(N_SLV_I2C_BOT),
			scl => minipod_bot_scl,
			sda_o => minipod_bot_sda_o,
			sda_i => minipod_bot_sda_i
		);

	minipod_bot_rst_b <= '1';	

end rtl;

