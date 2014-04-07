
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

PACKAGE package_utilities IS

  COMPONENT blinker IS
    GENERIC( 
        blink_period : natural   := 40000000);
    PORT( 
        clk         : IN     std_logic;
        reset_b     : IN     std_logic;
        blink_out   : OUT    std_logic);
  END COMPONENT;
  
  COMPONENT pulse_lengthen IS
    GENERIC( 
        pulse_length : natural   := 4000000;
        pulse_init   : std_logic := '1');
    PORT( 
        clk         : IN     std_logic;
        reset_b     : IN     std_logic;
        pulse_short : IN     std_logic;
        pulse_long  : OUT    std_logic);
  END COMPONENT;
  
  COMPONENT delay_bit IS
    PORT (
        reset_b		: IN std_logic;
        clk			: IN std_logic;
        delay_in		: IN std_logic_vector(4 DOWNTO 0);
        delay_enable_in   : IN std_logic := 'L';
        bit_in		: IN std_logic;
        bit_out		: OUT std_logic);
  END COMPONENT;
  
  COMPONENT delay_word IS
    GENERIC (
        width: natural RANGE 2 TO 2048 := 32);
    PORT (
        reset_b		: IN std_logic;
        clk			: IN std_logic;
        delay_in		: IN std_logic_vector(4 DOWNTO 0);
        delay_enable_in       : IN std_logic := 'L';
        word_in		       : IN std_logic_vector(width-1 DOWNTO 0);
        word_out		: OUT std_logic_vector(width-1 DOWNTO 0));
  END COMPONENT;

  COMPONENT spy_buffer_32x512 IS
    PORT(
        clk_a:               IN std_logic;
        write_data_a:        IN std_logic_vector(31 DOWNTO 0);
        write_stop_a:        IN std_logic;
        clk_b:               IN std_logic;
        read_add_b:          IN std_logic_vector(8 DOWNTO 0);
        read_data_b:         OUT std_logic_vector(31 DOWNTO 0);
        read_enable_b:       IN std_logic;
        read_ack_b:          OUT std_logic);
  END COMPONENT;

  COMPONENT pattern_ram_36x512_32x1024 IS
    PORT(
      -- PORT A TO connect TO data path
      pat_clk:           IN std_logic;
      pat_stb:           IN std_logic;
      pat_wen:           IN std_logic;
      pat_add:           IN std_logic_vector(8 DOWNTO 0);
      pat_rdata:         OUT std_logic_vector(31 DOWNTO 0);
      pat_rdata_valid:   OUT std_logic;
      pat_wdata:         IN std_logic_vector(31 DOWNTO 0);
      pat_wdata_valid:   IN std_logic;
      -- PORT B TO connect TO communication BUS 
      ram_clk:           IN std_logic;
      ram_stb:           IN std_logic;
      ram_wen:           IN std_logic;
      ram_add:           IN std_logic_vector(9 DOWNTO 0);
      ram_wdata:         IN std_logic_vector(31 DOWNTO 0);
      ram_ack:           OUT std_logic;
      ram_rdata:         OUT std_logic_vector(31 DOWNTO 0));
  END COMPONENT;

  COMPONENT block_ram_36x2048_36x2048 IS
    PORT(
        clk_a:               IN std_logic;
        add_a:               IN std_logic_vector(10 DOWNTO 0);
        write_data_a:        IN std_logic_vector(35 DOWNTO 0);
        write_enable_a:      IN std_logic;
        write_ack_a:         OUT std_logic;
        read_data_a:         OUT std_logic_vector(35 DOWNTO 0);
        read_enable_a:       IN std_logic;
        read_ack_a:          OUT std_logic;
        clk_b:               IN std_logic;
        add_b:               IN std_logic_vector(10 DOWNTO 0);
        write_data_b:        IN std_logic_vector(35 DOWNTO 0);
        write_enable_b:      IN std_logic;
        write_ack_b:         OUT std_logic;
        read_data_b:         OUT std_logic_vector(35 DOWNTO 0);
        read_enable_b:       IN std_logic;
        read_ack_b:          OUT std_logic);
  END COMPONENT;

  COMPONENT fifo32_dual_clk IS
    PORT(
        clear:                IN std_logic;
        write_clk:              IN std_logic;
        write_enable:           IN std_logic;
        write_data:             IN std_logic_vector(31 DOWNTO 0);
        read_clk:               IN std_logic;
        read_data:              OUT std_logic_vector(31 DOWNTO 0);
        read_enable:            IN std_logic;
        read_valid:             OUT std_logic;
        full:                   OUT std_logic;
        full_thresh_assert:     IN std_logic_vector(7 DOWNTO 0);
        full_thresh_negate:     IN std_logic_vector(7 DOWNTO 0);
        overflow:               OUT std_logic;
        empty:                  OUT std_logic);
  END COMPONENT;
  
  COMPONENT fifo16_dual_clk IS
    PORT(
        clear:                IN std_logic;
        write_clk:              IN std_logic;
        write_enable:           IN std_logic;
        write_data:             IN std_logic_vector(15 DOWNTO 0);
        read_clk:               IN std_logic;
        read_enable:            IN std_logic;
        read_valid:             OUT std_logic;
        read_data:              OUT std_logic_vector(15 DOWNTO 0));
  END COMPONENT;


  COMPONENT async_pulse_sync IS
    GENERIC(
      negative_logic: string     :=  "FALSE");  
    PORT(
      async_pulse_in:                IN std_logic;
      sync_clk_in:                   IN std_logic;
      sync_pulse_out:                OUT std_logic;
      sync_pulse_sgl_clk_out:        OUT std_logic);
  END COMPONENT;

  COMPONENT clk_rate IS
    PORT(
        async_pulse_in:           IN std_logic;
        clk_in:                   IN std_logic;
        rst_in:                   IN std_logic;
        clk_rate_out:              OUT std_logic_vector(31 downto 0));
  END COMPONENT;

  COMPONENT data_checker IS
    PORT(
        tx_clk:                 IN std_logic;
        tx_rst:                 IN std_logic;
        tx_data_in:             IN std_logic_vector(31 DOWNTO 0);
        tx_datavalid_in:        IN std_logic;
        rx_clk:                 IN std_logic;
        rx_rst:                 IN std_logic;
        rx_data_in:             IN std_logic_vector(31 DOWNTO 0);
        rx_datavalid_in:        IN std_logic;
        sync_cnt_out:           OUT std_logic_vector(31 DOWNTO 0);
        sync_valid_out:           OUT std_logic;
        sync_lost_out:          OUT std_logic);
  END COMPONENT;

  COMPONENT timeout is
    generic(
      TIMEOUT_PERIOD : natural :=  100);  
    port(
       clk_in : in std_logic;
       rst_in : in std_logic;
       timeout_out : out std_logic);
  end COMPONENT;

END  package_utilities;













LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY blinker IS
   GENERIC( 
      blink_period : natural   := 40000000);
   PORT( 
      clk         : IN     std_logic;
      reset_b     : IN     std_logic;
      blink_out   : OUT    std_logic);
END blinker ;

ARCHITECTURE behave OF blinker IS
begin

	cnt : PROCESS(clk, reset_b)
		VARIABLE counter : natural;
	BEGIN
		IF (reset_b = '0') THEN
         counter := blink_period;
         blink_out <= '0';
		ELSIF (clk = '1' AND clk'event) THEN
			IF (counter = 0) THEN
            blink_out <= '1';
				counter := blink_period;
			ELSE
            blink_out <= '0';
				counter := counter - 1;
			END IF;
		END IF;
	END PROCESS cnt;

END behave;


----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY pulse_lengthen IS
   GENERIC( 
      pulse_length : natural   := 4000000;
      pulse_init   : std_logic := '1');
   PORT( 
      clk         : IN     std_logic;
      reset_b     : IN     std_logic;
      pulse_short : IN     std_logic;
      pulse_long  : OUT    std_logic);
END pulse_lengthen ;


ARCHITECTURE behave OF pulse_lengthen IS
begin

	lengthen : PROCESS(clk, reset_b)
		VARIABLE pulse_cnt : natural;
	BEGIN
		IF (reset_b = '0') THEN
			IF pulse_init = '1' THEN
            pulse_cnt := pulse_length;
            pulse_long <= '1';
         ELSE
            pulse_cnt := 0;
            pulse_long <= '0';
         END IF;
		ELSIF (clk = '1' AND clk'event) THEN
			IF (pulse_short = '1') THEN
				pulse_cnt := pulse_length;
				pulse_long <= '1';
			ELSIF (pulse_cnt > 0) THEN
				pulse_cnt := pulse_cnt - 1;
				pulse_long <= '1';
			ELSE
				pulse_long <= '0';
			END IF;
		END IF;
	END PROCESS lengthen;

END behave;

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY unisim;
USE unisim.vcomponents.ALL;

ENTITY delay_bit IS
   PORT (
      reset_b           : IN std_logic;
      clk               : IN std_logic;
      delay_in          : IN std_logic_vector(4 DOWNTO 0) := "LLLLL";
      delay_enable_in   : IN std_logic := 'L';
      bit_in            : IN std_logic;
      bit_out           : OUT std_logic);
END delay_bit;

ARCHITECTURE behave OF delay_bit IS

   -- SIGNAL shift_reg: std_logic_vector(16 DOWNTO 1);
   -- SIGNAL shift_reg_index: integer RANGE 0 TO 15;
   SIGNAL bit_out_reg, bypass: std_logic;

begin

  srlc32e_inst : srlc32e
  GENERIC MAP (
    init => x"00000000")
  PORT MAP (
    q => bit_out_reg,
    q31 => open,
    a => delay_in,
    ce => '1',
    clk => clk,
    d => bit_in);

  bit_out <= bit_in WHEN delay_enable_in = '0' ELSE bit_out_reg;

END behave;

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
LIBRARY work;

ENTITY delay_word IS
   GENERIC (
      width: natural RANGE 2 TO 2048 := 32);
   PORT (
      reset_b		: IN std_logic;
      clk		: IN std_logic;
      delay_in          : IN std_logic_vector(4 DOWNTO 0) := "LLLLL";
      delay_enable_in   : IN std_logic := 'L';
      word_in		: IN std_logic_vector(width-1 DOWNTO 0);
      word_out		: OUT std_logic_vector(width-1 DOWNTO 0));
END delay_word;

ARCHITECTURE behave OF delay_word IS
   
begin
   
   delay_word_gen: FOR i IN 0 TO width-1 GENERATE
      delay_bit_inst : ENTITY work.delay_bit
      PORT MAP (
         reset_b		=> reset_b,
         clk			=> clk,
         delay_in		=> delay_in,
         delay_enable_in        => delay_enable_in,
         bit_in		        => word_in(i),
         bit_out		=> word_out(i));
   END GENERATE;

END behave;

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY unisim;
USE unisim.vcomponents.ALL;

ENTITY spy_buffer_32x512 IS
  PORT(
      clk_a:               IN std_logic;
      write_data_a:        IN std_logic_vector(31 DOWNTO 0);
      write_stop_a:        IN std_logic;
      clk_b:               IN std_logic;
      read_add_b:          IN std_logic_vector(8 DOWNTO 0);
      read_data_b:         OUT std_logic_vector(31 DOWNTO 0);
      read_enable_b:       IN std_logic;
      read_ack_b:          OUT std_logic);
END spy_buffer_32x512;

ARCHITECTURE behave OF spy_buffer_32x512 IS            
   
   SIGNAL ptr_a, ptr_b, add_b : integer RANGE 0 TO 1023;
   SIGNAL write_enable_a : std_logic;
   SIGNAL read_ack_delay_b : std_logic;
   SIGNAL ptr_slv_a, ptr_slv_b : std_logic_vector(9 DOWNTO 0);
   SIGNAL read_data_b_int: std_logic_vector(31 DOWNTO 0);

begin

   read_data_b <= read_data_b_int WHEN read_enable_b = '1' ELSE x"00000000";

   read_ack_on_port_b : PROCESS(clk_b)
   BEGIN
      IF rising_edge(clk_b) THEN
         read_ack_delay_b <= read_enable_b;
         read_ack_b <= read_ack_delay_b;
      END IF;
   END PROCESS;


   write_ptr_on_port_a : PROCESS(clk_a)
   BEGIN
      IF rising_edge(clk_a) THEN
         -- The SIGNAL write_enable_a may be asynchronous.  REGISTER it first.
         -- Called IN write_stop rather than write_enable because spy chan 
         -- would IN mormal opersation continulally run UNTIL something intresting. 
         write_enable_a <= NOT write_stop_a;
         IF write_enable_a = '1' THEN
            IF (ptr_a = 511) THEN
               ptr_a <= 0;
            ELSE
               ptr_a <= ptr_a + 1;
            END IF;
         END IF;
      END IF;
   END PROCESS;

   add_b <= to_integer(unsigned(read_add_b));

   where_to_read: PROCESS(ptr_a, ptr_b, add_b)
   BEGIN
      IF (ptr_a > ptr_b) THEN
         ptr_b <= ptr_a - add_b;
      ELSE 
         ptr_b <= ptr_a + 512 - add_b;
      END IF;
   END PROCESS;

   ptr_slv_a <= std_logic_vector(to_unsigned(ptr_a,10));
   ptr_slv_b <= std_logic_vector(to_unsigned(ptr_b,10));

   blockram: ramb16_s36_s36
   GENERIC MAP(
      write_mode_a => "read_first",
      write_mode_b => "read_first")
   PORT MAP(
      doa   => open,
      dob   => read_data_b_int,
      dopa  => open,
      dopb  => open,
      addra => ptr_slv_a(8 DOWNTO 0),
      addrb => ptr_slv_b(8 DOWNTO 0),
      clka  => clk_a,
      clkb  => clk_b,
      dia   => write_data_a,
      dib   => x"00000000",
      dipa  => "0000",
      dipb  => "0000",
      ena   => '1',
      enb   => '1',
      ssra  => '0',
      ssrb  => '0',
      wea   => write_enable_a,
      web   => '0');

END behave;

-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY unisim;
USE unisim.vcomponents.ALL;

ENTITY pattern_ram_36x512_32x1024 IS
  PORT(
      -- PORT A TO connect TO data path
      pat_clk:           IN std_logic;
      pat_stb:           IN std_logic;
      pat_wen:           IN std_logic;
      pat_add:           IN std_logic_vector(8 DOWNTO 0);
      pat_rdata:         OUT std_logic_vector(31 DOWNTO 0);
      pat_rdata_valid:   OUT std_logic;
      pat_wdata:         IN std_logic_vector(31 DOWNTO 0);
      pat_wdata_valid:   IN std_logic;
      -- PORT B TO connect TO communication BUS 
      ram_clk:           IN std_logic;
      ram_stb:           IN std_logic;
      ram_wen:           IN std_logic;
      ram_add:           IN std_logic_vector(9 DOWNTO 0);
      ram_wdata:         IN std_logic_vector(31 DOWNTO 0);
      ram_ack:           OUT std_logic;
      ram_rdata:         OUT std_logic_vector(31 DOWNTO 0));
END pattern_ram_36x512_32x1024;

ARCHITECTURE behave OF pattern_ram_36x512_32x1024 IS            
   
   SIGNAL ram_stb_delay : std_logic;
   SIGNAL ram_ack_int : std_logic;
   SIGNAL ram_rdata_int: std_logic_vector(35 DOWNTO 0);
   SIGNAL ram_wdata_int: std_logic_vector(35 DOWNTO 0);
   SIGNAL pat_wdata_int: std_logic_vector(35 DOWNTO 0);
   SIGNAL pat_rdata_int: std_logic_vector(35 DOWNTO 0);

   SIGNAL ram_rdata_sel: std_logic_vector(31 DOWNTO 0);
   
begin

   ram_rdata <= ram_rdata_sel WHEN ram_ack_int = '1' ELSE x"00000000";
   ram_ack <= ram_ack_int;


   read_ack_on_port_b : PROCESS(ram_clk)
   BEGIN
      IF rising_edge(ram_clk) THEN
         -- ram_stb_delay <= ram_stb;
         -- ram_ack_int <= ram_stb_delay;
				 -- Modification for IPbus compatibilty.   
				 -- Strobed guaranteed to be deasserted on clk after after ack brought high.
				 ram_stb_delay <= ram_stb;
				 ram_ack_int <= (not ram_ack_int) and ram_stb_delay and ram_stb;
      END IF;
   END PROCESS;

   -- Write strobe controls 36bit word (data AND parity), but input data only 32bit.
   -- LOOP back data rea TO area TO be written AND delat stb.
   ram_wdata_int <= (ram_rdata_int(35 DOWNTO 32) & ram_wdata) WHEN ram_add(0) = '0' ELSE (ram_wdata(3 DOWNTO 0) & ram_rdata_int(31 DOWNTO 0));
   ram_rdata_sel <= ram_rdata_int(31 DOWNTO 0) WHEN ram_add(0) = '0' ELSE (x"0000000" & ram_rdata_int(35 DOWNTO 32));

   pat_wdata_int <= "000" & pat_wdata_valid & pat_wdata;
   pat_rdata <= pat_rdata_int(31 DOWNTO 0);
   pat_rdata_valid <= pat_rdata_int(32);

   blockram: ramb16_s36_s36
   GENERIC MAP(
      write_mode_a => "read_first",
      write_mode_b => "read_first")
   PORT MAP(
      doa   => pat_rdata_int(31 DOWNTO 0),
      dob   => ram_rdata_int(31 DOWNTO 0),
      dopa  => pat_rdata_int(35 DOWNTO 32),
      dopb  => ram_rdata_int(35 DOWNTO 32),
      addra => pat_add,
      addrb => ram_add(9 DOWNTO 1),
      clka  => pat_clk,
      clkb  => ram_clk,
      dia   => pat_wdata_int(31 DOWNTO 0),
      dib   => ram_wdata_int(31 DOWNTO 0),
      dipa  => pat_wdata_int(35 DOWNTO 32),
      dipb  => ram_wdata_int(35 DOWNTO 32),
      ena   => pat_stb,
      enb   => ram_stb_delay,
      ssra  => '0',
      ssrb  => '0',
      wea   => pat_wen,
      web   => ram_wen);

END behave;

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------



LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;
LIBRARY unisim;
USE unisim.vcomponents.ALL;

ENTITY block_ram_36x2048_36x2048 IS
  PORT(
      clk_a:               IN std_logic;
      add_a:               IN std_logic_vector(10 DOWNTO 0) := (OTHERS => '0');
      write_data_a:        IN std_logic_vector(35 DOWNTO 0);
      write_enable_a:      IN std_logic := '0';
      write_ack_a:         OUT std_logic;
      read_data_a:         OUT std_logic_vector(35 DOWNTO 0);
      read_enable_a:       IN std_logic;
      read_ack_a:          OUT std_logic := '0';
      clk_b:               IN std_logic;
      add_b:               IN std_logic_vector(10 DOWNTO 0) := (OTHERS => '0');
      write_data_b:        IN std_logic_vector(35 DOWNTO 0);
      write_enable_b:      IN std_logic := '0';
      write_ack_b:         OUT std_logic;
      read_data_b:         OUT std_logic_vector(35 DOWNTO 0);
      read_enable_b:       IN std_logic;
      read_ack_b:          OUT std_logic := '0');
END block_ram_36x2048_36x2048;

ARCHITECTURE behave OF block_ram_36x2048_36x2048 IS            

   -- pragma synthesis_off
   -- FOR ALL : ramb16_s36_s36 USE ENTITY unisim.ramb16_s36_s36;
   -- pragma synthesis_on

   TYPE type_read_data_array_a is ARRAY (natural RANGE <>) OF std_logic_vector(35 DOWNTO 0);
   TYPE type_read_data_array_b is ARRAY (natural RANGE <>) OF std_logic_vector(35 DOWNTO 0);

   SIGNAL read_data_array_a:       type_read_data_array_a(3 DOWNTO 0);
   SIGNAL read_data_array_b:       type_read_data_array_b(3 DOWNTO 0);
   
   SIGNAL write_enable_array_a:    std_logic_vector(3 DOWNTO 0);
   SIGNAL write_enable_array_b:    std_logic_vector(3 DOWNTO 0);

   SIGNAL ram_select_a:             std_logic_vector(1 DOWNTO 0) := "00";
   SIGNAL ram_select_delayed_a:     std_logic_vector(1 DOWNTO 0) := "00";
   SIGNAL ram_select_b:             std_logic_vector(1 DOWNTO 0) := "00";
   SIGNAL ram_select_delayed_b:     std_logic_vector(1 DOWNTO 0) := "00";
begin

   write_ack_a <= write_enable_a;
   write_ack_b <= write_enable_b;

   read_data_a <= read_data_array_a(to_integer(unsigned(ram_select_delayed_a)));
   read_data_b <= read_data_array_b(to_integer(unsigned(ram_select_delayed_b)));

   ram_select_a <= add_a(10 DOWNTO 9);
   ram_select_b <= add_b(10 DOWNTO 9);

   read_ack_on_port_a : PROCESS(clk_a)
   BEGIN
      IF rising_edge(clk_a) THEN
         read_ack_a <= read_enable_a;
         ram_select_delayed_a <= ram_select_a;
      END IF;
   END PROCESS read_ack_on_port_a;

   read_ack_on_port_b : PROCESS(clk_b)
   BEGIN
      IF rising_edge(clk_b) THEN
         read_ack_b <= read_enable_b;
         ram_select_delayed_b <= ram_select_b;
      END IF;
   END PROCESS read_ack_on_port_b;

   readout_unit_buffer: FOR i IN 0 TO 3 GENERATE
   BEGIN
      write_enable_array_a(i) <= '1' WHEN ((ram_select_a = i) AND (write_enable_a = '1')) ELSE '0';
      write_enable_array_b(i) <= '1' WHEN ((ram_select_b = i) AND (write_enable_b = '1')) ELSE '0';

      blockram: COMPONENT ramb16_s36_s36
      GENERIC MAP(
         write_mode_a => "read_first",
         write_mode_b => "read_first")
      PORT MAP(
         doa   => read_data_array_a(i)(31 DOWNTO 0),
         dob   => read_data_array_b(i)(31 DOWNTO 0),
         dopa  => read_data_array_a(i)(35 DOWNTO 32),
         dopb  => read_data_array_b(i)(35 DOWNTO 32),
         addra => std_logic_vector(add_a(8 DOWNTO 0)),  -- 9bits
         addrb => std_logic_vector(add_b(8 DOWNTO 0)),  -- 9bits
         clka  => clk_a,
         clkb  => clk_b,
         dia   => write_data_a(31 DOWNTO 0),
         dib   => write_data_b(31 DOWNTO 0),
         dipa  => write_data_a(35 DOWNTO 32),
         dipb  => write_data_b(35 DOWNTO 32),
         ena   => '1',
         enb   => '1',
         ssra  => '0',
         ssrb  => '0',
         wea   => write_enable_array_a(i),
         web   => write_enable_array_b(i));

   END GENERATE;

END behave;

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;
LIBRARY unisim;
USE unisim.vcomponents.ALL;

ENTITY fifo32_dual_clk IS
  PORT(
      clear:                  IN std_logic;
      write_clk:              IN std_logic;
      write_enable:           IN std_logic;
      write_data:             IN std_logic_vector(31 DOWNTO 0);
      read_clk:               IN std_logic;
      read_data:              OUT std_logic_vector(31 DOWNTO 0);
      read_enable:            IN std_logic;
      read_valid:             OUT std_logic;
      full:                   OUT std_logic;
      full_thresh_assert:     IN std_logic_vector(7 DOWNTO 0);
      full_thresh_negate:     IN std_logic_vector(7 DOWNTO 0);
      overflow:               OUT std_logic;
      empty:                  OUT std_logic);
END fifo32_dual_clk;

ARCHITECTURE behave OF fifo32_dual_clk IS            

   -- pragma synthesis_off
   -- FOR ALL : ramb16_s36_s36 USE ENTITY unisim.ramb16_s36_s36;
   -- pragma synthesis_on

   TYPE type_read_data_array is ARRAY (natural RANGE <>) OF std_logic_vector(31 DOWNTO 0);

   SIGNAL read_data_array:          type_read_data_array(7 DOWNTO 0);
   SIGNAL write_enable_array:       std_logic_vector(7 DOWNTO 0);
   SIGNAL write_add:                unsigned(11 DOWNTO 0);
   SIGNAL write_ram_select:         unsigned(2 DOWNTO 0);  
   SIGNAL read_add:                 unsigned(11 DOWNTO 0); 
   SIGNAL read_ram_select:          unsigned(2 DOWNTO 0); 
   SIGNAL fill:                     unsigned(11 DOWNTO 0);
   SIGNAL read_enable_delay:        std_logic;
   SIGNAL full_int:                 std_logic;
   SIGNAL overflow_int:             std_logic;
   SIGNAL empty_int:                std_logic;
   SIGNAL clear_wclk, clear_rclk:   std_logic;

begin
   
   read_data <= read_data_array(to_integer(unsigned(read_ram_select)));

   -- There are 96 BLOCK rams IN XC2V3000.  
   -- USE approx half FOR the 8 readout unit buffers
   -- Hence 8 BLOCK rams per BUFFER.
   readout_unit_buffer: FOR i IN 0 TO 7 GENERATE
   BEGIN
      write_enable_array(i) <= '1' WHEN write_ram_select = i ELSE '0';
      blockram: COMPONENT ramb16_s36_s36
      GENERIC MAP(
         sim_collision_check => "NONE",
         write_mode_a => "READ_FIRST",
         write_mode_b => "READ_FIRST")
      PORT MAP(
         doa   => open,
         dob   => read_data_array(i),
         dopa  => open,
         dopb  => open,
         addra => std_logic_vector(write_add(8 DOWNTO 0)),
         addrb => std_logic_vector(read_add(8 DOWNTO 0)),
         clka  => write_clk,
         clkb  => read_clk,
         dia   => write_data,
         dib   => x"00000000",
         dipa  => "0000",
         dipb  => "0000",
         ena   => '1',
         enb   => '1',
         ssra  => '0',
         ssrb  => '0',
         wea   => write_enable_array(i),
         web   => '0');
   END GENERATE;

   write_ram_select <= write_add(11 DOWNTO 9);
   
   write_process :PROCESS(write_clk)
   BEGIN
      IF (write_clk = '1' AND write_clk'event) THEN
         -- Make sure that clear is clked SIGNAL even IF reset_b isn't.
         clear_wclk <= clear;  
         IF clear_wclk = '1' THEN
            write_add <= to_unsigned(1, write_add'length);
         ELSE
            IF write_enable = '1' THEN
               write_add <= write_add + 1;
            END IF;
         END IF;
      END IF;
   END PROCESS write_process;
         
   read_process :PROCESS(read_clk)
   BEGIN
      IF (read_clk = '1' AND read_clk'event) THEN
         -- Make sure that clear is clked SIGNAL even IF reset_b isn't.
         clear_rclk <= clear;  
         IF clear_rclk = '1' THEN
            read_add <= (OTHERS => '0');
            read_ram_select <= (OTHERS => '0');
            read_enable_delay <= '0';
            read_valid <= '0';
         ELSE
            IF read_enable = '1' THEN
               read_add <= read_add + 1;
            END IF;
            read_ram_select <= read_add(11 DOWNTO 9);
            read_enable_delay <= read_enable;
            read_valid <= read_enable_delay;
         END IF;
      END IF;
   END PROCESS read_process;


   -- USE write_clk TO monitor PROCESS because more overflow/full
   -- more critical than empty SIGNAL.
   monitor_process :PROCESS(write_clk)
   BEGIN
      IF (write_clk = '1' AND write_clk'event) THEN
         IF clear_wclk = '1' THEN
            fill <= to_unsigned(1, fill'length);
            full <= '0';
            full_int <= '0';
            overflow <= '0';
            overflow_int <= '0';
            empty <= '1';
            empty_int <= '1';
         ELSE
            fill <= write_add - read_add;
            IF fill(11 DOWNTO 4) >= unsigned(full_thresh_assert) THEN
               full_int <= '1';
            ELSIF fill(11 DOWNTO 4) < unsigned(full_thresh_negate) THEN
               full_int <= '0';
            END IF;
            IF fill >= x"FF0" THEN
               overflow_int <= '1';
            END IF;
            IF fill = 1 THEN
               empty_int <= '1';
            ELSE
               empty_int <= '0';
            END IF;
            full <= full_int OR overflow_int;
            overflow <= overflow_int;
            empty <= empty_int AND NOT overflow_int;
         END IF;
      END IF;
   END PROCESS monitor_process;

END behave;


----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;
LIBRARY unisim;
USE unisim.vcomponents.ALL;

ENTITY fifo16_dual_clk IS
  PORT(
      clear:                IN std_logic;
      write_clk:              IN std_logic;
      write_enable:           IN std_logic;
      write_data:             IN std_logic_vector(15 DOWNTO 0);
      read_clk:               IN std_logic;
      read_enable:            IN std_logic;
      read_valid:             OUT std_logic;
      read_data:              OUT std_logic_vector(15 DOWNTO 0));
END fifo16_dual_clk;

ARCHITECTURE behave OF fifo16_dual_clk IS            

   -- pragma synthesis_off
   -- FOR ALL : ramb16_s18_s18 USE ENTITY unisim.ramb16_s18_s18;
   -- pragma synthesis_on

   SIGNAL write_add:                unsigned(9 DOWNTO 0); 
   SIGNAL read_add:                 unsigned(9 DOWNTO 0); 
   SIGNAL read_enable_delay:        std_logic;
   SIGNAL clear_wclk, clear_rclk:   std_logic;

begin

   write_process :PROCESS(write_clk)
   BEGIN
      IF (write_clk = '1' AND write_clk'event) THEN
         -- Make sure that clear is clked SIGNAL even IF reset_b isn't.
         clear_wclk <= clear;  
         IF clear_wclk = '1' THEN
            write_add <= to_unsigned(1, write_add'length);
         ELSE
            IF write_enable = '1' THEN
               write_add <= write_add + 1;
            END IF;
         END IF;
      END IF;
   END PROCESS write_process;
         

   read_process :PROCESS(read_clk)
   BEGIN
      IF (read_clk = '1' AND read_clk'event) THEN
         -- Make sure that clear is clked SIGNAL even IF reset_b isn't.
         clear_rclk <= clear;  
         IF clear_rclk = '1' THEN
            read_add <= (OTHERS => '0');
            read_enable_delay <= '0';
            read_valid <= '0';
         ELSE
            IF read_enable = '1' THEN
               read_add <= read_add + 1;
            END IF;
            read_enable_delay <= read_enable;
            read_valid <= read_enable_delay;
         END IF;
      END IF;
   END PROCESS read_process;

         
  blockram: COMPONENT ramb16_s18_s18
  GENERIC MAP(
    sim_collision_check => "NONE",
    write_mode_a => "READ_FIRST",
    write_mode_b => "READ_FIRST")
  PORT MAP(
    doa   => open,
    dob   => read_data,
    dopa  => open,
    dopb  => open,
    addra => std_logic_vector(write_add),
    addrb => std_logic_vector(read_add),
    clka  => write_clk,
    clkb  => read_clk,
    dia   => write_data,
    dib   => x"0000",
    dipa  => "00",
    dipb  => "00",
    ena   => '1',
    enb   => '1',
    ssra  => '0',
    ssrb  => '0',
    wea   => write_enable,
    web   => '0');

END behave;

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

-- Generates a synchronous pulse from an asynchronous input regardless of the 
-- input width of the incomping pulse.  Note that if pulses are closely spaced 
-- (i.e < 10 of the synchronous clk period then the second pulse may be omitted).
-- The logic operates with POSTIVE logic by default  (i.e. asserted pulse = '1')

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY unisim;
USE unisim.vcomponents.ALL;

ENTITY async_pulse_sync IS
  GENERIC(
      negative_logic: string     :=  "FALSE");  
  PORT(
      async_pulse_in:                IN std_logic;
      sync_clk_in:                   IN std_logic;
      sync_pulse_out:                OUT std_logic;
      sync_pulse_sgl_clk_out:        OUT std_logic);
END async_pulse_sync;

ARCHITECTURE behave OF async_pulse_sync IS   

  signal sync_pulse_pipe: std_logic_vector(3 downto 0);
  signal async_pulse_int: std_logic;

  -- Allegedly SRLs have poor metastabilty.  Use real flip-flop instead.
  -- Use attributes to stop sythesis tools packing FFs into SRL
  
  -- These attributes will stop Vivado translating the desired flip-flops into an
  -- SRL based shift register.
  attribute ASYNC_REG                   : string;
  attribute ASYNC_REG of ldpe_inst      : label is "TRUE";
  attribute ASYNC_REG of async_stage      : label is "TRUE";

  -- These attributes will stop XST translating the desired flip-flops into an
  -- SRL based shift register.
  attribute shreg_extract                   : string;
  attribute shreg_extract of ldpe_inst      : label is "no";
  attribute shreg_extract of async_stage      : label is "no";



begin

  pos_logic: if negative_logic = "FALSE" generate
    async_pulse_int <= async_pulse_in;
    sync_pulse_sgl_clk_out <= not sync_pulse_pipe(3) and sync_pulse_pipe(2);
    sync_pulse_out <= sync_pulse_pipe(2);
  end generate;

  neg_logic: if negative_logic = "TRUE" generate
    async_pulse_int <= not async_pulse_in;
    sync_pulse_sgl_clk_out <= not(not sync_pulse_pipe(3) and sync_pulse_pipe(2));
    sync_pulse_out <= not sync_pulse_pipe(2);
  end generate;
  
  ldpe_inst : ldpe
  generic map (
    init => '0') -- initial value of latch ('0' or '1')  
  port map (
    q => sync_pulse_pipe(0),       -- data output
    pre => async_pulse_int,          -- asynchronous preset/set input
    d => async_pulse_int,            -- data input
    g => '1',                         -- gate input
    ge => sync_pulse_pipe(3)       -- gate enable input
  );   

  async_stage: FD
  generic map (
    INIT => '0')
  port map (
    C    => sync_clk_in,
    D    => sync_pulse_pipe(0),
    Q    => sync_pulse_pipe(1)
  );

  regs: for i in 1 to 2 generate
    sync_stage : FD
    generic map (
      INIT => '0'
    )
    port map (
      C    => sync_clk_in,
      D    => sync_pulse_pipe(i),
      Q    => sync_pulse_pipe(i+1)
    );
  end generate;

END behave;

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;


ENTITY clk_rate IS
  PORT(
      async_pulse_in:           IN std_logic;
      clk_in:                   IN std_logic;
      rst_in:                   IN std_logic;
      clk_rate_out:              OUT std_logic_vector(31 downto 0));
END clk_rate;

ARCHITECTURE behave OF clk_rate IS   

  -- From within this package
  component async_pulse_sync is
    port(
      async_pulse_in:                IN std_logic;
      sync_clk_in:                   IN std_logic;
      sync_pulse_out:                OUT std_logic;
      sync_pulse_sgl_clk_out:        OUT std_logic);
  end component;

  signal clk_cnt: natural range 0 to 2**30-1;
  signal pulse: std_logic;

begin


  sync_pulse_inst: async_pulse_sync
    port map(
        async_pulse_in => async_pulse_in,
        sync_clk_in => clk_in,
        sync_pulse_out => open,
        sync_pulse_sgl_clk_out => pulse);
        
  clk_rate_proc: process(clk_in, rst_in)
  begin
    if rst_in = '1' then 
      clk_rate_out <= (others => '0');
      clk_cnt <= 0;
    elsif rising_edge(clk_in) then
      if pulse = '1' then
        clk_rate_out <= std_logic_vector(to_unsigned(clk_cnt, 32));
        clk_cnt <= 0;
      else
        clk_cnt <= clk_cnt+1;
      end if;
    end if;
  end process;

end behave;

-- ----------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------
-- 
-- 
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY unisim;
USE unisim.vcomponents.ALL;

Library UNIMACRO;
use UNIMACRO.vcomponents.all;

ENTITY data_checker IS
  PORT(
      tx_clk:                 IN std_logic;
      tx_rst:                 IN std_logic;
      tx_data_in:             IN std_logic_vector(31 DOWNTO 0);
      tx_datavalid_in:        IN std_logic;
      rx_clk:                 IN std_logic;
      rx_rst:                 IN std_logic;
      rx_data_in:             IN std_logic_vector(31 DOWNTO 0);
      rx_datavalid_in:        IN std_logic;
      sync_cnt_out:           OUT std_logic_vector(31 DOWNTO 0);
      sync_valid_out:           OUT std_logic;
      sync_lost_out:          OUT std_logic);
END data_checker;

ARCHITECTURE behave OF data_checker IS            
   
   signal tx_ptr, tx_offset_ptr: integer range 0 to 1023;
   signal tx_offset_en : std_logic;
   signal tx_add, tx_offset_add : std_logic_vector(9 downto 0);
   signal tx_offset_data: std_logic_vector(31 downto 0);

   signal rx_data_d0, rx_data_d1: std_logic_vector(31 downto 0);
   
  type type_data_checker_fsm is(init, wait_for_sync, wait_for_enable, check_for_sync, sync);
    
  signal data_checker_fsm : type_data_checker_fsm := init;
  signal sync_cnt: natural range 0 to ((2**30)-1);

  signal state_counter: natural range 0 to 7;
  
  signal rx_rst_d0, rx_rst_d1: std_logic;
  
begin

  sync_cnt_out <= std_logic_vector(to_unsigned(sync_cnt, 32));

  fsm : process(rx_clk)
  begin
    if rising_edge(rx_clk) then
    
      rx_rst_d0 <= rx_rst;
      rx_rst_d1 <= rx_rst_d0;  
      
      rx_data_d0 <= rx_data_in;
      rx_data_d1 <= rx_data_d0;
      
      if rx_rst_d1 = '1' then 
        data_checker_fsm <= INIT;
      else
      
        case data_checker_fsm is
          when INIT => 
            -- Startup state
            sync_lost_out <= '0';
            sync_valid_out <= '0';
            sync_cnt <= 0;
            data_checker_fsm <= WAIT_FOR_SYNC;
            -- Disable pointer.  Wait for Tx pointer to loop over tx_offset_ptr.
            tx_offset_en <= '0';
          when WAIT_FOR_SYNC => 
            -- Reset lost sync signal
            sync_lost_out <= '0';
            -- Check for whether delayed tx data matches rxdata
            if (rx_data_in = tx_offset_data) then
              -- Perhaps we have synched to incoming data
              tx_offset_en <= '1';
              data_checker_fsm <= WAIT_FOR_ENABLE;
              state_counter <= 1;
            end if;
          when WAIT_FOR_ENABLE => 
            if state_counter /= 0 then
              state_counter <= state_counter -1;
            else 
              data_checker_fsm <= CHECK_FOR_SYNC;
              state_counter <= 7;
            end if;
          when CHECK_FOR_SYNC => 
            if rx_data_d1 = tx_offset_data then
              if state_counter /= 0 then
                state_counter <= state_counter -1;
              else 
                data_checker_fsm <= SYNC;
                sync_valid_out <= '1';
              end if;
            else
              -- Never achived sync. Try again
              data_checker_fsm <= WAIT_FOR_SYNC;
              -- Disable pointer.  Wait for Tx pointer to loop over tx_offset_ptr.
              tx_offset_en <= '0';
            end if;
          when SYNC => 
            if (rx_data_d1 = tx_offset_data) then
              sync_cnt <= sync_cnt + 1;
              sync_valid_out <= '1';
            else
              -- Lost sync. Try again
              data_checker_fsm <= WAIT_FOR_SYNC;
              sync_lost_out <= '1';
              sync_valid_out <= '0';
              sync_cnt <= 0;
              -- Disable pointer.  Wait for Tx pointer to loop over tx_offset_ptr.
              tx_offset_en <= '0';
            end if;
          when others =>
            data_checker_fsm <= INIT;
          end case;
        end if;
      end if;
   end process;

    -- Tx pointer constantly writes valid data to RAM
    tx_ptr_proc : process(tx_clk)
    begin
      if rising_edge(tx_clk) then
        if (tx_ptr = 1023) then
          tx_ptr <= 0;
        else
          tx_ptr <= tx_ptr + 1;
        end if;
      end if;
    end process;

    -- Rx pointer only increments when tracking data
    tx_offset_ptr_proc : process(rx_clk)
    begin
      if rising_edge(rx_clk) then
        if tx_offset_en = '1' then
          if (tx_offset_ptr = 1023) then
            tx_offset_ptr  <= 0;
          else
            tx_offset_ptr  <= tx_offset_ptr  + 1;
          end if;
        end if;
      end if;
    end process;

   tx_add <= std_logic_vector(to_unsigned(tx_ptr,10));
   tx_offset_add <= std_logic_vector(to_unsigned(tx_offset_ptr ,10));


   blockram: BRAM_TDP_MACRO
   GENERIC MAP(
      BRAM_SIZE => "36Kb", -- Target BRAM, "18Kb" or "36Kb" 
      DEVICE => "7SERIES", -- Target Device: "VIRTEX5", "VIRTEX6", "7SERIES", "SPARTAN6" 
      DOA_REG => 0, -- Optional port A output register (0 or 1)
      DOB_REG => 0, -- Optional port B output register (0 or 1)
      INIT_A => X"000000000", -- Initial values on A output port
      INIT_B => X"000000000", -- Initial values on B output port
      INIT_FILE => "NONE",
      READ_WIDTH_A => 32,   -- Valid values are 1-36 (19-36 only valid when BRAM_SIZE="36Kb")
      READ_WIDTH_B => 32,   -- Valid values are 1-36 (19-36 only valid when BRAM_SIZE="36Kb")
      SIM_COLLISION_CHECK => "GENERATE_X_ONLY", -- Collision check enable "ALL", "WARNING_ONLY", 
                                    -- "GENERATE_X_ONLY" or "NONE" 
      SRVAL_A => X"000000000",   -- Set/Reset value for A port output
      SRVAL_B => X"000000000",   -- Set/Reset value for B port output
      WRITE_MODE_A => "READ_FIRST", -- "WRITE_FIRST", "READ_FIRST" or "NO_CHANGE" 
      WRITE_MODE_B => "READ_FIRST", -- "WRITE_FIRST", "READ_FIRST" or "NO_CHANGE" 
      WRITE_WIDTH_A => 32, -- Valid values are 1-36 (19-36 only valid when BRAM_SIZE="36Kb")
      WRITE_WIDTH_B => 32) -- Valid values are 1-36 (19-36 only valid when BRAM_SIZE="36Kb")
   PORT MAP(
      DOA   => open,
      DOB   => tx_offset_data,
      ADDRA => tx_add,
      ADDRB => tx_offset_add,
      CLKA  => tx_clk,
      CLKB  => rx_clk,
      DIA   => tx_data_in,
      DIB   => x"00000000",
      ENA   => '1',
      ENB   => '1',
      REGCEA  => '0',  -- 1-bit input port-A output register enable
      REGCEB  => '0',  -- 1-bit input port-B output register enable
      RSTA => '0',     -- 1-bit input port-A reset
      RSTB => '0',     -- 1-bit input port-B reset      
      WEA   => "1111",
      WEB   => "0000");



END behave;


----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timeout is
  generic(
    TIMEOUT_PERIOD: natural);
  port(
    clk_in: in std_logic;
    rst_in: in std_logic;
    timeout_out: out std_logic);
end timeout;

architecture behave of timeout is            

  signal timeout_cnt: integer := 0;

begin

  timeout_proc: process(clk_in)
  begin
    if rising_edge(clk_in) then
      if rst_in = '1' then
        timeout_cnt <= TIMEOUT_PERIOD;
        timeout_out <= '0';
      elsif timeout_cnt = 0 then
        timeout_out <= '1';
      else
        timeout_cnt <= timeout_cnt - 1;
      end if;
    end if;
  end process;

end behave;








