#!/bin/env python
"""
Usage: ipmi_helper.py --mch < MCH IP address > --slot <slot number> [--info] [--IP < new IP address >] [--MAC < new MAC address >] [--RARP] [--No-RARP] [--persistent] [--hard-reset]

This is a helper script to simplify IPMI access to the Imperial MMC in leiu of a full system manager

The following arguments are required:
   -m , --mch                  : The IP address of the MCH
   -s , --slot                 : The slot of the card you are accessing

The following arguments are optional:
   -i , --info                 : Retrieve the current network configuration of the card and the sensor data from the SDR
   -I , --IP                   : A new IP address for the card
   -M , --MAC                  : A new MAC address for the card
   -R , --RARP                 : Card should use RARP
   -N , --No-RARP              : Card should not use RARP
   -p , --persistent           : Write the new MAC/IP to flash
   --hard-reset                : Power-cycle the card
"""

import getopt, sys, re, subprocess


def run( instruction ):
  print( instruction )
  process = subprocess.Popen( instruction , stdout=subprocess.PIPE , stderr=subprocess.PIPE , shell=True )
  
  std_out , std_err = process.communicate()
  
  if process.returncode:
    if len( std_out ):
      print( "STD OUT: %s" % (std_out) )
    if len( std_err ):
      print( "STD ERR: %s" % (std_err) )
    raise Exception( "Subprocess returned %i" % (process.returncode) )
  
  return std_out , std_err


if __name__=="__main__":


    # Parse options
    try:
        opts, args = getopt.getopt(sys.argv[1:], "hm:s:iI:M:RNp", ["help", "mch=", "slot=", "info", "IP=", "MAC=", "RARP", "No-RARP", "persistent", "hard-reset"])
    except getopt.GetoptError, err:
        print __doc__
        sys.exit(2)

    mch = None
    slot = None
    info = False
    IP = None
    MAC = None
    RARP= None
    NoRARP= None
    persistent = False
    hardreset = False

    for opt, value in opts:
      if opt in ("-h", "--help"):
        print( __doc__ )
        sys.exit(0)
      elif opt in ("-m", "--mch"):
        mch = value
      elif opt in ("-s", "--slot"):
        slot = value
      elif opt in ("-i", "--info"):
        info = True
      elif opt in ("-I", "--IP"):
        IP = value
      elif opt in ("-M", "--MAC"):
        MAC = value
      elif opt in ("-R", "--RARP"):
        RARP = True
      elif opt in ("-N", "--No-RARP"):
        NoRARP = True
      elif opt in ("-p", "--persistent"):
        persistent = True
      elif opt in ("--hard-reset"):
        hardreset = True

    if len(args) != 0:
      print( "Incorrect usage! Unknown args: %s" % (", ".join(args)) )
      print(  __doc__ )
      sys.exit(1)

    if not mch or not slot:
      print( "Incorrect usage! --mch and --slot are required" )
      print( __doc__ )
      sys.exit(1)    


    if RARP and NoRARP:
      print( "RARP and No-RARP are mutually exclusive" )
      print( __doc__ )
      sys.exit(1)    


    ip_pattern = re.compile('[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+') 
    mac_pattern = re.compile('[0-9a-f]+:[0-9a-f]+:[0-9a-f]+:[0-9a-f]+:[0-9a-f]+:[0-9a-f]+') 

    if not ip_pattern.match( mch ):
      print( "Incorrect usage! --mch must provide a valid IP address" )
      print( __doc__ )
      sys.exit(1)    

    slot = int( slot )
    
    if slot < 1 or slot > 12:
      print( "Incorrect usage! --slot must refer to an a valid slot number (1-12)" )
      print( __doc__ )
      sys.exit(1)            

    slot_addr = hex( 0x70 + (2*slot) )
    sdr_addr = 0x60 + slot

    print( " --- // --- " )
    
# ----------------------------------------------------------------------------------------------------------------------------------------------------------
    if hardreset:
      yes = set(['yes','y'])
      no = set(['no','n'])
      print( "Are you sure you want to nuke your board? [y/n]" )
      while True:
        choice = raw_input().lower()
        if choice in yes:
          std_out , std_err = run( 'ipmitool -H %s -P "" -B 0 -T 0x82 -b 7 -t %s raw 0x30 0xFF 0xDE 0xAD' % ( mch , slot_addr ))
          print( "Successfully nuked the board" )
          print( " --- // --- " )
          break;
        elif choice in no:
          break
        else:
          sys.stdout.write("Please respond with 'yes' or 'no'")
   
    
    if info:
      std_out , std_err = run( 'ipmitool -H %s -P "" -B 0 -T 0x82 -b 7 -t %s raw 0x30 0x05' % ( mch , slot_addr ) )
      return_val = std_out.split()
      
      if len( return_val ) != 11:
        print( "ERROR Returned value does not conform to expected format" )
        sys.exit(1)  
      
      IP = ".".join( [ str(int(x , 16)) for x in return_val[0:4] ] )
      MAC = ":".join( return_val[4:10] )
      UseRARP =  bool( int(return_val[10], 16) )
            
      print( "IP %s" % ( IP ) )
      print( "MAC %s" % ( MAC ) )
      print( "RARP %s" % ( UseRARP ) )
      print( " --- // --- " )
      
      std_out , std_err = run( 'ipmitool -H %s -A none sdr entity 193.%i' % ( mch , sdr_addr ) )
      for s in std_out.split('\n'):
        if "Disabled" in s:
          print( '%s          [ Not necessarily "Disabled" ]' % s )
        else:
          print( s )
          
      print( " --- // --- " )
      
      sys.exit(0)

# ----------------------------------------------------------------------------------------------------------------------------------------------------------

    if IP:
      if not ip_pattern.match( IP ):
        print( "Incorrect usage! --IP must provide a valid IP address" )
        print( __doc__ )
        sys.exit(1)
      
      IP = [ hex(int(s)) for s in re.findall( r'\d+' , IP ) ]
      IP = " ".join( IP )
      
      std_out , std_err = run( 'ipmitool -H %s -P "" -B 0 -T 0x82 -b 7 -t %s raw 0x30 0x03 %s' %( mch , slot_addr , IP ) )
      print( "Successfully set the IP address (not committed to flash)" )
      print( " --- // --- " )

# ----------------------------------------------------------------------------------------------------------------------------------------------------------

    if MAC:
      if not mac_pattern.match( MAC ):
        print( "Incorrect usage! --MAC must provide a valid MAC address" )
        print( __doc__ )
        sys.exit(1)
      
      MAC = [ hex(int(s , 16)) for s in re.findall( r'[0-9a-f]+' , MAC ) ]
      MAC = " ".join( MAC )
      
      std_out , std_err = run( 'ipmitool -H %s -P "" -B 0 -T 0x82 -b 7 -t %s raw 0x30 0x02 %s' % ( mch , slot_addr , MAC ))
      print( "Successfully set the MAC address (not committed to flash)" )
      print( " --- // --- " )

# ----------------------------------------------------------------------------------------------------------------------------------------------------------

    if RARP:
      std_out , std_err = run( 'ipmitool -H %s -P "" -B 0 -T 0x82 -b 7 -t %s raw 0x30 0x04 0x01' % ( mch , slot_addr ))
      print( "Successfully set the board to use RARP (not committed to flash)" )
      print( " --- // --- " )
    elif NoRARP:
      std_out , std_err = run( 'ipmitool -H %s -P "" -B 0 -T 0x82 -b 7 -t %s raw 0x30 0x04 0x00' % ( mch , slot_addr ))
      print( "Successfully set the board to not use RARP (not committed to flash)" )
      print( " --- // --- " )      
# ----------------------------------------------------------------------------------------------------------------------------------------------------------
    
    if persistent:
      std_out , std_err = run( 'ipmitool -H %s -P "" -B 0 -T 0x82 -b 7 -t %s raw 0x30 0x01 0xFE 0xEF' % ( mch , slot_addr ))
      print( "Successfully committed to flash" )
      print( " --- // --- " )
      
# ----------------------------------------------------------------------------------------------------------------------------------------------------------

