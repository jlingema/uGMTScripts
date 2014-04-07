/*
 * avr32_sfwfs.h
 *
 *  Created on: 26 Nov 2012
 *      Author: sf105
 */

#ifndef AVR32_SFWFS_H_
#define AVR32_SFWFS_H_

#ifndef STANDALONE
#include "avr32_arch.h"
#else
#include "imgtool/standalone.h"
#endif


#define AVR32_SD_SLOT 0


// Main header constants
#define SFWFS_MAGIC 0x5F5AA5F6
#define SFWFS_VERSION 0x00000001
#define SFWFS_VER_MASK 0x000000FF
#define SFWFS_LABEL_LEN 32
#define SFWFS_RES_LEN 20
// File entry constants
#define SFWFS_FTFLAG_FILE  0x1
#define SFWFS_FTFLAG_SPACE 0x2
#define SFWFS_FTNAME_LEN 32
#define SFWFS_FTSUM_LEN 20

// The maximum size file we can store
#define SFWFS_DATABLOCK_SIZE 40000

// Error codes
#define SFWFS_ERR_NONE      0 /* OK */
#define SFWFS_ERR_ENOENTRY -1 /* No entry / file not found */
#define SFWFS_ERR_INTERROR -2 /* Internal error */
#define SFWFS_ERR_NOSPACE  -3 /* No Space / FS Full */
#define SFWFS_ERR_IOERROR  -4 /* IO Error */
#define SFWFS_ERR_INVALID  -5 /* Invalid data on disk */
#define SFWFS_ERR_OFFLINE  -6 /* FS is offline/not mounted */
#define SFWFS_ERR_EXISTS   -7 /* Entry exists unexpectedly */
#define SFWFS_ERR_BUSY     -8 /* FS is busy doing something else */

struct sSFWFS_Header
{
  U32 magic;
  U32 flags;
  U8 label[SFWFS_LABEL_LEN];
  U8 reserved[SFWFS_RES_LEN];
  U32 hdr_size;
} __attribute__ ( ( __packed__ ) );

struct sSFWFS_FileEntry
{
  U32 flags;
  U32 size;
  U32 offset;
  U8 fname[SFWFS_FTNAME_LEN];
  U8 chksum[SFWFS_FTSUM_LEN];
}  __attribute__ ( ( __packed__ ) );

struct sSFWFS_HeaderSector
{
  struct sSFWFS_Header header;
  struct sSFWFS_FileEntry file[7];
}  __attribute__ ( ( __packed__ ) );

struct sSFWFS_TableSector
{
  struct sSFWFS_FileEntry file[8];
}  __attribute__ ( ( __packed__ ) );

union sSFWFS_Block
{
  struct sSFWFS_HeaderSector header;
  struct sSFWFS_TableSector table;
}  __attribute__ ( ( __packed__ ) );

// Formats the SD card with the filesystem
int sfwfs_format ( char* pLabel );
// Byte swap an (unmounted) filesystem
int sfwfs_byteswap ( void );
// Caches the filesystem super-block
int sfwfs_mount ( void );
// Marks the filesystem cache as invalid
int sfwfs_unmount ( void );
// Finds the offset to a file on the filesystem
int sfwfs_find ( char* pFilename, U32* pOffset, U32* pSize );
// Iterate over files on the filesystem
int sfwfs_iter ( char** pFileOut, U32* pSizeOut, U32* pBlock, U32* pEntry );
// Finds a space for a new file and creates it
int sfwfs_new ( char* pFilename, U32 pSize, U32* pOffset );
// Sets the checksum of a file
int sfwfs_set_sha1 ( char* pFilename, U8 pChksum[20] );
// Gets the checksum of a file
int sfwfs_get_sha1 ( char* pFilename, U8 pChksum[20] );
// Delete a file
int sfwfs_del ( char* pFilename );

// Required support functions
// Functions required to read/write the target block device on this platform
extern int sfwfs_int_write ( U32 pBlock, void* pData );
extern int sfwfs_int_read ( U32 pBlock, void* pData );
extern int sfwfs_int_getsize ( U32* pSize );

#endif /* AVR32_SFWFS_H_ */
