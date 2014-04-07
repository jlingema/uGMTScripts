/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 */

#ifndef AVR32_ARCH_H_
#define AVR32_ARCH_H_

// Some defines are required before the includes
// We need these for the sd_mmc library to compile even if it's not used
#define SD_SLOT_4BITS 1
#define SD_SLOT_4BITS_CLK_PIN             AVR32_MCI_CLK_0_PIN
#define SD_SLOT_4BITS_CLK_FUNCTION        AVR32_MCI_CLK_0_FUNCTION
#define SD_SLOT_4BITS_CMD_PIN             AVR32_MCI_CMD_0_PIN
#define SD_SLOT_4BITS_CMD_FUNCTION        AVR32_MCI_CMD_0_FUNCTION
#define SD_SLOT_4BITS_DATA0_PIN           AVR32_MCI_DATA_0_PIN
#define SD_SLOT_4BITS_DATA0_FUNCTION      AVR32_MCI_DATA_0_FUNCTION
#define SD_SLOT_4BITS_DATA1_PIN           AVR32_MCI_DATA_1_PIN
#define SD_SLOT_4BITS_DATA1_FUNCTION      AVR32_MCI_DATA_1_FUNCTION
#define SD_SLOT_4BITS_DATA2_PIN           AVR32_MCI_DATA_2_PIN
#define SD_SLOT_4BITS_DATA2_FUNCTION      AVR32_MCI_DATA_2_FUNCTION
#define SD_SLOT_4BITS_DATA3_PIN           AVR32_MCI_DATA_3_PIN
#define SD_SLOT_4BITS_DATA3_FUNCTION      AVR32_MCI_DATA_3_FUNCTION
#define SD_SLOT_4BITS_CARD_DETECT         AVR32_PIN_PA24
#define SD_SLOT_4BITS_CARD_DETECT_VALUE   0
#define SD_SLOT_4BITS_WRITE_PROTECT       AVR32_PIN_PA24
#define SD_SLOT_4BITS_WRITE_PROTECT_VALUE 1
#define SD_SLOT_8BITS                     0
#define SD_SLOT_8BITS_CLK_PIN             AVR32_MCI_CLK_0_PIN
#define SD_SLOT_8BITS_CLK_FUNCTION		  AVR32_MCI_CLK_0_FUNCTION
#define SD_SLOT_8BITS_CMD_PIN             AVR32_MCI_CMD_0_PIN
#define SD_SLOT_8BITS_CMD_FUNCTION        AVR32_MCI_CMD_0_FUNCTION
#define SD_SLOT_8BITS_DATA0_PIN           AVR32_MCI_DATA_0_PIN
#define SD_SLOT_8BITS_DATA0_FUNCTION      AVR32_MCI_DATA_0_FUNCTION
#define SD_SLOT_8BITS_DATA1_PIN           AVR32_MCI_DATA_1_PIN
#define SD_SLOT_8BITS_DATA1_FUNCTION      AVR32_MCI_DATA_1_FUNCTION
#define SD_SLOT_8BITS_DATA2_PIN           AVR32_MCI_DATA_2_PIN
#define SD_SLOT_8BITS_DATA2_FUNCTION      AVR32_MCI_DATA_2_FUNCTION
#define SD_SLOT_8BITS_DATA3_PIN           AVR32_MCI_DATA_3_PIN
#define SD_SLOT_8BITS_DATA3_FUNCTION      AVR32_MCI_DATA_3_FUNCTION
#define SD_SLOT_8BITS_DATA4_PIN           0
#define SD_SLOT_8BITS_DATA4_FUNCTION      0
#define SD_SLOT_8BITS_DATA5_PIN           0
#define SD_SLOT_8BITS_DATA5_FUNCTION      0
#define SD_SLOT_8BITS_DATA6_PIN           0
#define SD_SLOT_8BITS_DATA6_FUNCTION      0
#define SD_SLOT_8BITS_DATA7_PIN           0
#define SD_SLOT_8BITS_DATA7_FUNCTION      0
#define SD_SLOT_8BITS_CARD_DETECT         AVR32_PIN_PA24
#define SD_SLOT_8BITS_CARD_DETECT_VALUE   0
#define SD_SLOT_8BITS_WRITE_PROTECT       AVR32_PIN_PA24
#define SD_SLOT_8BITS_WRITE_PROTECT_VALUE 1

// Currently we only target 1 CPU so all includes are relevant
#include <avr32/uc3a3256.h>
#include <string.h>

#include "pm.h" // Include power management
#include "intc.h" // Interrupt controller
#include "gpio.h" // Include GPIO control
#include "tc.h" // Timer/counter driver
#include "twim.h" // TWI master driver
#include "twis.h" // TWI slave driver
#include "flashc.h" // Flash programming driver
#include "wdt.h" // Watch-dog timer
#include "spi.h" // SPI driver
#include "cycle_counter.h" // Handy delay routines
#include "adc.h" // ADC for power supply checking
#include "sd_mmc_mci.h"

#include "avr32_debug.h"

// Definition of the MINI-T board revision
// Different revisions have some major stuff moved round (like Crate I2C), so set carefully!
// NOTE: This can only go up to 9, above this other stuff may need changing
// WARN: This is now set in the project properties


#define GPIO_DRIVE_LOW 0
#define GPIO_DRIVE_HIGH 1
#define GPIO_FLOAT 2

#define ENTER_CRTICAL_SECTION Disable_global_interrupt
#define EXIT_CRITICAL_SECTION Enable_global_interrupt

// See comments above for descriptions of definitions
#define FOSC_STARTUP 32768
#define FOSC_MAIN 12000000

// Clocks & Oscillators
// Frequency of start-up oscillator (Hz)
#define FOSCST 32768
#define FOSCSST_STARTUP AVR32_PM_OSCCTRL0_STARTUP_2048_RCOSC
// Frequency of CPU core
#define FOSCM 66000000
// Frequency of PBA/PBB busses
#define FOSCM_PB (FOSCM/3)
#define FOSCM_STARTUP AVR32_PM_OSCCTRL1_STARTUP_2048_RCOSC
// Frequency of OSC0
#define FOSC0 12000000
#define FOSC0_STARTUP AVR32_PM_OSCCTRL1_STARTUP_2048_RCOSC

// The timer channel to use for the 1ms heartbeat
#define COUNTER_CHAN 0
#define COUNTER_INTERRUPT AVR32_TC0_IRQ0

#ifdef MINI_T5_REV
// LED GPIO Pins
#define NUM_LEDS 4
// LED0 is BLUE LED
#define LED0_GPIO AVR32_PIN_PA18
// LED1-3 are optional.
#define LED1_GPIO AVR32_PIN_PA16
#define LED2_GPIO AVR32_PIN_PA10
#define LED3_GPIO AVR32_PIN_PA19
#else // MP7_REV cards...
// LED GPIO Pins
#define NUM_LEDS 4
// LED0 is BLUE LED
#define LED0_GPIO AVR32_PIN_PA18
// LED1-3 are optional.
#define LED1_GPIO AVR32_PIN_PA16
#define LED2_GPIO AVR32_PIN_PA07
#define LED3_GPIO AVR32_PIN_PA19
#define LED_TRI_RED   AVR32_PIN_PX47
#define LED_TRI_GREEN AVR32_PIN_PX48
#define LED_TRI_BLUE  AVR32_PIN_PX49
#endif

// Input/Output GPIO Pins
// GPIO line connected to hot-swap handle sensor
#define HOTSWAP_GPIO AVR32_PIN_PA20
// Following not actually used on boards >Mini-T5R1
#define ENABLESIG_GPIO AVR32_PIN_PA21

// Most of these defines don't make any sense on the EVK1104 board
// But for basic testing we have to set them anyway.
#ifdef MINI_T5_REV
#define GA0_GPIO AVR32_PIN_PA07
#define GA1_GPIO AVR32_PIN_PA08
#define GA2_GPIO AVR32_PIN_PA09
// The pin which drives the address lines via resistors
#define GADRIVER_GPIO AVR32_PIN_PA06
#else
// Different pins on MP7
#define GA0_GPIO AVR32_PIN_PA04
#define GA1_GPIO AVR32_PIN_PA05
#define GA2_GPIO AVR32_PIN_PA06
#define GADRIVER_GPIO AVR32_PIN_PA03
#endif

// I2C/TWI Pins
#if (MINI_T5_REV <= 1) && !defined(MP7_REV)
#define TWI_GPIO_CLK AVR32_TWIMS0_TWCK_0_0_PIN
#define TWI_GPIO_CLK_FN AVR32_TWIMS0_TWCK_0_0_FUNCTION
#define TWI_GPIO_DATA AVR32_TWIMS0_TWD_0_0_PIN
#define TWI_GPIO_DATA_FN AVR32_TWIMS0_TWD_0_0_FUNCTION
#define CRATE_TWIM_MODULE (AVR32_TWIM0)
#define CRATE_TWIS_MODULE (AVR32_TWIS0)
#else
// IPMB-L TWI pins are the same on MINI_T5R2 and MINI-T7
#define TWI_GPIO_CLK AVR32_TWIMS1_TWCK_0_PIN
#define TWI_GPIO_CLK_FN AVR32_TWIMS1_TWCK_0_FUNCTION
#define TWI_GPIO_DATA AVR32_TWIMS1_TWD_0_PIN
#define TWI_GPIO_DATA_FN AVR32_TWIMS1_TWD_0_FUNCTION
#define CRATE_TWIM_MODULE (AVR32_TWIM1)
#define CRATE_TWIS_MODULE (AVR32_TWIS1)
#endif

#if defined(MP7_REV)
#define TWI_SENS_CLK AVR32_TWIMS0_TWCK_0_0_PIN
#define TWI_SENS_CLK_FN AVR32_TWIMS0_TWCK_0_0_FUNCTION
#define TWI_SENS_DATA AVR32_TWIMS0_TWD_0_0_PIN
#define TWI_SENS_DATA_FN AVR32_TWIMS0_TWD_0_0_FUNCTION
#define TWI_SENS_MPLEX_RST AVR32_PIN_PX44
#define MP7_SENS_TWIM_MODULE (AVR32_TWIM0)
#endif


// Time until a watchdog timeout (us) (in this case 3 seconds...)
#define IPMI_WDT_TIMEOUT 3000000

// SPI Pins
#define SPI0_GPIO_SCK      AVR32_SPI0_SCK_0_1_PIN
#define SPI0_GPIO_SCK_FN   AVR32_SPI0_SCK_0_1_FUNCTION
#define SPI0_GPIO_MISO     AVR32_SPI0_MISO_0_1_PIN
#define SPI0_GPIO_MISO_FN  AVR32_SPI0_MISO_0_1_FUNCTION
#define SPI0_GPIO_MOSI     AVR32_SPI0_MOSI_0_1_PIN
#define SPI0_GPIO_MOSI_FN  AVR32_SPI0_MOSI_0_1_FUNCTION
#define SPI0_GPIO_CS0      AVR32_SPI0_NPCS_0_1_PIN
#define SPI0_GPIO_CS0_FN   AVR32_SPI0_NPCS_0_1_FUNCTION

#define SPI0_MEM_SEL 0

#ifdef MINI_T5_REV
// We'll only use SPI1 on MINI-T5 boards for now
#define SPI1_GPIO_SCK      AVR32_SPI1_SCK_0_2_PIN
#define SPI1_GPIO_SCK_FN   AVR32_SPI1_SCK_0_2_FUNCTION
#define SPI1_GPIO_MISO     AVR32_SPI1_MISO_0_2_PIN
#define SPI1_GPIO_MISO_FN  AVR32_SPI1_MISO_0_2_FUNCTION
#define SPI1_GPIO_MOSI     AVR32_SPI1_MOSI_0_2_PIN
#define SPI1_GPIO_MOSI_FN  AVR32_SPI1_MOSI_0_2_FUNCTION
#define SPI1_GPIO_CS0      AVR32_SPI1_NPCS_0_1_PIN
#define SPI1_GPIO_CS0_FN   AVR32_SPI1_NPCS_0_1_FUNCTION
#define SPI1_GPIO_CS1      AVR32_SPI1_NPCS_1_1_PIN
#define SPI1_GPIO_CS1_FN   AVR32_SPI1_NPCS_1_1_FUNCTION

#define SPI1_MEM_SEL 0
#define SPI1_TEMP_SEL 1
#endif

#define USB_GPIO_ID        AVR32_USBB_USB_ID_0_0_PIN
#define USB_GPIO_ID_FN     AVR32_USBB_USB_ID_0_0_FUNCTION
#define USB_GPIO_VOBF      AVR32_USBB_USB_VBOF_0_0_PIN
#define USB_GPIO_VOBF_FN   AVR32_USBB_USB_VBOF_0_0_FUNCTION

// Size of the SPI memory
// (Used to calculate if upper or lower handshake flag should be set!)
#define SPI_MEM_SIZE 0x0FFF

// Various pins relating to power supply
#ifdef MINI_T5_REV
#define PWR_GPIO_12V      AVR32_ADC_AD_1_PIN
#define PWR_GPIO_12V_FN   AVR32_ADC_AD_1_FUNCTION
#define PWR_GPIO_12V_CHAN 1 // ADC Chan for 12V power
#define PWR_GPIO_3_3V     AVR32_PIN_PB08
#define PWR_GPIO_2_5V     AVR32_PIN_PB09
#define PWR_GPIO_1_8V     AVR32_PIN_PA11
#define PWR_GPIO_1_5V     AVR32_PIN_PB10
#define PWR_GPIO_1_0V     AVR32_PIN_PB11
#define PWR_GPIO_ENABLE   AVR32_PIN_PB07
#else
// MP7 power lines
#define PWR_GPIO_12V      AVR32_ADC_AD_1_PIN
#define PWR_GPIO_12V_FN   AVR32_ADC_AD_1_FUNCTION
#define PWR_GPIO_12V_CHAN 1 // ADC Chan for 12V power
#define PWR_GPIO_3_3V     AVR32_PIN_PB08
#define PWR_GPIO_2_5V     AVR32_PIN_PB09
#define PWR_GPIO_1_8V     AVR32_PIN_PA11
#define PWR_GPIO_1_5V     AVR32_PIN_PB10
#define PWR_GPIO_1_0V     AVR32_PIN_PB04
#define PWR_GPIO_ENABLE   AVR32_PIN_PB07
// TODO: PGOOD_AT lines
#endif

#ifdef MP7_REV
// Before FPGA boot:
#define FPGA_GPIO_RESET   AVR32_PIN_PB11
#define FPGA_PROG_B       AVR32_PIN_PX53
#define FPGA_INIT_B       AVR32_PIN_PX54
#define FPGA_DONE         AVR32_PIN_PX55
// After FPGA boot:
#define FPGA_IPBUS_DONE   AVR32_PIN_PB11
#define FPGA_IPBUS_NEW    AVR32_PIN_PX56
#endif

// A simple function to initialise the architecture
void arch_init ( void );
U8 arch_read_pin ( U8 pPin );
void arch_set_pin ( U8 pPin, U8 pState );
U8 arch_get_addr ( void );
U8 arch_get_slot ( void );

#endif /* AVR32_ARCH_H_ */
