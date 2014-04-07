#!/bin/bash

# output=${1:-text}
# echo $output


XDAQROOT=${XDAQROOT:-"/opt/xdaq"}
CACTUS_ROOT=${CACTUS_ROOT:-"/opt/cactus"}
#CACTUS_RPM_ROOT=${CACTUS_RPM_ROOT:-"$(BUILD_HOME)"}

CACTUS_PLATFORM=$(/usr/bin/python -c "import platform; print platform.platform()")

CACTUS_OS="unknown.os"
if   [[ "$CACTUS_PLATFORM" =~ "$redhat-5" ]]; then
	CACTUS_OS="slc5"
elif [[ "$CACTUS_PLATFORM" =~ "$redhat-6" ]]; then
	CACTUS_OS="slc6"
fi

PYTHON_INCLUDE_PREFIX=${PYTHON_INCLUDE_PREFIX:-$(python -c "import distutils.sysconfig;print distutils.sysconfig.get_python_inc()")}

export XDAQROOT CACTUS_ROOT CACTUS_OS PYTHON_INCLUDE_PREFIX

echo XDAQROOT=$XDAQROOT
echo CACTUS_ROOT=$CACTUS_ROOT
echo CACTUS_RPM_ROOT=$CACTUS_RPM_ROOT
echo CACTUS_OS=$CACTUS_OS
echo PYTHON_INCLUDE_PREFIX=$PYTHON_INCLUDE_PREFIX

