/*
 * avr32_sha1.h
 *
 *  Created on: 23 Nov 2012
 *      Author: sf105
 */

#ifndef AVR32_SHA1_H_
#define AVR32_SHA1_H_

#ifndef STANDALONE
#include "avr32_arch.h"
#else
#include "imgtool/standalone.h"
#endif

void sha1_init ( U32 pState[5] );
void sha1_update ( U32 pState[5], U32* pBytes );
void sha1_finish ( U32 pState[5], U32* pBytes, U32 pSize, U32 pTotal );

#endif /* AVR32_SHA1_H_ */
