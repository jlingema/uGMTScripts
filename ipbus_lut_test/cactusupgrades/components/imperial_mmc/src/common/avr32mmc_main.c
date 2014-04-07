/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 * This file provides the main entry point for the AVR32 MMC code.
 */

#include "imperial_mmc/avr32_arch.h"
#include "imperial_mmc/avr32_debug.h"
#include "imperial_mmc/avr32_timer.h"
#include "imperial_mmc/avr32_led.h"
#include "imperial_mmc/avr32_i2c.h"
#include "imperial_mmc/avr32_ipmi.h"
#include "imperial_mmc/avr32_fru.h"
#include "imperial_mmc/avr32_sdr.h"
#include "imperial_mmc/avr32_spi.h"
#include "imperial_mmc/avr32_pwr.h"
#include "imperial_mmc/avr32_usb.h"
#include "imperial_mmc/avr32_prng.h"
#include "imperial_mmc/avr32_oem.h"

#include "imperial_mmc/avr32_ipbus.h"
#include "imperial_mmc/avr32_dma_pipe.h"

#include "imperial_mmc/avr32_mp7_sensors.h"
#include "imperial_mmc/avr32_sd.h"
#include "imperial_mmc/avr32_sfwfs.h"
#include "imperial_mmc/avr32_fpga.h"


// The heartbeat function is called every 1ms
void heartbeat ( void )
{
  led_heartbeat ( TRUE );
  //   ipmi_process();
  gIPMI_needs_checking = true;
}

// Called when data in the FPGA SPI memory changes
void spi_data_cb ( U8 pFlags )
{
  dprintf ( "SPI Mem Flag Changed (%d)!\n", pFlags );
}

int main()
{
  wdt_disable();
  dprintf ( "-----------------------------------------------------------------------------------------------------\n" );
  int xCounter = 1; // Start the counter at 1
  // This will give the temp sensor time to settle
  // Otherwise at power on temp will be 0, triggering a notification
  // Which in turn causes contention on the I2C bus...
  int xStartSDR = 0; // Time at which the SDR could be activated
  U8 xSDREnabled = 0; // Set to 1 to activate to SDR
  U8 xBusAddr = 0;
  gDummySensor = 0x00000080;
#ifdef MP7_REV
  Bool xAltSensors = FALSE; // Keeps track of the sensors to read next
  S8 xSensReading[3] = {};
  int i;
#endif
#ifdef MP7_REV
  dprintf ( "AVR32_MMC Startup (MP7 Version)!\n" );
#else
  dprintf ( "AVR32_MMC Startup (MINI-T5 Version)!\n" );
#endif
  sd_init();
  arch_init();
  pwr_init();
  timer_init();
  led_init();
  fru_init();
  spi_master_init();
  prng_seed ( 0xCAFEBABE );
  //spi_mem_register(&spi_data_cb);
  // Attempt to enable USB
  usb_init();
  // Wait for the #ENABLE input to go low!
#if (!defined(MP7_REV)) && (MINI_T5_REV < 2)
  dprintf ( "Waiting for ENABLE signal.\n" );

  while ( arch_read_pin ( ENABLESIG_GPIO ) );

#else
  dprintf ( "Skipping ENABLE check on MINI-T5R2 or MP7 board...\n" );
#endif
  // Register timer now, after enable signal.
  timer_register ( &heartbeat );
  // Detect our address
  xBusAddr = arch_get_addr();
  //save network (test)
  //fru_save_network();
  // Now we know which slot we're plugged into
  // We can prepare to set-up the network on the FPGA
  fru_load_network();
  // Now we have our address, we can enable i2c/twi
  i2c_init ( xBusAddr );
  // Link the i2c module to the ipmi module...
  ipmi_init ( xBusAddr );
  sdr_init ( xBusAddr );
  i2c_register ( &ipmi_data_rx );
  // MP7 specific enables
#ifdef MP7_REV
  mp7_sensor_init();
  fpga_reset();
  //#endif
  // Enable IPBus on all boards
  ipbus_init();
#endif
  // TODO: Re-enable watchdog
  //   wdt_enable ( IPMI_WDT_TIMEOUT );
  // Run the main MMC loop
  dprintf ( "Starting MMC main loop...\n" );

  while ( 1 )
  {
    if ( ! ( xCounter % 1000 ) ) //1000
    {
      //    sfwfs_test();
      // dma_pipe_test();
      ////		ipbus_test();
    }

#ifdef MP7_REV
    dma_pipe_transactor();
#endif

    // Read the sensors every ~second
    if ( ! ( xCounter % 1000 ) ) //1000
    {
      pwr_heartbeat();
#ifdef MINI_T5_REV
      float xTemp;
      spi_temp_read ( &xTemp );
      //dprintf("Board temp: %f.\n", xTemp);
      sdr_set_temp_reading ( 0, xTemp );
#endif
    }

#ifdef MP7_REV

    // MP7 has a lot of sensors,
    // Read 50% of them every ~4 seconds
    //  2 = Humidity
    //  3 - 10 = Temperatures
    // 11 - 18 = Reading 1, Config 1
    // 19 - 26 = Reading 2, Config 1
    // 27 - 34 = Reading 1, Config 2
    // 35 - 42 = Reading 2, Config 2
    if ( ! ( xCounter % 4003 ) )
    {
      // Clear the readings
      sdr_blank_readings ( 2, 3, 0x00 );

      if ( !xAltSensors )
      {
        sdr_blank_readings ( 11, 27, 0x80 );
      }
      else
      {
        sdr_blank_readings ( 27, 43, 0x80 );
      }

      // Only do this stuff if the 3.3v power is on!
      if ( pwr_get_good ( PWR_GPIO_3_3V ) )
      {
        mp7_sensor_sht21_get ( &xSensReading[0] );
        sdr_store_reading ( 2, xSensReading[0] );

        for ( i = 0; i < 8; i++ )
        {
          U8 xBase1 = xAltSensors ? 27 : 11;
          U8 xBase2 = xAltSensors ? 35 : 19;
          mp7_ltc2990_read ( i, &xSensReading[0],
                             &xSensReading[1],
                             &xSensReading[2] );
          sdr_store_reading ( i + 3, xSensReading[0] );
          sdr_store_reading ( xBase1 + i, xSensReading[1] );
          sdr_store_reading ( xBase2 + i, xSensReading[2] );
        }

        //         dprintf ( "\n" );
        xAltSensors = xAltSensors ? FALSE : TRUE;
        mp7_sensor_config ( xAltSensors );
        mp7_sensor_trigger();
        mp7_sensor_sht21_run();
      }
    }

    // Do FPGA state machine every time
    fpga_run();

    //     Now set the IP address is the FPGA is in a good state!
    if ( ! ( xCounter % 8003 ) )
    {
      fpga_configure_networking();
    }

#endif

    if ( gIPMI_needs_checking )
    {
      ipmi_process();
    }

    // Update any sensor readings
    // Wait 2 seconds after the event receiver is set
    // Then start to update the readings...
    if ( !xSDREnabled )
    {
      if ( !xStartSDR )
      {
        if ( ipmi_evnt_receiver_set() )
        {
          xStartSDR = xCounter;
        }
      }
      else if ( xCounter > xStartSDR + 1500 )
      {
        dprintf ( "[MAIN] Activating SDR Poll\n" );
        xSDREnabled = 1;
      }
    }
    else
    {
      sdr_poll();
    }

    // Do any USB processing
    usb_run();

    if ( gNuclearReset == 0 )
    {
      // Reset the WDT
      wdt_clear();
    }
    else if ( gNuclearReset == 1 )
    {
      //Nuke the board
      arch_set_pin ( PWR_GPIO_ENABLE, GPIO_DRIVE_LOW );
      wdt_enable ( 1000000 );
      gNuclearReset = 2;
      //Let the WDT nuke the MMC
    }

    // Finally wait 1ms before doing the loop again
    //cpu_delay_ms ( 1, FOSCM );
    xCounter++;
  }

  return 0;
}
