== Vortran Stradus Laser Controller ==

<table><tr><td>
'''Summary:'''</td><td>Vortran Stradus Laser Controller</td></tr>
<tr><td>'''Author:'''</td><td>David Sweeney</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>All platforms (uses serial port)</td></tr>
<tr><td>'''Devices:'''</td><td>[http://www.vortranlaser.com Vortran Stradus Laser]</td></tr>
<tr>
<td valign=top>'''Default serial port settings:'''</td><td valign=top>

{| cellspacing="2" border="0" cellpadding=3 
|AnswerTimeout||5 Seconds
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

The Vortran Stradus Laser Controller controls Stradus diode lasers via a serial interface.

The following laser features and operating status may be controlled and/or monitored:

*Analog Modulation (External Power Control) ON/OFF [EPC = 1 or 0]
*Base-Plate Temperature [?BPT]
*Laser Diode Current [?LC]
*Digital Modulation ON/OFF [PUL = 1 or 0]
*Digital Peak Power [PP = ###]
*Digital Peak Power Setting [?PP]
*Fault Code [?FC]
*Firmware Version [?FV]
*Operating Hours [?LH]
*Interlock Status [?IL]
*Laser Emission ON/OFF [LE = 1 or 0]
*Laser ID (Serial Number, Part Number, Nom. Wavelength, Nom. Power, Circular or Elliptical Beam [?LI]
*Operating Condition (Fault Description) [?FD]
*Laser Diode Power [LP = ###]
*Laser Diode Power Setting [?LPS]

{{Note|When switching Laser Emission to “ON”, laser power and laser current information may not be immediately available.}}
The cause for this is the laser's default 5 second delay between initiating laser emission with a serial command and the actual turn-on of laser emission. If using the Device/Property Browser, simply click the "Refresh" button. For a long term solution the delay may be disabled. To disable the delay, use a terminal program and type “delay=0” followed by Enter at the Stradus prompt. This setting will be remembered by the laser until changed.

{{Note|Lasers will automatically be shut off when Micro-Manager closes but power remains on.}}
Switching power off and on or turning laser emission ON within the Micro-Manager Device/Property Manager will restore laser emission.

Below is a screenshot of a properly configured Stradus Laser:

[[File:UMgrStradus.JPG]]

The Stradus GUI software, shown below, which is included on the software CD shipped with Stradus lasers may be helpful for initial configuration and testing of lasers in a Micro-Manager controlled system. 

[[File:UMgrStradusSW.jpg]]

Questions regarding the Stradus Micro-Manager device driver may be directed to: [mailto:sales@vortranlaser.com Vortran uManager Driver Support]
 

{{Listserv_Search|Vortran}}

{{Devices_Sidebar}}
