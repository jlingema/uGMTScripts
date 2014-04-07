/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 */

#ifndef AVR32_OEM_H_
#define AVR32_OEM_H_

#include "avr32_arch.h"

U8 oem_cmd_null ( U8* pDataIn, U8 pDataInLen,
                  U8* pDataOut, U8* pDataOutLen );
U8 oem_cmd_commit ( U8* pDataIn, U8 pDataInLen,
                    U8* pDataOut, U8* pDataOutLen );
U8 oem_cmd_setmac ( U8* pDataIn, U8 pDataInLen,
                    U8* pDataOut, U8* pDataOutLen );
U8 oem_cmd_setip ( U8* pDataIn, U8 pDataInLen,
                   U8* pDataOut, U8* pDataOutLen );

U8 oem_cmd_setrarp ( U8* pDataIn, U8 pDataInLen,
                     U8* pDataOut, U8* pDataOutLen );

U8 oem_cmd_netinfo ( U8* pDataIn, U8 pDataInLen,
                     U8* pDataOut, U8* pDataOutLen );

U8 oem_cmd_hardreset ( U8* pDataIn, U8 pDataInLen,
                       U8* pDataOut, U8* pDataOutLen );


extern int gNuclearReset;

#define OEM_MINIT_MAGIC0 0xFE
#define OEM_MINIT_MAGIC1 0xEF

struct IPMI_CMD_OEM_MINIT_COMMIT_REQ
{
  U8 Magic[2];
} __attribute__ ( ( __packed__ ) );

struct IPMI_CMD_OEM_MINIT_SETMAC_REQ
{
  U8 MacAddr[6];
} __attribute__ ( ( __packed__ ) );

struct IPMI_CMD_OEM_MINIT_SETIP_REQ
{
  U8 IPAddr[4];
} __attribute__ ( ( __packed__ ) );

struct IPMI_CMD_OEM_MINIT_GETNETINF_RESP
{
  U8 IPAddr[4];
  U8 MACAddr[6];
  U8 UseRARP;
} __attribute__ ( ( __packed__ ) );

#endif /* AVR32_OEM_H_ */
