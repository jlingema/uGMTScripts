-- sy89540_cntrl
--
-- ipbus interface to Greg's xpoint control block
--
-- Dave Newbold, July 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.ipbus.all;
use work.ipbus_reg_types.all;

entity mp7_xpoint is
	port(
		clk: in std_logic;
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		clk_cntrl: out std_logic_vector(17 downto 0);
		si5326_rst: out std_logic;
		si5326_int: in std_logic;
		si5326_lol: in std_logic
	);
	
end mp7_xpoint;

architecture rtl of mp7_xpoint is

	signal stat, ctrl: ipb_reg_v(0 downto 0);

begin

	reg: entity work.ipbus_ctrlreg_v
		generic map(
			N_CTRL => 1,
			N_STAT => 1
		)
		port map(
			clk => clk,
			reset => rst,
			ipbus_in => ipb_in,
			ipbus_out => ipb_out,
			d => stat,
			q => ctrl
		);
	
	stat(0)(3) <= '0';
	stat(0)(4) <= si5326_int;
	stat(0)(5) <= si5326_lol;
	stat(0)(31 downto 6) <= (others => '0');
	
	-- Inputs to xpoint_u3
	----------------------
	-- Input 0 = osc2
	-- Input 1 = osc1
	-- Input 2 = clk2
	-- Input 3 = clk1
	
	-- Outputs to xpoint_u3
	-----------------------	
	-- Output 0 = refclk0
	-- Output 1 = refclk1
	-- Output 2 = refclk2
	-- Output 3 = refclk3
	
	xpoint_u3: entity work.xpoint
		port map ( 
			clk_i => clk,
			rst_i => rst,
			prog_i => ctrl(0)(0),
			done_o => stat(0)(0),
			sel_for_out0_i => ctrl(0)(9 downto 8),
			sel_for_out1_i => ctrl(0)(11 downto 10),
			sel_for_out2_i => ctrl(0)(13 downto 12),
			sel_for_out3_i => ctrl(0)(15 downto 14),
			load_o => clk_cntrl(3),
			config_o => clk_cntrl(2),
			sin_o(0) => clk_cntrl(4),
			sin_o(1) => clk_cntrl(5),
			sout_o(0) => clk_cntrl(0),
			sout_o(1) => clk_cntrl(1)
		);

	-- Inputs to xpoint_u15
	-----------------------
	-- Input 0 = osc2
	-- Input 1 = osc1
	-- Input 2 = clk2
	-- Input 3 = clk1
	
	-- Outputs to xpoint_u15
	------------------------	
	-- Output 0 = refclk4
	-- Output 1 = refclk5
	-- Output 2 = refclk6
	-- Output 3 = refclk7
		
	xpoint_u15: entity work.xpoint
		port map ( 
			clk_i => clk,
			rst_i => rst,
			prog_i => ctrl(0)(1),
			done_o => stat(0)(1),
			sel_for_out0_i => ctrl(0)(17 downto 16),
			sel_for_out1_i => ctrl(0)(19 downto 18),
			sel_for_out2_i => ctrl(0)(21 downto 20),
			sel_for_out3_i => ctrl(0)(23 downto 22),
			load_o => clk_cntrl(9),
			config_o => clk_cntrl(8),
			sin_o(0) => clk_cntrl(10),
			sin_o(1) => clk_cntrl(11),
			sout_o(0) => clk_cntrl(6),
			sout_o(1) => clk_cntrl(7)
		);

	-- Inputs to xpoint_u36
	-----------------------
	-- Input 0 = si5326 clk1 output
	-- Input 1 = TCLK-C
	-- Input 2 = TCLK-A
	-- Input 3 = FCLK-A
	
	-- Outputs to xpoint_u36
	------------------------	
	-- Output 0 = clk1
	-- Output 1 = clk2
	-- Output 2 = clk3
	-- Output 3 = si5326 clk1 input
		
	xpoint_u36: entity work.xpoint
		port map ( 
			clk_i => clk,
			rst_i => rst,
			prog_i => ctrl(0)(2),
			done_o => stat(0)(2),
			sel_for_out0_i => ctrl(0)(25 downto 24),
			sel_for_out1_i => ctrl(0)(27 downto 26),
			sel_for_out2_i => ctrl(0)(29 downto 28),
			sel_for_out3_i => ctrl(0)(31 downto 30),
			load_o => clk_cntrl(15),
			config_o => clk_cntrl(14),
			sin_o(0) => clk_cntrl(16),
			sin_o(1) => clk_cntrl(17),
			sout_o(0) => clk_cntrl(12),
			sout_o(1) => clk_cntrl(13)
		);
		
		si5326_rst <= ctrl(0)(4);
		
end rtl;
