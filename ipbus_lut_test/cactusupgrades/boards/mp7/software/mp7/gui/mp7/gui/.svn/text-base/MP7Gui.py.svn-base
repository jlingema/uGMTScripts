import wx, wx.html, wx.lib.masked
import sys
import logging
import utils

import  wx.lib.newevent

aboutText = """<p>MP7 Gui v2.0.<p>
It is running on version %(wxpy)s of <b>wxPython</b> and %(python)s of <b>Python</b>.
See <a href="http://wiki.wxpython.org">wxPython Wiki</a></p>"""

class defaults:
    left_width = 250

class HtmlWindow(wx.html.HtmlWindow):
    def __init__(self, parent, id, size=(600,400)):
        wx.html.HtmlWindow.__init__(self,parent, id, size=size)
        if "gtk2" in wx.PlatformInfo:
            self.SetStandardFonts()

    def OnLinkClicked(self, link):
        wx.LaunchDefaultBrowser(link.GetHref())

class AboutBox(wx.Dialog):
    def __init__(self):
        wx.Dialog.__init__(self, None, -1, "About MP7 Gui",
            style=wx.DEFAULT_DIALOG_STYLE|wx.THICK_FRAME|wx.RESIZE_BORDER|
                wx.TAB_TRAVERSAL)
        hwin = HtmlWindow(self, -1, size=(400,200))
        vers = {}
        vers["python"] = sys.version.split()[0]
        vers["wxpy"] = wx.VERSION_STRING
        hwin.SetPage(aboutText % vers)
        btn = hwin.FindWindowById(wx.ID_OK)
        irep = hwin.GetInternalRepresentation()
        hwin.SetSize((irep.GetWidth()+25, irep.GetHeight()+10))
        self.SetClientSize(hwin.GetSize())
        self.CentreOnParent(wx.BOTH)
        self.SetFocus()

CaptureTTCEvent, EVT_CAPTURE_TTC_BUTTON = wx.lib.newevent.NewCommandEvent()

class TTCPanel(wx.Panel):
    def __init__(self, *args, **kwargs):
        wx.Panel.__init__(self, *args, **kwargs)
        self.__do_layout()

    def __do_layout(self):
        # sizer for the whole TTC panel
        sizer = wx.BoxSizer(wx.HORIZONTAL)

        # left half
        left = wx.Panel(self,-1, size=(defaults.left_width,-1))
        left.SetBackgroundColour((0xff, 0, 0))
        sz_left = wx.BoxSizer(wx.VERTICAL)
        sz_left.SetMinSize(left.GetSize())
        left.SetSizer(sz_left)
        sizer.Add(left, 0, wx.ALL , 5)

        # right half
        right = wx.Panel(self,-1)
        right.SetBackgroundColour((0, 0xff,0))
        sz_right = wx.BoxSizer(wx.VERTICAL)
        right.SetSizer(sz_right)
        sizer.Add(right, 1, wx.ALL | wx.EXPAND, 5)

        # TTC counter block
        bx_count = wx.StaticBox(left, label='Counters')
        sx_count = wx.StaticBoxSizer(bx_count, wx.VERTICAL )

        labels = [
            ('ttc.stat1.evt_ctr','Event Number:'),
            ('ttc.stat0.bunch_ctr','Bunch Counter:'),
            ('ttc.stat2.orb_ctr','Orbit Counter:'),
            ('ttc.stat3.single_biterr_ctr','Single Bit Counter:'),
            ('ttc.stat3.double_biterr_ctr','Multi Bit Errs:'),
            ('ttc.stat0.bc0_lock','BC0 lock:'),
            ('ttc.stat0.bc0_err','BC0 error:'),
            ('ttc.stat0.orb_len','Orbit length:'),
        ]

        texts = []
        registers = {}
        for r,l in labels:
            txt0 = wx.StaticText(left, label=l, style=wx.ALIGN_LEFT)
            texts.append( ( txt0, 1, wx.EXPAND) )
            txt1 = wx.StaticText(left, label='waiting', style=wx.ALIGN_RIGHT)
            texts.append( ( txt1, 0, wx.EXPAND ) )
            registers[r] = txt1


        sz_grid = wx.FlexGridSizer( 2, 2)
        sz_grid.AddGrowableCol(0)
        sz_grid.AddMany( texts )
        sx_count.Add(sz_grid,1,
            wx.EXPAND|wx.ALL , border=5)
        sz_left.Add(sx_count,0, wx.EXPAND)

        # TTC history log
        bx_history = wx.StaticBox(right, label='History')
        sz_history = wx.StaticBoxSizer(bx_history, wx.VERTICAL )

        history = wx.TextCtrl(right, id=-1, value='', pos=wx.DefaultPosition,
                                    size=(-1,250),
                                    style= wx.TE_MULTILINE | wx.TE_READONLY )
        font1 = wx.Font(10, wx.MODERN, wx.NORMAL, wx.NORMAL, False )
        history.SetFont(font1)

        sz_history.Add(history, 1, wx.EXPAND | wx.ALL, 2 )

        # History parameters
        sz_capgrid = wx.FlexGridSizer( 2, 3, 0, 0)
        fg_capgrid = wx.SizerFlags()
        fg_capgrid.Border( wx.ALL | wx.ALIGN_LEFT | wx.ALIGN_CENTER_VERTICAL, 0 )

        # 0,0
        sz_capgrid.AddF(wx.StaticText(right, -1, 'Capture interval:'), fg_capgrid)
        # 0,1
        m_capTime = wx.lib.masked.NumCtrl(right, 1, integerWidth=2, fractionWidth = 1, max=10)
        m_capTime.SetAllowNegative(False)
        m_capTime.SetAutoSize(False)
        m_capTime.SetValue(1.)
        sz_capgrid.AddF(m_capTime, fg_capgrid)
        # 0,2
        sz_capgrid.Add((0,0))

        # 1,0
        sz_capgrid.AddF(wx.StaticText(right, -1, 'Mask BC0:'), fg_capgrid)
        # 1,1
        m_maskBc0Check = wx.CheckBox(right, -1, '')
        sz_capgrid.AddF(m_maskBc0Check, fg_capgrid )
        # 1,2
        bt_capturecapture = wx.Button(right, 1, "Capture")
        bt_capturecapture.Bind(wx.EVT_BUTTON, self.OnCaptureClicked)
        sz_capgrid.Add(bt_capturecapture, 0, wx.ALIGN_RIGHT)

        sz_capgrid.AddGrowableCol(2)

        sz_history.Add(sz_capgrid, 0, wx.ALL | wx.EXPAND, 5)

        sz_right.Add(sz_history, 1, wx.EXPAND)

        self.SetSizer(sizer)

        self._registers   = registers
        self._history     = history
        self._maskBC0     = m_maskBc0Check
        self._captureTime = m_capTime
        self._sizer       = sizer

    def UpdateHistory(self, entries ):
        self._history.SetValue('\n'.join( entries ))

    def Refresh(self, values):
        for k,v in values.iteritems():
            txt = self._registers.get(k, None)
            if txt: txt.Label = str(v)
        self._sizer.Layout()

    def OnCaptureClicked(self,event):
        ttcevent = CaptureTTCEvent(
            self.GetId(),
            maskBC0     = self._maskBC0.GetValue(),
            captureTime = self._captureTime.GetValue()
        )

        wx.PostEvent(self.GetEventHandler(), ttcevent)

ReadSI5326Event, EVT_READ_SI5326_BUTTON = wx.lib.newevent.NewCommandEvent()

class ClockingPanel(wx.Panel):
    def __init__(self, *args, **kwargs):
        wx.Panel.__init__(self, *args, **kwargs)
        self.__do_layout()

    def __do_xpoint(self, parent, name):
        bx_xpoint= wx.StaticBox(parent, label='xpoint %s' % name)
        sz_xpoint= wx.StaticBoxSizer(bx_xpoint, wx.HORIZONTAL )

        # I'm using this for vertical alignment, which doesnt' seem to work
        # easily using the StaticBoxSizer
        sz_grid = wx.FlexGridSizer( 1, 8 )

        ctrls = []
        for i in xrange(4):
            nc = wx.lib.masked.NumCtrl(parent,value=0,integerWidth=1)
            ctrls.append( ('ctrl.selforout%d_%s' % ( i+1, name ),nc) )

            sz_grid.AddGrowableCol(i*2)
            sz_grid.Add( wx.StaticText(parent,label='o%d:' % (i+1)), 1, wx.ALIGN_CENTER_VERTICAL| wx.ALIGN_RIGHT)

            sz_grid.Add( nc, 1 )

        sz_xpoint.Add( sz_grid, 1, wx.EXPAND )
        return sz_xpoint, ctrls

    def __do_layout( self ):
        sizer = wx.BoxSizer(wx.HORIZONTAL)

        # left half
        left = wx.Panel(self,-1, size=(defaults.left_width,-1))
        sz_left = wx.BoxSizer(wx.VERTICAL)
        sz_left.SetMinSize(left.GetSize())
        left.SetSizer(sz_left)
        sizer.Add(left, 0, wx.ALL , 5)

        # right half
        right = wx.Panel(self,-1)
        right.SetBackgroundColour((0, 0xff,0))
        sz_right = wx.BoxSizer(wx.VERTICAL)
        right.SetSizer(sz_right)
        sizer.Add(right, 1, wx.ALL | wx.EXPAND, 5)

        # xpoint u3
        sz_xpointU3,nc_U3 = self.__do_xpoint(left, 'u3')
        sz_left.Add(sz_xpointU3, 0, wx.EXPAND)

        # xpoint U15
        sz_xpointU15,nc_U15 = self.__do_xpoint(left, 'u15')
        sz_left.Add(sz_xpointU15, 0, wx.EXPAND)

        # xpoint U36
        sz_xpointU36,nc_U36 = self.__do_xpoint(left, 'u36')
        sz_left.Add(sz_xpointU36, 0, wx.EXPAND)

        # Status
        bx_count = wx.StaticBox(left, label='Status')
        sx_count = wx.StaticBoxSizer(bx_count, wx.VERTICAL )

        labels = [
            ('stat.done_u3'   , 'U3 Prog Done:'),
            ('stat.done_u15'  , 'U15 Prog Done:'),
            ('stat.done_u36'  , 'U36 Prog Done:'),
            ('stat.si5326_lol', 'SI5326 loss of lock'),
            ('stat.si5326_int', 'SI5326 int'),
        ]

        texts = []
        xpflags = {}
        for r,l in labels:
            txt = wx.StaticText(left, label=l, style=wx.ALIGN_LEFT)
            texts.append( ( txt, 1, wx.EXPAND) )
            chk = wx.CheckBox(left, -1, '')
            chk.Enable(False)
            texts.append( ( chk, 0, wx.ALIGN_RIGHT) )
            xpflags[r] = chk


        sz_grid = wx.GridSizer( 2, 2 )
        sz_grid.AddMany( texts )
        sx_count.Add(sz_grid, 1, wx.EXPAND, border=5)
        sz_left.Add(sx_count, 1, wx.EXPAND, wx.ALL, 0)


        ## SIchip
        # Registers window
        bx_si5326 = wx.StaticBox(right, label='SI5326 Register Display')
        sz_si5326 = wx.StaticBoxSizer(bx_si5326, wx.VERTICAL )

        si5326_regs = wx.TextCtrl(right, id=-1, value='', pos=wx.DefaultPosition,
                                    size=(-1,250),
                                    #style= wx.TE_MULTILINE | wx.SUNKEN_BORDER |wx.TE_READONLY)
                                    style= wx.TE_MULTILINE | wx.TE_READONLY )
        font1 = wx.Font(10, wx.MODERN, wx.NORMAL, wx.NORMAL, False )
        si5326_regs.SetFont(font1)

        sz_si5326.Add(si5326_regs, 1, wx.EXPAND | wx.ALL, 2 )

        # Controls
        sz_si5326_buttons = wx.BoxSizer( wx.HORIZONTAL )
        sz_si5326_buttons.AddStretchSpacer()
        bt_readRegs = wx.Button(right, 0, 'Read Registers')
        bt_readRegs.Bind(wx.EVT_BUTTON, self.OnReadClicked)
        sz_si5326_buttons.Add( bt_readRegs)

        sz_si5326.Add(sz_si5326_buttons, 0, wx.EXPAND)


        sz_right.Add(sz_si5326, 1, wx.EXPAND)

        self.SetSizer(sizer)

        ctrls = {}
        ctrls.update(xpflags)
        ctrls.update(nc_U3)
        ctrls.update(nc_U15)
        ctrls.update(nc_U36)

        self._sizer       = sizer
        self._nc_U3       = nc_U3
        self._nc_U15      = nc_U15
        self._nc_u36      = nc_U36
        self._ctrls       = ctrls
        self._si5326_regs = si5326_regs

    def Refresh(self, values):
        for k,v in values.iteritems():
            check = self._ctrls.get(k, None)
            if check: check.SetValue(v)
        self._sizer.Layout()

    def OnReadClicked(self,event):
        readevent = ReadSI5326Event(
            self.GetId(),
        )
        wx.PostEvent(self.GetEventHandler(), readevent)

    def UpdateSI5326Registers(self, registers):
        self._si5326_regs.SetValue( '\n'.join( '%03d : 0x%02x' % (r,v) for r,v in sorted(registers.iteritems(), key=lambda x: x[0]) ) )



class TestPanel(wx.Panel):
    def __init__(self,*args,**kwargs):
        wx.Panel.__init__(self,*args, **kwargs)
        self.__do_layout()

    def __do_xpoint(self, parent, name):
        bx_xpoint= wx.StaticBox(parent, label='xpoint %s' % name)
        sz_xpoint= wx.StaticBoxSizer(bx_xpoint, wx.HORIZONTAL )

        # I'm using this for vertical alignment, which doesnt' seem to work
        # easily using the StaticBoxSizer
        sz_grid = wx.FlexGridSizer( 1, 8 )

        ctrls = []
        for i in xrange(4):
            num = wx.lib.masked.NumCtrl(parent,value=0,integerWidth=1)
            ctrls.append(num)

            sz_grid.AddGrowableCol(i*2)
            sz_grid.Add( wx.StaticText(parent,label='o%d:' % (i+1)), 1, wx.ALIGN_CENTER_VERTICAL| wx.ALIGN_RIGHT)
            sz_grid.Add( num, 1  )

        sz_xpoint.Add( sz_grid, 1, wx.EXPAND )
        return sz_xpoint, ctrls

    def __do_layout(self):
        sizer = wx.BoxSizer(wx.HORIZONTAL)

        # General structure
        fg_left  = wx.SizerFlags(0)
        fg_left.Border( wx.ALL, 5 )

        fg_right  = wx.SizerFlags(1)
        fg_right.Border( wx.ALL, 5 ).Expand()


        left = wx.Panel(self, size=(250,-1))
        left.SetBackgroundColour( (0xff,0,0) )
        sizer.AddF(left,fg_left)

        right = wx.Panel(self)
        right.SetBackgroundColour( (0,0,0xff) )
        sizer.AddF(right,fg_right)

        # left panel
        sz_left = wx.BoxSizer(wx.VERTICAL)
        sz_left.SetMinSize(left.GetSize())

        sz_static, ctrls = self.__do_xpoint(left, 'U3')
        sz_left.Add(sz_static, 1, wx.EXPAND)
        sz_static, ctrls = self.__do_xpoint(left, 'U15')
        sz_left.Add(sz_static, 1, wx.EXPAND)
        sz_static, ctrls = self.__do_xpoint(left, 'U36')
        sz_left.Add(sz_static, 1, wx.EXPAND)

        bx_staticB = wx.StaticBox(left, label='Left1', size=left.GetSize())
        sz_staticB = wx.StaticBoxSizer(bx_staticB, wx.HORIZONTAL)

        for i in xrange(4):
            bx = wx.lib.masked.NumCtrl(left,value=0,integerWidth=1)
            txt = wx.StaticText(left,label='o%d:' % (i+1), style=wx.ALIGN_RIGHT | wx.ALIGN_CENTER_VERTICAL)
            sz_staticB.Add( txt, 1, wx.EXPAND | wx.ALIGN_CENTER_VERTICAL)
            sz_staticB.Add( bx, 0  )

        sz_left.Add(sz_staticB, 1 , wx.EXPAND)
        left.SetSizer(sz_left)


        self.SetSizer(sizer)

class MainPanel(wx.Panel):
    '''
    should I hold the board?
    '''
    def __init__(self, *args, **kwargs):
        wx.Panel.__init__(self,*args, **kwargs)

    def __do_layout(self):
        pass


class Frame(wx.Frame):
    __log = logging.getLogger('MP7Gui.Frame')

    def __init__(self, mp7board, title):
        wx.Frame.__init__(self, None, title=title, pos=(150,150), size=(800,600))

        self._board = utils.HwProxy(mp7board)
        self.__do_layout()


    def __do_layout(self):
        #self.Bind(wx.EVT_CLOSE, self.OnClose)

        menuBar = wx.MenuBar()
        menu = wx.Menu()
        m_exit = menu.Append(wx.ID_EXIT, "E&xit\tAlt-X", "Close window and exit program.")
        self.Bind(wx.EVT_MENU, self.OnClose, m_exit)
        menuBar.Append(menu, "&File")
        menu = wx.Menu()
        m_about = menu.Append(wx.ID_ABOUT, "&About", "Information about this program")
        self.Bind(wx.EVT_MENU, self.OnAbout, m_about)
        menuBar.Append(menu, "&Help")
        self.SetMenuBar(menuBar)

        self.statusbar = self.CreateStatusBar()

        sizer = wx.BoxSizer(wx.VERTICAL)
        nb = wx.Notebook(self)
        #nb.AddPage(self.__do_master_panel(nb),'summary')
        nb.AddPage(self.__build_clocking_panel(nb),'Clocking')
        nb.AddPage(self.__build_ttc_panel(nb),'TTC Counters')
        nb.AddPage(self.__build_buf_panel(nb),'buffers')
        sizer.Add(nb, 1, wx.ALL | wx.EXPAND, 5)


        # bottom panel to host the global control buttons
        buttonPanel = wx.Panel(self)
        buttonSizer = wx.BoxSizer( wx.HORIZONTAL )

        m_refresh = wx.Button(buttonPanel, 0, 'Refresh')
        m_refresh.Bind(wx.EVT_BUTTON, self.Refresh)
        buttonSizer.Add(m_refresh, 0, wx.ALL, 5)

        m_close = wx.Button(buttonPanel, wx.ID_CLOSE, 'Close')
        m_close.Bind(wx.EVT_BUTTON, self.OnClose)
        buttonSizer.Add(m_close, 0, wx.ALL, 5)

        buttonPanel.SetSizer(buttonSizer)

        sizer.Add(buttonPanel, 0, wx.ALL | wx.ALIGN_RIGHT, 5)

        self.SetSizer(sizer)
        self.SetAutoLayout(True)

        nb.SetSelection(1)


    def __build_any_panel(self, parent):
        return TestPanel(parent)

    def __build_ttc_panel(self, parent):
        self._ttc = TTCPanel(parent)
        self._ttc.Bind(EVT_CAPTURE_TTC_BUTTON, self.OnCaptureTTC)
        return self._ttc

    def __build_clocking_panel(self, parent):
        self._clocking = ClockingPanel(parent)
        self._clocking.Bind(EVT_READ_SI5326_BUTTON, self.OnReadSi5326)
        return self._clocking

    __build_master_panel = __build_any_panel
    __build_buf_panel = __build_any_panel



    def OnCaptureTTC(self, event):
        history = self._board.ttc.captureBGOs( event.maskBC0, event.captureTime)
        self._ttc.UpdateHistory(history)

    def OnReadSi5326(self, event):
        regs = self._board.si5326.registers()
        self._clocking.UpdateSI5326Registers( regs )

    def Refresh(self, event):
        self._ttc.Refresh( self._board.ttc.dump() )
        self._clocking.Refresh( self._board.xpoint.dump() )

    def OnClose(self, event):
        self.Destroy()
        return
        dlg = wx.MessageDialog(self,
            "Do you really want to close this application?",
            "Confirm Exit", wx.OK|wx.CANCEL|wx.ICON_QUESTION)
        result = dlg.ShowModal()
        dlg.Destroy()
        if result == wx.ID_OK:
            self.Destroy()

    def OnAbout(self, event):
        dlg = AboutBox()
        dlg.ShowModal()
        dlg.Destroy()
