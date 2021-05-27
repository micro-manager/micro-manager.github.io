<table>
<tr><td>'''Summary:'''</td><td>89-North Laser Diode Illuminator (LDI)</td></tr>
<tr><td>'''Authors:'''</td><td>Elliot Steele</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr>
<tr><td>'''Platforms:'''</td><td>Windows*</td></tr>
<tr><td>'''Devices:'''</td><td>All 89-North LDI models (LDI-7 and NIR tested)</td></tr>
<tr><td>'''Manufacturer Website:'''</td><td>[https://www.89north.com/fluorescence-microscopy-products-by-brand/89-north/ldi-laser-diode-illuminator/ 89north.com]</td></tr>
<tr><td>'''Example Config File:'''</td><td>TODO</td></tr>
</table>

<nowiki>*</nowiki> Communication is via serial over USB so in theory these drivers could work on Mac and Linux, however, this has not been tested and may require driver support from 89-North

== Introduction ==
These device adapters provide support for the control of the Laser Diode Illuminator range of laser banks from 89-North from within MicroManager. The adapters will automatically detect the available laser diodes and allow control of each diode's intensity and shutter via MicroManager properties. Alternatively, intensities can be controlled via analogue voltage and shutters can be controlled via TTL. Integration with MicroManager's auto-shutter feature is provided, allowing up to 4 diodes to be toggled on and off in response to camera acquisition.

== Driver Installation ==
Follow the instructions provided by 89-North to install the LDI GUI software. While this software is not required for using the LDI within micromanager, installing it ensures that any required drivers are installed on the target PC. It is recommended to verify that the LDI can be operated via the LDI GUI software before attempting setup within MicroManager.

TODO: Firmware update

== Setup ==
'''Ensure the LDI GUI is not running before attempting to connect to the LDI via MicroManager'''

In the hardware configuration wizard, the LDI appears under the 89-North_LDI heading. The serial port that the LDI is connected to is the only pre-init property required (this can be determined from Windows Device manager or the LDI GUI software). The default serial port settings are correct but provided here for completeness

<table>
<tr><td>'''AnswerTimeout:'''</td><td>500.0000</td></tr>
<tr><td>'''BaudRate:'''</td><td>9600</td></tr>
<tr><td>'''DataBits:'''</td><td>8</td></tr>
<tr><td>'''DelayBetweenCharsMs:'''</td><td>0.0000</td></tr>
<tr><td>'''Handshaking:'''</td><td>Off</td></tr>
<tr><td>'''Parity:'''</td><td>None</td></tr>
<tr><td>'''StopBits:'''</td><td>1</td></tr>
<tr><td>'''Verbose:'''</td><td>1</td></tr>
</table>

== Properties ==
=== Functional Mode ===
The '''Functional Mode''' property must be set to '''RUN''' before any laser diodes can be turned on. When the LDI is first turned on, the '''Functional Mode''' will be set to '''WARMUP''' while it heats the diodes to the required temperatures, while in '''WARMUP''' mode the '''Functional Mode''' property cannot be changed. The LDI reaching temperature is indicated by a change in the colour of the indicator LED on the front of the LDI from yellow to green. When the LDI reaches temperature it will automatically transfer from '''WARMUP''' mode to '''IDLE''' mode ('''note:''' this change is not automatically reflected in the '''Functional Mode''' property, you must refresh the properties in the device property browser to see this change).
----
=== XXX Intensity ===
The '''XXX Intensity''' properies control the intensity of the specified laser (e.g., '''470 Intensity''' controls the intensity of the 470 nm laser). Attempting to set an '''XXX Intensity''' setting when the [[89NorthLDI#Intensity Control|Intensity Control]] property is set to '''EXT''' will result in an error. Intensity is expressed as a percentage of the maximum output of the laser diode, i.e., an intensity of 15 on a laser diode with a maximum output of 1000 mW, corresponds to an output of 150 mW. There is a [[89NorthLDI#Intensity Sliders|known bug]] when controlling diode intensity via the property slider.
----
=== XXX Shutter ===
The '''XXX Shutter''' properties provide manual control of the electronic shutters on each of the diodes. Setting the property to '''OPEN''' will open the shutter and allow the diode to emit, setting it to '''CLOSED''' will close the shutter and prevent the diode from emitting. Only 4 diodes may be emitting simultaneously. Diodes will not emit if their [[89NorthLDI#XXX Intensity|Intensity]] is set to 0, even if the '''Shutter''' property is set to '''OPEN'''. Attempting to set an '''XXX Shutter''' setting when the [[89NorthLDI#Shutter Control|Shutter Control]] property is set to '''EXT''' will result in an error. Diodes will not emit unless the [[89NorthLDI#Functional Mode|Functional Mode]] setting is set to '''RUN'''. For use with MicroManager's auto-shutter feature see the [[89NorthLDI#Auto Shutter Wavelength X|Auto Shutter Wavelength X]] properties.

If setting the '''XXX Shutter''' property to '''OPEN''' does not cause the diode to emit, ensure that:
* [[89NorthLDI#Functional Mode|Functional Mode]] is set to '''RUN'''
* The corresponding [[89NorthLDI#XXX Intensity|Intensity]] setting is '''not''' 0
* The [[89NorthLDI#Shutter Control|Shutter Control]] property is set to '''PC'''
* Fewer than 4 other diodes are currently emitting
* There is no LDI [[89NorthLDI#Fault|Fault]] detected
----
=== XXX Shutter TTL Inverted ===
If set to '''OFF''', a TTL high signal will open a diode's electronic shutter and TTL low will close it. If set to '''ON''', TTL low will open the shutter and TTL high will close it. Has no effect if [[89NorthLDI#Shutter Control|Shutter Control]] is set to '''PC'''.
----
=== Auto Shutter Wavelength X ===
The '''Auto Shutter Wavelength X''' properties provide integration with MicroManager's auto-shutter feature by allowing the user to choose up to 4 diodes which will be toggled in response to auto-shutter commands. If a wavelength is selected in one of the '''Auto Shutter Wavelength''' properties then it will automatically be toggled on at the start of camera exposure and off at the end.

For example the settings:
* Auto Shutter Wavelength 1 : 470
* Auto Shutter Wavelength 2 : None
* Auto Shutter Wavelength 3 : None
* Auto Shutter Wavelength 4 : None
Will turn on the 470 nm laser diode whenever a picture is taken (assuming auto-shutter is enabled), whereas these settings:
* Auto Shutter Wavelength 1 : 470
* Auto Shutter Wavelength 2 : 405
* Auto Shutter Wavelength 3 : 555
* Auto Shutter Wavelength 4 : 640
Will turn on the 405 nm, 470 nm, 555 nm and 640 nm simultaneously. The order in which the wavelengths are provided does not matter and they are all toggled at the same time.
----
=== Intensity Control ===
Determines if the laser intensity should be controlled via MicroManager properties ('''PC''') or analogue voltage ('''EXT'''). If set to '''EXT''' attempting to change an [[89NorthLDI#XXX Intensity|Intensity]] property will result in an error.
----
=== Shutter Control ===
Determines if the TTL shutter should be controlled via MicroManager properties ('''PC''') or TTL voltage ('''EXT'''). If set to '''EXT''' attempting to change a [[89NorthLDI#XXX Shutter|Shutter]] property will result in an error.
----
=== Despeckler ===
Enables ('''ON''') or disables ('''OFF''') the built in laser despeckler. In almost all circumstances it is desirable to have this property set to '''ON'''.
----
=== Sleep Timer (Minutes) ===
How long before LDI will go into sleep mode after being left idle.
----
=== Fault ===
When the LDI detects a fault (e.g., a safety interlock being tripped), it will automatically stop all lasers from emitting until the fault is fixed and cleared. The existence of a fault is indicated by the LED indicator on the front of the LDI turning red. When the LED indicator is red, refreshing the properties will change the value of this property to the error message indicating how to fix the fault. Once the fault is fixed, this property can be set to '''CLEAR''' to tell the LDI that the fault has been fixed. If the fault was successfully fixed the value of this property will be returned to '''NONE''' and the LED indicator will no longer be red. If the fault was not fixed, the error message will still be visible.
----
== Recommended Setup ==

=== Single Wavelength with Auto Shutter ===
The most common use case is to be able to select a single wavelength to respond to the auto shutter commands and to assign this as the channel group. To enable this it is recommended that you create a group with the following settings:

* [[89NorthLDI#Functional Mode|Functional Mode]]
* [[89NorthLDI#Auto Shutter Wavelength X|Auto Shutter Wavelength 1]]

With the following presets:

'''XXX nm''' (where XXX is a desired wavelength):
* [[89NorthLDI#Functional Mode|Functional Mode]] : '''RUN'''
* [[89NorthLDI#Auto Shutter Wavelength X|Auto Shutter Wavelength 1]] : '''XXX'''

'''Off''' :
* [[89NorthLDI#Functional Mode|Functional Mode]] : '''IDLE'''
* [[89NorthLDI#Auto Shutter Wavelength X|Auto Shutter Wavelength 1]] : '''NONE'''

'''Warmup''' :
* [[89NorthLDI#Functional Mode|Functional Mode]] : '''WARMUP'''
* [[89NorthLDI#Auto Shutter Wavelength X|Auto Shutter Wavelength 1]] : '''NONE'''

'''Manual''' :
* [[89NorthLDI#Functional Mode|Functional Mode]] : '''RUN'''
* [[89NorthLDI#Auto Shutter Wavelength X|Auto Shutter Wavelength 1]] : '''NONE'''

The first preset is repeated for each of the desired wavelengths. The '''Off''' and '''Warmup''' presets are optional but will provide an indication of the state of the LDI when starting MicroManager. The '''Manual''' preset is also optional. It keeps the LDI running but disables auto-shutter, allowing for manual control via the [[89NorthLDI#XXX Shutter|Shutter]] properties.

== Known Bugs ==
==== Intensity Sliders ====
There is an issue with the use of MicroManager's property sliders when controlling the laser intensities. Clicking the up arrow will attempt to increment the intensity by 0.1%, however, the LDI will truncate this back to the previous integer value. For example, if the current intensity value is 15%, pressing the up arrow will attempt to increment the intensity to 15.1%, which will be truncated back to 15% by the LDI. A similar effect happens when pressing the down arrow, however, in this case the truncation will ultimately result in decreasing the laser power by 1. This can be worked around either by dragging the slider, entering the exact desired value or clicking in between the current slider position and the up arrow button to increment by 1.

== Special Thanks ==
Special thanks to 89 North for providing the LDI used for development of these device adapters free of charge as well as making engineers available to answer questions and fix bugs. Additional thanks to Cairn Research for providing introductions and helping facilitate the project.
