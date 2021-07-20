== Thorlabs Filter Wheel adapter ==

<table cellspacing=3><tr><td>
'''Summary:'''</td><td valign="top">Interface to [http://www.thorlabs.com/NewGroupPage9.cfm?ObjectGroup_ID=988 Thorlabs FilterWheel FW102B and FW212B]</td></tr>
<tr><td>'''Author:'''</td><td>Brian Ashcroft, ashcroft at physics.leidenuniv.nl</td></tr>
<tr><td>'''License:'''</td><td></td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows (depends on USB to serial port driver)</td></tr>
<tr><td>'''Available since version:'''</td><td>1.3.38</td>

<tr><td valign=top>'''Default serial port settings:'''</td><td valign=top>

{| cellspacing="2" border="0" cellpadding=3
|-AnswerTimeout||500ms
|-
|BaudRate||115.2 k
|-
|DelayBetweenCharsMs||0
|-
|Handshaking||Off
|-
|Parity||None
|-
|StopBits||1
|}
</td></tr>
</table>
This adapter controls the Thorlabs FilterWheel FW102B and FW212B.  A manual can be found  [http://www.thorlabs.com/Thorcat/16600/16667-D02.pdf here].  Note that the filter wheel has a USB connection.  The software that comes with the filterwheel will install a driver for USB to serial converter that appears as a serial port in Micro-Manager.  If such a driver can be found on Mac or Linux, this adapter will work on those platforms too (please share experiences here).


{{Devices_Sidebar}}
