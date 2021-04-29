== Prior ProScan adapter ==

<table><tr><td>
'''Summary:'''</td><td>Interfaces Prior hardware through ProScan and OptiScan controllers</td></tr>
<tr><td>'''Author:'''</td><td>Nenad Amodaj, with (small) contributions from Nico Stuurman (TTLs)</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows, Mac OS X, :inux (serial port)</td></tr>
<tr><td>'''Devices:'''</td><td>ProScan and OptiScan controllers, XYStage, Zstage, filter wheel, shutter, TTL, LumenPro</td></tr>
<tr><td>'''Example Config File:'''</td><td></td></tr>
<tr><td valign=top>'''Default serial port settings:'''</td><td valign=top>

{| cellspacing="2" border="0" cellpadding=3
|-AnswerTimeout||500
|-
|BaudRate||9600
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

This adapter interfaces with Prior hardware through the ProScan or OptiScan controllers.  It communicates with the controller through the serial port so that no further software is needed.  It works with the Prior XYStage, Zstage, filter wheels, shutters, the LumenPro and can also control the TTLs on the Proscan controller. No 'hub' device is defined in this adapter.  Specify the same serial port for all devices. 

Special properties of the XYStage (since 1.3.40):<br>
<table valign='left'>
<tr><td>'''MaxSpeed'''</td><td>Sets the maximum speed of the XY stage</td></tr>
<tr><td>'''Acceleration'''</td><td>Sets the acceleration of the XY stage</td></tr>
<tr><td>'''SCurve'''</td><td>This is the rate of change of acceleration during the transition from stationary until the stage reaches the full acceleration set by 'Acceleration'</td></tr>
</table>

--[[User:GrahamBartlettPrior|GrahamBartlettPrior]] 13:14, 17 Oct 2019 (GMT)

{{Devices_Sidebar}}
