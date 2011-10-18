== ABS Camera adapter ==

<table><tr><td>
'''Summary:'''</td><td>Adapter for cameras from [http://www.kameras.abs-jena.de/produkte_de.html ABS]</td></tr>
<tr><td>'''Author:'''</td><td>Michael Himmelreich and Heiko</td></tr>
<tr><td>'''License:'''</td><td>?</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows, 32 and 64-bit </td></tr>
<tr><td>'''Devices:'''</td><td>ABS cameras</td></tr>
<tr><td>'''Available since version:'''</td><td>1.3.18 (64 bit from 1.4.7)</td>
</table>

The code for this adapter was written by Michael Himmelreich and donated to the Micro-Manager source code repository.

Changes in 1.3.40:<br>
• Support of API version 31 <br>
• Property: „ColorMode“ added, valid values „Color“ and „Grayscale“ <br>
• Property: „Pixeltype“ changed, valid values „8Bit“, „10Bit“ and „12Bit“ 
(10/12 Bit will be dynamically available if supported by camera => result in 16Bit images) 
=> to setup the old pixeltype „32Bit_RGB“: select „Color“ and „8Bit“ <br>
• Streaming support added <br>
• Hardwaresupport of properties „TransposeMirrorX“ and „TransposeMirrorY“ <br>
• CamUSB_Api.dll is no longer necessary to avoid a chrash <br>
=>  mmgr_dal_ABSCamera.dll device description will be automatically changed to „CamUSB_Api.dll not found or wrong version!“ <br>
• Dynamically support of multiple ABS Camera Devices <br>
„ABSCam“ is base device name and the name of the first available device <br>
=> „ABSCam00“ also the first device <br>
=> „ABSCam01“ second device and so on <br>
The „Hardware Configuration Wizard...“ will show all available ABS devices.<br>

{{Listserv_Search|ABS}}

{{Devices_Sidebar}}
