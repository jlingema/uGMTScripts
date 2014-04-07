/*
 * File:   converters.h
 * Author: ale
 *
 * Created on August 20, 2013, 4:28 AM
 */

#ifndef _mp7_python_converters_h_
#define	_mp7_python_converters_h_

// MP7 Headers
#include "mp7/MGTBufferNode.hpp"

// C++ Headers
#include <vector>
#include <map>

// Boost Headers
#include "boost/python.hpp"
#include "boost/python/converter/rvalue_from_python_data.hpp"

namespace pycomp7
{

  //----------------------------------------------//
  // --- Converter_pair_uint32_bool_from_tuple ---//
  //----------------------------------------------//

  struct Converter_pair_uint32_bool_from_tuple
  {
    // Default CTOR. Registers this converter to boost::python

    Converter_pair_uint32_bool_from_tuple()
    {
      boost::python::converter::registry::push_back ( &convertible, &construct, boost::python::type_id < std::pair<uint32_t, bool > >() );
    }

    // Determine if obj_ptr can be converted to vector<uint32_t>
    static void* convertible ( PyObject* obj_ptr );

    // Convert obj_ptr to a C++ vector<uint32_t>
    static void construct ( PyObject* obj_ptr, boost::python::converter::rvalue_from_python_stage1_data* data );
  };

  //------------------//
  // --- Templates ---//
  //------------------//

  template<class T>
  struct Converter_std_vector_from_list
  {
    // Default CTOR. Registers this converter to boost::python

    Converter_std_vector_from_list()
    {
      boost::python::converter::registry::push_back ( &convertible, &construct, boost::python::type_id< std::vector<T> >() );
    }

    // Determine if obj_ptr can be converted to vector<T>
    static void* convertible ( PyObject* obj_ptr );

    // Convert obj_ptr to a C++ vector<T>
    static void construct ( PyObject* obj_ptr, boost::python::converter::rvalue_from_python_stage1_data* data );
  };

  template <class T>
  struct Converter_std_vector_to_list
  {
    static PyObject* convert ( const std::vector<T>& v );
  };

  template <class U, class T>
  struct Converter_std_map_to_dict
  {
    static PyObject* convert ( const std::map<U, T>& m );
  };

  template <class U, class T>
  struct Converter_boost_unorderedmap_to_dict
  {
    static PyObject* convert ( const boost::unordered_map<U, T>& m );
  };

  template<class T1, class T2>
  struct PairToTupleConverter
  {
    static PyObject* convert ( const std::pair<T1, T2>& pair );
  };

  void register_converters();

  PyObject* create_exception_class ( const std::string& excName, PyObject* baseTypeObj = PyExc_Exception );

  /// Functor for exception translation.
  /// Written as functor (rather than function) to avoid storing the PyObject* for python versions of exception classes as global variables (member exception_pyType_ used here instead)
  template<class ExceptionType>
  class ExceptionTranslator
  {
    public:
      ExceptionTranslator ( PyObject* exception_pyType );

      /// Translation function called at the C-python boundary
      void operator() ( const ExceptionType& e ) const;

    private:
      PyObject* exception_pyType_; ///< Pointer to PyObject corresponding to C++ exception class ExceptionType
  };


  template<class ExceptionType>
  void wrap_derived_exception ( const std::string& exceptionName, PyObject* base_exception_pyType )
  {
    PyObject* derived_exception_pyType = pycomp7::create_exception_class ( exceptionName, base_exception_pyType );
    boost::python::register_exception_translator<ExceptionType> ( pycomp7::ExceptionTranslator<ExceptionType> ( derived_exception_pyType ) );
  }

  void wrap_exceptions();

}
//----------------------------------------//
// ---  Converter_std_map_to_dict     --- //
//----------------------------------------//

template <class U, class T>
PyObject* pycomp7::Converter_std_map_to_dict<U,T>::convert ( const std::map<U, T>& m )
{
  namespace bpy = boost::python;
  bpy::dict theDict;

  for ( typename std::map<U, T>::const_iterator it = m.begin(); it != m.end(); it++ )
  {
    theDict[it->first] = bpy::object ( it->second );
  }

  return bpy::incref ( theDict.ptr() );
}

//----------------------------------------//
// ---  Converter_boost_unorderedmap_to_dict     --- //
//----------------------------------------//
template <class U, class T>
PyObject* pycomp7::Converter_boost_unorderedmap_to_dict<U,T>::convert ( const boost::unordered_map<U, T>& m )
{
  namespace bpy = boost::python;
  bpy::dict theDict;

  for ( typename boost::unordered_map<U, T>::const_iterator it = m.begin(); it != m.end(); it++ )
  {
    theDict[it->first] = bpy::object ( it->second );
  }

  return bpy::incref ( theDict.ptr() );
}


//------------------------------------------//
// ---  Converter_std_vector_from_list  --- //
//------------------------------------------//

template <class T>
void* pycomp7::Converter_std_vector_from_list<T>::convertible ( PyObject* obj_ptr )
{
  if ( !PyList_Check ( obj_ptr ) )
  {
    return 0;
  }
  else
  {
    return obj_ptr;
  }
}

template <class T>
void pycomp7::Converter_std_vector_from_list<T>::construct ( PyObject* obj_ptr, boost::python::converter::rvalue_from_python_stage1_data* data )
{
  namespace bpy = boost::python;
  // Grab pointer to memory in which to construct the new vector
  void* storage = ( ( bpy::converter::rvalue_from_python_storage< std::vector<T> >* ) data )->storage.bytes;
  // Grab list object from obj_ptr
  bpy::list py_list ( bpy::handle<> ( bpy::borrowed ( obj_ptr ) ) );
  // Construct vector in requested location, and set element values.
  // boost::python::extract will throw appropriate exception if can't convert to type T ; boost::python will then call delete itself as well.
  size_t nItems = bpy::len ( py_list );
  std::vector<T>* vec_ptr = new ( storage ) std::vector<T> ( nItems );

  for ( size_t i = 0; i < nItems; i++ )
  {
    vec_ptr->at ( i ) = bpy::extract<T> ( py_list[i] );
  }

  // If successful, then register memory chunk pointer for later use by boost.python
  data->convertible = storage;
}

//----------------------------------------//
// ---  Converter_std_vector_to_list  --- //
//----------------------------------------//

template <class T>
PyObject* pycomp7::Converter_std_vector_to_list<T>::convert ( const std::vector<T>& vec )
{
  namespace bpy = boost::python;
  bpy::list theList;

  for ( typename std::vector<T>::const_iterator it = vec.begin(); it != vec.end(); it++ )
  {
    theList.append ( bpy::object ( *it ) );
  }

  return bpy::incref ( theList.ptr() );
}

//----------------------------------------//
// ---  Converter_std_pair_to_tuple  --- //
//----------------------------------------//

template<class T1, class T2>
PyObject* pycomp7::PairToTupleConverter<T1, T2>::convert ( const std::pair<T1, T2>& pair )
{
  namespace bpy = boost::python;
  return bpy::incref ( bpy::make_tuple ( pair.first, pair.second ).ptr() );
}


//-------------------------------//
// ---  ExceptionTranslator  --- //
//-------------------------------//
// TODO: Copied from pycohal converters_exceptions.cpp. Should use that instead
template <class ExceptionType>
pycomp7::ExceptionTranslator<ExceptionType>::ExceptionTranslator ( PyObject* exception_pyType ) :
  exception_pyType_ ( exception_pyType )
{ }


template <class ExceptionType>
void pycomp7::ExceptionTranslator<ExceptionType>::operator() ( const ExceptionType& e ) const
{
  namespace bpy = boost::python;
  bpy::object pyException ( bpy::handle<> ( bpy::borrowed ( exception_pyType_ ) ) );
  pyException.attr ( "what" ) = e.what();
  PyErr_SetObject ( exception_pyType_, pyException.ptr() );
}

#endif	/* _mp7_python_converters_h_ */


