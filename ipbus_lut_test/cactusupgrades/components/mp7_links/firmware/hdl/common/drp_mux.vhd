-- drp_mux
--
-- Interfaces one DRP master to many DRP slaves
--
-- Don't change sel during a bus cycle if you want a quiet life
--
-- Dave Newbold, September 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.drp_decl.all;
use work.ipbus_reg_types.all;

entity drp_mux is
	generic(
		N_DRP: positive
	);
	port(
		sel: in std_logic_vector(calc_width(N_DRP) - 1 downto 0);
		drp_in: in drp_wbus;
		drp_out: out drp_rbus;
		slv_drp_in: in drp_rbus_array(N_DRP - 1 downto 0);
		slv_drp_out: out drp_wbus_array(N_DRP - 1 downto 0)
	);
	
end drp_mux;

architecture rtl of drp_mux is

	signal sel_i: integer := 0;
	signal ored_rdy: std_logic_vector(N_DRP downto 0);

begin

	sel_i <= to_integer(unsigned(sel));
	
	ored_rdy(N_DRP) <= '0';

	drp_gen: for i in N_DRP - 1 downto 0 generate
	
		slv_drp_out(i).addr <= drp_in.addr;
		slv_drp_out(i).data <= drp_in.data;
		slv_drp_out(i).en <= drp_in.en when sel_i = i else '0';
		slv_drp_out(i).we <= drp_in.we when sel_i = i else '0';
		ored_rdy(i) <= ored_rdy(i + 1) or slv_drp_in(i).rdy;

	end generate;

	drp_out.data <= slv_drp_in(sel_i).data;
	drp_out.rdy <= ored_rdy(0);
	
end rtl;

