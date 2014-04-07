/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 * This function provides a basic buffer library that stores "messages".
 * A message is a collection of bytes and a length.
 * A buffer is a queue of messages.
 * The library is thread(/interrupt) safe.
 */
#include "imperial_mmc/avr32_buffer.h"

// Needed for memcpy
#include <string.h>

int ipmb_buffer_push ( U8* pMsg,
                       U8 pLen,
                       struct IPMB_BUFFER* pBuffer )
{
  if ( pLen > IPMB_BUF_LEN )
  {
    return -1;
  }

  if ( pBuffer->num >= IPMB_BUF_NUM )
  {
    return -2;
  }

  // Make buffer manipulation interrupt safe!
  ENTER_CRTICAL_SECTION();
  // Store the data & length
  memcpy ( pBuffer->buf[pBuffer->curw],
           pMsg,
           pLen );
  pBuffer->len[pBuffer->curw] = pLen;
  // Update the current write pointer
  pBuffer->curw++;

  if ( pBuffer->curw >= IPMB_BUF_NUM )
  {
    pBuffer->curw = 0;
  }

  // Update the count
  pBuffer->num++;
  EXIT_CRITICAL_SECTION();
  return 0;
}

int ipmb_buffer_pop ( U8* pMsg,
                      U8 pMaxLen,
                      struct IPMB_BUFFER* pBuffer )
{
  U8 xLen;
  ENTER_CRTICAL_SECTION();

  if ( pBuffer->num == 0 )
  {
    // No message to return
    EXIT_CRITICAL_SECTION();
    return -1;
  }

  // Get the next message length
  xLen = pBuffer->len[pBuffer->curr];

  if ( xLen > pMaxLen )
  {
    // Not enough buffer space
    EXIT_CRITICAL_SECTION();
    return -2;
  }

  // Get the message out
  memcpy ( pMsg,
           pBuffer->buf[pBuffer->curr],
           xLen );
  // Update the pointers
  pBuffer->curr++;

  if ( pBuffer->curr >= IPMB_BUF_NUM )
  {
    pBuffer->curr = 0;
  }

  // Update the count
  pBuffer->num--;
  EXIT_CRITICAL_SECTION();
  return xLen;
}
