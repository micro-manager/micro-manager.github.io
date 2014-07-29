== Nikon Eclipse 90i motorized microscope ==
{| style="text-align: left"
!Summary:
|Adapter for Nikon Eclipse 90i motorized microscope.
|- valign="top"
!Authors:
|Nico Stuurman, Egor Zindy
|- valign="top"
!Maintainers:
|Egor Zindy
|-
!License:
|Source code cannot be made available
|-
!Platforms:
|Windows, Mac, and Linux
|- valign="top"
!Devices:
|Eclipse hub, Nosepiece, Z-Stage, Optical path, Analyzer control, Transmitted Light (shutter and voltage), Zoom, DIA Field Stop, EPI Field Stop, Filter changer, Epi-fluorescence shutter
|-
!Since version
|1.4.18
|}
----
__TOC__
== Introduction ==
This adapter communicates with the Nikon Eclipse 90i through its own driver. On the Mac and Linux you will not have to do anything.

== Preparation (Windows) ==
On Windows, you will need to install the driver provided in this [http://valelab.ucsf.edu/~MM/drivers/NikonEclipse90i.zip Nikon Eclipse 90i Driver] folder (Caution: virus scanners *may have* detected viruses in these drivers but there is no confirmation of actual viruses as of yet, please download at your own risk. Do let us know if this is happening to you).

When installing in windows you will likely replace the driver supplied by Nikon (and the Nikon supplied application will not work anymore).  Don't worry, you can always re-install the Nikon supplied driver (don't loose it!).

To update the driver, open up the Windows Device Manager (Start->Control Panels->System, select Tab Hardware , click on button Device Manager).  Then find the 90i under Imaging Devices if the Nikon driver was previously installed, or under Unknown devices if not.

[[File:Device manager unkown.png||thumb|center|upright=2.5|alt=Device Manager.|Windows 7's device manager is displaying the Nikon 90i as an unknown device]]

Right click and select 'Update Driver'.  Select 'Install from specific location' and click 'Next'.  Select 'Don't search.  I will choose the driver to install' and click 'Next'. Click 'Have Disk'.  Click 'Browse' and locate the folder which contains the downloaded drivers. Click 'OK' and 'Next'.

[[File:Driver warning 90i.png||thumb|center|upright=2.5|alt=Device Manager.|Windows can't verify the publisher of this driver software]]

{{Note|The wizard will warn you that 'Windows can't verify the publisher of this driver software'. If you click 'Install this driver software anyway', the driver for the 90i should be successfully installed.}}        

== Hardware Configuration Wizard ==

Open the Hardware Config Wizard with the 90i connected to the PC (and the correct driver installed) and select 'Eclipse90i' under the 'NikonEclipse90i' folder.

[[File:Hardware wizard 90i 1.png||thumb|center|upright=2.5|alt=Hardware Configuration Wizard.|Hardware Configuration Wizard. Open the Nikon 90i folder]]

Under the 'Initialization properties' on page 2 of the wizard, the Nikon 90i port value should appear as 'Nikon ECLIPSE 90i'.  Selected this port.

[[File:Hardware wizard 90i 2.png||thumb|center|upright=2.5|alt=Hardware Configuration Wizard.|Hardware configuration wizard. Select the Nikon ECLIPSE 90i port]]

Then add any additional hardware your particular microscope is fitted with. This could include the nosepiece, Z-stage, optical path, filter block and any additional zoom, shutter, lamp or diaphragms, and you should be set to go.  

[[File:Hardware wizard 90i 3.png||thumb|center|upright=2.5|alt=Hardware Configuration Wizard.|Hardware configuration wizard. Add any additional hardware]]

{{Note|If you provide magnification information to the system for each of your objectives, MicroManager will automatically calculate the correct pixel size based on the current zoom settings.}}

See [//micro-manager.org/documentation.php?object=Configguide#Calibration:See configuration guide] for more information.

== Gotchas ==

The lamp voltage can only be changed when the lamp is on. You will get a communication if you try to change the lamp intensity when it's off.

--[[User:Zindy|Egor Zindy]] 21:00, 29 July 2014 (GMT)

{{Listserv_Search|Nikon}}

{{Devices_Sidebar}}
