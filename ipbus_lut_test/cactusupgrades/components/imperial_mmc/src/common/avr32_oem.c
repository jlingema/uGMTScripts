/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 * These function handle any OEM requests that arrive over IPMI.
 * The bytes sent by the user as parameters are passed into the
 * pDataIn parameter and any bytes we want to send back can be put
 * into pDataOut.
 *
 * Generally these functions implement the storing of an IP & MAC
 * address that is sent from a PC connected to the crate's out-of-band
 * network interface using IPMI.
 *
 */

#include "imperial_mmc/avr32_oem.h"
#include "imperial_mmc/avr32_arch.h"
#include "imperial_mmc/avr32_ipmi.h"
#include "imperial_mmc/avr32_fru.h"
// For testing
#include "imperial_mmc/avr32_usb.h"

U8 oem_cmd_null ( U8* pDataIn, U8 pDataInLen,
                  U8* pDataOut, U8* pDataOutLen )
{
  dprintf ( "[OEM] Null/Ping Command!\n" );
  *pDataOutLen = 0x00;
  return IPMI_CC_OK;
}

U8 oem_cmd_commit ( U8* pDataIn, U8 pDataInLen,
                    U8* pDataOut, U8* pDataOutLen )
{
  *pDataOutLen = 0x00;
  dprintf ( "[OEM] Network Commit Command!\n" );

  if ( pDataInLen != sizeof ( struct IPMI_CMD_OEM_MINIT_COMMIT_REQ ) )
  {
    return IPMI_CC_REQ_DATA_INV_LENGTH;
  }

  struct IPMI_CMD_OEM_MINIT_COMMIT_REQ* xRequest =
    ( struct IPMI_CMD_OEM_MINIT_COMMIT_REQ* ) pDataIn;

  if ( ( xRequest->Magic[0] != OEM_MINIT_MAGIC0 ) ||
       ( xRequest->Magic[1] != OEM_MINIT_MAGIC1 ) )
  {
    dprintf ( "[OEM] Magic Number Mismatch!\n" );
    return IPMI_CC_INV_DATA_FIELD_IN_REQ;
  }

  fru_save_network();
  return IPMI_CC_OK;
}

U8 oem_cmd_setmac ( U8* pDataIn, U8 pDataInLen,
                    U8* pDataOut, U8* pDataOutLen )
{
  *pDataOutLen = 0x00;
  dprintf ( "[OEM] Network Set MAC Command!\n" );

  if ( pDataInLen != sizeof ( struct IPMI_CMD_OEM_MINIT_SETMAC_REQ ) )
  {
    return IPMI_CC_REQ_DATA_INV_LENGTH;
  }

  struct IPMI_CMD_OEM_MINIT_SETMAC_REQ* xRequest =
    ( struct IPMI_CMD_OEM_MINIT_SETMAC_REQ* ) pDataIn;

  fru_set_net_mac ( xRequest->MacAddr );

  return IPMI_CC_OK;
}

U8 oem_cmd_setip ( U8* pDataIn, U8 pDataInLen,
                   U8* pDataOut, U8* pDataOutLen )
{
  *pDataOutLen = 0x00;
  dprintf ( "[OEM] Network Set IP Command!\n" );

  if ( pDataInLen != sizeof ( struct IPMI_CMD_OEM_MINIT_SETIP_REQ ) )
  {
    return IPMI_CC_REQ_DATA_INV_LENGTH;
  }

  struct IPMI_CMD_OEM_MINIT_SETIP_REQ* xRequest =
    ( struct IPMI_CMD_OEM_MINIT_SETIP_REQ* ) pDataIn;

  fru_set_net_ip ( xRequest->IPAddr ); // , 0x00 ); // We don't support any options yet

  return IPMI_CC_OK;
}


U8 oem_cmd_setrarp ( U8* pDataIn, U8 pDataInLen,
                     U8* pDataOut, U8* pDataOutLen )
{
  *pDataOutLen = 0x00;
  dprintf ( "[OEM] Network Set RARP Command!\n" );

  if ( pDataInLen != 1 )
  {
    return IPMI_CC_REQ_DATA_INV_LENGTH;
  }

  fru_set_net_rarp ( pDataIn );
  return IPMI_CC_OK;
}


U8 oem_cmd_netinfo ( U8* pDataIn, U8 pDataInLen,
                     U8* pDataOut, U8* pDataOutLen )
{
  *pDataOutLen = 0x00;
  dprintf ( "[OEM] Network Get Info Command!\n" );

  if ( pDataInLen != 0 )
  {
    return IPMI_CC_REQ_DATA_INV_LENGTH;
  }

  struct IPMI_CMD_OEM_MINIT_GETNETINF_RESP* xResp =
    ( struct IPMI_CMD_OEM_MINIT_GETNETINF_RESP* ) pDataOut;

  *pDataOutLen = sizeof ( struct IPMI_CMD_OEM_MINIT_GETNETINF_RESP );

  fru_get_net_ip ( xResp->IPAddr ); //, & ( xResp->IPOptions ) );

  fru_get_net_mac ( xResp->MACAddr );

  fru_get_net_rarp ( & ( xResp->UseRARP ) );

  return IPMI_CC_OK;
}


int gNuclearReset = 0;


U8 oem_cmd_hardreset ( U8* pDataIn, U8 pDataInLen,
                       U8* pDataOut, U8* pDataOutLen )
{
  *pDataOutLen = 0x00;
  dprintf ( "[OEM] Nuclear reset!\n" );

  if ( pDataInLen != 2 )
  {
    return IPMI_CC_REQ_DATA_INV_LENGTH;
  }

  if ( pDataIn[0] != 0xDE && pDataIn[1] != 0xAD )
  {
    dprintf ( "[OEM] Magic Number Mismatch!\n" );
    return IPMI_CC_INV_DATA_FIELD_IN_REQ;
  }

  gNuclearReset = 1;
  return IPMI_CC_OK;
}
