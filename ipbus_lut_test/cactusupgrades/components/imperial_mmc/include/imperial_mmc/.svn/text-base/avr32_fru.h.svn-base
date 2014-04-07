/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 */

#ifndef AVR32_FRU_H_
#define AVR32_FRU_H_

#include "avr32_arch.h"
#include "avr32_ipmi.h"

#define FRU_WRITE_CC_WRITEPROTECTED 0x80

#define PCIMG_EXT_VERSION 0x04

#define FRU_SET_STATE_COLDRST    0x00
#define FRU_SET_STATE_WARMRST    0x01
#define FRU_SET_STATE_REBOOT     0x02
#define FRU_SET_STATE_QUIESCE    0x04
#define FRU_SET_STATE_POWER_UP   0x05
#define FRU_SET_STATE_POWER_DOWN 0x06

struct IPMI_CMD_FRU_AREA_INFO
{
  U8 AreaSizeLSB;
  U8 AreaSizeMSB;
  U8 AreaAccessMode; // Bit 0 Access width (0 = bytes, 1 = words)
  // Bit [7:1] reserved (set to 0)
} __attribute__ ( ( __packed__ ) );

struct IPMI_CMD_FRU_READ_REQ
{
  U8 FRUDev;
  U8 OffsetLSB;
  U8 OffsetMSB;
  U8 Count;
} __attribute__ ( ( __packed__ ) );

struct IPMI_CMD_PCIMG_GET_PROPS
{
  U8 ExtVersion;
  U8 MaxFRUID;
  U8 DevFRUID;
} __attribute__ ( ( __packed__ ) );

struct IPMI_CMD_PCIMG_FRU_CMD_REQ
{
  U8 Unknown1;
  U8 Unknown2;
  U8 FRUCMD;
} __attribute__ ( ( __packed__ ) );

/* struct for our (non-IPMI-spec) settings. */
struct FRU_USER_SETTINGS
{
  U32 Magic;
  U8 IPAddr[4];
  U8 MacAddr[6];
  U8 IPOptions;
} __attribute__ ( ( __packed__ ) );
#define USER_MAGIC 0xABCDDCBB

// Constants for the IPOptions field in the above struct
#define IP_OPT_USE_RARP ( 0x01 << 0 )
// #define IP_OPT_OFFSET   (1 << 0)
// #define IP_OPT_PROMISC  (1 << 1)
// #define IP_OPT_JUMBO    (1 << 2)
// #define IP_OPT_COMMITED (1 << 7)

/* struct for bootloader settings. */
struct USB_BOOTLDR_SETTINGS
{
  // TODO: Expand out these fields to mean something!
  U32 Reserved1;
  U32 Reserved2;
} __attribute__ ( ( __packed__ ) );

void fru_init();
void fru_load_network();
void fru_save_network();

void fru_set_net_ip ( U8* pIPAddr ); // , U8 pIPOptions );
void fru_get_net_ip ( U8* pIPAddr ); //, U8* pIPOptions );

void fru_set_net_mac ( U8* pMACAddr );
void fru_get_net_mac ( U8* pMACAddr );

void fru_set_net_rarp ( U8* pMACAddr );
void fru_get_net_rarp ( U8* pMACAddr );



U8 fru_cmd_get_inv_area_info ( U8* pDataIn, U8 pDataInLen,
                               U8* pDataOut, U8* pDataOutLen );
U8 fru_cmd_read_data ( U8* pDataIn, U8 pDataInLen,
                       U8* pDataOut, U8* pDataOutLen );
U8 fru_cmd_write_data ( U8* pDataIn, U8 pDataInLen,
                        U8* pDataOut, U8* pDataOutLen );

U8 fru_cmdex_control ( U8* pDataIn, U8 pDataInLen,
                       U8* pDataOut, U8* pDataOutLen );

U8 pcimg_cmdex_get_dev_loc_rec ( U8* pDataIn, U8 pDataInLen,
                                 U8* pDataOut, U8* pDataOutLen );
U8 pcimg_cmdex_set_amc_port_state ( U8* pDataIn, U8 pDataInLen,
                                    U8* pDataOut, U8* pDataOutLen );
U8 pcimg_cmdex_get_amc_port_state ( U8* pDataIn, U8 pDataInLen,
                                    U8* pDataOut, U8* pDataOutLen );


#endif /* AVR32_FRU_H_ */
