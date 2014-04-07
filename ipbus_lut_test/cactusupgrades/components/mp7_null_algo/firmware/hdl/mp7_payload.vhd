-- null_algo
--
-- Do-nothing top level algo for testing
--
-- Dave Newbold, July 2013

library IEEE;
use IEEE.STD_LOGIC_1164.all;

use work.ipbus.all;
use work.mp7_data_types.all;
use work.ipbus_decode_mp7_payload.all;

entity mp7_payload is
  generic(
    NCHAN           : positive;
    PIPELINE_STAGES : positive := 1
    );
  port(
    clk     : in  std_logic;                  -- ipbus signals
    rst     : in  std_logic;
    ipb_in  : in  ipb_wbus;
    ipb_out : out ipb_rbus;
    clk_p   : in  std_logic;                  -- data clock
    d       : in  ldata(NCHAN - 1 downto 0);  -- data in
    q       : out ldata(NCHAN - 1 downto 0)   -- data out
    );

end mp7_payload;

architecture rtl of mp7_payload is
  
  signal ipbw : ipb_wbus_array(N_SLAVES - 1 downto 0);
  signal ipbr : ipb_rbus_array(N_SLAVES - 1 downto 0);

begin

  -- ipbus address decode
  fabric : entity work.ipbus_fabric_sel
    generic map(
      NSLV      => N_SLAVES,
      SEL_WIDTH => IPBUS_SEL_WIDTH)
    port map(
      ipb_in          => ipb_in,
      ipb_out         => ipb_out,
      sel             => ipbus_sel_mp7_payload(ipb_in.ipb_addr),
      ipb_to_slaves   => ipbw,
      ipb_from_slaves => ipbr
      );

  lut_gen : for i in 3 downto 0 generate
    lut_i : entity work.ipbus_dpram
      generic map(
        ADDR_WIDTH => 8)
      port map(
        clk            => clk,
        rst            => rst,
        ipb_in         => ipbw(i),
        ipb_out        => ipbr(i),
        rclk           => clk_p,
        q(7 downto 0)  => q(0).data(i*8+7 downto i*8),
        q(31 downto 8) => open,
        addr           => d(0).data(i*8+7 downto i*8)
        );
  end generate lut_gen;


end rtl;

