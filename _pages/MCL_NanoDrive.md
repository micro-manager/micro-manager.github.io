{| style="text-align:left"
!valign="top"|Summary:
| Controls [http://www.madcitylabs.com/ Mad City Labs (MCL)] Nano-Drive&reg; XY(Z) and Z stages
|- valign="top"
!Author:
| Mad City Labs
|- valign="top"
!License:
| BSD
|-
!Platforms:
| Windows 7/8/10 (32 bit and 64 bit)
|- valign="top"
!Devices:
| XY Stage, Z Stage
|- valign="top"
!Example Config File:
| [[Media:MMConfig_MCL_NanoDrive.cfg|Example Config File]] (Sets up the Nano-Drive&reg; with the DemoCamera.)
|- valign="top"
!Since version
| 1.2.36
|}
----

Controls the XY(Z) and Z stages of Mad City Lab's [http://www.madcitylabs.com/nanodrive.html Nano-Drive&reg;] series of controllers with USB digital interface installed.

The Nano-Drive&reg; series of controllers are a complete electronic solution for precision positioning using Mad City Labs nanopositioners.  All controllers are closed-loop feedback enabled, which is essential for high-repeatability and sub-nanometer resolution for a nanopositioner. 

For fast acquisition using [[Hardware-based_synchronization]], custom versions of MCL's controllers are available (NanoDrive-x or NanoDrive85-x equipped with a USB board '''and''' the OP-ISS programmable port); they feature a sequence buffer with 1000 positions. Read more on fast multi-channel stack acquisition using hardware triggering in [https://github.com/vanNimwegenLab/MiM_NikonTi/blob/master/Docs/NikonTi_hardware_triggering.md this step-by-step tutorial] (by Guillaume Witz & Thomas Julou).

The following properties are currently implemented in the Micro-Manager MCL Nano-Drive&reg; adapter:
{| class="wikitable"
!style="width: 20%;"| Property
! Description
|- valign="top"
| Settling Time || This value can be changed for each axis to set the time (in ms) the Nano-Drive&reg; waits after moving before reading the current position.  The default time is 100ms.  Choosing an unreasonably small settling time will result in measurement errors.  Mad City Labs nanopositioner settling times are typically 1ms or greater, depending on system model and calibration settings.  Please contact MCL if you are unsure what are safe settling time values to input for your particular system model.
|- valign="top"
| Set Origin || Sets the current position as the origin.  After setting the origin, you must exit the Device/Property Browser and then re-enter it to make sure the position slidebar takes the new origin into account.  In order to set the origin to the original orgin, click on the "Calibrate" button on the XY(Z) Position List.
|- valign="top"
| Use Sequence || (only with customised controller) makes the stage sequenceable, i.e. whenever a trigger is received (from the camera) the stage moves to the next position of a pre-defined series. 
|- valign="top"
| Shift Sequence by 1 || (only with customised controller) if using the sequenceable mode and a camera where triggers happen at the end of each frame acquisition, enabling this property allows to move the stage at the first trigger already. This is useful when using the sequenceable features of MDA.
|}

{{Devices_Sidebar}}
