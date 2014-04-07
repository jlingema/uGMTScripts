/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 * This handles the I2C interface to the AMC crate. It's basically
 * a wrapper around the the ATMEL I2C library.
 */

#include "imperial_mmc/avr32_i2c.h"

#include "imperial_mmc/avr32_arch.h"

// The function to call when data is received.
fi2c_cb gDataCallback = NULL;

// I2C receive buffer
char gI2C_rx_buf[I2C_RX_BUFFER] = {};
U8 gI2C_rx_buf_len = 0;

Bool gSkipByte = FALSE;

// Two-wire options
static twi_options_t TWI_MASTER_OPTS =
{
  .pba_hz = FOSCM_PB,
  .speed = I2C_SPEED_100K,
  .chip = 0, // This must be filled at run-time.
  .smbus = FALSE
};

static twis_options_t TWI_SLAVE_OPTS =
{
  .pba_hz = FOSCM_PB,
  .speed = I2C_SPEED_100K,
  .chip = 0, // Set @ Runtime
  .smbus = FALSE,
  .tenbit = FALSE
};

static void i2c_slave_rx ( U8 pByteIn )
{
  // This line will cause all I2C data to come out empty
  // Don't uncomment it unless you really need to.
  //dprintf("I2C DATA IN (0x%2X)!\n", pByteIn);
  // If buffer isn't full
  if ( gI2C_rx_buf_len < I2C_RX_BUFFER )
  {
    // Stash the byte
    gI2C_rx_buf[gI2C_rx_buf_len] = pByteIn;
    gI2C_rx_buf_len++;
  }
  else
  {
    // Buffer _IS_ full, this shouldn't happen
    dprintf ( "ERROR: I2C Buffer Overflow.\n" );
    // "Clear" the buffer to start again
    gI2C_rx_buf_len = 0;
  }

  return;
}

static U8 i2c_slave_tx()
{
  dprintf ( "ERROR: I2C Write Requested.\n" );
  return 0xFF;
}

static void i2c_slave_stop()
{
  // When we get a stop the packet is complete,
  // call the callback function if it's set.
  if ( gDataCallback )
  {
    gDataCallback ( ( U8* ) gI2C_rx_buf, gI2C_rx_buf_len );
  }

  // Now the data is processed, clear the buffer and start again
  gI2C_rx_buf_len = 0;
  //gSkipByte = TRUE;
  return;
}

// The callbacks for slave I2C operation
static const twi_slave_fct_t TWI_CBS =
{
  .rx = &i2c_slave_rx,
  .tx = &i2c_slave_tx,
  .stop = &i2c_slave_stop
};

void i2c_init ( U8 pMyAddr )
{
  TWI_MASTER_OPTS.chip = pMyAddr >> 1;
  TWI_SLAVE_OPTS.chip = pMyAddr >> 1;
  // Do a full reset of the transceiver
  CRATE_TWIM_MODULE.CR.swrst = 0x1;
  CRATE_TWIM_MODULE.CR.stop = 0x1;
  CRATE_TWIM_MODULE.CR.men = 0x1;
  // Enable master & slave on i2c bus.
  twi_master_init ( &CRATE_TWIM_MODULE, &TWI_MASTER_OPTS, TRUE );
  twi_slave_init ( &CRATE_TWIS_MODULE, &TWI_SLAVE_OPTS, &TWI_CBS, TRUE );
}

int i2c_send ( U8 pSAddr, U8* pBuffer, U8 pLen )
{
  //dprintf("I2C State: 0x%04lX\n", CRATE_TWIM_MODULE.sr);
  if ( ! ( CRATE_TWIM_MODULE.SR.txrdy ) )
  {
    // Re-init the master
    dprintf ( "ERROR: I2C Reset Required (I2C Bus Error!)\n" );
    // Do a full reset of the transceiver
    CRATE_TWIM_MODULE.CR.swrst = 0x1;
    CRATE_TWIM_MODULE.CR.stop = 0x1;
    CRATE_TWIM_MODULE.CR.men = 0x1;
    twi_master_init ( &CRATE_TWIM_MODULE, &TWI_MASTER_OPTS, TRUE );
  }

  if ( twim_write ( &CRATE_TWIM_MODULE, pBuffer, pLen, pSAddr, FALSE ) )
  {
    dprintf ( "WARNING: I2C Send Error.\n" );
    return I2C_ERROR;
  }
  else
  {
    return I2C_SUCCESS;
  }
}

// Debug function to scan the whole I2C bus for devices
void i2c_scan()
{
  int i = 0;

  for ( i = 0; i < 128; i++ )
  {
    dprintf ( "Addr 0x%02X: %d\n", i, twi_probe ( &CRATE_TWIM_MODULE, i ) );
  }
}

void i2c_register ( fi2c_cb pDataCB )
{
  gDataCallback = pDataCB;
}
