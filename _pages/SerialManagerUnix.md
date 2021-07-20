<table><tr><td>
'''Summary:'''</td><td>Interface to Serial ports on Unix</td></tr>
<tr><td>'''Author:'''</td><td>Nico Stuurman.  Uses code from [http://libserial.sourceforge.net/mediawiki/index.php/Main_Page libserial]</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>Mac/Linux</td></tr>
<tr><td>'''Devices:'''</td><td>Unix Serial Ports</td></tr>
<tr><td>'''Example Config File:'''</td><td></td></tr>
</table>


Micro-Manager adapter to serial ports on Mac and Linux. Works with 'real' serial ports, and USB-serial converters.  Lists available serial ports on Mac.  The behavior of this adapter is exactly the same as the one on Windows since Micro-Manager version 1.1.36.  However, this adapter also exposes the property: ''DelayBetweenCharsMs''.  This specifies the time (in ms) that the computer waits in between sending a character to the serial device.  Set this low (0) for newer fast devices.  You might need to increase the value for older devices that cannot buffer serial input adequately.

--[[User:Nico|Nico]] 16:21, 3 September 2007 (PDT)


{{Devices_Sidebar}}
