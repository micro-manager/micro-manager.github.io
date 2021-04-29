<table><tr><td>
'''Summary:'''</td><td>Interfaces with Princeton Instruments cameras that work with the PVCAM driver</td></tr>
<tr><td>'''Authors:'''</td><td>Nenad Amodaj, with contributions from Nico Stuurman (Mac adaptation) and Ji Yu (expose more PVCAM properties), Oleksiy Danikhnov, Arthur Edelstein (reliability in streaming mode), and Rob Allen (Princeton Instruments)</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows, 32-bit only</td></tr>
<tr><td>'''Devices:'''</td><td>PVCAM compatible cameras</td></tr>
<tr><td>'''Driver Needed:'''</td><td>[http://www.princetoninstruments.com/support/software.aspx Princeton Instruments PVCAM]</td></tr>
</table>

See also: [[PICAM]] for recent Princeton Instruments cameras on 64-bit Windows

== Installation ==

This adapter will work with Princeton Instrument (PI) cameras that work with PVCAM.  Be aware that you will need to install the [http://www.princetoninstruments.com/support/software.aspx PI version for PVCAM]. If you had previously installed the Photometrics version of PVCAM, then you need to manually complete de-installation using the following instructions: [[Image:PhotometricsUninstall.zip]]

If you encounter the following error message on startup:
''Error code: 39<br>''
''Line 14: Property,Core,Initialize,1<br>''
''Error code: 22<br>''
''Device Undefined. Duplicate property names are not allowed.<br>''
then Micro-Manager was most likely not terminated in a graceful way during the previous session.  Simply quit Micro-Manager, reboot your camera (by switching it off and back on again) and try again.


{{Listserv_Search|Princeton}}

{{Devices_Sidebar}}
