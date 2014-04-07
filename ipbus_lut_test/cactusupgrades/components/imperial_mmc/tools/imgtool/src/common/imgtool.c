#include <errno.h>
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdint.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/ioctl.h>
#include <sys/mount.h>

#include "imgtool/standalone.h"
#include "imperial_mmc/avr32_sha1.h"
#include "imperial_mmc/avr32_sfwfs.h"

#define BLK_SIZE 512

// The FD to our filesystem image / device
int gFD = -1;
// An in memory buffer the maximum image size
uint8_t gImg[BLK_SIZE* SFWFS_DATABLOCK_SIZE];
uint32_t gSize; // Size of image loaded into gImg in blocks
U32 gChksum[5]; // Checksum of image in gImg

void usage ( void )
{
  fprintf ( stderr, "Usage: imgtool image command [parameters]\n" );
  fprintf ( stderr, "\n" );
  fprintf ( stderr, "Cmds: format <label>     -- Formats an image\n" );
  fprintf ( stderr, "      list               -- List files in an image\n" );
  fprintf ( stderr, "      add <name> <file>  -- Adds a file to an image\n" );
  fprintf ( stderr, "      get <name> <file>  -- Gets a file from an image\n" );
  fprintf ( stderr, "      del <name>         -- Deletes a file from an image\n" );
  fprintf ( stderr, "      check <name>       -- Verifies the checksum of a file\n" );
//   fprintf ( stderr, "      swap               -- Byte swap an image\n" );
  fprintf ( stderr, "\n" );
}

// Checksums the contents of gImg
int calc_checksum()
{
  int i;
  U32 xBlock;
  U32 xTotal = 0;
  U8* xPos = gImg;
  U32* xState = ( U32* ) gChksum;
  sha1_init ( xState );

  for ( xBlock = 0; xBlock < gSize; xBlock++ )
  {
    // There are 8 512-bit blocks in a 512 byte block.
    for ( i = 0; i < 8; i++ )
    {
      sha1_update ( xState, ( U32* ) xPos );
      xPos += 64;
    }

    xTotal += 512;
  }

  sha1_finish ( xState, NULL, 0, xTotal );
  // Print the checksum
  fprintf ( stderr, "Memory Checksum: " );

  for ( i = 0; i < 5; i++ )
  {
    fprintf ( stderr, "%08X", xState[i] );
  }

  fprintf ( stderr, "\n" );
  return 0;
}

int load_file ( char* pFile )
{
  int xRet;
  uint8_t* xPos = gImg;
  int xFD = open ( pFile, O_RDONLY );

  if ( xFD < 0 )
  {
    fprintf ( stderr, "Failed to open source file (%d).\n", errno );
    return -2;
  }

  // Before reading the file, clear the buffer with 0xFF
  // That way if it's not the right size, it'll be padded with 0xFF
  memset ( gImg, 0xFF, BLK_SIZE * SFWFS_DATABLOCK_SIZE );

  while ( 1 )
  {
    if ( xPos > gImg + ( BLK_SIZE * ( SFWFS_DATABLOCK_SIZE - 1 ) ) )
    {
      // There is less than BLK_SIZE space left in the input buffer!
      fprintf ( stderr, "Source file too large!\n" );
      return -2;
    }

    xRet = read ( xFD, xPos, BLK_SIZE );

    if ( xRet < 0 )
    {
      fprintf ( stderr, "Failed to read source file? (%d).\n", errno );
      close ( xFD );
      return -2;
    }

    xPos += xRet;

    if ( !xRet )
    {
      break;  // EOF
    }
  }

  gSize = xPos - gImg;

  // gSize is currently in bytes, turn it into blocks
  if ( gSize % BLK_SIZE )
  {
    // gSize isn't a whole number of blocks
    gSize /= BLK_SIZE;
    gSize++;
  }
  else
  {
    gSize /= BLK_SIZE;
  }

  close ( xFD );
  calc_checksum();
  return 0;
}

int save_file ( char* pFile )
{
  int xRet;
  int xFD = open ( pFile, O_WRONLY | O_CREAT | O_TRUNC, 0644 );

  if ( xFD < 0 )
  {
    fprintf ( stderr, "Failed to open output file (%d).\n", errno );
    return -2;
  }

  xRet = write ( xFD, gImg, gSize * BLK_SIZE );
  close ( xFD );

  if ( xRet != gSize * BLK_SIZE )
  {
    fprintf ( stderr, "Failed to write to output file. (Disk full?)\n" );
    return -1;
  }

  return 0;
}

int do_format ( int argc, char** argv )
{
  if ( argc != 4 )
  {
    return -1;
  }

  if ( sfwfs_format ( argv[3] ) )
  {
    return -2;
  }

  return 0;
}

int do_list ( int argc, char** argv )
{
  int xRet;
  char* xFilename;
  U32 xSize;
  U32 xBlock = 0, xEntry = 0;

  if ( argc != 3 )
  {
    return -1;
  }

  if ( sfwfs_mount() )
  {
    return -2;
  }

  while ( 1 )
  {
    xRet = sfwfs_iter ( &xFilename, &xSize, &xBlock, &xEntry );

    if ( xRet == SFWFS_ERR_ENOENTRY )
    {
      break;  // No more files
    }

    if ( xRet )
    {
      // Some kind of error
      sfwfs_unmount();
      return -2;
    }

    fprintf ( stderr, "%-8d %-32s\n", xSize * BLK_SIZE, xFilename );
  }

  sfwfs_unmount();
  return 0;
}

int do_add ( int argc, char** argv )
{
  int i;
  U32 xOffset;
  U8* xData = gImg;

  if ( argc != 5 )
  {
    return -1;
  }

  if ( sfwfs_mount() )
  {
    return -2;
  }

  if ( load_file ( argv[4] ) )
  {
    return -2;
  }

  if ( sfwfs_new ( argv[3], gSize, &xOffset ) )
  {
    sfwfs_unmount();
    return -2;
  }

  for ( i = 0; i < gSize; i++ )
  {
    if ( sfwfs_int_write ( xOffset, xData ) )
    {
      fprintf ( stderr, "Write Failed?\n" );
      sfwfs_unmount();
      return -2;
    }

    xData += BLK_SIZE;
    xOffset++;
  }

  if ( sfwfs_set_sha1 ( argv[3], ( U8* ) gChksum ) )
  {
    sfwfs_unmount();
    return -2;
  }

  sfwfs_unmount();
  return 0;
}

int do_get ( int argc, char** argv )
{
  int i;
  U32 xOffset;
  uint8_t* xData = gImg;

  if ( argc != 5 )
  {
    return -1;
  }

  if ( sfwfs_mount() )
  {
    return -2;
  }

  if ( sfwfs_find ( argv[3], &xOffset, &gSize ) )
  {
    sfwfs_unmount();
    return -2;
  }

  for ( i = 0; i < gSize; i++ )
  {
    if ( sfwfs_int_read ( xOffset, xData ) )
    {
      fprintf ( stderr, "Read Failed?\n" );
      sfwfs_unmount();
      return -2;
    }

    xData += BLK_SIZE;
    xOffset++;
  }

  sfwfs_unmount();

  if ( save_file ( argv[4] ) )
  {
    return -2;
  }

  return 0;
}

int do_del ( int argc, char** argv )
{
  int xRet;

  if ( argc != 4 )
  {
    return -1;
  }

  if ( sfwfs_mount() )
  {
    return -2;
  }

  xRet = sfwfs_del ( argv[3] );
  sfwfs_unmount();

  if ( xRet )
  {
    return -2;
  }

  return 0;
}

int do_check ( int argc, char** argv )
{
  int i;
  U32 xOffset;
  U32 xState[5];
  uint8_t* xData = gImg;

  if ( argc != 4 )
  {
    return -1;
  }

  if ( sfwfs_mount() )
  {
    return -2;
  }

  if ( sfwfs_find ( argv[3], &xOffset, &gSize ) )
  {
    sfwfs_unmount();
    return -2;
  }

  for ( i = 0; i < gSize; i++ )
  {
    if ( sfwfs_int_read ( xOffset, xData ) )
    {
      fprintf ( stderr, "Read Failed?\n" );
      sfwfs_unmount();
      return -2;
    }

    xData += BLK_SIZE;
    xOffset++;
  }

  // Just check the checksum of the buffer against what the FS has
  calc_checksum();

  if ( sfwfs_get_sha1 ( argv[3], ( U8* ) xState ) )
  {
    sfwfs_unmount();
    return -2;
  }

  fprintf ( stderr, "Stored Checksum: " );

  for ( i = 0; i < 5; i++ )
  {
    fprintf ( stderr, "%08X", xState[i] );
  }

  fprintf ( stderr, "\n" );
  sfwfs_unmount();

  if ( memcmp ( xState, gChksum, 20 ) )
  {
    fprintf ( stderr, "CHECKSUM MISMATCH!\n" );
    return -2;
  }

  return 0;
}

// int do_swap ( int argc, char** argv )
// {
//   if ( argc != 3 )
//   {
//     return -1;
//   }
// 
//   if ( sfwfs_byteswap() )
//   {
//     return -1;
//   }
// 
//   return 0;
// }

int main ( int argc, char** argv )
{
  int ( *main_fn ) ( int, char** ) = NULL;
  int xRet;

  if ( argc < 3 )
  {
    usage();
    return 1;
  }

  gFD = open ( argv[1], O_RDWR );

  if ( gFD < 0 )
  {
    perror ( "Failed to open image file" );
    return 1;
  }

  // Work out which sub function is needed
  if ( !strcmp ( argv[2], "format" ) )
  {
    main_fn = do_format;
  }
  else if ( !strcmp ( argv[2], "list" ) )
  {
    main_fn = do_list;
  }
  else if ( !strcmp ( argv[2], "add" ) )
  {
    main_fn = do_add;
  }
  else if ( !strcmp ( argv[2], "get" ) )
  {
    main_fn = do_get;
  }
  else if ( !strcmp ( argv[2], "del" ) )
  {
    main_fn = do_del;
  }
  else if ( !strcmp ( argv[2], "check" ) )
  {
    main_fn = do_check;
  }
//   else if ( !strcmp ( argv[2], "swap" ) )
//   {
//     main_fn = do_swap;
//   }
  else
  {
    fprintf ( stderr, "Unknown sub-function '%s'.\n", argv[2] );
    close ( gFD );
    usage();
    return -1;
  }

  if(  main_fn != do_format )
  {
    if ( sfwfs_byteswap() )
    {
      return -1;
    }
  }

  xRet = (*main_fn)( argc, argv );


  if ( sfwfs_byteswap() )
  {
    return -1;
  }

  close ( gFD );

  if ( xRet == -1 )
  {
    usage();
  }

  return xRet;
}


// File system access functions
int sfwfs_int_write ( U32 pBlock, void* pData )
{
  uint64_t xSeek;
  int xRet;

  if ( gFD < 0 )
  {
    return -1;
  }

  xSeek = lseek ( gFD, pBlock * BLK_SIZE, SEEK_SET );

  if ( xSeek != pBlock * BLK_SIZE )
  {
    return -1;
  }

  xRet = write ( gFD, pData, BLK_SIZE );

  if ( xRet != BLK_SIZE )
  {
    return -1;
  }

  return 0;
}

int sfwfs_int_read ( U32 pBlock, void* pData )
{
  uint64_t xSeek;
  int xRet;

  if ( gFD < 0 )
  {
    return -1;
  }

  xSeek = lseek ( gFD, pBlock * BLK_SIZE, SEEK_SET );

  if ( xSeek != pBlock * BLK_SIZE )
  {
    return -1;
  }

  xRet = read ( gFD, pData, BLK_SIZE );

  if ( xRet != BLK_SIZE )
  {
    return -1;
  }

  return 0;
}

int sfwfs_int_getsize ( U32* pSize )
{
  uint64_t xImageSz = 0;
  int xRet;

  if ( gFD < 0 )
  {
    return -1;
  }

  // Attempt to do size request as if image is a block device
  xRet = ioctl ( gFD, BLKGETSIZE64, &xImageSz );

  if ( !xRet )
  {
    // Success
    *pSize = xImageSz / BLK_SIZE;
    return 0;
  }

  // That failed, attempt to find file size instead
  xImageSz = lseek ( gFD, 0, SEEK_END );
  lseek ( gFD, 0, SEEK_SET ); // Return the position

  if ( xImageSz > 0 )
  {
    *pSize = xImageSz / BLK_SIZE;
    return 0;
  }

  return -1;
}

