/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 */

#ifndef AVR32_TIMER_H_
#define AVR32_TIMER_H_

typedef void ( *timer_cb ) ( void );

void timer_init ( void );

void timer_register ( timer_cb pCallback );
void timer_unregister ( void );

#endif /* AVR32_TIMER_H_ */
