/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 * The various USB command functions which a user can call via the USB
 * interface.
 *
 */
#include "imperial_mmc/avr32_arch.h"
#include "imperial_mmc/avr32_fru.h"
#include "imperial_mmc/avr32_usb.h"
#include "imperial_mmc/avr32_usb_cmd.h"
#include "imperial_mmc/avr32_sdr.h"
#include "imperial_mmc/avr32_sfwfs.h"
#include "imperial_mmc/avr32_fpga.h"

// Needed for sprintf, TODO: should this be elsewhere?
#include <stdio.h>

void usb_cmd_debug ( char** argv, int argc )
{
  if ( argc != 0 )
  {
    usb_output ( "Usage: debug\r\n" );
    return;
  }

  if ( usb_toggle_debug() )
  {
    usb_output ( "Debug output now ON.\r\n" );
  }
  else
  {
    usb_output ( "Debug output now OFF.\r\n" );
  }
}

void usb_cmd_reboot ( char** argv, int argc )
{
  if ( argc != 1 )
  {
    usb_output ( "Usage: reboot -yes\r\n" );
    return;
  }

  if ( strcmp ( argv[1], "-yes" ) != 0 )
  {
    usb_output ( "-yes must be specified to confirm action.\n" );
    return;
  }

  Disable_global_interrupt();
  wdt_enable ( 2000000 ); // Set-up a reset in 2s

  while ( 1 );
}

void usb_cmd_sensors ( char** argv, int argc )
{
  char xStrTmp[32];

  if ( argc != 0 )
  {
    usb_output ( "Usage: sensors\r\n" );
    return;
  }

  sprintf ( xStrTmp, "12v Supply: %2.2fV\r\n", pwr_get_12v_value() );
  usb_output ( xStrTmp );
  sprintf ( xStrTmp, "Power OK Mask: 0x%02X\r\n", pwr_good_mask() );
  usb_output ( xStrTmp );
  sprintf ( xStrTmp, "FPGA Temp: %2.2fC\r\n", sdr_get_temp_reading ( 0 ) );
  usb_output ( xStrTmp );

  if ( arch_read_pin ( HOTSWAP_GPIO ) )
  {
    usb_output ( "Hotswap handle open.\r\n" );
  }
  else
  {
    usb_output ( "Hotswap handle closed.\r\n" );
  }

  return;
}

void usb_cmd_xmodem ( char** argv, int argc )
{
  usb_output ( "Send file using XMODEM now...\r\n" );
  usb_set_xmodem ( TRUE );
}

void usb_cmd_usbupdate ( char** argv, int argc )
{
  if ( argc != 1 )
  {
    usb_output ( "Usage: usbupdate -(yes|no|query)\r\n" );
    return;
  }

  if ( strcmp ( argv[1], "-yes" ) == 0 )
  {
    flashc_set_gp_fuse_bit ( USB_DFU_GP_FUSE, TRUE );
    return;
  }
  else if ( strcmp ( argv[1], "-no" ) == 0 )
  {
    flashc_set_gp_fuse_bit ( USB_DFU_GP_FUSE, FALSE );
    return;
  }
  else if ( strcmp ( argv[1], "-query" ) == 0 )
  {
    if ( flashc_read_gp_fuse_bit ( USB_DFU_GP_FUSE ) )
    {
      usb_output ( "USB Updater is enabled.\r\n" );
    }
    else
    {
      usb_output ( "USB Updater is disabled.\r\n" );
    }

    return;
  }

  usb_output ( "Parameter should be yes, no or query\r\n" );
  return;
}

void usb_cmd_netinfo ( char** argv, int argc )
{
  // Allocate a static buffer to store the text in
  // Then just sprintf to it!
  char xTmpString[18]; // Maximum length is mac address = 17 chars + Null
  U8 xIPAddr[4];
  U8 xIPOptions;
  U8 xMACAddr[6];

  if ( argc != 0 )
  {
    usb_output ( "Usage: netinfo\r\n" );
    return;
  }

  // Get the network settings into local buffers
  fru_get_net_ip ( xIPAddr ); //, &xIPOptions );
  fru_get_net_mac ( xMACAddr );
  usb_output ( "Network Configuration:\r\n" );
  usb_output ( " MAC Addr: " );
  sprintf ( xTmpString, "%02X:%02X:%02X:%02X:%02X:%02X",
            xMACAddr[0], xMACAddr[1], xMACAddr[2],
            xMACAddr[3], xMACAddr[4], xMACAddr[5] );
  usb_output ( xTmpString );
  usb_output ( "\r\n IP Addr: " );
  sprintf ( xTmpString, "%u.%u.%u.%u",
            xIPAddr[0], xIPAddr[1],
            xIPAddr[2], xIPAddr[3] );
  usb_output ( xTmpString );
  //  usb_output ( "\r\n IP Options: " );
  //  sprintf ( xTmpString, "0x%02X", xIPOptions );
  //  usb_output ( xTmpString );
  // Now for the messy bit of printing all the options!
  //   if ( xIPOptions & IP_OPT_COMMITED )
  //   {
  //     usb_output ( "\r\n  1....... = Changes are not yet committed." );
  //   }
  //   else
  //   {
  //     usb_output ( "\r\n  0....... = Changes are committed." );
  //   }
  //  usb_output ( "\r\n  .XXXXXXX = Reserved." );
  //  usb_output ( xTmpString );
  usb_output ( "\r\n" );
  return;
}

void usb_cmd_netconfig ( char** argv, int argc )
{
  int xRet, i;
  unsigned int xIPTmp[4];
  unsigned int xMACTmp[6];
  unsigned int xOptsTmp;
  char* xEndPtr;
  U8 xTmp;
  U8 xIPAddr[4];
  U8 xMACAddr[6];
  // U8 xOptions;

  if ( argc != 2 )
  {
    usb_output ( "Usage: netconfig ip <ip-addr>\r\n" );
    usb_output ( "       netconfig mac <mac-addr>\r\n" );
    //     usb_output ( "       netconfig opts <options>\r\n" );
    usb_output ( "       netconfig commit -yes\r\n" );
    return;
  }

  // Switch between the sub options
  if ( !strcmp ( argv[1], "ip" ) )
  {
    xRet = sscanf ( argv[2], "%3u.%3u.%3u.%3u%c",
                    &xIPTmp[0], &xIPTmp[1],
                    &xIPTmp[2], &xIPTmp[3] , &xTmp );

    if ( xRet != 4 )
    {
      usb_output ( "Error: Invalid IP Address!\r\n" );
      return;
    }

    for ( i = 0; i < 4; i++ )
    {
      if ( xIPTmp[i] > 0xFF )
      {
        usb_output ( "Error: Invalid IP Address!\r\n" );
        return;
      }

      xIPAddr[i] = xIPTmp[i];
    }

    // fru_get_net_ip ( NULL, &xOptions );
    fru_set_net_ip ( xIPAddr ); //, xOptions );
    usb_output ( "IP address changed.\r\n" );
    return;
  }

  // Switch between the sub options
  if ( !strcmp ( argv[1], "mac" ) )
  {
    xRet = sscanf ( argv[2], "%2x:%2x:%2x:%2x:%2x:%2x%c",
                    &xMACTmp[0], &xMACTmp[1], &xMACTmp[2],
                    &xMACTmp[3], &xMACTmp[4], &xMACTmp[5], &xTmp );

    if ( xRet != 6 )
    {
      usb_output ( "Error: Invalid MAC Address!\r\n" );
      return;
    }

    for ( i = 0; i < 6; i++ )
    {
      if ( xMACTmp[i] > 0xFF )
      {
        usb_output ( "Error: Invalid IP Address!\r\n" );
        return;
      }

      xMACAddr[i] = xMACTmp[i];
    }

    // fru_get_net_ip ( NULL, &xOptions );
    fru_set_net_mac ( xMACAddr ); //, xOptions );
    usb_output ( "MAC address changed.\r\n" );
    return;
  }

  /* TODO: Finish this when setting the mac addr is actually supported!
  if (!strcmp(argv[1], "mac"))
  {
  	return;
  }
  */
  //   if ( !strcmp ( argv[1], "opts" ) )
  //   {
  //     xOptsTmp = strtoul ( argv[2], &xEndPtr, 0 );
  //
  //     if ( ( xOptsTmp > 0x7F ) || ( xOptsTmp < 0x00 ) || ( *xEndPtr != '\0' ) )
  //     {
  //       usb_output ( "Error: Invalid options settting!\r\n" );
  //       return;
  //     }
  //
  //     xOptions = xOptsTmp;
  //     fru_get_net_ip ( xIPAddr, NULL );
  //     fru_set_net_ip ( xIPAddr, xOptions );
  //     usb_output ( "IP options changed.\r\n" );
  //     return;
  //   }

  if ( !strcmp ( argv[1], "commit" ) )
  {
    if ( !strcmp ( argv[2], "-yes" ) )
    {
      fru_save_network();
      usb_output ( "Network options committed to FLASH.\r\n" );
    }
    else
    {
      usb_output ( "Error: Specify -yes to confirm.\r\n" );
    }

    return;
  }

  usb_output ( "Error: Unrecognised netconfig sub-option!\r\n" );
  return;
}

void usb_cmd_fsformat ( char** argv, int argc )
{
  int xRet;

  if ( argc != 2 )
  {
    usb_output ( "Usage: fsformat volname -yes\r\n" );
    return;
  }

  if ( strcmp ( argv[2], "-yes" ) )
  {
    usb_output ( "Error: Specify -yes to confirm.\r\n" );
    return;
  }

  xRet = sfwfs_format ( argv[1] );

  if ( xRet != SFWFS_ERR_NONE )
  {
    usb_output ( "Error: Failed to format card.\r\n" );
    return;
  }

  usb_output ( "Done.\r\n" );
}

void usb_cmd_fslist ( char** argv, int argc )
{
  char* xFileName;
  U32 xFileSize;
  U32 xBlock = 0, xEntry = 0;

  if ( argc != 0 )
  {
    usb_output ( "Usage: fslist\r\n" );
    return;
  }

  if ( sfwfs_mount() != SFWFS_ERR_NONE )
  {
    usb_output ( "Error: Filesystem unavailable (Busy?).\r\n" );
    return;
  }

  usb_output ( "Filesystem Listing:\r\n" );

  while ( 1 )
  {
    int xRet = sfwfs_iter ( &xFileName, &xFileSize, &xBlock, &xEntry );

    if ( xRet == SFWFS_ERR_NONE )
    {
      usb_output ( "%-8ld %32s\r\n", xFileSize, xFileName );
    }
    else
    {
      break;
    }
  }

  sfwfs_unmount();
  return;
}

void usb_cmd_fsdel ( char** argv, int argc )
{
  int xRet;

  if ( argc != 1 )
  {
    usb_output ( "Usage: fsdel filename\r\n" );
    return;
  }

  xRet = sfwfs_mount();

  if ( xRet != SFWFS_ERR_NONE )
  {
    usb_output ( "Error: Failed to mount filesystem.\r\n" );
    return;
  }

  xRet = sfwfs_del ( argv[1] );

  if ( xRet != SFWFS_ERR_NONE )
  {
    usb_output ( "Error: Failed to delete file.\r\n" );
  }

  sfwfs_unmount();
  return;
}

void usb_cmd_fpgaboot ( char** argv, int argc )
{
#ifdef MP7_REV

  if ( argc != 2 )
  {
    usb_output ( "Usage: fpgaboot filename\r\n" );
    usb_output ( "       fpgaboot - (To just reset))\r\n" );
    return;
  }

  if ( strcmp ( argv[1], "-" ) )
  {
    // Set FPGA filename
  }

  fpga_reset();
  usb_output ( "FPGA rebooting...\r\n" );
  return;
#else
  usb_output ( "Command not available on this board.\r\n" );
#endif
}

void usb_cmd_fpgastate ( char** argv, int argc )
{
#ifdef MP7_REV
  U8 xFPGAInit = arch_read_pin ( FPGA_INIT_B );
  U8 xFPGADone = arch_read_pin ( FPGA_DONE );

  if ( xFPGAInit && xFPGADone )
  {
    usb_output ( "FPGA is RUNNING.\r\n" );
  }
  else if ( xFPGAInit && !xFPGADone )
  {
    usb_output ( "FPGA is UNCONFIGURED.\r\n" );
  }
  else
  {
    usb_output ( "FPGA is NOT READY.\r\n" );
  }

  return;
#else
  usb_output ( "Command not available on this board.\r\n" );
#endif
}

void usb_cmd_fpgaconfig ( char** argv, int argc )
{
  return;
}
