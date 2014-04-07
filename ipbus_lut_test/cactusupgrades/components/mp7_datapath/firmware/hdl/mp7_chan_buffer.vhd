-- mp7_chan_buffer
--
-- Latency / cap / playback & derandomiser buffers for one serdes channel (tx or tx)
--
-- Note that there is one stage of data pipelining in this block
--
-- ctrl(1 downto 0): buffer mode: 0: latency buf; 1: capture; 2: play once; 3: play repeat
-- ctrl(3 downto 2): data source: 0: input data; 1: buffer playback; 2: pattern gen; 3: zeroes
--
-- Dave Newbold, March 2014

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;
use work.ipbus_reg_types.all;
use work.mp7_data_types.all;
use work.mp7_readout_decl.all;

entity mp7_chan_buffer is
	generic(
		CLOCK_RATIO: positive;
		ADDR_WIDTH: integer;
		DR_ADDR_WIDTH: integer;
		LHC_BUNCH_COUNT: integer;
		INDEX: integer
	);
	port(
		clk: in std_logic; -- ipbus control signals
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;		
		ipb_in_buf: in ipb_wbus;
		ipb_out_buf: out ipb_rbus;
		clk_p: in std_logic; -- parallel data clock & reset
		rst_p: in std_logic;
		orb: in std_logic_vector(11 downto 0); -- orbit counter
		bctr: in std_logic_vector(11 downto 0); -- bunch counter signals
		pctr: in std_logic_vector(2 downto 0);
		bmax: in std_logic;
		ttc_cmd: in std_logic_vector(3 downto 0);
		cap_bus: in daq_cap_bus; -- daq cature signal
		daq_bus_in: in daq_bus; -- daq readout bus
		daq_bus_out: out daq_bus;
		d: in lword; -- input & output data
		q: out lword
	);

end mp7_chan_buffer;

architecture rtl of mp7_chan_buffer is

	signal go, resync: std_logic;

	signal ctrl, stat: ipb_reg_v(0 downto 0);
	signal stb: std_logic_vector(0 downto 0);
	signal bsel: integer range DAQ_N_BANKS - 1 downto 0;
	
	signal buf_rst, last_cyc, last_word, trig_word, v, buf_zero: std_logic;
	signal actr: unsigned(ADDR_WIDTH -1 downto 0);
	signal buf_addr: std_logic_vector(ADDR_WIDTH - 1 downto 0);
	signal buf_we, buf_v, go_pend, cap_done, cap_orb: std_logic;
	
	signal qs: lword;
	signal buf_d, buf_q: std_logic_vector(35 downto 0);
	
	signal dr_we: std_logic;
	signal dr_raddr, dr_waddr: std_logic_vector(DR_ADDR_WIDTH - 1 downto 0);
	signal dr_data: lword;
	 
begin

-- TTC commands

	go <= '1' when ttc_cmd = X"C" else '0';
	resync <= '1' when ttc_cmd = X"5" else '0';

-- Control register

	ctrlreg: entity work.ipbus_ctrlreg_v
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
			q => ctrl,
			stb => stb
		);

	stat(0)(0) <= '0';
	stat(0)(1) <= cap_done;
	stat(0)(31 downto 2) <= (others => '0');

-- Buffer sync logic

	last_cyc <= '1' when pctr = std_logic_vector(to_unsigned(CLOCK_RATIO - 1, 3)) and bmax = '1' else '0';
	trig_word <= '1' when bctr = ctrl(0)(19 downto 8) and pctr = std_logic_vector(to_unsigned(CLOCK_RATIO - 1, 3)) else '0';
	buf_rst <= resync or rst_p;

	process(clk_p)
	begin
		if rising_edge(clk_p) then
			v <= ((v and not last_word) or trig_word) and not buf_rst;
		end if;
	end process;
	
-- Address counter

	last_word <= '1' when actr = unsigned(ctrl(0)(31 downto 20)) else '0';
	buf_zero <= resync when ctrl(0)(1 downto 0) = "00" else trig_word;

	process(clk_p)
	begin
		if rising_edge(clk_p) then
			if buf_zero = '1' or last_word = '1' then
				actr <= (others => '0');
			else
				actr <= actr + 1;
			end if;
		end if;
	end process;
	
	buf_addr <= std_logic_vector(actr);
	
-- Write enable / valid logic

	process(clk_p)
	begin
		if rising_edge(clk_p) then
			go_pend <= (go_pend or go) and not (cap_orb or buf_rst);
			if last_cyc = '1' then
				cap_orb <= go_pend;
			end if;
			cap_done <= (cap_done or (cap_orb and last_word)) and not (go or buf_rst);
		end if;
	end process;
	
	with ctrl(0)(1 downto 0) select buf_we <=
		'1' when "00",
		v and cap_orb when "01",
		'0' when others;
		
	with ctrl(0)(1 downto 0) select buf_v <=
		v when "10",
		'1' when "11",
		'0' when others;
	
-- Buffer
		
	buf_d <= '0' & d.valid & d.data(31 downto 16) & "00" & d.data(15 downto 0);

	rxbuf: entity work.ipbus_ported_dpram36
		generic map(
			ADDR_WIDTH => ADDR_WIDTH
		)
		port map(
			clk => clk,
			rst => rst,
			ipb_in => ipb_in_buf,
			ipb_out => ipb_out_buf,
			rclk => clk_p,
			we => buf_we,
			d => buf_d,
			q => buf_q,
			addr => buf_addr
		);
		
--	preg: process(clk_p)
--	begin
--		if rising_edge(clk_p) then
			qs.data <= buf_q(33 downto 18) & buf_q(15 downto 0);
			qs.valid <= buf_q(34);
--		end if;
--	end process;

-- Data source select
	
	with ctrl(0)(3 downto 2) select q.data <=
		d.data when "00",
		qs.data when "01",
		orb & bctr & std_logic_vector(to_unsigned(INDEX, 8)) when "10",
		(others => '0') when others;
	
	with ctrl(0)(3 downto 2) select q.valid <=
		d.valid when "00",
		qs.valid and buf_v when "01",
		buf_v when others;
		
-- Derandomiser

	bsel <= to_integer(unsigned(ctrl(0)(4 + DAQ_BWIDTH downto 4))) when DAQ_BWIDTH > 1 else 0;
	dr_we <= cap_bus(bsel);

	process(clk_p)
	begin
		if rising_edge(clk_p) then
			if rst_p = '1' or resync = '1' then
				dr_waddr <= (others => '0');
			elsif dr_we = '1' then
				dr_waddr <= std_logic_vector(unsigned(dr_waddr) + 1);
			end if;
		end if;
	end process;

	derand: entity work.mp7_derand
		generic map(
			ADDR_WIDTH => DR_ADDR_WIDTH
		)
		port map(
			clk => clk_p,
			waddr => dr_waddr,
			we => dr_we,
			d => qs,
			raddr => dr_raddr,
			q => dr_data
		);

-- DAQ mux block

	mux: entity work.mp7_daqmux
		generic map(
			ADDR_WIDTH => DR_ADDR_WIDTH,
			INDEX => INDEX
		)
		port map(
			clk_p => clk_p,
			rst_p => rst_p,
			resync => resync,
			bank => ctrl(0)(3 + DAQ_BWIDTH downto 4),
			daq_bus_in => daq_bus_in,
			daq_bus_out => daq_bus_out,
			addr => dr_raddr,
			data => dr_data
		);

end rtl;

