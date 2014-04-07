/*
 * avr32_ipbus.h
 *
 *  Created on: 3 Jun 2013
 *      Author: sf105
 */

#ifndef AVR32_DMA_PIPE_H_
#define AVR32_DMA_PIPE_H_

#include "avr32_arch.h"
#include "avr32_fpga.h"


int DMA_FPGAtoMMC ( U32* pData, U32 pLen );
int DMA_MMCtoFPGA ( U32* pData, U32 pLen );


U32 DMA_FPGAtoMMC_data_available();
U32 DMA_FPGAtoMMC_space_available();
U32 DMA_MMCtoFPGA_data_available();
U32 DMA_MMCtoFPGA_space_available();

void dma_pipe_reset ( void );

// int dma_pipe_test ( void );
void dma_pipe_transactor ( void );


#endif /* AVR32_IPBUS_H_ */
