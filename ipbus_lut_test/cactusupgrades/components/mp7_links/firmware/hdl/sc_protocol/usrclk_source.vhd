

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity usrclk_source is
port(
    refclk_in                : in   std_logic;
    txusrclk_out             : out std_logic_vector(3 downto 0);
    txusrclk2_out            : out std_logic_vector(3 downto 0);
    txoutclk_in              : in std_logic_vector(3 downto 0);
    rxusrclk_out             : out std_logic_vector(3 downto 0);
    rxusrclk2_out            : out std_logic_vector(3 downto 0);
    rxoutclk_in              : in std_logic_vector(3 downto 0));


end usrclk_source;

architecture RTL of usrclk_source is


  signal   tied_to_ground_i     :   std_logic;
  signal   tied_to_vcc_i        :   std_logic;

  signal  txusrclk                  : std_logic_vector(3 downto 0);
  signal  rxusrclk                  : std_logic_vector(3 downto 0);
    
begin


  --  Static signal Assigments    
  tied_to_ground_i         <= '0';
  tied_to_vcc_i            <= '1';

  -- Instantiate a MMCM module to divide the reference clock. Uses internal feedback
  -- for improved jitter performance, and to avoid consuming an additional BUFG

--  txusrclk_gen: for i in 0 to 3 generate
  txusrclk_gen: for i in 0 to 0 generate
    txoutclk_bufh : BUFH
    port map(
        I                               =>      txoutclk_in(i),
        O                               =>      txusrclk(i));
  end generate;


  rxusrclk_gen: for i in 0 to 3 generate
    rxoutclk_bufh : BUFH
    port map(
        I                               =>      rxoutclk_in(i),
        O                               =>      rxusrclk(i));
  end generate;

  txusrclk_out                             <= (others => txusrclk(0));
  txusrclk2_out                            <= (others => txusrclk(0));
    
  -- Debugging  
--  rxusrclk_out                             <= (others => txusrclk(0));
--  rxusrclk2_out                            <= (others => txusrclk(0));
  
  rxusrclk_out                             <= rxusrclk;
  rxusrclk2_out                            <= rxusrclk;
 
end RTL;
 
