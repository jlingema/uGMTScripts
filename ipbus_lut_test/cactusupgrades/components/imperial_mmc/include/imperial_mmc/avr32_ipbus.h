/*
 * avr32_ipbus.h
 *
 *  Created on: 3 Jun 2013
 *      Author: sf105
 */

#ifndef AVR32_IPBUS_H_
#define AVR32_IPBUS_H_

#include "avr32_arch.h"
#include "avr32_fpga.h"


Bool ipbus_init ( void );
int ipbus_test ( void );

int spi_ipbus_write ( U32 Address , const U32* Data , U32 PayloadLength, bool NonIncrementing , bool UseConfigurationSpace );
int spi_ipbus_read ( U32 Address , U32* Reply , U32 PayloadLength, bool NonIncrementing , bool UseConfigurationSpace );

#endif /* AVR32_IPBUS_H_ */
