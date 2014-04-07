-- board_id
--
-- The 'board ID' register - four ipbus locations
--
-- Word 0: Magic word 0xdeadbeaf
-- Word 1: firmware design ID (8b) & firmware rev (3 * 8b)
-- Word 2: lhc bunch count (16b) & clock ratio (8b) & nquad (8b)
-- Word 3: unused
--
-- Dave Newbold, March 2014

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

use work.ipbus.all;

entity board_id is
	generic(
		FW_REV: std_logic_vector(31 downto 0);
		LHC_BUNCH_COUNT: integer;
		NQUAD: integer;
		CLOCK_RATIO: integer
	);
	port(
		clk: in std_logic; -- ipbus clock (nominally ~30MHz) & reset
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus
	);

end board_id;

architecture rtl of board_id is

begin

	ipb_out.ipb_ack <= ipb_in.ipb_strobe;
	ipb_out.ipb_err <= '0';
	
	with ipb_in.ipb_addr(1 downto 0) select ipb_out.ipb_rdata <=
		X"DEADBEAF" when "00",
		FW_REV when "01",
		std_logic_vector(to_unsigned(LHC_BUNCH_COUNT, 16)) & std_logic_vector(to_unsigned(CLOCK_RATIO, 8)) &
			std_logic_vector(to_unsigned(NQUAD, 8)) when "10",
		X"00000000" when others; -- For future expansion

end rtl;

