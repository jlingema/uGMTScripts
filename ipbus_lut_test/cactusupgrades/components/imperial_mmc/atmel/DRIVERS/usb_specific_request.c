/* This source file is part of the ATMEL AVR-UC3-SoftwareFramework-1.7.0 Release */

/*This file is prepared for Doxygen automatic documentation generation.*/
/*! \file ******************************************************************
 *
 * \brief Processing of USB device specific enumeration requests.
 *
 * This file contains the specific request decoding for enumeration process.
 *
 * - Compiler:           IAR EWAVR32 and GNU GCC for AVR32
 * - Supported devices:  All AVR32 devices with a USB module can be used.
 * - AppNote:
 *
 * \author               Atmel Corporation: http://www.atmel.com \n
 *                       Support and FAQ: http://support.atmel.no/
 *
 ***************************************************************************/

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

//_____ I N C L U D E S ____________________________________________________

#include "conf_usb.h"


#if USB_DEVICE_FEATURE == ENABLED

#include "usb_drv.h"
#include "usb_descriptors.h"
#include "usb_standard_request.h"
#include "usb_specific_request.h"
#include "cdc.h"
#include "usart.h"

//_____ M A C R O S ________________________________________________________


//_____ D E F I N I T I O N S ______________________________________________


//_____ P R I V A T E   D E C L A R A T I O N S ____________________________

S_line_coding   gLineCoding;
extern const  void *pbuffer;
extern        U16   data_to_transfer;
Bool gDTR = FALSE;

//_____ D E C L A R A T I O N S ____________________________________________

//! @brief This function configures the endpoints of the device application.
//! This function is called when the set configuration request has been received.
//!
void usb_user_endpoint_init(U8 pConf_nb)
{
#if (USB_HIGH_SPEED_SUPPORT==ENABLED)
   if( !Is_usb_full_speed_mode() )
   {
      (void)Usb_configure_endpoint(INT_EP,
                             EP_ATTRIBUTES_3,
                             DIRECTION_IN,
                             EP_SIZE_3,
                             SINGLE_BANK);
    
      (void)Usb_configure_endpoint(TX_EP,
                             EP_ATTRIBUTES_1,
                             DIRECTION_IN,
                             EP_SIZE_1_HS,
                             DOUBLE_BANK);
    
      (void)Usb_configure_endpoint(RX_EP,
                             EP_ATTRIBUTES_2,
                             DIRECTION_OUT,
                             EP_SIZE_2_HS,
                             DOUBLE_BANK);
      return;
   }
#endif
  (void)Usb_configure_endpoint(INT_EP,
                         EP_ATTRIBUTES_3,
                         DIRECTION_IN,
                         EP_SIZE_3,
                         SINGLE_BANK);

  (void)Usb_configure_endpoint(TX_EP,
                         EP_ATTRIBUTES_1,
                         DIRECTION_IN,
                         EP_SIZE_1_FS,
                         SINGLE_BANK);

  (void)Usb_configure_endpoint(RX_EP,
                         EP_ATTRIBUTES_2,
                         DIRECTION_OUT,
                         EP_SIZE_2_FS,
                         SINGLE_BANK);
}


//! This function is called by the standard USB read request function when
//! the USB request is not supported. This function returns TRUE when the
//! request is processed. This function returns FALSE if the request is not
//! supported. In this case, a STALL handshake will be automatically
//! sent by the standard USB read request function.
//!
Bool usb_user_read_request(U8 pType, U8 pRequest)
{
  switch (pRequest)
  {
    case GET_LINE_CODING:
      cdc_get_line_coding();
      return TRUE;

    case SET_LINE_CODING:
      cdc_set_line_coding();
      return TRUE;

    case SET_CONTROL_LINE_STATE:
      cdc_set_control_line_state();
      return TRUE;

    default:
      return FALSE;
  }
}


//! This function returns the size and the pointer on a user information
//! structure
//!
Bool usb_user_get_descriptor(U8 pType, U8 pString)
{
  pbuffer = NULL;

  switch (pType)
  {
  case STRING_DESCRIPTOR:
    switch (pString)
    {
    case LANG_ID:
      data_to_transfer = sizeof(usb_user_language_id);
      pbuffer = &usb_user_language_id;
      break;

    case MAN_INDEX:
      data_to_transfer = sizeof(usb_user_manufacturer_string_descriptor);
      pbuffer = &usb_user_manufacturer_string_descriptor;
      break;

    case PROD_INDEX:
      data_to_transfer = sizeof(usb_user_product_string_descriptor);
      pbuffer = &usb_user_product_string_descriptor;
      break;

    case SN_INDEX:
      data_to_transfer = sizeof(usb_user_serial_number);
      pbuffer = &usb_user_serial_number;
      break;

    default:
      break;
    }
    break;

  default:
    break;
  }

  return pbuffer != NULL;
}

void cdc_get_line_coding(void)
{
   Usb_ack_setup_received_free();

   Usb_reset_endpoint_fifo_access(EP_CONTROL);
   Usb_write_endpoint_data(EP_CONTROL, 8, LSB0(gLineCoding.dwDTERate));
   Usb_write_endpoint_data(EP_CONTROL, 8, LSB1(gLineCoding.dwDTERate));
   Usb_write_endpoint_data(EP_CONTROL, 8, LSB2(gLineCoding.dwDTERate));
   Usb_write_endpoint_data(EP_CONTROL, 8, LSB3(gLineCoding.dwDTERate));
   Usb_write_endpoint_data(EP_CONTROL, 8, gLineCoding.bCharFormat);
   Usb_write_endpoint_data(EP_CONTROL, 8, gLineCoding.bParityType);
   Usb_write_endpoint_data(EP_CONTROL, 8, gLineCoding.bDataBits  );

   Usb_ack_control_in_ready_send();
   while (!Is_usb_control_in_ready());

   while(!Is_usb_control_out_received());
   Usb_ack_control_out_received_free();
}

void cdc_set_line_coding(void)
{
   Usb_ack_setup_received_free();

   while(!Is_usb_control_out_received());
   Usb_reset_endpoint_fifo_access(EP_CONTROL);

   LSB0(gLineCoding.dwDTERate) = Usb_read_endpoint_data(EP_CONTROL, 8);
   LSB1(gLineCoding.dwDTERate) = Usb_read_endpoint_data(EP_CONTROL, 8);
   LSB2(gLineCoding.dwDTERate) = Usb_read_endpoint_data(EP_CONTROL, 8);
   LSB3(gLineCoding.dwDTERate) = Usb_read_endpoint_data(EP_CONTROL, 8);
   gLineCoding.bCharFormat = Usb_read_endpoint_data(EP_CONTROL, 8);
   gLineCoding.bParityType = Usb_read_endpoint_data(EP_CONTROL, 8);
   gLineCoding.bDataBits = Usb_read_endpoint_data(EP_CONTROL, 8);
   Usb_ack_control_out_received_free();

   Usb_ack_control_in_ready_send();
   while (!Is_usb_control_in_ready());
}

void cdc_set_control_line_state(void)
{
   U8 xState1, xState2;

   Usb_ack_setup_received_free();

   xState1 = Usb_read_endpoint_data(EP_CONTROL, 8);
   xState2 = Usb_read_endpoint_data(EP_CONTROL, 8);

   // DTR signal is on LSB of xState1
   if (xState1 & 0x1)
   {
	   // Serial active
	   gDTR = TRUE;
   } else
   {
	   // Serial inactive
	   gDTR = FALSE;
   }

   Usb_ack_control_in_ready_send();
   while (!Is_usb_control_in_ready());
}

Bool usb_user_get_dtr()
{
	return gDTR;
}

#endif  // USB_DEVICE_FEATURE == ENABLED
