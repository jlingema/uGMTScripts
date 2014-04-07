library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.mp7_data_types.all;
use work.ipbus.all;
use work.mp7_counters_decl.all;

entity pp_core is
	generic(
		NQUAD: positive;
    DET_PP_LINKS: integer;
    PP_MP_LINKS: integer;
    BITS_PER_WORD: integer;
    WORDS_PER_BX: integer;
    BX_PER_ORBIT: integer 		
	);
	port(
		clk: in std_logic;
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		ipb_sel: in std_logic_vector(5 downto 0);
		bctr: in bctr_array(NQUAD - 1 downto 0);
		pctr: in pctr_array(NQUAD - 1 downto 0);
    -- If 0 use sim data else drive sys from pattern rams
    data_sel: in std_logic;
		clk_p: in std_logic;
		rst_p: in std_logic_vector(NQUAD - 1 downto 0);
		stat : out std_logic_vector(1 downto 0);
		q: out ldata(4*NQUAD - 1 downto 0)
	);
		
end pp_core;

architecture rtl of pp_core is

	signal frst: std_logic;
	signal ipb_in_slaves: ipb_wbus_array(4*NQUAD - 1 downto 0);
	signal ipb_out_slaves: ipb_rbus_array(4*NQUAD - 1 downto 0);
	-- If one array index assigned modelsim requires all array indices assigned.
	type mdata is array(natural range <>) of ldata((PP_MP_LINKS-1) downto 0);
	signal temp: mdata(4*NQUAD - 1 downto 0);
	signal stable_input: std_logic_vector(4*NQUAD-1 downto 0);
	
	signal d0, d1: lword;
	signal error, stable_output: std_logic;

	
begin

	fabric: entity work.ipbus_fabric_sel
	generic map(
		NSLV => 4*NQUAD,
		SEL_WIDTH => 6
	)
	port map(
		sel => ipb_sel,
		ipb_in => ipb_in,
		ipb_out => ipb_out,
		ipb_to_slaves => ipb_in_slaves,
		ipb_from_slaves => ipb_out_slaves
	);

	quad_gen: for i in 0 to NQUAD - 1 generate
	
			signal ttc_time: std_logic_vector(14 downto 0);
		
		begin
							
			ttc_time <= bctr(i) & pctr(i)	;			


			chan_gen: for j in 0 to 3 generate
			
					constant k : integer :=  4*i + j;
					constant pp_card_id : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(k, 8));
				
				begin
				
					data_driver_with_tmux_inst:  entity work.data_driver_with_tmux
						generic map(
							DET_PP_LINKS => DET_PP_LINKS,
							PP_MP_LINKS => PP_MP_LINKS,
							BITS_PER_WORD => BITS_PER_WORD,
							WORDS_PER_BX => WORDS_PER_BX,
							BX_PER_ORBIT => BX_PER_ORBIT)
						port map(
							clk => clk,
							rst => rst,
							ipb_in => ipb_in_slaves(k),
							ipb_out => ipb_out_slaves(k),
							ttc_time_in => ttc_time,
							ttc_bx_in => bctr(i),
							ttc_fx_in => pctr(i),
							data_sel => data_sel,
							clk_p => clk_p,
							rst_p => rst_p(i),
							link_data_array_out => temp(k),				
							pp_card_id => pp_card_id,
							stable_out => stable_input(k)
						);	
						
						-- Might be easier to spot link MP4.
						q(k) <= temp(k)(4);
						
			end generate;
			
	end generate;




	-- Check stability of the first input source (RAM or pattern generator) 
	-- to the time-mux of Virtual PP card 0 (selected here).
	stat(0) <= stable_input(0);
	

	-- Extracts Virtual PP card 0, MP card 4 data and checks for BX consitency with the data packet.
	-- Used for debugging stability issues.  The error signal is connected to the "stable_out" just 
	-- to ensure that XST does not remove it.
	
	trig: process(clk_p)
	begin
		if rising_edge(clk_p) then
			d0 <= temp(0)(4);
			d1 <= d0;
			if frst = '1' then
				error <= '0';
				stable_output <= '1';
			else
				-- Only check for BX consitency when data valid high. 
				if d1.valid = '1' and d0.valid = '1' then
					if d0.data(11 downto 0) = d1.data(11 downto 0) then
						error <= '0';
					else
						error <= '1';
					end if;
				else
					error <= '0';
				end if;
				-- Note stable output not technically inverse of error, but good enough 
				-- for now and makes sure XST does not remove it.
				if error = '1' then
					stable_output <= '0';
				end if;
			end if;
		end if;
	end process;
	
	stat(1) <= stable_output;

	
end rtl;

