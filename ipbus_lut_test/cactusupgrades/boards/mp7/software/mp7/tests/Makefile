BUILD_HOME = $(shell pwd)/../../../../../..

-include $(BUILD_HOME)/config/Makefile.macros

# Project = cactusprojects
# Package = mp7/tests
# PackagePath = $(CACTUS_RPM_ROOT)/$(Project)/${Package}
# PackageName = cactuscore-mp7-tests
PackagePath = $(CACTUS_RPM_ROOT)/boards/mp7/software/mp7/tests
PackageName = cactusboards-mp7-tests

Packager = Alessandro Thea, Kristian Harder

PACKAGE_VER_MAJOR = 1
PACKAGE_VER_MINOR = 0
PACKAGE_VER_PATCH = 1
PACKAGE_RELEASE = 0

LIBRARY = lib/libcactus_mp7_tests.so
LIBRARY_SOURCES = $(wildcard src/common/*.cpp)
LIBRARY_OBJECT_FILES = $(patsubst src/common/%.cpp,obj/%.o,${LIBRARY_SOURCES})

EXECUTABLE_SOURCES = $(wildcard src/common/*.cxx)
EXECUTABLE_OBJECT_FILES = $(patsubst src/common/%.cxx,obj/%.o,${EXECUTABLE_SOURCES})
EXECUTABLES = $(patsubst src/common/%.cxx,bin/%.exe,${EXECUTABLE_SOURCES})

ifdef EXTERN_BOOST_INCLUDE_PREFIX
# When compiling with the cactus makefile
MP7_MP7_PREFIX=${BUILD_HOME}/boards/mp7/software/mp7/mp7/
MP7_MP7_INCLUDE_PREFIX = ${MP7_MP7_PREFIX}/include
MP7_MP7_LIB_PREFIX = ${MP7_MP7_PREFIX}/lib/

LIBRARY_PATH = 	\
		-L${EXTERN_BOOST_LIB_PREFIX} \
		-L${EXTERN_PUGIXML_LIB_PREFIX} \
		-L${UHAL_LOG_LIB_PREFIX} \
		-L${UHAL_GRAMMARS_LIB_PREFIX} \
		-L${UHAL_UHAL_LIB_PREFIX} \
		-Llib \
		-L${MP7_MP7_LIB_PREFIX} \
		-L${XDAQ_ROOT}/lib \
		-L${CACTUS_ROOT}/lib

INCLUDE_PATH = 	\
		-Iinclude  \
		-I${UHAL_LOG_INCLUDE_PREFIX} \
		-I${UHAL_GRAMMARS_INCLUDE_PREFIX} \
		-I${EXTERN_BOOST_INCLUDE_PREFIX} \
		-I${EXTERN_PUGIXML_INCLUDE_PREFIX} \
		-I${UHAL_UHAL_INCLUDE_PREFIX} \
		-I${MP7_MP7_INCLUDE_PREFIX} \
		-I${CACTUS_ROOT}/include
else
# When compiling standalone
MP7_MP7_PREFIX=../mp7/
MP7_MP7_INCLUDE_PREFIX = ${MP7_MP7_PREFIX}/include
MP7_MP7_LIB_PREFIX = ${MP7_MP7_PREFIX}/lib/

LIBRARY_PATH = 	\
		-Llib \
		-L${MP7_MP7_LIB_PREFIX} \
		-L${XDAQ_ROOT}/lib \
		-L${CACTUS_ROOT}/lib

INCLUDE_PATH = 	-Iinclude  \
		-I${MP7_MP7_INCLUDE_PREFIX} \
		-I${CACTUS_ROOT}/include
endif

LIBRARIES = 	\
		-lpthread \
		\
		-lboost_thread \
		-lboost_filesystem \
		-lboost_regex \
		-lboost_system \
		-lboost_thread \
		-lboost_program_options \
		\
		-lcactus_extern_pugixml \
		-lcactus_uhal_log \
		-lcactus_uhal_grammars \
		-lcactus_uhal_uhal 

EXECUTABLE_LIBRARIES = ${LIBRARIES} -lcactus_mp7_mp7 -lcactus_mp7_tests



CPP_FLAGS = -g -Wall -O0 -rdynamic -MMD -MP -fPIC ${INCLUDE_PATH} -DBIG_ENDIAN_HACK

LINK_LIBRARY_FLAGS = -shared -fPIC -Wall -g -O0 -rdynamic ${LIBRARY_PATH} ${LIBRARIES}

LINK_EXECUTABLE_FLAGS = -Wall -g -O0 -rdynamic ${LIBRARY_PATH} ${EXECUTABLE_LIBRARIES} 

RPMBUILD_DIR = ${PackagePath}/RPMBUILD

.PHONY: all _all clean _cleanall build _buildall install _installall rpm _rpmall test _testall spec_update

default: build

clean: _cleanall
_cleanall:
	rm -rf ${RPMBUILD_DIR}
	rm -rf obj
	rm -rf bin
	rm -rf lib

all: _all
build: _all
buildall: _all
_all: ${LIBRARY} ${EXECUTABLES}


${EXECUTABLES}: bin/%.exe: obj/%.o ${EXECUTABLE_OBJECT_FILES}
	g++ ${LINK_EXECUTABLE_FLAGS} $< -o $@

${EXECUTABLE_OBJECT_FILES}: obj/%.o : src/common/%.cxx
	mkdir -p {bin,obj,lib}
	g++ -c ${CPP_FLAGS}  $< -o $@

-include $(EXECUTABLE_OBJECT_FILES:.o=.d)

${LIBRARY}: ${LIBRARY_OBJECT_FILES}
	g++ ${LINK_LIBRARY_FLAGS} ${LIBRARY_OBJECT_FILES} -o $@

${LIBRARY_OBJECT_FILES}: obj/%.o : src/common/%.cpp 
	mkdir -p {bin,obj,lib}
	g++ -c ${CPP_FLAGS} $< -o $@

-include $(LIBRARY_OBJECT_FILES:.o=.d)

rpm: _rpmall
_rpmall: 
	mkdir -p ${RPMBUILD_DIR}/{RPMS/{i386,i586,i686,x86_64},SPECS,BUILD,SOURCES,SRPMS}
	mkdir -p ${RPMBUILD_DIR}/SOURCES/{bin/${Package},lib,include/${Package},etc/${Package}}
	#cp -p include/${Package}/*.hpp ${RPMBUILD_DIR}/SOURCES/include/${Package}/.
	cp -p bin/*.exe ${RPMBUILD_DIR}/SOURCES/bin/${Package}/.
	cp -p scripts/*.py ${RPMBUILD_DIR}/SOURCES/bin/${Package}/.
	#cp -p src/python/* ${RPMBUILD_DIR}/SOURCES/bin/${Package}/.
	cp -p lib/*.so ${RPMBUILD_DIR}/SOURCES/lib/.
	#cp -p src/python/* ${RPMBUILD_DIR}/SOURCES/.
	#cp -p etc/${Package}/*.xml ${RPMBUILD_DIR}/SOURCES/etc/${Package}
	rpmbuild -bb -bl --buildroot=${RPMBUILD_DIR}/BUILD						\
			--define  "_topdir ${RPMBUILD_DIR}"						\
			--define "_prefix ${CACTUS_ROOT}"							\
			--define "sources_dir ${RPMBUILD_DIR}/SOURCES"					\
			--define "name ${PackageName}"								\
			--define "version ${PACKAGE_VER_MAJOR}.${PACKAGE_VER_MINOR}.${PACKAGE_VER_PATCH}"	\
			--define "release ${PACKAGE_RELEASE}.${CACTUS_OS}"							\
			--define "packager ${Packager}"								\
			${PackageName}.spec

