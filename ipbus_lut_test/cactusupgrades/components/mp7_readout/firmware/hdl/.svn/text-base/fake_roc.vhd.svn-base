-- mp7_readout
--
-- All the stuff to read out data from the MP7 via ipbus or AMC13
--
-- Dave Newbold, March 2014

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.ipbus.all;
use work.ipbus_reg_types.all;
use work.mp7_readout_decl.all;

entity fake_roc is
	port(
		clk: in std_logic; -- ipbus clock, rst, bus
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		resync: in std_logic;
		bunch_ctr: in std_logic_vector(11 downto 0);
		l1a: in std_logic;
		clk_p: in std_logic; -- data clock, rst
		rst_p: in std_logic;
		cap_bus: out daq_cap_bus; -- data capture strobes
		daq_bus_out: out daq_bus; -- DAQ daisy-chain bus
		daq_bus_in: in daq_bus
	);

end fake_roc;

architecture rtl of fake_roc is

	signal ctrl: ipb_reg_v(0 downto 0);
	signal stat: ipb_reg_v(1 downto 0);
	signal stb: std_logic_vector(0 downto 0);
	signal rsti, go, bxmatch, pend: std_logic;	
	type state_type is (ST_IDLE, ST_CAP, ST_INIT, ST_TOK, ST_RO);
	signal state: state_type;
	signal cctr: unsigned(7 downto 0);
	signal init_word, hdr_word: std_logic_vector(31 downto 0);
	
begin

-- ctrl reg

	reg: entity work.ipbus_syncreg_v
		generic map(
			N_CTRL => 1,
			N_STAT => 2
		)
		port map(
			clk => clk,
			rst => rst,
			ipb_in => ipb_in,
			ipb_out => ipb_out,
			slv_clk => clk_p,
			d => stat,
			q => ctrl,
			stb => stb
		);

	stat(0)(0) <= '0' when state = ST_IDLE else '1';
	stat(0)(1) <= daq_bus_in.data.valid;
	stat(0)(2) <= daq_bus_in.init;
	stat(0)(3) <= daq_bus_in.token;
	stat(0)(4) <= daq_bus_in.strobe;		
	stat(0)(31 downto 5) <= (others => '0');
	stat(1) <= daq_bus_in.data.data;
		
-- state machine
		
	rsti <= rst_p or resync; -- CDC (related clocks)
	
	process(clk_p)
	begin
		if rising_edge(clk_p) then
			pend <= (pend or stb(0)) and not (rsti or bxmatch);
		end if;
	end process;
	
	bxmatch <= '1' when bunch_ctr = ctrl(0)(23 downto 12) else '0'; -- CDC (related clocks)
	go <= pend and bxmatch;

	process(clk_p)
	begin
		if rising_edge(clk_p) then
		
			if rsti = '1'then
				state <= ST_IDLE;
			else
				case state is

				when ST_IDLE =>  -- Starting state
					if go = '1' then
						state <= ST_CAP; -- CDC (related clocks)
					end if;

				when ST_CAP => -- Send caps
					if cctr = X"00" then
						state <= ST_INIT;
					end if;

				when ST_INIT => -- Send init words
					state <= ST_TOK;
				
				when ST_TOK => -- Send token
					state <= ST_RO;
				
				when ST_RO => -- Wait for readout to finish
					if daq_bus_in.token = '1' then
						state <= ST_IDLE;
					end if;

				end case;
			end if;
		end if;
	end process;

-- capture counter
	
	process(clk_p)
	begin
		if rising_edge(clk_p) then
			if go = '1' then
				cctr <= unsigned(ctrl(0)(7 downto 0));
			elsif state = ST_CAP then
				cctr <= cctr - 1;
			end if;
		end if;
	end process;
	
	cap_bus(0) <= '1' when state = ST_CAP else '0';
	cap_bus(DAQ_N_BANKS - 1 downto 1) <= (others => '0');

-- data onto bus

	init_word <= X"10" & X"000" & X"0" & ctrl(0)(7 downto 0); -- Always read out from loc 0 for now
	hdr_word <= X"FF00" & X"1" & ctrl(0)(23 downto 12); -- Dummy event header for now
	
-- daq_bus_out stuff
	
	daq_bus_out.init <= '1' when state = ST_INIT else '0';
	daq_bus_out.token <= '1' when state = ST_TOK else '0';
	daq_bus_out.strobe <= '1' when state = ST_TOK else '0';

	with state select daq_bus_out.data.data <=
		init_word when ST_INIT,
		hdr_word when ST_TOK,
		(others => '0') when others;
		
	daq_bus_out.data.valid <= '0';
	
end rtl;

