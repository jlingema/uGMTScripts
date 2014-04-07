/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 */

#ifndef AVR32_MP7_SENSORS_H_
#define AVR32_MP7_SENSORS_H_

#include "avr32_arch.h"

#define I2C_SPEED_100K 100000
#define I2C_SPEED_400K 400000

void mp7_sensor_init();
void mp7_sensor_bussel ( U8 pBus );
U8 mp7_sensor_config ( Bool pAltConfig );
U8 mp7_sensor_trigger ( void );
U8 mp7_ltc2990_read ( U8 pSensor, S8* pTemp,
                      S8* pRes1, S8* pRes2 );
U8 mp7_sensor_sht21_run ( void );
U8 mp7_sensor_sht21_get ( S8* pHumid );



#endif /* AVR32_MP7_SENSORS_H_ */
