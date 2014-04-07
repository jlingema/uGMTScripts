/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 */

// We'll have a simple static read-only FRU area for now
// If you want to update this, make sure the offsets in
// fru_recalc_checksums are correct!
static U8 gFRU_Info[] =
{
  // The structure of this is defined in the Intel FRU Area Documentation.
  // In this, 1 Word = 8 Bytes
  /* 0 (0 Words) */
  // Common Header
  0x01,                   // Data Version
  0x00,                   // Internal User Area Offset (Words)
  0x00,                   // Chassis Info Area Offset (Words)
  0x01,                   // Board Area Offset (Words)
  0x05,                   // Product Info Area Offset (Words)
  0x0B,                   // Multi-Record Area Offset (Words)
  0x00,                   // Padding (00)
  0xEE,                   // Common Header Checksum

  /* 8 (1 Word) */
  // Board Info Area
  0x01,                   // Format Version
  0x04,                   // Board Area Length (Words)
  0x00,                   // Language Code (00 = English)
  0x00,0x00,0x00, // Board manufacture time (Minutes since 1/1/96, LSB first)
  0xC8,                   // Board Manufacturer String Type / Length
  'I','m','p','e','r','i','a','l',    // Board Manufacturer
  /* 23 */
  0xC3,                   // Board Product Name String Type / Length
  'M','P','7',  // Product Name
  0xC4,                   // Board Serial Number String Type / Length
  '0','0','0','0', // Board Serial
  0xC3,                   // Board Part Number String Type / Length
  'M','P','7',    // Board Part Number
  /* 36 */
  0xC1,                   // FRU File ID String Type / Length
  'd',                    // FRU File ID, I'll increase this to indicate major revisions
  0xC1,                   // End of fields byte
  0x00,                   // Checksum Byte (fru_recalc_checksums)

  /* 40 (5 Words) */
  // Product Info Area
  0x01,                   // Format Version
  0x06,                   // Product Area Length (Words)
  0x00,                   // Language Code (English)
  0xC8,                   // Product Manufacturer String Type / Length
  'I','m','p','e','r','i','a','l',    // Product Manufacturer
  0xC3,                   // Product Product Name String Type / Length
  /* 53 */
  'M','P','7',              // Product Name
  0xC9,                    // Product Part Num
  'M','M','C',' ','v','1','.','2','1', // Product Part Num
  /* 66 */
  0xC4,                    // Product Version
  'v','1','r','0' + MP7_REV, // Product Version
  0xC4,                    // Product Serial Number String Type / Length
  '0','0','0','0', // Product Serial
  0xC4,                    // Asset Tag
  'N','O','N','E', // Asset Tag
  0xC1,                   // FRU File ID String Type / Length
  'e',                    // FRU File ID
  0xC1,                   // End of fields byte
  /* 84 */
  0x00,                   // Padding
  0x00,                   // Padding
  0x00,                   // Padding
  0x00,                   // Checksum (fru_recalc_checksums)

  /* 88 (11 Words) */
  // Multi Record Area
  //// 1) Power Requirements Record
  0xC0,                   // Record Type (OEM)
  0x82,                   // Version (and end of list (0x80))
  0x06,                   // Record Length (Bytes)
  0x00,                   // Record Checksum (fru_recalc_checksums)
  0x00,                   // Header Checksum (fru_recalc_checksums)
  0x5A,0x31,0x00, // Manufacturer ID, LSB First (PICMG)
  0x16,                   // PICMG Record ID
  0x00,                   // Record Format Version
  //0x43,                   // PSU Current Required (100mA units) (6.7A / 80W)
  0x3C,					// Greg's crate will only supply 72W... (6A @ 12V)
  /* 91 */
  0x00, 0x00

  // Drop the Point-to-point record as it isn't really used
  /*
  //// 2) Point-to-Point Record
  0xC0,                   // Record Type (OEM)
  0x82,                   // Version (and end-of-list (0x80))
  0x10,                   // Record Length (Bytes)
  0x00,                   // Record Checksum (fru_recalc_checksums)
  0x00,                   // Header Checksum (fru_recalc_checksums)
  0x5A,0x31,0x00, // Manufacturer ID, LSB First (PICMG)
  0x19,                   // PICMG Record ID (Point-to-Point)
  0x00,                   // Record Format Version
  0x00,                   // OEM GUID Count
  0x80,                   // Record Type
  0x01,                   // AMC Channel Descriptor Count
  0xA4,0x98,0xF3, // AMC Channel Descriptor (LSB First)
  0x00,0x00,0x00,0x00,0x00 // AMC Link Descriptor (LSB First)
  */

  /* 112 */
  // Pad to a round number of 32-bit words here!
};

// Byte addresses of the various areas
#define FRU_BOARD_START  8
#define FRU_BOARD_LEN    31
#define FRU_BOARD_CHKPOS 39
#define FRU_PROD_START   40
#define FRU_PROD_LEN     47
#define FRU_PROD_CHKPOS  87
#define FRU_MRAR_START   93
#define FRU_MRAR_LEN     6
#define FRU_MRAR_CHKPOS  91
#define FRU_MRAH_START   88
#define FRU_MRAH_LEN     4
#define FRU_MRAH_CHKPOS  92
