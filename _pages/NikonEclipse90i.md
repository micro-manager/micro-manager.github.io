---
autogenerated: true
title: NikonEclipse90i
redirect_from: /wiki/NikonEclipse90i
layout: page
---

## Nikon Eclipse 90i motorized microscope

|               |                                                                                                                                                                                          |
|---------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Summary:      | Adapter for Nikon Eclipse 90i motorized microscope.                                                                                                                                      |
| Authors:      | Nico Stuurman, Egor Zindy                                                                                                                                                                |
| Maintainers:  | Egor Zindy                                                                                                                                                                               |
| License:      | Source code cannot be made available                                                                                                                                                     |
| Platforms:    | Windows, Mac, and Linux                                                                                                                                                                  |
| Devices:      | Eclipse hub, Nosepiece, Z-Stage, Optical path, Analyzer control, Transmitted Light (shutter and voltage), Zoom, DIA Field Stop, EPI Field Stop, Filter changer, Epi-fluorescence shutter |
| Since version | 1.4.18                                                                                                                                                                                   |

------------------------------------------------------------------------


## Introduction

This adapter communicates with the Nikon Eclipse 90i through its own
driver. On the Mac and Linux you will not have to do anything.

## Preparation (Windows)

On Windows, you will need to install the driver provided in this [Nikon
Eclipse 90i
Driver](https://github.com/micro-manager/MMDrivers/raw/refs/heads/main/NikonEclipse90i/installer_x64.exe) folder
(Caution: virus scanners \*may have\* detected viruses in these drivers
but there is no confirmation of actual viruses as of yet, please
download at your own risk. Do let us know if this is happening to you).

When installing in windows you will likely replace the driver supplied
by Nikon (and the Nikon supplied application will not work anymore).
Don't worry, you can always re-install the Nikon supplied driver (don't
loose it!).

To update the driver, open up the Windows Device Manager
(Start-&gt;Control Panels-&gt;System, select Tab Hardware , click on
button Device Manager). Then find the 90i under Imaging Devices if the
Nikon driver was previously installed, or under Unknown devices if not.

![\|thumb\|center\|upright=2.5\|alt=Device Manager.\|Windows 7's device
manager is displaying the Nikon 90i as an unknown
device](/media/Device_manager_unkown.png "|thumb|center|upright=2.5|alt=Device Manager.|Windows 7's device manager is displaying the Nikon 90i as an unknown device")

Right click and select 'Update Driver'. Select 'Install from specific
location' and click 'Next'. Select 'Don't search. I will choose the
driver to install' and click 'Next'. Click 'Have Disk'. Click 'Browse'
and locate the folder which contains the downloaded drivers. Click 'OK'
and 'Next'.

![\|thumb\|center\|upright=2.5\|alt=Device Manager.\|Windows can't
verify the publisher of this driver
software](/media/Driver_warning_90i.png "|thumb|center|upright=2.5|alt=Device Manager.|Windows can't verify the publisher of this driver software")

{% include notice icon="info" content="The wizard will warn you that 'Windows can't verify the publisher of this driver software'. If you click 'Install this driver software anyway', the driver for the 90i should be successfully installed." %}

## Hardware Configuration Wizard

Open the Hardware Config Wizard with the 90i connected to the PC (and
the correct driver installed) and select 'Eclipse90i' under the
'NikonEclipse90i' folder.

![\|thumb\|center\|upright=2.5\|alt=Hardware Configuration
Wizard.\|Hardware Configuration Wizard. Open the Nikon 90i
folder](/media/Hardware_wizard_90i_1.png "|thumb|center|upright=2.5|alt=Hardware Configuration Wizard.|Hardware Configuration Wizard. Open the Nikon 90i folder")

Under the 'Initialization properties' on page 2 of the wizard, the Nikon
90i port value should appear as 'Nikon ECLIPSE 90i'. Selected this port.

![\|thumb\|center\|upright=2.5\|alt=Hardware Configuration
Wizard.\|Hardware configuration wizard. Select the Nikon ECLIPSE 90i
port](/media/Hardware_wizard_90i_2.png "|thumb|center|upright=2.5|alt=Hardware Configuration Wizard.|Hardware configuration wizard. Select the Nikon ECLIPSE 90i port")

Then add any additional hardware your particular microscope is fitted
with. This could include the nosepiece, Z-stage, optical path, filter
block and any additional zoom, shutter, lamp or diaphragms, and you
should be set to go.

![\|thumb\|center\|upright=2.5\|alt=Hardware Configuration
Wizard.\|Hardware configuration wizard. Add any additional
hardware](/media/Hardware_wizard_90i_3.png "|thumb|center|upright=2.5|alt=Hardware Configuration Wizard.|Hardware configuration wizard. Add any additional hardware")

{% include notice icon="info" content="If you provide magnification information to the system for each of your objectives, MicroManager will automatically calculate the correct pixel size based on the current zoom settings." %}

See the [Configuration Guide](https://micro-manager.org/Micro-Manager_Configuration_Guide) for more information.

## Gotchas

The lamp voltage can only be changed when the lamp is on. You will get a
communication if you try to change the lamp intensity when it's off.

--[Egor Zindy](/users/Zindy) 21:00, 29 July 2014 (GMT)

{% include Listserv_Search text="Nikon" %}
