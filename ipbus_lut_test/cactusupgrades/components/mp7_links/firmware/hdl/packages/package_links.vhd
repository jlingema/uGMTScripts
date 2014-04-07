

-- Uses "Ultimate CRC" by Geir Drange @ opencores.org
-- gedra@opencores.org

-- Polynomial obtained from citation in Wikipedia
-- http://en.wikipedia.org/wiki/Cyclic_redundancy_check#cite_note-24

-- Portable Network Graphics Specification, Version 1.2
-- http://www.libpng.org/pub/png/spec/1.2/PNG-Structure.html#CRC-algorithm
-- x^32+x^26+x^23+x^22+x^16+x^12+x^11+x^10+x^8+x^7+x^5+x^4+x^2+x+1

library ieee;		   
use ieee.std_logic_1164.all;		   
use ieee.numeric_std.all;

Library UNIMACRO;
use UNIMACRO.vcomponents.all;

library work;
use work.package_types.all;   

library work;		   
package package_links is		   


  type type_data_array is array(natural range <>) of std_logic_vector(31 downto 0);
  type type_charisk_array is array(natural range <>) of std_logic_vector(3 downto 0);
  type type_chariscomma_array is array(natural range <>) of std_logic_vector(3 downto 0);
  type type_loopback_array is array(natural range <>) of std_logic_vector(2 downto 0);

  -- CHANNEL register space is an array of 32bit registers
  constant NUMBER_OF_CHAN_RO_REGS: integer := 4;
  constant NUMBER_OF_CHAN_RW_REGS: integer := 1;

  -- CHANNEL register space
  subtype type_chan_ro_reg is type_vector_of_stdlogicvec_x32(NUMBER_OF_CHAN_RO_REGS-1 downto 0);
  subtype type_chan_rw_reg is type_vector_of_stdlogicvec_x32(NUMBER_OF_CHAN_RW_REGS-1 downto 0);

  -- For multiple CHANNELS we need an array of register spaces.
  -- (actually an array of an array of 32bit words)
  type type_chan_ro_reg_array is array(natural range <>) of type_chan_ro_reg;
  type type_chan_rw_reg_array is array(natural range <>) of type_chan_rw_reg;
  
  -- COMMON register space is an array of 32bit registers
  constant NUMBER_OF_COMMON_RO_REGS: integer := 1;
  constant NUMBER_OF_COMMON_RW_REGS: integer := 1;
  
  -- COMMON register space
  subtype type_common_ro_reg is type_vector_of_stdlogicvec_x32(NUMBER_OF_COMMON_RO_REGS-1 downto 0);
  subtype type_common_rw_reg is type_vector_of_stdlogicvec_x32(NUMBER_OF_COMMON_RW_REGS-1 downto 0);

  -- DRP Ports
  type type_drp_data_array is array(natural range <>) of std_logic_vector(15 downto 0);
  type type_drp_addr_array is array(natural range <>) of std_logic_vector(8 downto 0);


  component kcode_insert_commas is
  port(
    data_in                         : in   std_logic_vector(31 downto 0);
    data_valid_in                   : in   std_logic;
    data_out                        : out  std_logic_vector(31 downto 0);
    charisk_out                     : out  std_logic_vector(3 downto 0));
  end component;

  component kcode_insert_commas_and_pad is
  port(
    data_in                         : in   std_logic_vector(31 downto 0);
    comma_in                        : in   std_logic;
    pad_in                          : in   std_logic;
    data_out                        : out  std_logic_vector(31 downto 0);
    charisk_out                     : out  std_logic_vector(3 downto 0));
  end component;

  component links_crc_rx is
  port(
    reset:                  in std_logic;
    clk:                    in std_logic;
    data_in:                in std_logic_vector(31 downto 0);
    data_valid_in:          in std_logic;
    data_out:               out std_logic_vector(31 downto 0);
    data_valid_out:         out std_logic;
    data_start_out:         out std_logic;
    reset_counters_in:      in std_logic;
    crc_checked_cnt_out:    out std_logic_vector(7 downto 0);
    crc_error_cnt_out:      out std_logic_vector(7 downto 0);
    status_out:             out std_logic_vector(3 downto 0));
  end component;

  component links_crc_tx is
  port(
    reset:                  in std_logic;
    clk:                    in std_logic;
    data_in:                in std_logic_vector(31 downto 0);
    data_valid_in:          in std_logic;
    data_out:               out std_logic_vector(31 downto 0);
    data_valid_out:         out std_logic);
  end component;

  component cdc_txdata_circular_buf is
  generic(
    data_length       : natural :=32);
  port( 
    upstream_clk      : in     std_logic;
    upstream_rst      : in     std_logic;
    downstream_clk    : in     std_logic;
    downstream_rst    : in     std_logic;
    data_in           : in     std_logic_vector(32 downto 0);
    data_out          : out    std_logic_vector(32 downto 0);
    pad_out           : out    std_logic);
  end component;
  
  component cdc_txdata_fifo is
    generic(
      data_length       : natural :=36);  -- Not all lengths yet supported.
    port( 
      upstream_clk      : in     std_logic;
      upstream_rst      : in     std_logic;
      downstream_clk    : in     std_logic;
      downstream_rst    : in     std_logic;
      data_in           : in     std_logic_vector(data_length-1 downto 0);
      data_out          : out    std_logic_vector(data_length-1 downto 0);
      pad_out           : out    std_logic);
  end component;

  component rxdata_clock_domain_change_and_align is
  generic
  (
     LOCAL_LHC_CLK_MULTIPLE: integer := 4;
     LOCAL_LHC_BUNCH_COUNT:    integer
  );
  port 
  (
     local_rst_in:              in  std_logic;
     local_clk_in:              in  std_logic;  
     link_rst_in:               in std_logic;
     link_clk_in:               in std_logic;
     align_once_in:             in  std_logic;
     align_auto_in:             in  std_logic;   
     rxdata_in:                 in std_logic_vector(31 downto 0);
     rxcharisk_in:          in std_logic_vector(3 downto 0);
     rxcommadet_in:          in std_logic;
     rxbyteisaligned_in:        in  std_logic;
     rxpcommaalignen_out:       out std_logic;
     rxmcommaalignen_out:       out std_logic; 
     orbit_location_in:         in  std_logic_vector(15 downto 0);
     orbit_location_req_in:     in  std_logic_vector(15 downto 0);
     orbit_location_max_out:    out std_logic_vector(15 downto 0);
     orbit_location_min_out:    out std_logic_vector(15 downto 0);
     rxdata_out:               out std_logic_vector(31 downto 0);
     rxdatavalid_out:         out std_logic;
     align_checks_out:           out std_logic_vector(7 downto 0);
     status_out:                out std_logic_vector(5 downto 0)
  );
  end component;

  component rxdata_simple_cdc_buf is
  generic(
    SIMULATION: integer := 0;     -- Set to 1 for simulation
    FIFO_DEPTH: integer := 128;  -- Must be <= 128
    X_LOC: integer;
    Y_LOC: integer);
  port (
      -- All the following in link clk domain
     link_rst_in: in std_logic;
     link_clk_in: in std_logic;
     rxdata_in: in std_logic_vector(31 downto 0);
     rxcharisk_in: in std_logic_vector(3 downto 0);
     -- Want to keep it all in the local clk domain
     local_rst_in: in  std_logic;
     local_clk_in: in  std_logic;
     buf_master_in: in  std_logic;
     buf_rst_in: in  std_logic;
     buf_ptr_inc_in: in  std_logic;
     buf_ptr_dec_in: in  std_logic;
     rxdata_out:  out std_logic_vector(31 downto 0);
     rxdatavalid_out: out std_logic);
  end component;

  component rxdata_simple_cdc_ctrl is
		generic(
			NQUAD: integer := 1;
			FIFO_DEPTH: integer := 128;
			LOCAL_LHC_CLK_MULTIPLE: integer;
			LOCAL_LHC_BUNCH_COUNT: integer);  
		port (
			local_rst_in: in  std_logic;
			local_clk_in: in  std_logic;
			align_enable_in: in  std_logic;  -- Start alignment regardless of whether links are already aligned.
			align_marker_in: in  std_logic_vector(NQUAD*4-1 downto 0); -- Align signal from all links
			align_master_in: in  std_logic; -- Master link to which all others are aligned to.
			align_margin_in: in  std_logic_vector(3 downto 0);  -- How far to back off after rd/wt ptr clash
			align_disable_in: in  std_logic_vector(NQUAD*4-1 downto 0); -- Disable channels from alignment process
			buf_rst_out: out  std_logic; -- Resets buffer pointers so that rd/wt pointers to starting positions.
			buf_ptr_inc_out: out  std_logic_vector(NQUAD*4-1 downto 0); -- Places rd ptr closer to wt pointer.
			buf_ptr_dec_out: out  std_logic_vector(NQUAD*4-1 downto 0); -- Places rd ptr further away from the wt pointer.
			status_out : out std_logic_vector(5 downto 0));
  end component;
    

end package;

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity kcode_insert_commas is
  port(
    data_in                         : in   std_logic_vector(31 downto 0);
    data_valid_in                   : in   std_logic;
    data_out                        : out  std_logic_vector(31 downto 0);
    charisk_out                     : out  std_logic_vector(3 downto 0));
end kcode_insert_commas;

architecture behave of kcode_insert_commas is
begin

  -- for xilinx virtex 5
  -- txcharisk[1] corresponds to txdata[15:8]
  -- txcharisk[0] corresponds to txdata[7:0]

  data_out <= x"f7f7f7bc" when data_valid_in /= '1' else data_in;
  charisk_out <= "0000" when data_valid_in = '1' else "1111";

end behave;

---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity kcode_insert_commas_and_pad is
   port(
      data_in                         : in   std_logic_vector(31 downto 0);
      comma_in                        : in   std_logic;
      pad_in                          : in   std_logic;
      data_out                        : out  std_logic_vector(31 downto 0);
      charisk_out                     : out  std_logic_vector(3 downto 0));
end kcode_insert_commas_and_pad;

architecture behave of kcode_insert_commas_and_pad is
begin

   -- For Xilinx Virtex 7
   -- TXCHARISK[3] corresponds to TXDATA[31:24]
   -- TXCHARISK[2] corresponds to TXDATA[23:16]
   -- TXCHARISK[1] corresponds to TXDATA[15:8]
   -- TXCHARISK[0] corresponds to TXDATA[7:0]

   process(comma_in, pad_in, data_in)
      variable txkcontrol: std_logic_vector(1 downto 0);
   begin
      txkcontrol := comma_in & pad_in;
      case txkcontrol is
      when "00" =>
         data_out <= data_in;
         charisk_out <= "0000";
      when "10" =>
         -- For test in 904
         --data_out <= x"000400BC";       
         data_out <= x"505050BC"; 
         charisk_out <= "0001";
      when "01" =>
         data_out <= x"F7F7F7F7";
         charisk_out <= "1111";
      when others =>
         data_out <= x"F7F7F7F7";
         charisk_out <= "1111";
      end case;
   end process;

end behave;

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.ucrc_pkg.all;

entity links_crc_rx is
port (
  reset:                  in std_logic;
  clk:                    in std_logic;
  data_in:                in std_logic_vector(31 downto 0);
  data_valid_in:          in std_logic;
  data_out:               out std_logic_vector(31 downto 0);
  data_valid_out:         out std_logic;
  data_start_out:         out std_logic;
  reset_counters_in:      in std_logic;
  crc_checked_cnt_out:    out std_logic_vector(7 downto 0);
  crc_error_cnt_out:      out std_logic_vector(7 downto 0);
  status_out:             out std_logic_vector(3 downto 0));
end links_crc_rx;

architecture behave of links_crc_rx is

  signal data_start : std_logic;
  signal data_valid_shreg : std_logic_vector(2 downto 0);
  
  -- Assign default to zero to avoid unknown signals at startup in sim
  -- (i.e. looks like an error)
  signal crc_word : std_logic_vector(31 downto 0) := (others => '0');
  signal crc_valid, crc_error, crc_rst : std_logic;
  signal crc_error_cnt, crc_checked_cnt: unsigned(7 downto 0);   

begin

  data_valid_shreg(0) <= data_valid_in;
  
  process(clk)
  begin
    if rising_edge(clk) then
      data_valid_shreg(2 downto 1) <= data_valid_shreg(1 downto 0) ;
    end if;
  end process;

  crc_rst <= '1' when data_valid_shreg(1 downto 0) = "00" else '0';
  data_start <= '1' when data_valid_shreg = "001" else '0';
  crc_valid <= '1' when data_valid_shreg = "101" else '0';

  ucrc_par_inst: ucrc_par
  generic map (
    POLYNOMIAL => "00000100110000010001110110110111",
    INIT_VALUE => "11111111111111111111111111111111",
    DATA_WIDTH => 32,
    SYNC_RESET => 1)
  port map(
    clk_i => clk,
    rst_i => crc_rst,
    clken_i => data_valid_in,
    data_i => data_in,
    match_o => open,
    crc_o => crc_word);

-- DMN: Altered to help with timing issues
--  data_out <= data_in when crc_valid = '0' else x"00000000";
  data_out <= data_in;
  data_valid_out <= data_valid_in when crc_valid = '0' else '0';
  data_start_out <= data_start;

  -- need to delay data and crc_valid signal until crc bolck has computed crc.

  process(reset, clk)
  begin
    if rising_edge(clk) then
    	if reset = '1' or crc_valid = '0' then
    		crc_error <= '0';
      elsif crc_valid = '1' then
        -- check crc 
        if crc_word /= data_in then
          crc_error <= '1';
        else
          crc_error <= '0';
        end if;
      end if;
    end if;
  end process;


  status_counters: process(reset, clk)
  begin
    if rising_edge(clk) then
      if reset = '1' or reset_counters_in = '1' then
        crc_error_cnt <= (others => '0');
        crc_checked_cnt <= (others => '0');
      else
        if crc_error = '1' and crc_error_cnt /= X"ff" then
          crc_error_cnt <= crc_error_cnt + 1;
        end if;
        if crc_valid = '1' and crc_checked_cnt /= X"ff" then
          crc_checked_cnt <= crc_checked_cnt + 1;
        end if;
      end if;
    end if;
  end process;
  
  crc_error_cnt_out <= std_logic_vector(crc_error_cnt);
  crc_checked_cnt_out <= std_logic_vector(crc_checked_cnt);
  status_out <= (others => '0');

end behave;


----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.ucrc_pkg.all;


entity links_crc_tx is
port (
  reset:                  in std_logic := '1';  
  clk:                    in std_logic := '0';
  data_in:                in std_logic_vector(31 downto 0) := (others => '0');
  data_valid_in:          in std_logic := '0';
  data_out:               out std_logic_vector(31 downto 0);
  data_valid_out:         out std_logic);
end links_crc_tx;

architecture behave of links_crc_tx is

  signal data_valid_shreg : std_logic_vector(2 downto 0);
  
  signal crc_word : std_logic_vector(31 downto 0);
  signal crc_valid, crc_rst : std_logic;

begin

  data_valid_shreg(0) <= data_valid_in;
  
  process(clk)
  begin
    if rising_edge(clk) then
      data_valid_shreg(2 downto 1)  <= data_valid_shreg(1 downto 0) ;
    end if;
  end process;

  crc_rst <= '1' when data_valid_shreg(1 downto 0) = "00" else '0';
  crc_valid <= '1' when data_valid_shreg = "100" else '0';

  ucrc_par_inst: ucrc_par
  generic map (
    POLYNOMIAL => "00000100110000010001110110110111",
    INIT_VALUE => "11111111111111111111111111111111",
    DATA_WIDTH => 32,
    SYNC_RESET => 1)
  port map(
    clk_i => clk,
    rst_i => crc_rst,
    clken_i => data_valid_in,
    data_i => data_in,
    match_o => open,
    crc_o => crc_word);

  data_out <= crc_word when crc_valid = '1' else data_in;
  data_valid_out <=  data_valid_in or crc_valid;
   
end behave;


----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------
-- Introduction:

-- The entity "cdc_txdata_circular_buf" takes data from the 80Mhz domain 
-- and moves it into the 100mhz domain as quickly as possible (25ns).  
-- It operates by sequentially placing the data into 4 differnt registers.  
-- These registers are then read into the 100mhz domain if their asociated 
-- data valid signal = '1'.  Hence it is called the "dv_method" or data_valid 
-- method.

-- The following is important if you want to verify timing, however the data 
-- path from 80mhz to 100mhz domain must not take longer than 15ns and it 
-- typically takes 5-6ns.  Hence you would be very unluckly to run into a timing 
-- error even without the following constrains.  You can always do a back anotated 
-- timing sim as a check.

--------------------------------------------------------------------------------------
-- Constraints (UCF file):

-- To verify the timing you should make two groups in the UCF file (output
-- flipflops at 80Mhz and input flipflops at 100Mhz).  This might be easiest 
-- to do with constraits editor.  Then make a timing constraint between them.
-- Note that "sync_dv_method_1a" is just the instance name of this entity in 
-- my test design.  This name/names will vary depending on where your instance 
-- is named/located.

-- # Output data reg at 80MHz.
-- INST "sync_dv_method_1a/buf0_0" TNM = "sync_dv_method_output_80mhz_ff";
-- # Do this for all 17bits of all 4 registers (buf0, buf1, buf2, buf3).

-- # Input data reg at 100MHz.
-- INST "sync_dv_method_1a/data_out_0" TNM = "sync_dv_method_input_100mhz_ff";
-- # Do this for all 17bits of data_out register.

-- # Data must be latched into 100mhz domain after a maximum of 15ns.  
-- # Data from 80mhz domain must be stable at this point.
-- TIMESPEC "TS_" = FROM "sync_dv_method_output_80mhz_ff" TO "sync_dv_method_input_100mhz_ff" 10 ns;

-- You might also want to do the following so that when the design is back 
-- annotated you don't get 'X' propogation in the simulation.
-- # Mark as async reg to stop 'X' propogation in back annotation.
-- INST "sync_dv_method_1a/dv_array_clk0_3" ASYNC_REG;

-- I aggree that all this UCF file nonsense is not nice, but I don't think I can enter 
-- these constraints in the vhdl (at least not easily).  Greg



library ieee;
use ieee.std_logic_1164.all;

entity cdc_txdata_circular_buf is
  generic(
    data_length       : natural :=32);
  port( 
    upstream_clk      : in     std_logic;
    upstream_rst      : in     std_logic;
    downstream_clk    : in     std_logic;
    downstream_rst    : in     std_logic;
    data_in           : in     std_logic_vector(data_length-1 downto 0);
    data_out          : out    std_logic_vector(data_length-1 downto 0);
    pad_out           : out    std_logic);
end cdc_txdata_circular_buf ;

architecture behave of cdc_txdata_circular_buf is

   signal buf0, buf1, buf2, buf3: std_logic_vector(data_length-1 downto 0) := (others => '0');  
   signal w_add, r_add: std_logic_vector(1 downto 0) := "00";
   signal dv_array, dv_array_clk0, dv_array_clk1: std_logic_vector(3 downto 0) := "0000";

begin

   write_proc : process(upstream_clk, upstream_rst)
   begin
      if rising_edge(upstream_clk) then
         -- Increment write address in grey code.
         -- Allows add to be safely moved from the 
         -- 80MHz to the 100mhz domain if needed.
         case w_add is
         when "00" =>
            buf0 <= data_in;
            dv_array <= "1001";
            w_add <= "01";
         when "01" =>
            buf1 <= data_in;
            dv_array <= "0011";
            w_add <= "11";
         when "11" =>
            buf2 <= data_in;
            dv_array <= "0110";
            w_add <= "10";
         when "10" =>
            buf3 <= data_in;
            dv_array <= "1100";
            w_add <= "00";
         when others =>
            report "Invald address" severity failure;
         end case;
      end if;
   end process write_proc;

   -- Originally clked dv_array (80MHz domain) first on the rising 
   -- edge and then on falling edge of downstream_clk.  OK if "data_out" regs 
   -- were not in IOBs.  Otherwise 5ns constraint on "dv_array_clk1" 
   -- to "data_out" regs too tight (only just).

   -- Swapped back to original design.  Allows 100mhz signals to be 
   -- sampled and routed inside FPGA.  Useful for timing studies.
   
   -- First: clk data valid on 100Mhz rising edge.
   dv_array_clk0_proc : process(downstream_clk, downstream_rst)
   begin
      if falling_edge(downstream_clk) then
         dv_array_clk0 <= dv_array;
      end if;
   end process dv_array_clk0_proc;

   -- Second: clk data valid on 100Mhz falling edge.
   dv_array_clk1_proc : process(downstream_clk, downstream_rst)
   begin
      if rising_edge(downstream_clk) then
         dv_array_clk1 <= dv_array_clk0;
      end if;
   end process dv_array_clk1_proc;
 
--   dv_array_clk1 <= dv_array;

   read_proc : process(downstream_clk, downstream_rst)
   begin
   	if rising_edge(downstream_clk) then
         -- Watch out.. Using grey code for addressing.
         case r_add is
         when "00" =>
            if dv_array_clk1(0) = '1' then
               data_out <= buf0;
               pad_out <= '0';
               r_add <= "01";
            else
               pad_out <= '1';
            end if;
         when "01" =>
            if dv_array_clk1(1) = '1' then
               data_out <= buf1;
               pad_out <= '0';
               r_add <= "11";
            else
               pad_out <= '1';
            end if;
         when "11" =>
            if dv_array_clk1(2) = '1' then
               data_out <= buf2;
               pad_out <= '0';
               r_add <= "10";
            else
               pad_out <= '1';
            end if;
         when "10" =>
            if dv_array_clk1(3) = '1' then
               data_out <= buf3;
               pad_out <= '0';
               r_add <= "00";
            else
               pad_out <= '1';
            end if;
         when others =>
            --report "Invald address" severity failure;
         end case;
      end if;
   end process read_proc;

end behave;


---------------------------------------------------------------------------------------------------
-- Moves data between link clock and ttc clock.  Link clk running faster than ttc clock 
-- so dummy words inserted into data stream.  This are removed before the data is written 
-- to a dual port RAM.  Hence data the rate in and out of the fifo is the same.  Code
-- automattically ensures byte order (byte to word reassbly) and bc0 discrepancy (difference
-- between ttc bc0 and trig path bc0) are set correctly.
---------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

library unisim;
use unisim.vcomponents.all;

library work;

entity rxdata_clock_domain_change_and_align is
generic
(
   LOCAL_LHC_CLK_MULTIPLE: integer := 4;
   LOCAL_LHC_BUNCH_COUNT:     integer;
   FIFO_DEPTH:                integer := 128  -- Must be <= 128   
);
port 
(
   local_rst_in:              in  std_logic;
   local_clk_in:              in  std_logic;  
   link_rst_in:               in std_logic;
   link_clk_in:               in std_logic;
   align_once_in:             in  std_logic;
   align_auto_in:             in  std_logic;   
   rxdata_in:                 in std_logic_vector(31 downto 0);
   rxcharisk_in:          in std_logic_vector(3 downto 0);
   rxcommadet_in:          in std_logic;
   rxbyteisaligned_in:        in  std_logic;
   rxpcommaalignen_out:       out std_logic;
   rxmcommaalignen_out:       out std_logic; 
   orbit_location_in:         in  std_logic_vector(15 downto 0);
   orbit_location_req_in:     in  std_logic_vector(15 downto 0);
   orbit_location_max_out:    out std_logic_vector(15 downto 0);
   orbit_location_min_out:    out std_logic_vector(15 downto 0);
   rxdata_out:               out std_logic_vector(31 downto 0);
   rxdatavalid_out:         out std_logic;
   align_checks_out:           out std_logic_vector(7 downto 0);
   status_out:                out std_logic_vector(5 downto 0)
);
end rxdata_clock_domain_change_and_align;

architecture behave of rxdata_clock_domain_change_and_align is
   

  component virtex7_rx_buf is
  port (
    clka : in std_logic;
    wea : in std_logic_vector(0 downto 0);
    addra : in std_logic_vector(8 downto 0);
    dina : in std_logic_vector(35 downto 0);
    clkb : in std_logic;
    addrb : in std_logic_vector(8 downto 0);
    doutb : out std_logic_vector(35 downto 0));
  end component;


  signal fifoin_add, fifoout_add:  integer range 0 to 127;
  signal fifoin_add_word, fifoout_add_word:  std_logic_vector(8 downto 0);
  signal fifoin_wen:  std_logic_vector(0 downto 0);
  signal fifoin_data, fifoout_data:  std_logic_vector(35 downto 0);   

  signal align_operating: std_logic;
  signal align_ok: std_logic;

  signal fifoout_steps, fifoout_steps_req: integer range 0 to 127;
  signal align_checks: unsigned(7 downto 0);

  signal align_once: std_logic;
  signal align_once_previous: std_logic;

  signal error_no_valid_fifoout_location, error_byte_align: std_logic;
  signal error_tag_not_at_orbit_location, error_tag_at_wrong_orbit_location: std_logic;
   
  signal increase_delay: std_logic;

  signal padding_word: std_logic;

  -- Allocate 2**12 bits for bunch crossing
  -- Allocate additional 2**3 bits for 40MHz/240MHz clock   
  subtype type_orbit_location is integer range 0 to 2**16-1;
     
  signal orbit_location, orbit_location_req, orbit_location_found: type_orbit_location;
  signal orbit_location_min, orbit_location_max: type_orbit_location;
  signal orbit_location_tag, orbit_location_tag_found: std_logic;

  constant RXBYTEISALIGNED_TIMEOUT : integer := 2**20-1;  
  signal delay_cnt : integer range 0 to 2**20-1;

  constant RXBYTEISALIGNED_CHECK : integer := 1023;  
  signal rxbyteisaligned_cnt : integer range 0 to 2**10-1;


  type type_align_state is (
    idle, 
    align_start,
    align_comma,
    align_check, 
    fifoout_increment, 
    fifoout_increment_wait,
    align_end,
    align_procedure);
    
  signal align_state: type_align_state;

  signal orbit_location_lock: std_logic;

begin

  -----------------------------------------------------------------------------
  -- Stage 1: Write data into dual port RAM
  -----------------------------------------------------------------------------

  -- Valid data when not a padding word
  padding_word <= '1' when rxcharisk_in = "1111" else '0';

  fifoin_sm: process(link_clk_in) 
  begin
    if rising_edge(link_clk_in) then
      if link_rst_in = '1' then
      	fifoin_add <= 6;
      elsif padding_word = '1' then  
        -- Padding word.  Do not place in FIFO.
        fifoin_add <= fifoin_add;
      else
        if fifoin_add < FIFO_DEPTH-1 then
          fifoin_add <= fifoin_add + 1;
        else
          fifoin_add <= 0;
        end if;
      end if;
    end if;
  end process fifoin_sm;

  -----------------------------------------------------------------------------
  -- Stage 2: Dual port RAM
  -----------------------------------------------------------------------------

  fifoin_add_word <= "00" & std_logic_vector(to_unsigned(fifoin_add,7));
  fifoin_wen <= "1" when padding_word = '0' else "0";
  fifoin_data <=  rxcommadet_in & "000" & rxdata_in;

  fifoout_add_word <= "00" & std_logic_vector(to_unsigned(fifoout_add,7));

  -- Xilinx tools seem to struggle to find .xco cores with following:
  --   rx_buf: entity work.virtex7_rx_buf
  -- Error message = "Cannot find <virtex7_rx_buf> in library <work>" 
  -- Add component declaration.  
  rx_buf: virtex7_rx_buf
  port map (
    clka => link_clk_in,
    wea => fifoin_wen,
    addra => fifoin_add_word,
    dina => fifoin_data,
    clkb => local_clk_in,
    addrb => fifoout_add_word,
    doutb => fifoout_data);

  -----------------------------------------------------------------------------
  -- Stage 3: Read data out of dual port RAM
  -----------------------------------------------------------------------------

  -- Control read pointer.  Move read ptr by skipping address increment
  fifoout_sm: process (local_clk_in) begin
  	if rising_edge(local_clk_in) then
  		if local_rst_in = '1' then
  			fifoout_add <= 0;
  		elsif increase_delay = '1' then
  			fifoout_add <= fifoout_add;
  		else
  			if fifoout_add < FIFO_DEPTH-1 then
  				fifoout_add <= fifoout_add + 1;
  			else
  				fifoout_add <= 0;
  			end if;
  		end if;
  	end if;
  end process fifoout_sm;
  
  -----------------------------------------------------------------------------
  -- Stage 4: Align links
  -----------------------------------------------------------------------------
  
  orbit_location <= to_integer(unsigned(orbit_location_in));
  orbit_location_req <= to_integer(unsigned(orbit_location_req_in));

  -- Look for the beginning of the orbit signal
  orbit_tag_proc: process (local_clk_in) 
    variable comma_shreg: std_logic_vector(2 downto 0); 
  begin
    if rising_edge(local_clk_in) then
      comma_shreg := comma_shreg(1 downto 0) & fifoout_data(35);
      -- Start of orbit defined as beginning of packet.
      if comma_shreg = "110" then
        orbit_location_tag <= '1';
      else
        orbit_location_tag <= '0';
      end if;
    end if;
  end process;

  input_alignment_sm: process (local_clk_in)
  begin
  	if rising_edge(local_clk_in) then
  		if local_rst_in = '1' then
  			align_state <= idle;
  			fifoout_steps <= 15;  -- Deliberately set to 15 to check fsm has reached "align_start"
  			align_checks <= (others =>'0');
  			increase_delay <= '0';
  			error_no_valid_fifoout_location <= '0';
  			error_byte_align <= '0';
  			error_tag_not_at_orbit_location <= '0';
  			error_tag_at_wrong_orbit_location <= '0';
  			orbit_location_min <= type_orbit_location'high; 
  			orbit_location_max <= type_orbit_location'low;
  			orbit_location_tag_found <= '0'; 
  			orbit_location_lock <= '0';
  			rxpcommaalignen_out <= '1';
  			rxmcommaalignen_out <= '1';
  		else case align_state is

  			when idle =>
  				if (align_once = '1') or (align_auto_in = '1') then
-- The signal "align_fifoout_steps" just used to track state machine.
-- It does not affect address of read/write pointers.
						align_state <= align_start;
						align_checks <= (others =>'0');
					end if;
					increase_delay <= '0';

				when align_start =>
					align_state <= align_comma;
					rxpcommaalignen_out <= '1';
					rxmcommaalignen_out <= '1';
					orbit_location_min <= type_orbit_location'high; 
					orbit_location_max <= type_orbit_location'low; 
					delay_cnt <= RXBYTEISALIGNED_TIMEOUT;
					rxbyteisaligned_cnt <= RXBYTEISALIGNED_CHECK;
					error_byte_align <= '0';
					error_no_valid_fifoout_location <= '0';
					error_tag_not_at_orbit_location <= '0';
					error_tag_at_wrong_orbit_location <= '0';
					fifoout_steps <= 0;  

				when align_comma => 
-- Don't trust rxbyteisaligned_in.  In simulation it is sometimes asserted, deasserted then re-asserted.
-- Byte alignment may take place, but perhaps not word alignment.  Make sure that 
					if delay_cnt /= 0 then
-- Wait for alignment ot timeout
						delay_cnt <= delay_cnt - 1;
						if rxbyteisaligned_in = '1' then
-- Wait to make sure signal stays asserted
							if rxbyteisaligned_cnt /= 0 then
								rxbyteisaligned_cnt <= rxbyteisaligned_cnt - 1;
							else
-- All OK (probably).  Proceed 
								align_state <= align_procedure;
-- Set search period (i.e. wait an entire orbit for start signal). 
								delay_cnt <= LOCAL_LHC_CLK_MULTIPLE * local_lhc_bunch_count;
								rxpcommaalignen_out <= '0';
								rxmcommaalignen_out <= '0';
							end if;
						else
-- No byte alignment.  Reset checking counter.
							rxbyteisaligned_cnt <= RXBYTEISALIGNED_CHECK;
						end if; 
					else
-- Record that links failed to align to commas.
						align_state <= idle;
						error_byte_align <= '1';
					end if;

				when fifoout_increment =>
-- Always increment fifo read pointer in this state.  This ensures that 
-- after we have looped over all fifo locations the read pointer is back 
-- at the beginning.          
					increase_delay <= '1';
-- Check all fifo locations.  Makes time to sync link approx constant.
-- Finds valid values for orbit_location_min & orbit_location_max 
					if fifoout_steps < FIFO_DEPTH-1 then
						fifoout_steps <= fifoout_steps + 1;
						align_state <= fifoout_increment_wait;
						delay_cnt <= 8;
					else
						fifoout_steps <= 0;
-- Have we found a valid fifo location?
						if orbit_location_lock = '1' then 
							align_state <= align_end;
-- Set the number of number of steps that the fifo read pointer needs 
-- to be incremented by to lock onto the correct orbit location.
							delay_cnt <= fifoout_steps_req;
						else
							align_state <= idle;
							error_no_valid_fifoout_location <= '1';
						end if;
					end if;

				when fifoout_increment_wait =>
-- May now be redundant.
					increase_delay  <= '0';
					if delay_cnt /= 0 then
						delay_cnt <= delay_cnt - 1;
					else
						align_state <= align_procedure;
-- Set search period (i.e. wait an entire orbit for start signal). 
						delay_cnt <= LOCAL_LHC_CLK_MULTIPLE * local_lhc_bunch_count;
					end if;

				when align_procedure =>
					if delay_cnt /= 0 then
-- Wait for entire orbit to detect orbit tag.
						delay_cnt <= delay_cnt - 1;
						if orbit_location_tag = '1' then
-- Found orbit tag.  Is there just 1 per orbit?
							if orbit_location_tag_found = '0' then
								orbit_location_tag_found <= '1';
								orbit_location_found <= orbit_location;
							else
-- Found a 2nd orbit tag in the orbit.
-- Data must be corrupt.  Go to next fifo location.
								orbit_location_tag_found <= '0';
								align_state <= fifoout_increment;
							end if;
						end if;
					else
-- End of orbit search.  Now analyse data.
-- Record maximum possible orbit location value
						if orbit_location_found > orbit_location_max then
							orbit_location_max <= orbit_location_found;
						end if;
-- Record minimum possible orbit location value
						if orbit_location_found < orbit_location_min then
							orbit_location_min <= orbit_location_found;
						end if;
-- If orbit location matched that required record location.
						if orbit_location_found = orbit_location_req then
							orbit_location_lock <= '1';
							fifoout_steps_req <= fifoout_steps;
						end if;
-- Now measure next FIFO location
						orbit_location_tag_found <= '0';
						align_state <= fifoout_increment;
					end if;  

				when align_end =>
-- Move to fifo location.  Fifo location should be at 0
					if delay_cnt /= 0 then
-- Move to correct fifo location for lock
						delay_cnt <= delay_cnt - 1;
						increase_delay <= '1';
					else
						increase_delay <= '0';
						align_state <= align_check;
						delay_cnt <= 8;
					end if;

				when align_check =>
-- Need to allow fifo add change to ripple through
					if delay_cnt /= 0 then
						delay_cnt <= delay_cnt - 1;
					else
-- Ought to test both scenarios - i.e. 
-- (a) tag is missing
--     1st "if" statement
-- (b) tag is present, but at the wrong orbit location
--     2nd if statement
-- Is tag present at required orbit location?
						if orbit_location_req = orbit_location then
							if orbit_location_tag = '1' then
								if align_checks /= X"ff" then
									align_checks <= align_checks + 1;
								end if;
							else
-- Error tag not present at expected orbit location
								align_state <= idle;
								align_checks <= (others => '0');
								error_tag_not_at_orbit_location <= '1';
							end if;
						else
-- Is tag NOT present at these orbit locations
							if orbit_location_tag = '1' then
-- Error - tag shouldn't be here.
								align_state <= idle;
								align_checks <= (others => '0');
								error_tag_at_wrong_orbit_location <= '1';
							end if;
						end if;
					end if;

				when others =>
					align_state <= idle;

				end case;
			end if;
		end if;
	end process;

-----------------------------------------------------------------------------
-- Stage 6: Outputs
-----------------------------------------------------------------------------

rxdata_out <= fifoout_data(31 downto 0);
rxdatavalid_out <= not fifoout_data(35);

orbit_location_max_out <= std_logic_vector(to_unsigned(orbit_location_max, 16));
orbit_location_min_out <= std_logic_vector(to_unsigned(orbit_location_min, 16));

align_checks_out <= std_logic_vector(align_checks);

make_status: process (local_clk_in)
begin
   if rising_edge(local_clk_in) then
      if local_rst_in = '1' then
      	align_operating <= '0';
      	align_ok <= '0';
      else
      	if align_state = idle then
         align_operating <= '0';
        else 
         align_operating <= '1';
        end if;
        if align_state = align_check then
         align_ok <= '1';
        else 
         align_ok <= '0';
        end if;
      end if;
   end if;
end process;


status_out <=         
   error_tag_not_at_orbit_location &
   error_tag_at_wrong_orbit_location &
   error_byte_align & 
   error_no_valid_fifoout_location &
   align_operating &
   align_ok;
   
  -- Assume the read/write regs are not able to make a pulsed signal
  -- Hence need to write '0' followed by '1' to make pulse.
  align_once_pulse: process (local_clk_in) 
  begin
     if rising_edge(local_clk_in) then
       if local_rst_in = '1' then
        align_once_previous <= '0';
        align_once <= '0';
       else
        align_once_previous <= align_once_in;
        if (align_once_previous = '0') and (align_once_in = '1') then
           align_once <= '1';
        else
           align_once <= '0';
        end if;
       end if;
     end if;
  end process;

end behave;


----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

Library UNIMACRO;
use UNIMACRO.vcomponents.all;

entity cdc_txdata_fifo is
  generic(
    data_length       : natural :=32);
  port( 
    upstream_clk      : in     std_logic;
    upstream_rst      : in     std_logic;
    downstream_clk    : in     std_logic;
    downstream_rst    : in     std_logic;
    data_in           : in     std_logic_vector(data_length-1 downto 0);
    data_out          : out    std_logic_vector(data_length-1 downto 0);
    pad_out           : out    std_logic);
end cdc_txdata_fifo ;

architecture behave of cdc_txdata_fifo is
  
  -- Modelsim unhappy with "open".  Use signals instaed.
  signal RDCOUNT, WRCOUNT: std_logic_vector(8 downto 0);
  
  signal ALMOSTEMPTY, ALMOSTFULL: std_logic;
  signal FULL, RDERR, WRERR, RDEN, WREN: std_logic;

  signal rd_data, wr_data: std_logic_vector(35 downto 0);
  signal delay: natural range 0 to 7 := 7;

begin

  -- Error: DRC Error : Reset is unsuccessful.  RST must be held high for at least five RDCLK clock cycles, and RDEN 
  -- must be low before RST becomes active high, and RDEN remains low during this reset cycle.--

  -- This req "RDEN must be low before RST becomes active high" only poss with ext ref clk 
  
  -- Error: DRC Error : Reset is unsuccessful.  RST must be held high for at least five WRCLK clock cycles, and WREN 
  -- must be low before RST becomes active high, and WREN remains low during this reset cycle.

   wr_data(data_length-1 downto 0) <= data_in;
   wr_data(35 downto data_length) <= (others => '0');

   FIFO_DUALCLOCK_MACRO_inst : FIFO_DUALCLOCK_MACRO
   generic map (
      DEVICE => "7SERIES",            -- Target Device: "VIRTEX5", "VIRTEX6", "7SERIES" 
      ALMOST_FULL_OFFSET => X"0080",  -- Sets almost full threshold
      ALMOST_EMPTY_OFFSET => X"0080", -- Sets the almost empty threshold
      DATA_WIDTH => 36,   -- Valid values are 1-72 (37-72 only valid when FIFO_SIZE="36Kb")
      FIFO_SIZE => "18Kb",            -- Target BRAM, "18Kb" or "36Kb" 
      FIRST_WORD_FALL_THROUGH => FALSE) -- Sets the FIFO FWFT to TRUE or FALSE
   port map (
      ALMOSTEMPTY => ALMOSTEMPTY,   -- 1-bit output almost empty
      ALMOSTFULL => ALMOSTFULL,     -- 1-bit output almost full
      DO => rd_data,                     -- Output data, width defined by DATA_WIDTH parameter
      EMPTY => pad_out,               -- 1-bit output empty
      FULL => FULL,                 -- 1-bit output full
      RDCOUNT =>  RDCOUNT,           -- Output read count, width determined by FIFO depth
      RDERR => RDERR,               -- 1-bit output read error
      WRCOUNT => WRCOUNT,           -- Output write count, width determined by FIFO depth
      WRERR => WRERR,               -- 1-bit output write error
      DI => wr_data,                     -- Input data, width defined by DATA_WIDTH parameter
      RDCLK => downstream_clk,               -- 1-bit input read clock
      RDEN => RDEN,                 -- 1-bit input read enable
      RST => downstream_rst,                   -- 1-bit input reset
      WRCLK => upstream_clk,               -- 1-bit input write clock
      WREN => WREN                  -- 1-bit input write enable
   );
  
  
   -- May not have valid clock before entering reset.
   -- Cannot meet all fifo requirements
   rst_proc:process(downstream_rst, downstream_clk)
   begin
    if rising_edge(downstream_clk) then
      if (downstream_rst = '1') then
      	delay <= 7;
      	RDEN <= '0';
      	WREN <= '0';
      elsif (delay = 0) then
        RDEN <= '1'; 
        WREN <= '1';
      else
        delay <= delay -1;
        RDEN <= '0'; 
        WREN <= '0';        
      end if;
    end if;
  end process;

  data_out <= rd_data(data_length-1 downto 0);
  
end behave;




---------------------------------------------------------------------------------------------------
-- Simple buffer for bridging between link clk and local clock.  
-- Control provided by rxdata_simple_cdc_ctrl at a global level.
---------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.package_utilities.all;

entity rxdata_simple_cdc_buf is
generic(
  SIMULATION: integer := 0;     -- Set to 1 for simulation
  FIFO_DEPTH: integer := 128;  -- Must be <= 128
  X_LOC: integer;
  Y_LOC: integer);
port (
  -- All the following in link clk domain
  link_rst_in: in std_logic;
  link_clk_in: in std_logic;
  rxdata_in: in std_logic_vector(31 downto 0);
  rxcharisk_in: in std_logic_vector(3 downto 0);
  -- Want to keep it all in the local clk domain
  local_rst_in: in  std_logic;
  local_clk_in: in  std_logic;
  buf_master_in: in  std_logic;
  buf_rst_in: in  std_logic;
  buf_ptr_inc_in: in  std_logic;
  buf_ptr_dec_in: in  std_logic;
  rxdata_out:  out std_logic_vector(31 downto 0);
  rxdatavalid_out: out std_logic);
end rxdata_simple_cdc_buf;

architecture behave of rxdata_simple_cdc_buf is
   
  component virtex7_rx_buf is
  port (
    clka : in std_logic;
    wea : in std_logic_vector(0 downto 0);
    addra : in std_logic_vector(8 downto 0);
    dina : in std_logic_vector(35 downto 0);
    clkb : in std_logic;
    addrb : in std_logic_vector(8 downto 0);
    doutb : out std_logic_vector(35 downto 0));
  end component;


  signal wbuf_add, rbuf_add:  integer range 0 to 127;
  signal wbuf_add_word, rbuf_add_word:  std_logic_vector(8 downto 0);
  signal wbuf_wen:  std_logic_vector(0 downto 0);
  signal wbuf_data, rbuf_data, rbuf_data_p:  std_logic_vector(35 downto 0);   
  signal wbuf_rst:  std_logic;
  
  signal padding_word: std_logic;
  signal buf_ptr_cntrl: std_logic_vector(1 downto 0);

begin


  -- Crosses clk domains very cleanly (input pulse width does not matter), but uses 4 regs/latches
  sync_loss_cdc: async_pulse_sync
  port map(
      async_pulse_in => buf_rst_in,
      sync_clk_in => link_clk_in,
      sync_pulse_out => wbuf_rst,
      sync_pulse_sgl_clk_out => open);    

  -----------------------------------------------------------------------------
  -- Stage 1: Write data into dual port RAM - WBUF
  -----------------------------------------------------------------------------

  -- Valid data when not a padding word
  padding_word <= '1' when rxcharisk_in = "1111" else '0';

  wbuf_sm: process (link_clk_in) 
  begin
    if rising_edge(link_clk_in) then
      if (link_rst_in = '1') or (wbuf_rst = '1') then
        if (SIMULATION = 0) then
          -- Place write pointer at the far end of the buffer.
          -- This ensure no overlap with rd ptr at start up.
          wbuf_add <= 110; 
        else
          -- Speed up simulation of alignment by placing wt ptr close to rd ptr. 
          wbuf_add <= 20; 
        end if;
      else
        if padding_word = '1' then  
          -- Padding word.  Do not place in FIFO.
          wbuf_add <= wbuf_add;
        else
          if wbuf_add < FIFO_DEPTH-1 then
            wbuf_add <= wbuf_add + 1;
          else
            wbuf_add <= 0;
          end if;
        end if;
      end if;
    end if;
  end process wbuf_sm;

  -----------------------------------------------------------------------------
  -- Stage 2: Dual port RAM
  -----------------------------------------------------------------------------

  wbuf_add_word <= "00" & std_logic_vector(to_unsigned(wbuf_add,7));
  wbuf_wen <= "1" when padding_word = '0' else "0";
  -- Padding words will not be added to buffer and only remaining kcode is comma.
  wbuf_data <=  (not rxcharisk_in(0)) & "000" & rxdata_in;

  rx_buf: virtex7_rx_buf
  port map (
    clka => link_clk_in,
    wea => wbuf_wen,
    addra => wbuf_add_word,
    dina => wbuf_data,
    clkb => local_clk_in,
    addrb => rbuf_add_word,
    doutb => rbuf_data_p);

	process(local_clk_in)
	begin
			if rising_edge(local_clk_in) then
				rbuf_data <= rbuf_data_p;
			end if;
	end process;
    
    
--  rx_buf: entity work.buf_18kb
--  	generic map(
--  		X_LOC => X_LOC,
--  		Y_LOC => Y_LOC
--  	)
--  	port map(
--  		wclk => link_clk_in,
--  		we => wbuf_wen,
--  		waddr(8 downto 0) => wbuf_add_word,
--  		waddr(13 downto 9) => "00000",
--  		d => wbuf_data,
--  		rclk => local_clk_in,
--  		raddr(8 downto 0) => rbuf_add_word,
--  		raddr(13 downto 9) => "00000",
--  		q => rbuf_data
--  	);

  -----------------------------------------------------------------------------
  -- Stage 3: Read data out of dual port RAM - RBUF
  -----------------------------------------------------------------------------


  buf_ptr_cntrl <= buf_ptr_inc_in & buf_ptr_dec_in;

  rbuf_sm: process (local_clk_in) 
  begin
    if rising_edge(local_clk_in) then
      if (local_rst_in = '1') or (buf_rst_in = '1') then
        if buf_master_in = '1' then
          if (SIMULATION = 0) then
            -- Place master rd ptr much closer to wt pointer than slaves.
            -- This ensures that master chan will detect frams before slaves.
            rbuf_add <= 50; -- wt_ptr @ 110
          else
            -- Speed up simulation of alignment by placing master rd ptr close to slaves and wt ptr.
            -- Note this limits the range of time differences that the link will lock too.
            rbuf_add <= 10; -- wt_ptr @ 20
          end if;        
        else
          rbuf_add <= 0;
        end if;
      else
        case buf_ptr_cntrl is
        when "01" =>
          -- Subtract 1 ptr location
          rbuf_add <= rbuf_add;
        when "10" =>
          -- Add 1 ptr location
          case rbuf_add is
          when FIFO_DEPTH-2 =>
            rbuf_add <= 0;
          when FIFO_DEPTH-1 =>
            rbuf_add <= 1;
          when others => 
            rbuf_add <= rbuf_add + 2;
          end case;
        when others =>
          -- Behave normally.
          case rbuf_add is
          when FIFO_DEPTH-1 =>
            rbuf_add <= 0;
          when others => 
            rbuf_add <= rbuf_add + 1;
          end case;
        end case;
      end if;
    end if;
  end process rbuf_sm;
  
  rbuf_add_word <= "00" & std_logic_vector(to_unsigned(rbuf_add,7));

   rxdata_out <= rbuf_data(31 downto 0);
   rxdatavalid_out <= rbuf_data(35);

end behave;
  
---------------------------------------------------------------------------------------------------
-- Controller for rxdata_simple_cdc_buf.  Aligns links and minimises latency.
-- Note that alignment status of all links has deliberately left outside the 
-- state machine to allow the user to use several clk cycles to determine whether 
-- all teh links are aligned.
---------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;


use work.package_utilities.all;

entity rxdata_simple_cdc_ctrl is
generic(
  NQUAD: integer := 1;
  FIFO_DEPTH: integer := 128;
  LOCAL_LHC_CLK_MULTIPLE: integer;
  LOCAL_LHC_BUNCH_COUNT: integer);  
port (
  local_rst_in: in  std_logic;
  local_clk_in: in  std_logic;
  align_enable_in: in  std_logic;  -- Start alignment regardless of whether links are already aligned.
  align_marker_in: in  std_logic_vector(NQUAD*4-1 downto 0); -- Align signal from all links
  align_master_in: in  std_logic; -- Master link to which all others are aligned to.
	align_margin_in: in  std_logic_vector(3 downto 0);  -- How far to back off after rd/wt ptr clash
	align_disable_in: in  std_logic_vector(NQUAD*4-1 downto 0); -- Disable channels from alignment process
  buf_rst_out: out  std_logic; -- Resets buffer pointers so that rd/wt pointers to starting positions.
  buf_ptr_inc_out: out  std_logic_vector(NQUAD*4-1 downto 0); -- Places rd ptr closer to wt pointer.
  buf_ptr_dec_out: out  std_logic_vector(NQUAD*4-1 downto 0); -- Places rd ptr further away from the wt pointer.
	status_out : out std_logic_vector(5 downto 0));
end rxdata_simple_cdc_ctrl;

architecture behave of rxdata_simple_cdc_ctrl is
   
  signal delay: natural range 0 to 2*FIFO_DEPTH-1;
	
	--constant recover_time 4 * LOCAL_LHC_CLK_MULTIPLE * LOCAL_LHC_BUNCH_COUNT
  signal buf_steps: natural range 0 to 255;

  signal timeout: natural;
  
  type type_align_state is (
    IDLE, 
    WAIT_AFTER_BUF_RST,
    RESET_MASTER_MONITOR,
    ALIGN_LINKS,
    MINIMISE_LATENCY,
    CREATE_PTR_MARGIN, 
    END_OF_ALIGNMENT, 
		CHECK_ALIGNMENT,
    ALIGN_ERROR);
    
  signal align_state: type_align_state;
  
  type type_master_monitor_state is (
    WAIT_FOR_FIRST_ALIGN,
    WAIT_FOR_SECOND_ALIGN,
    CHECK,
    ERROR);
    
  signal master_monitor_state: type_master_monitor_state;
  signal master_monitor_rst: std_logic;
  signal master_monitor_ok: std_logic;

  signal master_buf_ptr_inc, master_buf_ptr_dec: std_logic;
  signal master_buf_ptr_cntrl: std_logic_vector(1 downto 0);

  signal period_measured, period_check: integer;
  
  signal align_master_check: std_logic;

  signal error_master_missing: std_logic;
  signal error_master_period_unstable: std_logic;
  signal error_misalignment: std_logic;

  signal align_marker_and_mask, align_marker_or_mask: std_logic_vector(NQUAD*4-1 downto 0);
  signal align_marker_all_and_reduce, align_marker_all_or_reduce: std_logic;
  signal align_marker_quad_and_reduce, align_marker_quad_or_reduce: std_logic_vector(NQUAD-1 downto 0);
  signal align_master_d0, align_master_d1: std_logic;

  signal align_marker_d0, align_marker_d1: std_logic_vector(NQUAD*4-1 downto 0); -- Align signal from all links
  signal align_ok, align_operating: std_logic;

  signal buf_ptr_dec_int, buf_ptr_inc_int:  std_logic_vector(NQUAD*4-1 downto 0); 

begin


	-- Mask disabled channels: Force disabled chans to 1 to test for presence of alignment marker.
	align_marker_and_mask <= align_marker_in or align_disable_in;
	-- Mask disabled channels: Force disabled chans to 0 to test for presence of no alignment marker.
	align_marker_or_mask <= align_marker_in and (not align_disable_in);

	
	fan_in1_gen: for i in 0 to NQUAD-1 generate
		fan_in1: process(local_clk_in)
		begin
			if rising_edge(local_clk_in) then
				align_marker_quad_and_reduce(i) <= and_reduce(align_marker_and_mask(4*i+3 downto 4*i));
				align_marker_quad_or_reduce(i) <= or_reduce(align_marker_or_mask(4*i+3 downto 4*i));
			end if;
		end process;
	end generate;
	
	fan_in2: process(local_clk_in)
	begin
		if rising_edge(local_clk_in) then
			align_marker_all_and_reduce <= and_reduce(align_marker_quad_and_reduce);
			align_marker_all_or_reduce <= or_reduce(align_marker_quad_or_reduce);
			align_master_d0 <= align_master_in;
			align_master_d1 <= align_master_d0;
			align_marker_d0 <= align_marker_in;
			align_marker_d1 <= align_marker_d0;
		end if;		
	end process;
	
	fan_out: process(local_clk_in)
	begin
		if rising_edge(local_clk_in) then
			buf_ptr_inc_out <= buf_ptr_inc_int;
			buf_ptr_dec_out <= buf_ptr_dec_int;
		end if;		
	end process;
	
	-- If you clk align_status make sure you also clk align_slaves and align_master
	--align_marker_quad <= and_reduce(align_marker);

  align_links_proc: process(local_clk_in)
  begin
    if rising_edge(local_clk_in) then
      if (local_rst_in = '1') then
        buf_rst_out <= '0';
        buf_ptr_inc_int <= (others => '0');
        buf_ptr_dec_int <= (others => '0');
        master_buf_ptr_inc <= '0';
        master_buf_ptr_dec <= '0';
        master_monitor_rst <= '0';
        align_ok <= '0';
				align_operating <= '0';
				error_misalignment <= '0';
      else 
        case align_state is
        when IDLE =>
          if (align_enable_in = '1') then
            align_state <= WAIT_AFTER_BUF_RST;
						align_operating <= '1';
            buf_rst_out <= '1';
            -- Make sure buffer is full of valid data before we start.
            delay <= FIFO_DEPTH + 10;
						error_misalignment <= '0';
          end if;
        when WAIT_AFTER_BUF_RST =>
          buf_rst_out <= '0';
          if (delay = 0) then
            align_state <= RESET_MASTER_MONITOR;
            master_monitor_rst <= '1';
          else
            delay <= delay - 1;
          end if;
        when RESET_MASTER_MONITOR =>
          master_monitor_rst <= '0';
          if master_monitor_ok = '1' then
            align_state <= ALIGN_LINKS;
            buf_steps <= 0;
          end if;
        when ALIGN_LINKS =>
          -- By default do not change pointers
          buf_ptr_inc_int <= (others => '0');              
          buf_ptr_dec_int <= (others => '0');
          -- If master align signal present then check others....
          if align_master_d1 = '1' then
            -- Check if rest aligned
            if align_marker_all_and_reduce = '1' then
              align_state <= MINIMISE_LATENCY;
              buf_steps <= 0;
            else
							-- This is the bit that actually moves the ptsrs to align the links.
              buf_ptr_inc_int <= not align_marker_d1;
              buf_steps <= buf_steps + 1;
            end if;
          end if;
          if buf_steps = 60 then
            align_state <= ALIGN_ERROR;
          end if;
        when MINIMISE_LATENCY =>
          -- By default do not change pointers
          buf_ptr_inc_int <= (others => '0');              
          buf_ptr_dec_int <= (others => '0');
          master_buf_ptr_inc <= '0';
          master_buf_ptr_dec <= '0';
          -- Keep reducing latency until we lose alignment.
          if align_master_d1 = '1' then
            -- Check to see that: 
            -- (a) All links are still aligned
            -- (b) The alignment signal from the master is where we expect it.
            if (align_marker_all_and_reduce = '0') or (align_master_check = '0') then
              -- Gone too far.. Step back from the brink.
              align_state <= CREATE_PTR_MARGIN;
              -- Set the number of ptr steps to backtrack
              delay <= to_integer(unsigned(align_margin_in));
            else
              -- Increment buffer pointer in all links, including master
              buf_ptr_inc_int <= (others => '1');
              -- Indicate to master monitor that jump has ocuurred so it can track it.
              master_buf_ptr_inc <= '1';
              buf_steps <= buf_steps + 1;
            end if;
          end if;
          if buf_steps = 60 then
            align_state <= ALIGN_ERROR;
          end if;
        when CREATE_PTR_MARGIN =>
          if (delay = 0) then
            align_state <= END_OF_ALIGNMENT;
						-- Create small delay for ptr change to propagate.
						delay <= 20;
            buf_ptr_dec_int <= (others => '0'); 
            master_buf_ptr_dec <= '0';
            -- Master monitoring may be in error because rd ptr may have exceeded wt ptr.  Hence reset.
            master_monitor_rst <= '1';
          else
            buf_ptr_dec_int <= (others => '1');
            master_buf_ptr_dec <= '1';            
            delay <= delay - 1;
          end if;        
        when END_OF_ALIGNMENT =>
					-- Wait until ptr chnages have propaged.
					if (delay = 0) then
						align_state <= CHECK_ALIGNMENT;
						master_monitor_rst <= '0';
					else
             delay <= delay - 1;
          end if;       
				when CHECK_ALIGNMENT =>
					-- Only check for alignment between chans.
					if align_master_d1 = '1' then
						-- Master present.   Check the rest are too...
						if align_marker_all_and_reduce = '1' then
							align_ok <= '1';
						else 
							error_misalignment <= '1';
							align_state <= ALIGN_ERROR;
						end if;
					else
						-- Master not present.   Check the rest are also not present.
						if align_marker_all_or_reduce = '0' then
							align_ok <= '1';
						else 
							error_misalignment <= '1';
							align_state <= ALIGN_ERROR;
						end if;
					end if;
        when ALIGN_ERROR =>
						align_ok <= '0';
						align_operating <= '0';
						align_state <= IDLE;
        end case;
      end if;
    end if;
    
  end process;
  
  
  -- Combine siganls for case statement
  master_buf_ptr_cntrl <= master_buf_ptr_inc & master_buf_ptr_dec;
  
  
  
  master_monitor_proc: process(local_clk_in)
		constant MASTER_TIMEOUT: natural := LOCAL_LHC_BUNCH_COUNT * LOCAL_LHC_CLK_MULTIPLE * 2;
  begin
    if rising_edge(local_clk_in) then
      if (master_monitor_rst = '1') then
        master_monitor_state <= WAIT_FOR_FIRST_ALIGN;
        timeout <= MASTER_TIMEOUT;
				align_master_check <= '0';
        -- Clear status flags
        master_monitor_ok <= '0';
        -- Clear any error flags
        error_master_missing <= '0';
        error_master_period_unstable <= '0';
      else
        case master_monitor_state is
        
        when WAIT_FOR_FIRST_ALIGN =>
          if align_master_d1 = '1' then
            master_monitor_state <= WAIT_FOR_SECOND_ALIGN;
            timeout <= MASTER_TIMEOUT;
            period_measured <= 0;
          elsif timeout = 0 then
            error_master_missing <= '1';
					else 
						timeout <= timeout -1;
          end if;
          
        when WAIT_FOR_SECOND_ALIGN =>
          if align_master_d1 = '1' then
            master_monitor_state <= CHECK;
            period_check <= 0;
          elsif  timeout = 0 then
            error_master_missing <= '1';
          else
            period_measured <= period_measured + 1;
						timeout <= timeout -1;
          end if;
          
        when CHECK =>
        
          -- Artificially generate alignment signal from master so we can compare
          -- against the real master (i.e. align_master_d1).  This allows us to 
          -- detect if the read pointer has overtaken the write pointer. 
          if period_check = period_measured -1 then
            align_master_check <= '1';
          else
            align_master_check <= '0';
          end if;
          
          -- Logic for simulkating master alignment signal, including ptr jumps.
          if align_master_check = '1' then
            period_check <= 0;
          else
            case master_buf_ptr_cntrl is
            when "10" =>
              period_check <= period_check + 2;
            when "01" =>
              period_check <= period_check;
            when others =>
              period_check <= period_check + 1;
            end case;
          end if;
          
          -- Check for both extra and mising align markers
          if (align_master_d1 xor align_master_check) = '1' then
            -- Error
						master_monitor_ok <= '0';
            master_monitor_state <= ERROR;
            error_master_period_unstable <= '1';
          else
            master_monitor_ok <= '1';
          end if;
          
        when ERROR =>
					-- Stays in error until statmachine reset.
          null;
          
        end case;
      end if;
    end if;
    
  end process;

	status_out(0) <= error_misalignment;
	status_out(1) <= error_master_period_unstable;
	status_out(2) <= error_master_missing;
	status_out(3) <= master_monitor_ok;
	status_out(4) <= align_operating;
	status_out(5) <= align_ok;

  
end behave;
  