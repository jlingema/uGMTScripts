----------------------------------------------------------------------------------
-- Company: UoB
-- Engineer: Sudeshna Dasgupta
-- 
-- Create Date:    15:35:28 02/10/2014 
-- Design Name: 
-- Module Name:    mp7_daq - rtl 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.ipbus.all;
use work.ipbus_reg_types.all;
use work.mp7_data_types.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mp7_daq is
generic
	(
		ADDR_WIDTH: integer;
		CLOCK_RATIO: positive;
		LHC_BUNCH_COUNT: integer
	);
port(
		clk: in std_logic;
		rst: in std_logic;
		clk_p: in std_logic; -- Parallel data clock
		ipb_in_daqbuf: in ipb_wbus;
		ipb_out_daqbuf: out ipb_rbus
	);
end mp7_daq;

architecture rtl of mp7_daq is

signal daqbufdr, daqbufqr: std_logic_vector(35 downto 0);	-- to be connected to derandomizer block
signal daqbufwe : std_logic;											-- to be connected to control block
signal daqbufaddr : std_logic_vector(ADDR_WIDTH - 1 downto 0);
signal ctr: std_logic_vector(22 downto 0);

begin

count: entity work.bunch_ctr
			generic map
			(
				CLOCK_RATIO => CLOCK_RATIO,
				CLK_DIV => 1,
				CTR_WIDTH => ctr'length,
				LHC_BUNCH_COUNT => LHC_BUNCH_COUNT,
				OFFSET => 0,
				LOCK_CTR => false
			)
			port map(	
				clk => clk_p,
				rst => '0',
				clr => '0',
				bc0 => daqbufwe,
				bctr => ctr
			);

daqbufaddr <= ctr(ADDR_WIDTH - 1 downto 0);
daqbufdr <= (others => '0');
daqbufqr <= (others => '0');

daqbuf: entity work.ipbus_ported_dpram36
		generic map
		(
			ADDR_WIDTH => ADDR_WIDTH
		)
		port map
		(
			clk => clk,
			rst => rst,
			ipb_in => ipb_in_daqbuf,
			ipb_out => ipb_out_daqbuf,
			rclk => clk_p,
			we => daqbufwe,
			d => daqbufdr,
			q => daqbufqr,
			addr => daqbufaddr
		);

end rtl;

