/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 */

#ifndef AVR32_I2C_H_
#define AVR32_I2C_H_

#include "avr32_arch.h"

#define I2C_SUCCESS 0
#define I2C_ERROR 1

// Standard I2C speed is 100KHz
#define I2C_SPEED_100K 100000

// Buffer sizes
#define I2C_RX_BUFFER 48

// The type of an i2c-callback
typedef void ( *fi2c_cb ) ( U8* pData, U8 pLen );

void i2c_init ( U8 pMyAddr );
void i2c_register ( fi2c_cb pDataCB );
void i2c_scan();
int i2c_send ( U8 pSAddr, U8* pBuffer, U8 pLen );

#endif /* AVR32_I2C_H_ */
