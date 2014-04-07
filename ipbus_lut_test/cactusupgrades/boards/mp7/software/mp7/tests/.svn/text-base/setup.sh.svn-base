function pathadd() {
  # TODO add check for empty path
  # and what happens if $1 == $2
  # Copy into temp variables
  PATH_NAME=$1
  PATH_VAL=${!1}
  if [[ ":$PATH_VAL:" != *":$2:"* ]]; then
    PATH_VAL="$2${PATH_VAL:+":$PATH_VAL"}"
    echo "- $1 += $2"

    # use eval to reset the target
    eval "$PATH_NAME=$PATH_VAL"
  fi

}

XDAQ_ROOT=/opt/xdaq
#XDAQ_OS=linux
#XDAQ_PLATFORM=$(${XDAQ_ROOT}/config/checktarget.sh)_$(${XDAQ_ROOT}/config/checkos.sh)
CACTUS_ROOT=/opt/cactus
MP7_TESTS=$( readlink -f $(dirname $BASH_SOURCE)/ )
MP7_ROOT=$( readlink -f ${MP7_TESTS}/.. )

# add to path
#PATH="${MP7_ROOT}/tests/scripts:${PATH}"
pathadd PATH "${MP7_ROOT}/tests/scripts"
pathadd PYTHONPATH "${MP7_ROOT}/tests/src/python"
pathadd LD_LIBRARY_PATH "${MP7_ROOT}/tests/lib"

# add python path
#PYTHONPATH="${MP7_ROOT}/pycomp7/pkg:${PYTHONPATH}:${MP7_ROOT}/tests/src/python"
pathadd PYTHONPATH "${MP7_ROOT}/pycomp7/pkg"

# add libary path
#LD_LIBRARY_PATH="${MP7_ROOT}/mp7/lib/${XDAQ_OS}/${XDAQ_PLATFORM}:${MP7_ROOT}/tests/lib:${CACTUS_ROOT}/lib:${XDAQ_ROOT}/lib:${LD_LIBRARY_PATH}"
#pathadd LD_LIBRARY_PATH "${MP7_ROOT}/mp7/lib/${XDAQ_OS}/${XDAQ_PLATFORM}"
pathadd LD_LIBRARY_PATH "${MP7_ROOT}/mp7/lib"
pathadd LD_LIBRARY_PATH "${CACTUS_ROOT}/lib"
pathadd LD_LIBRARY_PATH "${XDAQ_ROOT}/lib"


#export XDAQ_ROOT XDAQ_OS XDAQ_PLATFORM CACTUS_ROOT MP7_ROOT LD_LIBRARY_PATH PYTHONPATH
export XDAQ_ROOT CACTUS_ROOT MP7_TESTS MP7_ROOT LD_LIBRARY_PATH PYTHONPATH
