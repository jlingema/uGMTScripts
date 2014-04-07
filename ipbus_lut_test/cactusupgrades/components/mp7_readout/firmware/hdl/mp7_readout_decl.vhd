-- mp7_counters_decl
--
-- Defines the array subtypes for distributed counters
--
-- Dave Newbold, September 2013

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.mp7_data_types.all;
use work.ipbus_reg_types.all;

package mp7_readout_decl is

	constant DAQ_N_BANKS: integer := 1;
	constant DAQ_N_TYPES: integer := 1;
	constant DAQ_N_TRIG: integer := 1;

	constant DAQ_BWIDTH: integer := calc_width(DAQ_N_BANKS);

	type daq_bus is
		record
			init: std_logic;
			token: std_logic;
			data: lword;
			strobe: std_logic;
		end record;
		
	constant DAQ_BUS_NULL: daq_bus := ('0', '0', LWORD_NULL, '0');
	type daq_bus_array is array(natural range <>) of daq_bus;

	subtype daq_cap_bus is std_logic_vector(DAQ_N_BANKS - 1 downto 0);
	type daq_cap_bus_array is array(natural range <>) of daq_cap_bus;
	
end mp7_readout_decl;

