/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 * This provides the minimal extra logic needed on-top of the UC3 library
 * to make the SD card interface work.
 *
 */

#include "imperial_mmc/avr32_sd.h"

static const mci_options_t MCI_OPTIONS =
{
  .card_speed     = 400000,
  .card_slot      = 0,
};

void sd_init ( void )
{
  sd_mmc_mci_init ( &MCI_OPTIONS, FOSCM_PB, FOSCM );
}


void sd_access_sig ( U8 pOn )
{
#ifdef MP7_REV

  if ( pOn )
  {
    gpio_clr_gpio_pin ( LED_TRI_RED );
  }
  else
  {
    gpio_set_gpio_pin ( LED_TRI_RED );
  }

#endif
}
