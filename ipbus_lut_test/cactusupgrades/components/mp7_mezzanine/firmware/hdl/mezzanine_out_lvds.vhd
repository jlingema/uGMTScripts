

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library unisim;
use unisim.VComponents.all;


entity mezz_out_lvds is
	generic(
		NMEZZ: positive);
	port(
		mezz : in std_logic_vector(NMEZZ-1 downto 0);
		mezz_en : in std_logic_vector(NMEZZ-1 downto 0);
		mezz_n : out std_logic_vector(NMEZZ-1 downto 0);
		mezz_p : out std_logic_vector(NMEZZ-1 downto 0)
	);
		
end mezz_out_lvds;

architecture rtl of mezz_out_lvds is
	
	signal mezz_tristate: std_logic_vector(NMEZZ-1 downto 0);

begin

	mezz_tristate <= not mezz_en;


	all_chans: for i in 0 to NMEZZ-1 generate
   
		OBUFTDS_inst : OBUFTDS
		generic map (
			IOSTANDARD => "LVDS")
		port map (
			O => mezz_p(i),     -- Diff_p output (connect directly to top-level port)
			OB => mezz_n(i),   -- Diff_n output (connect directly to top-level port)
			I => mezz(i),     -- Buffer input
			T => mezz_tristate(i)      -- 3-state enable input
		);
		
	end generate;
		
end rtl;

