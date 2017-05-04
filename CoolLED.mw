{| style="text-align: left"
!Summary:
|Device adapter for [http://www.CoolLED.com CoolLED] pE LED illuminators
|- valign="top"
!Authors:
| Arthur Edelstein<br/>Gordon Scott
|- valign="top"
!Documentation:
| Arthur Edelstein<br/>Pariksheet Nanda
|- valign="top"
!License:
|BSD
|-
!Platforms:
|Windows, Mac OS X, Linux (uses virtual serial interface over USB)
|- valign="top"
!Devices:
|pE-1<br/>pE-2<br/>pE-Integrator
|-
!Micro-Manager version
|>=1.3.34
|}
----

Note: CoolLED now has a new [http://www.coolled.com/wp-content/uploads/2014/04/MicroManager-Software-Summary-Sheet-R3.pdf closed-source device adapter] for the pE-300 and pE-4000.

== Installation ==

Make sure the USB cable is connected, and that the module is powered up.

To install the CoolLED fluorescence illumination systems (pE-1, pE-2, pE-300, pE-4000), one has to choose the preciseExcite device.  This is because CoolLED's original product was known as precisExcite and Micro-Manager still knows it by the preciseExcite name.

No installation is required on Mac OS X, since it already has a driver that will recognize the virtual serial port.

No installation is required on Linux, since it already has a driver that will recognize the virtual serial port.  The port can usually be found in /dev/serial/by-id

On Windows:
* Download the file CoolLED-pE-inf.zip from here: [http://www.coolled.com www.coolled.com] and unzip the <code>CoolLED-pE.inf</code> and <code>.cat</code> files. You may need to ask CoolLED for access to the download area.
* In the <code>Device Manager</code>, the CoolLED will appear under <code>Other Devices > CoolLED USB ...</code> with a yellow exclamation mark in the device icon.
* To install your unzipped INF file, in the <code>Device Manager</code>, right-click on <code>CoolLED USB ... > Update Driver Software > Browse my computer for driver software</code>.  Set the location to the place you unzipped the INF file.
* On successful installation, the device will show up as <code>CoolLED USB Virtual Serial Port</code>.

pE-1 and pE-2 have one such port. pE-300 and pE-4000 have two Virtual Serial Ports on the one USB connection.

== Device Configuration ==

In the <code>Hardware Configuration Wizard</code> (under the Micro-Manager <code>Tools</code> menu):
* In Step 2, add the <code>PrecisExcite</code> device and choose the appropriate COM Port.  The default COM port settings (baud rate, etc) will work.
* In Step 3, you may want to set the <code>Default Shutter</code> to the <code>precisExcite</code>.
* You may also want to enable the <code>Auto shutter</code> checkbox is so that it automatically opens during a "Snap" or "Acquisition" and close immediately afterwards.

<!-- It would be nice if this sequencing paragraph was explained in more detail.  It may be obsolete since if it was written for MM 1.3 -->
The <code>Trigger</code> and <code>TriggerSequence</code> properties can be used for external triggering by TTL pulses. In the trigger sequence, channels are labeled "A", "B", "C", "D", and a pause is denoted by "0" (zero).


{{Devices_Sidebar}}
