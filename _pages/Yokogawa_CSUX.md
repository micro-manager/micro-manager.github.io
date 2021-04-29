== Yokogawa CSUX adapter ==

<table><tr><td>
'''Summary:'''</td><td>Controls Yokogawa CSUX (all models)</td></tr>
<tr><td>'''Author:'''</td><td>Nico Stuurman</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows, Mac OS X and linux (serial port)</td></tr>
<tr><td>'''Devices:'''</td><td>Yokogawa CSUX Hub, Filter Wheel, Dichroic, Shutter, DriveSpeed</td></tr>
<tr><td>'''Micro-Manager version:'''</td><td>1.2.11</td></tr>
<tr><td valign=top>'''Serial port settings:'''</td><td valign=top>

{| cellspacing="2" border="0" cellpadding=3
|AnswerTimeout||8000
|-
|BaudRate||115200
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

This adapter interfaces to the [http://www.yokogawa.com/ Yokogawa] [http://www.yokogawa.com/scanner/products/csuX1e.htm CSUX] family of spinning disk confocal scanheads.  There is no additional software needed.  Connect the CSUX controller to an available serial port on your computer.   You will need to define the ''Hub'' device, and assign the correct serial port to it. 

The CSUX can have up to 2 filter wheels.  If you have only one, use the default number (1) for your filter wheel.  DriveSpeed has a property called 'AutoAdjust'.  You can enter here the exposure time (in milliseconds) you are using.  The scanhead will then calculate a disk speed at which you will get a integral number of disk rotations during that exposure.  This can help reduce artefacts in your image.  If you change the disk speed using other controls, the value for this property will go back to 0. 
{{Note|After changing drive speed, the software will wait until the speed is within ~5% of its final target.  Use the "Refresh" button to get the correct speed.}}

As of version 1.3.38, MIcro-Manager supports the bright field bypass option.  There is no support for the second camera port option (although control can easily be added by anyone having access to such a scan-head).

If you experience a very uneven field of illumination in the CSUX, please check out [[CSU-X_fiber_rotation]] page.

The CSU-X1 requires a null modem cable.


{{Devices_Sidebar}}
