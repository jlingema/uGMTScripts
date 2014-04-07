// i2c interface class based on code by Carl Jeske, University of Bristol
// this version by Kristian Harder

#include "mp7/OpenCoresI2C.hpp"
#include "mp7/helpers.hpp"

// uHal Headers
//#include "uhal/Node.hpp"

// Boost headers
#include <boost/lexical_cast.hpp>
#include <boost/algorithm/string/predicate.hpp>



// Namespace resolution
using namespace std;
using namespace uhal;

namespace mp7 {
    UHAL_REGISTER_DERIVED_NODE( OpenCoresI2C );

    // PRIVATE CONST definitions
    const std::string OpenCoresI2C::mPreHi = "ps_hi";
    const std::string OpenCoresI2C::mPreLo = "ps_lo";
    const std::string OpenCoresI2C::mCtrl = "ctrl";
    const std::string OpenCoresI2C::mTx = "data";
    const std::string OpenCoresI2C::mRx = "data";
    const std::string OpenCoresI2C::mCmd = "cmd_stat";
    const std::string OpenCoresI2C::mStatus = "cmd_stat";

    //PUBLIC METHODS

    OpenCoresI2C::OpenCoresI2C( const uhal::Node& aNode ) :
    Node( aNode ) {
        const boost::unordered_map<string, string> lPars = this->getParameters();
        boost::unordered_map<string, string>::const_iterator par;

        if( (par = lPars.find("i2caddr")) != lPars.end() ) {
            mSlaveAddress = (boost::lexical_cast< mp7::stoul<uint32_t> > (par->second) & 0x7f);
        } else {
            throw runtime_error("Parameter 'i2caddr' not found");
        }

        // 16 bit clock prescale factor.
        // formula: m_clockPrescale = (input_frequency / 5 / desired_frequency) -1
        // for typical IPbus applications: input frequency = IPbus clock = 31.x MHz
        // target frequency 100 kHz to play it safe (first revision of i2c standard),
        // but e.g. the SI5326 clock chip on the MP7 can do up to 400 kHz
        mClockPrescale = 0x40;
    }

    OpenCoresI2C::~OpenCoresI2C( ) {
    }

    void OpenCoresI2C::reset( ) const {
        // Resets the I2C bus
        //
        // This function does the following:
        //        1) Disables the I2C core
        //        2) Sets the clock prescale registers
        //        3) Enables the I2C core
        //        4) Sets all writable bus-master registers to default values
        // disable the I2C core
        getNode(mCtrl).write(0x00);
        getClient().dispatch();
        // set the clock prescale
        getNode(mPreHi).write((mClockPrescale & 0xff00) >> 8);
        getClient().dispatch();
        getNode(mPreLo).write(mClockPrescale & 0xff);
        getClient().dispatch();
        // enable the I2C core
        getNode(mCtrl).write(0x80);
        getClient().dispatch();
        // set all writable bus-master registers to default values
        getNode(mTx).write(0x00);
        getClient().dispatch();
        getNode(mCmd).write(0x00);
        getClient().dispatch();
    }

    uint8_t OpenCoresI2C::readI2C( uint32_t i2cAddress ) const {
        // write one word containing the address
        std::vector<uint8_t> array(1, i2cAddress & 0x7f);
        this->writeBlockI2C(array);
        // request the content at the specific address
        return this->readBlockI2C(1) [0];
    }

    void OpenCoresI2C::writeI2C( uint32_t i2cAddress, uint32_t data ) const {
        std::vector<uint8_t> block(2);
        block[0] = (i2cAddress & 0xff);
        block[1] = (data & 0xff);
        this->writeBlockI2C(block);
    }

    void OpenCoresI2C::writeBlockI2C( const std::vector<uint8_t>& array ) const {
        // transmit reg definitions
        // bits 7-1: 7-bit slave address during address transfer
        //           or first 7 bits of byte during data transfer
        // bit 0: RW flag during address transfer or LSB during data transfer.
        // '1' = reading from slave
        // '0' = writing to slave
        // command reg definitions
        // bit 7: Generate start condition
        // bit 6: Generate stop condition
        // bit 5: Read from slave
        // bit 4: Write to slave
        // bit 3: 0 when acknowledgement is received
        // bit 2:1: Reserved
        // bit 0: Interrupt acknowledge. When set, clears a pending interrupt
        // Reset bus before beginning
        reset();
        // Set slave address in bits 7:1, and set bit 0 to zero (i.e. "write mode")
        getNode(mTx).write((mSlaveAddress << 1) & 0xfe);
        getClient().dispatch();
        // Set start and write bit in command reg
        getNode(mCmd).write(0x90);
        // Run the commands and wait for transaction to finish
        getClient().dispatch();
        waitUntilFinished();

        for( unsigned ibyte = 0; ibyte < array.size(); ibyte++ ) {
            uint8_t stop_bit = 0x00;

            if( ibyte == array.size() - 1 ) {
                stop_bit = 0x40;
            }

            // Set array to be written in transmit reg
            getNode(mTx).write(array[ibyte]);
            getClient().dispatch();
            // Set write and stop bit in command reg
            getNode(mCmd).write(0x10 + stop_bit);
            // Run the commands and wait for transaction to finish
            getClient().dispatch();

            if( stop_bit ) {
                waitUntilFinished(true, true);
            } else {
                waitUntilFinished(true, false);
            }
        }
    }


    //void OpenCoresI2C::read(const uint32_t numBytes,
    //                            std::vector<uint8_t>& array) {

    std::vector<uint8_t>
    OpenCoresI2C::readBlockI2C( const uint32_t numBytes ) const {
        // transmit reg definitions
        // bits 7-1: 7-bit slave address during address transfer
        //           or first 7 bits of byte during data transfer
        // bit 0: RW flag during address transfer or LSB during data transfer.
        //        '1' = reading from slave
        //        '0' = writing to slave
        // command reg definitions
        // bit 7:   Generate start condition
        // bit 6:   Generate stop condition
        // bit 5:   Read from slave
        // bit 4:   Write to slave
        // bit 3:   0 when acknowledgement is received
        // bit 2:1: Reserved
        // bit 0:   Interrupt acknowledge. When set, clears a pending interrupt
        // Reset bus before beginning
        reset();
        // Set slave address in bits 7:1, and set bit 0 to one
        // (i.e. we're writing an address to the bus and then want to read)
        getNode(mTx).write((mSlaveAddress << 1) | 0x01);
        getClient().dispatch();
        // Set start and write bit in command reg
        getNode(mCmd).write(0x90);
        // Run the commands and wait for transaction to finish
        getClient().dispatch();
        waitUntilFinished();
        std::vector<uint8_t> array;

        for( unsigned ibyte = 0; ibyte < numBytes; ibyte++ ) {
            // Set read bit, acknowledge and stop bit in command reg
            uint8_t stop_bit = 0x00;
            uint8_t ack_bit = 0x00;

            if( ibyte == numBytes - 1 ) {
                stop_bit = 0x40;
                ack_bit = 0x08;
            }

            getNode(mCmd).write(0x20 + ack_bit + stop_bit);
            getClient().dispatch();

            // Wait for transaction to finish.
            // Don't expect an ACK, do expect bus free at finish.
            if( stop_bit ) {
                waitUntilFinished(false, true);
            } else {
                waitUntilFinished(false, false);
            }

            uhal::ValWord<uint32_t> result = getNode(mRx).read();
            getClient().dispatch();
            array.push_back(result);
        }

        return array;
    }

    void OpenCoresI2C::waitUntilFinished( bool requireAcknowledgement,
            bool requireBusIdleAtEnd ) const {
        // Ensures the current bus transaction has finished successfully
        // before allowing further I2C bus transactions
        // This method monitors the status register
        // and will not allow execution to continue until the
        // I2C bus has completed properly.  It will throw an exception
        // if it picks up bus problems or a bus timeout occurs.
        const unsigned maxRetry = 20;
        unsigned attempt = 1;
        bool receivedAcknowledge, busy;

        while( attempt <= maxRetry ) {
            usleep(10);
            // Get the status
            uhal::ValWord<uint32_t> i2c_status = getNode(mStatus).read();
            getClient().dispatch();
            receivedAcknowledge = !(i2c_status & 0x80);
            busy = (i2c_status & 0x40);
            bool arbitrationLost = (i2c_status & 0x20);
            bool transferInProgress = (i2c_status & 0x02);
            //bool interruptFlag = (i2c_status & 0x01);

            if( arbitrationLost ) {
                // This is an instant error at any time
                std::string err = "OpenCoresI2C error: bus arbitration lost."
                        " Another application running?";
                throw std::runtime_error(err);
            }

            if( !transferInProgress ) {
                // The transfer looks to have completed successfully,
                // pending further checks
                break;
            }

            attempt += 1;
        }

        // At this point, we've either had too many retries, or the
        // Transfer in Progress (TIP) bit went low.  If the TIP bit
        // did go low, then we do a couple of other checks to see if
        // the bus operated as expected:

        if( attempt > maxRetry ) {
            std::string err = "OpenCoresI2C error: Transaction timeout"
                    " - the 'Transfer in Progress' bit remained high for too long";
            throw std::runtime_error(err);
        }

        if( requireAcknowledgement && !receivedAcknowledge ) {
            std::string err = "OpenCoresI2C error: No acknowledge received";
            throw std::runtime_error(err);
        }

        if( requireBusIdleAtEnd && busy ) {
            std::string err = "OpenCoresI2C error: Transfer finished but bus still busy";
            throw std::runtime_error(err);
        }
    }

}
