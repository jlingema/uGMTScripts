#!/bin/env python

#import tca.gui.tcagui as tcagui

#from uhal.gui.guiloader import loader
#g = loader(False,[tcagui])
#g.start()

import wx
import gui.MP7Gui

import mp7
import uhal
import mp7tools.tester

uhal.setLogLevelTo(uhal.LogLevel.WARNING)
board = uhal.getDevice("MP7", "ipbusudp-2.0://192.168.0.128:50001", "file://../tests/etc/uhal/mp7_tmt/top.xml")

mp7test = mp7tools.tester.MP7Tester( board )

app = wx.App(redirect=False)   # Error messages go to popup window
top = gui.MP7Gui.Frame( mp7test, "MP7")
top.Show()
app.MainLoop()

