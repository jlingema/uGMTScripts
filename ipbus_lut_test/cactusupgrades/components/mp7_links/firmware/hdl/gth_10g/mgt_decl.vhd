library IEEE;
use IEEE.STD_LOGIC_1164.all;

package mgt_decl is

	constant N_QUAD_MAX: integer := 18;
	
	type quad_p_t is
		record
			xloc: integer;
			yloc: integer;
			refclk: integer;
		end record;

	type quad_p_array_t is array(0 to N_QUAD_MAX - 1) of quad_p_t;
	constant qp: quad_p_array_t := (
		(1, 8, 3), (1, 7, 3), (1, 6, 4),
		(1, 5, 4), (1, 4, 5), (1, 3, 5),
		(1, 2, 7), (1, 1, 7), (1, 0, 7),	
		(0, 0, 6), (0, 1, 6), (0, 2, 2),
		(0, 3, 2), (0, 4, 1), (0, 5, 1),
		(0, 6, 0), (0, 7, 0), (0, 8, 0)
	);

end mgt_decl;

