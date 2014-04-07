/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 * A simple timer library wrapper around the UC3 framework,
 * providing timer callbacks. This is probably only used by the
 * LED module.
 */

#include "imperial_mmc/avr32_timer.h"

#include "imperial_mmc/avr32_arch.h"

// The callback function which is called from the interrupt
timer_cb gTimerCallback = NULL;

// A struct describing the timer set-up
static const tc_waveform_opt_t TC_WAVEFORM =
{
  .channel = COUNTER_CHAN,
  // Do nothing special and just keep counting
  .bswtrg  = TC_EVT_EFFECT_NOOP,
  .beevt   = TC_EVT_EFFECT_NOOP,
  .bcpc    = TC_EVT_EFFECT_NOOP,
  .bcpb    = TC_EVT_EFFECT_NOOP,
  .aswtrg  = TC_EVT_EFFECT_NOOP,
  .aeevt   = TC_EVT_EFFECT_NOOP,
  .acpc    = TC_EVT_EFFECT_NOOP,
  .acpa    = TC_EVT_EFFECT_NOOP,
  // Trigger on the TC compare
  .wavsel  = TC_WAVEFORM_SEL_UP_MODE_RC_TRIGGER,
  .enetrg  = 0,
  .eevt    = 0,
  .eevtedg = TC_SEL_NO_EDGE,
  .cpcdis  = 0,
  .cpcstop = 0,
  .burst   = 0,
  .clki    = 0,
  // Clock from clock source 3 (Primary osc / 8)
  // @12MHz, this should run a 1.5MHz
  .tcclks  = TC_CLOCK_SOURCE_TC3
};

static const tc_interrupt_t TC_INTERRUPT =
{
  .etrgs = 0,
  .ldrbs = 0,
  .ldras = 0,
  .cpcs  = 1, // Trigger on the RC compare interrupt
  .cpbs  = 0,
  .cpas  = 0,
  .lovrs = 0,
  .covfs = 0
};

__attribute__ ( ( __interrupt__ ) ) static void timer_interrupt ( void )
{
  // Read the register to ack the interrupt
  tc_read_sr ( &AVR32_TC0, COUNTER_CHAN );

  // Call the callback function if set
  if ( gTimerCallback )
  {
    gTimerCallback();
  }

  return;
}

void timer_init()
{
  // Initialise the timer module
  dprintf ( "Starting Timer.\n" );
  // Register our interrupt
  Disable_global_interrupt();
  INTC_register_interrupt ( &timer_interrupt,
                            COUNTER_INTERRUPT, AVR32_INTC_INT0 );
  Enable_global_interrupt();
  // Set-up the counter waveform
  tc_init_waveform ( &AVR32_TC0, &TC_WAVEFORM );
  // Set RC for 1ms countdown
  tc_write_rc ( &AVR32_TC0, COUNTER_CHAN,
                ( FOSCM_PB / 8 ) / 1000 );
  tc_configure_interrupts ( &AVR32_TC0, COUNTER_CHAN,
                            &TC_INTERRUPT );
  // Timer is ready to run.
  tc_start ( &AVR32_TC0, COUNTER_CHAN );
}

void timer_register ( timer_cb pCallback )
{
  gTimerCallback = pCallback;
}

void timer_unregister()
{
  gTimerCallback = NULL;
}
