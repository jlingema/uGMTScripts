#ifndef __mp7_helpers_hxx__
#define __mp7_helpers_hxx__

namespace mp7 {

    template < typename T >
    struct stoul {
        BOOST_STATIC_ASSERT( (boost::is_unsigned<T>::value) );
        T value;

        operator T( ) const {
            return value;
        }

        friend std::istream& operator>>(std::istream& in, stoul& out) {
            std::string buf;
            in>>buf;
            out.value=strtoul(buf.c_str(), NULL, 0);
            return in;
        }
    };

    template < typename T >
    struct stol {
        BOOST_STATIC_ASSERT( (boost::is_signed<T>::value) );
        T value;

        operator T( ) const {
            return value;
        }

        friend std::istream& operator>>(std::istream& in, stol& out) {
            std::string buf;
            in>>buf;
            out.value=strtol(buf.c_str(), NULL, 0);
            return in;
        }
    };
}


#endif /* _mp7_helpers_hpp_ */
