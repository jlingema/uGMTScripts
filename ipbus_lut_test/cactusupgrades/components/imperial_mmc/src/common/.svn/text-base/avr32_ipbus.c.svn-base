/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 * This function handles the sending and receiving of IPBus packets
 * to the FPGA on the MP7 board over the EBI interface.
 *
 */






// #ifdef MP7_REV

#include "imperial_mmc/avr32_ipbus.h"
#include "imperial_mmc/avr32_spi.h"


Bool ipbus_init ( void )
{
  dprintf ( "[IPBus] Init...\n" );
  return TRUE;
}



int spi_ipbus_write ( U32 Address , const U32* Data , U32 PayloadLength, bool NonIncrementing , bool UseConfigurationSpace )
{
  if ( !fpga_ready () )
  {
    return -1;
  }

  U32 lTransactionHeader , lReplyHeader , lExpectedHeader;

  if ( PayloadLength > 256 )
  {
    dprintf ( "Maximum number of words is 256\n" );
    return -1;
  }

  if ( !UseConfigurationSpace && !NonIncrementing )
  {
    //Normal space, Incrementing
    lTransactionHeader = 0x2000001F | ( PayloadLength<<8 );
    lExpectedHeader = 0x20000010 | ( PayloadLength<<8 );
  }
  else if ( !UseConfigurationSpace && NonIncrementing )
  {
    //Normal space, Non-Incrementing
    lTransactionHeader = 0x2000003F | ( PayloadLength<<8 );
    lExpectedHeader = 0x20000030 | ( PayloadLength<<8 );
  }
  else if ( UseConfigurationSpace && !NonIncrementing )
  {
    //Configuration space, Incrementing
    lTransactionHeader = 0x2000007F | ( PayloadLength<<8 );
    lExpectedHeader = 0x20000070 | ( ( PayloadLength+1 ) <<8 ); //Hack to work around bug in firmware
  }
  else
  {
    //Configuration space, Non-Incrementing
    dprintf ( "Cannot use Non-Incrementing Transactions in Configuration Space\n" );
    return -1;
  }

  {
    // Start the write half of the transfer
    spi_selectChip ( &AVR32_SPI0, SPI0_MEM_SEL );
    // Control Word - Write Mode. Ignore the reply.
    spi_transfer16 ( 0x0000 );
    // The total size of the IPbus packet to follow. Ignore the reply.
    spi_transfer32 ( PayloadLength + 2 );
    // The IPbus Transaction Header. Ignore the reply.
    spi_transfer32 ( lTransactionHeader );
    // The Transaction Base Address. Ignore the reply.
    spi_transfer32 ( Address );
    // The Payload. Ignore the reply.
    int i = 0;

    for ( ; i != PayloadLength; ++i )
    {
      spi_transfer32 ( Data[i] );
    }

    // End the write half of the transaction
    spi_unselectChip ( &AVR32_SPI0, SPI0_MEM_SEL );
  }

  {
    U32 length;
    //     do{
    // Start the read half of the transfer
    spi_selectChip ( &AVR32_SPI0, SPI0_MEM_SEL );
    // Control Word - Read Mode. Ignore the reply.
    spi_transfer16 ( 0x0001 );
    // Get the total size of the IPbus packet to follow.
    length = spi_transfer32 ( 0xFFFFFFFF );
    //       dprintf( "length = %u\n" , length );
    //       spi_unselectChip ( &AVR32_SPI0, SPI0_MEM_SEL );
    //     }while ( length < 1 );
    //   }
    //
    //
    //   {
    //     spi_selectChip ( &AVR32_SPI0, SPI0_MEM_SEL );
    //
    //     // Control Word - Read Mode. Ignore the reply.
    //     spi_transfer16( 0x0001 );
    // Get the total size of the IPbus packet to follow.
    lReplyHeader = spi_transfer32 ( 0x0000FFFF );
    // End the read half of the transaction
    spi_unselectChip ( &AVR32_SPI0, SPI0_MEM_SEL );
  }

  if ( lReplyHeader != lExpectedHeader )
  {
    dprintf ( "IPbus Reply Header Mismatch. Sent 0x%08lX , Got 0x%08lX , Expected 0x%08lX \n" , lTransactionHeader , lReplyHeader , lExpectedHeader );
    return -1;
  }

  return 0;
}



int spi_ipbus_read ( U32 Address , U32* Reply , U32 PayloadLength, bool NonIncrementing , bool UseConfigurationSpace )
{
  if ( !fpga_ready () )
  {
    return -1;
  }

  U32 lTransactionHeader , lReplyHeader , lExpectedHeader;

  if ( PayloadLength > 256 )
  {
    dprintf ( "Maximum number of words is 256\n" );
    return -1;
  }

  if ( !UseConfigurationSpace && !NonIncrementing )
  {
    //Normal space, Incrementing
    lTransactionHeader = 0x2000000F | ( PayloadLength<<8 );
    lExpectedHeader = 0x20000000 | ( PayloadLength<<8 );
  }
  else if ( !UseConfigurationSpace && NonIncrementing )
  {
    //Normal space, Non-Incrementing
    lTransactionHeader = 0x2000002F | ( PayloadLength<<8 );
    lExpectedHeader = 0x20000020 | ( PayloadLength<<8 );
  }
  else if ( UseConfigurationSpace && !NonIncrementing )
  {
    //Configuration space, Incrementing
    lTransactionHeader = 0x2000006F | ( PayloadLength<<8 );
    lExpectedHeader = 0x20000060 | ( ( PayloadLength+1 ) <<8 ); //Hack to work around bug in firmware
  }
  else
  {
    //Configuration space, Non-Incrementing
    dprintf ( "Cannot use Non-Incrementing Transactions in Configuration Space\n" );
    return -1;
  }

  {
    // Start the write half of the transfer
    spi_selectChip ( &AVR32_SPI0, SPI0_MEM_SEL );
    // Control Word - Write Mode. Ignore the reply.
    spi_transfer16 ( 0x0000 );
    // The total size of the IPbus packet to follow. Ignore the reply.
    spi_transfer32 ( 2 );
    // The IPbus Transaction Header. Ignore the reply.
    spi_transfer32 ( lTransactionHeader );
    // The Transaction Base Address. Ignore the reply.
    spi_transfer32 ( Address );
    // End the write half of the transaction
    spi_unselectChip ( &AVR32_SPI0, SPI0_MEM_SEL );
  }

  {
    U32 length;
    //     do{
    // Start the read half of the transfer
    spi_selectChip ( &AVR32_SPI0, SPI0_MEM_SEL );
    // Control Word - Read Mode. Ignore the reply.
    spi_transfer16 ( 0x0001 );
    // Get the total size of the IPbus packet to follow.
    length = spi_transfer32 ( 0xFFFFFFFF );
    //       dprintf( "length = %u\n" , length );
    //       spi_unselectChip ( &AVR32_SPI0, SPI0_MEM_SEL );
    //     }while ( length < PayloadLength+1 );
    //   }
    //
    //
    //   {
    //     spi_selectChip ( &AVR32_SPI0, SPI0_MEM_SEL );
    //
    //     // Control Word - Read Mode. Ignore the reply.
    //     spi_transfer16( 0x0001 );
    // Get the total size of the IPbus packet to follow.
    lReplyHeader = spi_transfer32 ( 0xFFFFFFFF );
    // Get the reply except the final word
    int i = 0;

    for ( ; i != PayloadLength-1; ++i )
    {
      Reply[i] = spi_transfer32 ( 0xFFFFFFFF );
    }

    // Get the final word of the reply
    Reply[PayloadLength-1] = spi_transfer32 ( 0x0000FFFF );
    // End the read half of the transaction
    spi_unselectChip ( &AVR32_SPI0, SPI0_MEM_SEL );
  }

  if ( lReplyHeader != lExpectedHeader )
  {
    dprintf ( "IPbus Reply Header Mismatch. Sent 0x%08lX , Got 0x%08lX , Expected 0x%08lX \n" , lTransactionHeader , lReplyHeader , lExpectedHeader );
    return -1;
  }

  return 0;
}













int ipbus_test ( void )
{
  dprintf ( "[IPBus] Start test...\n" );
  U32 pData;
  static U32 count = 0;
  // 	dprintf("[IPBus] CONFIG WRITE: 0x%08lX\n", count );
  //	ipbus_config_write( 0x00000003 , count );
  //   count++;
  //   spi_ipbus_write ( 0x00000003 , &count , 1 , false , true );
  //   count++;
  //   spi_ipbus_write ( 0x00000001 , &count , 1 , false , true );
  //   count++;
  //   spi_ipbus_write ( 0x00000000 , &count , 1 , false , true );
  U32 pDataBlock[] = { 0xDEADBEEF , 0x0000BABE , 0xFEEDFACE };
  pDataBlock[0] = prng_next();
  dprintf ( "[IPBus] CONFIG WRITE: 0x%08lX\n", pDataBlock[0] );
  pDataBlock[1] = prng_next() & 0x0000FFFF;
  dprintf ( "[IPBus] CONFIG WRITE: 0x%08lX\n", pDataBlock[1] );
  pDataBlock[2] = prng_next();
  dprintf ( "[IPBus] CONFIG WRITE: 0x%08lX\n", pDataBlock[2] );
  spi_ipbus_write ( 0x00000001 ,  & ( pDataBlock[0] ) , 1 , false , true );
  spi_ipbus_write ( 0x00000002 ,  & ( pDataBlock[1] ) , 1 , false , true );
  spi_ipbus_write ( 0x00000003 ,  & ( pDataBlock[2] ) , 1 , false , true );
  //   spi_ipbus_write ( 0x00000003 , pDataBlock , 3 , false , true );
  dprintf ( "[IPBus] CONFIG READ\n" );
  //     ipbus_config_read( 0x00000003 , &pData );
  spi_ipbus_read ( 0x00000001 , &pData , 1 , false , true );
  dprintf ( "[IPBus] CONFIG WRITE/READ OUTPUT #1: 0x%08lX\n", pData );
  spi_ipbus_read ( 0x00000002 , &pData , 1 , false , true );
  dprintf ( "[IPBus] CONFIG WRITE/READ OUTPUT #2: 0x%08lX\n", pData );
  spi_ipbus_read ( 0x00000003 , &pData , 1 , false , true );
  dprintf ( "[IPBus] CONFIG WRITE/READ OUTPUT #3: 0x%08lX\n", pData );
  //   U32 pDataBlock[3];
  //   U32 pRetBlock[3];
  //
  //   pDataBlock[0] = prng_next();
  //   pDataBlock[1] = prng_next();
  //   pDataBlock[2] = prng_next();
  //
  //   dprintf("[IPBus] BLOCK CONFIG WRITE: 0x%08lX, 0x%08lX, 0x%08lX\n", pDataBlock[0] , pDataBlock[1] , pDataBlock[2] );
  // //  ipbus_config_write( 0x00000003 , count );
  // //   spi_ipbus_write ( 0x00000001 , pDataBlock , 3 , false , true );
  //   spi_ipbus_write ( 0x00000001 , &(pDataBlock[0]) , 1 , false , true );
  //   spi_ipbus_write ( 0x00000002 , &(pDataBlock[1]) , 1 , false , true );
  //   spi_ipbus_write ( 0x00000003 , &(pDataBlock[2]) , 1 , false , true );
  //
  //
  //   dprintf("[IPBus] BLOCK CONFIG READ\n" );
  // //     ipbus_config_read( 0x00000003 , &pData );
  // //   spi_ipbus_read ( 0x00000001 , pRetBlock , 3 , false , true );
  //   spi_ipbus_read ( 0x00000001 , &(pRetBlock[0]) , 1 , false , true );
  //   spi_ipbus_read ( 0x00000002 , &(pRetBlock[1]) , 1 , false , true );
  //   spi_ipbus_read ( 0x00000003 , &(pRetBlock[2]) , 1 , false , true );
  //
  //
  //   dprintf("[IPBus] BLOCK CONFIG WRITE/READ OUTPUT: 0x%08lX, 0x%08lX, 0x%08lX\n", pRetBlock[0], pRetBlock[1], pRetBlock[2] );
  return 1;
}




// #endif //MP7_REV
