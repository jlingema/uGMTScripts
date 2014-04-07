
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.mp7_data_types.all;


library std;
use std.textio.all;

entity timemux_tb is
  generic(
    DET_PP_LINKS : INTEGER := 5;
    PP_MP_LINKS :INTEGER := 12;
    BITS_PER_WORD: INTEGER:= 32;
    WORDS_PER_BX : INTEGER := 6;
    BX_PER_ORBIT : INTEGER := 3564); --120);
end entity timemux_tb;


architecture behave of timemux_tb is

  signal sim_data_array: ldata(det_pp_links-1 downto 0);
  signal link_data_array_out: ldata((pp_mp_links-1) downto 0);

  signal clk, rst: std_logic := '1';
  signal ttc_fx_int: std_logic_vector(2 downto 0);
  signal ttc_bx_int: std_logic_vector(11 downto 0);
  signal ttc_bx, ttc_fx: integer;

begin

  clk <= not clk after 2.083 ns;
  rst <= '0' after 100 ns;
	-- 
	ttc: process(clk, rst)
	begin
		if rst = '1' then
			ttc_bx <= 0;
			ttc_fx <= 0;
		elsif rising_edge(clk) then
			if (ttc_fx < WORDS_PER_BX-1) then
				ttc_fx <= ttc_fx + 1;
			else
				ttc_fx <= 0;
				if (ttc_bx < BX_PER_ORBIT-1) then
					ttc_bx <= ttc_bx + 1;
				else 
					ttc_bx <= 0;
				end if;
			end if;
		end if;
	end process;
	
	ttc_fx_int <= std_logic_vector(to_unsigned(ttc_fx, ttc_fx_int'length));
	ttc_bx_int <= std_logic_vector(to_unsigned(ttc_bx, ttc_bx_int'length));

  detector_sim_inst:  entity work.detector_sim
    generic map(	 
      DET_PP_LINKS => DET_PP_LINKS,
      BITS_PER_WORD => BITS_PER_WORD,
      WORDS_PER_BX => WORDS_PER_BX,
      BX_PER_ORBIT => BX_PER_ORBIT)
    port map(
      clk_in => clk,
      rst_in => rst,
      ttc_fx_in => ttc_fx_int,
      ttc_bx_in => ttc_bx_int,
      link_data_out => sim_data_array);

  --------------------------------------------------------------------------
  -- Time multiplexer
  --------------------------------------------------------------------------

  timemux_top_inst: entity work.timemux_top
    generic map(
      DET_PP_LINKS => DET_PP_LINKS,
      PP_MP_LINKS => PP_MP_LINKS,
      BITS_PER_WORD => BITS_PER_WORD,
      WORDS_PER_BX => WORDS_PER_BX,
      BX_PER_ORBIT => BX_PER_ORBIT)
    port map(
      clk_in => clk,
      rst_in => rst,
      link_data_in => sim_data_array,
      link_data_out => link_data_array_out,
      pp_card_id  => x"55"); 


end architecture behave;



