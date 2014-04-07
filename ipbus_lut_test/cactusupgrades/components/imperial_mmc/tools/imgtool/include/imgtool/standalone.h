#ifndef __STANDALONE_H__
#define __STANDALONE_H__

#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <stdlib.h>

// Various types that are used heavily on the AVR32 chip
typedef uint32_t U32;
typedef uint16_t U16;
typedef uint8_t U8;
typedef char Bool;

#define true  1
#define false 0

#define dprintf(args...) fprintf(stderr, args)

#endif //__STANDALONE_H__
