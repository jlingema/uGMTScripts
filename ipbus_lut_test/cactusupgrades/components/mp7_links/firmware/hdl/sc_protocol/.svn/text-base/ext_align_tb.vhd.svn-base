library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library std;
use std.textio.all;

use work.package_links.all;


entity ext_align_tb is
end ext_align_tb;



architecture behave of ext_align_tb is

  constant LOCAL_LHC_BUNCH_COUNT : natural := 10;
  constant LOCAL_LHC_CLK_MULTIPLE: integer := 6;
  constant LOCAL_BX_PERIOD: integer := 25;
  
  constant ALIGN_MASTER_LINK: integer := 0;


  constant NQUAD: integer := 1;

  
  -- Clocks & Reset
  signal ttc_clk_240mhz, ttc_rst_240mhz : std_logic := '1';
  signal refclk, drpclk, sysclk : std_logic := '0';
  signal rst : std_logic := '1';
  signal rstb : std_logic := '0';
  -- High Speed Serdes
  signal rxn, rxp, txn, txp: std_logic_vector(3 downto 0);
  -- Parallel interface data
  signal txdata, rxdata: type_data_array(3 downto 0);
  signal txdatavalid, rxdatavalid: std_logic_vector(3 downto 0);
  -- Channel Registers
  signal chan_ro_regs: type_chan_ro_reg_array(3 downto 0);
  signal chan_rw_regs: type_chan_rw_reg_array(3 downto 0) := (others => (others => (others => '0')));
  signal chan_rw_regs_default: type_chan_rw_reg_array(3 downto 0);
  -- Common Registers
  signal common_ro_regs: type_common_ro_reg;
  signal common_rw_regs: type_common_rw_reg := (others => (others => '0'));
  signal common_rw_regs_default: type_common_rw_reg; 
  -- Test signals
  signal cnt: natural;
  -- External Rx buffer control
  signal buf_master: std_logic_vector(3 downto 0) := "0000";
  signal buf_rst: std_logic := '0';
  signal buf_ptr_inc: std_logic_vector(3 downto 0) := "0000";
  signal buf_ptr_dec: std_logic_vector(3 downto 0) := "0000";
  -- Synchronisation signals
  signal align_marker : std_logic_vector(3 downto 0) := "0000";
  signal align_enable, align_master: std_logic := '0';
  

  signal a, b : bit_vector(3 downto 0);

begin

  cpu: process
  begin

    -- Must have this wait or the following default reg assignment doesn't occur.  Presumably 
    -- because the assignment as not yet taken place in the lower level entity.
    wait for 1 ns;
  
    -- Assign default registers
    chan_rw_regs <= (others => (others => (others => '0')));
    common_rw_regs <= (others => (others => '0'));

  
    -- Wait for 1ns to get rid of all those pesky warnings at startup
    wait for 100 ns;
      
      report 
      " "  & CR & LF & 
      "----------------------------------------------------------------"  & CR & LF & 
      "Starting Simulation - Run for 5 us"  & CR & LF & 
      "----------------------------------------------------------------"  & CR & LF & 
      " ";

    wait for 100 ns;
    
      rst <= '0';
      report "Exiting reset"  & CR & LF;
      
      report "Allow end of reset to propagate"  & CR & LF;
    wait for 100 ns;
    
      report "Allow for trasceiver to exit reset"  & CR & LF;
    wait for 10 us;
    
      report "Start alignment"  & CR & LF;
    wait until rising_edge(ttc_clk_240mhz); 
      align_enable <= '1';
    wait until rising_edge(ttc_clk_240mhz); 
      align_enable <= '0';

      report 
      " "  & CR & LF & 
      "----------------------------------------------------------------"  & CR & LF & 
      "Ending Simulation"  & CR & LF & 
      "----------------------------------------------------------------"  & CR & LF & 
      " ";

    -- Following stops modelsim restarting....
    wait for 10 ms;

  end process;



  cnt_proc: process(ttc_clk_240mhz)
  begin
    if rising_edge(ttc_clk_240mhz) then
      if (ttc_rst_240mhz = '1') or (cnt = (LOCAL_LHC_CLK_MULTIPLE * LOCAL_LHC_BUNCH_COUNT - 1)) then
        cnt <= 0;
      else 
        cnt <= cnt + 1;
      end if;
    end if;
  end process;
    
  test: for i in 0 to 3 generate  
    txdata(i) <= std_logic_vector(to_unsigned(i, 16)) & std_logic_vector(to_unsigned(cnt, 16));
    txdatavalid(i) <= '1' when cnt < LOCAL_LHC_CLK_MULTIPLE * (LOCAL_LHC_BUNCH_COUNT-2) else '0';
  end generate;

  rxp(0) <= transport txp(0) after 5 ns;
  rxn(0) <= transport txn(0) after 5 ns;

  rxp(1) <= transport txp(1) after 10 ns;
  rxn(1) <= transport txn(1) after 10 ns;
  
  rxp(2) <= transport txp(2) after 15 ns;
  rxn(2) <= transport txn(2) after 15 ns;
  
  rxp(3) <= transport txp(3) after 20 ns;
  rxn(3) <= transport txn(3) after 20 ns;
  
  -------------------------------------------------------------------------

  rstb <= not rst;
  
  ttc_clk_240mhz <= not ttc_clk_240mhz after 2.084 ns;  
  ttc_rst_240mhz <= rst when rising_edge(ttc_clk_240mhz);

  -- 125MHz
  refclk <= not refclk after 4.0 ns;
  -- 50MHz
  drpclk <= not drpclk after 10.0 ns;
  -- 100MHz
  sysclk <= not sysclk after 5.0 ns;

  ---------------------------------------------------------------------------------------------------
  -- Controller for rxdata_simple_cdc_buf.  Aligns links and minimises latency.
  -- Note that alignment status of all links has deliberately left outside the 
  -- state machine to allow the user to use several clk cycles to determine whether 
  -- all teh links are aligned.
  --
  -- Note, if the user uses several clk cycles to perform a staged and_reduce of all 
  -- all links to generate "align_status_in" then align_slaves_in and align_master_in
  -- should also be delayed by the same quantity.
  ---------------------------------------------------------------------------------------------------


  buf_master <= To_StdLogicVector("0001" sll ALIGN_MASTER_LINK);
  align_master <= align_marker(ALIGN_MASTER_LINK);

  rxdata_simple_cdc_ctrl_inst: entity work.rxdata_simple_cdc_ctrl
  generic map(
    NQUAD => NQUAD,
		LOCAL_LHC_CLK_MULTIPLE => LOCAL_LHC_CLK_MULTIPLE,
		LOCAL_LHC_BUNCH_COUNT => LOCAL_LHC_BUNCH_COUNT)  
  port map(
    local_rst_in => ttc_rst_240mhz,
    local_clk_in => ttc_clk_240mhz,
    align_enable_in => align_enable,  -- Start alignment regardless of whether links are already aligned.
    align_marker_in => align_marker, -- Align signal from all links
    align_master_in => align_master, -- Master link to which all others are aligned to.
    align_margin_in => x"3",
    buf_rst_out => buf_rst, -- Resets buffer pointers so that rd/wt pointers to starting positions.
    buf_ptr_inc_out => buf_ptr_inc, -- Places rd ptr closer to wt pointer.
    buf_ptr_dec_out => buf_ptr_dec, -- Places rd ptr further away from the wt pointer.
		align_disable_in => "0010",
		status_out => open);


  -------------------------------------------------------------------------  

  -- virtex7_tmt_protocol_inst: entity work.sc_protocol_debug
  ext_align_gth_spartan_inst: entity work.ext_align_gth_spartan
  generic map(
    SIM_GTRESET_SPEEDUP     => "TRUE",
    SIMULATION              => 1,
    LOCAL_LHC_CLK_MULTIPLE  => LOCAL_LHC_CLK_MULTIPLE,
    LOCAL_LHC_BUNCH_COUNT   => LOCAL_LHC_BUNCH_COUNT,
    X_LOC                   => 0,
    Y_LOC                   => 0)
  port map
  (
    -- TTC based clock
    ttc_clk_in => ttc_clk_240mhz,
    ttc_rst_in => ttc_rst_240mhz,
    -- ttc_orbit_location_in => (others => '0'),
    -- Common signals
    refclk_in => refclk,
    drpclk_in => drpclk,
    sysclk_in => sysclk,
		-- Common dynamic reconfiguration port
		common_drp_address_in => (others => '0'),
		common_drp_data_in => (others => '0'),
		common_drp_data_out => open,
		common_drp_enable_in => '0',
		common_drp_ready_out => open,
		common_drp_write_in => '0',
    -- High Speed Serdes
    rxn_in => rxn,
    rxp_in => rxp,
    txn_out => txn,
    txp_out => txp,
		-- Channel dynamic reconfiguration port
		chan_drp_address_in => (others => "000000000"),
		chan_drp_data_in => (others => x"0000"),
		chan_drp_data_out => open,
		chan_drp_enable_in => (others => '0'),
		chan_drp_ready_out => open,
		chan_drp_write_in => (others => '0'),
    -- Parallel interface data
    txdata_in => txdata,
    txdatavalid_in => txdatavalid,
    rxdata_out => rxdata,
    rxdatavalid_out => rxdatavalid,
    -- External Rx buffer control
    buf_master_in => buf_master,
    buf_rst_in => buf_rst,
    buf_ptr_inc_in => buf_ptr_inc,
    buf_ptr_dec_in => buf_ptr_dec,
    -- Synchronisation signals
    align_marker_out => align_marker,
    -- Channel Registers
    chan_ro_regs_out => chan_ro_regs,
    chan_rw_regs_in => chan_rw_regs,
    -- Common Registers
    common_ro_regs_out => common_ro_regs,
    common_rw_regs_in => common_rw_regs,
		qplllock => open,
		-- Clocks for monitoring
		txclk_mon => open,
		rxclk_mon => open
	);



end behave;

