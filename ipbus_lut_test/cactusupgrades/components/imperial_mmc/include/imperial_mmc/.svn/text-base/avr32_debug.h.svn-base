/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 */

#ifndef AVR32_DEBUG_H_
#define AVR32_DEBUG_H_

#include "avr32_arch.h"
#include "avr32_usb.h"

// For now we'll just do debugging using printf
// This goes to the debugger connected on JTAG.
#ifdef DEBUG
#include <stdio.h>
#define dprintf(args...) printf(args); usb_debug(args)
//#define dprintf(args...)
#else //DEBUG
#define dprintf(args...) usb_debug(args)
#endif //DEBUG

void dprintip ( U32 pIP );

#endif /* AVR32_DEBUG_H_ */
