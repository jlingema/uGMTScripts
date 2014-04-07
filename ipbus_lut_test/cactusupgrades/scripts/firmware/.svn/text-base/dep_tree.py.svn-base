#!/usr/bin/env python2.6

'''
Usage:

dep_tree.py [-h] [-v] [-p P] [-m component_map]
                   repos_root top_dir [top_depfile]

Parse design dependency tree and generate build scripts and other useful files

positional arguments:
  repos_root        repository root
  top_dir           top level design directory
  top_depfile       top level dep file

optional arguments:
  -h, --help        show this help message and exit
  -v                verbosity
  -p P              output product: x (xtclsh script); s (Modelsim script); c
                    (component list}; a (address table list); b (address
                    decoder script); f (flat file list)
  -m component_map  location of component map file
  
  default: nothing is done
  
---

Repository layout in each component / top-level area:

firmware/cfg: contains .dep files and project config files
firmware/hdl: contains source files
firmware/cgn: contains XCO core build files
/addr_table: contains uHAL address table XML files

---

.dep file format

# Comment line

common options:

    -c component_name: look under different component to find referenced file 
    -d: descend a level in dir tree to find referenced file
    -s dir: look in subdir path to find referenced file

include [dep_file_list]

    default is to take file component_name.dep
    
setup [tcl_file_list]

    default is to take file component_name.tcl

src [-l library] [-g] [-n] src_file_list

    src_file_list under firmware/hdl by default; may contain glob patterns
    -g: find 'generated' src in ipcore directory
    -n: for XCO files, build but don't include 

addrtab [-t] [file_list]

    default is to reference file component_name.xml
    -i: top-level address table file

---

component_map file format

logical_name physical_dir

    The 'physical_dir' is relative to the trunk/

'''

from __future__ import print_function
import argparse
import sys
import os
import time

class Cparser(object):
    
    def __init__(self):
        parser = argparse.ArgumentParser(description = "Parse design dependency tree and generate build scripts and other useful files")
        parser.add_argument("-v", action = "count", help = "verbosity")
        parser.add_argument("-p", help = "output product: x (xtclsh script); s (Modelsim script); c (component list}; a (address table list); b (address decoder script); f (flat file list)")
        parser.add_argument("-m", type = file, metavar = "component_map", help = "location of component map file")
        parser.add_argument("root", metavar = "repos_root", help = "repository root")
        parser.add_argument("top", metavar = "top_dir", help = "top level design directory")
        parser.add_argument("dep", nargs = "?", metavar = "top_depfile", help = "top level dep file", default = "top.dep")
        self.val = parser.parse_args()

class Depfile_parser(object):

    def __init__(self, args, p):
        self.args = args
        self.p = p
        self.depth = 0
        self.complist = list()
        
        parser = argparse.ArgumentParser(usage = argparse.SUPPRESS)
        parser_add = parser.add_subparsers(dest = "cmd")
        subp = parser_add.add_parser("include")
        subp.add_argument("-c")
        subp.add_argument("-d", action = "count")
        subp.add_argument("-s")
        subp.add_argument("file", nargs = "*")
        subp = parser_add.add_parser("setup")
        subp.add_argument("-c")
        subp.add_argument("-d", action = "count")
        subp.add_argument("-z", action = "store_true")
        subp.add_argument("-s")
        subp.add_argument("file", nargs = "*")
        subp = parser_add.add_parser("src")
        subp.add_argument("-c")
        subp.add_argument("-l")
        subp.add_argument("-g", action = "store_true")
        subp.add_argument("-n", action = "store_true")
        subp.add_argument("-d", action = "count")
        subp.add_argument("-s")
        subp.add_argument("file", nargs = "+")
        subp = parser_add.add_parser("addrtab")
        subp.add_argument("-c")
        subp.add_argument("-d", action = "count")
        subp.add_argument("-s")
        subp.add_argument("-t", action = "store_true")
        subp.add_argument("file", nargs = "*")
        self.pfunc = parser.parse_args

    def parse(self, depfile, comp):
        
        self.depth += 1
        dfile = open(depfile)
        cmdlist = list()
        for l in dfile:

            s = l.strip()
            if s == "" or s[0] == "#": continue     
            cmds = self.pfunc(s.split())

            if cmds.c is None:
                lcomp = comp        
            else:
                lcomp = cmds.c
                if lcomp not in self.complist: self.complist.append(lcomp)

            if not cmds.file:
                cn = lcomp.split('/')[-1]
                files = [self.p.getdefname(cmds.cmd, cn)]
            else:
                files = cmds.file

            if self.args.v > 1: print("***", cmds, lcomp, files)
            
            for f in files:
                
                if 'g' in cmds and cmds.g:
                    fp = self.p.getrelpath("ipcore_dir", f, cmds.s)
                else:
                    fp = self.p.getpath(lcomp, cmds.cmd, f, descend = cmds.d, subdir = cmds.s)

                if self.args.v > 0: print("    " * self.depth, cmds.cmd, f, fp, os.path.exists(fp))

                if cmds.cmd == "include":
                    cmdlist.extend(self.parse(fp, lcomp))
                else:
                    cmdlist.append((cmds.cmd, fp, cmds, lcomp))

        dfile.close()
        self.depth -= 1
        return cmdlist
        
    def getcomplist(self):
        
        clist = list()
        for i in self.complist:
            clist.append(self.p.getpath(i))
        return clist
                
class Pathmaker(object):
    
    fpaths = {"src": "firmware/hdl", "include": "firmware/cfg", "addrtab": "addr_table", "setup": "firmware/cfg"}
    fexts = {"src": ".vhd", "include": ".dep", "addrtab": ".xml", "setup": ".tcl"}
    
    def __init__(self, root, mapfile, verbosity):
        self.root = root
        self.verbosity = verbosity
        if self.verbosity > 2: print("+++ Pathmaker init", root, top, mapfile)
        if mapfile is None:
            self.cmap = None
        else:
            self.cmap = dict()
            for l in mapfile:
                s = l.strip()
                if s == "" or s[0] == "#": continue
                t = s.split()
                self.cmap[t[0]] = t[1]
            mapfile.close()
            
    def getcomppath(self, cname):
        if cname == "ipcore_dir":
            return "ipcore_dir"
        if self.cmap is None:
            return cname
        else:
            return cmap[cname]
            
    def getdefname(self, kind, name):
        return name + self.fexts[kind]
    
    def getpath(self, comp, kind = None, name = None, defext = False, descend = None, subdir = None):
        path = self.root.split('/')
        path.extend(self.getcomppath(comp).split('/'))
        if kind is not None: path.extend(self.fpaths[kind].split('/'))
        if descend is not None: del path[-descend: ]
        if subdir is not None: path.extend(subdir.split('/'))
        if name is not None: path.append(self.getdefname(kind, name) if defext else name)
        if self.verbosity > 2: print("+++ Pathmaker", comp, kind, name, defext, descend, subdir, path)
        return '/'.join(path)
        
    def getrelpath(self, loc, name, subdir = None):
        path = loc.split('/')
        if subdir is not None: path.extend(subdir.split('/'))
        path.append(name)
        return '/'.join(path)

def main():

    # Set up globals
    
    args = Cparser().val
    p = Pathmaker(args.root, args.m, args.v)
    d = Depfile_parser(args, p)
    ftop = p.getpath(args.top, "include", args.dep)
    if args.v > 0: print("Top:", ftop, file = sys.stderr)
    
    # Parse dep tree and sort files
    
    f = d.parse(ftop, args.top)
    flist = {"setup": [], "src": [], "addrtab": []}
    fflags = {}
    libs = list()
    cgpfile = None
    
    for i in f:
        t = i[0]
        if 'l' in i[2] and i[2].l is not None:
            lib = i[2].l
            libs.append(lib)
        else:
            lib = None
        j = (i[1], lib)
        if j in flist[t]: del(flist[t][flist[t].index(j)])
        if t == "setup" and 'z' in i[2] and i[2].z:
            cgpfile = i[1]
        else:
            flist[t].append(j)
        fflags[j] = (not i[2].n if 'n' in i[2] else True, i[2].t if 't' in i[2] else False, i[3])
    
    # Output - file lists
    
    if args.p == 'c':
        for i in d.getcomplist():
            print(i)
            
    elif args.p == 'f':
        for i in flist["src"]:
            if fflags[i][0]:
                print(i[0])
    
    elif args.p == 'a':
        for i in flist["addrtab"]:
            print(i[0])
    
    # Output - address table generator file
    
    elif args.p == 'b':
        
        print("# Autogenerated project build script")
        print("#", time.strftime("%c"))
        print()
        for i in flist["addrtab"]:
            if fflags[i][1]:
                n = os.path.basename(i[0])
                print("gen_ipbus_addr_decode", n)
                b = "ipbus_decode_" + os.path.splitext(n)[0] + ".vhd"
                print("cp " + b + " " + p.getpath(fflags[i][2], "src", b))
        
    # Output - Modelsim script
    
    elif args.p == 's':

        print("# Autogenerated project build script")
        print("#", time.strftime("%c"))
        print()
        for i in flist["setup"]:
            print("source " + i[0])
        print("vlib work")
        if libs:
            for i in libs:
                print("vlib " + i)
        for i in reversed(flist["src"]):
            if fflags[i][0]:
                (base, ext) = os.path.splitext(i[0])
                if ext == ".xco":
                    f = base + ".vhd"
                else:
                    f = i[0]
                if os.path.splitext(f)[1] == ".vhd":
                    cmd = "vcom"
                elif os.path.splitext(f)[1] == ".v":
                    cmd = "vlog"
                else:
                    raise SystemExit("Unknown source file type in Modelsim build: " + i[0])
                if i[1]: cmd = cmd + " -work " + i[1]
                print(cmd + " " + f)

    # Output - xtclsh script
    
    elif args.p == 'x':
    
        print("# Autogenerated project build script")
        print("#", time.strftime("%c"))
        print()
        print("project new top")
        for i in flist["setup"]:
            print("source " + i[0])
        if libs:
            for i in libs:
                print("lib_vhdl new " + i)
        for i in reversed(flist["src"]):
            if os.path.splitext(i[0])[1] == ".xco":
                    if not cgpfile:
                        raise SystemExit("No CGP file found in design")
                    print("exec mkdir -p ipcore_dir")
                    print("exec cp " + cgpfile + " ipcore_dir")
                    print("exec cp " + i[0] + " ipcore_dir")
                    print("cd ipcore_dir")
                    print("exec coregen -r -b " + os.path.basename(i[0]) + " -p coregen.cgp >& coregen.out")
                    print("cd ..")
                    f = "ipcore_dir/" + os.path.basename(i[0])
            else:
                f = i[0]
            if fflags[i][0]:
                if i[1] is None:
                    print("xfile add " + f)
                else:
                    print("xfile add " + f + " -lib_vhdl " + i[1] + " -include_global")
        print("project set top rtl top")
        print("project close")
        
    raise SystemExit(0)

if __name__ == '__main__':
    main()

