<table><tr><td>
'''Summary:'''</td><td>Interface to Serial ports on Windows</td></tr>
<tr><td>'''Author:'''</td><td>Nenad Amodaj.  Uses code by Ramon de Klein (Ramon.de.Klein@ict.nl)</td></tr>
<tr><td>'''License:'''</td><td>BSD and LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows</td></tr>
<tr><td>'''Devices:'''</td><td>Windows Serial Port</td></tr>
<tr><td>'''Example Config File:'''</td><td></td></tr>
</table>


Micro-Manager adapter to serial ports on Windows. Works with 'real' serial ports, USB-serial converters, and PCI-serial cards.  There are two limitations that we are aware of: You can not use more than 9 serial ports, and on older computers the serial port adapter causes problems with the Hardware config wizard (when starting the Hardware Config wizard, the serial ports are not release properly and cannot be reused until you restart the computer.  Only known workaround is to write the config file by hand).

We have seen a number of instances in which USB-Serial adapters worked unreliably.  Especially in cases of heavy serial communication, these devices regularly cause errors that will stop image acquisition. This is something we will look into further, however, whenever possible use a  serial port build into your computer, or - when this is not available - a PCI-based serial port. 

The following experiences of users with PCI Serial-expansion cards and USB-serial adapters were reported on the Micro-Manager mailing list:

{| class="wikitable"
! Manufacturer
! Model
! Status
|-
| Keyspan
| USA-49WG
| works
|-
| Lava
| Quattro-PCI Quad 16550 DB9 Serial Card PCI 4-Port
| works
|-
| Rosewill
| 2x Serial & 1x Parallel Port PCI card Model RC303
| works
|- style="background-color:LightGray;"
| Prolific
| PL-2303 4-port USB-serial
| works, but on Windows 7 you must use the older [[:File:PL2303_DriverInstaller_v1413_20110219.gz|Windows XP driver]] or the COM port will intermittently lock up
|-
| SIIG
| Quartet Serial PCI+DOS card (JJ-P04411-S6)
| works
|-
| SIIG
| CyberSerial 4S Card Model JJ-P45012-S6
| works
|- style="background-color:Gray;"
| StarTech
| PEX4S552
| does not work (does not appear in Hardware Configuration Wizard)
|- style="background-color:LightGray;"
| SYBA
| PCI 32-Bit Quad (9 pin) 4 Port Serial Card, Model SY-PCI9845-PR4
| only first 2 ports work
|}


{{Devices_Sidebar}}
