/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 * The SDR library handles the SDR part of the IPMI specification
 * as well as handling the actual reading of the base
 * (i.e. non-MP7 specific) sensors.
 */

#include "imperial_mmc/avr32_sdr.h"

#include "imperial_mmc/avr32_arch.h"

U32 gDummySensor = 0;

// Current reservation ID
U16 gReservationID = 0;

// Current Temperature Reading & Sensor State
S8 gTemp1 = 16;
U8 gTemp1State = SENSOR_STATE_NORMAL;

// We import the SDR header for the relevant board
#if defined(MINI_T5_REV)
#include "mini_t5/mini_t5.sdr.h"
#elif defined(MP7_REV)
#include "mp7/mp7.sdr.h"
#else
#error "No SDR header found for this board."
#endif
// Store all MP7 sensor states
S8 gSensState[NUM_SENSOR_STORE] = {};

// This stores the current hot-swap handle state
// By default we expect it to be open
U8 gHotSwapState = HOTSWAP_STATE_HANDLE_OPEN;
// This boolean should be set to confirm a Quiesce (see sdr_hotswap_quiesce)
Bool gHotSwapQuiesce = FALSE;

void sdr_init ( U8 pMyAddr )
{
  int i = 0;
  U8 xTmp;

  // We have to fill out a few fields in each SDR record
  for ( i = 0; i < SDR_RECORDS; i++ )
  {
    U8* xCurRec = SDRs[i];
    xCurRec[SDR_OFFSET_ADDRESS] = pMyAddr; // Fill the owner ID with our address
    // Fill the entity ID fields
    if ( ( xCurRec[SDR_OFFSET_SENS_TYPE] == 0x01 ) ||
         ( xCurRec[SDR_OFFSET_SENS_TYPE] == 0x02 ) )
    {
      xCurRec[SDR_OFFSET_ENT_INSTANCE_FULL] = 0x60 | ( ( pMyAddr - 0x70 ) >> 1 );
    }
    else if ( xCurRec[SDR_OFFSET_SENS_TYPE] == 0x12 )
    {
      xTmp = 0x60 | ( ( pMyAddr - 0x70 ) >> 1 );
      dprintf ( "Writing 0x%02X as DLR Instance...\n", xTmp );
      xCurRec[SDR_OFFSET_ENT_INSTANCE_DLR] = xTmp;
    }
  }
}

U8 pcimg_cmdex_get_dev_loc_rec ( U8* pDataIn, U8 pDataInLen,
                                 U8* pDataOut, U8* pDataOutLen )
{
  // Record ID 00 is always our device locator record.
  struct IPMI_CMD_SDR_GET_DEV_LOC_RESP* xResp =
    ( struct IPMI_CMD_SDR_GET_DEV_LOC_RESP* ) pDataOut;
  xResp->SensID_LSB = 0x00;
  xResp->SensID_MSB = 0x00;
  *pDataOutLen = sizeof ( struct IPMI_CMD_SDR_GET_DEV_LOC_RESP );
  return IPMI_CC_OK;
}

U8 sdr_cmd_sdr_info ( U8* pDataIn, U8 pDataInLen,
                      U8* pDataOut, U8* pDataOutLen )
{
  struct IPMI_CMD_SDR_INFO_RESP* xResp =
    ( struct IPMI_CMD_SDR_INFO_RESP* ) pDataOut;

  if ( pDataInLen == 0 )
  {
    xResp->Count = SDR_RECORDS;
  }
  else
  {
    if ( pDataIn[0] )
    {
      xResp->Count = SDR_RECORDS;
    }
    else
    {
      xResp->Count = SENSOR_RECORDS;
    }
  }

  xResp->SensorPop = 0x01; // Sensor population is always 1?
  *pDataOutLen = sizeof ( struct IPMI_CMD_SDR_INFO_RESP );
  return IPMI_CC_OK;
}

U8 sdr_cmd_get_sdr ( U8* pDataIn, U8 pDataInLen,
                     U8* pDataOut, U8* pDataOutLen )
{
  if ( pDataInLen != sizeof ( struct IPMI_CMD_SDR_GET_RESP ) )
  {
    *pDataOutLen = 0;
    return IPMI_CC_REQ_DATA_INV_LENGTH;
  }

  struct IPMI_CMD_SDR_GET_RESP* xRequest =
    ( struct IPMI_CMD_SDR_GET_RESP* ) pDataIn;

  // First check that the reservation ID is valid
  U16 xResvID = xRequest->ResvID_LSB |
                ( xRequest->ResvID_MSB << 8 );

  if ( xResvID != gReservationID )
  {
    *pDataOutLen = 0;
    return IPMI_CC_RES_CANCELED;
  }

  U16 xRecordNum = xRequest->RecID_LSB |
                   ( xRequest->RecID_MSB << 8 );

  // Check that the record number does exist
  if ( xRecordNum >= SDR_RECORDS )
  {
    *pDataOutLen = 0;
    return IPMI_CC_PARAM_OUT_OF_RANGE;
  }

  // Check that the request does fit within the memory
  if ( xRequest->Offset + xRequest->Count > SDRSizes[xRecordNum] )
  {
    *pDataOutLen = 0;
    dprintf ( "[SDR] OOPS! Buffer Overrun on SDR %d!\n", xRecordNum );
    return IPMI_CC_PARAM_OUT_OF_RANGE;
  }

  // Everything is OK
  // Write out the next SDR record number
  if ( xRecordNum < ( SDR_RECORDS - 1 ) )
  {
    U16 xNextRecord = xRecordNum + 1;
    pDataOut[0] = xNextRecord & 0xFF;
    pDataOut[1] = ( xNextRecord >> 8 );
  }
  else
  {
    // This is the last record
    // Return the next number as 0xFFFF
    pDataOut[0] = 0xFF;
    pDataOut[1] = 0xFF;
  }

  // Copy the memory
  U8* xDataPtr = ( SDRs[xRecordNum] + xRequest->Offset );
  U8 i = 0;

  for ( i = 0; i < xRequest->Count; i++ )
  {
    pDataOut[i + 2] = xDataPtr[i];
  }

  *pDataOutLen = xRequest->Count + 2;
  dprintf ( "NOTE: [CMD] Read SDR Record.\n" );
  return IPMI_CC_OK;
}

U8 sdr_cmd_reserve_repository ( U8* pDataIn, U8 pDataInLen,
                                U8* pDataOut, U8* pDataOutLen )
{
  struct IPMI_CMD_SDR_RESV_RESP* xResp =
    ( struct IPMI_CMD_SDR_RESV_RESP* ) pDataOut;
  gReservationID++;

  if ( gReservationID == 0x00 )
  {
    gReservationID++;
  }

  xResp->ResvID_LSB = ( gReservationID & 0xFF );
  xResp->ResvID_MSB = ( gReservationID >> 8 );
  *pDataOutLen = sizeof ( struct IPMI_CMD_SDR_RESV_RESP );
  dprintf ( "NOTE: [CMD] Get SDR Reservation.\n" );
  return IPMI_CC_OK;
}

U8 sdr_cmd_get_sensor_threshold ( U8* pDataIn, U8 pDataInLen,
                                  U8* pDataOut, U8* pDataOutLen )
{
  dprintf ( "Unimplemented get sensor threshold!\n" );
  return IPMI_CC_REQ_DATA_INV_LENGTH;
}

// Blanks sensor readings in the SDR to the given value
// This allows stale sensor reading to be masked
void sdr_blank_readings ( U8 pStart, U8 pEnd, U8 pVal )
{
#ifdef MP7_REV
  int i;

  if ( pEnd > NUM_SENSOR_STORE )
  {
    pEnd = NUM_SENSOR_STORE;
  }

  for ( i = pStart; i < pEnd; i++ )
  {
    gSensState[i] = pVal;
  }

#endif
}

void sdr_store_reading ( U8 pSensor, S8 pValue )
{
  if ( pSensor >= NUM_SENSOR_STORE )
  {
    dprintf ( "[SDR] Oops! Tried to store invalid sensor (%d).\n", pSensor );
  }
  else
  {
    //dprintf("[SDR] Sensor %d reading: %d\n", pSensor, pValue);
    gSensState[pSensor] = pValue;
  }
}

U8 sdr_cmd_get_sensor_reading ( U8* pDataIn, U8 pDataInLen,
                                U8* pDataOut, U8* pDataOutLen )
{
  if ( pDataInLen != 1 )
  {
    *pDataOutLen = 0;
    return IPMI_CC_REQ_DATA_INV_LENGTH;
  }

  U8 xSensorID = pDataIn[0];
  struct IPMI_CMD_GET_SENSOR_READING_RESP* xResp =
    ( struct IPMI_CMD_GET_SENSOR_READING_RESP* ) pDataOut;

  switch ( xSensorID )
  {
    case SENSOR_HOTSWAP_NUM:
      xResp->Reading = 0x00;// Hotswap sensor should always return 0 reading
      xResp->EvntFlags = 0x00; // We have no event flags
      dprintf ( "Hotswap currently 0x%02X\n", gHotSwapState );
      xResp->StateBits = gHotSwapState; // Current hot-swap state flags
      xResp->Reserved1 = 0x80;
      break;
#if MINI_T5_REV > 1
    case SENSOR_BOARDTEMP1_NUM:
      // Temperature sensor for ambient temp
      xResp->Reading = gTemp1;
      xResp->EvntFlags = gTemp1State;
      xResp->StateBits = 0x00;
      xResp->Reserved1 = 0x80;
      break;
    case SENSOR_12v_NUM:
      // 12v sensor is based at 12, and scaled by 10...
      xResp->Reading = ( S8 ) ( ( pwr_get_12v_value() - 12.0f ) * 100.0f );
      xResp->EvntFlags = 0x00;
      xResp->StateBits = 0x00;
      xResp->Reserved1 = 0x80;
      break;
    case SENSOR_POWER_NUM:
      xResp->Reading = pwr_good_mask();
      xResp->EvntFlags = 0x00;
      xResp->StateBits = 0x00;
      xResp->Reserved1 = 0x80;
      break;
    case SENSOR_TEST:
      xResp->Reading = ( S8 ) ( gDummySensor&0xFF );
      xResp->EvntFlags = 0x00;
      xResp->StateBits = 0x00;
      xResp->Reserved1 = 0x80;
      break;
#endif
#ifdef MP7_REV
    default:

      if ( xSensorID >= NUM_SENSOR_STORE )
      {
        dprintf ( "[SDR] Oops! Tried to read invalid sensor (%d).\n", xSensorID );
        return IPMI_CC_OK;
      }

      if ( xSensorID == 43 )
      {
        xResp->Reading = ( S8 ) ( gDummySensor&0xFF );
        xResp->EvntFlags = 0x00;
        xResp->StateBits = 0x00;
        xResp->Reserved1 = 0x80;
        break;
      }

      xResp->Reading = gSensState[xSensorID];
      xResp->EvntFlags = 0x00;
      xResp->StateBits = 0x00;
      xResp->Reserved1 = 0x80;
      break;
#else
    default:
      dprintf ( "[SDR] Oops! Tried to read invalid sensor (%d).\n", xSensorID );
      return IPMI_CC_OK;
#endif
  }

  *pDataOutLen = sizeof ( struct IPMI_CMD_GET_SENSOR_READING_RESP );
  // dprintf ( "NOTE: [CMD] Get sensor reading (0x%x = %d).\n", xSensorID, xResp->Reading );
  return IPMI_CC_OK;
}

void sdr_poll()
{
  // Here we should read all of our sensors
  // And also the hot-swap sensor
  // For the hot-swap sensor, we read its state
  // If this is different to last time:
  //  1. Save the updated state
  //  2. Post a state change message
  U8 xHotSwapState = 0x0;
  // NOTE: Handle reading on mini-t5 & mp7 is inverted!
  // Rev 0 boards don't have a hotswap switch (that I know of)
#if (MINI_T5_REV > 0) || (defined(MP7_REV))

  if ( arch_read_pin ( HOTSWAP_GPIO ) )
  {
    // Handle is open... set the bit.
    xHotSwapState &= ( ~HOTSWAP_STATE_HANDLE_MASK );
    xHotSwapState |= HOTSWAP_STATE_HANDLE_OPEN;
  }
  else
  {
    xHotSwapState &= ( ~HOTSWAP_STATE_HANDLE_MASK );
    xHotSwapState |= HOTSWAP_STATE_HANDLE_CLOSED;
  }

#else
#warning "Hotswap handle not supported on this board?"
  xHotSwapState &= ( ~HOTSWAP_STATE_HANDLE_MASK );
  xHotSwapState |= HOTSWAP_STATE_HANDLE_CLOSED;
#endif

  if ( ( xHotSwapState != gHotSwapState )
       || gHotSwapQuiesce )
  {
    // If we need to send a quiesce ack... now is the time.
    if ( gHotSwapQuiesce )
    {
      gHotSwapQuiesce = FALSE;
      ipmi_send_sensor_event ( SENSOR_HOTSWAP_NUM, // Sensor Number
                               HOTSWAP_EVENT_QUIESCED, // Event Code
                               SENSOR_TYPE_HOTSWAP, // Sensor Type
                               SENSOR_EVENT_GA ); // Sensor Direction
    }
    else
    {
      gHotSwapState = xHotSwapState;
      dprintf ( "[SDR] Broadcasting Hotswap Event.\r\n" );

      // Send the event, this takes a slightly different form to get sensor
      if ( xHotSwapState & HOTSWAP_STATE_HANDLE_CLOSED )
        ipmi_send_sensor_event ( SENSOR_HOTSWAP_NUM,
                                 HOTSWAP_EVENT_CLOSED,
                                 SENSOR_TYPE_HOTSWAP,
                                 SENSOR_EVENT_GA );
      else
        ipmi_send_sensor_event ( SENSOR_HOTSWAP_NUM,
                                 HOTSWAP_EVENT_OPENED,
                                 SENSOR_TYPE_HOTSWAP,
                                 SENSOR_EVENT_GA );
    }

    //dprintf("NOTE: Sending sensor event...\n");
  }
}

void sdr_hotswap_quiesce()
{
  // If we turn the power off... we never turn the power back on?
  // It seems the AMC spec has no "turn FRU back on" message!
  //#if MINI_T5_REV > 1
  //	// Just turn the power off via the enable line
  //	gpio_clr_gpio_pin(PWR_GPIO_ENABLE);
  //#endif
  dprintf ( "NOTE: Module now in quiesced state.\n" );
  gHotSwapQuiesce = TRUE;
}

void sdr_set_temp_reading ( U8 pTempSensor, float pTemp )
{
  // Only Rev > 1 boards support temperature
#if MINI_T5_REV > 1
  U8 xNewState = gTemp1State;
  U8 xEventCode = 0x00;

  if ( pTempSensor != 0 )
  {
    return;
  }

  // We have to truncate pTemp down to an int now.
  gTemp1 = pTemp;

  switch ( gTemp1State )
  {
    case SENSOR_STATE_NORMAL:

      if ( gTemp1 >= ( ( S8 ) SDR2[SDR_UPPER_NC_OFST] )
           + ( ( S8 ) SDR2[SDR_GH_HYST_OFST] ) )
      {
        xNewState = SENSOR_STATE_ABOVE_NC;
        xEventCode = SENSOR_TRANS_UNC_GH;
      }

      if ( gTemp1 <= ( ( S8 ) SDR2[SDR_LOWER_NC_OFST] )
           + ( ( S8 ) SDR2[SDR_GL_HYST_OFST] ) )
      {
        xNewState = SENSOR_STATE_BELOW_NC;
        xEventCode = SENSOR_TRANS_LNC_GL;
      }

      break;
    case SENSOR_STATE_ABOVE_NC:

      if ( gTemp1 >= ( ( S8 ) SDR2[SDR_UPPER_C_OFST] )
           + ( ( S8 ) SDR2[SDR_GH_HYST_OFST] ) )
      {
        xNewState = SENSOR_STATE_ABOVE_C;
        xEventCode = SENSOR_TRANS_UC_GH;
      }

      if ( gTemp1 <= ( ( S8 ) SDR2[SDR_UPPER_NC_OFST] )
           + ( ( S8 ) SDR2[SDR_GL_HYST_OFST] ) )
      {
        xNewState = SENSOR_STATE_NORMAL;
        xEventCode = SENSOR_TRANS_UNC_GL;
      }

      break;
    case SENSOR_STATE_ABOVE_C:

      if ( gTemp1 >= ( ( S8 ) SDR2[SDR_UPPER_NR_OFST] )
           + ( ( S8 ) SDR2[SDR_GH_HYST_OFST] ) )
      {
        xNewState = SENSOR_STATE_ABOVE_NR;
        xEventCode = SENSOR_TRANS_UNR_GH;
      }

      if ( gTemp1 <= ( ( S8 ) SDR2[SDR_UPPER_C_OFST] )
           + ( ( S8 ) SDR2[SDR_GL_HYST_OFST] ) )
      {
        xNewState = SENSOR_STATE_ABOVE_NC;
        xEventCode = SENSOR_TRANS_UC_GL;
      }

      break;
    case SENSOR_STATE_ABOVE_NR:

      if ( gTemp1 <= ( ( S8 ) SDR2[SDR_UPPER_NR_OFST] )
           + ( ( S8 ) SDR2[SDR_GL_HYST_OFST] ) )
      {
        xNewState = SENSOR_STATE_ABOVE_C;
        xEventCode = SENSOR_TRANS_UNR_GL;
      }

      break;
    case SENSOR_STATE_BELOW_NC:

      if ( gTemp1 <= ( ( S8 ) SDR2[SDR_LOWER_C_OFST] )
           + ( ( S8 ) SDR2[SDR_GL_HYST_OFST] ) )
      {
        xNewState = SENSOR_STATE_BELOW_C;
        xEventCode = SENSOR_TRANS_LC_GL;
      }

      if ( gTemp1 >= ( ( S8 ) SDR2[SDR_LOWER_NC_OFST] )
           + ( ( S8 ) SDR2[SDR_GH_HYST_OFST] ) )
      {
        xNewState = SENSOR_STATE_NORMAL;
        xEventCode = SENSOR_TRANS_LNC_GH;
      }

      break;
    case SENSOR_STATE_BELOW_C:

      if ( gTemp1 <= ( ( S8 ) SDR2[SDR_LOWER_NR_OFST] )
           + ( ( S8 ) SDR2[SDR_GL_HYST_OFST] ) )
      {
        xNewState = SENSOR_STATE_BELOW_NR;
        xEventCode = SENSOR_TRANS_LNR_GL;
      }

      if ( gTemp1 >= ( ( S8 ) SDR2[SDR_LOWER_C_OFST] )
           + ( ( S8 ) SDR2[SDR_GH_HYST_OFST] ) )
      {
        xNewState = SENSOR_STATE_BELOW_NC;
        xEventCode = SENSOR_TRANS_LC_GH;
      }

      break;
    case SENSOR_STATE_BELOW_NR:

      if ( gTemp1 >= ( ( S8 ) SDR2[SDR_LOWER_NR_OFST] )
           + ( ( S8 ) SDR2[SDR_GH_HYST_OFST] ) )
      {
        xNewState = SENSOR_STATE_BELOW_C;
        xEventCode = SENSOR_TRANS_LNR_GH;
      }

      break;
    default:
      break; // Unknown state?
  }

  // Finally we need to check if there are any events
  if ( xNewState != gTemp1State )
  {
    // State changed: Send event...
    dprintf ( "WARN: Temp Sensor State Change! (%d, %d)\n", xNewState, gTemp1 );
    ipmi_send_sensor_event ( SENSOR_BOARDTEMP1_NUM, // Sensor Num
                             xEventCode,                 // Event Info
                             SDR2[SDR_SENSTYPE_OFST],
                             0x01 ); 	 // TODO: Set this right!
    gTemp1State = xNewState;
  }

#endif // MiniT > 1
  return;
}

float sdr_get_temp_reading ( U8 pTempSensor )
{
  if ( pTempSensor == 0 )
  {
    return gTemp1;
  }

  return -1.0f;
}
