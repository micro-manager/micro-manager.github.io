== Marzhauser L-Step adapter   ==

<table><tr><td>
'''Summary:'''</td><td>Interfaces with Märzhäuser L-Step controllers and associated hardware </td></tr>
<tr><td>'''Author:'''</td><td>Gilles Courtand and Brice Bonheur based on Falk Dettmar Tango adapter</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>Should work on all platforms (serial interface)</td></tr>
<tr><td>'''Devices:'''</td><td>Controller, XYStage</td></tr>
<tr><td>'''Since version:'''</td><td>1.4.9</td></tr>
<tr><td valign=top>'''Serial port settings:'''</td><td valign=top>

{| cellspacing="2" border="0" cellpadding=3
|-
|AnswerTimeout||500.0000
|-
|BaudRate||9600
|-
|DelayBetweenCharsMs||0 
|-
|Handshaking||Off
|-
|StopBits||2
|}
</table>

To drive a stage, you will have to define the 'LStep Controller' device. You will need to specify the serial port to which the LSTEP controller is connected. Micro-Manager will report the Firmware version of the LSTEP Controller. 

Simple movements can be made with the LSTEP without a control computer. The “joystick” switch is set to “manual” for this purpose.

Tested with LSTEP 12/2 model.


{{Devices_Sidebar}}
