/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 * *** THIS FILE IS OBSOLETE AND SHOULDN'T BE USED ***
 *
 * Function here are really just IPMI ones, but I decided to keep them separate.
 * Crate ID detection works in 3 steps, "FRU" here refers to the backplane
 * FRU EEPROM, (reserved FRU ID 253):
 *  1. Get FRU read parameters (crateid_discover_fru)
 *  2. Read the FRU common header
 *  3. Read the FRU internal data section (which might have a crate ID in it!)
 */

#include "imperial_mmc/avr32_crateid.h"
#include "imperial_mmc/avr32_arch.h"
#include "imperial_mmc/avr32_ipmi.h"
#include "imperial_mmc/avr32_buffer.h"

// The crate ID we think we're plugged in to
U8 gCrateID = 0;
// True if we've successfully discovered the Crate ID!
Bool gCrateIDGood = FALSE;


/* Get the cached crate ID into pCrateID
 * Return true if the crate ID is good.
 */
Bool crateid_get_id ( U8* pCrateID )
{
  if ( pCrateID )
  {
    *pCrateID = gCrateID;
  }

  return gCrateIDGood;
}
Bool crateid_proc_resp ( U8* pData, U8 pLen )
{
  int i = 0;

  //dprintf("Processing Crate ID response...\n");
  for ( i = 0; i < pLen; i++ )
  {
    dprintf ( "0x%02X ", pData[i] );
  }

  dprintf ( "\n" );
  return false;
}

