# Station Control for IC-735 with SDR
# DL9LJ - 16.10.2016

import wx
import socket
from array import *

UDP_IP="192.168.2.86" #PC
UDP_IPT="192.168.2.177" #Arduino
UDP_PORT=8888


sock = socket.socket( socket.AF_INET, # Internet
                      socket.SOCK_DGRAM ) # UDP
sock.bind( (UDP_IP,UDP_PORT) )


class Example(wx.Frame):
           
    def __init__(self, *args, **kw):
        super(Example, self).__init__(*args, **kw) 
        self.InitUI()
      
 
    def InitUI(self):   
        pnl = wx.Panel(self)
        
        self.timer = wx.Timer(self, 1)
        self.a = 'A'
        
        self.Bind(wx.EVT_TIMER, self.OnTimer, self.timer)
        self.timer.Start(300)
        
        self.gauge1 = wx.Gauge(pnl, -1, 100, size=(250, 25), pos=(180, 20))
        self.gauge2 = wx.Gauge(pnl, -1, 100, size=(250, 25), pos=(180, 80))
        self.gauge3 = wx.Gauge(pnl, -1, 100, size=(250, 25), pos=(180, 140))
        
        self.rb1 = wx.RadioButton(pnl, label='160m', pos=(40, 20),
			style=wx.RB_GROUP)
        self.rb2 = wx.RadioButton(pnl, label='80m', pos=(40, 40))
        self.rb3 = wx.RadioButton(pnl, label='40m', pos=(40, 60))
        self.rb4 = wx.RadioButton(pnl, label='30m', pos=(40, 80))
        self.rb5 = wx.RadioButton(pnl, label='20m', pos=(40, 100))
        self.rb6 = wx.RadioButton(pnl, label='17m', pos=(40, 120))
        self.rb7 = wx.RadioButton(pnl, label='15m', pos=(40, 140))
        self.rb8 = wx.RadioButton(pnl, label='12m', pos=(40, 160))
        self.rb9 = wx.RadioButton(pnl, label='10m', pos=(40, 180))
 
        self.rb1.Bind(wx.EVT_RADIOBUTTON, self.OnBand)
        self.rb2.Bind(wx.EVT_RADIOBUTTON, self.OnBand)
        self.rb3.Bind(wx.EVT_RADIOBUTTON, self.OnBand)
        self.rb4.Bind(wx.EVT_RADIOBUTTON, self.OnBand)
        self.rb5.Bind(wx.EVT_RADIOBUTTON, self.OnBand)
        self.rb6.Bind(wx.EVT_RADIOBUTTON, self.OnBand)
        self.rb7.Bind(wx.EVT_RADIOBUTTON, self.OnBand)
        self.rb8.Bind(wx.EVT_RADIOBUTTON, self.OnBand)
        self.rb9.Bind(wx.EVT_RADIOBUTTON, self.OnBand)
        
        self.rc1 = wx.RadioButton(pnl, label='On', pos=(40, 240),
			style=wx.RB_GROUP)      
        self.rc2 = wx.RadioButton(pnl, label='Off', pos=(40, 260))
        
        self.rc1.Bind(wx.EVT_RADIOBUTTON, self.OnPower)
        self.rc2.Bind(wx.EVT_RADIOBUTTON, self.OnPower)

        self.f = wx.StaticText(pnl, label='FWD', pos=(140, 20))
        self.g = wx.StaticText(pnl, label='REF', pos=(140, 80))
        self.h = wx.StaticText(pnl, label='SWR', pos=(140, 140))
        self.i = wx.StaticText(pnl, label='AC', pos=(40, 220))
        
        self.rd1 = wx.Button(pnl, label='Bypass', pos=(140, 230))
        self.rd1.Bind(wx.EVT_BUTTON, self.OnBypass)
        self.rd2 = wx.Button(pnl, label='Memory', pos=(240, 230))
        self.rd2.Bind(wx.EVT_BUTTON, self.OnMemory)
        self.rd3 = wx.Button(pnl, label='Tune', pos=(340, 230))
        self.rd3.Bind(wx.EVT_BUTTON, self.OnTune)
        
        self.SetSize((480, 300))
        self.SetTitle('Station Control')
        self.Centre()
        self.Show(True) 
	       
    def OnBand(self, e):
        if self.rb1.GetValue(): band = '1'
        if self.rb2.GetValue(): band = '2'
        if self.rb3.GetValue(): band = '3'
        if self.rb4.GetValue(): band = '4'
        if self.rb5.GetValue(): band = '5'
        if self.rb6.GetValue(): band = '6'
        if self.rb7.GetValue(): band = '7'
        if self.rb8.GetValue(): band = '8'
        if self.rb9.GetValue(): band = '9'
        self.a = band
        self.Update()
    
    def OnPower(self, e):
        if self.rc1.GetValue(): mode = ':'
        if self.rc2.GetValue(): mode = ';'
        self.a = mode
        self.Update()
        
    def OnBypass(self, e):
        self.a = '<'
        self.Update()
    
    def OnMemory(self, e):
        self.a = '='
        self.Update()
    
    def OnTune(self, e):
        self.a = '>'
        self.Update()
    
    def OnTimer(self, event):
		sock.sendto(self.a, (UDP_IPT, UDP_PORT) )
		data, addr = sock.recvfrom( 16 ) # buffer size is 16 bytes
		self.b = int(data[1])*100 + int(data[2])*10 + int(data[3])
		self.c = int(data[5])*100 + int(data[6])*10 + int(data[7])
		self.b = self.b / 10.0
		self.c = self.c / 10.0
		if self.b > 10.0: self.s = (self.b+self.c)/(self.b-self.c)
		else: 
			self.s = 1.0
			self.c = 0.0
		self.s = self.s*200-200
		if self.s > 99: self.s = 99
		if self.s < 0: self.s = 99
		if self.c > 99: self.c = 99
		self.gauge1.SetValue(self.b)
		self.gauge2.SetValue(self.c)
		self.gauge3.SetValue(int(self.s))

    def Update(self):
        sock.sendto(self.a, (UDP_IPT, UDP_PORT) )
        self.a = 'A'


def main():
    ex = wx.App()
    Example(None)
    ex.MainLoop()    

if __name__ == '__main__':
      main()   
