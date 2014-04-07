/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 */

#ifndef AVR32_PRNG_H_
#define AVR32_PRNG_H_

#include "avr32_arch.h"

void prng_seed ( U32 pSeed );
U32 prng_next();

#endif /* AVR32_PRNG_H_ */
