== Oxxius Laser Controller ==

<table><tr><td>
'''Summary:'''</td><td>Oxxius Laser Controller</td></tr>
<tr><td>'''Author:'''</td><td>Julien Beaurepaire</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>All platforms (uses serial port)</td></tr>
<tr><td>'''Devices:'''</td><td>[http://www.oxxius.com Oxxius DPSS and laser diode]</td></tr>
<tr><td>'''Since version:'''</td><td>1.4.15</td></tr> 
</table>

The Oxxius Laser Controller controls Oxxius diode lasers (LBX-LD) and Oxxius DPSS lasers (LBX-DPSS) via a serial interface.
To use the USB port of LBX-LD, please contact Oxxius. It is possible to enumerate the USB port as a virtual serial port.


==  LBX-LD  ==
<table><tr>
<td valign=top>'''LBX-LD serial port settings:'''</td><td valign=top>

{| cellspacing="2" border="0" cellpadding=3 
|AnswerTimeout||500 ms
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

</td></tr>
</table>

The following LBX-LD features and operating status may be controlled and/or monitored:

*Analog Modulation Enable/Disable [AM]
*Base-Plate Temperature [?BT]
*Control mode APC/ACC [APC]
*Laser diode current [?C]
*Laser diode current set-point [SC]
*Digital modulation Enable/Disable [TTL]
*Fault number [?F]
*Hours [?HH]
*Interlock state [?INT]
*Laser emission activation On/Off [L]
*Laser status [?STA]
*Maximum laser current [?MAXLC]
*Maximum laser power [?MAXLP]
*Laser output power [?P]
*Laser power set-point [SP]
*Serial number and wavelength [?INF]
*Software version [?SV]


==  LBX-DPSS  ==

<table><tr>
<td valign=top>'''LBX-DPSS serial port settings:'''</td><td valign=top>

{| cellspacing="2" border="0" cellpadding=3 
|AnswerTimeout||500 ms
|-
|BaudRate||38400
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

The following LBX-DPSS features and operating status may be controlled and/or monitored:

*Base-Plate Temperature [BT?]
*Controller temperaure [ET?]
*Fault [AL?]
*Hours [TM?]
*Laser activation On/Off [DL]
*Laser status [DL?]
*Laser output power [IP?]
*Laser power set-point (%) [IP]
*Serial number [HID?]
*Software version [VE?]
*Wavelength [INF?]

The Oxxius GUI software may be helpful for initial configuration and testing of lasers in a Micro-Manager controlled system.
