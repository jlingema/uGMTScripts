----------------------------------------------------------------------------------
-- Company: Imperial College London

-- Engineer: Greg Iles

-- Description: Test bench for uC to FPGA interface.  Based on 25LC640A
-- EEPROM.  Writes data into FPGA via SPI and then reads it back via SPI.
-- It then sets and clears handshake flags via SPI and verifies all OK 
-- via reading status reg via SPI.  It then sets the cfgrdy and transrdy
-- flags via SPI.  The latter initiates a check on the buffer (i.e. not 
-- SPI) and sets transdone.  This is verfied with a check on the status 
-- reg via SPI.

-- Revision : 3.0 (i.e. includes seprate clks for SPI interface and buffer)
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

library work;
use work.package_txt_util.all;

entity spi_interface_tb is
end spi_interface_tb;

architecture Behavioral of spi_interface_tb is

  component spi_interface is
  port(
    -- The fpga clk/rst used to drive the SPI interface
    -- Needs to be musch faster than SPI clk   
    -- Tested with 125MHz fpga clk and 10MHz SPI clk.    
    clk:                in std_logic;
    rst:                in std_logic;
    -- SPI interface
    spi_miso:           out std_logic;
    spi_mosi:           in std_logic;
    spi_sck:            in std_logic;
    spi_cs_b:           in std_logic;
    -- User clk/rst
    user_clk:           in std_logic;
    user_rst:           in std_logic;
    -- Config handshake
    cfgreq_in:          in std_logic;
    cfgrdy_out:         out std_logic;
    -- IpBus handshake
    transrdy_out:         out std_logic;    
    transdone_in:          in std_logic;
    -- Interface to buffer    
    buf_addr_in:       in std_logic_vector(9 downto 0);
    buf_wdata_in:      in std_logic_vector(31 downto 0);
    buf_wen_in:        in std_logic;   
    buf_rdata_out:     out std_logic_vector(31 downto 0));   
  end component;

  -- Read two bytes from  address x0138.  make sure 32bit aligned for readback via 32bit bus
  constant rd_instr: std_logic_vector(0 to 7) :=  "00000011";
  constant rd_add: std_logic_vector(15 downto 0) :=  x"0138";
  constant rd_dat: std_logic_vector(31 downto 0) :=  x"00" & x"00" & x"00" & x"00";

  constant wt_instr: std_logic_vector(0 to 7) :=  "00000010";
  constant wt_add: std_logic_vector(15 downto 0) :=  x"0138";
  constant wt_dat: std_logic_vector(31 downto 0) :=  x"54" & x"19" & x"AB" & x"CD";

  constant wrhf_instr: std_logic_vector(0 to 7) :=  "00000111";
  constant wrhf_set: std_logic_vector(7 downto 0) :=  "11000010";
  constant wrhf_clr: std_logic_vector(7 downto 0) :=  "11000001";
  constant cfg_set: std_logic_vector(7 downto 0) :=  "00100010";
  constant cfg_clr: std_logic_vector(7 downto 0) :=  "00100001";
  constant trans_set: std_logic_vector(7 downto 0) :=  "00001010";
  constant trans_clr: std_logic_vector(7 downto 0) :=  "00001001";
  
  constant rdsr_instr: std_logic_vector(0 to 7) :=  "00000101";
  constant rdsr_set: std_logic_vector(7 downto 0) := "11000000";
  constant rdsr_clr: std_logic_vector(7 downto 0) := "00000000";



  signal clk, rst, mosi, miso, cs_b, sck: std_logic:= '1';

  signal buf_addr:        std_logic_vector(9 downto 0);
  signal buf_wdata, buf_rdata:       std_logic_vector(31 downto 0);
  signal buf_wen:        std_logic;  
  
  signal cfgreq, cfgrdy, transdone, transrdy: std_logic;
  signal user_clk, user_rst: std_logic := '1';


begin

  -- Assume min clk speed = 125MHz
  clk <= not clk after 4 ns;
  rst <= '0' after 100 ns;

  user_clk <= not user_clk after 17 ns;
  user_rst <= '0' after 100 ns;
  
  cfgreq <= '1';
 
  test_pbus: process
    variable buf_temp: std_logic_vector(31 downto 0) := (others => '0');
  begin
    buf_addr <= (others => '0');
    buf_wdata <= (others => '0');
    buf_wen <= '0';
    transdone <= '0';
  wait until user_clk = '1' and user_clk'event and transrdy = '1';
    buf_addr <= wt_add(11 downto 2);
  wait until user_clk = '1' and user_clk'event;
    -- No strobe/ack to negotiate transfer.  Must wait.
    null;
  wait until user_clk = '1' and user_clk'event;
    buf_temp := wt_dat(7 downto 0) &wt_dat(15 downto 8) & wt_dat(23 downto 16) & wt_dat(31 downto 24); 
    assert buf_temp = buf_rdata report "Data read back on parallel does not match data written via SPI" severity failure;
  wait until user_clk = '1' and user_clk'event;
    transdone <= '1';
  wait for 1 ms;
  end process;
  
  
  
  test_spi: process
  begin
    report "------------------------------------------------------";
    report "WRITE";
    report "------------------------------------------------------";
    sck <= '0';
    cs_b <= '1';
    wait for 200 ns;    
    cs_b <= '0';
    wait for 70 ns;  -- min spec
    for i in wt_instr'low to wt_instr'high loop
      mosi <= wt_instr(i);
      wait for 30 ns;
      sck <= '1';
      wait for 50 ns;   -- min spec
      sck <= '0';
      wait for 20 ns;   -- min spec
    end loop;
    for i in wt_add'high downto wt_add'low loop
      mosi <= wt_add(i);
      wait for 30 ns;
      sck <= '1';
      wait for 50 ns;   -- min spec
      sck <= '0';
      wait for 20 ns;   -- min spec
    end loop;
    for i in wt_dat'high downto wt_dat'low loop
      report "Add index = " &  str(i);
      mosi <= wt_dat(i);
      wait for 30 ns;
      sck <= '1';
      wait for 50 ns;   -- min spec
      sck <= '0';
      wait for 20 ns;   -- min spec
    end loop;    
    cs_b <= '1';
    wait for 1000 ns;  
    
    report "------------------------------------------------------";
    report "READ";
    report "------------------------------------------------------";
    sck <= '0';
    wait for 200 ns;    
    cs_b <= '0';
    wait for 70 ns;  -- min spec
    for i in rd_instr'low to rd_instr'high loop
      mosi <= rd_instr(i);
      wait for 30 ns;
      sck <= '1';
      wait for 50 ns;   -- min spec
      sck <= '0';
      wait for 20 ns;   -- min spec
    end loop;
    for i in rd_add'high downto rd_add'low loop
      mosi <= rd_add(i);
      wait for 30 ns;
      sck <= '1';
      wait for 50 ns;   -- min spec
      sck <= '0';
      wait for 20 ns;   -- min spec
    end loop;
    for i in rd_dat'high downto rd_dat'low loop
      report "Add index = " &  str(i);
      mosi <= '0';
      wait for 30 ns;
      sck <= '1';
      assert wt_dat(i) = miso report "Data read back does not match data written" severity failure;
      wait for 50 ns;   -- min spec
      sck <= '0';
      wait for 20 ns;   -- min spec
    end loop;    
    cs_b <= '1';
    wait for 1000 ns;  
    
    report "------------------------------------------------------";
    report "WRHF: Set handshake flags";
    report "------------------------------------------------------";
    sck <= '0';
    wait for 200 ns;    
    cs_b <= '0';
    wait for 70 ns;  -- min spec
    for i in wrhf_instr'low to wrhf_instr'high loop
      mosi <= wrhf_instr(i);
      wait for 30 ns;
      sck <= '1';
      wait for 50 ns;   -- min spec
      sck <= '0';
      wait for 20 ns;   -- min spec
    end loop;
    for i in wrhf_set'high downto wrhf_set'low loop
      report "Add index = " &  str(i);
      mosi <= wrhf_set(i);
      wait for 30 ns;
      sck <= '1';
      wait for 50 ns;   -- min spec
      sck <= '0';
      wait for 20 ns;   -- min spec
    end loop;    
    cs_b <= '1';
    wait for 1000 ns;  

    report "------------------------------------------------------";
    report "-- RDSR: Read Status Reg to check handshake flags set.";
    report "------------------------------------------------------";
    sck <= '0';
    wait for 200 ns;    
    cs_b <= '0';
    wait for 70 ns;  -- min spec
    for i in rdsr_instr'low to rdsr_instr'high loop
      mosi <= rdsr_instr(i);
      wait for 30 ns;
      sck <= '1';
      wait for 50 ns;   -- min spec
      sck <= '0';
      wait for 20 ns;   -- min spec
    end loop;
    for i in rdsr_set'high downto rdsr_set'low loop
      report "Add index = " &  str(i);
      mosi <= '0';
      wait for 30 ns;
      sck <= '1';
      -- Ignore bit 4 (ConfigRequest set by FPGA, not uC)
      if i /= 4 then
        assert rdsr_set(i) = miso report "Data read back does not match expected" severity failure;
      end if;
      wait for 50 ns;   -- min spec
      sck <= '0';
      wait for 20 ns;   -- min spec
    end loop;    
    cs_b <= '1';   
    wait for 1000 ns;   
    
    report "------------------------------------------------------";
    report "WRHF: Clear handshake flags";
    report "------------------------------------------------------";
    sck <= '0';
    wait for 200 ns;    
    cs_b <= '0';
    wait for 70 ns;  -- min spec
    for i in wrhf_instr'low to wrhf_instr'high loop
      mosi <= wrhf_instr(i);
      wait for 30 ns;
      sck <= '1';
      wait for 50 ns;   -- min spec
      sck <= '0';
      wait for 20 ns;   -- min spec
    end loop;
    for i in wrhf_clr'high downto wrhf_clr'low loop
      report "Add index = " &  str(i);
      mosi <= wrhf_clr(i);
      wait for 30 ns;
      sck <= '1';
      wait for 50 ns;   -- min spec
      sck <= '0';
      wait for 20 ns;   -- min spec
    end loop;    
    cs_b <= '1';
    wait for 1000 ns;  
    
    report "------------------------------------------------------";
    report "RDSR: Read Status Reg to check handshake flags cleared";
    report "------------------------------------------------------";
    sck <= '0';
    wait for 200 ns;    
    cs_b <= '0';
    wait for 70 ns;  -- min spec
    for i in rdsr_instr'low to rdsr_instr'high loop
      mosi <= rdsr_instr(i);
      wait for 30 ns;
      sck <= '1';
      wait for 50 ns;   -- min spec
      sck <= '0';
      wait for 20 ns;   -- min spec
    end loop;
    for i in rdsr_clr'high downto rdsr_clr'low loop
      report "Add index = " &  str(i);
      mosi <= '0';
      wait for 30 ns;
      sck <= '1';
      -- Ignore bit 4 (ConfigRequest set by FPGA, not uC)
      if i /= 4 then
        assert rdsr_clr(i) = miso report "Data read back does not match expected" severity failure;
      end if;
      wait for 50 ns;   -- min spec
      sck <= '0';
      wait for 20 ns;   -- min spec
    end loop;    
    cs_b <= '1';   
    
    report "------------------------------------------------------";
    report "WRHF: Set cfgrdy flag";
    report "------------------------------------------------------";
    sck <= '0';
    wait for 200 ns;    
    cs_b <= '0';
    wait for 70 ns;  -- min spec
    for i in wrhf_instr'low to wrhf_instr'high loop
      mosi <= wrhf_instr(i);
      wait for 30 ns;
      sck <= '1';
      wait for 50 ns;   -- min spec
      sck <= '0';
      wait for 20 ns;   -- min spec
    end loop;
    for i in cfg_set'high downto cfg_set'low loop
      report "Add index = " &  str(i);
      mosi <= cfg_set(i);
      wait for 30 ns;
      sck <= '1';
      wait for 50 ns;   -- min spec
      sck <= '0';
      wait for 20 ns;   -- min spec
    end loop;    
    cs_b <= '1';
    wait for 1000 ns;  
    
    report "------------------------------------------------------";
    report "WRHF: Set transrdy flag";
    report "------------------------------------------------------";
    sck <= '0';
    wait for 200 ns;    
    cs_b <= '0';
    wait for 70 ns;  -- min spec
    for i in wrhf_instr'low to wrhf_instr'high loop
      mosi <= wrhf_instr(i);
      wait for 30 ns;
      sck <= '1';
      wait for 50 ns;   -- min spec
      sck <= '0';
      wait for 20 ns;   -- min spec
    end loop;
    for i in trans_set'high downto trans_set'low loop
      report "Add index = " &  str(i);
      mosi <= trans_set(i);
      wait for 30 ns;
      sck <= '1';
      wait for 50 ns;   -- min spec
      sck <= '0';
      wait for 20 ns;   -- min spec
    end loop;    
    cs_b <= '1';
    wait for 1000 ns;  
    report "------------------------------------------------------";
    report "RDSR: Read Status Reg to Check transdone asserted";
    report "------------------------------------------------------";
    sck <= '0';
    wait for 200 ns;    
    cs_b <= '0';
    wait for 70 ns;  -- min spec
    for i in rdsr_instr'low to rdsr_instr'high loop
      mosi <= rdsr_instr(i);
      wait for 30 ns;
      sck <= '1';
      wait for 50 ns;   -- min spec
      sck <= '0';
      wait for 20 ns;   -- min spec
    end loop;
    for i in rdsr_clr'high downto rdsr_clr'low loop
      report "Add index = " &  str(i);
      mosi <= '0';
      wait for 30 ns;
      sck <= '1';
      -- Check bit 2 (transaction done set by FPGA, not uC)
      if i = 2 then
        assert '1' = miso report "Transaction not finished" severity failure;
      end if;
      wait for 50 ns;   -- min spec
      sck <= '0';
      wait for 20 ns;   -- min spec
    end loop;    
    cs_b <= '1';   
    wait for 1000 ns;  
      report "End of simulation" severity failure;  
    wait for 1 ms;
  end process;
    
    

  spi_interface_inst: spi_interface
  port map(
    clk       => clk,
    rst       => rst,
    -- SPI interface   
    spi_miso        => miso,
    spi_mosi        => mosi,
    spi_sck         => sck,
    spi_cs_b        => cs_b,
     -- User clk/rst
    user_clk        => user_clk,
    user_rst        => user_rst,
    -- Config handshake
    cfgreq_in       => cfgreq,
    cfgrdy_out      => cfgrdy,
     -- IpBus handshake
    transrdy_out    => transrdy, 
    transdone_in    => transdone,
    -- FPGA Parallel bus
    buf_addr_in     => buf_addr,
    buf_wdata_in    => buf_wdata,
    buf_wen_in      => buf_wen,
    buf_rdata_out   => buf_rdata);

end Behavioral;

