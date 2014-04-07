


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library unisim;
use unisim.vcomponents.all;

library work;
use work.package_links.all;
use work.package_types.all;
use work.package_utilities.all;


entity int_align_gtx_debug is
generic
(
  SIM_GTRESET_SPEEDUP             : string    := "TRUE";        -- Simulation setting for GT secureip model
  SIMULATION                      : integer   := 0;             -- Set to 1 for simulation
  LOCAL_LHC_CLK_MULTIPLE: integer := 4;
  LOCAL_LHC_BUNCH_COUNT           : integer;                     -- Number of bx per orbit
  X_LOC: integer;
  Y_LOC: integer
  );
port
(
  -- TTC based clock
  ttc_clk_in                  : in std_logic;
  ttc_rst_in                  : in std_logic;
  ttc_orbit_location_in              : in std_logic_vector(15 downto 0);
  -- Common signals
  refclk_in                          : in std_logic;  -- 125mhz via dedicated distribution network
  drpclk_in                          : in std_logic;  -- 50mhz
  sysclk_in                          : in std_logic;  -- 100mhz
  -- High Speed Serdes
  rxn_in                             : in std_logic_vector(3 downto 0);
  rxp_in                             : in std_logic_vector(3 downto 0);
  txn_out                            : out std_logic_vector(3 downto 0);
  txp_out                            : out std_logic_vector(3 downto 0);
  -- Parallel interface data
  txdata_in                          : in type_data_array(3 downto 0);
  txdatavalid_in                     : in std_logic_vector(3 downto 0);
  rxdata_out                         : out type_data_array(3 downto 0);
  rxdatavalid_out                    : out std_logic_vector(3 downto 0);
  -- Channel Registers
  chan_ro_regs_out                    : out type_chan_ro_reg_array(3 downto 0);
  chan_rw_regs_in                     : in type_chan_rw_reg_array(3 downto 0);
  -- Common Registers
  common_ro_regs_out                    : out type_common_ro_reg;
  common_rw_regs_in                     : in type_common_rw_reg;
  -- Misc
  qplllock: out std_logic;
   -- Monitoring clocks
  txclk_mon: out std_logic;
  rxclk_mon: out std_logic_vector(3 downto 0)
  );
end int_align_gtx_debug;

architecture behave of int_align_gtx_debug is

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
  signal rxpcommaalignen, rxpcommaalignen_rxusrclk2 : std_logic_vector(3 downto 0);
  signal rxmcommaalignen, rxmcommaalignen_rxusrclk2 : std_logic_vector(3 downto 0);
  

  signal rxbyteisaligned : std_logic_vector(3 downto 0);

  signal orbit_location_min, orbit_location_max: type_vector_of_stdlogicvec_x16(3 downto 0);
  signal orbit_location_req: type_vector_of_stdlogicvec_x16(3 downto 0);
  

  signal cdc_status: type_vector_of_stdlogicvec_x6(3 downto 0);
  signal align_checks: type_vector_of_stdlogicvec_x8(3 downto 0);
  signal rx_crc_checked_cnt, rx_crc_error_cnt: type_vector_of_stdlogicvec_x8(3 downto 0);
  signal tx_crc_checked_cnt, tx_crc_error_cnt: type_vector_of_stdlogicvec_x8(3 downto 0);
  
  signal reset_crc_counters: std_logic_vector(3 downto 0);
  
  signal rxdata_int :  type_data_array(3 downto 0);
  signal rxdatavalid_int :  std_logic_vector(3 downto 0);

  signal rxcdrlock :  std_logic_vector(3 downto 0);
  
  signal ttc_bc0_r1: std_logic;
  
  signal txoutclk : std_logic_vector(3 downto 0);
  
  signal soft_reset, soft_reset_sysclk, qplllock_i : std_logic;

  signal txdatavalid, rxdatavalid :  std_logic_vector(3 downto 0);

  signal sync_valid, sync_lost :  std_logic_vector(3 downto 0);
  signal sync_cnt: type_vector_of_stdlogicvec_x32(3 downto 0);
  
  signal ttc_orbit_location_alt              : type_vector_of_stdlogicvec_x16(3 downto 0);
  signal txdata_alt                          : type_data_array(3 downto 0);
  signal txdatavalid_alt                     : std_logic_vector(3 downto 0);

  signal tx_fsm_reset                    : std_logic_vector(3 downto 0);
  signal rx_fsm_reset                    : std_logic_vector(3 downto 0);
  signal tx_fsm_reset_done              : std_logic_vector(3 downto 0);
  signal rx_fsm_reset_done              : std_logic_vector(3 downto 0);
    
  signal rx_comma_det                   : std_logic_vector(3 downto 0);

  signal sync_lost_in_ttc_clk_domain, sync_lost_latch, sync_lost_clear  : std_logic_vector(3 downto 0);
  
  signal align_once_shreg: type_vector_of_stdlogicvec_x2(3 downto 0);
  
  signal divclk, divclkout: std_logic_vector(4 downto 0);

	component gtx_quad_wrapper_jj is
	generic
	(
		 -- Simulation attributes
		 SIMULATION                      : integer := 0;          -- Set to 1 for simulation
		 SIM_GTRESET_SPEEDUP             : string := "FALSE";     -- Set to "true" to speed up sim reset
		 -- Configuration
		 STABLE_CLOCK_PERIOD             : integer := 8;           -- Period of the stable clock driving this state-machine, unit is [ns] 
		 LINE_RATE                       : real := 6.4;            -- gb/s
		 REFERENCE_CLOCK_RATE            : real := 160.0;          -- mhz
		 PRBS_MODE                       : string := "SET THIS TO SOMETHING SENSIBLE";
		 -- Placement information
		 X_LOC                           : integer := 0;
		 Y_LOC                           : integer := 0
	);
	port
	(
		 -- Common signals
		 soft_reset_in                      : in   std_logic;
		 refclk_in                          : in   std_logic;
		 drpclk_in                          : in   std_logic;
		 sysclk_in                          : in   std_logic;
		 qplllock_out                       : out   std_logic;
		 
		 -- Channel signals
		 rxusrclk_out                       : out  std_logic_vector(3 downto 0);
		 txusrclk_out                       : out  std_logic_vector(3 downto 0);
		 rxusrrst_out                       : out  std_logic_vector(3 downto 0);
		 txusrrst_out                       : out  std_logic_vector(3 downto 0);
		 
		 rxn_in                             : in   std_logic_vector(3 downto 0);
		 rxp_in                             : in   std_logic_vector(3 downto 0);
		 txn_out                            : out  std_logic_vector(3 downto 0);
		 txp_out                            : out  std_logic_vector(3 downto 0);
		 
		 tx_fsm_reset_in                    : in   std_logic_vector(3 downto 0);
		 rx_fsm_reset_in                    : in   std_logic_vector(3 downto 0);
		 tx_fsm_reset_done_out              : out   std_logic_vector(3 downto 0);
		 rx_fsm_reset_done_out              : out   std_logic_vector(3 downto 0);
		 
		 rx_comma_det_out                   : out   std_logic_vector(3 downto 0);
					
		 txoutclk_out                       : out  std_logic_vector(3 downto 0);
		 loopback_in                        : in type_loopback_array(3 downto 0);
		 
		 txpolarity_in                      : in  std_logic_vector(3 downto 0);
		 rxpolarity_in                      : in  std_logic_vector(3 downto 0);
		 
		 txdata_in                          : in type_data_array(3 downto 0);
		 txcharisk_in                       : in type_charisk_array(3 downto 0);
		 rxcdrlock_out                      : out  std_logic_vector(3 downto 0);
		 rxdata_out                         : out type_data_array(3 downto 0);
		 rxcharisk_out                      : out type_charisk_array(3 downto 0);
		 rxchariscomma_out                  : out type_chariscomma_array(3 downto 0);
		 rxbyteisaligned_out                : out std_logic_vector(3 downto 0);
		 rxpcommaalignen_in                : in std_logic_vector(3 downto 0);
		 rxmcommaalignen_in                : in std_logic_vector(3 downto 0)
	);	
	end component;

  
begin                       

divclk <= txusrclk(0) & rxusrclk;
  
  div_ref: entity work.freq_ctr_div
  	generic map(
  		N_CLK => 5
  	)
  	port map(
  		clk => divclk,
  		clkdiv => divclkout
  	);
  	
  txclk_mon <= divclkout(4);
  rxclk_mon <= divclkout(3 downto 0);
    
  -- Loop over all channels
  tx_gen: for i in 0 to 3 generate 

--    txfastrst_inst: process(qplllock_i, txusrclk(i))
--    begin
--      if qplllock_i = '0' then
--        txfastrst(i)  <= '1';
--      elsif rising_edge(txusrclk(i)) then
--         txfastrst(i)  <= '0';
--      end if;
--   end process;
        
--    -- At present all txusrclks driven from txout clk so could use single inst, but just in case I change the design...
--    pattern_generator_inst: entity work.pattern_generator
--    generic map(
--      TOTAL_LENGTH => (6* LOCAL_LHC_BUNCH_COUNT),
--      GAP_LENGTH => 10)
--    port map(
--      rst_in => txfastrst(i),
--      clk_in => txusrclk(i),
--      txdata_out => txdata_alt(i),
--      txdatavalid_out => txdatavalid_alt(i),
--      counter_out => ttc_orbit_location_alt(i));

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

--    -- Takes locally generated in txusrclk domain (used for debugging).
--    tx_crc_insert: links_crc_tx
--    port map(
--      reset => txfastrst(i),
--      clk => txusrclk(i),
--      data_in => txdata_alt(i),
--      data_valid_in => txdatavalid_alt(i),
--      data_out => txinfo_at_link_clk(i)(31 downto 0),
--      data_valid_out => txinfo_at_link_clk(i)(32));
--
--    txpad_at_link_clk(i) <= '0';
    
    ---------------------------------------------------------------------------
    -- Tx Stage (2): Bridge data from 240MHz domain to 250MHz link clock
    ---------------------------------------------------------------------------
    -- There was originally another method of jumping from 240MHz to 250MHz.
    -- It was called cdc_txdata.  It may be worth looking at if te method 
    -- below fails.
    
    --tx_clk_bridge: cdc_txdata_circular_buf
    tx_clk_bridge: cdc_txdata_fifo
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
        
  -- WARNING: If using ngc rather than src code these generics will not propagate.
  -- WARNING: If building ngc make sure generics are set correctlt in entity.   
  gtx_quad_wrapper_jj_inst: gtx_quad_wrapper_jj
  generic map(
    -- Simulation attributes  
    SIMULATION => SIMULATION,
    SIM_GTRESET_SPEEDUP => SIM_GTRESET_SPEEDUP,
    -- Configuration
    STABLE_CLOCK_PERIOD => 8,       -- Period of the stable clock driving this state-machine, unit is [ns] 
    LINE_RATE => 6.4,               -- gb/s
    REFERENCE_CLOCK_RATE => 160.0,  -- mhz
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
    qplllock_out => qplllock_i,
    
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
    rxpcommaalignen_in => rxpcommaalignen_rxusrclk2,      -- Clock domain = RXUSRCLK2
    rxmcommaalignen_in => rxmcommaalignen_rxusrclk2);     -- Clock domain = RXUSRCLK2

  -- Loop over all channels
  rx_gen: for i in 0 to 3 generate 
  
  ---------------------------------------------------------------------------
  -- Rx Stage (Debug): Verify incoming data paases CRC check
  ---------------------------------------------------------------------------      
      
   --rxdatavalid(i) <=  not rx_comma_det(i);
   rxdatavalid(i) <=  not rxcharisk(i)(0);

--   rx_crc_raw: links_crc_rx
--   port map (
--      reset                 => rxusrrst(i), 
--      clk                   => rxusrclk(i),
--      data_in               => rxdata(i),
--      data_valid_in         => rxdatavalid(i),
--      data_out              => open,
--      data_valid_out        => open,
--      data_start_out        => open,
--      reset_counters_in     => reset_crc_counters(i),
--      crc_checked_cnt_out   => rx_crc_checked_cnt(i),
--      crc_error_cnt_out     => rx_crc_error_cnt(i), 
--      status_out            => open);   
  
  -----------------------------------------------------------------------------
  ---- Rx Stage (1): CDC
  -----------------------------------------------------------------------------
  
    -- Need to make sure code can distinguis between padding words & commas in async link
  
    rx_cdc: rxdata_clock_domain_change_and_align
    generic map(
      LOCAL_LHC_CLK_MULTIPLE => LOCAL_LHC_CLK_MULTIPLE,
      LOCAL_LHC_BUNCH_COUNT => LOCAL_LHC_BUNCH_COUNT)
    port map(
      local_rst_in => ttc_rst_in,
      local_clk_in => ttc_clk_in,
      link_rst_in => rxusrrst(i),
      link_clk_in => rxusrclk(i),
      align_once_in => align_once(i),
      align_auto_in => align_auto(i),
      rxdata_in => rxdata(i),
      rxcharisk_in => rxcharisk(i),
      --rxchariscomma_in => rxchariscomma(i),
      rxcommadet_in => rxcharisk(i)(0), 
      rxbyteisaligned_in => rxbyteisaligned(i),
      rxpcommaalignen_out => rxpcommaalignen(i),  -- Unconnected in JJ code
      rxmcommaalignen_out => rxmcommaalignen(i),   -- Unconnected in JJ code
      --orbit_location_in => ttc_orbit_location_alt(i), Cannot workunless entire code in same clk domain.
      orbit_location_in => ttc_orbit_location_in,
      orbit_location_req_in => orbit_location_req(i),
      orbit_location_max_out => orbit_location_max(i),
      orbit_location_min_out => orbit_location_min(i),
      rxdata_out => rxdata_int(i),
      rxdatavalid_out => rxdatavalid_int(i),
      align_checks_out => align_checks(i), 
      status_out => cdc_status(i));

  -- Make sure rxpcommaalignen is in RXUSRCLK2 clock domain
    rxpcommaalignen_cdc: async_pulse_sync
    port map(
        async_pulse_in => rxpcommaalignen(i),
        sync_clk_in => rxusrclk(i),
        sync_pulse_out => rxpcommaalignen_rxusrclk2(i),
        sync_pulse_sgl_clk_out => open);

  -- Make sure rxpcommaalignen is in RXUSRCLK2 clock domain
    rxmcommaalignen_cdc: async_pulse_sync
    port map(
        async_pulse_in => rxmcommaalignen(i),
        sync_clk_in => rxusrclk(i),
        sync_pulse_out => rxmcommaalignen_rxusrclk2(i),
        sync_pulse_sgl_clk_out => open);


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
        data_start_out        => open,
        reset_counters_in     => reset_crc_counters(i),
        crc_checked_cnt_out   => rx_crc_checked_cnt(i),
        crc_error_cnt_out     => rx_crc_error_cnt(i), 
        status_out            => open);    
        
  ---------------------------------------------------------------------------
  -- Spy memory
  ---------------------------------------------------------------------------
  
--    rx_spy: spy_buffer_32x512
--    port map(
--      clk_a            => ttc_clk_in,
--      write_data_a     => rxdata_int(i),
--      write_stop_a     => spy_write_stop(i),
--      clk_b            => sysclk_in,
--      read_add_b       => spy_read_add_in(i),
--      read_data_b      => spy_read_data_out(i),
--      read_enable_b    => spy_read_enable_in(i),
--      read_ack_b       => spy_read_ack_out(i));

  ---------------------------------------------------------------------------
  -- Data Tracker
  ---------------------------------------------------------------------------

--    data_checker_inst: data_checker
--    port map(
--        tx_clk => txusrclk(i),
--        tx_rst => txusrrst(i),
--        tx_data_in => txdata(i),
--        tx_datavalid_in => txdatavalid(i), 
--        rx_clk => rxusrclk(i), 
--        rx_rst =>  rxusrrst(i),
--        rx_data_in =>  rxdata(i),
--        rx_datavalid_in => rxdatavalid(i),
--        sync_cnt_out => sync_cnt(i),        
--        sync_valid_out =>  sync_valid(i),
--        sync_lost_out =>  sync_lost(i));

      
--    data_checker_inst: data_checker
--    port map(
--        tx_clk => txusrclk(i),
--        tx_rst => txusrrst(i),
--        tx_data_in => txdata(i),
--        tx_datavalid_in => txdatavalid(i), 
--        rx_clk => ttc_clk_in, 
--        rx_rst =>  ttc_rst_in,
--        rx_data_in =>  rxdata_int(i),
--        rx_datavalid_in => rxdatavalid_int(i),
--        sync_cnt_out => sync_cnt(i),        
--        sync_valid_out =>  sync_valid(i),
--        sync_lost_out =>  sync_lost(i));
        


--    -- Move sync lost into TTC domain as a single pulse.
--    sync_loss_cdc: async_pulse_sync
--    port map(
--        async_pulse_in => sync_lost(i),
--        sync_clk_in => ttc_clk_in,
--        sync_pulse_out => open,
--        sync_pulse_sgl_clk_out => sync_lost_in_ttc_clk_domain(i));    

--    -- Latch occurence of sync lost.
--    sync_loss_latch_proc: process(ttc_clk_in) 
--    begin
--      if rising_edge(ttc_clk_in) then
--        if (ttc_rst_in = '1') or (sync_lost_clear(i) = '1') then
--          sync_lost_latch(i) <= '0';
--        elsif (sync_lost_in_ttc_clk_domain(i) = '1') then
--          sync_lost_latch(i) <= '1';
--        end if;
--      end if;
--    end process;
    
--    -- Latch occurence of sync lost.
--    align_once_proc: process(ttc_clk_in) 
--    begin
--      if rising_edge(ttc_clk_in) then
--        align_once_shreg(i)(1) <= align_once_shreg(i)(0);
--        align_once(i) <= (not align_once_shreg(i)(1)) and align_once_shreg(i)(0);
--      end if;
--    end process;
    
  end generate rx_gen;

  -----------------------------------------------------------------------------
  ---- CHANNEL Register Access:
  -----------------------------------------------------------------------------

  -- Loop over all channels
  reg_gen: for i in 0 to 3 generate 
  
   -- ReadOnly Regs. All TTC domain
   chan_ro_regs_out(i)(0) <= orbit_location_max(i) & orbit_location_min(i);
   chan_ro_regs_out(i)(1) <= txusrrst(i) & rxusrrst(i) & sync_valid(i) & sync_lost(i) &
   	rxcdrlock(i) & tx_fsm_reset_done(i) & rx_fsm_reset_done(i) &
   	sync_lost_latch(i) & x"0000" & "00" & cdc_status(i);
   chan_ro_regs_out(i)(2) <= X"000000" & align_checks(i);
   chan_ro_regs_out(i)(3) <= tx_crc_error_cnt(i) & tx_crc_checked_cnt(i) &
   	rx_crc_error_cnt(i) & rx_crc_checked_cnt(i);
   
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

  end generate;



  -----------------------------------------------------------------------------
  ---- COMMON Register Access:
  -----------------------------------------------------------------------------
  
  -- COMMON: ReadOnly Regs.
  -- WARNING: Clock domain may not be observed
  common_ro_regs_out(0)(0) <= qplllock_i;
  common_ro_regs_out(0)(31 downto 1) <= (others => '0');

  -- COMMON: ReadWrite Regs.
  -- WARNING: Clock domain may not be observed
  soft_reset <= common_rw_regs_in(0)(0);
  
  qplllock <= qplllock_i;

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
