== Twain Camera adapter ==

{{Note|The TwainCamera device adapter is broken in recent versions of Micro-Manager.}}

<table><tr><td>
'''Summary:'''</td><td>Adapter for cameras that support imaging standard of twain.org  [http://www.twain.org]</td></tr>
<tr><td>'''Author:'''</td><td>Karl Hoover, UCSF</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows</td></tr>
<tr><td>'''Devices:'''</td><td>Cameras supporting Twain imaging standard; they must implement full control API</td></tr>
<tr><td>'''Available since version:'''</td><td>1.3.41</td>
</table>

The code for this adapter was written by Karl Hoover. Notes: You'll need to install the optional Twain software that comes with your camera. In this process, you'll also need to install TWAINDSM.DLL, which is the Twain data source manager. The latest version of the DSM is available at Sourceforge: [http://sourceforge.net/projects/twain-dsm/files/]  As of 1.3.41b, if the library is not correctly installed, the hardware configuration wizard will show you the following message upon selecting the Twain camera device:

[[Image:Twain_TWAINDSM.DLL_MISSING.GIF]]

Also please double check that the camera has a 'controllable' UI. Use twain.org's "Twain2 Sample App" program select your camera, press "Connect to Data Source" Your camera must report CAP_UICONTROLLABLE  = true.


[[Image:TWAIN_CAP_UICONTROLLABLE.GIF]]

Changes in 1.3.41:<br>
• Initial release. Leica DFC cameras are operational <br>

{{Listserv_Search|TWAIN}}
