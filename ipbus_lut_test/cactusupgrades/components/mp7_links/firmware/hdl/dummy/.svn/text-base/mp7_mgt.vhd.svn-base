-- mp7_mgt
--
-- Wrapper for MGT quads - this version for equal width interfaces only
-- Equal number of input and output channels for now
--
-- Dave Newbold, July 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;
use work.mp7_data_types.all;
library unisim;
use unisim.VComponents.all;

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

end mp7_mgt;

architecture rtl of mp7_mgt is

	signal ipb_in_q: ipb_wbus_array(NQUAD - 1 downto 0);
	signal ipb_out_q: ipb_rbus_array(NQUAD - 1 downto 0);

begin

-- If this decode is large, might need to insert ipbus_pipeline stage here

	fabric: entity work.ipbus_fabric_sel
		generic map(
			NSLV => NQUAD,
			SEL_WIDTH => 5
		)
		port map(
			sel => qsel(6 downto 2),
			ipb_in => ipb_in,
			ipb_out => ipb_out,
			ipb_to_slaves => ipb_in_q,
			ipb_from_slaves => ipb_out_q
		);
		
	qgen: for i in NQUAD - 1 downto 0 generate
	
		constant hi: integer := (i + 1) * 4 - 1;
		constant li: integer := i * 4;
	
	begin
	
		ipb_out_q(i) <= IPB_RBUS_NULL;
		q(hi downto li) <= (others => LWORD_NULL);
			
	end generate;
	
	ipb_out_align <= IPB_RBUS_NULL;
	ipb_out_drp <= IPB_RBUS_NULL;
	ipb_out_drp_com <= IPB_RBUS_NULL;
	
	refclk_mon <= '0';
	txclk_mon <= '0';
	rxclk_mon <= '0';
	
end rtl;

