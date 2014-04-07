/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 */

#ifndef AVR32_USB_CMD_H_
#define AVR32_USB_CMD_H_

typedef void ( *USB_CMD_TYPE ) ( char** argv, int argc );

// Fuse bit to enter the USB bootloader
#define USB_DFU_GP_FUSE 31

void usb_cmd_debug ( char** argv, int argc );
void usb_cmd_reboot ( char** argv, int argc );
void usb_cmd_sensors ( char** argv, int argc );
void usb_cmd_update ( char** argv, int argc );
void usb_cmd_xmodem ( char** argv, int argc );
void usb_cmd_netinfo ( char** argv, int argc );
void usb_cmd_netconfig ( char** argv, int argc );
void usb_cmd_fsformat ( char** argv, int argc );
void usb_cmd_fslist ( char** argv, int argc );
void usb_cmd_fsdel ( char** argv, int argc );
void usb_cmd_fpgaboot ( char** argv, int argc );
void usb_cmd_fpgastate ( char** argv, int argc );
void usb_cmd_fpgaconfig ( char** argv, int argc );

#endif /* AVR32_USB_CMD_H_ */
