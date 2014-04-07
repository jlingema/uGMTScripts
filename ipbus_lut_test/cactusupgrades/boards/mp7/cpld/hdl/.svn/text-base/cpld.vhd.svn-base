library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
   generic (ports: integer := 4);
   port (
     -- Push-button reset
     reset_switch: in std_logic; 

     cpld_por : in std_logic;
     
     led : out std_logic_vector(1 downto 0);

     -- AMC JTAG interface
     tcka:       in std_logic;
     tmsa:       in std_logic;
     tdia:       in std_logic;
     tdoa:       out std_logic;

     -- Local JTAG header
     tckb:       in std_logic;
     tmsb:       in std_logic;
     tdib:       in std_logic;
     tdob:       out std_logic;

     -- Device ports (FPGA, Atmel, SRAM1, SRAM2)
     tcko:       out std_logic_vector(ports-1 downto 0);
     tmso:       out std_logic_vector(ports-1 downto 0);
     tdio:       out std_logic_vector(ports-1 downto 0);
     tdoo:       in std_logic_vector(ports-1 downto 0);

     -- CPLD configuration switch
     sel:        in std_logic_vector(7 downto 0);

     -- reference cpld clock
     cpld_clk_100mhz : in std_logic;

     -- spi prom reference signals
     spi_sclk : out std_logic;
     spi_cs_b : out std_logic;
     spi_dq : inout std_logic_vector(3 downto 0) := "ZZZZ";

     -- fpga data signals
     cpld2fpga_d : inout std_logic_vector(15 downto 0) := (OTHERS => 'Z');
     cpld2fpga_a : inout std_logic_vector(16 downto 1);
     cpld2fpga_ebi_nwe_0 : out std_logic;
     cpld2fpga_ebi_nrd : out std_logic;
     cpld2fpga_ipbus_new : out std_logic;
     cpld2fpga_ipbus_done : in std_logic;

     -- FPGA status / programming
     fpga_mode : out std_logic_vector(2 downto 0);
     fpga_prog_b : inout std_logic := 'Z';
     fpga_init_b : in std_logic;
     fpga_done : in std_logic;
     fpga_rdwr_b : out std_logic;
     fpga_csi_b : out std_logic;
     fpga_cclk : inout std_logic;
     fpga_fcs_b : in std_logic;
     fpga_emc_clk : out std_logic;
     fpga_cpld_clk : out std_logic;
     
     -- Atmel interfaces
     atmel_ebi_d : inout std_logic_vector(15 downto 0) := (OTHERS => 'Z');
     atmel_ebi_a : inout std_logic_vector(19 downto 0) := (OTHERS => 'Z');
     atmel_ebi_nwe_0 : in std_logic;
     atmel_ebi_nwe_1 : in std_logic;
     atmel_ebi_ncs_1 : in std_logic;
     atmel_ebi_nrd : in std_logic;
	   atmel_uc : inout std_logic_vector(4 downto 0) := "ZZZZZ"
     
     );
end top;

architecture behave of top is

  attribute SCHMITT_TRIGGER: string;
  attribute SCHMITT_TRIGGER of reset_switch: signal is "true";

  signal tcki:   std_logic;
  signal tmsi:   std_logic;
  signal tdii:   std_logic;
  signal tdoi:   std_logic;
  signal xfer:   std_logic_vector(ports-1 downto -1);

  signal life : std_logic := '0';

  signal atmel_control : std_logic;
  signal fpga_prog_atmel : std_logic;
  signal fpga_prog_pb : std_logic;
  signal select_local_jtag_header : std_logic;
  signal spi_direct_programming : std_logic;
  signal spi_write_enable : std_logic;
  
  signal fpga_d_control : std_logic_vector(1 downto 0);
  signal fpga_d_1 : std_logic;
  
begin

  -- Mapping for the UC<0-3> bus (from CPLD perspective):
  -- UC0 [IN]  - FPGA prog_b (double inverted to stop uC resetting FPGA on programming)
  -- UC1 [OUT] - FPGA init_b
  -- UC2 [OUT] - FPGA done
  -- UC3 [IN]  - IPBus New Request (old EBI NCS pin)
  -- UC4 [OUT] - IPBus Done Request (old UC2FPGACLK pin)
  atmel_uc(1) <= fpga_init_b;
  atmel_uc(2) <= fpga_done;

  -- cpld2fpga_ipbus_new <= atmel_uc(3);
  --  atmel_uc(4) <= cpld2fpga_ipbus_done;

  
  -- Select switch mapping
  -- Just here to make this readable

  -- sel 0 = FPGA JTAG enable
  -- sel 1 = Atmel JTAG enable
  -- sel 2 = SRAM1 JTAG enable
  -- sel 3 = SRAM2 JTAG enable
  -- sel 4 = Atmel FPGA reconfiguration enable

  select_local_jtag_header <= sel(7);
  spi_direct_programming <= not(sel(6));
  spi_write_enable <= sel(5);
  atmel_control <= not sel(4);
  
  -- TODO: QSPI when I fancy a challenge...

  -- For now we just fix to single-lane SPI mode
  -- Atmel is currently bypassed
  spi_dq(0) <= cpld2fpga_d(0) when spi_direct_programming = '0' else tdib;

  -- SelectMAP pins
  -- NB: No longer bit-swapped as this makes other tasks more complex

  atmel_ebi_d <= cpld2fpga_d WHEN atmel_ebi_nrd = '0' ELSE (OTHERS => 'Z');
  cpld2fpga_d(0) <= atmel_ebi_d(0) WHEN atmel_ebi_nwe_0 = '0' ELSE 'Z';
  cpld2fpga_d(15 DOWNTO 2) <= atmel_ebi_d(15 DOWNTO 2) WHEN atmel_ebi_nwe_0 = '0' ELSE (OTHERS => 'Z');
  -- Handle pin 1 specially... It can have the spi_dq signal on it if needed
  fpga_d_1 <= atmel_ebi_d(1) WHEN atmel_control = '1' ELSE spi_dq(1);
  cpld2fpga_d(1) <= fpga_d_1 WHEN (atmel_control = '0' OR atmel_ebi_nwe_0 = '0') ELSE 'Z';
  

  -- Atmel addressing to FPGA (not used at the moment)
--   cpld2fpga_a(16 downto 1) <= atmel_ebi_a(16 downto 1);

--   cpld2fpga_a( 4 downto 1 ) <= (others=>'Z');
--   cpld2fpga_a( 16 downto 8 ) <= (others=>'Z');
-- 	atmel_ebi_a( 4 downto 0 ) <= (others=>'Z');
-- 	atmel_ebi_a( 19 downto 8 ) <= (others=>'Z');
--   
	atmel_ebi_a(7) <= cpld2fpga_a(7);
	cpld2fpga_a(6) <= atmel_ebi_a(6);
	cpld2fpga_a(5) <= atmel_ebi_a(5);
  cpld2fpga_a(4) <= atmel_ebi_a(4);



  -- Configuration clock
  -- TODO, default high or low?
  -- Probably doesn't matter provided CS is not asserted
  spi_sclk <= tckb when spi_direct_programming = '1' else
              fpga_cclk when atmel_control = '0' else
              '1';

  -- Use Atmel NWE signal as the clock
  -- As this is guarenteed to be synchronous to other signals
  fpga_cclk <= atmel_ebi_nwe_0 when atmel_control = '1' else
               'Z';

  -- SPI chip select
  spi_cs_b <= fpga_fcs_b when spi_direct_programming = '0' else
              tmsb;

  -- Atmel EBI bus - selectmap
  cpld2fpga_ebi_nwe_0 <= atmel_ebi_nwe_0;
  cpld2fpga_ebi_nrd <= atmel_ebi_nrd;
  
  -- To check timing on this
  -- We don't really need these pins,
  --  Just pull them down when we're in uC configure mode
  fpga_rdwr_b <= '0' when atmel_control = '1' else 'Z';
  fpga_csi_b <= '0' when atmel_control = '1' else 'Z';
  
  -- LEDs on when signal gnd (i.e. inverted)
  led(0) <= not(fpga_init_b);
  led(1) <= not(life or fpga_done);

  -- General clock, no-longer Atmel CLK
  fpga_cpld_clk <= 'Z';

  -- Forward the reference clock to the FPGA
  fpga_emc_clk <= cpld_clk_100mhz;

  -- 'Life' flasher
  flasher : process(cpld_clk_100mhz)
    variable count : unsigned(23 downto 0) := x"000000";
  begin
    if rising_edge(cpld_clk_100mhz) then
      if count = x"000000" then
        count := to_unsigned(25000000, 24);
        life <= not(life);
      else
        count := count - 1;
      end if;
    end if;
  end process flasher;
  
  -- Note sel signal is inverted (i.e. switch ON = '0')
  -- Resistors on board not required.  Should have just had pullup.

  -- Select JTAG input based on sel(7)

  -- When sel(7) = '1', select on-board header, AMC bypassed
  -- When sel(7) = '0', select AMC connector
  
  tcki <= tckb when select_local_jtag_header = '1' else tcka;
  tmsi <= tmsb when select_local_jtag_header = '1' else tmsa;
  tdii <= tdib when select_local_jtag_header = '1' else tdia;
  tdob <= spi_dq(1) when spi_direct_programming = '1' else
          tdoi when select_local_jtag_header = '1' else
          'Z';
  tdoa <= tdoi when select_local_jtag_header = '0' else tdia;

  -- tck switching
  tcksw: process (tcki, sel)
  begin
    for i in 0 to ports-1 loop
      if sel(i) = '0' then
        tcko(i) <= tcki;
      else
        tcko(i) <= '0';
      end if;
    end loop;
  end process;

  -- tms switching	
  tmssw: process (tmsi, sel)
  begin
    for i in 0 to ports-1 loop
      if sel(i) = '0' then
        tmso(i) <= tmsi;
      else
        tmso(i) <= '1';
      end if;
    end loop;
  end process;

  -- tdi/tdo routing
  xfer(-1) <= tdii; 
  tdsw: process (tdii, sel, tdoo, xfer)
  begin
    for i in 0 to ports-1 loop
      if sel(i) = '0' then
        xfer(i) <= tdoo(i); -- loop through chain
        tdio(i)<= xfer(i-1); 
      else
        xfer(i) <= xfer(i-1); -- bypass
        tdio(i)<= '1'; 
      end if;
    end loop;
    tdoi <= xfer(ports-1);
  end process;
	
  -- Master SPI mode when atmel control pin is low
  -- Slave selectmap mode when high
  fpga_mode <= "001" when atmel_control = '0' else "110";

  -- FPGA programming button (or of Atmel and push button)
  fpga_prog_pb <= not reset_switch ;

  -- Only allow Atmel to control it when enabled
  fpga_prog_atmel <= atmel_control and not atmel_uc(0);
  fpga_prog_b <= '0' when (fpga_prog_pb = '1' or fpga_prog_atmel = '1') else 'Z';

end behave;
