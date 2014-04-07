-- ttc_bc0_check
--
-- Dave Newbold, July 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity ttc_bc0_check is
	port(
		clk: in std_logic;
		rst: in std_logic;
		clr: in std_logic;
		bc0: in std_logic;
		lock: out std_logic;
		len: out std_logic_vector(11 downto 0);
		err: out std_logic
	);

end ttc_bc0_check;

architecture rtl of ttc_bc0_check is

	signal bctr, len_i: unsigned(11 downto 0);
	signal my_bc0, lock_i: std_logic;
	type state_type is (ST_IDLE, ST_FIRST, ST_CHECK, ST_ERR);
	signal state: state_type;	

begin

	lock_i <= '1' when state = ST_CHECK or state = ST_ERR else '0';

	process(clk)
	begin
		if rising_edge(clk) then
			if lock_i = '0' and bc0 = '1' then
				bctr <= X"001";
				len_i <= bctr;
			elsif lock_i = '1' and bctr = (len_i - 1) then
				bctr <= X"000";
			else
				bctr <= bctr + 1;
			end if;
		end if;
	end process;
	
	my_bc0 <= '1' when bctr = X"000" else '0';
	
	process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' or clr = '1' then
				state <= ST_IDLE;
			else
				case state is
				
				when ST_IDLE =>
					if bc0 = '1' then
						state <= ST_FIRST;
					end if;
					
				when ST_FIRST =>
					if bc0 = '1' then
						state <= ST_CHECK;
					end if;
					
				when ST_CHECK =>
					if (bc0 xor my_bc0) = '1' then
						state <= ST_ERR;
					end if;
				
				when ST_ERR =>
				
				end case;
			end if;
		end if;
	end process;
		
	lock <= lock_i;
	len <= std_logic_vector(len_i);
	err <= '1' when state = ST_ERR else '0';

end rtl;
