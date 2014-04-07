/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 */

#ifndef AVR32_SPI_H_
#define AVR32_SPI_H_

#include "avr32_arch.h"

typedef void ( *spi_cb ) ( U8 xFlags );

// For now we'll clock the SPI bus at 12.5K
// It can probably run up to around 4MHz
#define SPI_SPEED_12_5K 12500
#define SPI_SPEED_1M 1000000

#define SPI_MEM_CMD_READ  0x03
#define SPI_MEM_CMD_WRITE 0x02
#define SPI_MEM_CMD_RDSR  0x05
#define SPI_MEM_CMD_WRHF  0x07

#define SPI_MEM_WRHF_CLR_MASK   (1 << 0)
#define SPI_MEM_WRHF_SET_MASK   (1 << 1)
#define SPI_MEM_WRHF_READY_MASK  (1 << 5)
#define SPI_MEM_WRHF_TRANS_MASK  (1 << 3)
#define SPI_MEM_WRHF_LSTB_MASK  (1 << 6)
#define SPI_MEM_WRHF_USTB_MASK  (1 << 7)
#define SPI_MEM_WRHF_ALL_MASK   0xFC

void spi_master_init();


U16 spi_transfer16 ( U16 pData );
U32 spi_transfer32 ( U32 pData );

//int spi_mem_trans ( U8 pWrite, U16 pAddr, U8* pData, U16 pLen, U8 pFlag );
int spi_mem_write ( U32* pData, U32 pLen );
int spi_mem_read ( U32* pData, U32 pLen );
//int spi_mem_rdsr ( U8* pSRVal );
//int spi_mem_set_wrhf ( U8 pFlags );
//int spi_mem_clr_wrhf ( U8 pFlags );
//int spi_ipbus_issue ( U16 pLen, U8* pDataIn );
//U16 spi_ipbus_response ( U16 pLen, U8* pDataOut );
//void spi_mem_register ( spi_cb pCallback );
//void spi_mem_check();
//int spi_temp_read ( float* pTemp );

#endif /* AVR32_SPI_H_ */
