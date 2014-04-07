/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 */

#ifndef AVR32_LED_H_
#define AVR32_LED_H_

#include "avr32_arch.h"

#include "avr32_ipmi.h"

#define LED_BLUE_GPIO LED0_GPIO
#define LED_RED_GPIO LED1_GPIO
#define LED_GREEN_GPIO LED2_GPIO
#define LED_HEARTBEAT_GPIO LED3_GPIO

#define LED_BLUE 0
#define LED_RED 1
#define LED_GREEN 2
#define LED_YELLOW 3

#define IPMP_COLOUR_BLUE  0x01
#define IPMP_COLOUR_RED   0x02
#define IPMP_COLOUR_GREEN 0x03

#define LED_FN_ON 		  	 0xFF
#define LED_FN_OFF 		  	 0x00
#define LED_FN_LOCAL_CONTROL 0xFC

#define CYCLE_NEXT 0x1
#define OFF_NEXT 0x2
#define ON_NEXT 0x3

#define LED_TIME_SCALE 10

struct sLED_Info
{
  U8 GPIO; // The port the LED is connected to
  U16 On_Time; // On duration in ms
  U16 Cycle_Time; // Cycle time
  U16 Next_On_Time; // The next flash on time
  U16 Next_Cycle_Time; // The next flash cycle time
  U8 Next_Valid; // If 1, the other Next_ values are valid
  U16 Counter; // Current count in the on/off cycle
  U8 Colour;
  U8 Override; // If 1, remote control override in effect
  U8 DefaultState; // 1 = On, 0 = Off
  U8 MinFlash; // Minimum number of flashes to do
};

struct IPMI_CMD_LED_PROPS_RESP
{
  U8 LEDSupport;
  U8 NumLEDs;
} __attribute__ ( ( __packed__ ) );

struct IPMI_CMD_LED_COLOUR_CAPS_REQ
{
  U8 Unknown1;
  U8 Unknown2;
  U8 LEDID;
} __attribute__ ( ( __packed__ ) );

struct IPMI_CMD_LED_COLOUR_CAPS_RESP
{
  U8 Capabilities;
  U8 DefaultColour;
  U8 DefaultOverrideColour;
} __attribute__ ( ( __packed__ ) );

struct IPMI_CMD_LED_SET_STATE
{
  U8 Unknown1;
  U8 Unknown2;
  U8 LEDID;
  U8 LED_Function;
  U8 LED_OnTime;
} __attribute__ ( ( __packed__ ) );

struct IPMI_CMD_LED_GET_STATE_REQ
{
  U8 Unknown1;
  U8 Unknown2;
  U8 LEDID;
} __attribute__ ( ( __packed__ ) );

struct IPMI_CMD_LED_GET_STATE_RESP
{
  U8 ControlState;
  U8 LocalFn;
  U8 LocalOnTime;
  U8 LocalColour;
  U8 Opt_OverFnTime;
  U8 Opt_OverOnTime;
  U8 Opt_OverColour;
} __attribute__ ( ( __packed__ ) );

// NO = No Override
#define LED_GET_STATE_SIZE_NO_LEN 4
#define LED_GET_STATE_SIZE_O_LEN 7

void led_init();
void led_heartbeat ( char xIncrement );

U8 led_cmdex_led_props ( U8* pDataIn, U8 pDataInLen,
                         U8* pDataOut, U8* pDataOutLen );
U8 led_cmdex_led_colour_caps ( U8* pDataIn, U8 pDataInLen,
                               U8* pDataOut, U8* pDataOutLen );
U8 led_cmdex_led_get_state ( U8* pDataIn, U8 pDataInLen,
                             U8* pDataOut, U8* pDataOutLen );
U8 led_cmdex_led_set_state ( U8* pDataIn, U8 pDataInLen,
                             U8* pDataOut, U8* pDataOutLen );


#endif /* AVR32_LED_H_ */
