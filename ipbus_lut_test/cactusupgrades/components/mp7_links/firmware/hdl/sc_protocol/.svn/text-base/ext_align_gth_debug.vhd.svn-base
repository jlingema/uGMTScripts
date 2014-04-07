


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

use work.package_links.all;
use work.package_types.all;
use work.package_utilities.all;


entity ext_align_gth_debug is
generic
(
  SIM_GTRESET_SPEEDUP             : string    := "TRUE";        -- Simulation setting for GT secureip model
  SIMULATION                      : integer   := 0;             -- Set to 1 for simulation
  LOCAL_LHC_CLK_MULTIPLE: integer := 4;
  LOCAL_LHC_BUNCH_COUNT           : integer;                     -- Number of bx per orbit
  TRANSCEIVER_TYPE                : string    := "GTH";          -- Transceiver type "GTH" or "GTX
  X_LOC: integer;
  Y_LOC: integer
  );
port
(
  -- TTC based clock
  ttc_clk_in : in std_logic;
  ttc_rst_in : in std_logic;
  ttc_orbit_location_in : in std_logic_vector(15 downto 0);
  -- Common signals
  refclk_in : in std_logic;  -- 125mhz via dedicated distribution network
  drpclk_in : in std_logic;  -- 50mhz
  sysclk_in : in std_logic;  -- 100mhz
  -- High Speed Serdes
  rxn_in : in std_logic_vector(3 downto 0);
  rxp_in : in std_logic_vector(3 downto 0);
  txn_out : out std_logic_vector(3 downto 0);
  txp_out : out std_logic_vector(3 downto 0);
  -- Parallel interface data
  txdata_in : in type_data_array(3 downto 0);
  txdatavalid_in : in std_logic_vector(3 downto 0);
  rxdata_out : out type_data_array(3 downto 0);
  rxdatavalid_out : out std_logic_vector(3 downto 0);
  -- External Rx buffer control
  buf_master_in: in  std_logic_vector(3 downto 0);
  buf_rst_in: in  std_logic;
  buf_ptr_inc_in: in  std_logic_vector(3 downto 0);
  buf_ptr_dec_in: in  std_logic_vector(3 downto 0);
  -- Synchronisation signals
  align_out : out std_logic_vector(3 downto 0);
  -- Channel Registers
  chan_ro_regs_out : out type_chan_ro_reg_array(3 downto 0);
  chan_rw_regs_in : in type_chan_rw_reg_array(3 downto 0);
  chan_rw_regs_default_out : out type_chan_rw_reg_array(3 downto 0);
  -- Common Registers
  common_ro_regs_out : out type_common_ro_reg;
  common_rw_regs_in : in type_common_rw_reg;
  common_rw_regs_default_out : out type_common_rw_reg;
  -- Misc
  debug_out                          : out std_logic_vector(7 downto 0)
  );
end ext_align_gth_debug;

architecture behave of ext_align_gth_debug is


  signal spy_write_stop: std_logic_vector(3 downto 0);

  -- When crossing clock domains we wish for the data and datavalid signals
  -- to jump at the same time.  Hence merge data nad datavalid into a single 
  -- word called "info" when jumping across the domains.
  type info is array (natural range <>) of std_logic_vector(32 downto 0);
  signal txinfo_at_ttc_clk: info(3 downto 0);
  signal txinfo_at_link_clk: info(3 downto 0);
  
  -- Data path operating @ link speed - 250MHz (K codes not yet inserted)
  signal txcomma_at_link_clk: std_logic_vector(3 downto 0);
  signal txdata_at_link_clk: type_data_array(3 downto 0);
  signal txpad_at_link_clk : std_logic_vector(3 downto 0);

  -- Clocks driving MGT fabric interface
  signal txusrclk, rxusrclk : std_logic_vector(3 downto 0);
  signal txusrrst, rxusrrst : std_logic_vector(3 downto 0);
 
  -- Final data for transmission 
  signal txdata, rxdata : type_data_array(3 downto 0);
  signal txcharisk, rxcharisk : type_charisk_array(3 downto 0);
  
  signal loopback : type_loopback_array(3 downto 0);
  signal txpolarity, rxpolarity : std_logic_vector(3 downto 0);
  signal align_once, align_auto : std_logic_vector(3 downto 0);

  signal rxchariscomma : type_chariscomma_array(3 downto 0);
  signal rxpcommaalignen : std_logic_vector(3 downto 0) := "1111";
  signal rxmcommaalignen : std_logic_vector(3 downto 0) := "1111";
  

  signal rxbyteisaligned : std_logic_vector(3 downto 0);

  signal orbit_location_min, orbit_location_max: type_vector_of_stdlogicvec_x16(3 downto 0);
  signal orbit_location_req: type_vector_of_stdlogicvec_x16(3 downto 0);
  

  signal cdc_status: type_vector_of_stdlogicvec_x6(3 downto 0);
  signal align_checks: type_vector_of_stdlogicvec_x32(3 downto 0);
  signal rx_crc_checked_cnt, rx_crc_error_cnt: type_vector_of_stdlogicvec_x32(3 downto 0);
  signal tx_crc_checked_cnt, tx_crc_error_cnt: type_vector_of_stdlogicvec_x32(3 downto 0);
  
  signal reset_crc_counters: std_logic_vector(3 downto 0);
  
  signal rxdata_int :  type_data_array(3 downto 0);
  signal rxdatavalid_int :  std_logic_vector(3 downto 0);

  signal rxcdrlock :  std_logic_vector(3 downto 0);
  
  signal ttc_bc0_r1: std_logic;
  
  signal txusrclkrate, rxusrclkrate: type_vector_of_stdlogicvec_x32(3 downto 0);
  signal txoutclkrate: type_vector_of_stdlogicvec_x32(3 downto 0);

  signal pulse_1hz: std_logic := '0';
  signal pulse_cnt: natural := 0;

  signal txoutclk : std_logic_vector(3 downto 0);

  signal drpclkrate, refclkrate :  std_logic_vector(31 downto 0);
  
  signal refclk : std_logic;

  signal soft_reset, soft_reset_sysclk, qplllock : std_logic;

  signal txdatavalid, rxdatavalid :  std_logic_vector(3 downto 0);

  signal sync_valid, sync_lost :  std_logic_vector(3 downto 0);
  signal sync_cnt: type_vector_of_stdlogicvec_x32(3 downto 0);
  
  signal ttc_orbit_location_alt              : type_vector_of_stdlogicvec_x16(3 downto 0);
  signal txdata_alt                          : type_data_array(3 downto 0);
  signal txdatavalid_alt                     : std_logic_vector(3 downto 0);
  signal txfastrst                     : std_logic_vector(3 downto 0);

  signal tx_fsm_reset                    : std_logic_vector(3 downto 0);
  signal rx_fsm_reset                    : std_logic_vector(3 downto 0);
  signal tx_fsm_reset_done              : std_logic_vector(3 downto 0);
  signal rx_fsm_reset_done              : std_logic_vector(3 downto 0);
    
  signal rx_comma_det                   : std_logic_vector(3 downto 0);

  signal sync_lost_in_ttc_clk_domain, sync_lost_latch, sync_lost_clear  : std_logic_vector(3 downto 0);
  
  signal align_once_shreg: type_vector_of_stdlogicvec_x2(3 downto 0);
  
begin                       

-- DMN: Change from BUFG to BUFH due to resource issues

  ibufg_refclk_i : bufh port map ( i => refclk_in, o => refclk );

  clk_rate_proc: process(sysclk_in)
  begin
    if rising_edge(sysclk_in) then
      if pulse_cnt = 125000000 then
        pulse_1hz <= '1';
        pulse_cnt <= 0;
      else
        pulse_cnt <= pulse_cnt+1;
        pulse_1hz <= '0';
      end if;
    end if;
  end process;
  
  -- WARNING: Reset not from correct clk domain
  drpclk_rate_inst: clk_rate
  port map(
    async_pulse_in => pulse_1hz,
    clk_in => drpclk_in,
    rst_in => ttc_rst_in,
    clk_rate_out => drpclkrate);

  -- WARNING: Reset not from correct clk domain
  refclk_rate_inst: clk_rate
  port map(
    async_pulse_in => pulse_1hz,
    clk_in => refclk,
    rst_in => ttc_rst_in,
    clk_rate_out => refclkrate);
    
  -- Loop over all channels
  tx_gen: for i in 0 to 3 generate 

    txfastrst_inst: process(qplllock, txusrclk(i))
    begin
      if qplllock = '0' then
        txfastrst(i)  <= '1';
      elsif rising_edge(txusrclk(i)) then
         txfastrst(i)  <= '0';
      end if;
    end process;
        
    ---------------------------------------------------------------------------
    -- Tx Stage (1): Add CRC 
    ---------------------------------------------------------------------------
    -- Add CRC, then merge data & datavalid signal into single word ready for 
    -- clk jump (i.e. we want the data and the datavalid to jump at the same 
    -- time).

    -- Takes external generated in TTC clock domain
    tx_crc_insert: links_crc_tx
    port map(
      reset => ttc_rst_in,
      clk => ttc_clk_in,
      data_in => txdata_in(i), 
      data_valid_in => txdatavalid_in(i),
      data_out => txinfo_at_ttc_clk(i)(31 downto 0),
      data_valid_out => txinfo_at_ttc_clk(i)(32));
    
    ---------------------------------------------------------------------------
    -- Tx Stage (2): Bridge data from 240MHz domain to 250MHz link clock
    ---------------------------------------------------------------------------
    -- There was originally another method of jumping from 240MHz to 250MHz.
    -- It was called cdc_txdata.  It may be worth looking at if te method 
    -- below fails.
    
    tx_clk_bridge: cdc_txdata_circular_buf
    --tx_clk_bridge: cdc_txdata_fifo
    generic map(
      data_length       => 33)
    port map( 
      upstream_clk      =>     ttc_clk_in,
      upstream_rst      =>     ttc_rst_in,
      downstream_clk    =>     txusrclk(i),
      downstream_rst    =>     txusrrst(i),
      data_in           =>     txinfo_at_ttc_clk(i),
      data_out          =>     txinfo_at_link_clk(i),
      pad_out           =>     txpad_at_link_clk(i));
     
  ---------------------------------------------------------------------------
  -- Tx Stage (3): Insert K codes
  ---------------------------------------------------------------------------

   txcomma_at_link_clk(i) <= not txinfo_at_link_clk(i)(32);
   txdata_at_link_clk(i) <= txinfo_at_link_clk(i)(31 downto 0);

   tx_kcode_insert: kcode_insert_commas_and_pad
   port map(
      data_in           => txdata_at_link_clk(i),
      comma_in          => txcomma_at_link_clk(i),
      pad_in            => txpad_at_link_clk(i),
      data_out          => txdata(i),
      charisk_out       => txcharisk(i));

  ---------------------------------------------------------------------------
  -- Tx Stage (Temp): Verify outgoing data paases CRC check
  ---------------------------------------------------------------------------      
      
   txdatavalid(i) <=  not txcharisk(i)(0);

   tx_crc_raw: links_crc_rx
   port map (
      reset                 => txusrrst(i), 
      clk                   => txusrclk(i),
      data_in               => txdata(i),
      data_valid_in         => txdatavalid(i),
      data_out              => open,
      data_valid_out        => open,
      data_start_out        => open,
      reset_counters_in     => reset_crc_counters(i),
      crc_checked_cnt_out   => tx_crc_checked_cnt(i),
      crc_error_cnt_out     => tx_crc_error_cnt(i), 
      status_out            => open);   
    
      
  ---------------------------------------------------------------------------
  -- Check Clks
  ---------------------------------------------------------------------------

    -- WARNING: Reset not from correct clk domain
    -- Done deliberately otherwise clk rate unknown if tx in rst
    txusrclk_rate_inst: clk_rate
    port map(
        async_pulse_in => pulse_1hz,
        clk_in => txusrclk(i),
        rst_in => ttc_rst_in,  -- txusrrst(i)
        clk_rate_out => txusrclkrate(i));
        
  end generate tx_gen;

  ---------------------------------------------------------------------------
  -- GTX
  ---------------------------------------------------------------------------

  -- The "virtex7_quad_wrapper" contains:
  -- 1) rxusrclk & txusrclk distribution.
  -- 2) gtx initilisation
  -- 3) gtx x 4
  -- 4) quad clocking

  -- Make sure soft reset is in stable clock domain
  sync_pulse_inst: async_pulse_sync
    port map(
        async_pulse_in => soft_reset,
        sync_clk_in => sysclk_in,
        sync_pulse_out => soft_reset_sysclk,
        sync_pulse_sgl_clk_out => open);
        
  gth_quad_wrapper_jj: entity work.gth_quad_wrapper_jj
  generic map(
    -- Simulation attributes  
    SIMULATION => SIMULATION,
    SIM_GTRESET_SPEEDUP => SIM_GTRESET_SPEEDUP,
    -- Configuration
    STABLE_CLOCK_PERIOD => 10,       -- Period of the stable clock driving this state-machine, unit is [ns] 
    LINE_RATE => 10.0,               -- gb/s
    REFERENCE_CLOCK_RATE => 125.0,   -- mhz
    PRBS_MODE => "SET THIS TO SOMETHING SENSIBLE",
    -- Placement information
    X_LOC => X_LOC,
    Y_LOC => Y_LOC)
  port map( 
    -- Common signals
    soft_reset_in => soft_reset_sysclk,       -- Clock domain = STABLE_CLOCK
    refclk_in => refclk_in,
    drpclk_in => drpclk_in,
    sysclk_in => sysclk_in,
    qplllock_out => qplllock,
    
    -- Channel signals
    rxusrclk_out => rxusrclk,
    txusrclk_out => txusrclk,
    rxusrrst_out => rxusrrst,
    txusrrst_out => txusrrst,
    
    rxn_in => rxn_in,
    rxp_in => rxp_in,
    txn_out => txn_out,
    txp_out => txp_out,
    
    tx_fsm_reset_in => tx_fsm_reset, 
    rx_fsm_reset_in => rx_fsm_reset,
    tx_fsm_reset_done_out => tx_fsm_reset_done,
    rx_fsm_reset_done_out => rx_fsm_reset_done,
    
    rx_comma_det_out => rx_comma_det,
    
    txoutclk_out => txoutclk,
    loopback_in => loopback,
    
    txpolarity_in => txpolarity,
    rxpolarity_in => rxpolarity,
    
    txdata_in => txdata,
    txcharisk_in => txcharisk,
    rxcdrlock_out => rxcdrlock,
    rxdata_out => rxdata,
    rxcharisk_out => rxcharisk,
    rxchariscomma_out => rxchariscomma,
    rxbyteisaligned_out => rxbyteisaligned,
    rxpcommaalignen_in => rxpcommaalignen,      -- Clock domain = RXUSRCLK2
    rxmcommaalignen_in => rxmcommaalignen);     -- Clock domain = RXUSRCLK2

  -- Loop over all channels
  rx_gen: for i in 0 to 3 generate 
  
  ---------------------------------------------------------------------------
  -- Rx Stage (Debug): Verify incoming data paases CRC check
  ---------------------------------------------------------------------------      
      
   --rxdatavalid(i) <=  not rx_comma_det(i);
   --rxdatavalid(i) <=  not rxcharisk(i)(0);
   --rxpad(i) <= '1' when rxcharisk_in = "1111" else '0'; 
 
  -----------------------------------------------------------------------------
  ---- Rx Stage (1): CDC
  -----------------------------------------------------------------------------
  
  rxdata_simple_cdc_buf_inst: rxdata_simple_cdc_buf
  generic map(
    SIMULATION => SIMULATION)
  port map(
      -- All the following in link clk domain
     link_rst_in => rxusrrst(i),
     link_clk_in => rxusrclk(i),
     rxdata_in => rxdata(i),
     rxcharisk_in => rxcharisk(i),
     -- Want to keep it all in the local clk domain
     local_rst_in => ttc_rst_in,
     local_clk_in => ttc_clk_in,
     buf_master_in => buf_master_in(i),
     buf_rst_in => buf_rst_in,
     buf_ptr_inc_in => buf_ptr_inc_in(i),
     buf_ptr_dec_in => buf_ptr_dec_in(i),
     rxdata_out => rxdata_int(i),
     rxdatavalid_out => rxdatavalid_int(i));
    
  ---------------------------------------------------------------------------
  -- Rx Stage (2): CRC
  ---------------------------------------------------------------------------

     rx_crc: links_crc_rx
     port map (
        reset                 => ttc_rst_in, 
        clk                   => ttc_clk_in,
        data_in               => rxdata_int(i),
        data_valid_in         => rxdatavalid_int(i),
        data_out              => rxdata_out(i),
        data_valid_out        => rxdatavalid_out(i),
        data_start_out        => align_out(i),
        reset_counters_in     => reset_crc_counters(i),
        crc_checked_cnt_out   => rx_crc_checked_cnt(i),
        crc_error_cnt_out     => rx_crc_error_cnt(i), 
        status_out            => open);    
        
  ---------------------------------------------------------------------------
  -- Check Clks
  ---------------------------------------------------------------------------
  
    -- WARNING: Reset not from correct clk domain
    -- Done deliberately otherwise clk rate unknown if tx in rst
    rxusrclk_rate_inst: clk_rate
    port map(
        async_pulse_in => pulse_1hz,
        clk_in => rxusrclk(i),
        rst_in =>  ttc_rst_in, -- rxusrrst(i),
        clk_rate_out => rxusrclkrate(i));

  ---------------------------------------------------------------------------
  -- Data Tracker
  ---------------------------------------------------------------------------

    data_checker_inst: data_checker
    port map(
        tx_clk => txusrclk(i),
        tx_rst => txusrrst(i),
        tx_data_in => txdata(i),
        tx_datavalid_in => txdatavalid(i), 
        rx_clk => ttc_clk_in, 
        rx_rst =>  ttc_rst_in,
        rx_data_in =>  rxdata_int(i),
        rx_datavalid_in => rxdatavalid_int(i),
        sync_cnt_out => sync_cnt(i),        
        sync_valid_out =>  sync_valid(i),
        sync_lost_out =>  sync_lost(i));

    -- Move sync lost into TTC domain as a single pulse.
    sync_loss_cdc: async_pulse_sync
    port map(
        async_pulse_in => sync_lost(i),
        sync_clk_in => ttc_clk_in,
        sync_pulse_out => open,
        sync_pulse_sgl_clk_out => sync_lost_in_ttc_clk_domain(i));    

    -- Latch occurence of sync lost.
    sync_loss_latch_proc: process(ttc_clk_in) 
    begin
      if rising_edge(ttc_clk_in) then
        if (ttc_rst_in = '1') or (sync_lost_clear(i) = '1') then
          sync_lost_latch(i) <= '0';
        elsif (sync_lost_in_ttc_clk_domain(i) = '1') then
          sync_lost_latch(i) <= '1';
        end if;
      end if;
    end process;
    
  end generate rx_gen;

  -----------------------------------------------------------------------------
  ---- CHANNEL Register Access:
  -----------------------------------------------------------------------------




  -- Loop over all channels
  reg_gen: for i in 0 to 3 generate 
  
   -- ReadOnly Regs. All TTC domain
   chan_ro_regs_out(i)(0) <= orbit_location_max(i) &
                    orbit_location_min(i);
   chan_ro_regs_out(i)(1) <= align_checks(i);
   chan_ro_regs_out(i)(2) <= rx_crc_checked_cnt(i);
   chan_ro_regs_out(i)(3) <= rx_crc_error_cnt(i);
   chan_ro_regs_out(i)(4) <= txusrrst(i) & rxusrrst(i) & sync_valid(i) & sync_lost(i) & rxcdrlock(i) & tx_fsm_reset_done(i) & rx_fsm_reset_done(i) & sync_lost_latch(i) & x"0000" & "00" & cdc_status(i);
   chan_ro_regs_out(i)(5) <= txusrclkrate(i);
   chan_ro_regs_out(i)(6) <= rxusrclkrate(i);
   chan_ro_regs_out(i)(7) <= tx_crc_checked_cnt(i);
   chan_ro_regs_out(i)(8) <= tx_crc_error_cnt(i);  
   
   -- ReadWrite Regs. All TTC domain except for polarity & loopback regs: 
   orbit_location_req(i) <= chan_rw_regs_in(i)(0)(15 downto 0);
   align_once_shreg(i)(0) <= chan_rw_regs_in(i)(0)(16);
   align_auto(i) <= chan_rw_regs_in(i)(0)(17);
   -- txpolarity is in the txusrclk2 domain
   txpolarity(i) <= chan_rw_regs_in(i)(0)(18) when rising_edge(txusrclk(i));
   -- rxpolarity is in the rxusrclk2 domain
   rxpolarity(i) <= chan_rw_regs_in(i)(0)(19) when rising_edge(rxusrclk(i));
   -- loopback is async input
   loopback(i) <= chan_rw_regs_in(i)(0)(22 downto 20);
   reset_crc_counters(i) <= chan_rw_regs_in(i)(0)(23);
   spy_write_stop(i) <= not chan_rw_regs_in(i)(0)(24);
   -- JJ's code handles clock domain crossing
   -- JJ's code also seprates out QPLL, which has a FSM that will automatically try to lock
   tx_fsm_reset(i) <= chan_rw_regs_in(i)(0)(25);
   rx_fsm_reset(i) <= chan_rw_regs_in(i)(0)(26);
   sync_lost_clear(i) <= chan_rw_regs_in(i)(0)(27);

   -- ReadWrite DefaultRegs: 
   chan_rw_regs_default_out(i)(0) <= x"0000" & std_logic_vector(to_unsigned(50, 16));

  end generate;



  -----------------------------------------------------------------------------
  ---- COMMON Register Access:
  -----------------------------------------------------------------------------
  
  -- COMMON: ReadOnly Regs.
  -- WARNING: Clock domain may not be observed
  common_ro_regs_out(0) <= refclkrate;
  common_ro_regs_out(1) <= drpclkrate;
  common_ro_regs_out(2)(0) <= qplllock;
  common_ro_regs_out(2)(31 downto 1) <= (others => '0');

  -- COMMON: ReadWrite Regs.
  -- WARNING: Clock domain may not be observed
  soft_reset <= common_rw_regs_in(0)(0);

  -- COMMON: ReadWrite DefaultRegs:    
  common_rw_regs_default_out(0) <= x"00000000";

  bufg_rx : bufg port map ( i => rxusrclk(0), o => debug_out(0) );
  bufg_tx : bufg port map ( i => txusrclk(0), o => debug_out(1) );

  debug_out (2) <= refclk;
  debug_out (7 downto 3) <= (others => '0');



---------------------------------------------------------------------------
-- Useful information
---------------------------------------------------------------------------


   -- Loopback mode (loopback)
   -- 000: Normal operation
   -- 001: Near-End PCS Loopback
   -- 010: Near-End PMA Loopback
   -- 011: Reserved
   -- 100: Far-End PMA Loopback
   -- 101: Reserved
   -- 110: Far-End PCS Loopback(1)
   -- 111: Reserved

   -- Magnitude of differential swing (txdiffctrl)
   -- 000: 1100
   -- 001: 1050
   -- 010: 1000
   -- 011: 900
   -- 100: 800
   -- 101: 600
   -- 110: 400
   -- 111: 0

   -- Magnitude of pre-emphasis (txpreemphasis)
   -- TxPreEmphasis (%) TX_DIFF_BOOST = FALSE(Default), TRUE
   -- 000: 2 3
   -- 001: 2 3
   -- 010: 2.5 4
   -- 011: 4.5 10.5
   -- 100: 9.5 18.5
   -- 101: 16 28
   -- 110: 23 39
   -- 111: 31 52
     
end behave;
