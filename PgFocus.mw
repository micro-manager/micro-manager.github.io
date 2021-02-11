
= Complete description can be found at [http://big.umassmed.edu/wiki/index.php/PgFocus BIG] =

== Discussion ==

All discussions and questions should be sent to [https://forum.image.sc/tag/micro-manager micromanager forum]

Tag me @kbellve and/or add pgFocus to the subject and I should see it. 

== Purchasing ==

If you are unable to build pgFocus yourself, you are welcome to contact Karl Bellve for a pgFocus. He will build it, test it, and ship it to you. Currently, he is asking for a donation to offset the cost of the electronics and a loss of a vacation day that he uses to build it. The donation also supports advancing pgFocus.

== Description ==

pgFocus is an open source and open hardware, for noncommercial use, focus stabilization device developed by Karl Bellvé at the [http://big.umassmed.edu Biomedical Imaging Group] ([http://www.umassmed.edu/pmm/index.aspx Progam in Molecular Medicine], [http://www.umassmed.edu/ University of Massachusetts Medical School]).

The pg in pgFocus is short for "Pretty Good". pgFocus isn't "Perfect", or "Definite" but it is pretty good! 

pgFocus monitors focus changes through the positional changes of a reflected laser beam. A significant feature of pgFocus is it acts as a "man-in-the-middle." It is designed to pass through faster high fidelity signals meant for a piezo Z controller while adding a slower focus control signal. This happens in the analog realm, which avoids sampling artifacts introduced by digitizing the original signal. This design also reduces the cost of pgFocus.

=== Installation ===

pgFocus supports automatic device detection with firmware 0.8

Serial Settings 
* 57600 BAUD
* Handshaking off
* Parity None
* Stop Bits 1

=== Linux udev Rule ===
As root, create a file named /etc/udev/rules.d/99-pgFocus.rules with the following content:
 <blockquote># pgFocus by the Biomedical Imaging Group
SUBSYSTEMS=="usb", ATTRS{product}=="Arduino Leonardo", ATTRS{idVendor}=="2341", ATTRS{idProduct}=="8036", MODE="0660",GROUP="users",SYMLINK+="ttyACM%n"</blockquote>

== pgFocus Plugin ==

=== Real Time Panel ===

The pgFocus plugin graphs incoming data from the pgFocus hardware.

[[Image:pgFocus_Realtime.png|center|500px]]

Top graph shows the current focus offset.

Second from top graph is the Standard Deviation of the offset over time, in nM.

The second from the bottom graph shows the voltage output, in nM, of the on-board Digital to Analog Converter. 

The bottom graph shows the voltage input, in nM, as measured by the on board Analog to Digital Converter.

The update frequency can be changed in the settings panel.

=== Light Profile Panel ===

The light profile graph can be used to center the reflected laser beam onto pgFocus' sensor.

[[Image:pgFovus_Lightprofile.png|center|500px]]

The refresh rate can be adjusted in the settings panel.

=== Calibration Panel ===

[[Image:pgFocus_Calibration.png|center|500px]]

Calibration should be performed after setting up pgFocus, and after any changes. It lets pgFocus know how far to move the objective to maintain focus.

=== Settings Panel ===

[[Image:pgFocus_Settings.png|center|500px]]

Most of the important parameters can be changed on this panel. Additional parameters can be modified or viewed in the Device/Property Browser window for pgFocus.

=== Device/Property Browser ===

[[Image:pgFocus_DeviceAdapter.png|center|500px]]
