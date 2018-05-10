<table><tr><td>
'''Summary:'''</td><td valign="top">Device adapter for Thorlabs USB cameras</td></tr>
<tr><td>'''Author:'''</td><td>Christophe Dupre and Nenad Amodaj</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows</td></tr>
<tr><td valign="top">'''Devices:'''</td><td>DCU223M, DCU223C, DCU224M, DCU224C, DCC1545M, DCC1645C, DCC1240M, DCC1240C, DCC3240x.
Has been developed and tested with the DCC1545M and DC3240M</td></tr>
<tr><td width=20%></td><td></td></tr>
<tr><td>'''Available since version:'''</td><td>1.4.14 nightly build of 02/06/2013</td>
</table>

'''Procedure:'''
Install latest version of Micromanager (this device adapter was first included in the nightly build of 02/06/2013).
Install Thorlabs camera software (http://www.thorlabs.us/navigation.cfm?Guide_ID=2205) and plug camera to your computer.
Test that the camera works with the software provided by Thorlabs.
Run MM and make a config file that uses the device adapter "ThorlabsUSBCamera".

{{Note|If you see ThorlabsUSBCamera listed as "(unavailable)" in the Hardware Configuration Wizard, try removing the file mmgr_dal_IDS_uEye.dll from your Micro-Manager installation and restarting Micro-Manager. (The two device adapters will conflict with each other until a fix to Micro-Manager itself addressing this issue is available.)}}

'''Notes:'''
Besides USB2 and USB3 cameras, this adapter should also support GigE cameras of the same DCx family (but never tested).

Built with the SDK version 4_20. 

Hardware ROI function currently not supported.

{{Note|As of May 10th, 2018, the pixelClockMHz property is set to the lowest value possible on startup.  This change was made to avoid hard to pinpoint errors while acquiring images. To make the camera operate faster, experiment with the pixelClockMHz property and set it to the highest value where the camera still works reliably, then add the pixelClockMHz property to the System-Startup group.  Thanks to the AQLM 2018 students for figuring this out!)}}
