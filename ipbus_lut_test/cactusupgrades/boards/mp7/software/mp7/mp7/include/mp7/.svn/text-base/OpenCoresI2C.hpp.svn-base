#ifndef MP7_OPENCORESI2C_H
#define MP7_OPENCORESI2C_H

// C++ headers
#include <vector>
#include <string>

// uHal Headers
#include "uhal/DerivedNode.hpp"


namespace mp7 {
    /*!
     * @class OpenCoresI2C
     * @brief Class to provide OpenCode I2C interface to a ipbus node
     *
     * The class is non-copyable on purpose as the inheriting object
     * must properly set the node pointer in the copy
     * i2c access through an IPbus interface
     * @author Kristian Harder, Alessandro Thea
     * @date August 2013
     *
     */

    class OpenCoresI2C : public uhal::Node {
        UHAL_DERIVEDNODE( OpenCoresI2C );
    public:
        // PUBLIC METHODS
        OpenCoresI2C( const uhal::Node& node );
        virtual ~OpenCoresI2C( );

        // getters

        uint8_t getI2CSlaveAddress( ) const {
            return mSlaveAddress;
        }

        uint8_t getI2CClockPrescale( ) const {
            return mClockPrescale;
        }

        // comodity functions
        uint8_t readI2C( uint32_t i2cAddress ) const;
        void writeI2C( uint32_t i2cAddress, uint32_t data ) const;

        // low level i2c functions
        std::vector<uint8_t> readBlockI2C( const uint32_t numBytes ) const;
        void writeBlockI2C( const std::vector<uint8_t>& data ) const;

    private:

        // low level i2c functions
        void reset( ) const;
        void waitUntilFinished( bool requireAcknowledgement=true,
                bool requireBusIdleAtEnd=false ) const;

        // PRIVATE MEMBERS
        // IPbus interface
        //  uhal::Node * m_node;

        // IPBus register names for i2c bus
        static const std::string mPreHi;
        static const std::string mPreLo;
        static const std::string mCtrl;
        static const std::string mTx;
        static const std::string mRx;
        static const std::string mCmd;
        static const std::string mStatus;

        // clock prescale factor
        uint16_t mClockPrescale;

        // slave address
        uint8_t mSlaveAddress;


    }; // class OpenCoresI2C

}

#endif /* MP7_OPENCORESI2C_H */

