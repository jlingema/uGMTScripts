
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;


entity xpoint is
port ( 
		clk_i : in  std_logic;
		rst_i : in  std_logic;
		prog_i : in  std_logic;
		done_o : out  std_logic;
		sel_for_out0_i : in  std_logic_vector (1 downto 0);
		sel_for_out1_i : in  std_logic_vector (1 downto 0);
		sel_for_out2_i : in  std_logic_vector (1 downto 0);
		sel_for_out3_i : in  std_logic_vector (1 downto 0);
		load_o : out  std_logic;
		config_o : out  std_logic;
		sin_o : out  std_logic_vector (1 downto 0);
		sout_o : out  std_logic_vector (1 downto 0));
end xpoint;

architecture behavioral of xpoint is

	signal xpoint_output_sel: natural range 0 to 7;

  type type_sel is array(natural range <>) of std_logic_vector(1 downto 0);

	signal sel: type_sel(3 downto 0);
	type type_xpoint_state is (xpoint_init,xpoint_data,xpoint_load_step0,xpoint_load_step1,
                             xpoint_config_step0, xpoint_config_step1, xpoint_idle);
	signal xpoint_state: type_xpoint_state;

begin

	sel(0) <= sel_for_out0_i;
	sel(1) <= sel_for_out1_i;
	sel(2) <= sel_for_out2_i;
	sel(3) <= sel_for_out3_i;


  -- Leave rst async.  Outputs controling clks.
  xpoint_p : process(clk_i, rst_i)
  begin
    if (rst_i = '1') then
			config_o <= '0';
			load_o <= '0';
			sin_o <= "00";
			sout_o <= "00";
			xpoint_output_sel <= 0;
			done_o <= '0';
			xpoint_state <= xpoint_idle;
    elsif (clk_i = '1' and clk_i'event) then
			case xpoint_state is
				when xpoint_init =>
					config_o <= '0';
					load_o <= '0';
					xpoint_output_sel <= 0;
					xpoint_state <= xpoint_data;
				when xpoint_data =>
					if xpoint_output_sel < 4 then
						xpoint_output_sel <= xpoint_output_sel + 1;
						sin_o <= sel(xpoint_output_sel);
						sout_o <= std_logic_vector(to_unsigned(xpoint_output_sel,2));
						xpoint_state <= xpoint_load_step0;
					else
						xpoint_state <= xpoint_idle;
						done_o <= '1';
					end if;
				when xpoint_load_step0 =>
					config_o <= '0';
					load_o <= '1';
					xpoint_state <= xpoint_load_step1;
				when xpoint_load_step1 =>
					config_o <= '0';
					load_o <= '0';
					xpoint_state <= xpoint_config_step0;
				when xpoint_config_step0 =>
					config_o <= '1';
					load_o <= '0';
					xpoint_state <= xpoint_config_step1;
				when xpoint_config_step1 =>
					config_o <= '0';
					load_o <= '0';
					xpoint_state <= xpoint_data;
				when xpoint_idle =>
					if prog_i = '1' then
						done_o <= '0';
						xpoint_state <= xpoint_init;
					end if;
			end case;
    end if;
  end process xpoint_p;

end behavioral;