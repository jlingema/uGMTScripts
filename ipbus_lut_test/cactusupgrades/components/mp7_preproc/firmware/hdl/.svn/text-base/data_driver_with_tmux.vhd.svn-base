
library ieee;
use ieee.std_logic_1164.all;

use work.mp7_data_types.all;
use work.ipbus.all;

-- Block of up to 16 RAMS to drive Time Multiplexing block or 
-- algorithim block or SerDes blocks.  Common address bus on 
-- "pat" side ensures all channels transmit/receive data in sync.
-- Standard comm bus for read/write access on the other side.

-- Requires 0x4000 of address space from comm module

entity data_driver_with_tmux is
  generic(
    DET_PP_LINKS: INTEGER;
    PP_MP_LINKS: INTEGER;
    BITS_PER_WORD: INTEGER;
    WORDS_PER_BX: INTEGER;
    BX_PER_ORBIT: INTEGER); 
  port(
    -- Fabric clk/fabric_reset_in
		clk: in std_logic;
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
    -- Counter used to address pattern ram running at link clk speed.
    ttc_fx_in: in std_logic_vector(2 downto 0);
    ttc_bx_in: in std_logic_vector(11 downto 0);
    ttc_time_in: in std_logic_vector(14 downto 0);
    -- If 0 use sim data else drive sys from pattern rams
    data_sel: in std_logic;
    -- Link clk/fabric_reset_in
    clk_p: in std_logic;
    rst_p: in std_logic;
    link_data_array_out: out ldata((pp_mp_links-1) downto 0);
    pp_card_id : in std_logic_vector(7 downto 0);
		stable_out: out std_logic
	);
end entity data_driver_with_tmux;

architecture behave of data_driver_with_tmux is

  signal pat_rdata_array: ldata(det_pp_links-1 downto 0);
  signal pat_wdata_array: ldata(det_pp_links-1 downto 0);
  signal sim_data_array: ldata(det_pp_links-1 downto 0);
  signal link_data_array_int: ldata(det_pp_links-1 downto 0);
	signal rst_p_local: std_logic;
  
begin

	rst_p_dist: process(clk_p)
	begin
		if rising_edge(clk_p) then
			rst_p_local <= rst_p;
		end if;
	end process;
	

  --------------------------------------------------------------------------
  -- Pattern RAMs for fake detector data
  --------------------------------------------------------------------------

  data_driver_inst: entity work.data_driver
    generic map(
      CHANS => DET_PP_LINKS)
    port map(
      clk => clk,
      rst => rst,
			ipb_in => ipb_in,
			ipb_out => ipb_out,
      pat_clk => clk_p,
      pat_stb => '1',
      pat_wen => '0',
      pat_add => ttc_time_in(8 downto 0),
      pat_rdata => pat_rdata_array,
      pat_wdata => pat_wdata_array);
      
  -- Null data.  No data capture at present.
  null_wdata: for i in 0 to det_pp_links-1 generate    
    pat_wdata_array(i).data <=  x"00000000";
    pat_wdata_array(i).valid <=  '0';
  end generate;

  --------------------------------------------------------------------------
  -- Sim fake detector data (i.e. simple counters)
  --------------------------------------------------------------------------

  detector_sim_inst:  entity work.detector_sim
    generic map(	 
      DET_PP_LINKS => DET_PP_LINKS,
      BITS_PER_WORD => BITS_PER_WORD,
      WORDS_PER_BX => WORDS_PER_BX,
      BX_PER_ORBIT => BX_PER_ORBIT)
    port map(
      clk_in => clk_p,
      rst_in => rst_p_local,
      ttc_fx_in => ttc_fx_in,
      ttc_bx_in => ttc_bx_in,
      link_data_out => sim_data_array);

  link_data_array_int <= sim_data_array when data_sel = '0' else pat_rdata_array;

  --------------------------------------------------------------------------
  -- Time multiplexer
  --------------------------------------------------------------------------

  timemux_top_inst: entity work.timemux_top
    generic map(
      DET_PP_LINKS => DET_PP_LINKS,
      PP_MP_LINKS => PP_MP_LINKS,
      BITS_PER_WORD => BITS_PER_WORD,
      WORDS_PER_BX => WORDS_PER_BX,
      BX_PER_ORBIT => BX_PER_ORBIT)
    port map(
      clk_in => clk_p,
      rst_in => rst_p_local,
      link_data_in => link_data_array_int,
      link_data_out => link_data_array_out,
      pp_card_id  => pp_card_id); 

  --------------------------------------------------------------------------
  -- Check
  --------------------------------------------------------------------------

  period_check_inst: entity work.period_check
  port map(
		clk_in => clk_p,
		rst_in => rst_p_local,
		marker_in => link_data_array_int(0).valid,
		stable_out => stable_out);

end architecture behave;

