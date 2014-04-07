/*
 * File:   SI5326Node.cc
 * Author: Alessandro Thea
 *
 * Created on August 19, 2013, 6:20 PM
 */

#include "mp7/SI5326Node.hpp"

// Boost Headers
#include "boost/format.hpp"
#include "boost/lexical_cast.hpp"

// uHAL Headers
#include "uhal/DerivedNode.hpp"
#include "uhal/log/log.hpp"

// MP7 Headers
#include "mp7/exception.hpp"
#include "mp7/helpers.hpp"

// Namespace resolution
using namespace std;
using namespace uhal;

namespace mp7 {

    UHAL_REGISTER_DERIVED_NODE( SI5326Node );

    SI5326Node::SI5326Node( const uhal::Node& aNode ) :
    OpenCoresI2C( aNode ) {
        //   0x68 is the slave address of the SI5326 chip on the MP7
        // can the slave address be one of the attributes? Probably not
    }

    SI5326Node::~SI5326Node( ) {
    }

    void
    SI5326Node::configure( const std::string& aFilename ) const {
        using namespace uhal;
        std::string lLine;
        std::ifstream lFile(aFilename.c_str());

        if( !lFile.is_open() ) {
            log(Error(), aFilename, " was not found!");
            log(Error(), "Throwing at ", ThisLocation());
            throw exception::MP7HelperException();
        }

        while( lFile.good() ) {
            std::getline(lFile, lLine);

            if( lLine[0] == '#' ) {
                continue;
            }

            if( lLine.length() == 0 ) {
                break;
            }

            std::stringstream lStr;
            uint32_t lAddr(0), lData(0);
            char lDummy1, lDummy2;
            lStr << lLine;
            lStr >> std::dec >> lAddr >> lDummy1 >> std::hex >> lData >> lDummy2;
            //    log( Info() ,  "Register Address = ", Integer( lAddr ), " : Register Value = " , Integer(  lData, IntFmt<uhal::hex>() ) );
            log(Info(), "Register Address = ", Integer(lAddr), " : Register Value = ", Integer(lData));
            this->writeI2C(lAddr, lData);
        }

        lFile.close();
        //  while (configFile.good()) {
        //    std::string line;
        //    std::getline(configFile, line);
        //    if (line.length() == 0) break;
        //    if (line[0] == '#') continue;
        //    std::stringstream lineStream;
        //    uint32_t regAddr(0), regData(0);
        //    char dummy;
        //    lineStream << line;
        //    lineStream >> std::dec >> regAddr >> dummy >> std::hex >> regData;
        //    TCALOG("Register Address = " << std::dec << regAddr
        //      << " : Register Value = " << std::setfill('0') << std::setw(2)
        //      << regData);
        //    std::vector<uint8_t> data;
        //    data.push_back(regAddr & 0xff);
        //    data.push_back(regData & 0xff);
        //    i2c.i2cWrite(i2cSlaveAddress, data);
        //  }
    }

    void
    SI5326Node::reset( ) const {
        using namespace uhal;
        log(Warning(), "Resetting - I2C will disappear for a bit, expect I2C error messages");

        try {
            writeI2C(136, 0x80);
        } catch( ... ) {
        }

        millisleep(50);
        writeI2C(136, 0x00);
    }

    void
    SI5326Node::intcalib( ) const {
        using namespace uhal;
        log(Info(), "Internal Self-Calibration Sequence in progress - will self-clear bit on completion");
        writeI2C(136, 0x40);

        while( readI2C(136) ) {
        }

        log(Info(), "Internal Self-Calibration Sequence done");
    }

    void
    SI5326Node::sleep( const bool& s ) const {
        uint8_t lVal = readI2C(6);
        using namespace uhal;

        if( s ) {
            lVal |= 0x40;
            log(Notice(), "Going to sleep");
        } else {
            lVal &= 0xBF;
            log(Notice(), "Woken up");
        }

        writeI2C(6, lVal);
    }

    void
    SI5326Node::debug( ) const {
        using namespace uhal;
        uint8_t lVal, lVal2, lVal3;
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(0);
        //   std::cout << int ( lVal ) << std::endl;
        log(Info(), "Free Run : ", (lVal & 0x40) ? "1" : "0");
        log(Info(), "CKOUT always on : ", (lVal & 0x20) ? "1" : "0");
        log(Info(), "Bypass Register : ", (lVal & 0x02) ? "1" : "0");
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(1);
        //   std::cout << int ( lVal ) << std::endl;
        log(Info(), "1st priority input clock : ", ((lVal & 0x03) == 0x00) ? "CKIN 1" : "CKIN 2");
        log(Info(), "2st priority input clock : ", ((lVal & 0x0C) == 0x00) ? "CKIN 1" : "CKIN 2");
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(2);
        //   std::cout << int ( lVal ) << std::endl;
        log(Info(), "Nominal f3dB bandwidth of PLL : ", Integer(lVal >> 4));
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(3);
        //   std::cout << int ( lVal ) << std::endl;
        log(Info(), "Clocks ", ((lVal & 0x10) == 0x00) ? "enabled" : "disabled", " during internal calibration");
        log(Info(), ((lVal & 0x20) == 0x00) ? "Normal operation" : "Digital hold mode");
        log(Info(), "Clock select : ", ((lVal & 0xC0) == 0x00) ? "CKIN 1" : "CKIN 2");
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(4);
        //   std::cout << int ( lVal ) << std::endl;

        switch( lVal & 0xC0 ) {
            case 0x00:
                log(Info(), "Clock input selection : Manual");
                break;
            case 0x40:
                log(Info(), "Clock input selection : Automatic Non-Revertive");
                break;
            case 0x80:
                log(Info(), "Clock input selection : Automatic Revertive");
                break;
            default:
                log(Error(), "Unknown value in register 4");
                break;
        }

        log(Info(), "Delay for history information used for Digital Hold : ", Integer(lVal & 0xF));
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(9);
        //   std::cout << int ( lVal ) << std::endl;
        log(Info(), "Averaging time for history information used for Digital Hold : ", Integer((lVal >> 3) & 0x1F));
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(5);
        //   std::cout << int ( lVal ) << std::endl;

        switch( lVal & 0xC0 ) {
            case 0x00:
                log(Info(), "CMOS output strength : 2mA");
                break;
            case 0x40:
                log(Info(), "CMOS output strength : 4mA");
                break;
            case 0x80:
                log(Info(), "CMOS output strength : 6mA");
                break;
            case 0xC0:
                log(Info(), "CMOS output strength : 8mA");
                break;
            default:
                log(Error(), "Unknown value in register 5");
                break;
        }

        // -------------------------------------------------------------------------------------------
        lVal = readI2C(6);
        //   std::cout << int ( lVal ) << std::endl;
        log(Info(), ((lVal & 0x40) == 0x00) ? "Normal operation" : "Sleep mode");

        switch( lVal & 0x07 ) {
            case 0x01:
                log(Info(), "CKOUT1 disabled");
                break;
            case 0x02:
                log(Info(), "CKOUT1 CMOS");
                break;
            case 0x03:
                log(Info(), "CKOUT1 Low-swing LVDS");
                break;
            case 0x05:
                log(Info(), "CKOUT1 LVPECL");
                break;
            case 0x06:
                log(Info(), "CKOUT1 CML");
                break;
            case 0x07:
                log(Info(), "CKOUT1 LVDS");
                break;
            default:
                log(Error(), "Unknown value in register 6");
                break;
        }

        switch( lVal & 0x38 ) {
            case 0x08:
                log(Info(), "CKOUT2 disabled");
                break;
            case 0x10:
                log(Info(), "CKOUT2 CMOS");
                break;
            case 0x18:
                log(Info(), "CKOUT2 Low-swing LVDS");
                break;
            case 0x28:
                log(Info(), "CKOUT2 LVPECL");
                break;
            case 0x30:
                log(Info(), "CKOUT2 CML");
                break;
            case 0x38:
                log(Info(), "CKOUT2 LVDS");
                break;
            default:
                log(Error(), "Unknown value in register 6");
                break;
        }

        // -------------------------------------------------------------------------------------------
        lVal = readI2C(7);
        //   std::cout << int ( lVal ) << std::endl;

        switch( lVal & 0x07 ) {
            case 0x00:
                log(Info(), "Reference for Frequency Offset : XA/XB");
                break;
            case 0x01:
                log(Info(), "Reference for Frequency Offset : CKIN1");
                break;
            case 0x02:
                log(Info(), "Reference for Frequency Offset : CKIN2");
                break;
            default:
                log(Error(), "Unknown value in register 7");
                break;
        }

        // -------------------------------------------------------------------------------------------
        lVal = readI2C(8);
        //  std::cout << int ( lVal ) << std::endl;

        switch( lVal & 0x30 ) {
            case 0x00:
                log(Info(), "CKOUT1 : normal operation");
                break;
            case 0x10:
                log(Info(), "CKOUT1 held at logic 0");
                break;
            case 0x20:
                log(Info(), "CKOUT1 held at logic 1");
                break;
            default:
                log(Error(), "Unknown value in register 8");
                break;
        }

        switch( lVal & 0xC0 ) {
            case 0x00:
                log(Info(), "CKOUT2 : normal operation");
                break;
            case 0x40:
                log(Info(), "CKOUT2 held at logic 0");
                break;
            case 0x80:
                log(Info(), "CKOUT2 held at logic 1");
                break;
            default:
                log(Error(), "Unknown value in register 8");
                break;
        }

        // -------------------------------------------------------------------------------------------
        // 9 is done between 4 and 5
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(10);
        //   std::cout << int ( lVal ) << std::endl;
        log(Info(), "CKOUT1 output buffer : ", ((lVal & 0x04) == 0x00) ? "ENABLED" : "DISABLED");
        log(Info(), "CKOUT2 output buffer : ", ((lVal & 0x08) == 0x00) ? "ENABLED" : "DISABLED");
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(11);
        //   std::cout << int ( lVal ) << std::endl;
        log(Info(), "CKIN1 input buffer : ", ((lVal & 0x01) == 0x00) ? "ENABLED" : "DISABLED");
        log(Info(), "CKIN2 input buffer : ", ((lVal & 0x02) == 0x00) ? "ENABLED" : "DISABLED");
        // -------------------------------------------------------------------------------------------
        // -------------------------------------------------------------------------------------------
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(16);
        int16_t lSigned(*reinterpret_cast < int16_t* > (&lVal));
        //   std::cout << int ( lVal ) << std::endl;
        log(Info(), "Phase delay : ", Integer(lSigned), "/F_osc");
        // -------------------------------------------------------------------------------------------
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(17);
        lVal2 = readI2C(18);
        //   std::cout << int ( lVal ) << std::endl;
        //   std::cout << int ( lVal2 ) << std::endl;
        uint16_t lTemp(lVal2);
        lTemp |= (uint16_t(lVal & 0x7F) << 8);
        log(Info(), "Fine resolution control from input to output clocks: ", Integer(lTemp));
        log(Info(), ((lVal & 0x80) == 0x00) ? "Memorise existing FLAT value" : "Use FLAT value directly from registers");
        // -------------------------------------------------------------------------------------------
        // -------------------------------------------------------------------------------------------
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(19);
        //   std::cout << int ( lVal ) << std::endl;

        switch( lVal & 0x07 ) {
            case 0x00:
                log(Info(), "Retrigger interval set at 106ms");
                break;
            case 0x01:
                log(Info(), "Retrigger interval set at 53ms");
                break;
            case 0x02:
                log(Info(), "Retrigger interval set at 26.5ms");
                break;
            case 0x03:
                log(Info(), "Retrigger interval set at 13.3ms");
                break;
            case 0x04:
                log(Info(), "Retrigger interval set at 6.6ms");
                break;
            case 0x05:
                log(Info(), "Retrigger interval set at 3.3ms");
                break;
            case 0x06:
                log(Info(), "Retrigger interval set at 1.66ms");
                break;
            case 0x07:
                log(Info(), "Retrigger interval set at 0.833ms");
                break;
            default:
                log(Error(), "Unknown value in register 19");
                break;
        }

        switch( lVal & 0x18 ) {
            case 0x00:
                log(Info(), "Valid time for input clock: 2ms");
                break;
            case 0x08:
                log(Info(), "Valid time for input clock: 100ms");
                break;
            case 0x10:
                log(Info(), "Valid time for input clock: 200 ms");
                break;
            case 0x18:
                log(Info(), "Valid time for input clock: 13s");
                break;
            default:
                log(Error(), "Unknown value in register 19");
                break;
        }

        switch( lVal & 0x60 ) {
            case 0x00:
                log(Info(), "Frequency offset at: +/- 11 to 12ppm");
                break;
            case 0x20:
                log(Info(), "Frequency offset at: +/- 48 to 49ppm");
                break;
            case 0x40:
                log(Info(), "Frequency offset at: +/- 30ppm");
                break;
            case 0x60:
                log(Info(), "Frequency offset at: +/- 200ppm");
                break;
            default:
                log(Error(), "Unknown value in register 19");
                break;
        }

        switch( lVal & 0x80 ) {
            case 0x00:
                log(Info(), "FOS Disable");
                break;
            case 0x80:
                log(Info(), "FOS Enabled by FOSx_EN");
                break;
            default:
                log(Error(), "Unknown value in register 19");
                break;
        }

        // -------------------------------------------------------------------------------------------
        lVal = readI2C(20);
        //   std::cout << int ( lVal ) << std::endl;
        log(Info(), ((lVal & 0x01) == 0x00) ? "Interupt Status not displayed on output pin" : "Interrupt status reflected to output pin");
        log(Info(), ((lVal & 0x02) == 0x00) ? "LOL output PIN tristated" : "LOL_INT status reflected to output PIN");
        log(Info(), ((lVal & 0x04) == 0x00) ? "INT_C1B output pin tristated" : "LOS1 or INT status reflected to output pin");
        log(Info(), ((lVal & 0x08) == 0x00) ? "C2B output pin tristated" : "C2B status reflected to output pin");
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(21);
        //   std::cout << int ( lVal ) << std::endl;
        log(Info(), ((lVal & 0x01) == 0X00) ? "ClockSelection CA pin is ignored" : "CS_CA input pin controls clock selection");
        log(Info(), ((lVal & 0x02) == 0X00) ? "ClockSelection CA output pin tristated" : "Clock Act. status reflected to output");
        log(Info(), "Coarse Skew Adjustment Method: ", ((lVal & 0x80) == 0X00) ? "CLAT Register/Software" : "INC & DEC pins/Hardware");
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(22);
        log(Info(), "Interupt Status active polarity: ", ((lVal & 0x01) == 0X00) ? "low" : "high");
        log(Info(), "LOL status active polarity: ", ((lVal & 0x02) == 0X00) ? "low" : "high");
        log(Info(), "INT_C1B and C2B signals active polarity: ", ((lVal & 0x04) == 0X00) ? "low" : "high");
        log(Info(), "CS_CA signals active polarity: ", ((lVal & 0x08) == 0X00) ? "low" : "high");
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(23);
        log(Info(), ((lVal & 0x01) == 0x00) ? "LOSX alarm triggers act. interupt" : "LOSX_FLG ignored in generating interrupt output");
        log(Info(), ((lVal & 0x02) == 0x00) ? "LOS1 alarm triggers act. interupt" : "LOS1_FLG ignored in generating interrupt output");
        log(Info(), ((lVal & 0x04) == 0x00) ? "LOS2 alarm triggers act. interupt" : "LOS2_FLG ignored in generating interrupt output");
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(24);
        log(Info(), ((lVal & 0x01) == 0x00) ? "LOL alarm triggers act. interupt" : "LOL_FLG ignored in generating interrupt output");
        log(Info(), ((lVal & 0x02) == 0x00) ? "LOS1 alarm triggers act. interupt" : "LOS1_FLG ignored in generating interrupt output");
        log(Info(), ((lVal & 0x04) == 0x00) ? "LOS2 alarm triggers act. interupt" : "LOS2_FLG ignored in generating interrupt output");
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(25);
        //   std::cout << int ( lVal ) << std::endl;
        log(Info(), "High Speed Divider N1 Value = ", Integer(((lVal >> 5) &0x07) + 4));
        // -------------------------------------------------------------------------------------------
        // Jump from Registers 25-31
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(31);
        lVal2 = readI2C(32);
        lVal3 = readI2C(33);
        //   std::cout << uint32_t ( lVal ) << std::endl;
        //   std::cout << uint32_t ( lVal2 ) << std::endl;
        //   std::cout << uint32_t ( lVal3 ) << std::endl;
        uint32_t lTemp2(lVal3);
        lTemp2 |= (uint32_t(lVal2) << 8);
        lTemp2 |= (uint32_t(lVal & 0x0F) << 16);
        log(Info(), "NC1 low-speed divider value= ", Integer(lTemp2 + 1));
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(34);
        lVal2 = readI2C(35);
        lVal3 = readI2C(36);
        //   std::cout << uint32_t ( lVal ) << std::endl;
        //   std::cout << uint32_t ( lVal2 ) << std::endl;
        //   std::cout << uint32_t ( lVal3 ) << std::endl;
        lTemp2 = (lVal3);
        lTemp2 |= (uint32_t(lVal2) << 8);
        lTemp2 |= (uint32_t(lVal & 0x0F) << 16);
        log(Info(), "NC2 low-speed divider = ", Integer(lTemp2 + 1));
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(40);
        lVal2 = readI2C(41);
        lVal3 = readI2C(42);
        //   std::cout << uint32_t ( lVal ) << std::endl;
        //   std::cout << uint32_t ( lVal2 ) << std::endl;
        //   std::cout << uint32_t ( lVal3 ) << std::endl;
        //   std::cout <<  ( lVal ) << std::endl;
        lTemp2 = (lVal3);
        lTemp2 |= (uint32_t(lVal2) << 8);
        lTemp2 |= (uint32_t(lVal & 0x0F) << 16);
        log(Info(), "Low Speed Divider N2 Value = ", Integer(lTemp2 + 1));
        log(Info(), "High Speed Divider N2 Value = ", Integer(((lVal >> 5) &0x07) + 4));
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(43);
        lVal2 = readI2C(44);
        lVal3 = readI2C(45);
        //   std::cout << uint32_t ( lVal ) << std::endl;
        //   std::cout << uint32_t ( lVal2 ) << std::endl;
        //   std::cout << uint32_t ( lVal3 ) << std::endl;
        lTemp2 = (lVal3);
        lTemp2 |= (uint32_t(lVal2) << 8);
        lTemp2 |= (uint32_t(lVal & 0x07) << 16);
        log(Info(), "CKIN1 input divider value = ", Integer(lTemp2));
        // -------------------------------------------------------------------------------------
        lVal = readI2C(46);
        lVal2 = readI2C(47);
        lVal3 = readI2C(48);
        //   std::cout << uint32_t ( lVal ) << std::endl;
        //   std::cout << uint32_t ( lVal2 ) << std::endl;
        //   std::cout << uint32_t ( lVal3 ) << std::endl;
        lTemp2 = (lVal3);
        lTemp2 |= (uint32_t(lVal2) << 8);
        lTemp2 |= (uint32_t(lVal & 0x07) << 16);
        log(Info(), "CKIN2 input divider value = ", Integer(lTemp2));
        // -------------------------------------------------------------------------------------------
        // Jump from Registers 48-55
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(55);
        //   std::cout << int ( lVal ) << std::endl;

        switch( lVal & 0x07 ) {
            case 0x00:
                log(Info(), "CLKIN1RATE frequency = 10-27MHz");
                break;
            case 0x01:
                log(Info(), "CLKIN1RATE frequency = 25-54MHz");
                break;
            case 0x02:
                log(Info(), "CLKIN1RATE frequency = 50-105MHz");
                break;
            case 0x03:
                log(Info(), "CLKIN1RATE frequency = 95-215MHz");
                break;
            case 0x04:
                log(Info(), "CLKIN1RATE frequency = 190-435MHz");
                break;
            case 0x05:
                log(Info(), "CLKIN1RATE frequency = 375-710MHz");
                break;
            default:
                log(Error(), "Unknown value in register 25");
                break;
        }

        switch( lVal & 0x38 ) {
            case 0x00:
                log(Info(), "CLKIN2RATE frequency = 10-27MHz");
                break;
            case 0x08:
                log(Info(), "CLKIN2RATE frequency = 25-54MHz");
                break;
            case 0x10:
                log(Info(), "CLKIN2RATE frequency = 50-105MHz");
                break;
            case 0x18:
                log(Info(), "CLKIN2RATE frequency = 95-215MHz");
                break;
            case 0x20:
                log(Info(), "CLKIN2RATE frequency = 190-435MHz");
                break;
            case 0x28:
                log(Info(), "CLKIN2RATE frequency = 375-710MHz");
                break;
            default:
                log(Error(), "Unknown value in register 25");
                break;
        }

        // -------------------------------------------------------------------------------------------
        // Register jump from 55-128
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(128);
        //   std::cout << int ( lVal ) << std::endl;
        log(Info(), ((lVal & 0x01) == 0X00) ? "CKIN1 not active clock" : "CKIN1 is active clock");
        log(Info(), ((lVal & 0x02) == 0X00) ? "CKIN2 not active clock" : "CKIN2 is active clock");
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(129);
        //  std::cout << int ( lVal ) << std::endl;
        log(Info(), "LOS status of extn ref on XA/XB pins: ", ((lVal & 0x01) == 0X00) ? "Normal operation" : "Internal loss of signal on input");
        log(Info(), "LOS status of extn ref on CKIN1: ", ((lVal & 0x02) == 0X00) ? "Normal operation" : "Internal loss of signal on input");
        log(Info(), "LOS status of extn ref on CKIN2: ", ((lVal & 0x04) == 0X00) ? "Normal operation" : "Internal loss of signal on input");
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(130);
        //   std::cout << int ( lVal ) << std::endl;
        log(Info(), "PLL Status: ", ((lVal & 0x01) == 0X00) ? "Locked" : "Unlocked");
        log(Info(), "CKIN1 Frequency Offset Status: ", ((lVal & 0x02) == 0X00) ? "Normal operation" : "Internal Alarm on input");
        log(Info(), "CKIN2 Frequency Offset Status: ", ((lVal & 0x04) == 0X00) ? "Normal operation" : "Internal loss of signal on input");
        log(Info(), "Digital Hold Registers: ", ((lVal & 0x40) == 0X00) ? "Not filled" : "Filled");
        log(Info(), "Coarse Screw Adjustment: ", ((lVal & 0x80) == 0X00) ? "Not in progress" : "In progress");
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(131);
        //   std::cout << int ( lVal ) << std::endl;
        log(Info(), "Extn Ref Loss of Signal Flag: ", ((lVal & 0x01) == 0X00) ? "Normal operation" : "Held version of LOSX_INT");
        log(Info(), "CKIN1 Loss of Signal Flag: ", ((lVal & 0x02) == 0X00) ? "Normal operation" : "Held version of LOS1_INT");
        log(Info(), "CKIN12 Loss of Signal Flag: ", ((lVal & 0x04) == 0X00) ? "Normal operation" : "Held version of LOS2_INT");
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(132);
        //   std::cout << int ( lVal ) << std::endl;
        log(Info(), "PLL Loss of Lock Status: ", ((lVal & 0x02) == 0X00) ? "Locked" : "Held version of LOL_INT");
        log(Info(), "CLKIN_1 Frequency Offset Flag: ", ((lVal & 0x04) == 0X00) ? "Normal operation" : "Held version of FOS1_INT");
        log(Info(), "CLKIN_2 Frequency Offset Flag: ", ((lVal & 0x08) == 0X00) ? "Normal operation" : "Held version of FOS2_INT");
        // -------------------------------------------------------------------------------------------
        // No register 133
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(134);
        lVal2 = readI2C(135);
        //  Device ID from R134&135
        //   std::cout << uint16_t ( lVal ) << std::endl;
        //   std::cout << uint16_t ( lVal2 & 0xF0 ) << std::endl;
        lTemp |= (uint16_t(lVal) << 4);
        lTemp |= (uint16_t(lVal2 & 0xF0) >> 4);
        log(Info(), "Device ID. ", Integer(lTemp), ": Si5326");
        // Device Revision No. from R135
        //   std::cout << int ( lVal2 & 0x0F ) << std::endl;

        switch( lVal2 & 0x0F ) {
            case 0x00:
                log(Info(), "Revision A");
                break;
            case 0x01:
                log(Info(), "Revision B");
                break;
            case 0x02:
                log(Info(), "Revision C");
                break;
            default:
                log(Warning(), "Revision ", Integer(( uint8_t ) (lVal2 & 0x0F), IntFmt<uhal::hex>()));
                break;
        }

        // -------------------------------------------------------------------------------------------
        lVal = readI2C(136);
        //  std::cout << int (lVal) << std::endl;
        log(Info(), "Internal Calibration Sequence: ", ((lVal & 0x20) == 0x00) ? "Normal operation" : "Calibration in progress");
        log(Info(), "Internal Reset: ", ((lVal & 0x28) == 0x00) ? "Normal operation" : "Reset of all internal logic in progress");
        // -------------------------------------------------------------------------------------------
        // No Register 137
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(138);
        lVal2 = readI2C(139);
        //   std::cout << int ( lVal ) << std::endl;
        //   std::cout << int ( lVal2 ) << std::endl;
        lVal3 |= (uint8_t(lVal & 0x01) << 1);
        lVal3 |= (uint8_t(lVal2 & 0x10) >> 4);
        //  std::cout << int (lVal3) << std::endl;

        switch( lVal3 & 0x03 ) {
            case 0x00:
                log(Info(), "Disable CKIN1 LOS monitoring");
                break;
            case 0x02:
                log(Info(), "Enable CKIN1 LOSA monitoring");
                break;
            case 0x03:
                log(Info(), "Enable CKIN1 LOS monitoring");
                break;
            default:
                log(Error(), "Unknown value in register 138/139 (LOS1_EN bits)");
                break;
        }

        lVal3 |= (uint8_t(lVal & 0x02));
        lVal3 |= (uint8_t(lVal2 & 0x20) >> 5);
        //  std::cout << int (lVal3) << std::endl;

        switch( lVal3 & 0x03 ) {
            case 0x00:
                log(Info(), "Disable CKIN2 LOS monitoring");
                break;
            case 0x02:
                log(Info(), "Enable CKIN2 LOSA monitoring");
                break;
            case 0x03:
                log(Info(), "Enable CKIN2 LOS monitoring");
                break;
            default:
                log(Error(), "Unknown value in register 138/139 (LOS2_EN bits)");
                break;
        }

        log(Info(), ((lVal2 & 0x01) == 0x00) ? "Disable FOS1 Monitoring" : "Enable FOS1 Monitoring");
        log(Info(), ((lVal2 & 0x02) == 0x00) ? "Disable FOS2 Monitoring" : "Enable FOS2 Monitoring");
        // -------------------------------------------------------------------------------------------
        // No Registers between 139-142
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(142);
        //   std::cout << uint16_t ( lVal ) << std::endl;
        log(Info(), "Phase offset in terms of (CLK1) clocks from high speed divider : ", Integer(lVal));
        // -------------------------------------------------------------------------------------------
        lVal = readI2C(143);
        //   std::cout << uint16_t ( lVal ) << std::endl;
        log(Info(), "Phase offset in terms of (CLK2) clocks from high speed divider : ", Integer(lVal));
        // -------------------------------------------------------------------------------------------
    }

    std::map<uint32_t, uint32_t>
    SI5326Node::registers( ) const {
        //  boost::format fmthex("%d");
        map<uint32_t, uint32_t> values;

        for( uint8_t regAddr = 0; regAddr <= 143; regAddr++ ) {
            if( regAddr > 11 && regAddr < 16 ) {
                continue;
            }

            if( regAddr > 25 && regAddr < 31 ) {
                continue;
            }

            if( regAddr > 36 && regAddr < 40 ) {
                continue;
            }

            if( regAddr > 48 && regAddr < 55 ) {
                continue;
            }

            if( regAddr > 55 && regAddr < 128 ) {
                continue;
            }

            if( regAddr == 133 ) {
                continue;
            }

            if( regAddr == 137 ) {
                continue;
            }

            if( regAddr > 139 && regAddr < 142 ) {
                continue;
            }

            values[ regAddr ] = readI2C(regAddr);
        }

        return values;
    }

}
