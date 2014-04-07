/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 * This file handles the configuration of all the I/O for a specific board.
 * There are a few functions for handling basic GPIO lines.
 */

#include "imperial_mmc/avr32_arch.h"

// IPMB Address lookup table
static U8 gAddrTable[27] =
{
  0x70, 0x8A, 0x72, 0x8E, 0x92, 0x90, 0x74, 0x8C,
  0x76, 0x98, 0x9C, 0x9A, 0xA0, 0xA4, 0x88, 0x9E,
  0x86, 0x84, 0x78, 0x94, 0x7A, 0x96, 0x82, 0x80,
  0x7C, 0x7E, 0xA2
};

static const gpio_map_t sGPIO_MAP =
{
  { TWI_GPIO_CLK,  TWI_GPIO_CLK_FN  },
  { TWI_GPIO_DATA, TWI_GPIO_DATA_FN },
  { SPI0_GPIO_SCK,  SPI0_GPIO_SCK_FN },
  { SPI0_GPIO_MISO, SPI0_GPIO_MISO_FN },
  { SPI0_GPIO_MOSI, SPI0_GPIO_MOSI_FN },
  { SPI0_GPIO_CS0,  SPI0_GPIO_CS0_FN },
#ifdef MINI_T5_REV
  { SPI1_GPIO_SCK,  SPI1_GPIO_SCK_FN },
  { SPI1_GPIO_MISO, SPI1_GPIO_MISO_FN },
  { SPI1_GPIO_MOSI, SPI1_GPIO_MOSI_FN },
  { SPI1_GPIO_CS0,  SPI1_GPIO_CS0_FN },
  { SPI1_GPIO_CS1,  SPI1_GPIO_CS1_FN },
#endif

#if MINI_T5_REV > 1
  // Enable ADC for the 12v sampling
  { PWR_GPIO_12V, PWR_GPIO_12V_FN },
  // Enable the USB pins
  { USB_GPIO_ID,    USB_GPIO_ID_FN },
  { USB_GPIO_VOBF,  USB_GPIO_VOBF_FN },
#endif

#if defined(MP7_REV)
  { TWI_SENS_CLK,  TWI_SENS_CLK_FN  },
  { TWI_SENS_DATA, TWI_SENS_DATA_FN },
  {SD_SLOT_4BITS_CMD_PIN,   SD_SLOT_4BITS_CMD_FUNCTION },
  {SD_SLOT_4BITS_CLK_PIN,   SD_SLOT_4BITS_CLK_FUNCTION},
  {SD_SLOT_4BITS_DATA0_PIN, SD_SLOT_4BITS_DATA0_FUNCTION},
  {SD_SLOT_4BITS_DATA1_PIN, SD_SLOT_4BITS_DATA1_FUNCTION},
  {SD_SLOT_4BITS_DATA2_PIN, SD_SLOT_4BITS_DATA2_FUNCTION},
  {SD_SLOT_4BITS_DATA3_PIN, SD_SLOT_4BITS_DATA3_FUNCTION},
  // Enable the Static memory controller pins
  // TODO: Give these proper #define aliases
  { AVR32_EBI_DATA_0_PIN,  AVR32_EBI_DATA_0_FUNCTION  },
  { AVR32_EBI_DATA_1_PIN,  AVR32_EBI_DATA_1_FUNCTION  },
  { AVR32_EBI_DATA_2_PIN,  AVR32_EBI_DATA_2_FUNCTION  },
  { AVR32_EBI_DATA_3_PIN,  AVR32_EBI_DATA_3_FUNCTION  },
  { AVR32_EBI_DATA_4_PIN,  AVR32_EBI_DATA_4_FUNCTION  },
  { AVR32_EBI_DATA_5_PIN,  AVR32_EBI_DATA_5_FUNCTION  },
  { AVR32_EBI_DATA_6_PIN,  AVR32_EBI_DATA_6_FUNCTION  },
  { AVR32_EBI_DATA_7_PIN,  AVR32_EBI_DATA_7_FUNCTION  },
  { AVR32_EBI_DATA_8_PIN,  AVR32_EBI_DATA_8_FUNCTION  },
  { AVR32_EBI_DATA_9_PIN,  AVR32_EBI_DATA_9_FUNCTION  },
  { AVR32_EBI_DATA_10_PIN, AVR32_EBI_DATA_10_FUNCTION },
  { AVR32_EBI_DATA_11_PIN, AVR32_EBI_DATA_11_FUNCTION },
  { AVR32_EBI_DATA_12_PIN, AVR32_EBI_DATA_12_FUNCTION },
  { AVR32_EBI_DATA_13_PIN, AVR32_EBI_DATA_13_FUNCTION },
  { AVR32_EBI_DATA_14_PIN, AVR32_EBI_DATA_14_FUNCTION },
  { AVR32_EBI_DATA_15_PIN, AVR32_EBI_DATA_15_FUNCTION },
  // Address pins: Not really used yet, but set them up anyway
  /*  { AVR32_EBI_ADDR_0_PIN,  AVR32_EBI_ADDR_0_FUNCTION  },
    { AVR32_EBI_ADDR_1_PIN,  AVR32_EBI_ADDR_1_FUNCTION  },
    { AVR32_EBI_ADDR_2_PIN,  AVR32_EBI_ADDR_2_FUNCTION  },
    { AVR32_EBI_ADDR_3_PIN,  AVR32_EBI_ADDR_3_FUNCTION  },
    { AVR32_EBI_ADDR_4_PIN,  AVR32_EBI_ADDR_4_FUNCTION  },
    { AVR32_EBI_ADDR_5_PIN,  AVR32_EBI_ADDR_5_FUNCTION  },
    { AVR32_EBI_ADDR_6_PIN,  AVR32_EBI_ADDR_6_FUNCTION  },
    { AVR32_EBI_ADDR_7_PIN,  AVR32_EBI_ADDR_7_FUNCTION  },
    { AVR32_EBI_ADDR_8_PIN,  AVR32_EBI_ADDR_8_FUNCTION  },
    { AVR32_EBI_ADDR_9_PIN,  AVR32_EBI_ADDR_9_FUNCTION  },
    { AVR32_EBI_ADDR_10_PIN, AVR32_EBI_ADDR_10_FUNCTION },
    { AVR32_EBI_ADDR_11_PIN, AVR32_EBI_ADDR_11_FUNCTION },
    { AVR32_EBI_ADDR_12_PIN, AVR32_EBI_ADDR_12_FUNCTION },
    { AVR32_EBI_ADDR_13_PIN, AVR32_EBI_ADDR_13_FUNCTION },
    { AVR32_EBI_ADDR_14_PIN, AVR32_EBI_ADDR_14_FUNCTION },
    { AVR32_EBI_ADDR_15_PIN, AVR32_EBI_ADDR_15_FUNCTION },
    { AVR32_EBI_ADDR_16_PIN, AVR32_EBI_ADDR_16_FUNCTION },
    { AVR32_EBI_ADDR_17_PIN, AVR32_EBI_ADDR_17_FUNCTION },
    { AVR32_EBI_ADDR_18_PIN, AVR32_EBI_ADDR_18_FUNCTION },
    { AVR32_EBI_ADDR_19_PIN, AVR32_EBI_ADDR_19_FUNCTION },*/
  // EBI control pins
  { AVR32_EBI_NWE0_0_PIN,  AVR32_EBI_NWE0_0_FUNCTION  },
  { AVR32_EBI_NWE1_0_PIN,  AVR32_EBI_NWE1_0_FUNCTION  },
  { AVR32_EBI_NRD_0_PIN,   AVR32_EBI_NRD_0_FUNCTION   },
  { AVR32_EBI_NCS_1_PIN,   AVR32_EBI_NCS_1_FUNCTION   },
#endif
};

void arch_init()
{
  // This function should initialise the osciallator
  // and the GPIO module, all other init should be
  // left for the individual modules to do.
  // First enable the primary oscillator
  //pm_switch_to_osc0(&AVR32_PM, FOSC0, FOSC0_STARTUP);
  //dprintf("Switch to primary oscillator: OK.\n");
  pm_enable_osc0_crystal ( &AVR32_PM, FOSC0 );
  pm_enable_clk0 ( &AVR32_PM, FOSC0_STARTUP );
  //pm_switch_to_osc0(&AVR32_PM, FOSC0, FOSC0_STARTUP);
  // Set-up input frequency to be 66MHz
  // Switch to PLL to run the CPU core & HSB @ 66MHz (no scaling)
  // and PBA/B @ ~4MHz (IN/16)
  pm_pll_setup ( &AVR32_PM, 0, 10, 2, 0, 16 );
  /*PM_PLL_SET_OPTION(&AVR32_PM, SELECT PLL 0/1, FREQ RANGE: 0=FAST 1=SLOW(FAST/2),
   * 0=WIDE BANDWIDTH ENABLE 1=DISABLE) */
  pm_pll_set_option ( &AVR32_PM, 0, 0, 0, 0 );
  /* SELECT scaling factor of CPU, HSB, PBA, PBB clocks
   * (PBA ENABLE, PBA VALUE, PBB ENABLE, PBB VALUE, HSB/CPU ENABLE, HSB/CPU VALUE)
   * I2C runs on PBA, which (apparently) needs to be slower than HSB.
   * FLASH runs on PBB, which must run at same clock as HSB */
  pm_cksel ( &AVR32_PM, 1, 1, 0, 0, 0, 0 );
  pm_pll_enable ( &AVR32_PM, 0 );
  pm_wait_for_pll0_locked ( &AVR32_PM );
  flashc_set_wait_state ( 1 ); // We need wait states to switch to high-speed clock
  pm_switch_to_clock ( &AVR32_PM, AVR32_PM_MCSEL_PLL0 );
  dprintf ( "Switch to PLL: OK.\n" );
  // Enable the interrupt driver
  // This is needed for the timer at least
  Disable_global_interrupt();
  INTC_init_interrupts();
  Enable_global_interrupt();
  // Set-up the various IO-Ports
  // LEDs
  gpio_enable_gpio_pin ( LED0_GPIO );
  gpio_enable_gpio_pin ( LED1_GPIO );
  gpio_enable_gpio_pin ( LED2_GPIO );
  gpio_enable_gpio_pin ( LED3_GPIO );
#if defined(MP7_REV)
  gpio_enable_gpio_pin ( LED_TRI_RED );
  gpio_enable_gpio_pin ( LED_TRI_GREEN );
  gpio_enable_gpio_pin ( LED_TRI_BLUE );
  // Start with these off!
  gpio_set_gpio_pin ( LED_TRI_RED );
  gpio_set_gpio_pin ( LED_TRI_GREEN );
  gpio_set_gpio_pin ( LED_TRI_BLUE );
#endif
  // Address bus
  gpio_enable_gpio_pin ( GA0_GPIO );
  gpio_enable_gpio_pin ( GA1_GPIO );
  gpio_enable_gpio_pin ( GA2_GPIO );
  // Address bus driver
  gpio_enable_gpio_pin ( GADRIVER_GPIO );
  // Hot-swap sensors
  gpio_enable_gpio_pin ( HOTSWAP_GPIO );
  gpio_enable_gpio_pin ( ENABLESIG_GPIO );
#if defined(MP7_REV)
  // I2C (Sensor bus)Reset
  gpio_enable_gpio_pin ( TWI_SENS_MPLEX_RST );
  //gpio_clr_gpio_pin(TWI_SENS_MPLEX_RST); // Leave it in reset for now
#endif
#if MINI_T5_REV > 1
  // Power inputs
  gpio_enable_gpio_pin ( PWR_GPIO_3_3V );
  gpio_enable_gpio_pin ( PWR_GPIO_2_5V );
  gpio_enable_gpio_pin ( PWR_GPIO_1_8V );
  gpio_enable_gpio_pin ( PWR_GPIO_1_5V );
  gpio_enable_gpio_pin ( PWR_GPIO_1_0V );
  // Power ouptut (on initially)
  gpio_set_gpio_pin ( PWR_GPIO_ENABLE );
#elif defined(MP7_REV)
  // Also enable power on MP7
  gpio_set_gpio_pin ( PWR_GPIO_ENABLE );
  // And make sure we're not resetting the FPGA
  gpio_enable_gpio_pin ( FPGA_GPIO_RESET );
  gpio_clr_gpio_pin ( FPGA_GPIO_RESET );
  // Set-up the other FPGA state pins
  gpio_set_gpio_pin ( FPGA_PROG_B ); // Don't reset FPGA yet!
  gpio_enable_gpio_pin ( FPGA_PROG_B );
  gpio_enable_gpio_pin ( FPGA_INIT_B );
  gpio_enable_gpio_pin ( FPGA_DONE );
  // Other FPGA pins
  gpio_enable_gpio_pin ( FPGA_IPBUS_DONE );
  gpio_enable_gpio_pin ( FPGA_IPBUS_NEW );
  gpio_clr_gpio_pin ( FPGA_IPBUS_NEW );
#endif
  // All other module ports
  gpio_enable_module ( sGPIO_MAP,
                       sizeof ( sGPIO_MAP ) / sizeof ( sGPIO_MAP[0] ) );
  // The USB needs a tiny bit more configuring
#if ((MINI_T5_REV > 1) || defined(MP7_REV))
  gpio_enable_pin_pull_up ( USB_GPIO_ID );
#endif
#if defined(MP7_REV)
  dprintf ( "[SMC] Version 0x%08lX\n", AVR32_SMC.version );
  AVR32_SMC.cs[1].setup = 0x00000000; // 1 cycle set-up for everything
  AVR32_SMC.cs[1].pulse = 0x01010101; // 1 cycle hold for everything
  AVR32_SMC.cs[1].cycle = 0x00020002; // 3 (clock-)cycle (memory-)cycle time
  AVR32_SMC.cs[1].mode = 0; // Clear the mode register
  AVR32_SMC.cs[1].MODE.read_mode = 1; // We need read-mode = 1 so we can ignore NCS
  AVR32_SMC.cs[1].MODE.dbw = 1; // 16-bit bus width
  //AVR32_SMC.cs[1].MODE.dbw = 0; // Temporarily use 8-bit bus width
  // That should be it, the SMC controller should be ready at address 0xD0000000
#endif
  return;
}

U8 arch_read_pin ( U8 pPin )
{
  return gpio_get_pin_value ( pPin );
}

void arch_set_pin ( U8 pPin, U8 pState )
{
  switch ( pState )
  {
    case GPIO_DRIVE_HIGH:
      gpio_set_gpio_pin ( pPin );
      break;
    case GPIO_DRIVE_LOW:
      gpio_clr_gpio_pin ( pPin );
      break;
    case GPIO_FLOAT:
      gpio_set_gpio_open_drain_pin ( pPin );
      break;
    default:
      dprintf ( "ERROR: Attempted to set unknown pin state!\n" );
      break;
  }

  return;
}

U8 arch_get_addr ( void )
{
  // The address index
  U8 xAddrIdx;
  U8 xAddr;
  // The state of the pins while driven high
  U8 GA_Pin_h[3];
  // The state of the pins while driven low
  U8 GA_Pin_l[3];
  // The "value" of the pin (Ground = 0, High = 1,
  //                         Unconnected = 2)
  U8 GA_Pin[3];
  arch_set_pin ( GADRIVER_GPIO, GPIO_DRIVE_HIGH );
  int i = 0;
  GA_Pin_h[0] = arch_read_pin ( GA0_GPIO );
  GA_Pin_h[1] = arch_read_pin ( GA1_GPIO );
  GA_Pin_h[2] = arch_read_pin ( GA2_GPIO );
  arch_set_pin ( GADRIVER_GPIO, GPIO_DRIVE_LOW );
  GA_Pin_l[0] = arch_read_pin ( GA0_GPIO );
  GA_Pin_l[1] = arch_read_pin ( GA1_GPIO );
  GA_Pin_l[2] = arch_read_pin ( GA2_GPIO );
  arch_set_pin ( GADRIVER_GPIO, GPIO_FLOAT );

  // Read the address pins to work out which slot we are in
  for ( i = 0; i <= 2; i++ )
  {
    if ( GA_Pin_h[i] != GA_Pin_l[i] )
    {
      //dprintf("[GA] Pin %d is U.\n", i);
      GA_Pin[i] = 2;
    }
    else if ( GA_Pin_h[i] == 1 )
    {
      //dprintf("[GA] Pin %d is P.\n", i);
      GA_Pin[i] = 1;
    }
    else
    {
      //dprintf("[GA] Pin %d is G.\n", i);
      GA_Pin[i] = 0;
    }
  }

  xAddrIdx = ( GA_Pin[2] * 9 ) + ( GA_Pin[1] * 3 ) + GA_Pin[0];
  //dprintf("Table index: 0x%02X\n", xAddrIdx);
  xAddr = gAddrTable[xAddrIdx];
  //dprintf("Bus Address = 0x%2X.\n", xAddr);
  return xAddr;
}

U8 arch_get_slot()
{
  return ( ( arch_get_addr() - 0x70 ) >> 1 );
}
