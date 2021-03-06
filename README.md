# station
station control with arduino ethernet

Arduino Ethernet Box with Python GUI for station remote control.

- turns AC on and off
- band selection for icom IC-735
- Antenna tuner control 
- reads FWD and REF power from Antenna Tuner

The Arduino Ethernet Box will be placed close to the tranceiver and will
be connected via LAN to the network. FWD, REF and Tune cable will be 
connected to the Antenna Tuner. The Power Supply of the Transceiver can 
be switched on and off via the Arduino. When using Red Pitaya, the band 
selection will be directly controlled from the Red Pitaya. When using
Hermes Lite the Arduino can also do the band selection. The Arduino will
be supplied with an 12V Power Supply which is alway connected to mains.

The Python gui will work on Linux and Windows Computers. The repository 
contains schematics and code.

#### Station
![J13](pics/Station.jpg)

This picture shows the Icom Transceiver with Red Pitaya, Antenna Tuner,
Arduino Box, PTT Box and Power Supply 


#### Desktop
![J13](pics/desktop.png)

This is the desktop with quisk and station control.

#### GUI
![J13](pics/gui.png)

GUI can be started with python station.py

I have installed the following packages:
sudo apt-get install python-wxgtk2.8
sudo apt-get install python-wxgtk3.0

There are no discrete values at level meter. The level shall only show 
that power goes out and hopefully nothing comes back. The Python tool 
calculates from FWD and REF the SWR level. Sometimes there is some delay
between pressing PTT and showing the output power - in that case it 
often helps to start the Python tool again.
In case of high REF values the antenna can be tuned via the antenna tuner
control buttons.

#### UDP
![J13](pics/UDP.png)

The station can be turned on via the Python GUI or from any UDP sender 
with sending ":" (";" turns the station off).

#### Arduino Box
![J13](pics/Box_front.jpg)

from left to right ...
Top
REF, Tune, FWD

Bottom
Lan, Band, 12V-Supply

#### Arduino Box
![J18](pics/Box_back.jpg)

C13 Power Socket

#### Arduino Box
![PIC1](pics/Box_content.jpg)

Relay Board with Arduino Ethernet: big Relais for AC Power - small 
Relais for Antenna Tuner.
Arduino Ethernet board - old revision which is might be not longer 
available. But I have checked the code also on Arduino Leonardo Ethernet 
Board.

#### Antenna Tuner
![PIC2](pics/AT200_front.jpg)

LDG AT200Pro

The antenna tuner can be controlled via the Radio connector. Connecting 
GND and the middle terminal of the 3.5mm jack works like the tuner button
on the front:
Bypass function: connection < 1s, 
Memory function: connection 1 to 3s, 
Tuner  function: connection > 3s

#### Antenna Tuner
![PIC3](pics/AT200_back.jpg)

Back side: because I would not drill a hole to the housing, I have used
a 3pin MTE connector for FWD, GND and REF signal next to the 3.5mm Tune
connector. 


#### Antenna Tuner
![PIC2](pics/AT200_mod.jpg)

shows the modification inside the antenna tuner. I have placed an small
PCB with the driver opamp between microcontroller and socket. So I have
all required signals available (5V, GND, FWD- and REF signal).
The opamp will be used to drive FWD and REF signals over the cable to 
the Arduino.  

#### Antenna Tuner
![PIC3](pics/AT200_detail.jpg)

Small PCB details - I have used an LT1014 - any other dual amp can be 
used (e.g. LM324).

#### PTT Box
![PIC3](pics/PTT_front.jpg)

from left to right ...
Logic Level input, PTT output, 12V-Supply

#### PTT Box
![PIC3](pics/PTT_back.jpg)

5V Output for Red Pitaya / Hermes Lite Supply

Because HAM radio Power Rail is 12V the PTT Box contains a DC/DC 
converter (12V to 5V). Now everything runs on 12V.

Andreas (DL9LJ) - November 2016


