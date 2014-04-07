import os
import sys
from distutils.core import setup

VERSION_STRING = ( os.environ['PACKAGE_VER_MAJOR'] + '.' + os.environ['PACKAGE_VER_MINOR'] + '.' + os.environ['PACKAGE_VER_PATCH'] )


setup(name = 'cactusboards-mp7-gui',
      version = VERSION_STRING,
      description = 'Python GUI for MP7 uHAL',
      author = 'Alessandro Thea',
      author_email = 'alessandro.thea@cern.ch',
      url = 'http://cactus.web.cern.ch/cactus',
      packages = ['mp7', 'mp7.gui'],
      )
