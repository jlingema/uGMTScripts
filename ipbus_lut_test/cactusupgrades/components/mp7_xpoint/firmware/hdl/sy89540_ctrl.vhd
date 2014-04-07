-- sy89540_ctrl
--
-- ipbus interface to Greg's xpoint control block
--
-- Dave Newbold, July 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.ipbus.all;

entity mp7_xpoint is
	port(
		clk: in std_logic;
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		clk_ctrl: out std_logic_vector(17 downto 0);
		si5326_rst: out std_logic;
		si5236_int: in std_logic;
		si5326_lol: in std_logic
	);
	
end mp7_xpoint;

architecture rtl of mp7_xpoint is

	signal d, q: std_logic_vector(31 downto 0);

begin

	reg: ipbus_ctrlreg
		port map(
			clk => clk,
			reset => rst,
			ipbus_in => ipb_in,
			ipbus_out => ipb_out,
			d => d,
			q => q
		);
	
	d(3) <= '0';
	d(4) <= si5326_int;
	d(5) <= si5326_lol;
	d(31 downto 6) <= (others => '0');
	
	xpoint_a: entity work.xpoint
		port map ( 
			clk_i => clk,
			rst_i => rst,
			prog_i => q(0),
			done_o => d(0),
			sel_for_out0_i => q(9 downto 8),
			sel_for_out1_i => q(11 downto 10),
			sel_for_out2_i => q(13 downto 12),
			sel_for_out3_i => q(15 downto 14),
			load_o => clk_ctrl(3),
			config_o => clk_ctrl(2),
			sin_o(0) => clk_ctrl(4),
			sin_o(1) => clk_ctrl(5),
			sout_o(0) => clk_ctrl(0),
			sout_o(1) => clk_ctrl(1)
		);

	xpoint_b: entity work.xpoint
		port map ( 
			clk_i => clk,
			rst_i => rst,
			prog_i => q(1),
			done_o => d(1),
			sel_for_out0_i => q(17 downto 16),
			sel_for_out1_i => q(19 downto 18),
			sel_for_out2_i => q(21 downto 20),
			sel_for_out3_i => q(23 downto 22),
			load_o => clk_ctrl(9),
			config_o => clk_ctrl(8),
			sin_o(0) => clk_ctrl(10),
			sin_o(1) => clk_ctrl(11),
			sout_o(0) => clk_ctrl(6),
			sout_o(1) => clk_ctrl(7)
		);
		
	xpoint_c: entity work.xpoint
		port map ( 
			clk_i => clk,
			rst_i => rst,
			prog_i => q(2),
			done_o => d(2),
			sel_for_out0_i => q(25 downto 24),
			sel_for_out1_i => q(27 downto 26),
			sel_for_out2_i => q(29 downto 28),
			sel_for_out3_i => q(31 downto 30),
			load_o => clk_ctrl(15),
			config_o => clk_ctrl(14),
			sin_o(0) => clk_ctrl(16),
			sin_o(1) => clk_ctrl(17),
			sout_o(0) => clk_ctrl(12),
			sout_o(1) => clk_ctrl(13)
		);
		
		si5326_rst <= q(4);
		
end rtl;
