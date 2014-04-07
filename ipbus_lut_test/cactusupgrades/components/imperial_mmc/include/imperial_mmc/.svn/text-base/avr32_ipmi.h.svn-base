/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 */

#ifndef AVR32_IPMI_H_
#define AVR32_IPMI_H_

#include "avr32_arch.h"

/* Various bits of static version data */
#define IPMI_DEVICE_ID 0x00
#define IPMI_DEVICE_REV 0x80 // Upper bit = Provides SDRs
#define IPMI_DEVICE_FW_MAJ 0x01 // Major FW version (Binary, 7bits)
#define IPMI_DEVICE_FW_MIN 0x00 // Minor FW version (BCD, 8bits)
#define IPMI_RELEASE_VER 0x51 // Version of IPMI release we are using (v1.5)
#define IPMI_ADDITIONAL_DEV_SUPP 0x3A // Complex bitmask (See SPEC docs)
// We support FRU, SDR & Send/Recv Events
#define IPMI_MANUF_ID 0x0060 // Manufacturer ID (96 = CERN = 0x60)
#define IPMI_PRODUCT_ID 0x0193 // Product ID (403 = Imperial MMC = 0x193)

#define IPMI_BUFFER_LEN 128

// Maximum response packet payload size
#define IPMI_RESP_PAYLOAD_LEN (IPMB_BUF_LEN - 10)

#define IPMC_ADDRESS 0x20

// The netfunction field's LSB is set if the message is a reply
// Because the LUN takes the lowest 2 bits in the field, we set the 3rd bit
#define IPMI_NETFUN_REPLY_MASK 0x4
#define IPMI_LUN_MASK 0x03


extern bool gIPMI_needs_checking;


// A typedef for functions which fill-out data
typedef U8 ( *ipmi_data_fn ) ( U8* pDataIn, U8 pDataInLen,
                               U8* pDataOut, U8* pDataOutLen );

U8 ipmi_checksum ( U8 pBuffer[], U8 pLen );
void ipmi_init ( U8 pMyAddr );
void ipmi_process();
void ipmi_data_process ( U8* pData, U8 pLen );
void ipmi_data_rx ( U8* pData, U8 pLen );

void ipmi_send_sensor_event ( U8 pSensNum,
                              U8 pEvntData,
                              U8 pSensType,
                              U8 pSensDir );
U8 ipmi_cmd_get_id ( U8* pDataIn, U8 pDataInLen,
                     U8* pDataOut, U8* pDataOutLen );
U8 ipmi_cmd_set_evnt_receiver ( U8* pDataIn, U8 pDataInLen,
                                U8* pDataOut, U8* pDataOutLen );
U8 ipmi_cmd_get_evnt_receiver ( U8* pDataIn, U8 pDataInLen,
                                U8* pDataOut, U8* pDataOutLen );
U8 ipmi_evnt_receiver_set ( void );

// This is a library of structures which describe possible ipmi packets
// This could be done as a large union, but that would probably be messier.

struct IPMI_MSG
{
  //U8 slaveAddr; // Slave address is handled by i2c layer
  U8 netfun;
  U8 chk1; // First Checksum
  U8 rqSA; // Request sender address
  U8 seqNum; // Request sequence number
  U8 cmdType; // Platform command type
} __attribute__ ( ( __packed__ ) );

// A struct for get FRU info area (IPMI2 SPEC 34.1)
struct IPMI_CMD_FRU_AREA_INFO_REQ
{
  U8 fru_id;
} __attribute__ ( ( __packed__ ) );
#define IPMI_CMD_FRU_AREA_INFO_REQ_LEN (sizeof(struct IPMI_CMD_FRU_AREA_INFO_REQ))

void ipmi_send_response ( struct IPMI_MSG* pOrigMsg,
                          U8 pRetCode, U8* pData, U8 pLen );

#define IPMI_MSG_LEN (sizeof(struct IPMI_MSG))

struct IPMI_MSG_SENSOR_EVENT
{
  U8 msgrev; // Set to 0x04
  U8 sens_type;
  U8 sens_num;
  U8 direction;
  U8 event_data1;
  U8 event_data2;
  U8 event_data3;
} __attribute__ ( ( __packed__ ) );

#define IPMI_MSG_SENSOR_EVENT_LEN (sizeof(struct IPMI_MSG_SENSOR_EVENT))

#define IPMI_MSG_SENSOR_REVISION 0x04

// Structs which define response data (IPMIv2.0 SPEC page 243)
struct IPMI_CMD_ID_RESP
{
  U8 devID;
  U8 devRev; // And SDRs?
  U8 fwRev1; // Firmware Rev 1 (Major)(Binary)
  U8 fwRev2; // Firmware Rev 2 (Minor)(BCD)
  U8 ipmiver; // IPMI version (BCD)
  U8 adddevsup; // Additional device support
  U8 manufacID1; // Manufacturer ID (Upper byte)
  U8 manufacID2; // Manufacturer ID (Middle byte)
  U8 manufacID3; // Manufacturer ID (Lower byte)
  U8 productID1; // Product ID (Upper byte)
  U8 productID2; // Product ID (Lower byte)
} __attribute__ ( ( __packed__ ) );

// IPMI Constants
#define IPMI_CHASSIS_NETFN			0x00
#define IPMI_BRIDGE_NETFN			0x02
#define IPMI_SENSOR_EVENT_NETFN		0x04
#define IPMI_APP_NETFN				0x06
#define IPMI_FIRMWARE_NETFN			0x08
#define IPMI_STORAGE_NETFN			0x0a
#define IPMI_TRANSPORT_NETFN		0x0c
#define IPMI_GROUP_EXTENSION_NETFN	0x2c
#define IPMI_OEM_GROUP_NETFN		0x2e
#define IPMI_CONTROLLER_SPECIFIC    0x30

/* Sensor/Event netfn (0x04) */
#define IPMI_SET_EVENT_RECEIVER_CMD		0x00
#define IPMI_GET_EVENT_RECEIVER_CMD		0x01
#define IPMI_PLATFORM_EVENT_CMD			0x02
#define IPMI_GET_PEF_CAPABILITIES_CMD		0x10
#define IPMI_ARM_PEF_POSTPONE_TIMER_CMD		0x11
#define IPMI_SET_PEF_CONFIG_PARMS_CMD		0x12
#define IPMI_GET_PEF_CONFIG_PARMS_CMD		0x13
#define IPMI_SET_LAST_PROCESSED_EVENT_ID_CMD	0x14
#define IPMI_GET_LAST_PROCESSED_EVENT_ID_CMD	0x15
#define IPMI_ALERT_IMMEDIATE_CMD		0x16
#define IPMI_PET_ACKNOWLEDGE_CMD		0x17
#define IPMI_GET_DEVICE_SDR_INFO_CMD		0x20
#define IPMI_GET_DEVICE_SDR_CMD			0x21
#define IPMI_RESERVE_DEVICE_SDR_REPOSITORY_CMD	0x22
#define IPMI_GET_SENSOR_READING_FACTORS_CMD	0x23
#define IPMI_SET_SENSOR_HYSTERESIS_CMD		0x24
#define IPMI_GET_SENSOR_HYSTERESIS_CMD		0x25
#define IPMI_SET_SENSOR_THRESHOLD_CMD		0x26
#define IPMI_GET_SENSOR_THRESHOLD_CMD		0x27
#define IPMI_SET_SENSOR_EVENT_ENABLE_CMD	0x28
#define IPMI_GET_SENSOR_EVENT_ENABLE_CMD	0x29
#define IPMI_REARM_SENSOR_EVENTS_CMD		0x2a
#define IPMI_GET_SENSOR_EVENT_STATUS_CMD	0x2b
#define IPMI_GET_SENSOR_READING_CMD		0x2d
#define IPMI_SET_SENSOR_TYPE_CMD		0x2e
#define IPMI_GET_SENSOR_TYPE_CMD		0x2f

/* The Group Extension defined for PICMG. */
#define IPMI_PICMG_GRP_EXT		0

/* PICMG Commands */
#define IPMI_PICMG_CMD_GET_PROPERTIES							0x00
#define IPMI_PICMG_CMD_GET_ADDRESS_INFO							0x01
#define IPMI_PICMG_CMD_GET_SHELF_ADDRESS_INFO					0x02
#define IPMI_PICMG_CMD_SET_SHELF_ADDRESS_INFO					0x03
#define IPMI_PICMG_CMD_FRU_CONTROL								0x04
#define IPMI_PICMG_CMD_GET_FRU_LED_PROPERTIES					0x05
#define IPMI_PICMG_CMD_GET_LED_COLOR_CAPABILITIES				0x06
#define IPMI_PICMG_CMD_SET_FRU_LED_STATE						0x07
#define IPMI_PICMG_CMD_GET_FRU_LED_STATE						0x08
#define IPMI_PICMG_CMD_SET_IPMB_STATE							0x09
#define IPMI_PICMG_CMD_SET_FRU_ACTIVATION_POLICY				0x0a
#define IPMI_PICMG_CMD_GET_FRU_ACTIVATION_POLICY				0x0b
#define IPMI_PICMG_CMD_SET_FRU_ACTIVATION						0x0c
#define IPMI_PICMG_CMD_GET_DEVICE_LOCATOR_RECORD				0x0d
#define IPMI_PICMG_CMD_SET_PORT_STATE							0x0e
#define IPMI_PICMG_CMD_GET_PORT_STATE							0x0f
#define IPMI_PICMG_CMD_COMPUTE_POWER_PROPERTIES					0x10
#define IPMI_PICMG_CMD_SET_POWER_LEVEL							0x11
#define IPMI_PICMG_CMD_GET_POWER_LEVEL							0x12
#define IPMI_PICMG_CMD_RENEGOTIATE_POWER						0x13
#define IPMI_PICMG_CMD_GET_FAN_SPEED_PROPERTIES					0x14
#define IPMI_PICMG_CMD_SET_FAN_LEVEL							0x15
#define IPMI_PICMG_CMD_GET_FAN_LEVEL							0x16
#define IPMI_PICMG_CMD_BUSED_RESOURCE							0x17
#define IPMI_PICMG_CMD_IPMB_LINK_INFO							0x18
#define IPMI_PICMG_CMD_SET_AMC_PORT_STATE               		0x19
#define IPMI_PICMG_CMD_GET_AMC_PORT_STATE               		0x1a
#define IPMI_PICMG_CMD_SHELF_MANAGER_IPMB_ADDRESS				0x1b
#define IPMI_PICMG_CMD_SET_FAN_POLICY							0x1c
#define IPMI_PICMG_CMD_GET_FAN_POLICY							0x1d
#define IPMI_PICMG_CMD_FRU_CONTROL_CAPABILITIES					0x1e
#define IPMI_PICMG_CMD_FRU_INVENTORY_DEVICE_LOCK_CONTROL		0x1f
#define IPMI_PICMG_CMD_FRU_INVENTORY_DEVICE_WRITE				0x20
#define IPMI_PICMG_CMD_GET_SHELF_MANAGER_IP_ADDRESSES			0x21
#define IPMI_PICMG_CMD_SHELF_POWER_ALLOCATION           		0x22

/* App netfn (0x06) */
#define IPMI_GET_DEVICE_ID_CMD									0x01
#define IPMI_BROADCAST_GET_DEVICE_ID_CMD						0x01
#define IPMI_COLD_RESET_CMD										0x02
#define IPMI_WARM_RESET_CMD										0x03
#define IPMI_GET_SELF_TEST_RESULTS_CMD							0x04
#define IPMI_MANUFACTURING_TEST_ON_CMD							0x05
#define IPMI_SET_ACPI_POWER_STATE_CMD							0x06
#define IPMI_GET_ACPI_POWER_STATE_CMD							0x07
#define IPMI_GET_DEVICE_GUID_CMD								0x08
#define IPMI_RESET_WATCHDOG_TIMER_CMD							0x22
#define IPMI_SET_WATCHDOG_TIMER_CMD								0x24
#define IPMI_GET_WATCHDOG_TIMER_CMD								0x25
#define IPMI_SET_BMC_GLOBAL_ENABLES_CMD							0x2e
#define IPMI_GET_BMC_GLOBAL_ENABLES_CMD							0x2f
#define IPMI_CLEAR_MSG_FLAGS_CMD								0x30
#define IPMI_GET_MSG_FLAGS_CMD									0x31
#define IPMI_ENABLE_MESSAGE_CHANNEL_RCV_CMD						0x32
#define IPMI_GET_MSG_CMD										0x33
#define IPMI_SEND_MSG_CMD										0x34
#define IPMI_READ_EVENT_MSG_BUFFER_CMD							0x35
#define IPMI_GET_BT_INTERFACE_CAPABILITIES_CMD					0x36
#define IPMI_GET_SYSTEM_GUID_CMD								0x37
#define IPMI_GET_CHANNEL_AUTH_CAPABILITIES_CMD					0x38
#define IPMI_GET_SESSION_CHALLENGE_CMD							0x39
#define IPMI_ACTIVATE_SESSION_CMD								0x3a
#define IPMI_SET_SESSION_PRIVILEGE_CMD							0x3b
#define IPMI_CLOSE_SESSION_CMD									0x3c
#define IPMI_GET_SESSION_INFO_CMD								0x3d
#define IPMI_GET_AUTHCODE_CMD									0x3f
#define IPMI_SET_CHANNEL_ACCESS_CMD								0x40
#define IPMI_GET_CHANNEL_ACCESS_CMD								0x41
#define IPMI_GET_CHANNEL_INFO_CMD								0x42
#define IPMI_SET_USER_ACCESS_CMD								0x43
#define IPMI_GET_USER_ACCESS_CMD								0x44
#define IPMI_SET_USER_NAME_CMD									0x45
#define IPMI_GET_USER_NAME_CMD									0x46
#define IPMI_SET_USER_PASSWORD_CMD								0x47
#define IPMI_ACTIVATE_PAYLOAD_CMD								0x48
#define IPMI_DEACTIVATE_PAYLOAD_CMD								0x49
#define IPMI_GET_PAYLOAD_ACTIVATION_STATUS_CMD					0x4a
#define IPMI_GET_PAYLOAD_INSTANCE_INFO_CMD						0x4b
#define IPMI_SET_USER_PAYLOAD_ACCESS_CMD						0x4c
#define IPMI_GET_USER_PAYLOAD_ACCESS_CMD						0x4d
#define IPMI_GET_CHANNEL_PAYLOAD_SUPPORT_CMD					0x4e
#define IPMI_GET_CHANNEL_PAYLOAD_VERSION_CMD					0x4f
#define IPMI_GET_CHANNEL_OEM_PAYLOAD_INFO_CMD					0x50
#define IPMI_MASTER_READ_WRITE_CMD								0x52
#define IPMI_GET_CHANNEL_CIPHER_SUITES_CMD						0x54
#define IPMI_SUSPEND_RESUME_PAYLOAD_ENCRYPTION_CMD 				0x55
#define IPMI_SET_CHANNEL_SECURITY_KEY_CMD						0x56
#define IPMI_GET_SYSTEM_INTERFACE_CAPABILITIES_CMD 				0x57


/* Storage netfn (0x0a) */
#define IPMI_GET_FRU_INVENTORY_AREA_INFO_CMD					0x10
#define IPMI_READ_FRU_DATA_CMD									0x11
#define IPMI_WRITE_FRU_DATA_CMD									0x12
#define IPMI_GET_SDR_REPOSITORY_INFO_CMD						0x20
#define IPMI_GET_SDR_REPOSITORY_ALLOC_INFO_CMD					0x21
#define IPMI_RESERVE_SDR_REPOSITORY_CMD							0x22
#define IPMI_GET_SDR_CMD										0x23
#define IPMI_ADD_SDR_CMD										0x24
#define IPMI_PARTIAL_ADD_SDR_CMD								0x25
#define IPMI_DELETE_SDR_CMD										0x26
#define IPMI_CLEAR_SDR_REPOSITORY_CMD							0x27
#define IPMI_GET_SDR_REPOSITORY_TIME_CMD						0x28
#define IPMI_SET_SDR_REPOSITORY_TIME_CMD						0x29
#define IPMI_ENTER_SDR_REPOSITORY_UPDATE_CMD					0x2a
#define IPMI_EXIT_SDR_REPOSITORY_UPDATE_CMD						0x2b
#define IPMI_RUN_INITIALIZATION_AGENT_CMD						0x2c
#define IPMI_GET_SEL_INFO_CMD									0x40
#define IPMI_GET_SEL_ALLOCATION_INFO_CMD						0x41
#define IPMI_RESERVE_SEL_CMD									0x42
#define IPMI_GET_SEL_ENTRY_CMD									0x43
#define IPMI_ADD_SEL_ENTRY_CMD									0x44
#define IPMI_PARTIAL_ADD_SEL_ENTRY_CMD							0x45
#define IPMI_DELETE_SEL_ENTRY_CMD								0x46
#define IPMI_CLEAR_SEL_CMD										0x47
#define IPMI_GET_SEL_TIME_CMD									0x48
#define IPMI_SET_SEL_TIME_CMD									0x49
#define IPMI_GET_AUXILIARY_LOG_STATUS_CMD						0x5a
#define IPMI_SET_AUXILIARY_LOG_STATUS_CMD						0x5b

/* "Well known" FRU IDs */
#define BACKPLANE_FRU_ID	253

/* OEM Specific (Mini-T) (0x30) */
#define IPMI_OEM_MINIT_NULL										0x00
#define IPMI_OEM_MINIT_COMMIT									0x01
#define IPMI_OEM_MINIT_SETMAC									0x02
#define IPMI_OEM_MINIT_SETIP									0x03
#define IPMI_OEM_MINIT_SETRARP                  0x04
#define IPMI_OEM_MINIT_GETNETINFO								0x05
#define IPMI_OEM_MINIT_HARDRESET                0xFF

/*
 * CC
 * IPMI specification table 5-2 Generic Completion Codes
 */

#define IPMI_CC_OK                                 0x00
#define IPMI_CC_NODE_BUSY                          0xc0
#define IPMI_CC_INV_CMD                            0xc1
#define IPMI_CC_INV_CMD_FOR_LUN                    0xc2
#define IPMI_CC_TIMEOUT                            0xc3
#define IPMI_CC_OUT_OF_SPACE                       0xc4
#define IPMI_CC_RES_CANCELED                       0xc5
#define IPMI_CC_REQ_DATA_TRUNC                     0xc6
#define IPMI_CC_REQ_DATA_INV_LENGTH                0xc7
#define IPMI_CC_REQ_DATA_FIELD_EXCEED              0xc8
#define IPMI_CC_PARAM_OUT_OF_RANGE                 0xc9
#define IPMI_CC_CANT_RET_NUM_REQ_BYTES             0xca
#define IPMI_CC_REQ_DATA_NOT_PRESENT               0xcb
#define IPMI_CC_INV_DATA_FIELD_IN_REQ              0xcc
#define IPMI_CC_ILL_SENSOR_OR_RECORD               0xcd
#define IPMI_CC_RESP_COULD_NOT_BE_PRV              0xce
#define IPMI_CC_CANT_RESP_DUPLI_REQ                0xcf
#define IPMI_CC_CANT_RESP_SDRR_UPDATE              0xd0
#define IPMI_CC_CANT_RESP_FIRM_UPDATE              0xd1
#define IPMI_CC_CANT_RESP_BMC_INIT                 0xd2
#define IPMI_CC_DESTINATION_UNAVAILABLE            0xd3
#define IPMI_CC_INSUFFICIENT_PRIVILEGES            0xd4
#define IPMI_CC_NOT_SUPPORTED_PRESENT_STATE        0xd5
#define IPMI_CC_ILLEGAL_COMMAND_DISABLED           0xd6
#define IPMI_CC_UNSPECIFIED_ERROR                  0xff


#endif /* AVR32_IPMI_H_ */
