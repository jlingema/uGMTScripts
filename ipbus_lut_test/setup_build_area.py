#!/usr/bin/env python2.6

'''
Usage:

will come at some point


'''

from __future__ import print_function
import argparse
import sys
import os
import time
import shelve
import logging

#---
class DirSentry:

    def __init__(self, dir):
        if not os.path.exists(dir):
            raise RuntimeError('stocazzo '+dir)

        self._olddir = os.path.realpath(os.getcwd())

        os.chdir(dir)

    def __del__(self):
        os.chdir(self._olddir)

#---
class Plugin(object):

    def __init__(self, **kwargs):
        for k,v in kwargs.iteritems():
            # print(k,v)
            setattr(self,k,v)

    def execute():
        print('Nothing to execute')

#---
class SvnPlugin(Plugin):
    _log = logging.getLogger(__name__)

    def __init__(self,**kwargs):
        super(SvnPlugin,self).__init__(**kwargs)

    def _checkOutCactus(self,svnpath):
        from os.path import exists,join
        if ( exists(self.cactusRoot) and exists(join(self.cactusRoot,'.svn'))):
            print(self.cactusRoot,'already exists. Will use it')
            return
        cmd = 'svn co --depth=empty %s' % svnpath
        if self.prefix:
            cmd+=' '+self.cactusRoot

        self._log.info('Command:',cmd)
        os.system( cmd )

    def _rebuildEmpty(self, tag):
        tokens = [ d for d in tag.split('/') if d ]

        partials =  [ '/'.join(tokens[:i+1]) for i,_ in enumerate(tokens) ]

        for s in partials:
            cmd = 'svn up --depth=empty %s' % s
            print('Command:',cmd)
            os.system( cmd )

    def _fetchFolder(self, folder):
        # go to the tag directory
        sentry = DirSentry(self.cactusRoot)

        # sanitize the foldername
        if folder[-1]=='/': folder = folder[:-1]

        # rebuild the underlying structure if necessary
        parent = os.path.dirname(folder)
        if parent:
            self._rebuildEmpty(parent)

        # finally fethch the full folder
        cmd = 'svn up %s' % folder
        print('Command:',cmd)
        os.system(cmd)

    def _checkPath(self, svnurl ):
        # attempt an svn ls
        retval = os.system('svn ls --depth=empty '+svnurl)

        # and throw if it fails
        if retval:
            raise RuntimeError(svnurl+' does not exists')

#---
class CactusProjectFetcher(SvnPlugin):
    _log = logging.getLogger(__name__)

    @classmethod
    def addArguments(cls,subparsers,cmd):
        subp = subparsers.add_parser(cmd)
        subp.add_argument('project', help='project to checkout')
        subp.add_argument('--prefix',        help='checkout prefix', default='cactusupgrades')

    def __init__(self, **kwargs):
        super(CactusProjectFetcher,self).__init__(**kwargs)

        # make sure the prefix is well behaved
        if self.prefix[-1] == '/': self.prefix = self.prefix[:-1]

        self.cactusRoot = os.path.realpath(self.prefix)
        # self.tagRoot = os.path.join(self.cactusRoot, self.tag)

    def execute(self):
        import os

        if not os.path.exists(self.prefix):
            raise ValueError('Directory %s does not exist' % self.prefix)
        folders = ['projects/'+self.project]

        print('Retrieving:')
        print('\n'.join(folders))

        for f in folders:
            self._fetchFolder( f )

#---
class CactusDownloader(SvnPlugin):
    _log = logging.getLogger(__name__)

    @classmethod
    def addArguments(cls,subparsers,cmd):
        subp = subparsers.add_parser(cmd)
        subp.add_argument('tag',             help='tag to checkout', default='trunk')
        subp.add_argument('-u', '--user',    help='svn username', default=os.getlogin())
        subp.add_argument('-p', '--project', help='project to checkout')
        subp.add_argument('--prefix',        help='checkout prefix', default='cactusupgrades')

    def __init__(self, **kwargs):
        super(CactusDownloader,self).__init__(**kwargs)

        # make sure the prefix is well behaved
        if self.prefix[-1] == '/': self.prefix = self.prefix[:-1]

        self.cactusRoot = os.path.realpath(self.prefix)

    def execute(self):
        import os

        svnpath = 'svn+ssh://%s@svn.cern.ch/reps/cactus/%s/cactusupgrades' % (self.user,self.tag)

        print('Checking out tag',self.tag)
        self._checkPath(svnpath)
        self._checkOutCactus(svnpath)
        
        if self.project:
            folders = ['projects/'+self.project]
        else:
            folders = ['scripts','boards','components']

        print('Retrieving:')
        print('\n'.join(folders))

        for f in folders:
            self._fetchFolder( f )

#---
mkIseTemplate='''
BUILD_PROJECT:={REPLACE_BUILD_PROJECT}
TOPLVL:={REPLACE_TOPLVL}
CACTUS_ROOT:={CACTUS_ROOT}

# Derived paths
# UPGRADES_ROOT:=$(CACTUS_ROOT)/$(BUILD_TAG)/cactusupgrades
UPGRADES_ROOT:=$(CACTUS_ROOT)
DEPTREE:=$(CACTUS_ROOT)/scripts/firmware/dep_tree.py

# Define target filenames
PROJECTFILE:=$(TOPLVL).xise
BITFILE:=$(TOPLVL).bit
PACKAGEFILE:=$(TOPLVL).tgz

# Tcl commands
define TCL_BUILD_BITFILE
project open top
process run "Synthesize - XST"
process run "Translate"
process run "Map"
process run "Place & Route"
process run "Generate Programming File"
project close
exit
endef
export TCL_BUILD_BITFILE

define TCL_CLEAN_PROJECT
project open top
project clean
project close
exit
endef
export TCL_CLEAN_PROJECT

.PHONY: help project bitfile addrtab package clean cleanproject

help:
\t@echo "Please choose one of the following target: project bitfile addrtab package clean cleanproject"

$(BITFILE):
\t@echo "$$TCL_BUILD_BITFILE" > mkBitfile.tcl
\txtclsh mkBitfile.tcl

# $(BITFILE):
\t# @echo touching $(BITFILE) 
\t# @touch $(BITFILE)

$(PROJECTFILE):
\t@$(DEPTREE) -p x $(UPGRADES_ROOT) $(BUILD_PROJECT) > mkProject.tcl
\txtclsh mkProject.tcl

project: $(PROJECTFILE)

bitfile: $(BITFILE)

package: $(PACKAGEFILE)

addrtab:
\tmkdir -p addrtab
\t@$(DEPTREE) -p a $(UPGRADES_ROOT) $(BUILD_PROJECT) | xargs -tI: cp : addrtab

$(PACKAGEFILE): addrtab bitfile
\tmkdir -p pkg/src
\tcp $(BITFILE) pkg/src/
\tcp -a addrtab/ pkg/src/
\ttar cvfz pkg/$(PACKAGEFILE) -C pkg/src addrtab $(BITFILE)

clean:
\t@dir -1 | grep -v Makefile | xargs rm -rf

cleanproject:
\t@echo "$$TCL_CLEAN_PROJECT" > mkCleanProject.tcl
\txtclsh mkCleanProject.tcl
'''

envSimTemplate='''
#!/bin/bash
warning() {
    scriptname=$(basename $BASH_SOURCE)
    echo "Environment script example"
    echo "=========================="
    echo "The environement required by the simulation is system dependent."
    echo "${scriptname} is an example with all the necessary variables."
    echo "In order to run the simulation on your system, ${scriptname} must be customized to your Xilinx & Modelsim/Questasim installation."
    echo "Comment the line containing 'warning' in ${scriptname} to remove this message."
}

# Comment this line after customizing the environment
warning && return 1

# Check for Xilinx environment
if [ -z "$XILINX" ]; then
echo "No Xilinx, no party"
return
fi

# Path to modelsim executables
# export PATH=$PATH:/software/CAD/Mentor/2013_2014/Questa/HDS_2012.2b/questasim/bin

# This makes it go fast
export MTI_VCO_MODE=64

# Where to find the various libraries and headers
export MODELSIM_ROOT=/opt/mentor/modeltech/

# Location of pre-compiled Xilinx libraries
MODELSIM_IN_XILINX="mti_se/10.1b"
export ISE_VHDL_MTI="${XILINX}/vhdl/${MODELSIM_IN_XILINX}/lin64"
export ISE_VLOG_MTI="${XILINX}/verilog/${MODELSIM_IN_XILINX}/lin64"
'''

mkSimTemplate='''
BUILD_PROJECT:={REPLACE_BUILD_PROJECT}
TOPLVL:={REPLACE_TOPLVL}
CACTUS_ROOT:={CACTUS_ROOT}

# Derived paths
# UPGRADES_ROOT:=$(CACTUS_ROOT)/$(BUILD_TAG)/cactusupgrades
UPGRADES_ROOT:=$(CACTUS_ROOT)
DEPTREE:=$(CACTUS_ROOT)/scripts/firmware/dep_tree.py

.PHONY: help project fli _checkenv

help:
\t@echo "Please choose one of the following target: project bitfile addrtab package clean cleanproject"

project: _checkenv fli
\t$(DEPTREE) -p s $(UPGRADES_ROOT) $(BUILD_PROJECT) > mkProject.tcl
\tvsim -c -do "do mkProject.tcl; quit"

addrtab:
\tmkdir -p addrtab
\t@$(DEPTREE) -p a $(UPGRADES_ROOT) $(BUILD_PROJECT) | xargs -tI: cp : addrtab

fli: _checkenv mac_fli.so

mac_fli.so:
\trm -rf modelsim_fli
\tcp -a $(UPGRADES_ROOT)/components/ipbus_eth/firmware/sim/modelsim_fli ./
\tcd modelsim_fli && ./mac_fli_compile.sh
\tcp modelsim_fli/mac_fli.so .

_checkenv:
ifndef MODELSIM_ROOT
\t$(error MODELSIM_ROOT is not defined)
endif
ifndef ISE_VHDL_MTI
\t$(error ISE_VHDL_MTI is not defined)
endif
ifndef ISE_VLOG_MTI
\t$(error ISE_VLOG_MTI is not defined)
endif

clean:
\t@dir -1 | grep -v -e  '^\(Makefile\|env.sh\|env_example.sh\)' | xargs rm -rf
'''

class WorkareaBuilder(Plugin):
    _log = logging.getLogger(__name__)

    def __init__(self, **kwargs):
        super(WorkareaBuilder,self).__init__(**kwargs)

        if self.prefix[-1] == '/': self.prefix = self.prefix[:-1]
        if self.product not in self._prodmap:
            raise ValueError('product %s nor known. Allowed values are %s.' % (self.product,', '.join(self._prodmap)))


    @classmethod
    def addArguments(cls,subparsers,cmd):
        # parser_add = parser.add_subparsers(dest = 'cmd')
        subp = subparsers.add_parser(cmd)
        # subp.add_argument('tag',            help='tag to use in the build')
        subp.add_argument('project',        help='project to build')
#        subp.add_argument('top', nargs = '?', help = 'top level name')
        subp.add_argument('-p','--product', default='x', help='output product: x (ise project), x (modelsim simualtion)')
        subp.add_argument('-w','--workarea')
        subp.add_argument('--prefix',       help='checkout prefix', default='cactusupgrades')

    def _makeIseArea(self,workarea,env):
        from os.path import join

        self._log.info('Creating a new ISE area')
        try:
            os.makedirs(workarea)
        except:
            self._log.info('Directory %s exists' % workarea)

        # ISE: create makefile
        mkise=join(workarea,'Makefile')
        with open(mkise,'w') as f:
            f.write(
                mkIseTemplate.format(**env)
                )
            self._log.info('File %s created' % mkise)

    def _makeModelSimArea(self,workarea,env):
        from os.path import join

        self._log.info('Creating a new ModelSim area')
        try:
            os.makedirs(workarea)
        except:
            self._log.info('Directory %s exists' % workarea)

        # Modelsim: create environment file
        envsim=join(workarea,'env_example.sh')
        with open(envsim,'w') as f:
            f.write(
                envSimTemplate
                )
            self._log.info('File %s created' % envsim)

        # Modelsim: create makefile
        mksim = join(workarea,'Makefile')
        with open(mksim,'w') as f:
            f.write(
                mkSimTemplate.format(**env)
                )
            self._log.info('File %s created' % mksim)
    
    # product to method map
    _prodmap = {
        'x':_makeIseArea,
        's':_makeModelSimArea
    }


    def execute(self):
        from os.path import realpath,basename,dirname,join
        
        here = realpath(dirname(__file__))

        self._log.info('script path',here)
        self._log.info('Project:',self.project)

        # upgradespath=join(self.prefix,self.tag,'cactusupgrades')
        projectpath=join('projects',self.project)
        # fullpath=join(upgradespath,projectpath)
        # self._log.info(upgradespath, projectpath, fullpath)
        if not os.path.exists(self.prefix):
            raise RuntimeError('Project %s not found at %s' % (self.project, self.prefix) )

        workarea = self.workarea if self.workarea else basename(self.project)

        env = {
            'REPLACE_BUILD_PROJECT':projectpath,
            'REPLACE_TOPLVL':'top',
            'CACTUS_ROOT':realpath(self.prefix)
        }

        # fetch & execute the method corresponding to the product
        self._prodmap[self.product](self,workarea,env)

#---
class CliFactory(object):
    def __init__(self, plugins):
        self.parser = argparse.ArgumentParser(
            description='Assists in setting up a firmware build and simulation area',
            formatter_class=argparse.ArgumentDefaultsHelpFormatter
            )

        subparsers = self.parser.add_subparsers(dest = 'cmd')
        for cmd,cls in plugins.iteritems():
            cls.addArguments(subparsers,cmd)

        self._plugins = plugins
    
    def get(self):
        val = self.parser.parse_args()

        plugin_cls = self._plugins[val.cmd]

        plugin = plugin_cls(**vars(val))

        return plugin

if __name__ == '__main__':

    plugins = {
        'checkout' : CactusDownloader,
        'fetch'    : CactusProjectFetcher,
        'buildarea': WorkareaBuilder,
    }  

    cli_factory = CliFactory( plugins )
    plugin = cli_factory.get()

    plugin.execute()
