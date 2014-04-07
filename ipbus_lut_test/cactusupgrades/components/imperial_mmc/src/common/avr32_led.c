/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 * This files handles the LED part of the AMC specification (i.e. driving the
 * on-board LEDs).
 */

#include "imperial_mmc/avr32_led.h"
#include "imperial_mmc/avr32_arch.h"

static struct sLED_Info gLED_State[NUM_LEDS] =
{
  {
    // Blue LED
    .GPIO = LED_BLUE_GPIO,
    .On_Time = 0,
    .Cycle_Time = 0,
    .Next_On_Time = 0,
    .Next_Cycle_Time = 0,
    .Next_Valid = 0,
    .Counter = 0,
    .Colour = IPMP_COLOUR_BLUE,
    .Override = 0,
    .DefaultState = 1,
    .MinFlash = 1
  },
  {
    // Red LED
    .GPIO = LED_RED_GPIO,
    .On_Time = 0,
    .Cycle_Time = 0,
    .Next_On_Time = 0,
    .Next_Cycle_Time = 0,
    .Next_Valid = 0,
    .Counter = 0,
    .Colour = IPMP_COLOUR_RED,
    .Override = 0,
    .DefaultState = 0,
    .MinFlash = 1
  },
  {
    // Green LED
    .GPIO = LED_GREEN_GPIO,
    .On_Time = 0,
    .Cycle_Time = 0,
    .Next_On_Time = 0,
    .Next_Cycle_Time = 0,
    .Next_Valid = 0,
    .Counter = 0,
    .Colour = IPMP_COLOUR_GREEN,
    .Override = 0,
    .DefaultState = 0,
    .MinFlash = 1
  },
  {
    // Heartbeat LED
    .GPIO = LED_HEARTBEAT_GPIO,
    .On_Time = 500,
    .Cycle_Time = 1000,
    .Next_On_Time = 0,
    .Next_Cycle_Time = 0,
    .Next_Valid = 0,
    .Counter = 0,
    .Colour = IPMP_COLOUR_GREEN,
    .Override = 0,
    .DefaultState = 1,
    .MinFlash = 1
  }
};

void led_init()
{
  // Put the LEDs into their initial states
  // Logic is inverted so clearing pin turns it on.
  gpio_clr_gpio_pin ( LED_BLUE_GPIO );
  gpio_set_gpio_pin ( LED_RED_GPIO );
  gpio_set_gpio_pin ( LED_GREEN_GPIO );
  gpio_set_gpio_pin ( LED_HEARTBEAT_GPIO );
}

void led_control ( U8 pLEDID, U8 pLEDState )
{
  //dprintf("[LED%d] State: %d\n", pLEDID, pLEDState);
  if ( pLEDState )
  {
    gpio_clr_gpio_pin ( gLED_State[pLEDID].GPIO );
  }
  else
  {
    gpio_set_gpio_pin ( gLED_State[pLEDID].GPIO );
  }
}

U8 led_state ( U8 pLEDID )
{
  if ( gpio_get_pin_value ( gLED_State[pLEDID].GPIO ) )
  {
    return 0;
  }
  else
  {
    return 1;
  }
}

void led_prepare_next_state ( U8 pLEDID )
{
  // Don't go to the next state if we haven't done
  // the minimum number of flashes required
  if ( ( gLED_State[pLEDID].MinFlash > 1 ) &&
       ( gLED_State[pLEDID].Cycle_Time != 0 ) )
  {
    led_control ( pLEDID, 1 );
    gLED_State[pLEDID].MinFlash--;
    return;
  }

  // Update the cycle information if required
  if ( gLED_State[pLEDID].Next_Valid )
  {
    if ( gLED_State[pLEDID].Next_Valid == ON_NEXT )
    {
      led_control ( pLEDID, 1 );
      gLED_State[pLEDID].Cycle_Time = 0; // Static
      dprintf ( "LED %d: Now ON.\n", pLEDID );
    }
    else if ( gLED_State[pLEDID].Next_Valid == OFF_NEXT )
    {
      led_control ( pLEDID, 0 );
      gLED_State[pLEDID].Cycle_Time = 0; // Static
      dprintf ( "LED %d: Now OFF.\n", pLEDID );
    }
    else
    {
      led_control ( pLEDID, 1 ); // The first part of the flash is ON
      gLED_State[pLEDID].Cycle_Time = gLED_State[pLEDID].Next_Cycle_Time;
      gLED_State[pLEDID].On_Time = gLED_State[pLEDID].Next_On_Time;
      dprintf ( "LED %d: Now Flashing (On/Total %dms/%dms).\n", pLEDID, gLED_State[pLEDID].On_Time, gLED_State[pLEDID].Cycle_Time );
      dprintf ( "LED %d: Min Flash = %d.\n", pLEDID, gLED_State[pLEDID].MinFlash );
    }

    gLED_State[pLEDID].Next_Valid = 0;
  }
  else
  {
    // Next state isn't valid
    // Just turn the LED on if it should be
    if ( gLED_State[pLEDID].Cycle_Time > 0 )
    {
      led_control ( pLEDID, 1 );
    }
  }
}

void led_heartbeat ( char xIncrement )
{
  int i;

  // Process the state of each LED
  for ( i = 0; i < NUM_LEDS; i++ )
  {
    // If the cycle time is 0, the LED is in a static state.
    if ( gLED_State[i].Cycle_Time == 0 )
    {
      led_prepare_next_state ( i );
      continue;
    }

    // Count how many ms have passed
    if ( xIncrement )
    {
      gLED_State[i].Counter++;
    }

    if ( gLED_State[i].Counter >= gLED_State[i].Cycle_Time )
    {
      gLED_State[i].Counter = 0;
      // Update the timing if required
      led_prepare_next_state ( i );
    }

    if ( gLED_State[i].Counter == gLED_State[i].On_Time )
    {
      led_control ( i, 0 ); // Turn the LED off
    }
  }
}

U8 led_cmdex_led_props ( U8* pDataIn, U8 pDataInLen,
                         U8* pDataOut, U8* pDataOutLen )
{
  struct IPMI_CMD_LED_PROPS_RESP* xResp =
    ( struct IPMI_CMD_LED_PROPS_RESP* ) pDataOut;
  xResp->LEDSupport = 0x07; // I couldn't find the specs for this bit!
  xResp->NumLEDs = NUM_LEDS;
  *pDataOutLen = sizeof ( struct IPMI_CMD_LED_PROPS_RESP );
  dprintf ( "NOTE: [CMD] Set LED Properties.\n" );
  return IPMI_CC_OK;
}

U8 led_cmdex_led_colour_caps ( U8* pDataIn, U8 pDataInLen,
                               U8* pDataOut, U8* pDataOutLen )
{
  struct IPMI_CMD_LED_COLOUR_CAPS_REQ* xReq =
    ( struct IPMI_CMD_LED_COLOUR_CAPS_REQ* ) pDataIn;

  // Check the input data is long enough
  if ( pDataInLen < sizeof ( struct IPMI_CMD_LED_COLOUR_CAPS_REQ ) )
  {
    *pDataOutLen = 0;
    return IPMI_CC_REQ_DATA_INV_LENGTH;
  }

  // Check the requested LED does actually exist
  if ( xReq->LEDID >= NUM_LEDS )
  {
    *pDataOutLen = 0;
    return IPMI_CC_PARAM_OUT_OF_RANGE;
  }

  struct IPMI_CMD_LED_COLOUR_CAPS_RESP* xResp =
    ( struct IPMI_CMD_LED_COLOUR_CAPS_RESP* ) pDataOut;

  xResp->Capabilities = 1 << gLED_State[xReq->LEDID].Colour;

  xResp->DefaultColour = gLED_State[xReq->LEDID].Colour;

  xResp->DefaultOverrideColour = gLED_State[xReq->LEDID].Colour;

  *pDataOutLen = sizeof ( struct IPMI_CMD_LED_COLOUR_CAPS_RESP );

  dprintf ( "NOTE: [CMD] Get LED Capabilities.\n" );

  return IPMI_CC_OK;
}

U8 led_cmdex_led_get_state ( U8* pDataIn, U8 pDataInLen,
                             U8* pDataOut, U8* pDataOutLen )
{
  struct IPMI_CMD_LED_GET_STATE_REQ* xReq =
    ( struct IPMI_CMD_LED_GET_STATE_REQ* ) pDataIn;

  // Check there is enough input data
  if ( pDataInLen < sizeof ( struct IPMI_CMD_LED_GET_STATE_REQ ) )
  {
    *pDataOutLen = 0;
    return IPMI_CC_REQ_DATA_INV_LENGTH;
  }

  // Check the requested LED does actually exist
  if ( xReq->LEDID >= NUM_LEDS )
  {
    *pDataOutLen = 0;
    return IPMI_CC_PARAM_OUT_OF_RANGE;
  }

  // Prepare the response
  struct IPMI_CMD_LED_GET_STATE_RESP* xResp =
    ( struct IPMI_CMD_LED_GET_STATE_RESP* ) pDataOut;
  xResp->ControlState = 0x01; // Default to "Local Control"

  if ( gLED_State[xReq->LEDID].DefaultState )
  {
    xResp->LocalFn = LED_FN_ON;
  }
  else
  {
    xResp->LocalFn = LED_FN_OFF;
  }

  xResp->LocalOnTime = ( gLED_State[xReq->LEDID].On_Time / LED_TIME_SCALE );
  xResp->LocalColour = gLED_State[xReq->LEDID].Colour;
  *pDataOutLen = LED_GET_STATE_SIZE_NO_LEN;

  if ( gLED_State[xReq->LEDID].Override )
  {
    // LED is in override state, so write out some other info
    xResp->ControlState = 0x02; // State is overridden
    xResp->Opt_OverFnTime = 0; // TODO: Fix this!
    xResp->Opt_OverOnTime =
      ( gLED_State[xReq->LEDID].On_Time / LED_TIME_SCALE );
    *pDataOutLen = LED_GET_STATE_SIZE_O_LEN;
  }

  dprintf ( "NOTE: [CMD] Get LED State.\n" );
  return IPMI_CC_OK;
}

U8 led_cmdex_led_set_state ( U8* pDataIn, U8 pDataInLen,
                             U8* pDataOut, U8* pDataOutLen )
{
  struct IPMI_CMD_LED_SET_STATE* xReq =
    ( struct IPMI_CMD_LED_SET_STATE* ) pDataIn;

  // Check there is enough input data
  if ( pDataInLen < sizeof ( struct IPMI_CMD_LED_SET_STATE ) )
  {
    *pDataOutLen = 0;
    return IPMI_CC_REQ_DATA_INV_LENGTH;
  }

  // Check the requested LED does actually exist
  if ( xReq->LEDID >= NUM_LEDS )
  {
    *pDataOutLen = 0;
    return IPMI_CC_PARAM_OUT_OF_RANGE;
  }

  if ( xReq->LED_Function == LED_FN_LOCAL_CONTROL )
  {
    gLED_State[xReq->LEDID].Override = 0;

    // Reset the LED back to it's initial state
    if ( gLED_State[xReq->LEDID].DefaultState )
    {
      gLED_State[xReq->LEDID].Next_Valid = ON_NEXT;
    }
    else
    {
      gLED_State[xReq->LEDID].Next_Valid = OFF_NEXT;
    }

    gLED_State[xReq->LEDID].MinFlash = 1;
  }
  else if ( xReq->LED_Function == LED_FN_ON )
  {
    gLED_State[xReq->LEDID].Next_Valid = ON_NEXT;
    gLED_State[xReq->LEDID].Override = 1;
  }
  else if ( xReq->LED_Function == LED_FN_OFF )
  {
    gLED_State[xReq->LEDID].Next_Valid = OFF_NEXT;
    gLED_State[xReq->LEDID].Override = 1;
  }
  else
  {
    gLED_State[xReq->LEDID].Next_Valid = CYCLE_NEXT;
    gLED_State[xReq->LEDID].Override = 1;
    // Set-up the cycling states
    gLED_State[xReq->LEDID].Next_Cycle_Time =
      ( xReq->LED_Function + xReq->LED_OnTime ) * LED_TIME_SCALE;
    gLED_State[xReq->LEDID].Next_On_Time = xReq->LED_OnTime * LED_TIME_SCALE;

    // If we are ON -> Flash, we have to do a minimum of two flashes
    // otherwise the "single flash" isn't visible
    if ( ( gLED_State[xReq->LEDID].Cycle_Time == 0 ) &&
         ( led_state ( xReq->LEDID ) ) )
    {
      gLED_State[xReq->LEDID].MinFlash = 2;
    }
  }

  dprintf ( "NOTE: [CMD] Set LED State.\n" );
  // Force an LED update now to avoid race conditions!
  led_heartbeat ( FALSE );
  return IPMI_CC_OK;
}

