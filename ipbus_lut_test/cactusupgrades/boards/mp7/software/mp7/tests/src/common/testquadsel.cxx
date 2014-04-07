#include <cstdlib>

#include "uhal/uhal.hpp"
#include "uhal/log/log.hpp"

#include "mp7/CtrlNode.hpp"
#include "mp7/MGTBufferNode.hpp"

using namespace std;

/*
 *
 */
int main ( int argc, char** argv )
{
  uhal::setLogLevelTo ( uhal::Error() );
  uhal::ConnectionManager cm ( "file://etc/uhal/connections904.xml" );
  uhal::HwInterface board = cm.getDevice ( "MP7_690_fix" );
  uhal::ValWord<uint32_t> id = board.getNode ( "ctrl.id" ).read();
  board.dispatch();
  std::cout << "0x" <<  std::hex << id << std::endl;
  mp7::CtrlNode csr ( board.getNode ( "ctrl.csr" ) );
  mp7::MGTBufferNode buffers ( board.getNode ( "buffers" ) );
  uint8_t q, c;

  for ( q = 0; q < 1; ++q )
    for ( c = 0; c < 4; ++c )
    {
      std::cout << "quad.chan: " << ( int ) q <<  "." << ( int ) c << std::endl;
      //      csr.selectQuadChan(q,c);
      csr.selectQuad ( q );
      csr.selectChannel ( c );
      buffers.clearRx();
      buffers.clearTx();
    }
}


