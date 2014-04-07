/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 * A simple SHA-1 library for AVR32.
 *
 */

#include "imperial_mmc/avr32_sha1.h"

// Implementation based on wikipedia pseudo code
// http://en.wikipedia.org/wiki/SHA-1

// Set-up the initial hash parameters
void sha1_init ( U32 pState[5] )
{
  pState[0] = 0x67452301;
  pState[1] = 0xEFCDAB89;
  pState[2] = 0x98BADCFE;
  pState[3] = 0x10325476;
  pState[4] = 0xC3D2E1F0;
}

// Rotate a U32 by a fixed amount
inline U32 sha1_lr ( U32 pIn, U8 pAmount )
{
  U32 xRes = pIn << pAmount;
  xRes |= ( pIn >> ( sizeof ( xRes ) * 8 - pAmount ) );
  return xRes;
}

// Add another 512-bit block to the hash
void sha1_update ( U32 pState[5], U32 pBytes[16] )
{
  int i = 0;
  U32 w[80]; // Expanded 32bit words
  U32 a, b, c, d, e, f, k, temp;

  for ( i = 0; i < 16; i++ )
  {
    w[i] = pBytes[i];
  }

  for ( i = 16; i < 80; i++ )
  {
    w[i] = ( w[i-3] ^ w[i-8] ^ w[i-14] ^ w[i-16] );
    w[i] = sha1_lr ( w[i], 1 );
  }

  a = pState[0];
  b = pState[1];
  c = pState[2];
  d = pState[3];
  e = pState[4];

  // 80 main rounds
  for ( i = 0; i < 80; i++ )
  {
    if ( i < 20 )
    {
      f = ( b & c ) | ( ( ~b ) & d );
      k = 0x5A827999;
    }
    else if ( i < 40 )
    {
      f = b ^ c ^ d;
      k = 0x6ED9EBA1;
    }
    else if ( i < 60 )
    {
      f = ( b & c ) | ( b & d ) | ( c & d );
      k = 0x8F1BBCDC;
    }
    else
    {
      f = b ^ c ^ d;
      k = 0xCA62C1D6;
    }

    temp = sha1_lr ( a, 5 ) + f + e + k + w[i];
    e = d;
    d = c;
    c = sha1_lr ( b, 30 );
    b = a;
    a = temp;
  }

  // Update the state
  pState[0] += a;
  pState[1] += b;
  pState[2] += c;
  pState[3] += d;
  pState[4] += e;
}

// Add a non-512 byte block and finish the hash
void sha1_finish ( U32 pState[5], U32* pBytes, U32 pSize, U32 pTotal )
{
  int i;
  U32 xFinal[16] = {};

  // Tidy up the end of the message
  if ( pSize > 14 )
  {
    return;  // Invalid size
  }

  // Create the final block
  for ( i = 0; i < pSize; i++ )
  {
    xFinal[i] = pBytes[i];
  }

  xFinal[i++] = 0x80; // Append a single bit
  // Work out the total in bits (i.e. *8, i.e. << 3)
  // as a 64-bit value
  xFinal[14] = ( pTotal & 0xE0000000 ) >> 29;
  xFinal[15] = pTotal << 3; // Total in bits
  sha1_update ( pState, xFinal );
}
