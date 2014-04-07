/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 */

// We have two sensor records
// A default base record (Device locator) and a HOTSWAP sensor record.
// The device locator record should _ALWAYS_ be number 0.
U8 SDR0[] =
{
  0x00,			/* record number, LSB */
  0x00,			/* record number,MSB */
  0x51,			/* IPMI protocol version */
  0x12,			/* record type: device locator */
  0x15,				/* record length: remaining bytes */
  /* record key bytes */
  0x00,			/* device slave address */
  0x00,			/* channel number */
  /* record body bytes */
  0x00, 			/* power state notification, global initialization */
  0x29,			/* device capabilities */
  0x00,			/* reserved */
  0x00,			/* reserved */
  0x00,			/* reserved */
  0xc1,			/* entityID */
  0x00,			/* entity instance */
  0x00,			/* OEM */
  0xca,			/* device ID string type/length */
  'I','C',' ','M','I','N','I','-','T','5'
};

U8 SDR1[] =
{
  /* sensor record header */
  /*1*/
  0x01,			/* record number, LSB */
  0x00,			/* record number, MSB */
  0x51,			/* IPMI protocol version */
  0x02,			/* record type: compact sensor */
  0x28,			/* record length: remaining bytes */

  /* record key bytes */
  0x00,			/* i2c address, -> sdr_init */
  0x00,			/* sensor owner LUN */
  /*8*/
  0x01,			/* sensor number */

  /* record body bytes */
  0xc1,				/* entity id: AMC Module */
  0x00,				/* entity instance -> sdr_init */
  0x03,				/* init: event generation + scanning enabled */
  0xC1,				/* capabilities: auto re-arm, rw-threshold*/
  SENSOR_TYPE_HOTSWAP, /* sensor type: DC-DC Conversion*/
  0x6F,				/* sensor specific event/read */
  0x07,				/* LSB assert event mask: 3 bit value */
  /*16*/
  0x00,			/* MSB assert event mask */
  0x07,			/* LSB deassert event mask: 3 bit value */
  0x00,			/* MSB deassert event mask */
  0x00,			/* LSB: readabled Threshold mask: all thresholds are readabled:  */
  0x00,			/* MSB: setabled Threshold mask: all thresholds are setabled: */
  0xC0,			/* sensor units 1 : Hotswap (Special)*/
  0x00,			/* sensor units 2 : Unit type codes table? */
  0x00,			/* sensor units 3 : Modifiers */
  /*24*/
  0x00,			/* Sharing? */
  0x00,			/* Sharing? */
  0x00,			/* positive going Threshold hysteresis value */
  0x00,			/* negative going Threshold hysteresis value */
  0x00,			/* reserved */
  0x00,			/* reserved */
  0x00,			/* reserved */
  0x00, 			/* OEM reserved */
  /*32*/
  0xCD,			/* 8 bit ASCII, number of bytes */
  'I','C',' ','M','I','N','I','-','T','5',' ','H','S' /* sensor string */
};

#if (MINI_T5_REV > 1)
U8 SDR2[] =
{
  /* sensor record header */
  /*1*/
  0x02,			/* record number, LSB */
  0x00,			/* record number, MSB */
  0x51,			/* IPMI protocol version */
  0x01,			/* record type: full sensor */
  0x34,			/* record length: remaining bytes */

  /* record key bytes */
  0x00,			/* i2c address, -> sdr_init */
  0x00,			/* sensor owner LUN */
  /*8*/
  0x02,			/* sensor number */

  /* record body bytes */
  0xc1,				/* entity id: AMC Module */
  0x00,				/* entity instance -> sdr_init */
  0x03,				/* init: event generation + scanning enabled */
  0x48,				/* capabilities: auto re-arm, rw-threshold*/
  SENSOR_TYPE_TEMP,   /* sensor type: HOT SWAP*/
  0x01,				/* sensor reading: threshold*/
  0x80,				/* LSB assert event mask: 3 bit value */
  /*16*/
  0x0A,			/* MSB assert event mask */
  0xA8,			/* LSB deassert event mask: 3 bit value */
  0x7A,			/* MSB deassert event mask */
  0x3F,			/* LSB: readabled Threshold mask: all thresholds are readabled:  */
  0x00,			/* MSB: setabled Threshold mask: all thresholds are setabled: */
  0x80,			/* sensor units 1 : Twos complement*/
  0x01,			/* sensor units 2 : Temperature */
  0x00,			/* sensor units 3 : Modifiers */
  /*24*/
  0x00,			/* Linearization */
  0x01,			/* M */
  0x01,			/* M - Tolerance */
  0x00,			/* B */
  0x25,			/* B - Accuracy */
  0x88,			/* Sensor direction */
  0x00,			/* R-Exp , B-Exp */
  0x07,			/* Analogue characteristics flags */
  /*32*/
  0x19,			/* Nominal reading (25) */
  0x32,			/* Normal maximum (50) */
  0x14,			/* Normal minimum (20) */
  0x7F,			/* Sensor Maximum reading (127) */
  0x80,			/* Sensor Minimum reading (-128) */
  0x55,			/* Upper non-recoverable Threshold (85) */
  0x4B,			/* Upper critical Threshold (75) */
  0x41,			/* Upper non critical Threshold (65) */
  /*40*/
  0xEC,			/* Lower non-recoverable Threshold (-20) */
  0xF6,			/* Lower critical Threshold (-10) */
  0x00,			/* Lower non-critical Threshold (0) */
  0x01,			/* positive going Threshold hysteresis value */
  0x01,			/* negative going Threshold hysteresis value */
  0x00,			/* reserved */
  0x00,			/* reserved */
  0x00, 			/* OEM reserved */
  /*48*/
  0xC9,			/* 8 bit ASCII, number of bytes */
  'F','P','G','A',' ','T','e','m','p'	/* sensor string */
};

U8 SDR3[] =
{
  /* sensor record header */
  /*1*/
  0x03,			/* record number, LSB */
  0x00,			/* record number, MSB */
  0x51,			/* IPMI protocol version */
  0x01,			/* record type: full sensor */
  0x35,			/* record length: remaining bytes */

  /* record key bytes */
  0x00,			/* i2c address, -> sdr_init */
  0x00,			/* sensor owner LUN */
  /*8*/
  0x03,			/* sensor number */

  /* record body bytes */
  0xc1,				/* entity id: AMC Module */
  0x00,				/* entity instance -> sdr_init */
  0x03,				/* init: event generation + scanning enabled */
  0x48,				/* capabilities: auto re-arm, rw-threshold*/
  SENSOR_TYPE_VOLTAGE,   /* sensor type: voltage*/
  0x01,				/* sensor reading: threshold*/
  0x80,				/* LSB assert event mask: 3 bit value */
  /*16*/
  0x0A,			/* MSB assert event mask */
  0xA8,			/* LSB deassert event mask: 3 bit value */
  0x7A,			/* MSB deassert event mask */
  0x38,			/* LSB: readabled Threshold mask: all thresholds are readabled:  */
  0x38,			/* MSB: setabled Threshold mask: all thresholds are setabled: */
  0x80,			/* sensor units 1 : Unsigned*/
  0x04,			/* sensor units 2 : Volts */
  0x00,			/* sensor units 3 : Modifiers */
  /*24*/
  0x00,			/* Linearization */
  0x01,			/* M */
  0x01,			/* M - Tolerance */
  0x0C,			/* B */
  0x25,			/* B - Accuracy */
  0x88,			/* Sensor direction */
  0xE2,			/* R-Exp = -2, B-Exp = 2 */
  0x07,			/* Analogue characteristics flags */
  /*32*/
  0x0C,			/* Nominal reading (12) */
  0x0D,			/* Normal maximum (13) */
  0x0B,			/* Normal minimum (11) */
  0x7F,			/* Sensor Maximum reading (127) */
  0x80,			/* Sensor Minimum reading (-128) */
  0x0D,			/* Upper non-recoverable Threshold (13) */
  0x0D,			/* Upper critical Threshold (13) */
  0x0D,			/* Upper non critical Threshold (13) */
  /*40*/
  0xEC,			/* Lower non-recoverable Threshold (-20) */
  0xF6,			/* Lower critical Threshold (-10) */
  0x00,			/* Lower non-critical Threshold (0) */
  0x02,			/* positive going Threshold hysteresis value */
  0x02,			/* negative going Threshold hysteresis value */
  0x00,			/* reserved */
  0x00,			/* reserved */
  0x00, 			/* OEM reserved */
  /*48*/
  0xCA,			/* 8 bit ASCII, number of bytes */
  '1','2','v',' ','S','u','p','p','l','y'	/* sensor string */
};

U8 SDR4[] =
{
  /* sensor record header */
  /*1*/
  0x04,			/* record number, LSB */
  0x00,			/* record number, MSB */
  0x51,			/* IPMI protocol version */
  0x02,			/* record type: compact sensor */
  0x27,			/* record length: remaining bytes */

  /* record key bytes */
  0x00,			/* i2c address, -> sdr_init */
  0x00,			/* sensor owner LUN */
  /*8*/
  0x04,			/* sensor number */

  /* record body bytes */
  0xc1,				/* entity id: AMC Module */
  0x00,				/* entity instance -> sdr_init */
  0x03,				/* init: event generation + scanning enabled */
  0x4C,				/* capabilities: auto re-arm, rw-threshold*/
  SENSOR_TYPE_PWR_DCDC, /* sensor type: DC-DC Conversion*/
  0x6F,				/* sensor specific event/read */
  0x01,				/* LSB assert event mask: 3 bit value */
  /*16*/
  0x00,			/* MSB assert event mask */
  0x01,			/* LSB deassert event mask: 3 bit value */
  0x00,			/* MSB deassert event mask */
  0x01,			/* LSB: readabled Threshold mask: all thresholds are readabled:  */
  0x00,			/* MSB: setabled Threshold mask: all thresholds are setabled: */
  0x00,			/* sensor units 1 : None*/
  0x00,			/* sensor units 2 : Unit type codes table? */
  0x00,			/* sensor units 3 : Modifiers */
  /*24*/
  0x00,			/* Sharing? */
  0x00,			/* Sharing? */
  0x00,			/* positive going Threshold hysteresis value */
  0x00,			/* negative going Threshold hysteresis value */
  0x00,			/* reserved */
  0x00,			/* reserved */
  0x00,			/* reserved */
  0x00, 			/* OEM reserved */
  /*32*/
  0xCC,			/* 8 bit ASCII, number of bytes */
  'P','o','w','e','r',' ','S','u','p','p','l','y'	/* sensor string */
};

U8 SDR5[] =
{
  /* sensor record header */
  /*1*/
  0x05,			/* record number, LSB */
  0x00,			/* record number, MSB */
  0x51,			/* IPMI protocol version */
  0x01,			/* record type: full sensor */
  0x36,			/* record length: remaining bytes */

  /* record key bytes */
  0x00,			/* i2c address, -> sdr_init */
  0x00,			/* sensor owner LUN */
  /*8*/
  0x05,			/* sensor number */

  /* record body bytes */
  0xc1,				/* entity id: AMC Module */
  0x00,				/* entity instance -> sdr_init */
  0x03,				/* init: event generation + scanning enabled */
  0x48,				/* capabilities: auto re-arm, rw-threshold*/
  SENSOR_TYPE_VOLTAGE,   /* sensor type: voltage*/
  0x01,				/* sensor reading: threshold*/
  0x80,				/* LSB assert event mask: 3 bit value */
  /*16*/
  0x0A,			/* MSB assert event mask */
  0xA8,			/* LSB deassert event mask: 3 bit value */
  0x7A,			/* MSB deassert event mask */
  0x38,			/* LSB: readabled Threshold mask: all thresholds are readabled:  */
  0x38,			/* MSB: setabled Threshold mask: all thresholds are setabled: */
  0x80,			/* sensor units 1 : Unsigned*/
  0x04,			/* sensor units 2 : Volts */
  0x00,			/* sensor units 3 : Modifiers */
  /*24*/
  0x00,			/* Linearization */
  0x01,			/* M */
  0x01,			/* M - Tolerance */
  0x00,			/* B */
  0x25,			/* B - Accuracy */
  0x88,			/* Sensor direction */
  0x00,			/* R-Exp = -2, B-Exp = 2 */
  0x07,			/* Analogue characteristics flags */
  /*32*/
  0x00,			/* Nominal reading (12) */
  0x00,			/* Normal maximum (13) */
  0x00,			/* Normal minimum (11) */
  0x00,			/* Sensor Maximum reading (127) */
  0x00,			/* Sensor Minimum reading (-128) */
  0x00,			/* Upper non-recoverable Threshold (13) */
  0x00,			/* Upper critical Threshold (13) */
  0x00,			/* Upper non critical Threshold (13) */
  /*40*/
  0x00,			/* Lower non-recoverable Threshold (-20) */
  0x00,			/* Lower critical Threshold (-10) */
  0x00,			/* Lower non-critical Threshold (0) */
  0x00,			/* positive going Threshold hysteresis value */
  0x00,			/* negative going Threshold hysteresis value */
  0x00,			/* reserved */
  0x00,			/* reserved */
  0x00, 			/* OEM reserved */
  /*48*/
  0xCB,			/* 8 bit ASCII, number of bytes */
  'T','e','s','t',' ','S','e','n','s','o','r'	/* sensor string */
};
#endif

U8* SDRs[] = { SDR0,
               SDR1,
               // Only Rev 2+ boards have the temp sensor in SDR2
#if (MINI_T5_REV > 1)
               SDR2,
               SDR3,
               SDR4,
               SDR5,
#endif
             };
U8 SDRSizes[] = { sizeof ( SDR0 ),
                  sizeof ( SDR1 ),
#if (MINI_T5_REV > 1)
                  sizeof ( SDR2 ),
                  sizeof ( SDR3 ),
                  sizeof ( SDR4 ),
                  sizeof ( SDR5 ),
#endif
                };

#if (MINI_T5_REV > 1)
#define SDR_RECORDS 6
#define SENSOR_RECORDS 5
#else
#define SDR_RECORDS 2
#define SENSOR_RECORDS 1
#endif

#define NUM_SENSOR_STORE 50
