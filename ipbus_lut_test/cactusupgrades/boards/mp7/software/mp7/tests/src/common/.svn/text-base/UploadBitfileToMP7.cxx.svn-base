#include "uhal/uhal.hpp"
#include "uhal/log/log.hpp"
#include "uhal/log/exception.hpp"

#include "mp7/Firmware.hpp"
#include "mp7/MmcPipeInterface.hpp"

#include <boost/program_options.hpp>

ExceptionClass ( MissingCommandlineParameters, "Required Command-line parameters are missing" );


int main ( int argc, char* argv[] )
{
  uhal::setLogLevelTo ( uhal::Notice );
  boost::program_options::variables_map lVariablesMap;
  {
    boost::program_options::options_description lOptions ( "Commandline parameters" );
    lOptions.add_options()
    ( "help,h", "Produce this help message" )
    ( "ip,i", boost::program_options::value<std::string>() , "IP address of target board (Required)" )
    ( "filename,f", boost::program_options::value<std::string>(), "Bitfile to upload (Optional)" );

    try
    {
      boost::program_options::store ( boost::program_options::parse_command_line ( argc, argv, lOptions ), lVariablesMap );
      boost::program_options::notify ( lVariablesMap );

      if ( lVariablesMap.count ( "help" ) )
      {
        uhal::log ( uhal::Info , "Usage: " , argv[0] , " [OPTIONS]" );
        uhal::log ( uhal::Info , lOptions );
        return 0;
      }

      if ( !lVariablesMap.count ( "ip" ) )
      {
        throw MissingCommandlineParameters();
      }
    }
    catch ( std::exception& e )
    {
      uhal::log ( uhal::Error , "Error: " , uhal::Quote ( e.what() ) );
      uhal::log ( uhal::Error , "Usage: " , argv[0] , " [OPTIONS]" );
      uhal::log ( uhal::Error , lOptions );
      return 1;
    }
  }

  try
  {
    std::string lURI ( "ipbusudp-2.0://" + lVariablesMap[ "ip" ].as<std::string>() + ":50001" );
    uhal::HwInterface lBoard ( uhal::ConnectionManager::getDevice ( "Board", lURI , "file://etc/uhal/mp7_mmc_interface_hack.xml" ) );
    mp7::MmcPipeInterface lMmc ( lBoard.getNode< mp7::MmcPipeInterface > ( "buf_test" ) );

    if ( lVariablesMap.count ( "filename" ) )
    {
      mp7::XilinxBitFile lBitFile ( lVariablesMap[ "filename" ].as<std::string>() );
      std::string lFilename ( lBitFile.StandardizedFileName() );
      uhal::log ( uhal::Notice , "Standardized filename of file " , uhal::Quote ( lBitFile.FileName( ) ) , " is " , uhal::Quote ( lFilename ) );
      std::vector<std::string> lFiles ( lMmc.ListFilesOnSD () );

      for ( std::vector< std::string >::iterator lIt ( lFiles.begin() ) ; lIt != lFiles.end() ; ++lIt )
      {
        if ( *lIt == lFilename )
        {
          uhal::log ( uhal::Notice ,  "File '" , lFilename , "' already exists on SD card" );
          return 0;
        }
      }

      lMmc.FileToSD ( lFilename , lBitFile );
    }
    else
    {
      uhal::log ( uhal::Notice , "Existing files:" );
      std::vector<std::string> lFiles ( lMmc.ListFilesOnSD () );

      for ( std::vector< std::string >::iterator lIt ( lFiles.begin() ) ; lIt != lFiles.end() ; ++lIt )
      {
        uhal::log ( uhal::Notice , " - " , *lIt );
      }
    }
  }
  catch ( uhal::exception::exception& aExc )
  {
    uhal::log ( uhal::Error , "Exception thrown with message " , uhal::Quote ( aExc.what() ) );
  }
}

