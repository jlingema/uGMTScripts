/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 * This file handles the I2C interface to the sensors that are only
 * present on the MP7 board.
 *
 */

#if defined(MP7_REV)
#include "imperial_mmc/avr32_mp7_sensors.h"

struct MP7_LTC2990
{
  U8 bus; // I2C bus (after the multiplexer)
  U8 addr;
  U8 config_a;
  U8 config_b;
  float exp1; // Expected value for config_a channel 1
  float exp2; // Expected value for config_a channel 2
};

// I2C Bus set-up
static twi_options_t MP7_I2C_OPTS =
{
  .pba_hz = FOSCM,
  .speed = I2C_SPEED_400K,
  .chip = 0,
  .smbus = FALSE
};

// Used for the LTC2990 sensors
static struct MP7_LTC2990 gMp7Sensors[] =
{
  { 1, 0x4D, 0x1F, 0x1E, 1.5,  1.8 },
  { 1, 0x4C, 0x1F, 0x1E, 1.2,  1.0 },
  { 1, 0x4E, 0x1F, 0x1E, 2.5,  3.3 },
  { 2, 0x4D, 0x1F, 0x1E, 12.0, 3.3 }, // 12V damaged
  { 2, 0x4C, 0x1F, 0x1E, 1.2,  1.0 },
  { 2, 0x4E, 0x18, 0x19, 1.0,  0.0 }, // flat ~80C
  //{ 2, 0x4E, 0x1F, 0x1E, 1.0,  0.0 }, // flat ~80C
  { 4, 0x4C, 0x1F, 0x1E, 1.8,  0.0 },
  { 5, 0x4C, 0x1F, 0x1E, 1.8,  0.0 },
};
#define MP7_NUM_SENSORS (sizeof(gMp7Sensors)/sizeof(struct MP7_LTC2990))

// The current bus selected on the I2C multiplexer
static U8 gCurBus = -1;
// Current sensor config (as some have two)
static Bool gCurConfig = FALSE;

void mp7_sensor_init()
{
  dprintf ( "Initialising MP7 Sensors...\n" );
  gCurBus = -1;

  if ( twi_master_init ( &MP7_SENS_TWIM_MODULE, &MP7_I2C_OPTS, FALSE ) )
  {
    dprintf ( "[MP7_SENS] WARNING: Failed to init i2c!\n" );
  }

  // Just clear the multiplexer by pulsing reset pin
  //gpio_clr_gpio_pin(TWI_SENS_MPLEX_RST);
  //cpu_delay_ms(5, FOSCM);
  gpio_set_gpio_pin ( TWI_SENS_MPLEX_RST );
  //cpu_delay_ms(5, FOSCM);
}

void mp7_sensor_bussel ( U8 pBus )
{
  // Select requested bus and humidity bus (0)
  U8 xSel = ( 1 << pBus ) | 0x1;

  // Only switch bus if needed
  if ( pBus == gCurBus )
  {
    return;
  }

  if ( twim_write ( &MP7_SENS_TWIM_MODULE, &xSel, 1, 0x70, FALSE ) )
  {
    dprintf ( "Failed to write MP7 sensor bus!\n" );
  }

  //xSel = 0;
  //twim_read(&MP7_SENS_TWIM_MODULE, &xSel, 1, 0x70, FALSE);
  //dprintf("Multiplexer set-up: 0x%02X\n", xSel);
  gCurBus = pBus;
}

U8 mp7_sensor_config ( Bool pAltConfig )
{
  int i;
  U8 xConfig[2];

  // We need to apply the new config to each sensor
  for ( i = 0; i < MP7_NUM_SENSORS; i++ )
  {
    mp7_sensor_bussel ( gMp7Sensors[i].bus );
    xConfig[0] = 0x01; // Write control register on LTC2990
    xConfig[1] = ( pAltConfig ? gMp7Sensors[i].config_b :
                   gMp7Sensors[i].config_a );

    if ( twim_write ( &MP7_SENS_TWIM_MODULE,
                      xConfig, 2,
                      gMp7Sensors[i].addr, FALSE ) )
    {
      dprintf ( "Failed to apply config to MP7 sensor %d!\n", i );
    }

    //dprintf("Conf %d: 0x%02X\n", i, xConfig[1]);
  }

  gCurConfig = pAltConfig;
  return 0;
}

// Trigger a sensor read
U8 mp7_sensor_trigger ( void )
{
  int i;
  U8 xConfig[2];

  for ( i = 0; i < MP7_NUM_SENSORS; i++ )
  {
    mp7_sensor_bussel ( gMp7Sensors[i].bus );
    xConfig[0] = 0x02; // Write trigger register on LTC2990
    xConfig[1] = 0xFF;

    if ( twim_write ( &MP7_SENS_TWIM_MODULE,
                      xConfig, 2,
                      gMp7Sensors[i].addr, FALSE ) )
    {
      dprintf ( "Failed to trigger MP7 sensor %d!\n", i );
    }
  }

  return 0;
}

float ltc2990_conv_temp ( U8 xMSB, U8 xLSB )
{
  if ( ! ( xMSB & 0x80 ) )
  {
    dprintf ( "WARNING: Temp sensor not ready!\n" );
  }
  else
  {
    if ( xMSB & 0x40 )
    {
      dprintf ( "WARNING: Sensor shorted! (diode diff V < 0.14 V)\n" );
    }

    if ( xMSB & 0x20 )
    {
      dprintf ( "WARNING: Sensor open alarm (sensor diff V > 1V \n" );
    }
  }

  U16 temp = ( ( ( U16 ) ( xMSB & 0x1F ) << 8 ) | ( U16 ) ( xLSB ) );
  float xRes = temp;
  // Return as offset from 25C
  return ( ( xRes / 16.0 ) - 25.0 );
}

float ltc2990_conv_volt ( U8 xMSB, U8 xLSB )
{
  float xRes = xLSB;
  xRes += ( xMSB & 0x3F ) << 8;

  if ( xMSB & 0x40 )
  {
    xRes *= -1;
    xRes += 1;
  }

  //if (!(xMSB & 0x80))
  //	dprintf("WARN: Vsense not ready!\n");
  return xRes * 0.00030518;
}

float ltc2990_conv_curr ( U8 xMSB, U8 xLSB )
{
  float xRes = xLSB;
  xRes += ( xMSB & 0x1F ) << 8;

  if ( xMSB & 0x40 )
  {
    xRes *= -1;
    xRes += 1;
  }

  //if (!(xMSB & 0x80))
  //	dprintf("WARN: Isense not ready!\n");
  // Assume Rsense = 0.001 ohm
  return ( xRes * 0.01942 ) / 0.1; //return 100mA units
}

inline float mp7_ltc2990_scale ( float pRaw, float pExp )
{
  return pRaw / 0.1;
}

U8 mp7_ltc2990_read ( U8 pSensor, S8* pTemp,
                      S8* pRes1, S8* pRes2 )
{
  //dprintf("Call to: mp7_ltc2990_read() \n");
  //dprintf("Sensor address:0x%02X \n", gMp7Sensors[pSensor].addr);
  float xV1 = gMp7Sensors[pSensor].exp1;
  float xV2 = gMp7Sensors[pSensor].exp2;
  U8 xAddr = 0x04; // Start of value registers
  U8 xRegs[12] = {};
  float xIntTemp;
  float xReading1;
  float xReading2;
  mp7_sensor_bussel ( gMp7Sensors[pSensor].bus );

  if ( twim_write ( &MP7_SENS_TWIM_MODULE, &xAddr, 1, gMp7Sensors[pSensor].addr, FALSE ) )
  {
    dprintf ( "Sensor write error (%d)\n", pSensor );
  }

  if ( twim_read ( &MP7_SENS_TWIM_MODULE, xRegs, 12, gMp7Sensors[pSensor].addr, FALSE ) )
  {
    dprintf ( "Sensor read error (%d)\n", pSensor );
  }

  //dprintf("Got: 0x%02X 0x%02X\n", xRegs[0], xRegs[1]);
  //dprintf("     0x%02X 0x%02X\n", xRegs[2], xRegs[3]);
  //dprintf("     0x%02X 0x%02X\n", xRegs[4], xRegs[5]);
  //dprintf("     0x%02X 0x%02X\n", xRegs[6], xRegs[7]);
  //dprintf("     0x%02X 0x%02X\n", xRegs[8], xRegs[9]);
  //dprintf("     0x%02X 0x%02X\n", xRegs[10], xRegs[11]);
  // Now convert the readings into real values
  xIntTemp = ltc2990_conv_temp ( xRegs[0], xRegs[1] );

  switch ( 0x7 & ( gCurConfig ? gMp7Sensors[pSensor].config_b :
                   gMp7Sensors[pSensor].config_a ) )
  {
    case 0: // V1, T2
      xReading1 = ltc2990_conv_volt ( xRegs[2], xRegs[3] ) - xV1;
      xReading2 = ltc2990_conv_temp ( xRegs[6], xRegs[7] );
      //dprintf("V1: %0.4f T2: %0.4f\t", xReading1+xV1, xReading2+25);
      xReading1 = mp7_ltc2990_scale ( xReading1, xV1 );
      break;
    case 1: // I1, T2
      xReading1 = ltc2990_conv_curr ( xRegs[2], xRegs[3] );
      xReading2 = ltc2990_conv_temp ( xRegs[6], xRegs[7] );
      //dprintf("I1: %0.4f T2: %0.4f\t", xReading1/10, xReading2+25);
      break;
    case 2: // I1, V2
      xReading1 = ltc2990_conv_curr ( xRegs[2], xRegs[3] );
      xReading2 = ltc2990_conv_volt ( xRegs[6], xRegs[7] ) - xV2;
      xReading2 = mp7_ltc2990_scale ( xReading2, xV2 );
      break;
    case 3: // T1, V2
      xReading1 = ltc2990_conv_temp ( xRegs[2], xRegs[3] );
      xReading2 = ltc2990_conv_volt ( xRegs[6], xRegs[7] )- xV2;
      xReading2 = mp7_ltc2990_scale ( xReading2, xV2 );
      break;
    case 4: // T1, I2
      xReading1 = ltc2990_conv_temp ( xRegs[2], xRegs[3] );
      xReading2 = ltc2990_conv_curr ( xRegs[6], xRegs[7] );
      break;
    case 5: // T1, T2
      xReading1 = ltc2990_conv_temp ( xRegs[2], xRegs[3] );
      xReading2 = ltc2990_conv_temp ( xRegs[6], xRegs[7] );
      break;
    case 6: // I1, I2
      xReading1 = ltc2990_conv_curr ( xRegs[2], xRegs[3] );
      xReading2 = ltc2990_conv_curr ( xRegs[6], xRegs[7] );
      //dprintf("I1: %0.4f, I2: %0.4f\t", xReading1/10, xReading2/10);
      break;
    case 7: // V1, V2
    default:
      xReading1 = ltc2990_conv_volt ( xRegs[2], xRegs[3] )- xV1;
      xReading2 = ltc2990_conv_volt ( xRegs[6], xRegs[7] )- xV2;
      //dprintf("V1: %0.4f V2: %0.4f\t", xReading1+xV1, xReading2+xV2);
      xReading1 = mp7_ltc2990_scale ( xReading1, xV1 );
      xReading2 = mp7_ltc2990_scale ( xReading2, xV2 );
  }

  *pTemp = xIntTemp;
  *pRes1 = xReading1;
  *pRes2 = xReading2;
  return 0;
}

float sht21_conv_humi ( U8 xMSB, U8 xLSB )
{
  float xRes = xLSB & 0xFC;
  xRes += ( xMSB << 8 );
  xRes /= 0x10000;
  xRes *= 125.0;
  return xRes - 6;
}

U8 mp7_sensor_sht21_run ( void )
{
  // Ask the sensor to read the humidity
  U8 xCmd = 0xF5; // Read Humidity with no hold

  if ( twim_write ( &MP7_SENS_TWIM_MODULE, &xCmd, 1, 0x40, FALSE ) )
  {
    dprintf ( "SHT21 sensor write error!\n" );
    return -1;
  }

  return 0;
}

U8 mp7_sensor_sht21_get ( S8* pHumid )
{
  U8 xRes[3];

  if ( twim_read ( &MP7_SENS_TWIM_MODULE, xRes, 3, 0x40, FALSE ) )
  {
    dprintf ( "SHT21 sensor read error!\n" );
  }

  //dprintf("Hum: 0x%02X 0x%02X 0x%02X\n", xRes[0], xRes[1], xRes[2]);
  // TODO: Check humidity checksum here?
  *pHumid = sht21_conv_humi ( xRes[0], xRes[1] );
  return 0;
}

#endif
