---
autogenerated: true
title: ThorlabsAPTStage
redirect_from: /wiki/ThorlabsAPTStage
layout: page
---

|              |                                                       |
|--------------|-------------------------------------------------------|
| Summary:     | Interfaces with Thorlabs APT devices and controllers. |
| Authors:     | Emilio J. Gualda and Egor Zindy                       |
| Maintainers: | Egor Zindy                                            |
| License:     | BSD                                                   |
| Platforms:   | Windows (32 bit only)                                 |
| Devices:     | TDC001, ...                                           |

------------------------------------------------------------------------

## Introduction

From the [Thorlabs APT
page](http://www.thorlabs.de/software_pages/ViewSoftwarePage.cfm?Code=apt):
The APT family comprises a wide range of motion controller products
ranging from small, low-power, single-channel optomechanical drivers
(T-Cube Series) to high-power, multi-channel, modular 19" rack
nanopositioning systems (the APT Rack System). The APT System Software
is a common software platform for all controllers in the APT family.

The ThorlabsAPTStage adapter aims to provide a unified adapter for all
the Thorlabs APT stages.

## Preliminary support for 64bit Windows

Support for 64-bit APT device control is now integrated into the main
Micromanager build. However, you still need to download the 64-bit
APT.dll file from here: [APT_x64.zip](/media/files/APT_x64.zip) and place it
in the main Micromanager folder.

Do not forget to install the 64 bit APT drivers from Thorlabs as per the
instructions further down. Until you do (or if the 64 bit APT.dll is
missing from the micromanager folder), the ThorlabsAPTStage will be
greyed out from the hardware setup device list.

## Requirements

The ThorlabsAPTStage device adapter requires the 32-bit Micro-Manager, a
recent 32-bit version of the APT software and an additional APT.dll file
available to download from this website.

First you will need to download and install the APT software from the
[Thorlabs
website](http://www.thorlabs.co.uk/software_pages/ViewSoftwarePage.cfm?Code=apt).

Then download the [APT.zip](/media/files/APT.zip) file and decompress the
APT.dll file into your Micro-manager folder. As of 2014-07-04, the
APT.dll version which works with the current Thorlabs drivers is
v1.0.0.3. The file is 1.71MB decompressed and its MD5 checksum is
c966684580e4d373338b4b4c1640e817

## Device support

At the moment, the following APT devices / controllers will be
recognised, although only the TDC001 stages have been extensively
tested. If you have had success with any of these, please amend the wiki
or [send me an email](mailto:egor.zindy@manchester.ac.uk).

| Part number | Description                                              | Supported | Notes |
|-------------|----------------------------------------------------------|-----------|-------|
| BSC001      | 1 Ch benchtop stepper driver                             | Untested  |       |
| BSC101      | 1 Ch benchtop stepper driver                             | Untested  |       |
| BSC002      | 2 Ch benchtop stepper driver                             | Untested  |       |
| BDC101      | 1 Ch benchtop DC servo driver                            | Untested  |       |
| SCC001      | 1 Ch stepper driver card (used within BSC102,103 units)  | Untested  |       |
| DCC001      | 1 Ch DC servo driver card (used within BDC102,103 units) | Untested  |       |
| ODC001      | 1 Ch DC servo driver cube                                | Untested  |       |
| OST001      | 1 Ch stepper driver cube                                 | Untested  |       |
| MST601      | 2 Ch modular stepper driver module                       | Untested  |       |
| TST001      | 1 Ch Stepper driver T-Cube                               | Untested  |       |
| TDC001      | 1 Ch benchtop stepper driver                             | Yes       |       |

## Installing a new stage (an example)

In the following example, we have 4 TDC001 controllers, each controlling
a different type of stage. X,Y are controlling MTS25-Z8 linear stages, Z
is controlling a MTS50-Z8 linear stage and we also have a PRM1-Z8
rotation stage.

To check that your PC is communicating with all the stages, you can
launch the APT Configuration Utility.

![\|thumb\|center\|upright=2.5\|alt=APTConfig.\|The Thorlabs APT
Configuration Utility displaying 4
controllers.](/media/Aptconfig.png "|thumb|center|upright=2.5|alt=APTConfig.|The Thorlabs APT Configuration Utility displaying 4 controllers.")

Note: In order for APTConfig to display the list of available stages,
Micro-manager must be closed. Make sure you do not run both at the same
time.

In Micro-manager's Hardware Configuration Wizard, select
ThorlabsAPTStage. Each unique controller only appears once.

![\|thumb\|center\|upright=2.5\|alt=Hardware config
wizard.\|Micro-manager's Hardware Configuration Wizard displays a single
TDC001
controller.](/media/Hardwarewiz.png "|thumb|center|upright=2.5|alt=Hardware config wizard.|Micro-manager's Hardware Configuration Wizard displays a single TDC001 controller.")

To add a stage, click the APT controller and give it a unique name. Then
select its Serial Number from the drop-down menu. This number is
displayed on the controller itself.

Additionally, you may need to select a channel number (for APT
controllers controlling more than one channel).

At this point, you can also set software limits. This is to ensure that
the stage will only travel a limited range.

Note for now (as of 1.4.17): if you change the soft limits, the stage
may not initialize properly.

![\|thumb\|center\|upright=2.0\|alt=Hardware config wizard.\|Adding a
ThorlabsAPTStage device and selecting its Serial
Number.](/media/Hardwarewiz_device.png "|thumb|center|upright=2.0|alt=Hardware config wizard.|Adding a ThorlabsAPTStage device and selecting its Serial Number.")

## Homing procedure (preliminary)

APT stages must be "homed" first before any further commands can be
sent.

For each of the stages defined in micro-manager, create a Group with the
"Home" property. ![\|thumb\|center\|upright=2.5\|alt="Go Home" group
property.\|Adding Initialisation groups, one for each
stage.](/media/Apt_zhome.png "fig:|thumb|center|upright=2.5|alt="Go Home" group property.|Adding Initialisation groups, one for each stage.")

Then when you want one of the stages initialised, simply set the group
value to 1.

![\|thumb\|center\|upright=2.5\|alt=Micromanager APT initialisation
groups.\|Set the Preset value to 1 to initialise the stages
individually.](/media/Mm_aptstages.png "|thumb|center|upright=2.5|alt=Micromanager APT initialisation groups.|Set the Preset value to 1 to initialise the stages individually.")


## Compilation notes, 64-bit device adaptor

Drop the content of [APT_x64.zip](/media/files/APT_x64.zip) into the device adapter
micromanager-upstream\\DeviceAdapters\\ThorlabsAPTStage folder then
compile the adapter as a x64 / release dll.

Once compiled, copy
micromanager-upstream\\DeviceAdapters\\ThorlabsAPTStage\\build\\Release\\x64\\mmgr\_dal\_ThorlabsAPTStage.dll
to your micromanager folder, as well as the 64 bit APT.dll file in the
zip archive above.
