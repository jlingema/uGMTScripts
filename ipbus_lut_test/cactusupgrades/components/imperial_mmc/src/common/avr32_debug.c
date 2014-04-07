/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 * Helper functions for debugging.
 */
#include "imperial_mmc/avr32_debug.h"

void dprintip ( U32 pIP )
{
  U8* xIP = ( U8* ) &pIP;
  // Avoid warning in production builds where dprint doesn't use this var!
  xIP = xIP;
  dprintf ( "%u.%u.%u.%u", xIP[0], xIP[1], xIP[2], xIP[3] );
}
