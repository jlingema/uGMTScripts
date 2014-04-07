library IEEE;
use IEEE.STD_LOGIC_1164.all;

package mgt_decl is

	constant N_QUAD_MAX: integer := 12;

	type quad_p_t is
		record
			xloc: integer;
			yloc: integer;
			refclk: integer;
		end record;

	type quad_p_array_t is array(0 to N_QUAD_MAX - 1) of quad_p_t;
	constant qp: quad_p_array_t := (
		(1, 5, 3), (1, 4, 3), (1, 3, 4),
		(1, 2, 4), (1, 1, 5), (1, 0, 5),
		(0, 0, 2), (0, 1, 2), (0, 2, 1),
		(0, 3, 1), (0, 4, 0), (0, 5, 0)
	);

end mgt_decl;

