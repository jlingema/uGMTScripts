/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 */

#ifndef AVR32_PWR_H_
#define AVR32_PWR_H_

#include "avr32_arch.h"

#define PWR_MASK_3_3V 0x10

void pwr_init();
void pwr_heartbeat();
void pwr_set_payload ( U8 pPwrState );
float pwr_get_12v_value();
U8 pwr_get_good ( U8 pPwrLine );
U8 pwr_good_mask();

#endif /* AVR32_PWR_H_ */
