-- mp7_daqmux
--
-- Handles insertion of derandomiser data onto daq bus
--
-- Dave Newbold, March 2014

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;
use work.ipbus_reg_types.all;
use work.mp7_data_types.all;
use work.mp7_readout_decl.all;

entity mp7_daqmux is
	generic(
		ADDR_WIDTH: integer;
		INDEX: integer
	);
	port(
		clk_p: in std_logic; -- parallel data clock & reset
		rst_p: in std_logic;
		resync: in std_logic;
		bank: in std_logic_vector(DAQ_BWIDTH - 1 downto 0); -- DAQ bank
		daq_bus_in: in daq_bus; -- daq readout bus
		daq_bus_out: out daq_bus;
		addr: out std_logic_vector(ADDR_WIDTH - 1 downto 0);
		data: in lword
	);

end mp7_daqmux;

architecture rtl of mp7_daqmux is

	type state_type is (ST_IDLE, ST_HDR, ST_DATA);
	signal state: state_type;
	signal rsti, last: std_logic;
	signal hdr: lword;
	signal dstart: std_logic_vector(ADDR_WIDTH - 1 downto 0);
	signal dwords: std_logic_vector(7 downto 0);
	signal dctr: unsigned(7 downto 0);
	signal actr: unsigned(ADDR_WIDTH - 1 downto 0);
	signal dbin: daq_bus;

begin

	rsti <= rst_p or resync;

	process(clk_p)
	begin
		if rising_edge(clk_p) then
		
			if rsti = '1'then
				state <= ST_IDLE;
			else
				case state is

				when ST_IDLE =>  -- Starting state
					if daq_bus_in.token = '1' then
						state <= ST_HDR;
					end if;
				
				when ST_HDR => -- Send header
					if last = '0' then
						state <= ST_DATA;
					else
						state <= ST_IDLE;
					end if;

				when ST_DATA => -- Send data
					if last = '1' then
						state <= ST_IDLE;
					end if;
				
				end case;
			end if;
		end if;
	end process;

	process(clk_p)
	begin
		if rising_edge(clk_p) then

			if rsti = '1' then
				dstart <= (others => '0');
				dwords <= (others => '0');
			elsif daq_bus_in.init = '1' then
				if DAQ_BWIDTH = 0 or daq_bus_in.data.data(DAQ_BWIDTH + 27 downto 28) = bank then
					dstart <= daq_bus_in.data.data(ADDR_WIDTH + 11 downto 12);
					dwords <= daq_bus_in.data.data(7 downto 0);
				end if;
			end if;

			if state = ST_HDR then
				dctr <= unsigned(dwords);
			elsif state = ST_DATA then
				dctr <= dctr - 1;
			end if;

			dbin <= daq_bus_in;			

		end if;
	end process;
	
	last <= '1' when dctr = X"00" else '0';	
	hdr.data <= std_logic_vector(to_unsigned(INDEX, 8)) & dwords & X"0000";
	hdr.valid <= '0';

	process(clk_p)
	begin
		if falling_edge(clk_p) then
			if state = ST_DATA then
				actr <= actr + 1;
			else
				actr <= unsigned(dstart);
			end if;
		end if;
	end process;
		
	addr <= std_logic_vector(actr);

	daq_bus_out.token <= last;
	daq_bus_out.init <= dbin.init;
	
	with state select daq_bus_out.data <=
		dbin.data when ST_IDLE,
		hdr when ST_HDR,
		data when others;
		
	with state select daq_bus_out.strobe <=
		dbin.strobe when ST_IDLE,
		'1' when others;
		
end rtl;

