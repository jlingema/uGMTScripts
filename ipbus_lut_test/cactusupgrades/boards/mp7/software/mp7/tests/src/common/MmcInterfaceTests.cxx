#include "uhal/uhal.hpp"
#include "uhal/log/log.hpp"
#include "uhal/log/exception.hpp"

#include <time.h>
#include <math.h>
#include <unistd.h>
#include <iostream>
#include <vector>

#include "mp7/Firmware.hpp"
#include "mp7/MmcPipeInterface.hpp"

// ------------------------------------------------------------------------------------------------------------
// NOTE! WE SHOULD NOT BE ABLE TO DO THIS! THE GOLDEN IMAGE IS MEANT TO BE INVIOLATE!
// CURRENTLY THE MMC SOFTWARE HAS THE CHECK ON THIS COMMENTED OUT FOR EASE OF DEVELOPMENT
// BUT IT WILL BE READDED AND THIS TEST PROGRAM WILL STOP WORKING!
// ------------------------------------------------------------------------------------------------------------


double elapsed ( const timespec& aStart, const timespec& aEnd )
{
  double lStart ( ( aStart.tv_sec*1e9 ) + aStart.tv_nsec );
  double lEnd ( ( aEnd.tv_sec*1e9 ) + aEnd.tv_nsec );
  return lEnd - lStart;
}

void stats ( const std::vector<double>& aData , double& aMean , double& aSD )
{
  aMean = 0.00;
  aSD = 0.00;

  for ( std::vector<double>::const_iterator lIt = aData.begin() ; lIt != aData.end() ; ++lIt )
  {
    aMean += *lIt;
    aSD += ( *lIt * *lIt );
  }

  aMean /= aData.size();
  aSD /= aData.size();
  aSD -= ( aMean * aMean );
  aSD = sqrt ( aSD );
}




int main ( int argc, char* argv[] )
{
  try
  {
    using namespace uhal;
    using namespace mp7;
    //setLogLevelTo ( Notice() );
    setLogLevelTo ( Info() );
    //setLogLevelTo ( Debug() );
    std::string lPassword ( "RuleBritannia" );
    std::string lFilename ( "BLAH.bin" );
    XilinxBitFile lBitFile ( "/firmware/MMC_test2/work/top.bit" );
    HwInterface lBoard = ConnectionManager::getDevice ( "Board", "ipbusudp-2.0://192.168.0.135:50001" , "file://etc/uhal/mp7_mmc_interface_hack.xml" );
    MmcPipeInterface lNode = lBoard.getNode< MmcPipeInterface > ( "buf_test" );
    std::vector<double> lDeleteFromSD;
    std::vector<double> lFileToSD;
    std::vector<double> lFileFromSD;
    std::vector<double> lRebootFPGA;
    std::vector<double> lListFilesOnSD;
    //     std::cout << "---------------- NUCLEAR RESET ------------------" << std::endl;
    //     lNode.BoardHardReset ( lPassword );
    //     std::cout << "-------------- END NUCLEAR RESET ----------------" << std::endl;
    timespec lStart, lEnd;
    uint32_t lNumberLoops ( 10000 );

    for ( uint32_t i = 0; i!= lNumberLoops; ++i )
    {
      std::cout << std::dec << "Iteration " << i << std::endl;
      //       // ----------------------------------------------------------------------
      //       std::cout << "Deleting file from SD card: " << std::endl;
      //       clock_gettime ( CLOCK_REALTIME, &lStart );
      //
      //       try
      //       {
      //         lNode.DeleteFromSD ( lFilename , lPassword );
      //       }
      //       catch ( ... )
      //       {
      //       }
      //       clock_gettime ( CLOCK_REALTIME, &lEnd );
      //       lDeleteFromSD.push_back ( elapsed ( lStart , lEnd ) );
      //       // ----------------------------------------------------------------------
      //       std::cout << "File to SD card: " << std::endl;
      //       clock_gettime ( CLOCK_REALTIME, &lStart );
      //       lNode.FileToSD ( lFilename , lBitFile );
      //       clock_gettime ( CLOCK_REALTIME, &lEnd );
      //       lFileToSD.push_back ( elapsed ( lStart , lEnd ) );
      //       // ----------------------------------------------------------------------
      //       std::cout << "Sending of reboot command: " << std::endl;
      //       clock_gettime ( CLOCK_REALTIME, &lStart );
      //       lNode.RebootFPGA ( lFilename , lPassword );
      //       clock_gettime ( CLOCK_REALTIME, &lEnd );
      //       lRebootFPGA.push_back ( elapsed ( lStart , lEnd ) );
      //       // ----------------------------------------------------------------------
      std::cout << "List Files On SD: " << std::endl;
      clock_gettime ( CLOCK_REALTIME, &lStart );
      std::vector<std::string> lFiles ( lNode.ListFilesOnSD () );
      clock_gettime ( CLOCK_REALTIME, &lEnd );
      lListFilesOnSD.push_back ( elapsed ( lStart , lEnd ) );

      for ( std::vector< std::string >::iterator lIt ( lFiles.begin() ) ; lIt != lFiles.end() ; ++lIt )
      {
        std::cout << " - '" << *lIt  << "'" << std::endl;
      }

      /*      // ----------------------------------------------------------------------
            std::cout << "File from SD card: " << std::endl;
            clock_gettime ( CLOCK_REALTIME, &lStart );
            lNode.FileFromSD ( lFilename );
            clock_gettime ( CLOCK_REALTIME, &lEnd );
            lFileFromSD.push_back ( elapsed ( lStart , lEnd ) );

            // ----------------------------------------------------------------------*/
    }

    // ----------------------------------------------------------------------
    double lMean, lSD;
    stats ( lDeleteFromSD , lMean , lSD );
    std::cout << "lDeleteFromSD mean=" << ( lMean/1e9 ) << "s, SD=" << ( lSD/1e9 ) << "s" << std::endl;
    stats ( lFileToSD , lMean , lSD );
    std::cout << "lFileToSD mean=" << ( lMean/1e9 ) << "s, SD=" << ( lSD/1e9 ) << "s" << std::endl;
    stats ( lRebootFPGA , lMean , lSD );
    std::cout << "lRebootFPGA mean=" << ( lMean/1e9 ) << "s, SD=" << ( lSD/1e9 ) << "s" << std::endl;
    stats ( lListFilesOnSD , lMean , lSD );
    std::cout << "lListFilesOnSD mean=" << ( lMean/1e9 ) << "s, SD=" << ( lSD/1e9 ) << "s" << std::endl;
    stats ( lFileFromSD , lMean , lSD );
    std::cout << "lFileFromSD mean=" << ( lMean/1e9 ) << "s, SD=" << ( lSD/1e9 ) << "s" << std::endl;
    // ----------------------------------------------------------------------
  }
  catch ( uhal::exception::exception& aExc )
  {
    std::cout << aExc.what() << std::endl;
  }
}








