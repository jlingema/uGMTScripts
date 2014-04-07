/*
 * avr32_sfwfs.c
 *
 *  Created on: 23 Nov 2012
 *      Author: sf105
 *
 * This file implements the Simple-FirmWare FileSystem library on top
 * of the SD card library. It provides all the functions required to access
 * and update the file system metadata.
 */

#include "imperial_mmc/avr32_sfwfs.h"

#define BASE_BLOCK_SIZE 512

#ifndef STANDALONE
// Support functions for the FS
extern U32 g_u32_card_size[MCI_NR_SLOTS];

int sfwfs_int_write ( U32 pBlock, void* pData )
{
  if ( !sd_mmc_mci_card_init ( AVR32_SD_SLOT ) )
  {
    return -1;  // Card missing?
  }

  if ( !sd_mmc_mci_write_open ( AVR32_SD_SLOT, pBlock, 1 ) )
  {
    return -1;  // Write open failed
  }

  if ( !sd_mmc_mci_write_sector_from_ram ( AVR32_SD_SLOT, pData ) )
  {
    sd_mmc_mci_write_close ( AVR32_SD_SLOT );
    return -1; // Write failed
  }

  if ( !sd_mmc_mci_write_close ( AVR32_SD_SLOT ) )
  {
    return -1; // Bad checksum or something
  }

  return 0;
}

int sfwfs_int_read ( U32 pBlock, void* pData )
{
  if ( !sd_mmc_mci_card_init ( AVR32_SD_SLOT ) )
  {
    return -1;  // Card missing?
  }

  if ( !sd_mmc_mci_read_open ( AVR32_SD_SLOT, pBlock, 1 ) )
  {
    return -1;  // Open failed
  }

  if ( !sd_mmc_mci_read_sector_2_ram ( AVR32_SD_SLOT, pData ) )
  {
    return -1;  // Read failed
  }

  sd_mmc_mci_read_close ( AVR32_SD_SLOT );
  return 0;
}

int sfwfs_int_getsize ( U32* pSize )
{
  if ( !sd_mmc_mci_card_init ( AVR32_SD_SLOT ) )
  {
    return -1;  // Card missing?
  }

  *pSize = g_u32_card_size[AVR32_SD_SLOT];
  return 0;
}
#endif

Bool gMounted = false;
U32 gHeaderSz = 0; // Only valid when gMounted = true
union sSFWFS_Block gCache __attribute__ ( ( aligned ( BASE_BLOCK_SIZE ) ) ) = {};

int sfwfs_format ( char* pLabel )
{
  int j;
  U32 i;
  U32 xSize; // Header size
  U32 xOffset; // The offset the current filetable block represents
  U32 xCapacity; // Block device capacity

  if ( gMounted )
  {
    sfwfs_unmount();
  }

  dprintf ( "[SFWFS] Formating SD Card... (Sector size: %lu)\n",
            sizeof ( gCache ) );

  if ( sfwfs_int_getsize ( &xCapacity ) )
  {
    dprintf ( "[SFWFS] Failed to get block device capacity!\n" );
    return SFWFS_ERR_IOERROR;
  }

  dprintf ( "[SFWFS] Card capacity is %lu blocks.\n", xCapacity );
  // We'll set it up to store about 20MB files optimally
  xSize = ( ( xCapacity / SFWFS_DATABLOCK_SIZE ) / 8 ) + 1; // 8 entries per table
  xOffset = xSize; // Put the first data block after the file table
  // Assemble the new superblock in the cache
  // Then flush it to disk
  memset ( &gCache, 0, BASE_BLOCK_SIZE );
  gCache.header.header.magic = SFWFS_MAGIC;
  gCache.header.header.flags = SFWFS_VERSION;
  gCache.header.header.hdr_size = xSize;
  strncpy ( ( char* ) gCache.header.header.label, pLabel, SFWFS_LABEL_LEN );
  memset ( gCache.header.header.reserved, 0, SFWFS_RES_LEN );

  for ( j = 0; j < 7; j++ )
  {
    gCache.header.file[j].flags = SFWFS_FTFLAG_SPACE;

    if ( xOffset > 0 )
    {
      gCache.header.file[j].offset = xOffset;
      gCache.header.file[j].size = SFWFS_DATABLOCK_SIZE;
      gCache.header.file[j].flags = SFWFS_FTFLAG_SPACE;
      xOffset += SFWFS_DATABLOCK_SIZE;

      if ( xOffset >= xCapacity )
      {
        // Card is now full
        xOffset = 0;
        // Update previous entry as it isn't full size
        gCache.header.file[j].size -= ( xOffset - xCapacity );
      }
    }
  }

  // Write sectors to position 0 onwards
  for ( i = 0; i < xSize; i++ )
  {
    // Write the sector
    if ( sfwfs_int_write ( i, &gCache ) )
    {
      dprintf ( "[SFWFS] SD Card write failed! (Sector %lu)\n", i );
      return SFWFS_ERR_NOSPACE;
    }

    // Clear the cache and write it out as space entries in the
    // file table
    memset ( &gCache, 0, BASE_BLOCK_SIZE );

    for ( j = 0; j < 8; j++ )
    {
      // This creates file/space entries in the file table
      if ( xOffset > 0 )
      {
        gCache.table.file[j].offset = xOffset;
        gCache.table.file[j].size = SFWFS_DATABLOCK_SIZE;
        gCache.table.file[j].flags = SFWFS_FTFLAG_SPACE;
        xOffset += SFWFS_DATABLOCK_SIZE;

        if ( xOffset >= xCapacity )
        {
          // Card is now full
          xOffset = 0;
          // Update previous entry as it isn't a full block, just nullify it
          gCache.table.file[j].offset = 0;
          gCache.table.file[j].size = 0;
          gCache.table.file[j].flags = 0;
        }
      }
      else
      {
        // This file table entry is unused (card full!)
        // Leave it blank so nothing in flags is set
      }
    }
  }

  dprintf ( "[SFWFS] Format complete. Max files: %lu.\n",
            ( ( xSize - 1 ) << 3 ) + 7 );
  return SFWFS_ERR_NONE;
}

U32 byteswap ( U32 xIn )
{
  U32 xTmp = xIn << 24;
  xTmp |= ( xIn << 8 ) & 0x00FF0000;
  xTmp |= ( xIn >> 8 ) & 0x0000FF00;
  xTmp |= ( xIn >> 24 );
  return xTmp;
}

int sfwfs_byteswap ( void )
{
  U32 xBlock;
  U32 xEntry = 1; // Skip the header on the first entry
  // Filesystem must be unmounted! I.e. the opposite of the other functions
  if ( gMounted )
  {
    return SFWFS_ERR_OFFLINE;
  }

  if ( sfwfs_int_read ( 0, &gCache ) )
  {
    dprintf ( "[SFWFS] Failed to cache header.\n" );
    return SFWFS_ERR_IOERROR;
  }

  gHeaderSz = 0;

  if ( gCache.header.header.magic == SFWFS_MAGIC )
  {
    // Header is in local format
    gHeaderSz = gCache.header.header.hdr_size;
  }

  gCache.header.header.magic = byteswap ( gCache.header.header.magic );
  gCache.header.header.flags = byteswap ( gCache.header.header.flags );
  gCache.header.header.hdr_size = byteswap ( gCache.header.header.hdr_size );

  if ( gHeaderSz < 1 )
  {
    if ( gCache.header.header.magic != SFWFS_MAGIC )
    {
      // Header not recognised, even after byte swap!
      dprintf ( "[SFWFS] No valid header found (0x%08lX != 0x%08X).\n",
                gCache.header.header.magic, SFWFS_MAGIC );
      return SFWFS_ERR_INVALID;
    }

    gHeaderSz = gCache.header.header.hdr_size;
  }

  if ( sfwfs_int_write ( 0, &gCache ) )
  {
    dprintf ( "[SFWFS] Failed to write updated header.\n" );
    return SFWFS_ERR_IOERROR;
  }

  dprintf ( "[SFWFS] Byte swapping %lu table blocks.\n", gHeaderSz );

  // Now byte swap all of the file entries
  for ( xBlock = 0; xBlock < gHeaderSz; xBlock++ )
  {
    if ( sfwfs_int_read ( xBlock, &gCache ) )
    {
      dprintf ( "[SFWFS] Failed to read block for byte swap.\n" );
      return SFWFS_ERR_IOERROR;
    }

    for ( ; xEntry < 8; xEntry++ )
    {
      gCache.table.file[xEntry].flags = byteswap ( gCache.table.file[xEntry].flags );
      gCache.table.file[xEntry].size = byteswap ( gCache.table.file[xEntry].size );
      gCache.table.file[xEntry].offset = byteswap ( gCache.table.file[xEntry].offset );
    }

    if ( sfwfs_int_write ( xBlock, &gCache ) )
    {
      dprintf ( "[SFWFS] Failed to write block for byte swap.\n" );
      return SFWFS_ERR_IOERROR;
    }

    xEntry = 0;
  }

  return 0;
}

// Caches the filesystem super-block
int sfwfs_mount ( void )
{
  if ( gMounted )
  {
    return SFWFS_ERR_BUSY;
  }

  // Read the first block and get get filesystem info
  dprintf ( "[SFWFS] Mounting SD Card...\n" );

  if ( sfwfs_int_read ( 0, &gCache ) )
  {
    dprintf ( "[SFWFS] Failed to open SD card for mount.\n" );
    return SFWFS_ERR_IOERROR;
  }

  if ( gCache.header.header.magic != SFWFS_MAGIC )
  {
    dprintf ( "[SFWFS] Bad magic number in superblock (0x%08lX).\n",
              gCache.header.header.magic );
    return SFWFS_ERR_INVALID;
  }

  if ( ( gCache.header.header.flags & SFWFS_VER_MASK ) != SFWFS_VERSION )
  {
    dprintf ( "[SFWFS] Unrecognised FS version.\n" );
    return SFWFS_ERR_INVALID;
  }

  if ( gCache.header.header.hdr_size < 1 )
  {
    dprintf ( "[SFWFS] Invalid size field in header!\n" );
    return SFWFS_ERR_INVALID;
  }

  dprintf ( "[SFWFS] Mounted volume: '%s'\n", gCache.header.header.label );
  gMounted = true;
  gHeaderSz = gCache.header.header.hdr_size;
  return SFWFS_ERR_NONE;
}

// Marks the filesystem cache as invalid
int sfwfs_unmount ( void )
{
  dprintf ( "[SFWFS] Unmounting SD Card...\n" );
  gMounted = false;
  gHeaderSz = 0;
  return SFWFS_ERR_NONE;
}

// Internal function to get the block & offset to a files FT entry
int sfwfs_lookup ( char* pFilename, U32* pBlock, U8* pEntry, U32 pSizeIn )
{
  if ( !gMounted )
  {
    return SFWFS_ERR_OFFLINE;
  }

  // Loop through looking for an entry with a matching filename
  for ( ; *pBlock < gHeaderSz; ( *pBlock ) ++ )
  {
    // Fetch the current block into the cache
    if ( sfwfs_int_read ( *pBlock, &gCache ) )
    {
      dprintf ( "[SFWFS] Failed to read file table.\n" );
      return SFWFS_ERR_IOERROR;
    }

    for ( ; *pEntry < 8; ( *pEntry ) ++ )
    {
      if ( ( *pBlock == 0 ) && ( *pEntry == 0 ) )
      {
        continue;  // Skip over the header (Don't treat it as a file!)
      }

      if ( pFilename )
      {
        if ( ! ( gCache.table.file[*pEntry].flags & SFWFS_FTFLAG_FILE ) )
        {
          continue;  // File entry not a file! Probably just not used yet
        }

        if ( strncmp ( ( char* ) gCache.table.file[*pEntry].fname,
                       ( char* ) pFilename,
                       SFWFS_FTNAME_LEN ) == 0 )
        {
          // File found!
          // NOTE: We leave the block in the cache!
          // That way the function we return to can access it directly
          return SFWFS_ERR_NONE;
        }
      }
      else
      {
        // We are looking for space (filename == NULL)
        if ( ! ( gCache.table.file[*pEntry].flags & SFWFS_FTFLAG_SPACE ) )
        {
          continue;  // Not spare space
        }

        if ( gCache.table.file[*pEntry].size >= pSizeIn )
        {
          // Found a slot that is big enough
          // Leave current filetable block in the cache
          return SFWFS_ERR_NONE;
        }
      }
    }

    *pEntry = 0; // Reset pEntry ready to go to the next block
  }

  // File not found
  return SFWFS_ERR_ENOENTRY;
}

// Function for interating over all files (for something like 'ls')
int sfwfs_iter ( char** pFileOut, U32* pSizeOut, U32* pBlock, U32* pEntry )
{
  if ( !gMounted )
  {
    return SFWFS_ERR_OFFLINE;
  }

  while ( 1 )
  {
    if ( ( *pBlock == 0 ) && ( *pEntry == 0 ) )
    {
      // Skip the header entry
      ( *pEntry ) ++;
      continue;
    }

    if ( *pEntry >= 8 )
    {
      *pEntry = 0;
      ( *pBlock ) ++;
    }

    if ( *pBlock == gHeaderSz )
    {
      return SFWFS_ERR_ENOENTRY;  // All done
    }

    // TODO: Only read the block if it's not already cached!
    if ( sfwfs_int_read ( *pBlock, &gCache ) )
    {
      dprintf ( "[SFWFS] Failed to read file table.\n" );
      return SFWFS_ERR_IOERROR;
    }

    if ( ! ( gCache.table.file[*pEntry].flags & SFWFS_FTFLAG_FILE ) )
    {
      ( *pEntry ) ++;
      continue; // Not a file
    }

    // We have a file
    *pFileOut = ( char* ) gCache.table.file[*pEntry].fname;
    *pSizeOut = gCache.table.file[*pEntry].size;
    // Update the input so the next call will get the next file
    ( *pEntry ) ++;
    break;
  }

  return SFWFS_ERR_NONE;
}

// Finds the offset (as a block address) to a file on the filesystem
int sfwfs_find ( char* pFilename, U32* pOffset, U32* pSize )
{
  U32 xBlock = 0;
  U8 xEntry = 0;
  int xRet;

  if ( !gMounted )
  {
    return SFWFS_ERR_OFFLINE;
  }

  if ( ( xRet = sfwfs_lookup ( pFilename, &xBlock, &xEntry, 0 ) ) )
  {
    // File not found or other internal error
    dprintf ( "[SFWFS] Failed to get file.\n" );
    return xRet;
  }

  // The correct header block is already in the cache
  // (Thanks to sfwfs_lookup)
  // We can just return the value :)
  *pOffset = gCache.table.file[xEntry].offset;
  *pSize = gCache.table.file[xEntry].size;
  return SFWFS_ERR_NONE;
}

// Finds a space for a new file and creates it
int sfwfs_new ( char* pFilename, U32 pSize, U32* pOffset )
{
  U32 xBlock = 0;
  U8 xEntry = 0;

  if ( !gMounted )
  {
    return SFWFS_ERR_OFFLINE;
  }

  // Check the filename doesn't already exist
  if ( !sfwfs_lookup ( pFilename, &xBlock, &xEntry, 0 ) )
  {
    dprintf ( "[SFWFS] File already exists in create file!\n" );
    return SFWFS_ERR_EXISTS;
  }

  xBlock = 0;
  xEntry = 0;

  if ( sfwfs_lookup ( NULL, &xBlock, &xEntry, pSize ) )
  {
    // File not found or other internal error
    dprintf ( "[SFWFS] Failed to find space for file (FS full?).\n" );
    return SFWFS_ERR_NOSPACE;
  }

  strncpy ( ( char* ) gCache.table.file[xEntry].fname,
            ( char* ) pFilename,
            SFWFS_FTNAME_LEN );
  gCache.table.file[xEntry].flags = SFWFS_FTFLAG_FILE;
  gCache.table.file[xEntry].size = pSize;
  memset ( gCache.table.file[xEntry].chksum, 0, SFWFS_FTSUM_LEN );

  // Now write the updated sector back
  if ( sfwfs_int_write ( xBlock, &gCache ) )
  {
    dprintf ( "[SFWFS] Failed to write new FT table entry for file.\n" );
    sfwfs_unmount();
    return SFWFS_ERR_IOERROR;
  }

  *pOffset = gCache.table.file[xEntry].offset;
  return SFWFS_ERR_NONE;
}

int sfwfs_set_sha1 ( char* pFilename, U8 pChksum[SFWFS_FTSUM_LEN] )
{
  U32 xBlock = 0;
  U8 xEntry = 0;

  if ( !gMounted )
  {
    return SFWFS_ERR_OFFLINE;
  }

  if ( sfwfs_lookup ( pFilename, &xBlock, &xEntry, 0 ) )
  {
    // File not found or other internal error
    dprintf ( "[SFWFS] Failed to get file for checksum update.\n" );
    return SFWFS_ERR_ENOENTRY;
  }

  // The correct header block is already in the cache
  // (Thanks to sfwfs_lookup)
  // We can just update and re-write it back to the xBlock block
  strncpy ( ( char* ) gCache.table.file[xEntry].chksum,
            ( char* ) pChksum,
            SFWFS_FTSUM_LEN );

  if ( sfwfs_int_write ( xBlock, &gCache ) )
  {
    dprintf ( "[SFWFS] Failed to write updated checksum.\n" );
    sfwfs_unmount();
    return SFWFS_ERR_IOERROR;
  }

  return SFWFS_ERR_NONE;
}

int sfwfs_get_sha1 ( char* pFilename, U8 pChksum[SFWFS_FTSUM_LEN] )
{
  U32 xBlock = 0;
  U8 xEntry = 0;

  if ( !gMounted )
  {
    return SFWFS_ERR_OFFLINE;
  }

  if ( sfwfs_lookup ( pFilename, &xBlock, &xEntry, 0 ) )
  {
    // File not found
    dprintf ( "[SFWFS] Failed to find file for get checksum.\n" );
    return SFWFS_ERR_ENOENTRY;
  }

  strncpy ( ( char* ) pChksum,
            ( char* ) gCache.table.file[xEntry].chksum,
            SFWFS_FTSUM_LEN );
  return SFWFS_ERR_NONE;
}

int sfwfs_del ( char* pFilename )
{
  U32 xOffset; // Offset of the file _after_ the one being deleted
  U32 xBlock = 0;
  U8 xEntry = 0;
  U8 xNextEntry = 0;

  if ( !gMounted )
  {
    return SFWFS_ERR_OFFLINE;
  }

  // First find the file to delete
  if ( sfwfs_lookup ( pFilename, &xBlock, &xEntry, 0 ) )
  {
    dprintf ( "[SFWFS] File doesn't exist for delete.\n" );
    return SFWFS_ERR_ENOENTRY;
  }

  // Now we know where the file is, we need to get the offset of the next one
  // From that we can re-calculate its original slot length
  xNextEntry = xEntry + 1;

  if ( xNextEntry > 7 )
  {
    xNextEntry = 0;

    if ( sfwfs_int_read ( xBlock + 1, &gCache ) )
    {
      dprintf ( "[SFWFS] Failed to lookup next offset during delete.\n" );
      sfwfs_unmount();
      return SFWFS_ERR_IOERROR;
    }
  }

  if ( ( xBlock + 1 == gHeaderSz ) && ( xNextEntry >= 7 ) )
  {
    // We're on the last header block... Can't fetch next offset
    // Use entire disk size instead
    if ( sfwfs_int_getsize ( &xOffset ) )
    {
      dprintf ( "[SFWFS] Failed to lookup next offset during delete (EOD path).\n" );
      sfwfs_unmount();
      return SFWFS_ERR_IOERROR;
    }
  }
  else
  {
    xOffset = gCache.table.file[xNextEntry].offset;
  }

  // We now know the details, reload the table block that contains the file
  if ( sfwfs_lookup ( pFilename, &xBlock, &xEntry, 0 ) )
  {
    dprintf ( "[SFWFS] Interal delete error. File disappeared!\n" );
    return SFWFS_ERR_INTERROR;
  }

  // Clear the table entry back to its initial state
  gCache.table.file[xEntry].size =
    ( xOffset - gCache.table.file[xEntry].offset );
  gCache.table.file[xEntry].flags = SFWFS_FTFLAG_SPACE;
  memset ( ( char* ) gCache.table.file[xEntry].fname, 0, SFWFS_FTNAME_LEN );
  memset ( ( char* ) gCache.table.file[xEntry].chksum, 0, SFWFS_FTSUM_LEN );

  // Write the updated entry back to the FS
  if ( sfwfs_int_write ( xBlock, &gCache ) )
  {
    dprintf ( "[SFWFS] Failed to commit delete!\n" );
    sfwfs_unmount();
    return SFWFS_ERR_IOERROR;
  }

  // All done
  return SFWFS_ERR_NONE;
}

