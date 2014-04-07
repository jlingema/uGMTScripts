/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 * This provides simple power management helper functions for all boards.
 *
 */

#include "imperial_mmc/avr32_pwr.h"

float g12V_Value =  -1.0f;

void pwr_init()
{
  // All we need to do here is set-up the ADC to sample the 12v sensor!
  adc_configure ( &AVR32_ADC );
  adc_enable ( &AVR32_ADC, PWR_GPIO_12V_CHAN );
  adc_start ( &AVR32_ADC );
  arch_set_pin ( PWR_GPIO_ENABLE, GPIO_DRIVE_HIGH );
}

void pwr_heartbeat()
{
  // Sample the 12v power
  if ( adc_check_eoc ( &AVR32_ADC, PWR_GPIO_12V_CHAN ) )
  {
    // Conversion finished, get previous value and start again
    long xRawValue = adc_get_value ( &AVR32_ADC, PWR_GPIO_12V_CHAN );
    adc_start ( &AVR32_ADC );
    // Now we can scale the ADC value up to the full range
    // Each xRawValue is worth (3.3/1024)
    // And the input is scaled by (12/2.8)
    g12V_Value = xRawValue * ( 3.3f/1024.0f ) * ( 12.0f/2.8f );
  }
}

void pwr_set_payload ( U8 pPwrState )
{
  if ( pPwrState )
  {
    arch_set_pin ( PWR_GPIO_ENABLE, GPIO_DRIVE_HIGH );
  }
  else
  {
    arch_set_pin ( PWR_GPIO_ENABLE, GPIO_DRIVE_LOW );
  }
}

float pwr_get_12v_value()
{
  return g12V_Value;
}

U8 pwr_get_good ( U8 pPwrLine )
{
  return arch_read_pin ( pPwrLine );
}

U8 pwr_good_mask()
{
  unsigned int xChannels = 0x00;
  xChannels |= ( pwr_get_good ( PWR_GPIO_3_3V ) & 0x01 ) << 4;
  xChannels |= ( pwr_get_good ( PWR_GPIO_2_5V ) & 0x01 ) << 3;
  xChannels |= ( pwr_get_good ( PWR_GPIO_1_8V ) & 0x01 ) << 2;
  xChannels |= ( pwr_get_good ( PWR_GPIO_1_5V ) & 0x01 ) << 1;
  xChannels |= ( pwr_get_good ( PWR_GPIO_1_0V ) & 0x01 ) << 0;
  return xChannels;
}
