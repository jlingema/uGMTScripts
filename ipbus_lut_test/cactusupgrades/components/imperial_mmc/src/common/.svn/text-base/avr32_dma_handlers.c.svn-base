#ifdef MP7_REV

#include "imperial_mmc/avr32_dma_handlers.h"

#include "imperial_mmc/avr32_fru.h"
#include "imperial_mmc/avr32_sdr.h"
#include "imperial_mmc/avr32_sfwfs.h"
#include "imperial_mmc/avr32_oem.h"

#include "imperial_mmc/avr32_dma_pipe.h"

#include <math.h>
#include <string.h>

//32 bytes
U8 gTextSpace[32] = { 0 } ;
bool gSecureMode = false;


void SetTextSpace ( U32* aSizeRemaining , char** aErrorMsg )
{
  dprintf ( "Receiving Text into text space\n" );
  memset ( gTextSpace , 0 , 32 );

  if ( *aSizeRemaining == 0 )
  {
    return;
  }

  if ( *aSizeRemaining > 8 )
  {
    *aErrorMsg = "Message size exceeded space available";
    return;
  }

  while ( DMA_FPGAtoMMC_data_available() < *aSizeRemaining )
  {
    cpu_delay_ms ( 1, FOSCM ); //Otherwise we get serious bus contention
  }

  dprintf ( "Before: '%s'\n", gTextSpace );
  DMA_FPGAtoMMC ( gTextSpace , *aSizeRemaining );
  dprintf ( "After: '%s'\n", gTextSpace );

  while ( DMA_MMCtoFPGA_space_available() < 2 )
  {
    cpu_delay_ms ( 1, FOSCM ); //Otherwise we get serious bus contention
  }

  dprintf ( "Sending reply - all good\n" );
  U32 lMem[2] = { 0 , 0 };
  DMA_MMCtoFPGA ( lMem , 2 );
  *aSizeRemaining = 0;
}


void EnterSecureMode ( U32* aSizeRemaining , char** aErrorMsg )
{
  gSecureMode = false;

  if ( *aSizeRemaining == 0 )
  {
    return;
  }

  if ( *aSizeRemaining > 8 )
  {
    *aErrorMsg = "Message size exceeded space available";
    return;
  }

  while ( DMA_FPGAtoMMC_data_available() < *aSizeRemaining )
  {
    cpu_delay_ms ( 1, FOSCM ); //Otherwise we get serious bus contention
  }

  dprintf ( "Before: '%s'\n", gSecureMode?"Unlocked":"Locked" );
  U8 lPassword[32] = { 0 } ;
  char* lPasswordValue = "RuleBritannia" ;
  DMA_FPGAtoMMC ( lPassword , *aSizeRemaining );

  if ( strcmp ( lPassword , lPasswordValue ) != 0 )
  {
    *aErrorMsg = "Password incorrect";
    return;
  }

  dprintf ( "Britannia rules the waves!\n" );
  gSecureMode = true;
  dprintf ( "After: '%s'\n", gSecureMode?"Unlocked":"Locked" );

  while ( DMA_MMCtoFPGA_space_available() < 2 )
  {
    cpu_delay_ms ( 1, FOSCM ); //Otherwise we get serious bus contention
  }

  dprintf ( "Sending reply - all good\n" );
  U32 lMem[2] = { 0 , 0 };
  DMA_MMCtoFPGA ( lMem , 2 );
  *aSizeRemaining = 0;
}


void SetDummySensor ( U32* aSizeRemaining , char** aErrorMsg )
{
  dprintf ( "Receiving dummy sensor value\n" );

  if ( *aSizeRemaining != 1 )
  {
    *aErrorMsg = "Incorrect payload size";
    return;
  }

  while ( DMA_FPGAtoMMC_data_available() < *aSizeRemaining )
  {
    cpu_delay_ms ( 1, FOSCM ); //Otherwise we get serious bus contention
  }

  dprintf ( "Before: '%u'\n", gDummySensor );
  DMA_FPGAtoMMC ( &gDummySensor , 1 );
  dprintf ( "After: '%u'\n", gDummySensor );

  while ( DMA_MMCtoFPGA_space_available() < 2 )
  {
    cpu_delay_ms ( 1, FOSCM ); //Otherwise we get serious bus contention
  }

  dprintf ( "Sending reply - all good\n" );
  U32 lMem[2] = { 0 , 0 };
  DMA_MMCtoFPGA ( lMem , 2 );
  *aSizeRemaining = 0;
}


void FileToSD ( U32* aSizeRemaining , char** aErrorMsg )
{
  dprintf ( "Add file to SD card\n" );
  U32 lFileOffset, lSize, lSectorsAvailable;
  //REMOVED FOR DEBUGGING!
  //       if ( strcmp ( gTextSpace , gDefaultBinFile ) == 0 )
  //       {
  //         *aErrorMsg = "Default image file is inviolate";
  //         return;
  //       }
  dprintf ( "Mounting Filesystem\n" );

  if ( sfwfs_mount () != SFWFS_ERR_NONE )
  {
    *aErrorMsg = "Failed To Mount Filesystem";
    return;
  }

  if ( sfwfs_new ( gTextSpace , 40000 , &lFileOffset ) != SFWFS_ERR_NONE )
  {
    // ERROR HANDLING!
    sfwfs_unmount ();
    *aErrorMsg = "Failed To create new file";
    return;
  }

  dprintf ( "Successfully created file '%s'\n" , gTextSpace );
  sd_mmc_mci_dma_write_open ( AVR32_SD_SLOT , lFileOffset , FPGA_ADDR , 40000 );

  while ( *aSizeRemaining )
  {
    U32 lWordsAvailable = DMA_FPGAtoMMC_data_available();
    U32 lSectorsToTransfer;

    if ( *aSizeRemaining < lWordsAvailable )
    {
      lSectorsToTransfer = *aSizeRemaining >> 7; // aReadAvailable words = aReadAvailable * 4 bytes = aReadAvailable * 4 / 512 sectors =  (aReadAvailable << 2) >> 9 = aReadAvailable >> 7
    }
    else
    {
      lSectorsToTransfer = lWordsAvailable >> 7; // aReadAvailable words = aReadAvailable * 4 bytes = aReadAvailable * 4 / 512 sectors =  (aReadAvailable << 2) >> 9 = aReadAvailable >> 7
    }

    if ( lSectorsToTransfer )
    {
      sd_mmc_mci_write_multiple_sector_from_ram ( AVR32_SD_SLOT, FPGA_ADDR, lSectorsToTransfer );
      *aSizeRemaining -= ( lSectorsToTransfer<<7 );
    }
    else
    {
      cpu_delay_ms ( 1, FOSCM ); //Otherwise we get serious bus contention
    }

    if ( gIPMI_needs_checking )
    {
      ipmi_process();
    }
  }

  sd_mmc_mci_write_close ( AVR32_SD_SLOT );
  sfwfs_unmount ();
  dprintf ( "Filesystem unmounted\n" );

  while ( DMA_MMCtoFPGA_space_available() < 2 )
  {
    cpu_delay_ms ( 1, FOSCM ); //Otherwise we get serious bus contention

    if ( gIPMI_needs_checking )
    {
      ipmi_process();
    }
  }

  dprintf ( "Sending reply - all good\n" );
  U32 lMem[2] = { 0 , 0 };
  DMA_MMCtoFPGA ( lMem , 2 );
}



void FileFromSD ( U32* aSizeRemaining , char** aErrorMsg )
{
  dprintf ( "Reading file from SD card\n" );
  U32 lFileOffset, lSize;
  U32 lSizeRemaining = 5120000;

  if ( *aSizeRemaining != 0 )
  {
    *aErrorMsg = "Incorrect payload size";
    return;
  }

  dprintf ( "Mounting Filesystem\n" );

  if ( sfwfs_mount () != SFWFS_ERR_NONE )
  {
    *aErrorMsg = "Failed To Mount Filesystem";
    return;
  }

  if ( sfwfs_find ( gTextSpace , &lFileOffset, &lSize ) != SFWFS_ERR_NONE )
  {
    // ERROR HANDLING!
    sfwfs_unmount ();
    *aErrorMsg = "Failed To open file";
    return;
  }

  dprintf ( "Successfully opened file '%s'\n" , gTextSpace );
  sd_mmc_mci_dma_read_open ( AVR32_SD_SLOT , lFileOffset , FPGA_ADDR , 40000 );
  dprintf ( "Sending Header\n" );

  while ( DMA_MMCtoFPGA_space_available() < 2 )
  {
    cpu_delay_ms ( 1, FOSCM ); //Otherwise we get serious bus contention

    if ( gIPMI_needs_checking )
    {
      ipmi_process();
    }
  }

  U32 lMem[2] = { 0 , lSizeRemaining };
  DMA_MMCtoFPGA ( lMem , 2 );
  U32 i = 0 ;
  dprintf ( "Sending Body\n" );

  while ( lSizeRemaining )
  {
    U32 lWordSpaceAvailable = DMA_MMCtoFPGA_space_available();
    U32 lSectorsToTransfer;

    if ( lSizeRemaining < lWordSpaceAvailable )
    {
      lSectorsToTransfer = lSizeRemaining >> 7; // aReadAvailable words = aReadAvailable * 4 bytes = aReadAvailable * 4 / 512 sectors =  (aReadAvailable << 2) >> 9 = aReadAvailable >> 7
    }
    else
    {
      lSectorsToTransfer = lWordSpaceAvailable >> 7; // aReadAvailable words = aReadAvailable * 4 bytes = aReadAvailable * 4 / 512 sectors =  (aReadAvailable << 2) >> 9 = aReadAvailable >> 7
    }

    if ( lSectorsToTransfer )
    {
      sd_mmc_mci_read_multiple_sector_2_ram ( AVR32_SD_SLOT, FPGA_ADDR, lSectorsToTransfer );
      lSizeRemaining -= ( lSectorsToTransfer<<7 );
    }
    else
    {
      cpu_delay_ms ( 1, FOSCM ); //Otherwise we get serious bus contention
    }

    //     if ( ! ( i++ %500 ) )
    //     {
    //       dprintf( "lSizeRemaining = %u\n" , lSizeRemaining );
    //     }
    if ( gIPMI_needs_checking )
    {
      ipmi_process();
    }
  }

  dprintf ( "Sending Body done\n" );
  sd_mmc_mci_read_close ( AVR32_SD_SLOT );
  dprintf ( "Read Close done\n" );
  sfwfs_unmount ();
  dprintf ( "Filesystem unmounted\n" );
}






void RebootFPGA ( U32* aSizeRemaining , char** aErrorMsg )
{
  dprintf ( "Rebooting the FPGA\n" );

  if ( *aSizeRemaining != 0 )
  {
    *aErrorMsg = "Incorrect payload size";
    return;
  }

  if ( !gSecureMode )
  {
    *aErrorMsg = "MMC not in secure mode";
    return;
  }

  dprintf ( "Before: '%u'\n", arch_read_pin ( FPGA_DONE ) );
  fpga_reset();
  dprintf ( "After: '%u'\n", arch_read_pin ( FPGA_DONE ) );

  while ( DMA_MMCtoFPGA_space_available() < 2 )
  {
    cpu_delay_ms ( 1, FOSCM ); //Otherwise we get serious bus contention
  }

  dprintf ( "Sending reply - all good\n" );
  U32 lMem[2] = { 0 , 0 };
  DMA_MMCtoFPGA ( lMem , 2 );
  *aSizeRemaining = 0;
}



void DeleteFromSD ( U32* aSizeRemaining , char** aErrorMsg )
{
  dprintf ( "Delete file from SD card\n" );
  //REMOVED FOR DEBUGGING!
  //       if ( strcmp ( gTextSpace , gDefaultBinFile ) == 0 )
  //       {
  //         *aErrorMsg = "Default image file is inviolate";
  //         return;
  //       }

  if ( *aSizeRemaining != 0 )
  {
    *aErrorMsg = "Incorrect payload size";
    return;
  }

  if ( !gSecureMode )
  {
    *aErrorMsg = "MMC not in secure mode";
    return;
  }

  dprintf ( "Mounting Filesystem\n" );

  if ( sfwfs_mount () != SFWFS_ERR_NONE )
  {
    *aErrorMsg = "Failed To Mount Filesystem";
    return;
  }

  if ( sfwfs_del ( gTextSpace ) != SFWFS_ERR_NONE )
  {
    // ERROR HANDLING!
    sfwfs_unmount ();
    *aErrorMsg = "Failed To delete file";
    return;
  }

  sfwfs_unmount ();

  while ( DMA_MMCtoFPGA_space_available() < 2 )
  {
    cpu_delay_ms ( 1, FOSCM ); //Otherwise we get serious bus contention
  }

  dprintf ( "Sending reply - all good\n" );
  U32 lMem[2] = { 0 , 0 };
  DMA_MMCtoFPGA ( lMem , 2 );
  *aSizeRemaining = 0;
}



void ListFilesOnSD ( U32* aSizeRemaining , char** aErrorMsg )
{
  dprintf ( "List files on SD card\n" );

  if ( *aSizeRemaining != 0 )
  {
    *aErrorMsg = "Incorrect payload size";
    return;
  }

  dprintf ( "Mounting Filesystem\n" );

  if ( sfwfs_mount () != SFWFS_ERR_NONE )
  {
    *aErrorMsg = "Failed To Mount Filesystem";
    return;
  }

  int xRet;
  char* xFilename;
  U32 xSize, xEntry, xBlock;
  U32 lSize = 0;
  dprintf ( "Calculating payload size\n" );
  xEntry = 0;
  xBlock = 0;

  while ( true )
  {
    xRet = sfwfs_iter ( &xFilename, &xSize, &xBlock, &xEntry );

    if ( xRet == SFWFS_ERR_ENOENTRY )
    {
      break;  // No more files
    }

    if ( xRet )
    {
      *aErrorMsg = "Failed To iterate over Filesystem";
      sfwfs_unmount ();
      return;
    }

    lSize += 8; //Send filenames as 32-byte chunks and sort it out on client side
  }

  U32 lMem[2] = { 0 , lSize };
  DMA_MMCtoFPGA ( lMem , 2 );
  dprintf ( "Sending payload\n" );
  xEntry = 0;
  xBlock = 0;

  while ( true )
  {
    xRet = sfwfs_iter ( &xFilename, &xSize, &xBlock, &xEntry );

    if ( xRet == SFWFS_ERR_ENOENTRY )
    {
      break;  // No more files
    }

    while ( DMA_MMCtoFPGA_space_available() < 8 )
    {
      cpu_delay_ms ( 1, FOSCM ); //Otherwise we get serious bus contention
    }

    DMA_MMCtoFPGA ( xFilename , 8 );
  }

  sfwfs_unmount ();
}




void NuclearReset ( U32* aSizeRemaining , char** aErrorMsg )
{
  if ( !gSecureMode )
  {
    *aErrorMsg = "MMC not in secure mode";
    return;
  }

  gNuclearReset = 1;
  //Don't send any reply, just die...
}

#endif /* MP7_REV */
