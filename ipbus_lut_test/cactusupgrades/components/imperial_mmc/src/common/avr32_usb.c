/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 * The main USB serial interface code. This allows a user to call
 * functions and potentially transfer files using a console like
 * interface.
 *
 */

#include "usbb.h"
#include "usb_drv.h"
#include "imperial_mmc/avr32_usb.h"
#include "uart_usb_lib.h"
#include "usb_descriptors.h"
#include "usb_specific_request.h"

// TODO: Should this be elsewhere
#include <stdarg.h>
#include <stdio.h>

// Buffers for in-going and out-going text.
struct USB_TTY_BUFFER gUSBBuffer_In = {};
struct USB_TTY_BUFFER gUSBBuffer_Out = {};
struct USB_TTY_BUFFER gUSBBuffer_XModem = {};

// Keep track of if there is a client connected
Bool gClient = FALSE;
// Send debug strings to USB?
Bool gDebug = FALSE;
// Running X-Modem mode
Bool gXModem = FALSE;
U32 gXModemTimeout = 0; // We keep a time-out to exit back to normal mode!
U8 gXModemSeq = 1; // Current XModem sequence num
U8 gXModemCS = 0; // Running Checksum of the packet

#define USB_ERROR "Unknown Command (Try 'help').\r\n"

#ifdef MINIT5_REV
#define USB_PROMPT "MINI-T5> "
#define USB_BANNER "\r\nImperial College MINI-T5 MMC Console\r\n\r\n"
#else
#define USB_PROMPT "MP7> "
#define USB_BANNER "\r\nImperial College MP7 MMC Console\r\n\r\n"
#endif

#define USB_MAX_ARGV 10
struct USB_CMD gUSBCmdTbl[] =
{
  { "help", "Shows this text", &usb_cmd_help },
  { "debug", "Enable debug output", &usb_cmd_debug },
  { "reboot", "Reboots the MMC", &usb_cmd_reboot },
  { "sensors", "Show sensor state", &usb_cmd_sensors },
  { "rx", "Send a file using xmodem", &usb_cmd_xmodem },
  { "netinfo", "Show network config", &usb_cmd_netinfo },
  { "netconfig", "Change network config", &usb_cmd_netconfig },
  // MP7 Only
#ifndef MINIT5_REV
  { "fsformat", "Format SD card", &usb_cmd_fsformat },
  { "fslist", "List SD card files", &usb_cmd_fslist },
  { "fsdel", "Delete an SD card file", &usb_cmd_fsdel },
  { "fpgaboot", "Boot an FPGA image", &usb_cmd_fpgaboot },
  { "fpgastate", "Get current FPGA state", &usb_cmd_fpgastate },
  { "fpgaconfig", "Set-up FPGA defaults", &usb_cmd_fpgaconfig },
#endif
  { NULL, NULL, NULL }
};

void usb_buffer_init ( struct USB_TTY_BUFFER* pBuf )
{
  pBuf->CurLoc = pBuf->Buffer;
  pBuf->Size = 0;
  pBuf->Left = USB_TTY_BUFFER_SIZE;
}

size_t usb_buffer_compress ( struct USB_TTY_BUFFER* pBuf )
{
  size_t xFree = pBuf->CurLoc - pBuf->Buffer;

  if ( xFree )
  {
    // Move all the data up to the front of the buffer
    memmove ( pBuf->Buffer, pBuf->CurLoc, pBuf->Size );
    pBuf->CurLoc = pBuf->Buffer;
    pBuf->Left = USB_TTY_BUFFER_SIZE - pBuf->Size;
  }

  return xFree;
}

char usb_buffer_pop ( struct USB_TTY_BUFFER* pBuf )
{
  char xChar;

  if ( pBuf->Size > 0 )
  {
    xChar = * ( pBuf->CurLoc );
    pBuf->CurLoc++;
    pBuf->Size--;
    return xChar;
  }

  return -1;
}

int usb_buffer_unpush ( struct USB_TTY_BUFFER* pBuf )
{
  if ( pBuf->Size <= 0 )
  {
    return -1;
  }

  // Remove the last character pushed on the buffer
  pBuf->Size--;
  pBuf->Left++;
  return pBuf->CurLoc[pBuf->Size];
}

int usb_buffer_push ( struct USB_TTY_BUFFER* pBuf, char pChar )
{
  if ( pBuf->Left <= 0 )
  {
    // No space in buffer, try to free some
    if ( usb_buffer_compress ( pBuf ) <= 0 )
    {
      return -1;  // Buffer really is out of space
    }

    // We got enough space back! Continue...
  }

  pBuf->CurLoc[pBuf->Size] = pChar;
  pBuf->Size++;
  pBuf->Left--;
  return 0;
}

int usb_buffer_write ( struct USB_TTY_BUFFER* pBuf, char* pStr )
{
  size_t xNewSize = strlen ( pStr );

  if ( xNewSize > pBuf->Left )
  {
    // Buffer doesn't have enough space for the string
    usb_buffer_compress ( pBuf );

    if ( xNewSize > pBuf->Left )
    {
      // Buffer really is out of space!
      return -1;
    }

    // Buffer now has enough space... Continue...
  }

  memmove ( pBuf->CurLoc + pBuf->Size, pStr, xNewSize );
  pBuf->Size += xNewSize;
  pBuf->Left -= xNewSize;
  return xNewSize;
}

void usb_init()
{
  // Enable the correct clock for USB
  pm_gc_setup ( &AVR32_PM, AVR32_PM_GCLK_USBB, 0, 0, 0, 0 );
  pm_gc_enable ( &AVR32_PM, AVR32_PM_GCLK_USBB );
  // Enable the USB module
  usb_task_init();
  // and the USB module
  uart_usb_init();
  // Prepare the TTY buffers
  usb_buffer_init ( &gUSBBuffer_In );
  usb_buffer_init ( &gUSBBuffer_Out );
  usb_buffer_init ( &gUSBBuffer_XModem );
}

void usb_prompt()
{
  usb_buffer_write ( &gUSBBuffer_Out, USB_PROMPT );
}

void usb_output ( const char* pStr, ... )
{
  va_list xVA;
  char xDebugBuf[64];
  va_start ( xVA, pStr );
  vsnprintf ( xDebugBuf, 64, pStr, xVA );
  va_end ( xVA );
  usb_buffer_write ( &gUSBBuffer_Out, xDebugBuf );
}

void usb_debug ( const char* pFormat, ... )
{
  va_list xVA;
  char xDebugBuf[64];

  if ( !gDebug )
  {
    return;
  }

  va_start ( xVA, pFormat );
  vsnprintf ( xDebugBuf, 64, pFormat, xVA );
  va_end ( xVA );
  usb_output ( "%s\r", xDebugBuf );
}

Bool usb_toggle_debug()
{
  gDebug = !gDebug;
  return gDebug;
}

void usb_set_xmodem ( Bool pState )
{
  gXModemTimeout = 0;
  gXModemSeq = 1;
  gXModemCS = 0;
  gXModem = pState;
}

void usb_xmodem_cancel()
{
  // Timeout exit XMODEM
  usb_set_xmodem ( FALSE );
  uart_usb_putchar ( XMODEM_CAN );
  uart_usb_putchar ( XMODEM_CAN );
  uart_usb_putchar ( XMODEM_CAN );
  uart_usb_flush();
  usb_buffer_write ( &gUSBBuffer_Out, "   XMODEM Aborted!\r\n" );
  usb_prompt();
}

void usb_xmodem()
{
  gXModemTimeout++;

  if ( gXModemTimeout > USB_XMODEM_TIMEOUT )
  {
    dprintf ( "[USB-XM] Total Timeout!\n" );
    usb_xmodem_cancel();
    return;
  }

  if ( ( gXModemTimeout % USB_XMODEM_SUBTIMEOUT ) == 0 )
  {
    dprintf ( "[USB-XM] Packet Timeout!\n" );
    uart_usb_putchar ( XMODEM_NAK );
    uart_usb_flush();
    usb_buffer_init ( &gUSBBuffer_XModem );
    return;
  }

  while ( uart_usb_test_hit() )
  {
    U8 xChar = uart_usb_getchar();

    // We have some data, decide what kind of packet it is
    if ( ( xChar == XMODEM_CAN ) && ( gUSBBuffer_XModem.Size < 1 ) )
    {
      // Cancel & Buffer is empty... Cancel!
      dprintf ( "[USB-XM] Remote Cancel!\n" );
      usb_xmodem_cancel();
      return;
    }

    if ( ( xChar == XMODEM_EOT ) && ( gUSBBuffer_XModem.Size < 1 ) )
    {
      // End-of-transmission, We have the whole file!
      dprintf ( "[USB-XM] Transfer Complete!\n" );
      uart_usb_putchar ( XMODEM_ACK );
      uart_usb_flush();
      usb_set_xmodem ( FALSE );
      usb_buffer_write ( &gUSBBuffer_Out, "\r\nXMODEM Transfer Complete!\r\n" );
      usb_prompt();
      return;
    }

    usb_buffer_push ( &gUSBBuffer_XModem, xChar );
    gXModemCS += xChar;

    if ( gUSBBuffer_XModem.Size >= 132 )
    {
      char xRet = XMODEM_ACK;
      U8 xPacket;
      //dprintf("[USB-XM] Got data packet!\n");

      // First check the header
      if ( gUSBBuffer_XModem.Buffer[0] != XMODEM_SOH )
      {
        dprintf ( "[USB-XM] Bad SOH Character\n" );
        xRet = XMODEM_NAK;
      }

      xPacket = gUSBBuffer_XModem.Buffer[1];

      if ( ( xPacket + gUSBBuffer_XModem.Buffer[2] ) != 0xFF )
      {
        dprintf ( "[USB-XM] Corrupt packet number!\n" );
        xRet = XMODEM_NAK;
      }

      if ( xPacket != gXModemSeq )
      {
        if ( xPacket == ( gXModemSeq - 1 ) )
        {
          // Packet retrransmission!
          // Ack and continue!
          dprintf ( "[USB-XM] Packet Retransmission!\n" );
          gXModemTimeout = 0;
          gXModemCS = 0;
          usb_buffer_init ( &gUSBBuffer_XModem );
          uart_usb_putchar ( XMODEM_ACK );
          uart_usb_flush();
          break;
        }

        // Out of sequence packet
        dprintf ( "[USB-XM] Invalid packet number!\n" );
        xRet = XMODEM_NAK;
      }

      // Now check the data check-sum
      // Checksum byte will have been added by accident
      // Subtract it first!
      gXModemCS -= gUSBBuffer_XModem.Buffer[131];

      if ( gUSBBuffer_XModem.Buffer[131] != gXModemCS )
      {
        dprintf ( "[USB-XM Checksum error!\n" );
        xRet = XMODEM_NAK;
      }

      gXModemTimeout = 0;
      gXModemCS = 0;
      usb_buffer_init ( &gUSBBuffer_XModem );
      uart_usb_putchar ( xRet );

      if ( xRet == XMODEM_ACK )
      {
        gXModemSeq++;
      }

      uart_usb_flush();
    }
  }
}

void usb_run()
{
  char xChar;
  int xSent = 0;
  // Run USB housekeeping
  usb_task();

  // Add a bypass for X-Modem data if we are in that mode
  if ( gXModem )
  {
    usb_xmodem();
    return;
  }

  // Now we can check if there is any data on the serial
  while ( uart_usb_test_hit() )
  {
    xChar = uart_usb_getchar();

    if ( xChar == '\r' )
    {
      // New line means we can now process a request!
      usb_buffer_write ( &gUSBBuffer_Out, "\r\n" ); // Echo users newline first!
      // First add a \0 onto the end of the string...
      // This is safe as the buffer has an extra spare byte for this purpose!
      if ( gUSBBuffer_In.Size > 0 )
      {
        gUSBBuffer_In.CurLoc[gUSBBuffer_In.Size] = '\0';
        usb_process_cmd ( gUSBBuffer_In.CurLoc );
        // Now we can empty the buffer
        usb_buffer_init ( &gUSBBuffer_In );
      }

      // Only print the prompt if we're not in XModem mode!
      if ( !gXModem )
      {
        usb_prompt();
      }

      continue;
    }

    // Treat backspace specially (and delete)!
    if ( ( xChar == '\b' ) || ( xChar == 127 ) )
    {
      // Remove the last character
      if ( usb_buffer_unpush ( &gUSBBuffer_In ) > 0 )
      {
        // We managed to remove a character,
        // Echo back <BS><SPACE><BS>, which will clear the char
        // and move the cursor back!
        usb_buffer_write ( &gUSBBuffer_Out, "\b \b" );
      }

      continue;
    }

    // Don't allow control characters into the buffer.
    if ( ( xChar < 32 ) || ( xChar >= 127 ) )
    {
      continue;
    }

    usb_buffer_push ( &gUSBBuffer_In, xChar );
    // Push the char into the output buffer too for echo
    usb_buffer_push ( &gUSBBuffer_Out, xChar );
  }

  while ( uart_usb_tx_ready() )
  {
    if ( gUSBBuffer_Out.Size <= 0 )
    {
      break;  // No more data to send
    }

    xChar = usb_buffer_pop ( &gUSBBuffer_Out );
    uart_usb_putchar ( xChar );
    xSent++;
  }

  if ( ( !gClient ) && usb_user_get_dtr() )
  {
    // DTR went high, print banner!
    usb_buffer_write ( &gUSBBuffer_Out, USB_BANNER );
    usb_prompt();
  }

  gClient = usb_user_get_dtr();

  if ( xSent )
  {
    uart_usb_flush();
  }
}

void usb_process_cmd ( char* pCmd )
{
  int argc = 0;
  char* xArgs = pCmd;
  char* argv[USB_MAX_ARGV] = {};
  struct USB_CMD* xCmd;
  dprintf ( "[USB] CMD: %s\n", pCmd );

  // We need to split the command up into sections
  while ( 1 )
  {
    argv[argc] = strsep ( &xArgs, " " );

    if ( argv[argc] == NULL )
    {
      break;
    }

    argc++;
  }

  // We shouldn't ever have an empty string here
  // But if we do, don't crash!
  if ( argc == 0 )
  {
    return;
  }

  xCmd = gUSBCmdTbl;

  while ( xCmd->CMD != NULL )
  {
    if ( strcmp ( xCmd->CMD, argv[0] ) == 0 )
    {
      // Command found
      if ( xCmd->FuncPtr != NULL )
      {
        xCmd->FuncPtr ( argv , argc - 1 );
      }

      return;
    }

    xCmd++;
  }

  usb_buffer_write ( &gUSBBuffer_Out, USB_ERROR );
}

void usb_cmd_help ( char** argc, int argv )
{
  struct USB_CMD* xCmd;
  usb_buffer_write ( &gUSBBuffer_Out, "Console Commands:\r\n" );
  xCmd = gUSBCmdTbl;

  while ( xCmd->CMD != NULL )
  {
    usb_buffer_write ( &gUSBBuffer_Out, xCmd->CMD );
    usb_buffer_write ( &gUSBBuffer_Out, " - " );
    usb_buffer_write ( &gUSBBuffer_Out, xCmd->Help );
    usb_buffer_write ( &gUSBBuffer_Out, "\r\n" );
    xCmd++;
  }
}
