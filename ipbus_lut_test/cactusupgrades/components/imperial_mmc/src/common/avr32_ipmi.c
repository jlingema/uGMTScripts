/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 * This file is the main dispatcher/interface for IPMI over the
 * I2C interface to the crate.
 *
 */

#include "imperial_mmc/avr32_ipmi.h"
#include "imperial_mmc/avr32_arch.h"
#include "imperial_mmc/avr32_i2c.h"
#include "imperial_mmc/avr32_sdr.h"
#include "imperial_mmc/avr32_fru.h"
#include "imperial_mmc/avr32_led.h"
#include "imperial_mmc/avr32_buffer.h"
#include "imperial_mmc/avr32_oem.h"
#include "imperial_mmc/avr32_crateid.h"

// Needed for memcpy
#include <string.h>

// We'll store a tx & rx buffer set statically here
static struct IPMB_BUFFER gIPMI_TX_Buf = {};
static struct IPMB_BUFFER gIPMI_RX_Buf = {};

// The current receiver address (defaults to the IPMC)
static U8 ipmi_target_addr = IPMC_ADDRESS;
// Boolean, set to 1 once event receiver is set.
static U8 ipmi_target_set = 0;

// My IPMI address (set at run-time)
static U8 ipmi_my_addr = 0;

// The current sequence number
static U8 ipmi_seq_num = 1;


bool gIPMI_needs_checking = false;



// A utility function to checksum the buffer
U8 ipmi_checksum ( U8 pBuffer[], U8 pLen )
{
  int i = 0;
  U8 xInvChkSum = 0;

  // Just sum up everything in the buffer
  for ( i = 0; i < pLen; i++ )
  {
    xInvChkSum += pBuffer[i];
  }

  return ( 0 - xInvChkSum );
}

// A utility function to checksum the buffer
// AND take an IPMI address into account
U8 ipmi_checksum_ex ( U8 pBuffer[], U8 pLen, U8 pAddr )
{
  int i = 0;
  U8 xInvChkSum = 0;

  // Just sum up everything in the buffer
  for ( i = 0; i < pLen; i++ )
  {
    xInvChkSum += pBuffer[i];
  }

  xInvChkSum += pAddr;
  return ( 0 - xInvChkSum );
}

void ipmi_init ( U8 pMyAddr )
{
  ipmi_my_addr = pMyAddr;
}

void ipmi_process()
{
  //   dprintf( "IPMI processing callback\n" );
  U8 xPacket[IPMB_BUF_LEN];
  int xLen = 0;

  // First get out inbound packets
  while ( xLen >= 0 )
  {
    xLen = ipmb_buffer_pop ( xPacket,
                             IPMB_BUF_LEN,
                             &gIPMI_RX_Buf );

    if ( xLen >= 0 )
    {
      //int i;
      //dprintf("In: ");
      //for (i = 0; i < xLen; i++)
      //	dprintf("0x%02X ", xPacket[i]);
      //dprintf("\n");
      ipmi_data_process ( xPacket, xLen );
    }
  }

  // Then process outbound packets
  xLen = 0;

  while ( xLen >= 0 )
  {
    xLen = ipmb_buffer_pop ( xPacket,
                             IPMB_BUF_LEN,
                             &gIPMI_TX_Buf );

    if ( xLen >= 1 )
    {
      //int i;
      //dprintf("Out: ");
      //for (i = 0; i < xLen; i++)
      //	dprintf("0x%02X ", xPacket[i]);
      //dprintf("\n");
      // NOTE: Address is shifted right by one
      // This is an obscure part of the IPMI spec!
      i2c_send ( xPacket[0] >> 1, // First byte is addr
                 & ( xPacket[1] ),
                 xLen - 1 );
    }
  }

  gIPMI_needs_checking = false;
  return;
}

void ipmi_data_rx ( U8* pData, U8 pLen )
{
  int xRet;
  // Simply put the data onto the rx queue
  xRet = ipmb_buffer_push ( pData,
                            pLen,
                            &gIPMI_RX_Buf );

  if ( xRet < 0 )
  {
    dprintf ( "CRITICAL: RX Buffer Overflow?" );
  }
}

void ipmi_data_process ( U8* pData, U8 pLen )
{
  if ( pLen > 0 )
  {
    //dprintf("Got %d byte(s) of IPMI data!\n", pLen);
    //int i = 0;
    //dprintf("In: ");
    //for (i = 0; i < pLen; i++)
    //	  dprintf("0x%02X ", pData[i]);
    //dprintf("\n");
  }

  // We just got a packet of IPMI data, decode it...

  // If request is less than 6 bytes, we can't do anything, ignore it.
  if ( pLen < 5 )
  {
    dprintf ( "ERROR: Malformed (too short) packet received!\n" );
    return;
  }

  // Verify the checksum of the first two bytes...
  struct IPMI_MSG* xMsgHeader =
    ( struct IPMI_MSG* ) pData;

  if ( xMsgHeader->chk1 !=
       ipmi_checksum_ex ( pData, 1, ipmi_my_addr ) )
  {
    dprintf ( "ERROR: Incorrect checksum1 in IPMI packet!\n" );
    return;
  }

  // Attempt to verify the full message checksum
  U8* xChecksum2 = & ( pData[pLen - 1] ); // Checksum is at the end of the message

  if ( *xChecksum2 !=
       ipmi_checksum_ex ( pData, pLen - 1, ipmi_my_addr ) )
  {
    dprintf ( "ERROR: Incorrect checksum2 in IPMI packet!\n" );
    return;
  }

  // Now check if this is a confirmation packet (NetFn in binary ends in a 1)
  if ( ( xMsgHeader->netfun >> 2 ) & 0x01 )
  {
    // Send any FRU responses to the crate ID functions are appropriate
    // NetFN response messages have the LSB set to 1
    //dprintf("NetFn: 0x%02X\n", xMsgHeader->netfun);
    if ( ( xMsgHeader->netfun >> 2 ) == ( IPMI_STORAGE_NETFN | 0x01 ) )
    {
      if ( crateid_proc_resp ( pData, pLen ) )
      {
        return;  // Crate ID handled the message, return!
      }
    }

    // This packet is a response... Ignore it for now?
    //dprintf("NOTE: Ignoring response packet.\n");
    return;
  }

  // Now we need to process the data
  U8* xData = pData + IPMI_MSG_LEN;
  // Data length is (total - header - checksum2_byte)
  U8 xDataLen = pLen - IPMI_MSG_LEN - 1;
  // These variables control what we send back.
  U8 xRespLen = 0;
  U8 xRespCode = IPMI_CC_INV_CMD;
  U8 xRespData[IPMI_RESP_PAYLOAD_LEN] = {};
  // This function is set to the correct function to collect the payload data
  // It's only called if the response code is success (and it's not NULL!).
  ipmi_data_fn xDataFunction = NULL;

  // Now we need to do a relevant action based on the packet type...
  switch ( xMsgHeader->netfun >> 2 )
  {
    case IPMI_APP_NETFN:

      switch ( xMsgHeader->cmdType )
      {
          // This constant is the same which causes a compile error.
          //case IPMI_BROADCAST_GET_DEVICE_ID_CMD:
        case IPMI_GET_DEVICE_ID_CMD:
          xDataFunction = &ipmi_cmd_get_id;
          break;
      }

      break;
    case IPMI_SENSOR_EVENT_NETFN:

      switch ( xMsgHeader->cmdType )
      {
        case IPMI_SET_EVENT_RECEIVER_CMD:
          xDataFunction = &ipmi_cmd_set_evnt_receiver;
          break;
        case IPMI_GET_EVENT_RECEIVER_CMD:
          xDataFunction = &ipmi_cmd_get_evnt_receiver;
          break;
        case IPMI_GET_DEVICE_SDR_INFO_CMD:
          xDataFunction = &sdr_cmd_sdr_info;
          break;
        case IPMI_GET_DEVICE_SDR_CMD:
          xDataFunction = &sdr_cmd_get_sdr;
          break;
        case IPMI_RESERVE_DEVICE_SDR_REPOSITORY_CMD:
          xDataFunction = &sdr_cmd_reserve_repository;
          break;
        case IPMI_GET_SENSOR_THRESHOLD_CMD:
          xDataFunction = &sdr_cmd_get_sensor_threshold;
          break;
        case IPMI_GET_SENSOR_READING_CMD:
          xDataFunction = &sdr_cmd_get_sensor_reading;
          break;
        default:
          break;
      }

      break;
    case IPMI_STORAGE_NETFN:

      switch ( xMsgHeader->cmdType )
      {
        case IPMI_GET_FRU_INVENTORY_AREA_INFO_CMD:
          xDataFunction = &fru_cmd_get_inv_area_info;
          break;
        case IPMI_READ_FRU_DATA_CMD:
          xDataFunction = &fru_cmd_read_data;
          break;
        case IPMI_WRITE_FRU_DATA_CMD:
          xDataFunction = &fru_cmd_write_data;
          break;
        default:
          break;
      }

      break;
    case IPMI_GROUP_EXTENSION_NETFN:

      switch ( xMsgHeader->cmdType )
      {
        case IPMI_PICMG_CMD_GET_PROPERTIES:
          xDataFunction = &pcimg_cmdex_get_props;
          break;
        case IPMI_PICMG_CMD_FRU_CONTROL:
          xDataFunction = &fru_cmdex_control;
          break;
        case IPMI_PICMG_CMD_GET_FRU_LED_PROPERTIES:
          xDataFunction = &led_cmdex_led_props;
          break;
        case IPMI_PICMG_CMD_GET_LED_COLOR_CAPABILITIES:
          xDataFunction = &led_cmdex_led_colour_caps;
          break;
        case IPMI_PICMG_CMD_SET_FRU_LED_STATE:
          xDataFunction = &led_cmdex_led_set_state;
          break;
        case IPMI_PICMG_CMD_GET_FRU_LED_STATE:
          xDataFunction = &led_cmdex_led_get_state;
          break;
        case IPMI_PICMG_CMD_GET_DEVICE_LOCATOR_RECORD:
          xDataFunction = &pcimg_cmdex_get_dev_loc_rec;
          break;
        case IPMI_PICMG_CMD_SET_AMC_PORT_STATE:
          xDataFunction = &pcimg_cmdex_set_amc_port_state;
          break;
        case IPMI_PICMG_CMD_GET_AMC_PORT_STATE:
          xDataFunction = &pcimg_cmdex_get_amc_port_state;
          break;
        default:
          break;
      }

      break;
    case IPMI_CONTROLLER_SPECIFIC:

      // We currently have nothing specific, fall through to the default
      switch ( xMsgHeader->cmdType )
      {
        case IPMI_OEM_MINIT_NULL:
          xDataFunction = &oem_cmd_null;
          break;
        case IPMI_OEM_MINIT_COMMIT:
          xDataFunction = &oem_cmd_commit;
          break;
        case IPMI_OEM_MINIT_SETMAC:
          xDataFunction = &oem_cmd_setmac;
          break;
        case IPMI_OEM_MINIT_SETIP:
          xDataFunction = &oem_cmd_setip;
          break;
        case IPMI_OEM_MINIT_SETRARP:
          xDataFunction = &oem_cmd_setrarp;
          break;
        case IPMI_OEM_MINIT_GETNETINFO:
          xDataFunction = &oem_cmd_netinfo;
          break;
        case IPMI_OEM_MINIT_HARDRESET:
          xDataFunction = &oem_cmd_hardreset;
          break;
        default:
          dprintf ( "ERROR: Unknown OEM Command!\n" );
          break;
      }

    default:
      break;
  }

  // If the return code is OK, then actually fetch the data!
  if ( xDataFunction )
  {
    xRespCode = ( *xDataFunction ) ( xData, xDataLen, xRespData, &xRespLen );
  }

  //dprintf("DEBUG: Sending an IPMI Response message...\n");
  // Now we've done the processing, send the response
  ipmi_send_response ( xMsgHeader,
                       xRespCode, // Return Code
                       xRespData, // Return Data
                       xRespLen ); // Return Data Len
}

void ipmi_data_tx ( U8 pSAddr, U8* pData, U8 pLen )
{
  int xRetry = 3;

  while ( xRetry )
  {
    if ( i2c_send ( pSAddr, pData, pLen ) == I2C_SUCCESS )
    {
      break;
    }

    xRetry--;
  }
}

void ipmi_send_response ( struct IPMI_MSG* pOrigMsg,
                          U8 pRetCode, U8* pData, U8 pLen )
{
  // We assemble a packet here
  // Then post it onto to the outgoing queue
  U8 xOutBuffer[IPMB_BUF_LEN] = {};
  U8* xTmpBuffer = & ( xOutBuffer[1] );
  U8 xRet;
  U8 xBufferLen = 0;
  struct IPMI_MSG* xMsgHeader =
    ( struct IPMI_MSG* ) ( xTmpBuffer );
  xBufferLen += IPMI_MSG_LEN;
  // We allocate one byte for the return code
  U8* xRetCode = ( U8* ) & ( xTmpBuffer[xBufferLen] );
  xBufferLen++;

  if ( ( pOrigMsg->netfun >> 2 ) == IPMI_GROUP_EXTENSION_NETFN )
  {
    // If we are processing an extension message we need an extra byte
    U8* xExtraByte = ( U8* ) & ( xTmpBuffer[xBufferLen] );
    xBufferLen++;
    // Set the extra byte now to avoid complications further down
    *xExtraByte = IPMI_PICMG_GRP_EXT;
  }

  // Fill out the header of the reply
  // It's imperative we swap the LUNs around too!
  xMsgHeader->netfun = ( pOrigMsg->netfun
                         | IPMI_NETFUN_REPLY_MASK )
                       & ~IPMI_LUN_MASK;
  xMsgHeader->netfun |= ( pOrigMsg->seqNum & IPMI_LUN_MASK );
  xMsgHeader->chk1 = ipmi_checksum_ex ( xTmpBuffer,
                                        1,
                                        pOrigMsg->rqSA );
  xMsgHeader->rqSA = ipmi_my_addr;
  xMsgHeader->seqNum = pOrigMsg->seqNum & ~IPMI_LUN_MASK;
  xMsgHeader->seqNum |= ( pOrigMsg->netfun & IPMI_LUN_MASK );
  xMsgHeader->cmdType = pOrigMsg->cmdType;
  // Store the return code
  *xRetCode = pRetCode;

  if ( pLen > 0 )
  {
    memcpy ( & ( xTmpBuffer[xBufferLen] ), // Copy into the buffer
             pData, // From pData
             pLen ); // With pLen bytes
    xBufferLen += pLen;
  }

  // Finally checksum the packet and sent it!
  U8* xMsgChecksum2 = ( U8* ) & ( xTmpBuffer[xBufferLen] );
  xBufferLen++;
  *xMsgChecksum2 = ipmi_checksum_ex ( xTmpBuffer,
                                      ( xBufferLen - 1 ),
                                      pOrigMsg->rqSA );
  // We add the destination address onto the front of the buf
  xOutBuffer[0] = pOrigMsg->rqSA;
  // Push the whole message onto the queue
  xRet = ipmb_buffer_push ( xOutBuffer,
                            xBufferLen + 1, // +1 to include address
                            &gIPMI_TX_Buf );

  if ( xRet < 0 )
  {
    dprintf ( "CRITICAL: TX Buffer Overflow?" );
  }
}

void ipmi_send_sensor_event ( U8 pSensNum,
                              U8 pEvntData,
                              U8 pSensType,
                              U8 pEventDirType )
{
  U8 xOutBuffer[IPMB_BUF_LEN] = {};
  U8* xTmpBuffer = & ( xOutBuffer[1] );
  U8 xRet;
  U8 xBufferLen = 0;
  // Split the buffer up into various parts
  struct IPMI_MSG* xMsgHeader =
    ( struct IPMI_MSG* ) ( xTmpBuffer );
  xBufferLen += IPMI_MSG_LEN;
  struct IPMI_MSG_SENSOR_EVENT* xMsgEvent =
    ( struct IPMI_MSG_SENSOR_EVENT* ) & ( xTmpBuffer[xBufferLen] );
  xBufferLen += IPMI_MSG_SENSOR_EVENT_LEN;
  U8* xMsgChecksum2 = ( U8* ) & ( xTmpBuffer[xBufferLen] );
  xBufferLen++;
  // Fill out the message structure
  //xMsgHeader->slaveAddr = IPMC_ADDRESS;
  xMsgHeader->netfun = IPMI_SENSOR_EVENT_NETFN << 2;
  // First checksum is the first 2 bytes of the header
  xMsgHeader->chk1 = ipmi_checksum_ex ( xTmpBuffer, // Buffer
                                        1,              // Buffer Sz
                                        IPMC_ADDRESS ); // Extra addr byte
  xMsgHeader->rqSA = ipmi_my_addr;
  xMsgHeader->seqNum = ( ipmi_seq_num << 2 );
  xMsgHeader->cmdType = IPMI_PLATFORM_EVENT_CMD;
  xMsgEvent->msgrev = IPMI_MSG_SENSOR_REVISION;
  xMsgEvent->sens_type = pSensType;
  xMsgEvent->sens_num = pSensNum;
  xMsgEvent->direction = pEventDirType;
  xMsgEvent->event_data1 = pEvntData;
  xMsgEvent->event_data2 = 0xFF; // Unfilled
  xMsgEvent->event_data3 = 0xFF; // Unfilled
  // Second checksum spans the whole message (except itself!)
  *xMsgChecksum2 = ipmi_checksum_ex ( xTmpBuffer,
                                      ( xBufferLen - 1 ),
                                      ipmi_target_addr );
  // We've used this sequence number now, increment it.
  ipmi_seq_num++;
  // Finally set the destination address,
  //  and send the message (to the outgoing queue)!
  xOutBuffer[0] = ipmi_target_addr;
  xRet = ipmb_buffer_push ( xOutBuffer,
                            xBufferLen + 1, // +1 to include address
                            &gIPMI_TX_Buf );

  if ( xRet < 0 )
  {
    dprintf ( "CRITICAL: TX Buffer Overflow?" );
  }
}

U8 ipmi_cmd_get_id ( U8* pDataIn, U8 pDataInLen,
                     U8* pDataOut, U8* pDataOutLen )
{
  struct IPMI_CMD_ID_RESP* xResp =
    ( struct IPMI_CMD_ID_RESP* ) pDataOut;
  // Fill out the struct
  xResp->devID = IPMI_DEVICE_ID;
  xResp->devRev = IPMI_DEVICE_REV;
  xResp->fwRev1 = IPMI_DEVICE_FW_MAJ;
  xResp->fwRev2 = IPMI_DEVICE_FW_MIN;
  xResp->ipmiver = IPMI_RELEASE_VER;
  xResp->adddevsup = IPMI_ADDITIONAL_DEV_SUPP;
  xResp->manufacID1 = ( IPMI_MANUF_ID & 0xFF );
  xResp->manufacID2 = ( IPMI_MANUF_ID >> 8 );
  xResp->manufacID3 = 0x00;
  xResp->productID1 = ( IPMI_PRODUCT_ID & 0xFF );
  xResp->productID2 = ( IPMI_PRODUCT_ID >> 8 );
  // Return the data size
  *pDataOutLen = sizeof ( struct IPMI_CMD_ID_RESP );
  dprintf ( "NOTE: [CMD] Get ID.\n" );
  return IPMI_CC_OK;
}

U8 ipmi_cmd_set_evnt_receiver ( U8* pDataIn, U8 pDataInLen,
                                U8* pDataOut, U8* pDataOutLen )
{
  if ( pDataInLen >= 1 )
  {
    U8 xNewAddr = *pDataIn;
    ipmi_target_addr = xNewAddr;
    ipmi_target_set = 1;
    // We've written 0 bytes to the output
    *pDataOutLen = 0;
    dprintf ( "NOTE: [CMD] Event Receiver Set (0x%02X).\n", xNewAddr );
    return IPMI_CC_OK;
  }
  else
  {
    dprintf ( "ERROR: Invalid Set Event Receiver Command!(Len = %d)\n",
              pDataInLen );
    return IPMI_CC_INV_CMD;
  }
}

U8 ipmi_evnt_receiver_set ( void )
{
  return ipmi_target_set;
}

U8 ipmi_cmd_get_evnt_receiver ( U8* pDataIn, U8 pDataInLen,
                                U8* pDataOut, U8* pDataOutLen )
{
  *pDataOut = ipmi_target_addr;
  *pDataOutLen = 1;
  dprintf ( "NOTE: [CMD] Event Receiver Get.\n" );
  return IPMI_CC_OK;
}

void crateid_discover_fru()
{
  // We need to build a "Get FRU inventory area" command
  U8 xOutBuffer[IPMB_BUF_LEN] = {};
  //U8 *xTmpBuffer = &(xOutBuffer[1]);
  U8 xRet;
  //U8 xBufferLen = 0;
  /*
  // Split the buffer up into various parts
  struct IPMI_MSG *xMsgHeader =
  		(struct IPMI_MSG *)(xTmpBuffer);
  xBufferLen += IPMI_MSG_LEN;

  struct IPMI_CMD_FRU_AREA_INFO_REQ *xMsgBody =
  		(struct IPMI_CMD_FRU_AREA_INFO_REQ *)&(xTmpBuffer[xBufferLen]);
  xBufferLen += IPMI_CMD_FRU_AREA_INFO_REQ_LEN;

  U8 *xMsgChecksum2 = (U8 *)&(xTmpBuffer[xBufferLen]);
  xBufferLen++;

  xMsgHeader->netfun = IPMI_STORAGE_NETFN << 2;
  xMsgHeader->chk1 = ipmi_checksum_ex(xTmpBuffer, // Buffer
  									1,              // Buffer Sz
  									IPMC_ADDRESS);  // Extra addr byte
  xMsgHeader->rqSA = ipmi_my_addr;
  xMsgHeader->seqNum = (ipmi_seq_num << 2);
  xMsgHeader->cmdType = IPMI_GET_FRU_INVENTORY_AREA_INFO_CMD;
  xMsgBody->fru_id = BACKPLANE_FRU_ID;
  *xMsgChecksum2 = ipmi_checksum_ex(xTmpBuffer,
  							     (xBufferLen - 1),
  							     ipmi_target_addr);
  ipmi_seq_num++;

  dprintf("Sending initial FRU Info packet...\n");

  xOutBuffer[0] = ipmi_target_addr;

  xRet = ipmb_buffer_push(xOutBuffer,
  						xBufferLen + 1, // +1 to include address
  						&gIPMI_TX_Buf);
  if (xRet < 0)
  	dprintf("CRITICAL: TX Buffer Overflow?");
  */
  /*
  xOutBuffer[0] = ipmi_target_addr;
  xOutBuffer[1] = IPMI_APP_NETFN << 2;
  xOutBuffer[2] = ipmi_checksum_ex(&(xOutBuffer[1]), 1, IPMC_ADDRESS);
  xOutBuffer[3] = ipmi_my_addr;
  xOutBuffer[4] = (ipmi_seq_num << 2);
  xOutBuffer[5] = IPMI_SEND_MSG_CMD;
  xOutBuffer[6] = 0x7; // Channel 7?
  xOutBuffer[7] = 0xf4; // Target Addr
  xOutBuffer[8] = IPMI_STORAGE_NETFN << 2;
  xOutBuffer[9] = 0xB8; // Checksum
  xOutBuffer[10] = 0x20; // Return Addr
  xOutBuffer[11] = 0x00;
  xOutBuffer[12] = IPMI_GET_FRU_INVENTORY_AREA_INFO_CMD;
  xOutBuffer[13] = BACKPLANE_FRU_ID;
  xOutBuffer[14] = ipmi_checksum_ex(&(xOutBuffer[10]), 4, 0xf4);
  xOutBuffer[15] = ipmi_checksum_ex(&(xOutBuffer[3]), 12, 0);
  */
  xOutBuffer[0] = ipmi_target_addr;
  xOutBuffer[1] = IPMI_STORAGE_NETFN << 2;
  xOutBuffer[2] = ipmi_checksum_ex ( & ( xOutBuffer[1] ), 1, IPMC_ADDRESS );
  xOutBuffer[3] = ipmi_my_addr;
  xOutBuffer[4] = ( ipmi_seq_num << 4 );
  xOutBuffer[5] = IPMI_GET_FRU_INVENTORY_AREA_INFO_CMD;
  xOutBuffer[6] = 253; //BACKPLANE_FRU_ID;
  xOutBuffer[7] = ipmi_checksum_ex ( & ( xOutBuffer[3] ), 4, 0 );
  ipmi_seq_num++;
  xRet = ipmb_buffer_push ( xOutBuffer, 8, &gIPMI_TX_Buf );
}
