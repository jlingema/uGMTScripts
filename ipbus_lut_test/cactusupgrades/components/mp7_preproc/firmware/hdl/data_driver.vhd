
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.mp7_data_types.all;
use work.ipbus.all;
use work.package_types.all;
use work.package_utilities.all;


-- Block of up to 16 RAMS to drive Time Multiplexing block or 
-- algorithim block or SerDes blocks.  Common address bus on 
-- "pat" side ensures all channels transmit/receive data in sync.
-- Standard comm bus for read/write access on the other side.

-- Requires 0x4000 of address space from comm module

entity data_driver is
  generic(
    chans:             natural);
  port(
		clk: in std_logic;
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
    pat_clk: in std_logic;
    pat_stb: in std_logic;
    pat_wen: in std_logic;
    pat_add: in std_logic_vector(8 downto 0);
    pat_rdata: out ldata(chans-1 downto 0);
    pat_wdata: in ldata(chans-1 downto 0));
end entity data_driver;

architecture behave of data_driver is

  signal ram_sel: natural range 0 to 15;
  signal rdata: type_vector_of_stdlogicvec_x32(chans-1 downto 0);
  signal ack, stb: std_logic_vector(chans-1 downto 0);

begin

  assert (chans <= 16) report "The maximum number of chans is 16" severity error;

  ram_sel <= to_integer(unsigned(ipb_in.ipb_addr(13 downto 10)));

  ipb_out.ipb_rdata <= rdata(ram_sel) when ram_sel < chans else x"00000000";
  ipb_out.ipb_ack <= ack(ram_sel) when ram_sel < chans else '0';
  ipb_out.ipb_err <= '0';

  rams: for i in 0 to chans-1 generate
    
    stb(i) <= '1' when ((ram_sel = i) and (ipb_in.ipb_strobe = '1')) else '0';

--			entity ipbus_dpram is
--				generic(
--					ADDR_WIDTH: natural
--				);
--				port(
--					clk => clk,
--					rst => rst,
--					ipb_in => ipb_in,
--					ipb_out => ipb_out,
--					rclk => pat_clk,
--					we => pat_wen,
--					d => pat_rdata(i).data,
--					q => pat_rdata(i).data,
--					addr: in std_logic_vector(ADDR_WIDTH - 1 downto 0)
--				);
	

    dpram: pattern_ram_36x512_32x1024
      PORT MAP(
          pat_clk             => pat_clk,
          pat_stb             => pat_stb,
          pat_wen             => pat_wen,
          pat_add             => pat_add,
          pat_rdata           => pat_rdata(i).data,
          pat_rdata_valid     => pat_rdata(i).valid,
          pat_wdata           => pat_wdata(i).data,
          pat_wdata_valid     => pat_wdata(i).valid,
          ram_clk             => clk,
          ram_stb             => stb(i),
          ram_wen             => ipb_in.ipb_write,
          ram_add             => ipb_in.ipb_addr(9 downto 0),
          ram_wdata           => ipb_in.ipb_wdata,
          ram_ack             => ack(i),
          ram_rdata           => rdata(i));

  end generate;

end architecture behave;



