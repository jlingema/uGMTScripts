/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 * This is an implementation of a very very bad random number generator,
 * it was used for testing memory blocks and isn't suitable for much else.
 *
 * Note: This isn't even a proper PRNG generator (it reveals its state).
 *       It generates very correlated numbers,
 *       but sufficient for doing simple tests.
 */

#include "imperial_mmc/avr32_prng.h"

U32 gPRNGState = 0xFFFFFFFF;

void prng_seed ( U32 pSeed )
{
  gPRNGState = pSeed;
}

U32 prng_next()
{
  U8 xTap1 = ( gPRNGState & 0x00000001 ) >>  0;
  U8 xTap2 = ( gPRNGState & 0x00000002 ) >>  1;
  U8 xTap3 = ( gPRNGState & 0x00400000 ) >> 22;
  U8 xTap4 = ( gPRNGState & 0x80000000 ) >> 31;
  U8 xNewBit = xTap1 ^ ( xTap2 ^ ( xTap3 ^ xTap4 ) );
  U32 xNextState = gPRNGState >> 1;
  xNextState |= ( xNewBit << 31 );
  gPRNGState = xNextState;
  return gPRNGState;
}
