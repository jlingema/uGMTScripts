uGMTScripts
===========
Testing software for the CMS uGMT.

This repository contains a script collection for testing and configurating the uGMT. It is partly dependent on a setup of CMSSW and uhal.

Eventually the contents of this repository will be migrated to the official SVN cactus-repository.

## Structure
1. `ugmt_patterns` : Script selection for parsing and comparing HW and emulator response.
2. `lut_tests` : LUT content generation and configuration / testing.
3. `ucf_tests` : Testing of area-constraints.

## Instructions for setup
Checkout the repository and source the setup shell-script:
```
git clone https://github.com/jlingema/uGMTScripts.git
cd uGMTScripts
source setup.sh
```

## How to get comparisons of uGMT emulator and hardware responses
Currently the best description is available here:
https://docs.google.com/document/d/1xI5E4Q6c9itRWNWQLuvZzWbBLZcAaq23mFS8Hvlh1to/edit?usp=sharing

## Look-Up-Table configuration and testing:
### LUT file generation
The following should in general work. For more help see the `--help` option of the script:
```
cd uGMTScripts/lut_test/lut_configuration
python lut_file_generator.py data/lut_config.json
```

### Reading LUT configuration from MP7 / Writing LUT configuration to MP7
#### Reading:
**You'll need a working `uhal` environment for all of the following.**
The following commands can be used to inspect the contents of a LUT or register. Partial matches to `register_or_lut_name` will be inspected, too:
```
cd uGMTScripts/lut_test/read_write_tools
python inspect.py register_or_lut_name (--dryrun)
```
With the `dryrun` option no actual access to the hardware is needed. It will only inspect the address table node-tree for the specified registers / LUTs.

#### Writing:
To write new contents to a set of LUTs the following can be done. Also partial matches will be written to (**consider to do a dryrun first**). 
```
cd uGMTScripts/lut_test/read_write_tools
python write_multiple_luts.py lut_name --content generate://zero (--dryrun)
```
With the `dryrun` option no actual access to the hardware is needed. It will only show the LUTs that will be changed and the content that would be written if dryrun was omitted.
