
BUILD_PROJECT:=projects/examples/mp7_690es
TOPLVL:=top
CACTUS_ROOT:=/home/scratch/vhdl/uGMT/dev/ipbus_lut_test/cactusupgrades

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
	@echo "Please choose one of the following target: project bitfile addrtab package clean cleanproject"

$(BITFILE):
	@echo "$$TCL_BUILD_BITFILE" > mkBitfile.tcl
	xtclsh mkBitfile.tcl

# $(BITFILE):
	# @echo touching $(BITFILE) 
	# @touch $(BITFILE)

$(PROJECTFILE):
	@$(DEPTREE) -p x $(UPGRADES_ROOT) $(BUILD_PROJECT) > mkProject.tcl
	xtclsh mkProject.tcl

project: $(PROJECTFILE)

bitfile: $(BITFILE)

package: $(PACKAGEFILE)

addrtab:
	mkdir -p addrtab
	@$(DEPTREE) -p a $(UPGRADES_ROOT) $(BUILD_PROJECT) | xargs -tI: cp : addrtab

$(PACKAGEFILE): addrtab bitfile
	mkdir -p pkg/src
	cp $(BITFILE) pkg/src/
	cp -a addrtab/ pkg/src/
	tar cvfz pkg/$(PACKAGEFILE) -C pkg/src addrtab $(BITFILE)

clean:
	@dir -1 | grep -v Makefile | xargs rm -rf

cleanproject:
	@echo "$$TCL_CLEAN_PROJECT" > mkCleanProject.tcl
	xtclsh mkCleanProject.tcl
