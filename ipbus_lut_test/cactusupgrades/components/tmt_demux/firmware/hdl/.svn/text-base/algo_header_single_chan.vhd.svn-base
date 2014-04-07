-- algo_header_single_chan
--
-- Just strips and inserts the header for now.
-- Later on, should probably do sanity checks on incoming headers.
--
-- Dave Newbold, September 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.mp7_data_types.all;

entity algo_header_single_chan is
	generic(
		ALGO_LATENCY: positive
	);
	port(
		clk: in std_logic;
		rst: in std_logic;
		d_in: in lword;  -- From Rx MGTs
		algo_d: out lword;  -- To Algo
		hdr_d: out std_logic_vector(31 downto 0);
		algo_q: in lword; -- From Algo
		hdr_q: in std_logic_vector(31 downto 0);
		d_out: out lword  -- To Tx MGTs
	);
		
end algo_header_single_chan;

architecture rtl of algo_header_single_chan is

	signal vd_in: std_logic;
	signal d_out_int: lword;

begin

		-- Following code assumes that processing latency is less than multiplexing latency.
		-- Used this approach because in the current design some links (e.g. ring sums) may
		-- be generating data very soon after the 1st towers arrive.
		-- Can make it more complicated if we really need it.

		-- Strip header
		incoming: process(clk)
		begin
			if rising_edge(clk) then
			
				vd_in <= d_in.valid;				
				algo_d.data <= d_in.data;
				algo_d.valid <= d_in.valid and vd_in ;
				if (d_in.valid = '1') and (vd_in = '0') then
					hdr_d <= d_in.data;
				end if;
				
			end if;
		end process;

		outgoing: process(clk)
		begin
			if rising_edge(clk) then		
			
				-- Simple pass through for the moment
				--d_out.data <= algo_q.data;
				--d_out.valid <= algo_q.valid;			
				
				-- Header added, but at the expense of 1 clk cycle.  Need dv earlier.
				d_out_int <= algo_q;
				if (algo_q.valid = '1') and (d_out_int.valid = '0') then 
					d_out.data <= hdr_q;
					d_out.valid <= '1';
				else				
					d_out <= d_out_int;
				end if;
				
			end if;
		end process;
		
end rtl;

