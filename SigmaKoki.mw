== SigmaKoki adapter ==

<table><tr><td>
'''Summary:'''</td><td>Interfaces with Sigma Koki controllers and associated hardware</td></tr>
<tr><td>'''Author:'''</td><td>Sigma Koki</td></tr>
<tr><td>'''License:'''</td><td>?</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows, Mac and Linux (uses serial interface)</td></tr>
<tr><td>'''Devices:'''</td><td>Shutter, XYZ Stage, Camera</td></tr>
</table>

The dll files mmgr_dal_SigmaKoki.dll and mmgr_dal_SigmaKokiCamera.dll can be available from following site.
http://www.sigma-koki.com/pages/support/software/sample_jp.php
Camera driver should be installed before MM setting. Camera driver is available at http://sentech.co.jp/en/products/USB/software.html#cnt2nd

Version 1.4(1.4.22 32/64bit) of MM is compatible. Later versions of MM might contain the dll.

<table border="1"><tr>
<td>device</td><td>XYStage </td><td>ZStage </td><td>Shutter</td></tr>
<tr><td>AnserTimeout</td><td>500</td><td>500</td><td>500</td></tr>
<tr><td>BaudRate</td><td>4800, 9600, 19200, 38400, 57600</td><td>4800, 9600, 19200, 38400, 57600</td><td>9600, 19200, 38400</td></tr>
<tr><td>DelayBetweenCharsMs</td><td>0</td><td>0</td><td>0</td></tr>
<tr><td>Parity</td><td>none</td><td>none</td><td>none</td></tr>
<tr><td>StopBite</td><td>1</td><td>1</td><td>1</td></tr>
<tr><td>HandShake</td><td>Off</td><td>Off</td><td>Off</td></tr>
<tr><td>Verbose</td><td>1</td><td>1</td><td>1</td></tr>
</table>
BaudRate should be selected according to the device.

Notes for the SHOT controllers:
* Make sure that the controller is in Host control mode
* Make sure that the INTERFACE of the controller is set to RS232C
* Make sure that the BAUD rate selected in the controller is the same as used here
* Make sure that the DELIMITER in the controller is CRLF

Step size of XY stage is fixed to 0.1 um or 0.01um depending on the type of the stage. Z stage can change stepsize at "Preset". Detail information is included in the document with downloading zip archive. 

{{Devices_Sidebar}}
