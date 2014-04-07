
import os, sys
from distutils.core import setup
from os.path import join

PYCOMP7_VERSION = (os.environ['PACKAGE_VER_MAJOR']+'.'+os.environ['PACKAGE_VER_MINOR']+'.'+os.environ['PACKAGE_VER_PATCH'])

setup(name='cactusboards-mp7-pycomp7',
      version = PYCOMP7_VERSION,
      description = 'Python bindings for the CACTUS MP7 libraries.',
      author = 'Alessandro Thea',
      author_email = 'Alessandro.Thea@cern.ch',
      url = 'http://cactus.web.cern.ch/cactus',

      packages = ['mp7'],
      package_dir = {'' : 'pkg'},
      package_data = {'mp7' : ['*.so']}

 )

