/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 * This file handles the FPGA control interface. It provides the functions
 * to get the FPGA state, reset it and controller the SD-card firmware loader.
 *
 */

#include "imperial_mmc/avr32_arch.h"
#include "imperial_mmc/avr32_fpga.h"
#include "imperial_mmc/avr32_sd.h"
#include "imperial_mmc/avr32_ipmi.h"
#include "imperial_mmc/avr32_sfwfs.h"
#include "imperial_mmc/avr32_dma_handlers.h"
#include "imperial_mmc/avr32_dma_pipe.h"

#ifdef MP7_REV
static U32 gTotal;
static U8 gFPGAState = 0;
char* gDefaultBinFile = "GoldenImage.bin"; // "testfile.bin"; //

static volatile U8 gTmpBuf[8192];



Bool fpga_dma_start ( U8 slot, void* ram, U32 nb_sector )
{
  AVR32_DMACA.sar1 = ( U32 ) &AVR32_MCI.fifo;
  AVR32_DMACA.dar1 = ( unsigned long ) ram;
  // Channel 1 Ctrl register high
  AVR32_DMACA.ctl1h =
    ( ( nb_sector* ( SD_MMC_SECTOR_SIZE/4 ) ) << AVR32_DMACA_CTL1H_BLOCK_TS_OFFSET ) // Block transfer size
    ;
  // Enable Channel 1 : start the process.
  AVR32_DMACA.chenreg = ( ( 2<<AVR32_DMACA_CHENREG_CH_EN_OFFSET ) | ( 2<<AVR32_DMACA_CHENREG_CH_EN_WE_OFFSET ) );

  // Wait for the end of the AES->RAM transfer (channel 1).
  while ( AVR32_DMACA.chenreg & ( 2<<AVR32_DMACA_CHENREG_CH_EN_OFFSET ) );

  return TRUE;
}



void fpga_run ( void )
{
  int xRet;
  static U32 xImgStart = 0;
  U32 xImgSize = 0;
  // Make sure we're not asserting the reset pin
  gpio_set_gpio_pin ( FPGA_PROG_B );

  if ( arch_read_pin ( FPGA_DONE ) )
  {
    gpio_set_gpio_pin ( LED_TRI_GREEN );
    return;
  }

  if ( !arch_read_pin ( FPGA_INIT_B ) )
  {
    return;
  }

  // We're going to program the FPGA, first check the SD card is ready.
  if ( sfwfs_mount() != SFWFS_ERR_NONE )
  {
    dprintf ( "[FPGA] File system unavailable.\n" );
    return;
  }

  bool UserFileFound = false;

  if ( gTextSpace[0] != 0 )
  {
    dprintf ( "[FPGA] Attempting to use FPGA image from text space, '%s').\n", gTextSpace );
    xRet = sfwfs_find ( gTextSpace , &xImgStart, &xImgSize );
    UserFileFound = ( xRet == SFWFS_ERR_NONE );
  }

  if ( !UserFileFound )
  {
    gTextSpace[0] = 0;
    dprintf ( "[FPGA] Attempting to use default FPGA image, '%s').\n", gDefaultBinFile );
    xRet = sfwfs_find ( gDefaultBinFile , &xImgStart, &xImgSize );
  }

  if ( xRet != SFWFS_ERR_NONE )
  {
    dprintf ( "[FPGA] Failed to open FPGA image (%d).\n", xRet );
    sfwfs_unmount();
    return;
  }

  dprintf ( "[FPGA] Loading...\n" );
  gpio_clr_gpio_pin ( LED_TRI_GREEN );
  sd_mmc_mci_card_init ( AVR32_SD_SLOT );

  if ( !sd_mmc_mci_dma_read_open ( AVR32_SD_SLOT, xImgStart, ( void* ) FPGA_ADDR, 40000 ) )
  {
    dprintf ( "[FPGA] Failed to open SD card for DMA...\n" );
    return;
  }

  U32 lSectorsRemaining = 40000;

  while ( lSectorsRemaining )
  {
    //sd_mmc_mci_read_multiple_sector_2_ram ( AVR32_SD_SLOT, FPGA_ADDR, 16 );
    fpga_dma_start ( AVR32_SD_SLOT, ( void* ) FPGA_ADDR, 16 );
    lSectorsRemaining -= 16;

    if ( gIPMI_needs_checking )
    {
      ipmi_process();
    }
  }

  sd_mmc_mci_read_close ( AVR32_SD_SLOT );
  sfwfs_unmount();

  if ( arch_read_pin ( FPGA_DONE ) )
  {
    dprintf ( "[FPGA] Programming complete\n" );
    gpio_set_gpio_pin ( LED_TRI_GREEN );
  }
  else
  {
    dprintf ( "[FPGA] Programming failed\n" );

    if ( gTextSpace[0] != 0 )
    {
      gTextSpace[0] = 0;
    }

    return;
  }

  fpga_configure_networking();
  dma_pipe_reset ();
  dprintf ( "[FPGA] Initial configuration complete\n" );
}


void fpga_reset ( void )
{
  // Reset the FPGA config by pulling prog_b low
  dprintf ( "[FPGA] Reset.\n" );
  gpio_set_gpio_pin ( FPGA_PROG_B );
  cpu_delay_cy ( 100 );
  gpio_clr_gpio_pin ( FPGA_PROG_B );
  cpu_delay_cy ( 100 );
  gpio_set_gpio_pin ( FPGA_PROG_B );
}


int fpga_ready ( void )
{
  return arch_read_pin ( FPGA_DONE );
}



int fpga_configure_networking()
{
  if ( !fpga_ready () )
  {
    return false;
  }

  U8 xRARP = 0;
  U8 xMAC[6] = { 0x00 };
  U8 xIP[4] = { 0x00 };
  fru_get_net_rarp ( &xRARP );
  fru_get_net_ip ( xIP );
  fru_get_net_mac ( xMAC );
  U32 sendIPconfig[3];
  U32 retIPconfig[3];
#ifdef BIG_ENDIAN_MCU
  sendIPconfig[0] = ( xMAC[2]<<24 ) | ( xMAC[3]<<16 ) | ( xMAC[4]<<8 ) | ( xMAC[5]<<0 );
  sendIPconfig[1] = ( xMAC[0]<<8 ) | ( xMAC[1]<<0 ) ;
  sendIPconfig[2] = * ( U32* ) xIP;
#else
  sendIPconfig[0] = * ( U32* ) xMAC;
  sendIPconfig[1] = * ( U32* ) ( xMAC+4 );
  sendIPconfig[2] = Swap32 ( * ( U32* ) xIP );
#endif
  sendIPconfig[1] &= 0x0000FFFF;

  if ( xRARP )
  {
    sendIPconfig[1] |= 0x00030000; //Enable RARP and UDP
  }
  else
  {
    sendIPconfig[1] |= 0x00010000; //Enable UDP
  }

  spi_ipbus_read ( 0x00000001 , &retIPconfig[0] , 1 , false , true );
  spi_ipbus_read ( 0x00000002 , &retIPconfig[1] , 1 , false , true );
  spi_ipbus_read ( 0x00000003 , &retIPconfig[2] , 1 , false , true );

  if ( ( retIPconfig[0]!=sendIPconfig[0] ) || ( retIPconfig[1]!=sendIPconfig[1] ) || ( retIPconfig[2]!=sendIPconfig[2] ) )
  {
    dprintf ( "[Net] Configure networking [ 0x%08lX , 0x%08lX , 0x%08lX]\n", sendIPconfig[2] , sendIPconfig[1] , sendIPconfig[0] );
    dprintf ( "[Net] IP: %u.%u.%u.%u , MAC: %02lX:%02lX:%02lX:%02lX:%02lX:%02lX\n", xIP[0], xIP[1], xIP[2], xIP[3], xMAC[0], xMAC[1], xMAC[2], xMAC[3], xMAC[4], xMAC[5] );
    spi_ipbus_write ( 0x00000001 , &sendIPconfig[0] , 1 , false , true );
    spi_ipbus_write ( 0x00000002 , &sendIPconfig[1] , 1 , false , true );
    spi_ipbus_write ( 0x00000003 , &sendIPconfig[2] , 1 , false , true );
  }

  return true;
}


#endif
