#ifndef __mp7_helpers_hpp__
#define __mp7_helpers_hpp__

// C++ Headers
#include <string>
#include <istream>
#include <stdint.h>
#include <stdlib.h>


// Boost Headers
#include <boost/static_assert.hpp>
#include<boost/type_traits/is_signed.hpp>
#include<boost/type_traits/is_unsigned.hpp>

namespace mp7 {

    // Wrappers to be used by lexical_cast
    template < typename T > struct stol;
    template < typename T > struct stoul;

    void millisleep( const double& aTimeInMilliseconds );
    std::string strprintf( const char* fmt, ... );
}

#include "mp7/helpers.hxx"
#endif /* _mp7_helpers_hpp_ */

