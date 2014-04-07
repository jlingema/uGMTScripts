/*
 * avr32_fpga.h
 *
 *  Created on: 25 Oct 2012
 *      Author: sf105
 */

#ifndef AVR32_FPGA_H_
#define AVR32_FPGA_H_

// Address that maps to the FPGA selectMAP bus
#define FPGA_ADDR (volatile U16 *)0xD0000000

extern char* gDefaultBinFile;

void fpga_run ( void );
void fpga_reset ( void );
int fpga_ready ( void );


int fpga_configure_networking ( void );

#endif /* AVR32_FPGA_H_ */
