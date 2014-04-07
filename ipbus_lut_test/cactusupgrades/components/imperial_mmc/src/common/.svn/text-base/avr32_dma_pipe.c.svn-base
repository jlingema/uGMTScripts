#ifdef MP7_REV

#include "imperial_mmc/avr32_dma_pipe.h"
#include "imperial_mmc/avr32_dma_handlers.h"

#include "sd_mmc_mci_mem.h"


int DMA_MMCtoFPGA_NoINC ( U32* pData, U32 pLen )
{
  AVR32_DMACA.dmacfgreg = 1 << AVR32_DMACA_DMACFGREG_DMA_EN_OFFSET;
  // Channel 2 Config register low
  AVR32_DMACA.cfg2l =
    ( 0 << AVR32_DMACA_CFG2L_HS_SEL_DST_OFFSET ) | // Destination handshaking: ignored because the dst is memory
    ( 0 << AVR32_DMACA_CFG2L_HS_SEL_SRC_OFFSET ) // Source handshaking: ignored because the src is memory.
    ; // All other bits set to 0.
  // Channel 2 Config register high
  AVR32_DMACA.cfg2h =
    ( 0 << AVR32_DMACA_CFG2H_DEST_PER_OFFSET ) | // Dest hw handshaking itf: ignored because the dst is memory.
    ( 0 << AVR32_DMACA_CFG2H_SRC_PER_OFFSET )  // Source hw handshaking itf: ignored because the src is memory.
    ; // All other bits set to 0.
  // Linked list ptrs: not used.
  AVR32_DMACA.llp2 = 0x00000000;
  //Save us recalculating this constant each time
  static U32 CTL2 =
    ( 0 << AVR32_DMACA_CTL2L_INT_EN_OFFSET )     | // Enable interrupts
    ( 2<<AVR32_DMACA_CTL2L_DST_TR_WIDTH_OFFSET ) | // Dst transfer width: 32bit (0=8bit, 1=16bit, 2=32bit)
    ( 2<<AVR32_DMACA_CTL2L_SRC_TR_WIDTH_OFFSET ) | // Src transfer width: 32bit (0=8bit, 1=16bit, 2=32bit)
    ( 2<<AVR32_DMACA_CTL2L_DINC_OFFSET )         | // Dst address increment: no-increment
    ( 2<<AVR32_DMACA_CTL2L_SINC_OFFSET )         | // Src address increment: no-increment
    ( 0<<AVR32_DMACA_CTL2L_DST_MSIZE_OFFSET )    | // Dst burst transaction len: 1 data items (each of size DST_TR_WIDTH)
    ( 0<<AVR32_DMACA_CTL2L_SRC_MSIZE_OFFSET )    | // Src burst transaction len: 1 data items (each of size DST_TR_WIDTH)
    ( 0<<AVR32_DMACA_CTL2L_TT_FC_OFFSET )        | // transfer type:M2M, flow controller: DMACA
    ( 0<<AVR32_DMACA_CTL2L_DMS_OFFSET )          | // Destination master: HSB master 1
    ( 1<<AVR32_DMACA_CTL2L_SMS_OFFSET )          | // Source master: HSB master 2
    ( 0<<AVR32_DMACA_CTL2L_LLP_D_EN_OFFSET )     | // Not used
    ( 0<<AVR32_DMACA_CTL2L_LLP_S_EN_OFFSET )      // Not used
    ;
  // Channel 2 Ctrl register low
  AVR32_DMACA.ctl2l = CTL2;
  // Channel 2 Ctrl register high
  AVR32_DMACA.ctl2h =
    ( pLen << AVR32_DMACA_CTL2H_BLOCK_TS_OFFSET ) | // Block transfer size
    ( 0  << AVR32_DMACA_CTL2H_DONE_OFFSET )     // Not done
    ;
  // Src Address: the pSrcBuf address
  AVR32_DMACA.sar2 = pData;
  // Dst Address: the pDstBuf address
  AVR32_DMACA.dar2 = FPGA_ADDR;
  //Save us recalculating this constant each time
  static U32 DMA_ENABLE = ( ( 4<<AVR32_DMACA_CHENREG_CH_EN_OFFSET ) | ( 4<<AVR32_DMACA_CHENREG_CH_EN_WE_OFFSET ) );
  // Enable Channel 2 : start the process.
  AVR32_DMACA.chenreg = DMA_ENABLE;

  // Wait for the end of the RAM->RAM transfer (channel 2).
  while ( AVR32_DMACA.chenreg & ( 4<<AVR32_DMACA_CHENREG_CH_EN_OFFSET ) );

  return 0;
}




int DMA_MMCtoFPGA ( U32* pData, U32 pLen )
{
  AVR32_DMACA.dmacfgreg = 1 << AVR32_DMACA_DMACFGREG_DMA_EN_OFFSET;
  // Channel 2 Config register low
  AVR32_DMACA.cfg2l =
    ( 0 << AVR32_DMACA_CFG2L_HS_SEL_DST_OFFSET ) | // Destination handshaking: ignored because the dst is memory
    ( 0 << AVR32_DMACA_CFG2L_HS_SEL_SRC_OFFSET ) // Source handshaking: ignored because the src is memory.
    ; // All other bits set to 0.
  // Channel 2 Config register high
  AVR32_DMACA.cfg2h =
    ( 0 << AVR32_DMACA_CFG2H_DEST_PER_OFFSET ) | // Dest hw handshaking itf: ignored because the dst is memory.
    ( 0 << AVR32_DMACA_CFG2H_SRC_PER_OFFSET )  // Source hw handshaking itf: ignored because the src is memory.
    ; // All other bits set to 0.
  // Linked list ptrs: not used.
  AVR32_DMACA.llp2 = 0x00000000;
  //Save us recalculating this constant each time
  static U32 CTL2 =
    ( 0 << AVR32_DMACA_CTL2L_INT_EN_OFFSET )     | // Enable interrupts
    ( 2<<AVR32_DMACA_CTL2L_DST_TR_WIDTH_OFFSET ) | // Dst transfer width: 32bit (0=8bit, 1=16bit, 2=32bit)
    ( 2<<AVR32_DMACA_CTL2L_SRC_TR_WIDTH_OFFSET ) | // Src transfer width: 32bit (0=8bit, 1=16bit, 2=32bit)
    ( 2<<AVR32_DMACA_CTL2L_DINC_OFFSET )         | // Dst address increment: no-increment
    ( 0<<AVR32_DMACA_CTL2L_SINC_OFFSET )         | // Src address increment: increment
    ( 0<<AVR32_DMACA_CTL2L_DST_MSIZE_OFFSET )    | // Dst burst transaction len: 1 data items (each of size DST_TR_WIDTH)
    ( 0<<AVR32_DMACA_CTL2L_SRC_MSIZE_OFFSET )    | // Src burst transaction len: 1 data items (each of size DST_TR_WIDTH)
    ( 0<<AVR32_DMACA_CTL2L_TT_FC_OFFSET )        | // transfer type:M2M, flow controller: DMACA
    ( 0<<AVR32_DMACA_CTL2L_DMS_OFFSET )          | // Destination master: HSB master 1
    ( 1<<AVR32_DMACA_CTL2L_SMS_OFFSET )          | // Source master: HSB master 2
    ( 0<<AVR32_DMACA_CTL2L_LLP_D_EN_OFFSET )     | // Not used
    ( 0<<AVR32_DMACA_CTL2L_LLP_S_EN_OFFSET )      // Not used
    ;
  // Channel 2 Ctrl register low
  AVR32_DMACA.ctl2l = CTL2;
  // Channel 2 Ctrl register high
  AVR32_DMACA.ctl2h =
    ( pLen << AVR32_DMACA_CTL2H_BLOCK_TS_OFFSET ) | // Block transfer size
    ( 0  << AVR32_DMACA_CTL2H_DONE_OFFSET )     // Not done
    ;
  // Src Address: the pSrcBuf address
  AVR32_DMACA.sar2 = pData;
  // Dst Address: the pDstBuf address
  AVR32_DMACA.dar2 = FPGA_ADDR;
  //Save us recalculating this constant each time
  static U32 DMA_ENABLE = ( ( 4<<AVR32_DMACA_CHENREG_CH_EN_OFFSET ) | ( 4<<AVR32_DMACA_CHENREG_CH_EN_WE_OFFSET ) );
  // Enable Channel 2 : start the process.
  AVR32_DMACA.chenreg = DMA_ENABLE;

  // Wait for the end of the RAM->RAM transfer (channel 2).
  while ( AVR32_DMACA.chenreg & ( 4<<AVR32_DMACA_CHENREG_CH_EN_OFFSET ) );

  return 0;
}



int DMA_FPGAtoMMC ( U32* pData, U32 pLen )
{
  AVR32_DMACA.dmacfgreg = 1 << AVR32_DMACA_DMACFGREG_DMA_EN_OFFSET;
  // Channel 2 Config register low
  AVR32_DMACA.cfg2l =
    ( 0 << AVR32_DMACA_CFG2L_HS_SEL_DST_OFFSET ) | // Destination handshaking: ignored because the dst is memory
    ( 0 << AVR32_DMACA_CFG2L_HS_SEL_SRC_OFFSET ) // Source handshaking: ignored because the src is memory.
    ; // All other bits set to 0.
  // Channel 2 Config register high
  AVR32_DMACA.cfg2h =
    ( 0 << AVR32_DMACA_CFG2H_DEST_PER_OFFSET ) | // Dest hw handshaking itf: ignored because the dst is memory.
    ( 0 << AVR32_DMACA_CFG2H_SRC_PER_OFFSET )  // Source hw handshaking itf: ignored because the src is memory.
    ; // All other bits set to 0.
  // Linked list ptrs: not used.
  AVR32_DMACA.llp2 = 0x00000000;
  //Save us recalculating this constant each time
  static U32 CTL2 =
    ( 0 << AVR32_DMACA_CTL2L_INT_EN_OFFSET )     | // Enable interrupts
    ( 2<<AVR32_DMACA_CTL2L_DST_TR_WIDTH_OFFSET ) | // Dst transfer width: 32bit (0=8bit, 1=16bit, 2=32bit)
    ( 2<<AVR32_DMACA_CTL2L_SRC_TR_WIDTH_OFFSET ) | // Src transfer width: 32bit (0=8bit, 1=16bit, 2=32bit)
    ( 0<<AVR32_DMACA_CTL2L_DINC_OFFSET )         | // Dst address increment: increment
    ( 2<<AVR32_DMACA_CTL2L_SINC_OFFSET )         | // Src address increment: no-increment
    ( 0<<AVR32_DMACA_CTL2L_DST_MSIZE_OFFSET )    | // Dst burst transaction len: 1 data items (each of size DST_TR_WIDTH)
    ( 0<<AVR32_DMACA_CTL2L_SRC_MSIZE_OFFSET )    | // Src burst transaction len: 1 data items (each of size DST_TR_WIDTH)
    ( 0<<AVR32_DMACA_CTL2L_TT_FC_OFFSET )        | // transfer type:M2M, flow controller: DMACA
    ( 1<<AVR32_DMACA_CTL2L_DMS_OFFSET )          | // Destination master: HSB master 2
    ( 0<<AVR32_DMACA_CTL2L_SMS_OFFSET )          | // Source master: HSB master 1
    ( 0<<AVR32_DMACA_CTL2L_LLP_D_EN_OFFSET )     | // Not used
    ( 0<<AVR32_DMACA_CTL2L_LLP_S_EN_OFFSET )      // Not used
    ;
  // Channel 2 Ctrl register low
  AVR32_DMACA.ctl2l = CTL2;
  // Channel 2 Ctrl register high
  AVR32_DMACA.ctl2h =
    ( pLen << AVR32_DMACA_CTL2H_BLOCK_TS_OFFSET ) | // Block transfer size
    ( 0  << AVR32_DMACA_CTL2H_DONE_OFFSET )     // Not done
    ;
  // Src Address: the pSrcBuf address
  AVR32_DMACA.sar2 = FPGA_ADDR;
  // Dst Address: the pDstBuf address
  AVR32_DMACA.dar2 = pData;
  //Save us recalculating this constant each time
  static U32 DMA_ENABLE = ( ( 4<<AVR32_DMACA_CHENREG_CH_EN_OFFSET ) | ( 4<<AVR32_DMACA_CHENREG_CH_EN_WE_OFFSET ) );
  // Enable Channel 2 : start the process.
  AVR32_DMACA.chenreg = DMA_ENABLE;

  // Wait for the end of the RAM->RAM transfer (channel 2).
  while ( AVR32_DMACA.chenreg & ( 4<<AVR32_DMACA_CHENREG_CH_EN_OFFSET ) );

  return 0;
}



#if defined(MP7_REV)
#define FPGAtoMMC_COUNTER_ADDRESS 0x00000004
#define MMCtoFPGA_COUNTER_ADDRESS 0x00000005
#endif

// #define FPGAtoMMC_COUNTER_ADDRESS 0x00000400
// #define MMCtoFPGA_COUNTER_ADDRESS 0x00000401



U32 DMA_FPGAtoMMC_data_available()
{
  U32 pFifoCounters;

  //How much is available in the read FIFO
  if ( spi_ipbus_read ( FPGAtoMMC_COUNTER_ADDRESS , &pFifoCounters , 1 , false , false ) )
  {
    return 0;
  }

  return ( ( ( pFifoCounters>>16 ) & 0x0000FFFF ) - ( ( pFifoCounters>>1 ) & 0x00007FFF ) + 1 ) % 512;
}

U32 DMA_FPGAtoMMC_space_available()
{
  return 511 - DMA_FPGAtoMMC_data_available();
}



U32 DMA_MMCtoFPGA_data_available()
{
  U32 pFifoCounters;

  //How much is available in the write FIFO
  if ( spi_ipbus_read ( MMCtoFPGA_COUNTER_ADDRESS , &pFifoCounters , 1 , false , false ) )
  {
    return 0;
  }

  return ( ( ( pFifoCounters>>1 ) & 0x00007FFF ) - ( ( pFifoCounters>>16 ) & 0x0000FFFF ) + 1 ) % 512;
}

U32 DMA_MMCtoFPGA_space_available()
{
  return 511 - DMA_MMCtoFPGA_data_available();
}



void dma_pipe_reset ( void )
{
  dprintf ( "STARTING PIPE RESET\n" );
  DMA_MMCtoFPGA ( NULL , DMA_MMCtoFPGA_space_available() + 1 );
  dprintf ( "FINISHED PIPE RESET\n" );
}



void dma_pipe_transactor ( void )
{
  if ( arch_read_pin ( FPGA_DONE ) )
  {
    U32 r_available = DMA_FPGAtoMMC_data_available();

    if ( r_available < 2 )
    {
      return;
    }

    U32 pHeader[2] = { 0xFFFFFFFF , 0xFFFFFFFF };
    DMA_FPGAtoMMC ( pHeader , 2 );
    dma_handler_fn lFunction = NULL;
    dprintf ( "Received header 0x%08lX (with size parameter set as %u)\n" , pHeader[0], pHeader[1] );

    switch ( pHeader[0] )
    {
      case 0x00000000: //Write of size pHeader[1] into the text space
        lFunction = &EnterSecureMode;
        break;
      case 0x00000001: //Compare the data with the passphrase and set gSecureMode
        lFunction = &SetTextSpace;
        break;
      case 0x00000002: //Compare the data with the passphrase and set gSecureMode
        lFunction = &SetDummySensor;
        break;
      case 0x00000009: //Write to SD card
        lFunction = &FileFromSD;
        break;
      case 0x00000010: //Write to SD card
        lFunction = &FileToSD;
        break;
      case 0x00000011: //Reboot the FPGA
        lFunction = &RebootFPGA;
        break;
      case 0x00000012: //Delete an image from SD card
        lFunction = &DeleteFromSD;
        break;
      case 0x00000013: //Get list of files from SD card
        lFunction = &ListFilesOnSD;
        break;
      case 0x00000021: //Nuke the board
        lFunction = &NuclearReset;
        break;
      default:
        // ERROR HANDLING!
        dprintf ( "Unknown header 0x%08lX (with size parameter set as %u)\n" , pHeader[0], pHeader[1] );
        return;
    }

    char* lErrMsgPtr = NULL;
    ( *lFunction ) ( &pHeader[1] , &lErrMsgPtr );

    if ( lErrMsgPtr )
    {
      dprintf ( "Sending reply - %s\n" , lErrMsgPtr );
      U32 lSize = ceil ( ( strlen ( lErrMsgPtr ) +1.0 ) /4.0 );
      U32 lMem[2] = { -1 , lSize };

      while ( DMA_MMCtoFPGA_space_available() < lSize+2 )
      {
        cpu_delay_ms ( 1, FOSCM );
      }

      DMA_MMCtoFPGA ( lMem , 2 );
      DMA_MMCtoFPGA ( lErrMsgPtr , lSize );
      dprintf ( "Words remaining %u\n" , r_available );
    }

    if ( pHeader[0] != 0x00000000 )
    {
      gSecureMode = false;
    }
  }
}







// int dma_pipe_test ( void )
// {
//   if ( arch_read_pin ( FPGA_DONE ) )
//   {
//     dprintf ( "[MMC pipe] Start test...\n" );
//     U16 pLen = 512;
//     U32 pDataSrc[512] = { 0 };
//     U32 pDataBuf[512] = { 0 };
//     U16 i;
//     U32 pData;
//     //----------------------------------------------------------------------
//     dprintf ( "---- CLEAR FIFO ---- \n" );
//     spi_ipbus_read ( 0x00000004 , &pData , 1 , false , false );
//     dprintf ( "READ ADDRESSES BEFORE: 0x%08lX\n", pData );
//     U32 r_available = ( ( ( pData>>16 ) & 0x0000FFFF ) - ( ( pData & 0x0000FFFF ) >>1 ) + 1 ) %512;
//     dprintf ( " -> %u available\n", r_available );
//
//     if ( r_available )
//     {
//       DMA_FPGAtoMMC ( pDataBuf , r_available );
//     }
//
//     spi_ipbus_read ( 0x00000004 , &pData , 1 , false , false );
//     dprintf ( "READ ADDRESSES AFTER: 0x%08lX\n", pData );
//     r_available = ( ( ( pData>>16 ) & 0x0000FFFF ) - ( ( pData & 0x0000FFFF ) >>1 ) + 1 ) %512;
//     dprintf ( " -> %u available\n", r_available );
//     //----------------------------------------------------------------------
//     spi_ipbus_read ( 0x00000005 , &pData , 1 , false , false );
//     dprintf ( "WRITE ADDRESSES BEFORE: 0x%08lX\n", pData );
//     U32 w_available = ( ( ( pData & 0x0000FFFF ) >>1 ) - ( ( pData>>16 ) & 0x0000FFFF ) +1 ) %512;
//     dprintf ( " -> %u available\n", w_available );
//
//     if ( w_available )
//     {
//       DMA_MMCtoFPGA ( pDataSrc , 512-w_available );
//     }
//
//     spi_ipbus_read ( 0x00000005 , &pData , 1 , false , false );
//     dprintf ( "WRITE ADDRESSES AFTER: 0x%08lX\n", pData );
//     w_available = ( ( ( pData & 0x0000FFFF ) >>1 ) - ( ( pData>>16 ) & 0x0000FFFF ) +1 ) %512;
//     dprintf ( " -> %u available\n", w_available );
//     //----------------------------------------------------------------------
//     int j;
//     static U32 lCount = 0;
//     static U32 lErrorCount = 0;
//
//     //for ( j=0; j!=10000 ; ++j )
//     while ( true )
//     {
//       //       dprintf ( "---- IPBUS WRITE TO FIFO ---- \n" );
//       {
//         //        dprintf ( "[MMC pipe] Text space test\n" );
//         U8* lTextSpace = "SAMPLE TEXT" ;
//         U32 lCommand = 0x000000001; // HEADER 0x000000001 = SetTextSpace
//         U32 lSize = 12/4; //Size in words (including trailing NULL terminator)
//         spi_ipbus_write ( 0x00000006 , &lCommand , 1 , false , false );
//         spi_ipbus_write ( 0x00000006 , &lSize , 1 , false , false );
//
//         for ( i = 0 ; i!= lSize ; ++i )
//         {
//           spi_ipbus_write ( 0x00000006 , ( ( U32* ) lTextSpace ) + i , 1 , false , false );
//         }
//
//         dma_pipe_transactor ();//Read Header
//         dma_pipe_transactor ();//Follow Instruction
//         //        dprintf ( "[MMC pipe] Text space test done\n" );
//       }
//       {
//         //        dprintf ( "\n[MMC pipe] Bad Text space test\n" );
//         U32 lCommand = 0x000000001; // HEADER 0x000000001 = SetTextSpace
//         U32 lSize = 0; //Size in words (including trailing NULL terminator)
//         spi_ipbus_write ( 0x00000006 , &lCommand , 1 , false , false );
//         spi_ipbus_write ( 0x00000006 , &lSize , 1 , false , false );
//         dma_pipe_transactor ();//Read Header
//         dma_pipe_transactor ();//Follow Instruction
//         //        dprintf ( "[MMC pipe] Bad Text space test done\n" );
//       }
//       {
//         //        dprintf ( "[MMC pipe] NOW GET THE REPLIES...\n" );
//         //         spi_ipbus_read ( 0x00000005 , &pData , 1 , false , false );
//         //         dprintf ( "WRITE ADDRESSES AFTER: 0x%08lX\n", pData );
//         //         w_available = ( ( ( pData & 0x0000FFFF ) >>1 ) - ( ( pData>>16 ) & 0x0000FFFF ) +1 ) %512;
//         //         dprintf ( " -> %u available\n", w_available );
//         //        U32 lCommand;
//         //        for( i=0 ; i!= 4 ; ++i )
//         //        {
//         //         spi_ipbus_read ( 0x00000006 , &lCommand , 1 , false , false );
//         //        // spi_ipbus_read ( 0x00000006 , &lSize , 1 , false , false );
//         //         dprintf ( "%u : RETURNED: 0x%08lX\n", i , lCommand );
//         //         }
//         U32 lReplies[4];
//         spi_ipbus_read ( 0x00000006 , lReplies+0 , 1 , false , false );
//         spi_ipbus_read ( 0x00000006 , lReplies+1 , 1 , false , false );
//         spi_ipbus_read ( 0x00000006 , lReplies+2 , 1 , false , false );
//         spi_ipbus_read ( 0x00000006 , lReplies+3 , 1 , false , false );
//
//         if ( lReplies[0] != 0x00000000 )
//         {
//           lErrorCount++;
//         }
//
//         if ( lReplies[1] != 0x00000000 )
//         {
//           lErrorCount++;
//         }
//
//         if ( lReplies[2] != 0xDEADBEEF )
//         {
//           lErrorCount++;
//         }
//
//         if ( lReplies[3] != 0xCAFEBABE )
//         {
//           lErrorCount++;
//         }
//
//         lCount+= 4;
//       }
//
//       if ( ! ( lCount%10000 ) )
//       {
//         dprintf ( "%u / %u\n" , lErrorCount , lCount );
//       }
//     }
//
//     /*    {
//           dprintf ( "[MMC pipe] Password test\n" );
//           U8* lPassword = "RuleBritannia" ;
//           U32 lCommand = 0x000000000; // HEADER 0x000000000 = EnterSecureMode
//           U32 lSize = 12/4; //Size in words (including trailing NULL terminator)
//           spi_ipbus_write ( 0x00000006 , &lCommand , 1 , false , false );
//           spi_ipbus_write ( 0x00000006 , &lSize , 1 , false , false );
//
//           for ( i = 0 ; i!= lSize ; ++i )
//           {
//             spi_ipbus_write ( 0x00000006 , ( ( U32* ) lPassword ) + i , 1 , false , false );
//           }
//
//           dma_pipe_transactor ();//Read Header
//           dma_pipe_transactor ();//Follow Instruction
//           dprintf ( "[MMC pipe] Password test done\n" );
//         }
//         {
//           dprintf ( "[MMC pipe] Dummy Sensor test\n" );
//           static U32 lSensorValue = 0;
//           U32 lCommand = 0x000000002; // HEADER 0x000000002 = SetDummySensor
//           U32 lSize = 1; //Size in words
//           spi_ipbus_write ( 0x00000006 , &lCommand , 1 , false , false );
//           spi_ipbus_write ( 0x00000006 , &lSize , 1 , false , false );
//           spi_ipbus_write ( 0x00000006 , &lSensorValue , 1 , false , false );
//           lSensorValue++;
//           dma_pipe_transactor ();//Read Header
//           dma_pipe_transactor ();//Follow Instruction
//           dprintf ( "[MMC pipe] Dummy Sensor test done\n" );
//         }
//         {
//           dprintf ( "[MMC pipe] FPGA reboot test\n" );
//           U8* lPassword = "RuleBritannia" ;
//           U32 lSecureModeCommand = 0x000000000; // HEADER 0x000000000 = EnterSecureMode
//           U32 lSize = 12/4; //Size in words (including trailing NULL terminator)
//           U32 lRebootCommand = 0x000000011; // HEADER 0x000000011 = RebootFPGA
//           spi_ipbus_write ( 0x00000006 , &lSecureModeCommand , 1 , false , false );
//           spi_ipbus_write ( 0x00000006 , &lSize , 1 , false , false );
//
//           for ( i = 0 ; i!= lSize ; ++i )
//           {
//             spi_ipbus_write ( 0x00000006 , ( ( U32* ) lPassword ) + i , 1 , false , false );
//           }
//
//           lSize = 0;
//           spi_ipbus_write ( 0x00000006 , &lRebootCommand , 1 , false , false );
//           spi_ipbus_write ( 0x00000006 , &lSize , 1 , false , false );
//           dma_pipe_transactor ();//Read Header
//           dma_pipe_transactor ();//Follow Instruction
//           dma_pipe_transactor ();//Read Header
//           dma_pipe_transactor ();//Follow Instruction
//           dprintf ( "[MMC pipe] FPGA reboot test done\n" );
//         }*/
//   }
//
//   return 1;
// }




/*
#define TESTSIZE 5000
int dma_pipe_reader_test ( void )
{
  dprintf ( "---- DMA PIPE READER ---- \n" );
  U32 pCounters[2] = { 0 , 0 };
  U16 r_available;


  //--------------------------------------------------------------------------------------------
  //   dprintf("---- CLEAR FIFO ---- \n" );
  U32 pPayload[ TESTSIZE ];
  U32 PAYLOAD[ TESTSIZE ];

  spi_ipbus_read ( 0x00000004 , &pCounters[0] , 1 , false , false );
  r_available = ( ( ( pCounters[0]>>16 ) & 0x0000FFFF ) - ( ( pCounters[0]>>1 ) & 0x00007FFF ) + 1 ) % 512;

  if ( r_available )
  {
    DMA_FPGAtoMMC ( pPayload , r_available );
  }

  spi_ipbus_read ( 0x00000004 , &pCounters[0] , 1 , false , false );
  r_available = ( ( ( pCounters[0]>>16 ) & 0x0000FFFF ) - ( ( pCounters[0]>>1 ) & 0x00007FFF ) + 1 ) % 512;
  //   dprintf("BEFORE DUMMY DATA: r_available : %u\n", r_available );
  //Dummy Packet In
  U32 HEADER[2] = { 0xBA5EADD4 , TESTSIZE };
  U32 DUMMY_COUNTER = 0;
  int i = 0;

  for ( i = 0; i != TESTSIZE; i++ )
  {
    PAYLOAD[i] = prng_next();
  }

  spi_ipbus_write ( 0x00000006 ,  &HEADER[0] , 1 , false , false );
  spi_ipbus_write ( 0x00000006 ,  &HEADER[1] , 1 , false , false );
  //--------------------------------------------------------------------------------------------
  //How much is available in the read FIFO
  spi_ipbus_read ( 0x00000004 , &pCounters[0] , 1 , false , false );
  r_available = ( ( ( pCounters[0]>>16 ) & 0x0000FFFF ) - ( ( pCounters[0]>>1 ) & 0x00007FFF ) + 1 ) % 512;
  //   dprintf("AFTER DUMMY HEADER: r_available : %u\n", r_available );

  if ( r_available < 2 )
  {
    return 0;
  }

  U32 pHeader[2] = { 0 , 0 };
  DMA_FPGAtoMMC ( pHeader , 2 );
  //     dprintf("ADDRESS: 0x%08lX\n", pHeader[0] );
  //     dprintf("TOTAL SIZE: %u\n", pHeader[1] );
  U32* pLocation;

  switch( pHeader[0] )
  {
    case 0xBA5EADD4:
      pLocation = pPayload;
    default:
      return 0;
  }
  U32 x=0;
  U32 received=0;

  while ( received != pHeader[1] )
  {
    spi_ipbus_read ( 0x00000004 , &pCounters[0] , 1 , false , false );
    r_available = ( ( ( pCounters[0]>>16 ) & 0x0000FFFF ) - ( ( pCounters[0]>>1 ) & 0x00007FFF ) + 1 ) % 512;
    //     dprintf("%u : r_available: %u , received: %u , total size: %u \n" , x , r_available , received , pHeader[1] );

    if ( r_available )
    {
      DMA_FPGAtoMMC ( pLocation+received , r_available );
      received += r_available;
    }

    if ( x++ % 17 == 9 )
    {
      //       dprintf( "WRITING DUMMY DATA: DUMMY_COUNTER BEFORE = %u\n" , DUMMY_COUNTER );
      for ( i = 0; i != ( 511-r_available ) && DUMMY_COUNTER!=TESTSIZE ; i++ , DUMMY_COUNTER++ )
      {
        spi_ipbus_write ( 0x00000006 ,  PAYLOAD + DUMMY_COUNTER , 1 , false , false );
      }

      //       dprintf( "WRITING DUMMY DATA: DUMMY_COUNTER AFTER = %u\n" , DUMMY_COUNTER );
    }
  }

  static double ERROR_COUNT = 0;
  static double CHECKED_COUNT = 0;

  for ( i = 0; i != TESTSIZE; i++ )
  {
    CHECKED_COUNT++;

    if ( pPayload[i] != PAYLOAD[i] )
    {
      ERROR_COUNT++;
      dprintf ( "Check %u : 0x%08lX cf. 0x%08lX\n", i , pPayload[i] , PAYLOAD[i] );
    }
  }

  dprintf ( "ERROR CHECKER %f / %f \n", ERROR_COUNT , CHECKED_COUNT );
  return 1;
}*/

#endif /* MP7_REV */
