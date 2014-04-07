-- algo_header
--
-- Just strips and inserts the header for now.
-- Later on, should probably do sanity checks on incoming headers.
--
-- Dave Newbold, September 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.mp7_data_types.all; -- For ldata/lword types
use work.package_types.all; -- For vector of 32bit vector type

entity algo_header is
	generic(
		NQUAD: positive;
		ALGO_LATENCY: positive
	);
	port(
		clk: in std_logic;
		rst: in std_logic;
		d_in: in ldata(NQUAD*4 - 1 downto 0);
		algo_d: out ldata(NQUAD*4 - 1 downto 0);
		algo_q: in ldata(NQUAD*4 - 1 downto 0);
		d_out: out ldata(NQUAD*4 - 1 downto 0)
	);
		
end algo_header;

architecture rtl of algo_header is

	signal hdr, hdr_d0, hdr_d1: std_logic_vector(31 downto 0);
	signal hdr_d: type_vector_of_stdlogicvec_x32(NQUAD*4 - 1 downto 0);
	
	attribute KEEP: string;
	attribute KEEP of hdr, hdr_d0, hdr_d1: signal is "TRUE"; -- Avoid optimisation into shreg

begin

	-- Use brute force for hdr fanout.  Hdr for demux may be required soon after rceipt of incoming data
	
	-- 31:24 Source Card (0.. to N_MP-1)
	-- 23:16 Destination (always 0)
	-- 15:12 Reserved 
	-- 11:00 BX
	
	-- Clk hdr formation to allow reg duplication if req.
	hdr_build: process(clk)
	begin
		if rising_edge(clk) then
			-- Extracts Source from data stream.  Perhaps this should be done in a more robust manner.
			-- Just use chan 0 for present.  Ought to have master chan and backup master chan.
			hdr_d0 <= hdr_d(0)(23 downto 16) & x"00" & x"0" & hdr_d(0)(11 downto 0);
			-- Clk Skew is ~ 1ns from edgfe of FPGA to centre thus reducing clk period from ~4ns to ~3ns.
			-- Slacks were -1ns.  May need yet another reg.
			hdr_d1 <= hdr_d0;
			hdr <= hdr_d1;
		end if;
	end process;



	quad_gen: for i in NQUAD - 1 downto 0 generate
	
		-- Reg signal at quad level to meet timing.
		signal hdr_quad: std_logic_vector(31 downto 0);
	
	begin
		
		hdr_dist: entity work.reg_word
			generic map(
				SIZE => hdr'length
			)
			port map(
				clk => clk,
				d => hdr, 
				q => hdr_quad
			);		
	
		chan_gen: for j in 3 downto 0 generate
			constant k: integer := 4 * i + j;
		begin

			sbuf: entity work.algo_header_single_chan
				generic map (
					ALGO_LATENCY => ALGO_LATENCY
				)
				port map(
					clk => clk,
					rst => rst,
					d_in => d_in(k),
					algo_d => algo_d(k),
					hdr_d => hdr_d(k),
					algo_q => algo_q(k),
					hdr_q => hdr_quad,
					d_out => d_out(k)
				);
			
		end generate;
	end generate;

end rtl;


--	d_gen: for i in NCHAN_I - 1 downto 0 generate		
--	begin
--	
--		process(clk)
--		begin
--			if rising_edge(clk) then
--				vd(i) <= d_in(i).valid;
--			end if;
--		end process;
--			
--		algo_d(i).data <= d_in(i).data;
--		algo_d(i).valid <= d_in(i).valid and vd(i);
--		
--	end generate;
--
--	go <= d_in(0).valid and not vd(0);
--	
--	process(clk)
--	begin
--		if rising_edge(clk) then
--			if rst = '1' then
--				lctr <= "0000000";
--			elsif lctr /= "0000000" or go = '1' then
--				lctr <= lctr + 1;
--			end if;
--			if go = '1' then
--				bx <= d_in(0).data(11 downto 0);
--			end if;			
--		end if;
--	end process;
--
--	src <= '1' when lctr = to_unsigned(ALGO_LATENCY, 7) else '0';
--	
--
--  d_gen2: for i in NCHAN_O - 1 downto 0 generate   
--  begin
--  
--    d_out(i).data <= X"00000" & bx when src = '1' else algo_q(i).data;
--    d_out(i).valid <= algo_q(i).valid or src;
--    
--  end generate;
--	
--end rtl;

