/* This source file is part of the ATMEL AVR-UC3-SoftwareFramework-1.7.0 Release */

/*This file has been prepared for Doxygen automatic documentation generation.*/
/*! \file *********************************************************************
 *
 * \brief TWIS driver for AVR32 UC3.
 *
 * This file defines a useful set of functions for TWIS on AVR32 devices.
 *
 * - Compiler:           IAR EWAVR32 and GNU GCC for AVR32
 * - Supported devices:  All AVR32 devices with a TWIS module can be used.
 * - AppNote:
 *
 * \author               Atmel Corporation: http://www.atmel.com \n
 *                       Support and FAQ: http://support.atmel.no/
 *
 ******************************************************************************/

/* Copyright (c) 2009 Atmel Corporation. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this
 * list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * 3. The name of Atmel may not be used to endorse or promote products derived
 * from this software without specific prior written permission.
 *
 * 4. This software may only be redistributed and used in connection with an Atmel
 * AVR product.
 *
 * THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
 * EXPRESSLY AND SPECIFICALLY DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE
 *
 */

#include <avr32/io.h>
#include "compiler.h"
#include "intc.h"
#include "twis.h"

//! Pointer to the instance 1 of the TWI registers for IT.
static volatile avr32_twis_t *twis_inst_slave;

//! Pointer to the applicative TWI transmit buffer.
static const unsigned char *volatile twis_tx_data = NULL;
//! Pointer to the applicative TWI receive buffer.
static volatile unsigned char *volatile twis_rx_data = NULL;

//! Remaining number of bytes to transmit.
static volatile int twi_tx_nb_bytes = 0;
//! Remaining number of bytes to receive.
static volatile int twi_rx_nb_bytes = 0;



//! IT mask.
static volatile unsigned long twis_it_mask;


//! Pointer on TWI slave application routines
static twi_slave_fct_t twi_slave_fct;



/*! \brief TWIS interrupt handler.
 */
#if __GNUC__
__attribute__((__interrupt__))
#elif __ICCAVR32__
__interrupt
#endif
static void twi_slave_interrupt_handler(void)
{
    // get masked status register value
    unsigned long status = twis_inst_slave->sr;

    if (((twis_it_mask & AVR32_TWIS_IER_TCOMP_MASK)
    		&& (status & AVR32_TWIS_SR_TCOMP_MASK))
    || ((twis_it_mask & AVR32_TWIS_IER_REP_MASK)
    		&& (status & AVR32_TWIS_SR_REP_MASK))) {

    	twis_inst_slave->scr = AVR32_TWIS_SCR_TCOMP_MASK;
    	twis_inst_slave->scr = AVR32_TWIS_SCR_REP_MASK;
    	twis_inst_slave->idr = AVR32_TWIS_IDR_TXRDY_MASK | AVR32_TWIS_IDR_RXRDY_MASK
    			| AVR32_TWIS_IDR_TCOMP_MASK | AVR32_TWIS_IDR_REP_MASK;
    	twis_it_mask = AVR32_TWIS_IER_SAM_MASK;
    	twis_inst_slave->ier = twis_it_mask;

    	twi_slave_fct.stop();
    } else if ((twis_it_mask & AVR32_TWIS_IER_SAM_MASK)
    		&& (status & AVR32_TWIS_SR_SAM_MASK)) {

    	// Address Test
    	twis_inst_slave->scr = AVR32_TWIS_SCR_SAM_MASK;

    	if (status & AVR32_TWIS_SR_REP_MASK) {
    		twis_inst_slave->scr = AVR32_TWIS_SCR_REP_MASK;
    	}

    	if (status & AVR32_TWIS_SR_TCOMP_MASK) {
    		twis_inst_slave->scr = AVR32_TWIS_SCR_TCOMP_MASK;
    	}

        // A slave is selected, then check direction
        if (status & AVR32_TWIS_SR_TRA_MASK) {
        	twis_it_mask = AVR32_TWIS_IER_TXRDY_MASK | AVR32_TWIS_IER_TCOMP_MASK;
        	twis_inst_slave->ier = twis_it_mask;
        	twis_inst_slave->thr = twi_slave_fct.tx();
        } else {
        	twis_it_mask = AVR32_TWIS_IER_RXRDY_MASK | AVR32_TWIS_IER_TCOMP_MASK
        			| AVR32_TWIS_IER_REP_MASK;
        	twis_inst_slave->ier = twis_it_mask;
        }
    } else if ((twis_it_mask & AVR32_TWIS_IER_RXRDY_MASK)
    		&& (status & AVR32_TWIS_SR_RXRDY_MASK)) {

    	//this is a RXRDY
    	twi_slave_fct.rx(twis_inst_slave->rhr);

    } else if ((twis_it_mask & AVR32_TWIS_IER_TXRDY_MASK)
    		&& (status & AVR32_TWIS_SR_TXRDY_MASK)) {

    	//this is a TXRDY
    	if (status & AVR32_TWIS_SR_NAK_MASK) {
    		// clear NACK
    		twis_inst_slave->scr = AVR32_TWIS_SCR_NAK_MASK;

    		twis_it_mask = AVR32_TWIS_IER_TCOMP_MASK | AVR32_TWIS_IER_REP_MASK;
    		twis_inst_slave->ier = twis_it_mask;

    	} else {
    		twis_inst_slave->thr = twi_slave_fct.tx();
    	}
    }

    return;
}


int twi_slave_init(volatile avr32_twis_t *twi, const twis_options_t *opt, const twi_slave_fct_t *slave_fct,
				   Bool alt_twis)
{
   Bool global_interrupt_enabled = Is_global_interrupt_enabled();

    // Disable TWI interrupts
    if (global_interrupt_enabled) Disable_global_interrupt();
    twi->idr = ~0UL;
    twi->scr = ~0UL;

    // Reset TWI
    twi->cr = AVR32_TWIS_CR_SWRST_MASK;

    if (global_interrupt_enabled) Enable_global_interrupt();

    // Clear SR
    twi->scr = ~0UL;;

    // Disable all interrupts
    Disable_global_interrupt();

    // Register TWI handler on level 2
    if (alt_twis)
    	INTC_register_interrupt( &twi_slave_interrupt_handler, AVR32_TWIS1_IRQ, AVR32_INTC_INT1);
    else
    	INTC_register_interrupt( &twi_slave_interrupt_handler, AVR32_TWIS0_IRQ, AVR32_INTC_INT1);

    twis_inst_slave = twi;

    // Enable all interrupts
    Enable_global_interrupt();

    // enable slave
    twi->cr =  AVR32_TWIS_CR_SEN_MASK |
    		   AVR32_TWIS_CR_SMATCH_MASK |
    		   AVR32_TWIS_CR_SOAM_MASK |
    		   AVR32_TWIS_CR_STREN_MASK;

    if(opt->smbus)
      twi->cr |= AVR32_TWIS_CR_SMEN_MASK;

    if(opt->tenbit)
      twi->cr |= AVR32_TWIS_CR_TENBIT_MASK;

    // Set slave address
    twi->cr |= (opt->chip << AVR32_TWIS_CR_ADR_OFFSET);

    // set timing register to something
    twi->tr = 0xF01FFFF;

    // get a pointer to applicative routines
    twi_slave_fct = *slave_fct;

    // Slave Access Interrupt Enable
    twis_it_mask = AVR32_TWIS_IER_SAM_MASK;
    twi->ier = twis_it_mask;

    // Everything went ok
    return TWI_SUCCESS;
}
