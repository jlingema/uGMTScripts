/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 */

#ifndef AVR32_BUFFER_H_
#define AVR32_BUFFER_H_

#include "avr32_arch.h"

#define IPMB_BUF_NUM 5
#define IPMB_BUF_LEN 64

struct IPMB_BUFFER
{
  // Current (Write) Message
  U8 curw;
  // Current (Read) Message
  U8 curr;
  // Number of stored messages
  U8 num;
  // Message lengths
  U8 len[IPMB_BUF_NUM];
  // Actual message data
  U8 buf[IPMB_BUF_NUM][IPMB_BUF_LEN];
};

#define IPMB_BUFFER_COUNT(pBUFFER) ((pBUFFER)->num)

int ipmb_buffer_push ( U8* pMsg,
                       U8 pLen,
                       struct IPMB_BUFFER* pBuffer );
int ipmb_buffer_pop ( U8* pMsg,
                      U8 pMaxLen,
                      struct IPMB_BUFFER* pBuffer );

#endif /* AVR32_BUFFER_H_ */
