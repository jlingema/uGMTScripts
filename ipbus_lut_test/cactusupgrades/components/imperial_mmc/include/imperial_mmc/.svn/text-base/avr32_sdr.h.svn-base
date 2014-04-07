/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 */

#ifndef AVR32_SDR_H_
#define AVR32_SDR_H_

#include "avr32_arch.h"
#include "avr32_ipmi.h"
#include "avr32_pwr.h"

#define SENSOR_TYPE_TEMP     0x01
#define SENSOR_TYPE_VOLTAGE  0x02
#define SENSOR_TYPE_CURRENT  0x03
#define SENSOR_TYPE_PWR_DCDC 0x08
#define SENSOR_TYPE_OTHER    0x0B
#define SENSOR_TYPE_HOTSWAP  0xF2

#define SENSOR_UNIT_NONE      0x00
#define SENSOR_UNIT_DEGREES_C 0x01
#define SENSOR_UNIT_VOLTS     0x04
#define SENSOR_UNIT_AMPS      0x05

#define SENSOR_EVENT_GA 0x6F // Sensor event general availability

#define SENSOR_HOTSWAP_NUM 1
#define SENSOR_BOARDTEMP1_NUM 2
#define SENSOR_12v_NUM 3
#define SENSOR_POWER_NUM 4
#define SENSOR_TEST 5

// Offsets to various fields in the SDR
#define SDR_OFFSET_SENS_TYPE 3
#define SDR_OFFSET_ADDRESS 5
// Offset to Entity instance in a full record
#define SDR_OFFSET_ENT_INSTANCE_FULL 9
// Offset to Entity instance in the device locator record
#define SDR_OFFSET_ENT_INSTANCE_DLR 13


#define HOTSWAP_STATE_HANDLE_CLOSED 0x1
#define HOTSWAP_STATE_HANDLE_OPEN 0x2
#define HOTSWAP_STATE_HANDLE_MASK 0x3
#define HOTSWAP_STATE_QUIESCED 0x2

#define HOTSWAP_EVENT_CLOSED 0x0
#define HOTSWAP_EVENT_OPENED 0x1
#define HOTSWAP_EVENT_QUIESCED 0x2
#define HOTSWAP_EVENT_POWER_FAIL 0x3
#define HOTSWAP_EVENT_POWER_OFF 0x3

#define SENSOR_STATE_NORMAL    0x00
#define SENSOR_STATE_BELOW_NC  0x01 // Below Lower Non-Critical
#define SENSOR_STATE_BELOW_C   0x02 // Below Lower Critical
#define SENSOR_STATE_BELOW_NR  0x04 // Below Lower Non-Recoverable
#define SENSOR_STATE_ABOVE_NC  0x08
#define SENSOR_STATE_ABOVE_C   0x10
#define SENSOR_STATE_ABOVE_NR  0x20

#define SENSOR_TRANS_LNC_GL    0x00
#define SENSOR_TRANS_LNC_GH    0x01
#define SENSOR_TRANS_LC_GL     0x02
#define SENSOR_TRANS_LC_GH     0x03
#define SENSOR_TRANS_LNR_GL    0x04
#define SENSOR_TRANS_LNR_GH    0x05
#define SENSOR_TRANS_UNC_GL    0x06
#define SENSOR_TRANS_UNC_GH    0x07
#define SENSOR_TRANS_UC_GL     0x08
#define SENSOR_TRANS_UC_GH     0x09
#define SENSOR_TRANS_UNR_GL    0x0A
#define SENSOR_TRANS_UNR_GH    0x0B

// Offsets of various fields in the SDR records
#define SDR_LOWER_NC_OFST 41
#define SDR_LOWER_C_OFST  40
#define SDR_LOWER_NR_OFST 39
#define SDR_UPPER_NC_OFST 38
#define SDR_UPPER_C_OFST  37
#define SDR_UPPER_NR_OFST 36
#define SDR_SENSTYPE_OFST 12
#define SDR_SENSDIR_OFST 28
#define SDR_GH_HYST_OFST 42
#define SDR_GL_HYST_OFST 43

extern U32 gDummySensor;

struct IPMI_CMD_SDR_INFO_RESP
{
  U8 Count;
  U8 SensorPop; // Sensor population
} __attribute__ ( ( __packed__ ) );

struct IPMI_CMD_SDR_RESV_RESP
{
  U8 ResvID_LSB;
  U8 ResvID_MSB;
} __attribute__ ( ( __packed__ ) );

struct IPMI_CMD_SDR_GET_DEV_LOC_RESP
{
  U8 SensID_LSB;
  U8 SensID_MSB;
} __attribute__ ( ( __packed__ ) );

struct IPMI_CMD_SDR_GET_RESP
{
  U8 ResvID_LSB;
  U8 ResvID_MSB;
  U8 RecID_LSB;
  U8 RecID_MSB;
  U8 Offset;
  U8 Count;
} __attribute__ ( ( __packed__ ) );

struct IPMI_CMD_GET_SENSOR_READING_RESP
{
  U8 Reading;
  U8 EvntFlags;
  U8 StateBits;
  U8 Reserved1;
} __attribute__ ( ( __packed__ ) );

void sdr_init ( U8 pMyAddr );

U8 pcimg_cmdex_get_props ( U8* pDataIn, U8 pDataInLen,
                           U8* pDataOut, U8* pDataOutLen );
U8 sdr_cmd_sdr_info ( U8* pDataIn, U8 pDataInLen,
                      U8* pDataOut, U8* pDataOutLen );
U8 sdr_cmd_get_sdr ( U8* pDataIn, U8 pDataInLen,
                     U8* pDataOut, U8* pDataOutLen );
U8 sdr_cmd_reserve_repository ( U8* pDataIn, U8 pDataInLen,
                                U8* pDataOut, U8* pDataOutLen );
U8 sdr_cmd_get_sensor_threshold ( U8* pDataIn, U8 pDataInLen,
                                  U8* pDataOut, U8* pDataOutLen );
void sdr_blank_readings ( U8 pStart, U8 pEnd, U8 pVal );
void sdr_store_reading ( U8 pSensor, S8 pValue );
U8 sdr_cmd_get_sensor_reading ( U8* pDataIn, U8 pDataInLen,
                                U8* pDataOut, U8* pDataOutLen );
void sdr_set_temp_reading ( U8 pTempSensor, float pTemp );
void sdr_poll ( void );
void sdr_hotswap_quiesce ( void );
float sdr_get_temp_reading ( U8 pTempSensor );

#endif /* AVR32_SDR_H_ */
