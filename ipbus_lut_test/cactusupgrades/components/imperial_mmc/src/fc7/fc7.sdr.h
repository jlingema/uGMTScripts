/* AVR32_MMC
 * Version 1.2
 * See version.h for full release information.
 *
 * License: GPL (See http://www.gnu.org/licenses/gpl.txt).
 *
 */
#if defined(FC7_REV)
// A generic temp/voltage sensor
// Single digit parameters can be found in IPMI SDR Spec
// y = (Mx + B) // y is result, x is the raw reading
// B value = ((UB & 0x3) << 8) | B
// B is scaled by Bexp (We'll call this C) (4bit 2's complement)
// R is scaled by Rexp (We'll call this S) (4bit 2's complement -> E=-2, F=-1)
// C and S are packed...
#define SENSOR_REC(SDR_NUM, SENS_NUM, SENS_TYPE, M, UB, B, SC, SENS_UNIT, TEXT_LEN, ...) \
{                                                                                        \
	SDR_NUM,		/* record number, LSB */                                             \
	0x00,			/* record number, MSB */                                             \
	0x51,			/* IPMI protocol version */                                          \
	0x01,			/* record type: full sensor */                                       \
	43 + TEXT_LEN,  /* record length: remaining bytes */                                 \
	0x00,			/* i2c address, -> sdr_init */                                       \
	0x00,			/* sensor owner LUN */                                               \
	SENS_NUM,		/* sensor number */                                                  \
	0xc1,				/* entity id: AMC Module */                                      \
	0x00,				/* entity instance -> sdr_init */                                \
	0x03,				/* init: event generation + scanning enabled */                  \
	0x48,				/* capabilities: auto re-arm, rw-threshold*/                     \
	SENS_TYPE,   	/* sensor type */                                                    \
	0x01,				/* sensor reading: threshold*/                                   \
	0x80,				/* LSB assert event mask: 3 bit value */                         \
	0x0A,			/* MSB assert event mask */                                          \
	0xA8,			/* LSB deassert event mask: 3 bit value */                           \
	0x7A,			/* MSB deassert event mask */                                        \
	0x38,			/* LSB: readabled Threshold mask: all thresholds are readabled:  */  \
	0x38,			/* MSB: setabled Threshold mask: all thresholds are setabled: */     \
	0x80,			/* sensor units 1 : Signed*/                                         \
	SENS_UNIT,		/* sensor units 2 */                                                 \
	0x00,			/* sensor units 3 : Modifiers */                                     \
	0x00,			/* Linearization */                                                  \
	M,	  			/* M */                                                              \
	0x01,			/* M - Tolerance */                                                  \
	B,				/* B */                                                              \
	0x25 | (UB << 6), /* B - Accuracy */                                                   \
	0x88,			/* Sensor direction */                                               \
	SC,			/* R-Exp = -3, B-Exp = 0, this makes the result milli- */                \
	0x07,			/* Analogue characteristics flags */                                 \
	0x00,			/* Nominal reading */                                                \
	0x10,			/* Normal maximum */                                                 \
	0xEF,			/* Normal minimum */                                                 \
	0x1F,			/* Sensor Maximum reading */                                         \
	0x80,			/* Sensor Minimum reading */                                         \
	0x1F,			/* Upper non-recoverable Threshold */                                \
	0x1F,			/* Upper critical Threshold  */                                      \
	0x1F,			/* Upper non critical Threshold */                                   \
	0x80,			/* Lower non-recoverable Threshold */                                \
	0x80,			/* Lower critical Threshold */                                       \
	0x80,			/* Lower non-critical Threshold */                                   \
	0x00,			/* positive going Threshold hysteresis value */                      \
	0x00,			/* negative going Threshold hysteresis value */                      \
	0x00,			/* reserved */                                                       \
	0x00,			/* reserved */                                                       \
	0x00, 			/* OEM reserved */                                                   \
	0xC0 + TEXT_LEN,			/* 8 bit ASCII, number of bytes */                       \
	__VA_ARGS__	/* sensor string */                                                      \
}


// We have the following SDR records -> sensors
//  0 = Locator
//  1 = HS           -> 1
//  2 = Humidity     -> 2
//  3 = FGPA Temp    ->
//  4 = 1.0V V       ->
//  5 = 1.0V I       ->
//  6 = 1.5V V       ->
//  7 = 1.5V I       ->
//  8 = 1.8V V       ->
//  9 = 1.8V I       ->
// 10 = 2.5V V       ->
// 11 = 2.5V I       ->
// 12 = 3.3V V       ->
// 13 = 3.3V I       ->
// 14 = MP 3.3V V    ->
// 15 = MP 3.3V I    ->
// 16 = 12V V        ->
// 17 = 12V I        ->
// 18 = 1.0V GTX T V ->
// 19 = 1.0V GTX T I ->
// 20 = 1.2V GTX T V ->
// 21 = 1.2V GTX T I ->
// 22 = 1.8V GTX T V ->
// 23 = 1.8V GTX T I ->
// 24 = 1.0V GTX B V ->
// 25 = 1.0V GTX B I ->
// 26 = 1.2V GTX B V ->
// 27 = 1.2V GTX B I ->
// 28 = 1.8V GTX B V ->
// 29 = 1.8V GTX B I ->



// 28 = FPGA Temp

// A default base record (Device locator) and a HOTSWAP sensor record.
// The device locator record should _ALWAYS_ be number 0.
U8 SDR0[] =
{
  0x00,			/* record number, LSB */
  0x00,			/* record number,MSB */
  0x51,			/* IPMI protocol version */
  0x12,			/* record type: device locator */
  0x17,				/* record length: remaining bytes */
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
  0xcc,			/* device ID string type/length */
  'I','m','p','e','r','i','a','l',' ','M','P','7',
};

U8 SDR1[] =
{
  /* sensor record header */
  /*1*/
  0x01,			/* record number, LSB */
  0x00,			/* record number, MSB */
  0x51,			/* IPMI protocol version */
  0x02,			/* record type: compact sensor */
  0x21,			/* record length: remaining bytes */

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
  0xC6,			/* 8 bit ASCII, number of bytes */
  'M','P','7',' ','H','S' /* sensor string */
};

U8 SDR2[] =
{
  /* sensor record header */
  /*1*/
  0x02,			/* record number, LSB */
  0x00,			/* record number, MSB */
  0x51,			/* IPMI protocol version */
  0x01,			/* record type: full sensor */
  0x33,			/* record length: remaining bytes */

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
  SENSOR_TYPE_OTHER,   /* sensor type: none */
  0x01,				/* sensor reading: threshold*/
  0x80,				/* LSB assert event mask: 3 bit value */
  /*16*/
  0x0A,			/* MSB assert event mask */
  0xA8,			/* LSB deassert event mask: 3 bit value */
  0x7A,			/* MSB deassert event mask */
  0x38,			/* LSB: readabled Threshold mask: all thresholds are readabled:  */
  0x38,			/* MSB: setabled Threshold mask: all thresholds are setabled: */
  0x80,			/* sensor units 1 : Unsigned*/
  SENSOR_UNIT_NONE, /* sensor units 2 : None */
  0x00,			/* sensor units 3 : Modifiers */
  /*24*/
  0x00,			/* Linearization */
  0x01,			/* M */
  0x01,			/* M - Tolerance */
  0x00,			/* B */
  0x25,			/* B - Accuracy */
  0x88,			/* Sensor direction */
  0x00,			/* R-Exp = 0, B-Exp = 0 */
  0x07,			/* Analogue characteristics flags */
  /*32*/
  0x32,			/* Nominal reading (50) */
  0x4B,			/* Normal maximum (75) */
  0x0A,			/* Normal minimum (10) */
  0x64,			/* Sensor Maximum reading (100) */
  0x00,			/* Sensor Minimum reading (0) */
  0x64,			/* Upper non-recoverable Threshold (100) */
  0x64,			/* Upper critical Threshold (100) */
  0x64,			/* Upper non critical Threshold (100) */
  /*40*/
  0x00,			/* Lower non-recoverable Threshold (0) */
  0x00,			/* Lower critical Threshold (0) */
  0x00,			/* Lower non-critical Threshold (0) */
  0x02,			/* positive going Threshold hysteresis value */
  0x02,			/* negative going Threshold hysteresis value */
  0x00,			/* reserved */
  0x00,			/* reserved */
  0x00, 			/* OEM reserved */
  /*48*/
  0xC8,			/* 8 bit ASCII, number of bytes */
  'H','u','m','i','d','i','t','y'	/* sensor string */
};

U8 SDR3[] =
{
  /* sensor record header */
  /*1*/
  0x03,			/* record number, LSB */
  0x00,			/* record number, MSB */
  0x51,			/* IPMI protocol version */
  0x01,			/* record type: full sensor */
  0x34,			/* record length: remaining bytes */

  /* record key bytes */
  0x00,			/* i2c address, -> sdr_init */
  0x00,			/* sensor owner LUN */
  /*8*/
  24,			/* sensor number */

  /* record body bytes */
  0xc1,				/* entity id: AMC Module */
  0x00,				/* entity instance -> sdr_init */
  0x03,				/* init: event generation + scanning enabled */
  0x48,				/* capabilities: auto re-arm, rw-threshold*/
  SENSOR_TYPE_TEMP,   /* sensor type: none */
  0x01,				/* sensor reading: threshold*/
  0x80,				/* LSB assert event mask: 3 bit value */
  /*16*/
  0x0A,			/* MSB assert event mask */
  0xA8,			/* LSB deassert event mask: 3 bit value */
  0x7A,			/* MSB deassert event mask */
  0x38,			/* LSB: readabled Threshold mask: all thresholds are readabled:  */
  0x38,			/* MSB: setabled Threshold mask: all thresholds are setabled: */
  0x80,			/* sensor units 1 : Signed*/
  SENSOR_UNIT_DEGREES_C, /* sensor units 2 : Degrees */
  0x00,			/* sensor units 3 : Modifiers */
  /*24*/
  0x00,			/* Linearization */
  0x01,			/* M */
  0x01,			/* M - Tolerance */
  0x19,			/* B */
  0x25,			/* B - Accuracy */
  0x88,			/* Sensor direction */
  0x00,			/* R-Exp = 0, B-Exp = 0 */
  0x07,			/* Analogue characteristics flags */
  /*32*/
  0x32,			/* Nominal reading (50) */
  0x4B,			/* Normal maximum (75) */
  0x0A,			/* Normal minimum (10) */
  0x64,			/* Sensor Maximum reading (100) */
  0x00,			/* Sensor Minimum reading (0) */
  0x64,			/* Upper non-recoverable Threshold (100) */
  0x64,			/* Upper critical Threshold (100) */
  0x64,			/* Upper non critical Threshold (100) */
  /*40*/
  0x00,			/* Lower non-recoverable Threshold (0) */
  0x00,			/* Lower critical Threshold (0) */
  0x00,			/* Lower non-critical Threshold (0) */
  0x02,			/* positive going Threshold hysteresis value */
  0x02,			/* negative going Threshold hysteresis value */
  0x00,			/* reserved */
  0x00,			/* reserved */
  0x00, 			/* OEM reserved */
  /*48*/
  0xC9,			/* 8 bit ASCII, number of bytes */
  'F','P','G','A',' ','T','e','m','p'	/* sensor string */
};

U8  SDR4[] = SENSOR_REC ( 4, 16, SENSOR_TYPE_VOLTAGE, 1, 0, 10, 0xF0,
                          SENSOR_UNIT_VOLTS,  6, '+','1','.','0',' ','V' );
U8  SDR5[] = SENSOR_REC ( 5, 32, SENSOR_TYPE_CURRENT, 1, 0, 0, 0xF0,
                          SENSOR_UNIT_AMPS,  6, '+','1','.','0',' ','I' );
U8  SDR6[] = SENSOR_REC ( 6, 11, SENSOR_TYPE_VOLTAGE, 1, 0, 15, 0xF0,
                          SENSOR_UNIT_VOLTS,  6, '+','1','.','5',' ','V' );
U8  SDR7[] = SENSOR_REC ( 7, 27, SENSOR_TYPE_CURRENT, 1, 0, 0, 0xF0,
                          SENSOR_UNIT_AMPS,  6, '+','1','.','5',' ','I' );
U8  SDR8[] = SENSOR_REC ( 8, 19, SENSOR_TYPE_VOLTAGE, 1, 0, 18, 0xF0,
                          SENSOR_UNIT_VOLTS,  6, '+','1','.','8',' ','V' );
U8  SDR9[] = SENSOR_REC ( 9, 35, SENSOR_TYPE_CURRENT, 1, 0, 0, 0xF0,
                          SENSOR_UNIT_AMPS,  6, '+','1','.','8',' ','I' );
U8 SDR10[] = SENSOR_REC ( 10, 13, SENSOR_TYPE_VOLTAGE, 1, 0, 25, 0xF0,
                          SENSOR_UNIT_VOLTS,  6, '+','2','.','5',' ','V' );
U8 SDR11[] = SENSOR_REC ( 11, 29, SENSOR_TYPE_CURRENT, 1, 0, 0, 0xF0,
                          SENSOR_UNIT_AMPS,  6, '+','2','.','5',' ','I' );
U8 SDR12[] = SENSOR_REC ( 12, 21, SENSOR_TYPE_VOLTAGE, 1, 0, 33, 0xF0,
                          SENSOR_UNIT_VOLTS,  6, '+','3','.','3',' ','V' );
U8 SDR13[] = SENSOR_REC ( 13, 37, SENSOR_TYPE_CURRENT, 1, 0, 0, 0xF0,
                          SENSOR_UNIT_AMPS,  6, '+','3','.','3',' ','I' );
U8 SDR14[] = SENSOR_REC ( 14, 22, SENSOR_TYPE_VOLTAGE, 1, 0, 33, 0xF0,
                          SENSOR_UNIT_VOLTS,  8, 'M','P','+','3','.','3',' ','V' );
U8 SDR15[] = SENSOR_REC ( 15, 38, SENSOR_TYPE_CURRENT, 1, 0, 0, 0xF0,
                          SENSOR_UNIT_AMPS,  8, 'M','P','+','3','.','3',' ','I' );
U8 SDR16[] = SENSOR_REC ( 16, 14, SENSOR_TYPE_VOLTAGE, 1, 0, 120, 0xF0,
                          SENSOR_UNIT_VOLTS,  5, '+','1','2',' ','V' );
U8 SDR17[] = SENSOR_REC ( 17, 30, SENSOR_TYPE_CURRENT, 1, 0, 0, 0xF0,
                          SENSOR_UNIT_AMPS,  5, '+','1','2',' ','I' );
U8 SDR18[] = SENSOR_REC ( 18, 20, SENSOR_TYPE_VOLTAGE, 1, 0, 10, 0xF0,
                          SENSOR_UNIT_VOLTS, 12, '+','1','.','0',' ','V',' ','G','T','X',' ','T' );
U8 SDR19[] = SENSOR_REC ( 19, 36, SENSOR_TYPE_CURRENT, 1, 0, 0, 0xF0,
                          SENSOR_UNIT_AMPS, 12, '+','1','.','0',' ','I',' ','G','T','X',' ','T' );
U8 SDR20[] = SENSOR_REC ( 20, 12, SENSOR_TYPE_VOLTAGE, 1, 0, 12, 0xF0,
                          SENSOR_UNIT_VOLTS, 12, '+','1','.','2',' ','V',' ','G','T','X',' ','T' );
U8 SDR21[] = SENSOR_REC ( 21, 28, SENSOR_TYPE_CURRENT, 1, 0, 0, 0xF0,
                          SENSOR_UNIT_AMPS, 12, '+','1','.','2',' ','I',' ','G','T','X',' ','T' );
U8 SDR22[] = SENSOR_REC ( 22, 18, SENSOR_TYPE_VOLTAGE, 1, 0, 18, 0xF0,
                          SENSOR_UNIT_VOLTS, 12, '+','1','.','8',' ','V',' ','G','T','X',' ','T' );
U8 SDR23[] = SENSOR_REC ( 23, 34, SENSOR_TYPE_CURRENT, 1, 0, 0, 0xF0,
                          SENSOR_UNIT_AMPS, 12, '+','1','.','8',' ','I',' ','G','T','X',' ','T' );
U8 SDR24[] = SENSOR_REC ( 18, 23, SENSOR_TYPE_VOLTAGE, 1, 0, 10, 0xF0,
                          SENSOR_UNIT_VOLTS, 12, '+','1','.','0',' ','V',' ','G','T','X',' ','B' );
U8 SDR25[] = SENSOR_REC ( 19, 39, SENSOR_TYPE_CURRENT, 1, 0, 0, 0xF0,
                          SENSOR_UNIT_AMPS, 12, '+','1','.','0',' ','I',' ','G','T','X',' ','B' );
U8 SDR26[] = SENSOR_REC ( 20, 15, SENSOR_TYPE_VOLTAGE, 1, 0, 12, 0xF0,
                          SENSOR_UNIT_VOLTS, 12, '+','1','.','2',' ','V',' ','G','T','X',' ','B' );
U8 SDR27[] = SENSOR_REC ( 21, 31, SENSOR_TYPE_CURRENT, 1, 0, 0, 0xF0,
                          SENSOR_UNIT_AMPS, 12, '+','1','.','2',' ','I',' ','G','T','X',' ','B' );
U8 SDR28[] = SENSOR_REC ( 22, 17, SENSOR_TYPE_VOLTAGE, 1, 0, 18, 0xF0,
                          SENSOR_UNIT_VOLTS, 12, '+','1','.','8',' ','V',' ','G','T','X',' ','B' );
U8 SDR29[] = SENSOR_REC ( 23, 33, SENSOR_TYPE_CURRENT, 1, 0, 0, 0xF0,
                          SENSOR_UNIT_AMPS, 12, '+','1','.','8',' ','I',' ','G','T','X',' ','B' );

U8* SDRs[] = {  SDR0,  SDR1,  SDR2,  SDR3,
                SDR4,  SDR5,  SDR6,  SDR7,
                SDR8,  SDR9, SDR10, SDR11,
                SDR12, SDR13, SDR14, SDR15,
                SDR16, SDR17, SDR18, SDR19,
                SDR20, SDR21, SDR22, SDR23,
                SDR24, SDR25, SDR26, SDR27,
                SDR28, SDR29,
             };
U8 SDRSizes[] = {  sizeof ( SDR0 ),  sizeof ( SDR1 ),  sizeof ( SDR2 ),  sizeof ( SDR3 ),
                   sizeof ( SDR4 ),  sizeof ( SDR5 ),  sizeof ( SDR6 ),  sizeof ( SDR7 ),
                   sizeof ( SDR8 ),  sizeof ( SDR9 ), sizeof ( SDR10 ), sizeof ( SDR11 ),
                   sizeof ( SDR12 ), sizeof ( SDR13 ), sizeof ( SDR14 ), sizeof ( SDR15 ),
                   sizeof ( SDR16 ), sizeof ( SDR17 ), sizeof ( SDR18 ), sizeof ( SDR19 ),
                   sizeof ( SDR20 ), sizeof ( SDR21 ), sizeof ( SDR22 ), sizeof ( SDR23 ),
                   sizeof ( SDR24 ), sizeof ( SDR25 ), sizeof ( SDR26 ), sizeof ( SDR27 ),
                   sizeof ( SDR28 ), sizeof ( SDR29 ),
                };

#define SDR_RECORDS (sizeof(SDRs) / sizeof(U8 *))
#define SENSOR_RECORDS (SDR_RECORDS - 1)

#define NUM_SENSOR_STORE 50
#endif
