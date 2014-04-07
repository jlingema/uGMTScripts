#include "mp7/helpers.hpp"

#include <time.h>
#include <cstdarg>
#include <cstdlib>
#include <stdio.h>
#include <stdint.h>

void
mp7::millisleep( const double& aTimeInMilliseconds ) {
    //  using namespace uhal;
    //  logging();
    double lTimeInSeconds(aTimeInMilliseconds / 1e3);
    int lIntegerPart(( int ) lTimeInSeconds);
    double lFractionalPart(lTimeInSeconds - ( double ) lIntegerPart);
    struct timespec sleepTime, returnTime;
    sleepTime.tv_sec = lIntegerPart;
    sleepTime.tv_nsec = ( long ) (lFractionalPart * 1e9);
    //  log ( Notice() , "Sleeping " , Integer ( uint32_t ( sleepTime.tv_sec ) ) , "s " , Integer ( uint32_t ( sleepTime.tv_nsec ) ) , "ns" );
    nanosleep(&sleepTime, &returnTime);
}

// Formats a std::string in printf fashion

std::string
mp7::strprintf( const char* fmt, ... ) {
    char* ret;
    va_list ap;
    va_start(ap, fmt);
    vasprintf(&ret, fmt, ap);
    va_end(ap);
    std::string str(ret);
    free(ret);
    return str;
}

uint32_t locate( float xx[], unsigned long n, float x ) {
    uint32_t j, ju, jm, jl;
    int ascnd;
    jl = 0; //Initialize lower
    ju = n + 1; //and upper limits.
    ascnd = (xx[n] >= xx[1]);

    while( ju - jl > 1 ) //If we are not yet done,
    {
        jm = (ju + jl) >> 1; //compute a midpoint,

        if( (x >= xx[jm]) == ascnd ) // added additional parenthesis
        {
            jl = jm; //and replace either the lower limit
        } else {
            ju = jm; //or the upper limit, as appropriate.
        }
    } //Repeat until the test condition is satisﬁed.

    if( x == xx[1] ) {
        j = 1; //Then set the output
    } else if( x == xx[n] ) {
        j = n - 1;
    } else {
        j = jl;
    }

    return j;
}

