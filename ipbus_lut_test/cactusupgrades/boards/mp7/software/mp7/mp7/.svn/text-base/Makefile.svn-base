BUILD_HOME = $(shell pwd)/../../../../../..

-include $(BUILD_HOME)/config/Makefile.macros

# Project = boards
# Package = mp7/mp7
# PackagePath = $(CACTUS_RPM_ROOT)/$(Project)/${Package}
# Temporary fix while waiting for a proper placement
# PackagePath = $(CACTUS_RPM_ROOT)/$(Project)/${Package}
PackagePath = $(CACTUS_RPM_ROOT)/boards/mp7/software/mp7/mp7
PackageName = cactusboards-mp7-mp7

Packager = Alessandro Thea, Kristian Harder

PACKAGE_VER_MAJOR = 1
PACKAGE_VER_MINOR = 0
PACKAGE_VER_PATCH = 0
PACKAGE_RELEASE = 0

ifndef BUILD_VERSION
BUILD_VERSION=1
endif

LIBRARY = lib/libcactus_mp7_mp7.so

# SOURCES = $(wildcard src/common/*.cpp)
SOURCES = \
	CtrlNode.cpp \
	DatapathNode.cpp \
	DemuxNode.cpp \
	Firmware.cpp \
	GTHQuadNode.cpp \
	GTXQuadNode.cpp \
	MGTAlignmentNode.cpp \
	MGTBufferNode.cpp \
	MP7690Driver.cpp \
	MmcPipeInterface.cpp \
	OpenCoresI2C.cpp \
	PPRamNode.cpp \
	SI5326Node.cpp \
	TTCNode.cpp \
	XpointNode.cpp \
	helpers.cpp \


SOURCE_FILES = $(addprefix src/common/,${SOURCES})
OBJECT_FILES = $(patsubst src/common/%.cpp,obj/%.o,${SOURCE_FILES})



ifdef EXTERN_BOOST_INCLUDE_PREFIX
# When compiling with the cactus makefile
INCLUDE_PATH = 	-Iinclude  \
		-I${UHAL_GRAMMARS_INCLUDE_PREFIX} \
		-I${UHAL_LOG_INCLUDE_PREFIX} \
		-I${UHAL_UHAL_INCLUDE_PREFIX} \
		-I${EXTERN_PUGIXML_INCLUDE_PREFIX} \
		-I${EXTERN_BOOST_INCLUDE_PREFIX} \
		-I$(CACTUS_ROOT)/include 

LIBRARY_PATH = \
	-L${EXTERN_PUGIXML_LIB_PREFIX} \
	-L${EXTERN_BOOST_LIB_PREFIX} \
	-L${UHAL_GRAMMARS_LIB_PREFIX} \
	-L${UHAL_LOG_LIB_PREFIX} \
	-L${UHAL_UHAL_LIB_PREFIX} \
	-L$(CACTUS_ROOT)/lib 
else
# When compiling standalone
INCLUDE_PATH = 	-Iinclude  \
		-I$(CACTUS_ROOT)/include 

LIBRARY_PATH = \
	-L$(CACTUS_ROOT)/lib 
endif

LIBRARIES = \
	-lboost_system \
  -lboost_date_time \
	-lcactus_uhal_grammars \
	-lcactus_uhal_log \
	-lcactus_uhal_uhal	


CPP_FLAGS = -g -O0 -rdynamic -Wall -MMD -MP -fPIC ${INCLUDE_PATH} #\
					 #-DDISABLE_PACKET_COUNTER_HACK\
					 #-DRUN_ASIO_MULTITHREADED 
#					 -DNO_PREEMPTIVE_DISPATCH 
#-D THROW_ON_ADDRESS_SPACE_OVERLAP 

LINK_FLAGS = -g -shared -fPIC -Wall -O0 -rdynamic ${LIBRARY_PATH} ${LIBRARIES}

RPMBUILD_DIR = ${PackagePath}/RPMBUILD

.PHONY: all _all clean _cleanall build _buildall install _installall rpm _rpmall test _testall

default: build
clean: _cleanall
_cleanall:
	rm -rf ${RPMBUILD_DIR}
	rm -rf obj
	rm -rf lib

all: _all
build: _all
buildall: _all
_all: ${LIBRARY}


${LIBRARY}: ${OBJECT_FILES}
	g++ ${LINK_FLAGS} ${OBJECT_FILES} -o $@

${OBJECT_FILES}: obj/%.o : src/common/%.cpp 
	mkdir -p {lib,obj}
	g++ ${CPP_FLAGS} -c $< -o $@

-include $(OBJECT_FILES:.o=.d)

rpm: _rpmall
_rpmall: 
	mkdir -p ${RPMBUILD_DIR}/{RPMS/{i386,i586,i686,x86_64},SPECS,BUILD,SOURCE_FILES,SRPMS}
	mkdir -p ${RPMBUILD_DIR}/SOURCE_FILES/{lib,include/mp7}
	cp -p lib/*.so ${RPMBUILD_DIR}/SOURCE_FILES/lib/.
	cp -p include/mp7/*.hpp ${RPMBUILD_DIR}/SOURCE_FILES/include/mp7/.
	rpmbuild -bb -bl --buildroot=${RPMBUILD_DIR}/BUILD						\
			--define  "_topdir ${RPMBUILD_DIR}"						\
			--define "_prefix ${CACTUS_ROOT}"							\
			--define "sources_dir ${RPMBUILD_DIR}/SOURCE_FILES"					\
			--define "name ${PackageName}"								\
			--define "version ${PACKAGE_VER_MAJOR}.${PACKAGE_VER_MINOR}.${PACKAGE_VER_PATCH}"	\
			--define "release ${PACKAGE_RELEASE}.${CACTUS_OS}"							\
			--define "packager ${Packager}"								\
			${PackageName}.spec

