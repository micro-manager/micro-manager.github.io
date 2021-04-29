== Vortran Stradus VersaLase Multiple Wavelength Laser Module Controller ==

<table><tr><td>
'''Summary:'''</td><td>Vortran Stradus VersaLase Multiple Wavelength Laser Module Controller</td></tr>
<tr><td>'''Author:'''</td><td>David Sweeney</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>All platforms (uses serial port)</td></tr>
<tr><td>'''Devices:'''</td><td>[http://www.vortranlaser.com Vortran Stradus VersaLase]</td></tr>
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

The Vortran Stradus VersaLase Controller controls Stradus VersaLase multiple wavelength laser modules via a serial interface.

The following laser features and operating status may be controlled and/or monitored for each laser housed in the Stradus VersaLase chassis:

*Analog Modulation (External Power Control) ON/OFF [x.EPC = 1 or 0]
*Base-Plate Temperature [?BPT]
*Laser Diode Current [x.?LC]
*Digital Modulation ON/OFF [x.PUL = 1 or 0]
*Digital Peak Power [x.PP = ###]
*Digital Peak Power Setting [x.?PP]
*Fault Code [x.?FC]
*System Firmware Version [?SFV]
*Operating Hours [x.?LH]
*Interlock Status [x.?IL]
*Laser Emission ON/OFF [x.LE = 1 or 0]
*Laser ID (Serial Number, Part Number, Nom. Wavelength, Nom. Power, Circular or Elliptical Beam) [x.?LI]
*Operating Condition (Fault Description) [x.?FD]
*Laser Diode Power [x.LP = ###]
*Laser Diode Power Setting [x.?LPS]

{{Note|When switching Laser Emission to “ON”, laser power and laser current information may not be immediately available.}}
The cause for this is the laser's default 5 second delay between initiating laser emission with a serial command and the actual turn-on of laser emission. If using the Device/Property Browser, simply click the "Refresh" button. For a long term solution the delay may be disabled. To disable the delay, use a terminal program and type “x.delay=0” followed by Enter at the Stradus prompt. This setting will be remembered by the laser until changed.

{{Note|Lasers will automatically be shut off when Micro-Manager closes but power remains on.}}
Switching power off and on or turning laser emission ON within the Micro-Manager Device/Property Manager will restore laser emission.

Below is a screenshot of a properly configured Stradus VersaLase:
(Some property entries for Laser C and Laser D have been truncated in the photo)

[[File:UMgrVersaLase.jpg]]

The Stradus VersaLase GUI software, shown below, which is included on the software CD shipped with systems may be helpful for initial configuration and testing of lasers in a Micro-Manager controlled system. 

[[File:UMgrVersaLaseSW.jpg]]

Questions regarding the VersaLase Micro-Manager device driver may be directed to: [mailto:sales@vortranlaser.com Vortran uManager Driver Support]
 

{{Listserv_Search|Vortran}}

{{Devices_Sidebar}}
