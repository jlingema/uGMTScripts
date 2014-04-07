/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 * These functions handle the IPMI FRU area in the user page of the CPU.
 * Other user settings are also handled by this file so they can be stored
 * in the same area of the on-chip EEPROM.
 *
 * The fru_cmd_* functions provide the direct IPMI interface for reading &
 * writing the FRU data.
 *
 * The other functions handle setting and getting the other user settings
 * that may be in the EEPROM.
 */

#include "imperial_mmc/avr32_fru.h"

#include "imperial_mmc/avr32_arch.h"
// Needed for ipmi_checksum
#include "imperial_mmc/avr32_ipmi.h"
#include "imperial_mmc/avr32_led.h"
#include "imperial_mmc/avr32_sdr.h"

volatile U8* gUserPage =
  ( volatile U8* ) AVR32_FLASHC_USER_PAGE_ADDRESS;

#if defined(MINI_T5_REV)
#include "mini_t5/mini_t5.fru.h"
#elif defined(MP7_REV)
#include "mp7/mp7.fru.h"
#else
#error "No FRU header found for this board."
#endif

// In-flash settings
// These live at the end of the user page,
// while avoiding the two 32bit words used for boot loader settings right at the end!
volatile struct FRU_USER_SETTINGS* gFlashUserSettings =
  ( volatile struct FRU_USER_SETTINGS* ) ( AVR32_FLASHC_USER_PAGE_ADDRESS +
      AVR32_FLASHC_USER_PAGE_SIZE - sizeof ( struct FRU_USER_SETTINGS )
      - sizeof ( struct USB_BOOTLDR_SETTINGS ) );

// In-memory settings (these are the defaults)
static struct FRU_USER_SETTINGS gMemUserSettings =
{
  .Magic = USER_MAGIC,
  // Default IP
  .IPAddr = { 192, 168, 0, 135 },
  // Default MAC
  .MacAddr = { 0x00 , 0x0a ,0x35, 0x01, 0xea, 0xf3 },
  // Offset the IP with the slot number
  .IPOptions = 0
};


// Set to true if IP is changed but not saved
static Bool gChanges = FALSE;


void fru_recalc_checksums()
{
  // There are a number of checksums in the FRU area
  // It's easier to calculate them at start-up than to hard-code the values in
  // We only need to do this if we're writing the user page...
  // Is there a better way of doing this? I couldn't think of one...
  // Board Info Area
  gFRU_Info[FRU_BOARD_CHKPOS] = ipmi_checksum ( &gFRU_Info[FRU_BOARD_START],
                                FRU_BOARD_LEN );
  // Product Info Area
  gFRU_Info[FRU_PROD_CHKPOS] = ipmi_checksum ( &gFRU_Info[FRU_PROD_START],
                               FRU_PROD_LEN );
  // Multi-record area 1) Record
  gFRU_Info[FRU_MRAR_CHKPOS] = ipmi_checksum ( &gFRU_Info[FRU_MRAR_START],
                               FRU_MRAR_LEN );
  // Multi-record area 1) Header
  gFRU_Info[FRU_MRAH_CHKPOS] = ipmi_checksum ( &gFRU_Info[FRU_MRAH_START],
                               FRU_MRAH_LEN );
  // Multi-record area 2) Record
  //gFRU_Info[94] = ipmi_checksum(&(gFRU_Info[96]), 16);
  // Multi-record area 2) Header
  //gFRU_Info[95] = ipmi_checksum(&(gFRU_Info[91]), 4);
}

void fru_load_network()
{
  // Load our network settings from flash,
  // but only if the flash area is good
  if ( gFlashUserSettings->Magic == USER_MAGIC )
  {
    dprintf ( "Network-settings Area OK!\n" );
    memcpy ( &gMemUserSettings,
             ( const void* ) gFlashUserSettings,
             sizeof ( struct FRU_USER_SETTINGS ) );
    dprintf ( "Network-settings: IP: %u.%u.%u.%u , MAC: %02lX:%02lX:%02lX:%02lX:%02lX:%02lX\n",
              gMemUserSettings.IPAddr[0], gMemUserSettings.IPAddr[1], gMemUserSettings.IPAddr[2], gMemUserSettings.IPAddr[3],
              gMemUserSettings.MacAddr[0], gMemUserSettings.MacAddr[1], gMemUserSettings.MacAddr[2], gMemUserSettings.MacAddr[3], gMemUserSettings.MacAddr[4], gMemUserSettings.MacAddr[5]
            );
  }
  else
  {
    dprintf ( "Network-settings Area BAD!\n" );
  }
}

void fru_save_network()
{
  // Save the network settings back to the flash page
  dprintf ( "Saving network-settings to flash!\n" );
  dprintf ( "Network-settings: IP: %u.%u.%u.%u , MAC: %02lX:%02lX:%02lX:%02lX:%02lX:%02lX , RARP: %s\n",
            gMemUserSettings.IPAddr[0], gMemUserSettings.IPAddr[1], gMemUserSettings.IPAddr[2], gMemUserSettings.IPAddr[3],
            gMemUserSettings.MacAddr[0], gMemUserSettings.MacAddr[1], gMemUserSettings.MacAddr[2], gMemUserSettings.MacAddr[3], gMemUserSettings.MacAddr[4], gMemUserSettings.MacAddr[5],
            ( ( gMemUserSettings.IPOptions & IP_OPT_USE_RARP ) ? "True" : "False" )
          );
  flashc_memcpy ( ( void* ) gFlashUserSettings, // Destination
                  ( void* ) &gMemUserSettings, // Source
                  sizeof ( gMemUserSettings ), // Length
                  TRUE ); // Erase
  gChanges = FALSE;
}

void fru_set_net_ip ( U8* pIPAddr ) //, U8 pIPOptions )
{
  int i;

  for ( i = 0; i < 4; i++ )
  {
    gMemUserSettings.IPAddr[i] = pIPAddr[i];
  }

  //gMemUserSettings.IPOptions = ( ~IP_OPT_COMMITED ) & pIPOptions;
  gChanges = TRUE;
}

void fru_get_net_ip ( U8* pIPAddr ) //, U8* pIPOptions )
{
  //   dprintf( "Get IP\n" );
  //U8 xOptions = ( ~IP_OPT_COMMITED ) & gMemUserSettings.IPOptions;
  //   if ( pIPAddr )
  //   {
  int i;

  if ( gMemUserSettings.IPOptions & IP_OPT_USE_RARP )
  {
    for ( i = 0; i < 4; i++ )
    {
      pIPAddr[i] = 0x00;
    }
  }
  else
  {
    for ( i = 0; i < 4; i++ )
    {
      pIPAddr[i] = gMemUserSettings.IPAddr[i];
    }
  }

  //   }
  //   if ( gChanges )
  //   {
  //     xOptions |= IP_OPT_COMMITED;
  //   }
  //
  //   if ( pIPOptions )
  //   {
  //     *pIPOptions = xOptions;
  //   }
}

void fru_set_net_mac ( U8* pMACAddr )
{
  int i = 0;

  for ( i = 0; i < 6; i++ )
  {
    gMemUserSettings.MacAddr[i] = pMACAddr[i];
  }

  gChanges = TRUE;
}

void fru_get_net_mac ( U8* pMACAddr )
{
  //   dprintf( "Get MAC\n" );
  int i;

  for ( i = 0; i < 6; i++ )
  {
    pMACAddr[i] = gMemUserSettings.MacAddr[i];
  }
}



void fru_set_net_rarp ( U8* pRARP )
{
  if ( *pRARP )
  {
    gMemUserSettings.IPOptions |= IP_OPT_USE_RARP;
  }
  else
  {
    gMemUserSettings.IPOptions &= ~IP_OPT_USE_RARP;
  }

  gChanges = TRUE;
}

void fru_get_net_rarp ( U8* pRARP )
{
  //   dprintf( "Get RARP\n" );
  *pRARP = ( ( gMemUserSettings.IPOptions & IP_OPT_USE_RARP ) ? 1 : 0 ) ;
}



void fru_init()
{
  // Check if the User Page contains the first byte "01"
  // Also check that its checksum is correct
  if ( ( gUserPage[0] != 0x01 ) ||
       ( ipmi_checksum ( ( U8* ) gUserPage, 7 ) ) != gUserPage[7] )
  {
    // Before writing the user page, update our checksums
    fru_recalc_checksums();
    // User page is bad, re-write it!
    dprintf ( "User Page is empty / corrupt, Reloading defaults...\n" );
    dprintf ( "Writing User Page...\n" );
    flashc_memcpy ( ( void* ) AVR32_FLASHC_USER_PAGE_ADDRESS, // Destination
                    gFRU_Info, // Source
                    sizeof ( gFRU_Info ), // Length
                    TRUE ); // Erase
    dprintf ( "User Page written.\n" );

    if ( ( gUserPage[0] != 0x01 ) ||
         ( ipmi_checksum ( ( U8* ) gUserPage, 7 ) ) != gUserPage[7] )
    {
      dprintf ( "User Page STILL empty/corrupt after write.\n" );
    }
    else
    {
      dprintf ( "User Page Seems OK after write!\n" );
    }
  }
  else
  {
    dprintf ( "User Page Seems OK!\n" );
  }
}

U8 fru_cmd_get_inv_area_info ( U8* pDataIn, U8 pDataInLen,
                               U8* pDataOut, U8* pDataOutLen )
{
  U16 xFRUAreaSize = AVR32_FLASHC_USER_PAGE_SIZE;
  struct IPMI_CMD_FRU_AREA_INFO* xReturn =
    ( struct IPMI_CMD_FRU_AREA_INFO* ) pDataOut;
  xReturn->AreaSizeLSB = ( xFRUAreaSize & 0xFF );
  xReturn->AreaSizeMSB = ( xFRUAreaSize >> 8 );
  xReturn->AreaAccessMode = 0x00; // Access is in bytes
  *pDataOutLen = sizeof ( struct IPMI_CMD_FRU_AREA_INFO );
  dprintf ( "NOTE: [CMD] FRU Inventory Area Info.\n" );
  return IPMI_CC_OK;
}

U8 fru_cmd_read_data ( U8* pDataIn, U8 pDataInLen,
                       U8* pDataOut, U8* pDataOutLen )
{
  if ( pDataInLen != sizeof ( struct IPMI_CMD_FRU_READ_REQ ) )
  {
    *pDataOutLen = 0;
    return IPMI_CC_REQ_DATA_INV_LENGTH;
  }

  struct IPMI_CMD_FRU_READ_REQ* xRequest =
    ( struct IPMI_CMD_FRU_READ_REQ* ) pDataIn;

  U16 xOffset = xRequest->OffsetLSB |
                ( xRequest->OffsetMSB << 8 );

  // Check that the request does fit within the memory
  if ( xOffset + xRequest->Count > AVR32_FLASHC_USER_PAGE_SIZE )
  {
    *pDataOutLen = 0;
    return IPMI_CC_PARAM_OUT_OF_RANGE;
  }

  // Set the "Bytes returned" field
  pDataOut[0] = xRequest->Count;
  // Copy the memory
  U8* xDataPtr = ( ( U8* ) gUserPage + xOffset );
  U8 i = 0;

  for ( i = 0; i < xRequest->Count; i++ )
  {
    pDataOut[i + 1] = xDataPtr[i];
  }

  *pDataOutLen = ( xRequest->Count + 1 );
  //dprintf("NOTE: [CMD] FRU Read Data.\n");
  return IPMI_CC_OK;
}

U8 fru_cmd_write_data ( U8* pDataIn, U8 pDataInLen,
                        U8* pDataOut, U8* pDataOutLen )
{
  dprintf ( "WARNING: Attempted an FRU write (Returning 'Write protected'!\n" );
  *pDataOutLen = 0;
  return ( IPMI_CC_OK | FRU_WRITE_CC_WRITEPROTECTED );
}

U8 fru_cmdex_control ( U8* pDataIn, U8 pDataInLen,
                       U8* pDataOut, U8* pDataOutLen )
{
  // At the moment we don't do anything about payload control
  if ( pDataInLen != sizeof ( struct IPMI_CMD_PCIMG_FRU_CMD_REQ ) )
  {
    *pDataOutLen = 0;
    return IPMI_CC_REQ_DATA_INV_LENGTH;
  }

  struct IPMI_CMD_PCIMG_FRU_CMD_REQ* xReq =
    ( struct IPMI_CMD_PCIMG_FRU_CMD_REQ* ) pDataIn;

  if ( xReq->FRUCMD == FRU_SET_STATE_QUIESCE )
  {
    // Send a quiesce signal to the bus
    sdr_hotswap_quiesce();
  }

  dprintf ( "NOTE: [CMD] PCIMG FRU Control.\n" );
  return IPMI_CC_OK;
}

U8 pcimg_cmdex_get_props ( U8* pDataIn, U8 pDataInLen,
                           U8* pDataOut, U8* pDataOutLen )
{
  struct IPMI_CMD_PCIMG_GET_PROPS* xResp =
    ( struct IPMI_CMD_PCIMG_GET_PROPS* ) pDataOut;
  xResp->ExtVersion = PCIMG_EXT_VERSION;
  xResp->MaxFRUID = 0x00; // We are the only FRU
  xResp->DevFRUID = 0x00;
  *pDataOutLen = sizeof ( struct IPMI_CMD_PCIMG_GET_PROPS );
  dprintf ( "NOTE: [CMD] PCIMG Get Properties.\n" );
  return IPMI_CC_OK;
}

U8 pcimg_cmdex_set_amc_port_state ( U8* pDataIn, U8 pDataInLen,
                                    U8* pDataOut, U8* pDataOutLen )
{
  // Just return an empty success packet?
  *pDataOutLen = 0;
  dprintf ( "NOTE: [CMD] AMC Set Port State.\n" );
  return IPMI_CC_OK;
}

U8 pcimg_cmdex_get_amc_port_state ( U8* pDataIn, U8 pDataInLen,
                                    U8* pDataOut, U8* pDataOutLen )
{
  // Just return an empty success packet?
  *pDataOutLen = 0;
  dprintf ( "NOTE: [CMD] AMC Get Port State.\n" );
  return IPMI_CC_OK;
}

