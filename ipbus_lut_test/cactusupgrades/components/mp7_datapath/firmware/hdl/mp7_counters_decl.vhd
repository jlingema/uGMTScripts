-- mp7_counters_decl
--
-- Defines the array subtypes for distributed counters
--
-- orbit counter is only 12 bits rather than the CMS standard 24, since
-- it's only used for debugging in this part of the design.
--
-- Dave Newbold, September 2013

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package mp7_counters_decl is
  
	type bctr_array is array(natural range <>) of std_logic_vector(11 downto 0);
	type pctr_array is array(natural range <>) of std_logic_vector(2 downto 0);
	type octr_array is array(natural range <>) of std_logic_vector(11 downto 0);
	type ttc_cmd_array is array(natural range <>) of std_logic_vector(3 downto 0);
	
	constant TTC_DEL: integer := 4;
	
end mp7_counters_decl;

