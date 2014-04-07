#include "uhal/uhal.hpp"
#include <iostream>

int main()
{
  uhal::ConnectionManager cm ( "file://etc/uhal/connections904.xml" );
  uhal::HwInterface hw = cm.getDevice ( "MP7_690_TX_PP_TMUX" );
  uhal::ValWord<uint32_t> id = hw.getNode ( "ctrl.id" ).read();
  hw.dispatch();
  std::cout << "0x" << std::hex << id << std::endl;
  //---
  return 0;
}

