#include "mp7/python/converters_exceptions.hpp"
#include "mp7/exception.hpp"

// C++ Headers
#include <utility>

// MP7 Headers
#include "mp7/CtrlNode.hpp"

namespace bpy = boost::python;

//----------------------------------------------//
// --- Converter_pair_uint32_bool_from_tuple ---//
//----------------------------------------------//

void* pycomp7::Converter_pair_uint32_bool_from_tuple::convertible ( PyObject* obj_ptr )
{
  if ( !PyTuple_Check ( obj_ptr ) )
  {
    return 0;
  }
  else
  {
    return obj_ptr;
  }
}

void pycomp7::Converter_pair_uint32_bool_from_tuple::construct ( PyObject* obj_ptr, bpy::converter::rvalue_from_python_stage1_data* data )
{
  // Grab pointer to memory in which to construct the new vector
  void* storage = ( ( bpy::converter::rvalue_from_python_storage < std::pair<uint32_t, bool> >* ) data )->storage.bytes;
  // Grab list object from obj_ptr
  bpy::tuple py_tuple ( bpy::handle<> ( bpy::borrowed ( obj_ptr ) ) );
  // Construct vector in requested location, and set element values.
  // boost::python::extract will throw appropriate exception if can't convert to type T ; boost::python will then call delete itself as well.
  std::pair<uint32_t, bool>* pair_ptr = new ( storage ) std::pair<uint32_t, bool> ();
  pair_ptr->first  = bpy::extract<uint32_t> ( py_tuple[0] );
  pair_ptr->second = bpy::extract<bool> ( py_tuple[1] );
  // If successful, then register memory chunk pointer for later use by boost.python
  data->convertible = storage;
}

void
pycomp7::register_converters()
{
  /*
   * Register the following converters:
   *
   * list <=> std::vector<bool>
   *
   * list <=> std::vector<uint64_t>
   *
   * tuple <=> std::pair<uit32_t, bool>
   *
   * list <=> std::vector< std::pair<uit32_t, bool> >
   *
   * std::map<std::string, uint32_t> => dict
   *
   * boost::unordered_map<std::string, std::string> => dict
   *
   * list <=> std::vector<mp7::ValidData>
   *
   * Already registered by uhal
   *
   * list <=> std::vector<uint32_t>
   *
   */
  //  bpy::to_python_converter< std::vector<std::string>, pycomp7::Converter_std_vector_to_list<std::string> >();
  // std::vector<bool>
  Converter_std_vector_from_list<bool>();
  bpy::to_python_converter< std::vector<bool>, pycomp7::Converter_std_vector_to_list<bool> >();
  // it's already in uhal, isn't it?!?
  //  Converter_std_vector_from_list<uint32_t>();
  //  bpy::to_python_converter< std::vector<uint32_t>, pycomp7::Converter_std_vector_to_list<uint32_t> >();
  // std::vector<uint64_t>
  Converter_std_vector_from_list<uint64_t>();
  bpy::to_python_converter< std::vector<uint64_t>, pycomp7::Converter_std_vector_to_list<uint64_t> >();
  // std::pair<uint32_t, bool>
  Converter_pair_uint32_bool_from_tuple();
  bpy::to_python_converter < std::pair<uint32_t, bool>, PairToTupleConverter<uint32_t, bool> >();
  // std::vector < std::pair<uint32_t, bool> >
  Converter_std_vector_from_list< std::pair<uint32_t, bool> >();
  bpy::to_python_converter < std::vector < std::pair<uint32_t, bool> >, pycomp7::Converter_std_vector_to_list < std::pair<uint32_t, bool> > >();
  // std::map<std::string, uint32_t>
  bpy::to_python_converter< std::map<std::string, uint32_t>, pycomp7::Converter_std_map_to_dict<std::string,uint32_t> >();
  // std::map<std::string, uint32_t>
  bpy::to_python_converter< std::map<uint32_t, uint32_t>, pycomp7::Converter_std_map_to_dict<uint32_t,uint32_t> >();
  // boost::unordered_map<std::string, uint32_t>
  //bpy::to_python_converter< boost::unordered_map<std::string, std::string>, pycomp7::Converter_boost_unorderedmap_to_dict<std::string,std::string> >();
}

// TODO: Copied from pycohal converters_exceptions.cpp. Should use that instead
PyObject* pycomp7::create_exception_class ( const std::string& excName, PyObject* baseTypeObj )
{
  std::string scopeName = bpy::extract<std::string> ( bpy::scope().attr ( "__name__" ) );
  std::string qualifiedExcName = scopeName + "." + excName;
  PyObject* typeObj = PyErr_NewException ( const_cast<char*> ( qualifiedExcName.c_str() ) , baseTypeObj, 0 );

  if ( !typeObj )
  {
    bpy::throw_error_already_set();
  }

  bpy::scope().attr ( excName.c_str() ) = bpy::handle<> ( bpy::borrowed ( typeObj ) );
  return typeObj;
}


void pycomp7::wrap_exceptions()
{
  // Base uhal exception (fallback for derived exceptions not wrapped)
  PyObject* base_mp7_exception_pyType = pycomp7::create_exception_class ( "exception" );
  bpy::register_exception_translator<uhal::exception::exception> ( pycomp7::ExceptionTranslator<uhal::exception::exception> ( base_mp7_exception_pyType ) );
  // Derived uhal exceptions
  pycomp7::wrap_derived_exception<mp7::exception::Clock40LockFailed> ( "Clock40LockFailed", base_mp7_exception_pyType );
  pycomp7::wrap_derived_exception<mp7::exception::XpointConfigTimeout> ( "XpointConfigTimeout", base_mp7_exception_pyType );
  pycomp7::wrap_derived_exception<mp7::exception::SI5326ConfigurationTimeout> ( "SI5326ConfigurationTimeout", base_mp7_exception_pyType );
  pycomp7::wrap_derived_exception<mp7::exception::BC0LockFailed> ( "BC0LockFailed", base_mp7_exception_pyType );
  pycomp7::wrap_derived_exception<mp7::exception::TTCFrequencyInvalid> ( "TTCFrequencyInvalid", base_mp7_exception_pyType );
  pycomp7::wrap_derived_exception<mp7::exception::BufferLockFailed> ( "BufferLockFailed", base_mp7_exception_pyType );
}

