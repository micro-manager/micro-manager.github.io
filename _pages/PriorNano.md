== Prior NanoScanZ and Prior Queensgate NanoScan adapter ==

<table><tr><td>
'''Summary:'''</td><td>Interfaces to Prior nanopositioning stages through Prior NanoScanZ and Prior Queensgate NanoScan controllers</td></tr>
<tr><td>'''Author:'''</td><td>Nenad Amodaj and Graham Bartlett</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows, Mac OS X, Linux (serial port)</td></tr>
<tr><td>'''Devices:'''</td><td>NanoZStage</td></tr>
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

This adapter interfaces with nanopositioning stages through the Prior NanoScanZ or Prior Queensgate NanoScan controllers.  It communicates with the controller through the serial port so that no further software is needed.  It works with Prior/Queensgate nanopositioning Z stages. No 'hub' device is defined in this adapter.

--[[User:GrahamBartlettPrior|GrahamBartlettPrior]] 13:14, 17 Oct 2019 (GMT)

{{Devices_Sidebar}}
