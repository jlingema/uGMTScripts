import os
import wx
import uhal
import mp7

class Pippo(wx.Frame):

  def __init__(self, parent, id, title):

    wx.Frame.__init__(self, parent, id, title, size=(500, 400))

    # GUIs Attributes
    self.__hw_tree = None
    self.__refresh_buttons_panel = None
    self.__hw_table_panel = None

    # Layout
    self.__create_menu_bar()
    self.__do_layout()
    self.CreateStatusBar()

    self.Bind(wx.EVT_CLOSE, self.__on_close_window)


  def __do_layout(self):
    border_flags = wx.ALL

    sizer = wx.BoxSizer(wx.HORIZONTAL)
    nb = wx.Notebook(self)
    nb.AddPage(wx.Panel(nb),'stocazzo')
    nb.AddPage(wx.Panel(nb),'stameng')
    sizer.Add(wx.Panel(self, wx.ID_ANY, wx.DefaultPosition, (150,-1) ), 0, wx.ALL | wx.EXPAND, 5)
    sizer.Add(nb, wx.ALL | wx.EXPAND, wx.ALL | wx.EXPAND, 5)

    self.SetSizer(sizer)
    self.SetAutoLayout(True)
    self.SetMinSize((800, 600))

  # CREATE THE MENU BAR
  def __create_menu_bar(self):

      menu_bar = wx.MenuBar()
      for each_menu_data in self.__menu_data():
          menu_label = each_menu_data[0]
          menu_items = each_menu_data[1:]
          menu_bar.Append(self.__create_menu(menu_items), menu_label)

      self.SetMenuBar(menu_bar)



  # menu bar items
  def __menu_data(self):

      return (("&File",
                ("&LoadHW", "Load HW", wx.ITEM_NORMAL, self.__on_load_hw),
                ("&Quit", "Quit", wx.ITEM_NORMAL, self.__on_close_window)
              ),
              #("&View",
              # ("&AutoRefresh", "Auto-refresh", wx.ITEM_CHECK, self.__on_click_autorefresh)
              # ),
              ("&Help",
                #("&Documentation", "Documentation", wx.ITEM_NORMAL, self.__on_click_doc),
                #("&Support", "Support", wx.ITEM_NORMAL, self.__on_click_support),
                ("&About", "About", wx.ITEM_NORMAL, self.__on_click_about)
              )
          )

  # create individual menu objects
  def __create_menu(self, items):

      menu = wx.Menu()
      for each_label, each_status, each_kind, each_handler in items:

          if not each_label:
              menu.AppendSeparator()
              continue

          menu_item = menu.Append(-1, each_label, each_status, kind=each_kind)
          self.Bind(wx.EVT_MENU, each_handler, menu_item)

      return menu

  def __on_load_hw(self, event):

    # Right now, only a connection file picker is offered.
    # Another dialog should be displayed to cope with pycohal ConnectionManager('device_id', 'uri', 'address_table')

      wildcard = "XML files (*.xml)|*.xml|" \
          "All files (*.*)|*.*"


      file_picker = wx.FileDialog(None, style = wx.OPEN)

      file_picker.SetMessage("Choose connection file")
      file_picker.SetDirectory(os.getcwd())
      file_picker.SetWildcard(wildcard)
      file_picker.SetFilename("gui")


      if file_picker.ShowModal() == wx.ID_OK:
        file_name = file_picker.GetPath()

          #self.__hw = HardwareStruct(file_name)
          #self.__create_hardware_tree(self.__hw)
          #self.__hw_table_panel.draw_hw_naked_tables(self.__hw)

      file_picker.Destroy()

  def __on_click_about(self, event):

        description = """
        uTCA crate interface
        """

        licence = """uHAL GUI is free software; you can redistribute
        it and/or modify it under the terms of the GNU General Public License as
        published by the Free Software Foundation; either version 2 of the License,
        or (at your option) any later version.

        uHAL GUI is distributed in the hope that it will be useful,
        but WITHOUT ANY WARRANTY; without even the implied warranty of
        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
        See the GNU General Public License for more details. You should have
        received a copy of the GNU General Public License along with File Hunter;
        if not, write to the Free Software Foundation, Inc., 59 Temple Place,
        Suite 330, Boston, MA  02111-1307  USA
        """


        info = wx.AboutDialogInfo()
        info.SetName('pytca GUI')
        info.SetVersion('2.0.0')
        info.SetDescription(description)
        info.SetCopyright('(C) 2013 Alessandro Thea, Kristian Harder')
        info.SetWebSite('http://svnweb.cern.ch/trac/cactus')
        # info.SetLicence(licence)
        info.AddDeveloper('Alessandro Thea')
        info.AddDocWriter('Alessandro Thea')

        wx.AboutBox(info)

  def __on_close_window(self, event):

      #msg = "Do you really want to close this GUI?"

      #dialog = wx.MessageDialog(self, msg, "Confirm Exit", wx.OK | wx.CANCEL | wx.ICON_QUESTION)
      #result = dialog.ShowModal()
      #dialog.Destroy()

      #if result == wx.ID_OK:
          self.Destroy()
