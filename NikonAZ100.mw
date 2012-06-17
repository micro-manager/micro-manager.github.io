== Nikon AZ100 motorized zoom microscope ==

<table><tr><td>
'''Summary:'''</td><td>Adapter for Nikon AZ100 motorized microscopes</td></tr>
<tr><td>'''Author:'''</td><td>Nico Stuurman</td></tr>
<tr><td>'''License:'''</td><td>Source code cannot be made available</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows, Mac, and Linux</td></tr>
<tr><td valign='top'>'''Devices:'''</td><td>AZ100Hub, Nosepiece, Focus, Zoom</td></tr>
<tr><td width=20%>'''Example Config File:'''</td><td></td></tr>
<tr><td width=20%>'''Since version'''</td><td>1.2.19</td></tr>
</table>

This adapter communicates to the AZ100 through its own driver.  On Windows, you will need to install the driver provided in this [http://valelab.ucsf.edu/~MM/drivers/NikonAZ100.zip Nikon AZ100 Driver] folder (Caution: virus scanners detected viruses in these drivers but there is no confirmation of actual viruses as of yet, please download at your own risk).  When installing in windows you will likely replace the driver supplied by Nikon (and the Nikon supplied application will not work anymore).  Don't worry, you can always re-install the Nikon supplied driver (don't loose it!). On the Mac and Linux you will not have to do anything.

To update the driver, open up the Windows Device Manager (Start->Control Panels->System, select Tab Hardware , click on button Device Manager).  Then find the AZ100 (under Imaging Devices if the Nikon driver was previously installed).  Right click and select 'Update Driver'.  Select 'Install from specific location' and click 'Next'.  Select 'Don't search.  I will choose thedriver to install' and click 'Next'. Click 'Have Disk'.  Click 'Browse' and locate the folder which contains the downloaded drivers. Click 'OK' and 'Next'.  The wizard should tell you that it succesfully installed the driver for the AZ100.        

When running the Hardware Config Wizard with the AZ100 connected to the PC (and the correct driver installed), the Nikon AZ100 should appear on the COM ports page (page 2 of the wizard).  Selected this port.  Then add the AZ100Hub, Nosepiece (which is read-only, i.e. it is not motorized only encoded), Focus and Zoom.  Add the NikonAZ100 port as a pre-initialization property to the AZ100Hub, and you should be set to go.  

If you provide magnification information to the system for each of your objectives, (http://micro-manager.org/documentation.php?object=Configguide#Calibration) MicroManager will automatically calculate the correct pixel size based on the current zoom settings.

{{Note|The AZ100 has two modes: 'mouse' control, and computer control.  To switch to computer control mode, the Focus drive will re-initialize which causes it to go all the way to the top and back down where it was.  Currently, there is nothing that can be done about this.}}

--[[User:Nico|Nico]] 16:42, 10 June 2008 (PDT)

{{Listserv_Search|Nikon}}

{{Devices_Sidebar}}
