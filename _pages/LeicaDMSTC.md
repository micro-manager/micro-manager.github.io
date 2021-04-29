== Leica DMSTC adapter ==

<table><tr><td>
'''Summary:'''</td><td>Controls Leica DMSTC XY stage</td></tr>
<tr><td>'''Author:'''</td><td>G. Esteban Fernandez</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows, Mac, Linux (serial port)</td></tr>
<tr><td>'''Devices:'''</td><td>Hub, XY stage</td></tr>
<tr><td>'''Micro-Manager version:'''</td><td>1.4.11</td></tr>
<tr><td valign=top>'''Serial port settings:'''</td><td valign=top>

{| cellspacing="2" border="0" cellpadding=3
|AnswerTimeout||5000
|-
|BaudRate||19200
|-
|DelayBetweenCharsMs||0
|-
|Handshaking||Off
|-
|Parity||None
|-
|StopBits||1
|}
</table>

This adapter interfaces to the Leica DMSTC XY stage.  Connect the DMSTC to an available serial port on your computer.   You will need to define the ''Hub'' device, and assign the correct serial port to it. 

IMPORTANT!: During Micro-Manager startup the stage moves to the top left corner to define the origin.  MAKE SURE THE RANGE OF STAGE TRAVEL IS CLEAR BEFORE INITIALIZATION!


{{Devices_Sidebar}}
