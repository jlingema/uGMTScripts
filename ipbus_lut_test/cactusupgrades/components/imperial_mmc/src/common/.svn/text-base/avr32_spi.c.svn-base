/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 * An SPI driver library for IPBus. This provided the transport for the old
 * IPBus over SPI interface and should no-longer be used.
 * There is also an interface for the SPI temperature sensor used on the
 * MINI-T5 boards (but nothing for the MP7 here).
 */

#include "imperial_mmc/avr32_spi.h"
#include "avr32_arch.h"


U8 gOldSPIFlags = 0x00;
// The callback function which is called if the handshake flags change
spi_cb gSPIMemCallback = NULL;

// SPI Options
static spi_options_t SPI0_OPTS =
{
  .reg = 0,
  .baudrate = 4000000, // Run the SPI bus at 4MHz
  .bits = 16, // Use 8bit data
  // It might be possible to change bit count at runtime, but this didn't easily work.
  .spck_delay = 0, // No delay after address
  .trans_delay = 0, // No delay after each byte
  .stay_act = 1, // Stay active after transfer (We'll control the CS line)
  // SPI mode
  // Spec says clock should be low then high (CPOL = 0)
  // Data-in should be sampled in NPCHA = 0 mode
  // CPOL=0, NPCHA=0 is mode 1.
  .spi_mode = 0, // SPI Mode
  .modfdis = 1 // Mod fault disable = 1
};
static spi_options_t SPI1_OPTS =
{
  .reg = 1,
  .baudrate = 1000000, // Run the SPI bus at 1MHz
  .bits = 16, // Use 16bits
  .spck_delay = 100, // No delay after address
  .trans_delay = 100, // No delay after each byte
  .stay_act = 1, // Stay active after transfer (We'll control the CS line)
  .spi_mode = 0, // SPI Mode
  .modfdis = 1 // Mod fault disable = 1
};

void spi_master_init()
{
  // Set-up the SPI master
  spi_initMaster ( &AVR32_SPI0, &SPI0_OPTS );
  // Configure the SPI master selection modes
  spi_selectionMode ( &AVR32_SPI0,
                      0,  // variable_ps -- Address slave for every byte
                      0,  // pcs_decode -- External decoder
                      0 ); // delay -- Chip select delay
  //AVR32_SPI0.MR.llb = 0x1;
  // Enable the SPI interface
  spi_enable ( &AVR32_SPI0 );
  // Setup the chip settings for the selected slave
  spi_setupChipReg ( &AVR32_SPI0, &SPI0_OPTS, FOSCM_PB );
  // Init the second SPI bus (Mainly for temp sensor)
  spi_initMaster ( &AVR32_SPI1, &SPI1_OPTS );
  spi_selectionMode ( &AVR32_SPI1, 0, 0, 100 );
  //AVR32_SPI1.MR.llb = 0x1;
  spi_enable ( &AVR32_SPI1 );
  spi_setupChipReg ( &AVR32_SPI1, &SPI1_OPTS, FOSCM_PB );
  // We also need to reset the status flags on the FPGA
  // If these are set, our first transaction might fail
  //spi_mem_clr_wrhf(SPI_MEM_WRHF_ALL_MASK);
}

//// "Any-size" memory transation
//int spi_mem_trans ( U8 pWrite,
//                    U16 pAddr,
//                    U8* pData,
//                    U16 pLen,
//                    U8 pFlag )
//{
//  int xRemain;
//  int xDone;
//
//  // Write the memory in 16 byte chunks
//  for ( xRemain = pLen, xDone = 0;
//        xRemain > 0;
//        xRemain -= 16, xDone += 16 )
//  {
//    int xSize = 16;
//
//    if ( xRemain < 16 )
//    {
//      xSize = xRemain;
//    }
//
//    if ( pWrite )
//    {
//      spi_mem_write ( pAddr + xDone, pData + xDone, xSize, 0 );
//    }
//    else
//    {
//      spi_mem_read ( pAddr + xDone, pData + xDone, xSize );
//    }
//  }
//
//  if ( pWrite && pFlag )
//  {
//    U8 xFlags = 0x00;
//
//    // If lowest byte is in low-mem range, set low flag
//    if ( pAddr <= ( SPI_MEM_SIZE / 2 ) )
//    {
//      xFlags |= SPI_MEM_WRHF_LSTB_MASK;
//    }
//
//    // If highest byte is in high-mem range, set high flag
//    if ( ( pAddr + pLen ) > ( SPI_MEM_SIZE / 2 ) )
//    {
//      xFlags |= SPI_MEM_WRHF_USTB_MASK;
//    }
//
//    // If flags are now set, send them to FPGA
//    if ( xFlags )
//    {
//      spi_mem_set_wrhf ( xFlags );
//    }
//  }
//
//  return 0;
//}


U16 spi_transfer16 ( U16 pData )
{
  U16 lReturn;
  spi_write ( &AVR32_SPI0, pData );
  spi_read ( &AVR32_SPI0, &lReturn );
  return lReturn;
}


U32 spi_transfer32 ( U32 pData )
{
#ifndef BIG_ENDIAN_MCU
  pData = Swap32 ( pData );
#endif //BIG_ENDIAN_MCU
  U32 lReturn;
  spi_write ( &AVR32_SPI0, * ( ( U16* ) ( &pData ) +1 ) );
  spi_read ( &AVR32_SPI0, ( ( U16* ) ( &lReturn ) +1 ) );
  spi_write ( &AVR32_SPI0, * ( ( U16* ) ( &pData ) ) );
  spi_read ( &AVR32_SPI0, ( ( U16* ) ( &lReturn ) ) );
#ifndef BIG_ENDIAN_MCU
  lReturn = Swap32 ( lReturn );
#endif //BIG_ENDIAN_MCU
  return lReturn;
}





int spi_mem_write ( U32* pData, U32 pLen )
{
  U16 xReturn = 0;
  int i = 0;
  spi_selectChip ( &AVR32_SPI0, SPI0_MEM_SEL );
  U16 control = 0x0000;
  //    dprintf("SPI : SEND HEADER: 0x%02X\n", control );
  spi_write ( &AVR32_SPI0, control );
  spi_read ( &AVR32_SPI0, &control );
  //We need to send the counter
  U32 len = pLen;
#ifndef BIG_ENDIAN_MCU
  len = Swap32 ( len );
#endif //BIG_ENDIAN_MCU
  //	dprintf("SPI : SEND COUNTER: 0x%08lX\n", len );
  spi_write ( &AVR32_SPI0, * ( ( U16* ) ( &len ) +1 ) );
  spi_read ( &AVR32_SPI0, &xReturn );
  spi_write ( &AVR32_SPI0, * ( ( U16* ) ( &len ) ) );
  spi_read ( &AVR32_SPI0, &xReturn );

  // Now send the data
  for ( i = 0; i != pLen; ++i )
  {
#ifndef BIG_ENDIAN_MCU
    pData[i] = Swap32 ( pData[i] );
#endif //BIG_ENDIAN_MCU
    //	dprintf("SPI : WRITE: 0x%08lX\n", pData[i] );
    spi_write ( &AVR32_SPI0, * ( ( U16* ) ( pData+i ) +1 ) );
    spi_read ( &AVR32_SPI0, &xReturn );
    spi_write ( &AVR32_SPI0, * ( ( U16* ) ( pData+i ) ) );
    spi_read ( &AVR32_SPI0, &xReturn );
  }

  spi_unselectChip ( &AVR32_SPI0, SPI0_MEM_SEL );
  return 0;
}


int spi_mem_read ( U32* pData, U32 pLen )
{
  int i = 0;
  spi_selectChip ( &AVR32_SPI0, SPI0_MEM_SEL );
  U16 control = 0x0001;
  U16 send = 0xFFFF;
  //  dprintf("SPI : SEND HEADER: 0x%02X\n", control );
  spi_write ( &AVR32_SPI0, control );
  spi_read ( &AVR32_SPI0, &control );
  //We need to receive the counter
  U32 len;
  spi_write ( &AVR32_SPI0, send );
  spi_read ( &AVR32_SPI0, ( ( U16* ) ( &len ) +1 ) );
  spi_write ( &AVR32_SPI0, send );
  spi_read ( &AVR32_SPI0, ( ( U16* ) ( &len ) ) );
#ifndef BIG_ENDIAN_MCU
  len = Swap32 ( len );
#endif //BIG_ENDIAN_MCU
  //	dprintf("SPI : RECEIVED COUNTER: 0x%08lX\n", len );

  if ( len < pLen )
  {
    dprintf ( "Received Counter is less than requested read size, returning\n" );
    spi_unselectChip ( &AVR32_SPI0, SPI0_MEM_SEL );
    return -1;
  }

  U32 reply;

  // Now send the data
  for ( i = 0; i != pLen; ++i )
  {
    spi_write ( &AVR32_SPI0, send );
    spi_read ( &AVR32_SPI0, ( ( U16* ) ( pData+i ) +1 ) );

    if ( i == ( pLen-1 ) )
    {
      send = 0x0000;
    }

    spi_write ( &AVR32_SPI0, send );
    spi_read ( &AVR32_SPI0, ( ( U16* ) ( pData+i ) ) );
    //		dprintf("SPI : REPLY: 0x%08lX\n", pData[i] );
#ifndef BIG_ENDIAN_MCU
    pData[i] = Swap32 ( pData[i] );
#endif //BIG_ENDIAN_MCU
  }

  // de-assert CS_B
  spi_unselectChip ( &AVR32_SPI0, SPI0_MEM_SEL );
  return 0;
}





//int spi_mem_rdsr ( U8* pSRVal )
//{
//  U16 xRet;
//  spi_selectChip ( &AVR32_SPI0, SPI0_MEM_SEL );
//  // Sent the command
//  spi_write ( &AVR32_SPI0, SPI_MEM_CMD_RDSR );
//  spi_read ( &AVR32_SPI0, &xRet );
//  // Get the result
//  spi_write ( &AVR32_SPI0, 0x00 );
//  spi_read ( &AVR32_SPI0, &xRet );
//  *pSRVal = ( U8 ) ( xRet & 0xFF );
//  // Deactivalte CS_B
//  spi_unselectChip ( &AVR32_SPI0, SPI0_MEM_SEL );
//  return 0;
//}
//
//int spi_mem_set_wrhf ( U8 pFlags )
//{
//  U16 xRet;
//  spi_selectChip ( &AVR32_SPI0, SPI0_MEM_SEL );
//  // Send the commands
//  spi_write ( &AVR32_SPI0, SPI_MEM_CMD_WRHF );
//  spi_read ( &AVR32_SPI0, &xRet );
//  // Send the flags along with the set flag
//  spi_write ( &AVR32_SPI0, pFlags | SPI_MEM_WRHF_SET_MASK );
//  spi_read ( &AVR32_SPI0, &xRet );
//  // Update our internal flag reference
//  gOldSPIFlags |= pFlags;
//  spi_unselectChip ( &AVR32_SPI0, SPI0_MEM_SEL );
//  return 0;
//}
//
//int spi_mem_clr_wrhf ( U8 pFlags )
//{
//  U16 xRet;
//  spi_selectChip ( &AVR32_SPI0, SPI0_MEM_SEL );
//  // Send the command
//  spi_write ( &AVR32_SPI0, SPI_MEM_CMD_WRHF );
//  spi_read ( &AVR32_SPI0, &xRet );
//  // Send the flags along with the clear flag
//  spi_write ( &AVR32_SPI0, pFlags | SPI_MEM_WRHF_CLR_MASK );
//  spi_read ( &AVR32_SPI0, &xRet );
//  // Update internal flags
//  gOldSPIFlags &= ~pFlags;
//  spi_unselectChip ( &AVR32_SPI0, SPI0_MEM_SEL );
//  return 0;
//}
//
//int spi_ipbus_issue ( U16 pLen, U8* pDataIn )
//{
//  U8 xSizeBytes[4] = {};
//  U16 xLen = pLen + 3; // Ensure the address is rounded up.
//  xSizeBytes[3] = ( xLen / 4 ) & 0xFF;
//  xSizeBytes[2] = ( ( xLen / 4 ) >> 8 ) & 0x03;
//  // Write the address
//  spi_mem_write ( 0x0, xSizeBytes, 4, FALSE );
//  // Write the data packet
//  spi_mem_trans ( TRUE, 0x4, pDataIn, pLen, FALSE ); // TODO: Work out why this line crashes in Release builds
//  // Now set the flag to issue the FPGA transaction
//  //spi_mem_set_wrhf(SPI_MEM_WRHF_TRANS_MASK);
//  return 0;
//}
//
//U16 spi_ipbus_response ( U16 pBufLen, U8* pDataOut )
//{
//  U8 xSize[4] = {};
//  U16 xLen;
//  // Read the response size (in 32-bit words)
//  spi_mem_read ( 0x1000, xSize, 4 );
//  // Decode the length into bytes
//  xLen = ( xSize[3] + ( ( xSize[2] & 0x3 ) << 8 ) );
//  xLen *= 4;
//  xLen = 32;
//
//  // Check we have enough space for the response
//  if ( xLen > pBufLen )
//  {
//    return -1;
//  }
//
//  // Read the actual packet
//  spi_mem_trans ( FALSE, 0x1004, pDataOut, xLen, FALSE );
//  // We can now also clear our transaction flag
//  //spi_mem_clr_wrhf(SPI_MEM_WRHF_TRANS_MASK);
//  return xLen;
//}
//
//void spi_mem_register ( spi_cb pCallback )
//{
//  gSPIMemCallback = pCallback;
//}
//
//void spi_mem_check()
//{
//  U8 xCurFlags;
//  spi_mem_rdsr ( &xCurFlags );
//
//  // If any new flags are set
//  if ( xCurFlags > gOldSPIFlags )
//  {
//    if ( gSPIMemCallback )
//    {
//      gSPIMemCallback ( xCurFlags );
//    }
//
//    // Now we've done the call-back, clear the flags
//    spi_mem_clr_wrhf ( xCurFlags );
//  }
//}
//
//// MP7 has quite different sensors.
#ifdef MINI_T5_REV
int spi_temp_read ( float* pTemp )
{
  U16 xRet;
  float xTmp;
  spi_selectChip ( &AVR32_SPI1, SPI1_TEMP_SEL );
  // To read the temperature sensor, just send 16 "X" bits
  // and then read back 16 bits which contain the data
  spi_write ( &AVR32_SPI1, 0xFFFF );
  spi_read ( &AVR32_SPI1, &xRet );
  dprintf ( "Temp Reading: 0x%02X\n", xRet );
  spi_unselectChip ( &AVR32_SPI1, SPI1_TEMP_SEL );
  // Now decode the data in xRet
  *pTemp = 0.0f;

  if ( xRet & 0x8000 )
  {
    *pTemp = -256;
  }

  xRet &= ~ ( 0x8000 );
  xTmp = ( xRet >> 3 ); // Lowest 3 bits are useless to us
  xTmp /= 16; // Temperature is scaled by 16
  *pTemp += xTmp; // Calculate the final temp
  return 0;
}
#endif
