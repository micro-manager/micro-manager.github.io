<table><tr><td>
'''Summary:'''</td><td>Bluebox Optics niji 7 channel LED light source</td></tr>
<tr><td>'''Author:'''</td><td>Egor Zindy</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>All</td></tr>
<tr><td>'''Devices:'''</td><td>[http://www.blueboxoptics.com/]</td></tr>
<tr><td>'''Since Version:'''</td><td>1.4.23 20170906</td></tr>
<tr><td valign=top>'''Default serial port settings:'''</td><td valign=top>

{| cellspacing="2" border="0" cellpadding=3
|BaudRate||115200
|-
|DelayBetweenCharsMs||0
|-
|Handshaking||Off
|-
|Parity||None
|-
|StopBits||1
|}

</td>
</tr>
</table>
----

The niji is an LED-based solid light source.

== Installation ==

On versions of Windows older than Windows 10, the driver supplied by BlueboxOptics must be installed first. Windows 10 and Linux recognise the niji as a serial device automatically.

== Device Configuration ==

Remember to set the baudrate of the COM port to 115200.

== Properties ==

To view or edit the niji properties, open the "Tools" menu and select "Device/Property Browser". The following settings are available:

=== Read-only parameters ===

* AmbientTemp : Ambient temperature inside the enclosure.
* OutputTemp : temperature sensor located towards the front.
* Name : niji model name.
* Description : model description.
* FirmwareVersion : Firmware version installed on the niji.
* ErrorCode : Error Code identifier.
* GlobalStatus : String associated with the error code.

=== Global parameters ===

* State : Global shutter state for the niji (0 or 1).
* GlobalIntensity : Global intensity value. Multiplied by each channel intensity, it defines the individual intensity values.
* OutputMode : Either "Constant Current" or "Constant Optical Power".
=== Channel parameters ===

* Channel[1-7]Intensity : Individual intensity value between 0 and 100.
* Channel[1-7]State : Individual shutter state (0 or 1).

=== Trigger parameters ===

* TriggerLogic : Either "Active High" or "Active Low".
* TriggerResistor : Either "Pull Up" or "Pull Down".
* TriggerSource : Either "Internal" or "External".

== Single LED excitation presets ==

For single LED excitation, two groups are required:

[[File:niji_configuration_settings.png]]

* "Channel Label" for selecting the LED channel
* "Global Intensity" to control the light output intensity (this affects all 7 LEDs).

[[File:niji_group_channel_label.png]]
[[File:niji_group_global_intensity.png]]

By default, the individual LED intensities are set to 100%, but a different value can be set through mmStartup.bsh. For example, to set each LED intensity at 20%, add the following code to your mmStartup.bsh:

  sd = mmc.getShutterDevice();
  for (long index=1; index < 8; index++)
    mmc.setProperty(sd, "Channel"+index+"Intensity", "20");

This will peg the maximum intensity of each LED to 20%. In that case, varying the Global intensity between 0 and 100 will vary each LED intensity between 0 and 20%.

== Multi-LED groups and presets ==

In some cases, it is advantageous to have a preset with more than one LED on at the same time. For example, a dual LED excitation used together with some image splitting optics. Or a "white light" preset for visual inspection.

This can be achieved by adding all 7 channel states in a group:

[[File:niji_group_multiled.png]]

and creating presets of interest using a combination of any (multiple or single) channels:

[[File:niji_group_multiled_preset.png]]

For completeness and maximum flexibility, it is possible to also add all 7 intensities to the group if different max output intensities are required for each preset.

[[File:niji_group_multiled_intensity.png]]

In that case, the output of each LED is defined by the maximum output allowed for the preset, multiplied by the global intensity given to the user as an additional group setting as in the "single LED presets" section above.

[[File:niji_group_multiled_intensity_preset1.png]]
[[File:niji_group_multiled_intensity_preset2.png]]

== Bi-directional communication ==

Two serial ports at the back (one USB, one RS-232) allow simultaneous control of the niji from two different devices.

If the USB port is used by the micro-manager PC to communicate with the niji, a USB to serial cable can be used to connect the niji to a small touch-screen PC running the control software provided by Bluebox optics.

A Windows tablet or small factor PC with a touch screen (such as the [https://www.startpage.com/do/dsearch?query=pipo+x8 PiPO X8]) can act as a useful interface to control the niji manually:

[[File:niji_pipo.jpg|500px]]

The micro-manager niji adapter listens to changes effected via the secondary port and updates its properties accordingly.

{{Devices_Sidebar}}
