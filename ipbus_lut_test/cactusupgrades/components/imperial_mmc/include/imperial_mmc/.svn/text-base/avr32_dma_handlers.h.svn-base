/*
 * avr32_ipbus.h
 *
 *  Created on: 3 Jun 2013
 *      Author: sf105
 */

#ifndef AVR32_DMA_HANDLERS_H_
#define AVR32_DMA_HANDLERS_H_

#include "avr32_arch.h"
#include "avr32_fpga.h"

extern U8 gTextSpace[32];
extern bool gSecureMode;

typedef void ( *dma_handler_fn ) ( U32* aSizeRemaining , char** aErrorMsg );


void SetTextSpace ( U32* aSizeRemaining , char** aErrorMsg );
void EnterSecureMode ( U32* aSizeRemaining , char** aErrorMsg );
void SetDummySensor ( U32* aSizeRemaining , char** aErrorMsg );
void FileToSD ( U32* aSizeRemaining , char** aErrorMsg );
void FileFromSD ( U32* aSizeRemaining , char** aErrorMsg );
void RebootFPGA ( U32* aSizeRemaining , char** aErrorMsg );
void DeleteFromSD ( U32* aSizeRemaining , char** aErrorMsg );
void ListFilesOnSD ( U32* aSizeRemaining , char** aErrorMsg );
void NuclearReset ( U32* aSizeRemaining , char** aErrorMsg );


#endif /* AVR32_IPBUS_H_ */
