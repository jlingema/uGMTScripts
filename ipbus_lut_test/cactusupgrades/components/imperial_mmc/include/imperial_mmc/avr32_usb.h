/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 */

#ifndef AVR32_USB_H_
#define AVR32_USB_H_

#include "avr32_arch.h"
#include "avr32_usb_cmd.h"

#define USB_TTY_BUFFER_SIZE 512

// In ms
#define USB_XMODEM_SUBTIMEOUT 25000
#define USB_XMODEM_TIMEOUT 200000
#define XMODEM_SOH 1
#define XMODEM_EOT 4
#define XMODEM_ACK 6
#define XMODEM_NAK 21
#define XMODEM_CAN 24

struct USB_TTY_BUFFER
{
  // Keep 1 more byte on the buffer than "advertised"
  // That way we can always tag a '\0' onto the end of the string safely
  char Buffer[USB_TTY_BUFFER_SIZE + 1];
  char* CurLoc;
  size_t Size; // Bytes in the buffer
  size_t Left; // Bytes before the end of the buffer!
};



struct USB_CMD
{
  char* CMD; // Command name
  char* Help; // Help Text
  USB_CMD_TYPE FuncPtr; // Pointer to command function
};

void usb_init();
void usb_run();
void usb_output ( const char* pStr, ... );
void usb_debug ( const char* pFormat, ... );
Bool usb_toggle_debug();
void usb_set_xmodem ( Bool pState );
void usb_process_cmd ( char* pCmd );
void usb_cmd_help ( char** argc, int argv );

#endif /* AVR32_USB_H_ */
