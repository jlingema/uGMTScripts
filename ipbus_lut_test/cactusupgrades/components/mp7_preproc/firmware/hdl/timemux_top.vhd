
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use ieee.std_logic_unsigned.all; 

use work.mp7_data_types.all;
use work.package_types.all;

library unisim;
use unisim.vcomponents.all;


entity timemux_top is
  generic(
    det_pp_links : integer;
    pp_mp_links : integer;
    bits_per_word: integer;
    words_per_bx : integer;
    bx_per_orbit : integer); 
  port(
    clk_in          : in std_logic;
    rst_in          : in std_logic := '0';
    link_data_in    : in ldata((det_pp_links-1) downto 0);
    link_data_out   : out ldata((pp_mp_links-1) downto 0);
    pp_card_id : std_logic_vector(7 downto 0));
end entity timemux_top;


architecture behave of timemux_top is

  signal link_valid :  std_logic;

  signal wt_index : integer range 0 to 511;   

  signal wt_data: type_vector_of_stdlogicvec_x32(det_pp_links-1 downto 0);
  signal rd_data: type_vector_of_stdlogicvec_x32(det_pp_links-1 downto 0);

  signal rd_add: type_vector_of_stdlogicvec_x9(det_pp_links-1 downto 0) := (others => "000000001");
  signal wt_add: std_logic_vector(8 downto 0);

  signal event_index : integer range 0 to pp_mp_links-1;   
  type type_rd_sel is array (pp_mp_links-1 downto 0) of integer range 0 to pp_mp_links-1;
  signal rd_sel : type_rd_sel;
  
  signal word_index: integer range words_per_bx-1 downto 0;
  signal ready: std_logic;

  signal hdr: type_vector_of_stdlogicvec_x32(pp_mp_links-1 downto 0);

  signal reset_finished : natural;

  signal link_valid_d1: std_logic;
  signal bx_cnt_int: natural range 0 to 4095;

	--  Extra internbal signal for local clking if required... (pattern rams slow)
  signal link_data_d0    : ldata((det_pp_links-1) downto 0);

  signal link_data_int   : ldata((pp_mp_links-1) downto 0);

begin

  -- Taking a while to get from Pattern RAMs to Tmux RAMs.  Clk for the moment.
  input_proc: process(clk_in)
  begin
    if rising_edge(clk_in) then
      link_data_d0 <= link_data_in;
    end if;
  end process;

	-- All data must be aligned.
	link_valid <= link_data_d0(0).valid;

  wt_index_proc: process(clk_in)
    variable bx_int: integer range BX_PER_ORBIT-1 downto 0;
  begin
    if rising_edge(clk_in) then			
		  if (rst_in = '1') then
				wt_index <= 0;
			else	
				if wt_index > 0 then
					wt_index <= wt_index - 1;
				else
					wt_index <= 511;
				end if;
			end if;
    end if;
  end process;

  wt_add <= std_logic_vector(to_unsigned(wt_index,9));

  tmux_buf_gen: for i in 0 to det_pp_links-1 generate

    -- Zero all data during orbit gap and while header is present.
    wt_data(i) <= link_data_d0(i).data when ((link_valid and link_valid_d1) = '1') else x"00000000";
    --rd_add(i) <= wt_add + std_logic_vector(to_unsigned((3*i), 9));

    tmux_buf: RAMB16_S36_S36
      generic map(
        SIM_COLLISION_CHECK  => "ALL",
        WRITE_MODE_A => "WRITE_FIRST",
        WRITE_MODE_B => "WRITE_FIRST")
      port map(
        DOA    => open,
        DOB    => rd_data(i),
        DOPA   => open,
        DOPB   => open,
        ADDRA  => wt_add,
        ADDRB  => rd_add(i),
        CLKA   => clk_in, 
        CLKB   => clk_in,
        DIA    => wt_data(i),
        DIB    => (others => '0'),
        DIPA   => (others => '0'),
        DIPB   => (others => '0'),
        ENA    => '1',
        ENB    => '1',
        SSRA   => '0',
        SSRB   => '0',
        WEA    => '1',
        WEB    => '0');

  end generate;

  -- The entire time mux code is driven by the word_index signal.  
  -- Do not stop when data valid low otherwise sequencing will fail.
  -- Allow word count to incremnet itself, but can be corrected by 
  -- external link_start_in or link_stop_in.


  proc_word_index: process(clk_in)
  begin
    if rising_edge(clk_in) then
		  if rst_in = '1' then
				word_index <= 0;
				ready <= '0';
				reset_finished <= 2;
				link_valid_d1 <= '0';
			else
				link_valid_d1 <= link_valid;
				if reset_finished /= 0 then
					-- Make sure that delayed signals have valid values.
					-- Exit reset on next clock cycle.
					-- Was just 1 clk, but discocvered perverse rst scenario where a problem could appear.
					reset_finished <= reset_finished - 1;
				else
					-- Allow reset of internal counters...
					if (link_valid_d1 = '0') and (link_valid = '1') then
						-- Firts word is header so extra reg stage nott aprblem
						word_index <= 0; 
						bx_cnt_int <= 0;
						ready <= '1';
					end if;
					-- Startup fix...
					if ready = '1' then
						-- Remember that the word_index must keep on going even after the end of 
						-- teh orbit gap because there will still be data in rams.
						if word_index < words_per_bx-1 then
							word_index <= word_index + 1;
						else
							word_index <= 0;
							if bx_cnt_int < bx_per_orbit-1 then
								bx_cnt_int <= bx_cnt_int + 1;
							else
								bx_cnt_int <= 0;
							end if;
						end if;
					end if;
				end if;
			end if;
		end if;
  end process;


  rd_sel_proc: process(clk_in)
  begin
    if rising_edge(clk_in) then
		  if rst_in = '1' then
				event_index <= 0;
				rd_add <= (others => "000000001");
			else
				-- Marker to indicate event being sent on output 
				-- chan 0 and thus all other channels    
				-- Virtex 5 OK
				if (word_index = 0) and (ready = '1') then
				-- Ignore
				--if (word_index = 5) and (ready = '1') then
					if event_index < pp_mp_links-1 then 
						 event_index <= event_index + 1;
					 else
						 event_index <= 0;  
					 end if;
				end if;
				-- rd_add needs to be 1 clk cycle bhehind wt_add to avoid mem clash
				-- Hence, reg rd_add here for 1 clk.
				reg_rd_add: for i in 0 to det_pp_links-1 loop
					rd_add(i) <= wt_add + std_logic_vector(to_unsigned((words_per_bx*i), 9));
				end loop;
				-- The multiplexing bit (i.e. divert data from rams to correct MP)
				mux_rd_data: for j in 0 to pp_mp_links-1 loop
					if event_index >= j  then 
						rd_sel(j) <= event_index - j after 0.1 ns; 
					else
						rd_sel(j) <= pp_mp_links + event_index - j after 0.1 ns; 
					end if;
				end loop;
				-- Header.  Could be built on the fly, but perhaps simplet to 
				-- understand if we have one for each MP path.
				-- Bits 31:24 = PP Card (max 256)
				-- Bits 23:16 = MP Card destination (max 256)
				-- Bits 11:00 = BX ID (max 4095 - fixed in LHC to 3564)
				build_hdr: for j in 0 to pp_mp_links-1 loop
					hdr(j) <= pp_card_id & std_logic_vector(to_unsigned(j, 8)) & x"0" & std_logic_vector(to_unsigned(bx_cnt_int, 12));
				end loop;
			end if;
		end if;
  end process;


  tmux_gen: for j in 0 to pp_mp_links-1 generate
    
    -- Ignore
    --link_data_int(j).data <= rd_data(rd_sel(j)) after 0.1 ns when (rd_sel(j) < det_pp_links ) else
                             --hdr(j) when (rd_sel(j)=pp_mp_links-1) and (word_index=0) else (others => '0');
		-- Virtex 5 OK
    link_data_int(j).data <= rd_data(rd_sel(j)) after 1 ns when (rd_sel(j) < det_pp_links ) else
                             hdr(j) when (rd_sel(j)=pp_mp_links-1) and (word_index=1) else (others => '0');
						
		-- Ignore								 
    --link_data_int(j).valid <= '1' when (rd_sel(j) < det_pp_links ) or ((rd_sel(j)=pp_mp_links-1) and (word_index=0)) else '0';

		-- Virtex 5 OK
    link_data_int(j).valid <= '1' when (rd_sel(j) < det_pp_links ) or ((rd_sel(j)=pp_mp_links-1) and (word_index=1)) else '0';

  end generate;


  -- Problems meeting timing with 6PPs (10in/12out) in a V5 TX240T
  -- Added reg stage before GTX
  output_proc: process(clk_in)
  begin
    if rising_edge(clk_in) then
      link_data_out <= link_data_int;
    end if;
  end process;

end architecture behave;


