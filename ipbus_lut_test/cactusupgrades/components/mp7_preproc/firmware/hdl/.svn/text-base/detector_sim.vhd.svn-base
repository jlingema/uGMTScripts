
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.mp7_data_types.all;


library std;
use std.textio.all;

entity detector_sim is
  generic(
    det_pp_links : integer;
    bits_per_word: integer;
    words_per_bx : integer;
    bx_per_orbit: integer);
  port(
    clk_in           : in std_logic;
    rst_in           : in std_logic := '0';
    ttc_fx_in        : in std_logic_vector(2 downto 0);
    ttc_bx_in        : in std_logic_vector(11 downto 0);
    link_data_out    : out ldata((det_pp_links-1) downto 0));
end entity detector_sim;


architecture behave of detector_sim is

  signal ttc_fx: natural range 7 downto 0;
  signal ttc_bx: natural range 4095 downto 0;

begin

  ttc_fx <= to_integer(unsigned(ttc_fx_in));
  ttc_bx <= to_integer(unsigned(ttc_bx_in));

  detector_data: process(rst_in, clk_in)
    variable link_data_int: ldata((det_pp_links-1) downto 0);
  begin
    if rising_edge(clk_in) then
      -- Link DATA
      for i in 0 to det_pp_links-1 loop
        -- link_temp.data := std_logic_vector(to_unsigned(i, 8) & to_unsigned(ttc_fx, 8) & to_unsigned(ttc_bx, 16));
        -- link_data_out(i) <= link_temp;
          if (ttc_bx = bx_per_orbit-1) and (ttc_fx = words_per_bx-1) then
            -- Insert header
            link_data_out(i).data <= std_logic_vector(to_unsigned(i, 8) & to_unsigned(0, 8) & x"FFFF");
            link_data_out(i).valid <= '1';
          elsif ((ttc_bx >= 0) and (ttc_bx <= bx_per_orbit-3)) then
            -- Add data
            link_data_out(i).data <= std_logic_vector(to_unsigned(i, 8) & to_unsigned(ttc_fx, 8) & to_unsigned(ttc_bx, 16));
            link_data_out(i).valid <= '1';
          else 
            -- Set to zero.  Will be replaced with commas, but makes sim easier to understand.
            link_data_out(i).data <= x"00000000";
            link_data_out(i).valid <= '0';
          end if;
      end loop;
    end if;
  end process;

end architecture behave;
