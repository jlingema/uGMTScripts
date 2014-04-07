/*
 * File:   testhex.cxx
 * Author: ale
 *
 * Created on November 20, 2013, 10:47 PM
 */

#include <cstdlib>
#include "mp7/helpers.hpp"
#include "boost/lexical_cast.hpp"

using namespace std;

/*
 *
 */
int main ( int argc, char** argv )
{
  std::string number = "0x68";
  uint32_t addr = boost::lexical_cast<mp7::stoul<uint32_t> > ( number );
  cout << "addr = " << number << " = " << ( uint32_t ) addr << endl;
  std::string number2 = "-0x68";
  int32_t addr2 = boost::lexical_cast<mp7::stol<int32_t> > ( number2 );
  cout << "addr = " << number2 << " = " << ( int32_t ) addr2 << endl;
  return 0;
}

