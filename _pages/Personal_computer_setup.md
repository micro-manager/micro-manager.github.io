== Disable Power Saving ==
To comply with environmental regulations, PCs are sold with power saving features enabled by default.  One must disable these features for reliable hardware control.

=== Power Options ===
Windows suspends USB and PCI Express devices by default.

Open the <code>Power Options</code> window to see the available <code>Power Plans</code>.  You can do this opening the start menu, typing "power options" in the <code>Search programs and files</code> text box, and clicking on the "Power Options" search result.

You will see 3 plans listed:
* Balanced (recommended)
* Power saver
* High performance

{{Note|The <code>High performance</code> plan actually does not disable all power saving features.}}

Click on "Create a Power Plan", select the "High performance" plan as the one closest to your new plan and call it something like "My high performance with all power saving disabled.".  Strictly speaking, creating a new plan name is not necessary as one can modify the High performance plan, but creating the new name makes it explicit to anyone else checking your computer that the additional power saving features have intentionally been disabled.

Click on <code>Change advanced power settings</code> in the second step of creating the new plan, to open the <code>Advanted settings</code> window.  The important settings to change are:

{|class="wikitable"
! Setting
! Value
|-
| Hard Disks > Turn off hard disk after || Never *
|-
| Sleep > Sleep after || Never *
|-
| USB Settings > USB selective suspend setting || Disabled
|-
| PCI Express > Link State Power Management || Off
|-
| Processor power management > Minimum processor state || 100%
|-
|colspan=2| * Type the number "0" and hit enter for "Never")
|}

Some IT departments (like the University of Michigan) override the Windows Power Plan settings when the computer starts, so you may want to verify that these <code>Advanced settings</code> persist after you reboot your PC, or when you login as another user (if multiple users are setup on your computer).  The University of Michigan corrected the power saving behavior by logging in to the PC's administrator account and applying above changes there so that the login script copies over the changed settings.

=== BIOS ===
PCI Express C-states power saving settings need to be disabled in the BIOS, in addition to being disabled in Windows:

{|class="wikitable"
! Name
! Setting
|-
| Dell || Performance > C States Control (disable it)
|-
| HP || Power > OS Power Management > Idle Power Savings (change from "Extended" to "Normal")
|}

== USB connection placement ==

=== High data bandwidth ===
High bandwidth USB devices using such as cameras, XY stages, and microscopes must not share their USB bus with other such high bandwidth devices.  When these devices send data simultaneously and overflow the USB bus, this in turn causes the imaging software to freeze or crash.  Ideally, each high bandwidth device would be plugged into the computer USB slots in such a way as to be on its own USB bus; in less ideal circumstances the device would share a bus with a low-bandwidth device (i.e. a device known not to require much communication).

You need to use a utility like [http://www.ftdichip.com/Resources/Utilities/usbview.zip UVCview] to inspect the USB bus.  The physical layout of computer USB ports is often misleading, as devices connected to the front and back USB slots of the computer can actually be on the same USB bus.  Using UVCview, try different USB slots on the computer until the high bandwidth device is on its own USB bus.

=== High current draw ===
Another problem with some USB devices is power draw exceeding the current that the USB bus can provide.  USB power draw problems manifest or be detected in several ways:
# The list of devices in UVCview will repeatedly refresh.  The refresh happens because devices are intermittently dropping out of the USB bus for short periods of time.
# The device won't be recognized until other devices are removed from its USB bus, or unless it is plugged in with using a powered USB hub.
# Even though the device is recognized in the Device Manager, one cannot communicate with it in the imaging software.
The fix for power draw, as with high-bandwidth devices, is putting the device on its own USB bus.  If there is no available USB bus on the computer, try a PCI/e USB daughter card (make sure to power the card if it has a connector) or use a powered external USB hub.

== Install device libraries  ==
Some devices require library (.dll) files to communicate, and their DeviceAdapters will show "(unavailable)" in the Hardware Configuration Wizard without them.  Sometimes these library files:
# Are Included with, and installed by, Micro-Manager itself so that the device works out of the box.  These are called '''bundled libraries'''.
# Can be installed as a '''system-wide dependency'''.
# Are supplied with no installer (often in a .zip file) and need to be either copied to the Micro-Manager directory to be available locally to that version of MM, or added to the Windows PATH to be available system-wide.

=== Copy device libraries to main MM folder ===
This is the most common method of installing library files for one Micro-Manager folder.  After the library files are copied to the Micro-Manager folder, starting MM will find them.

=== Add device libraries to Windows PATH ===
Sometimes one has to install nightly builds for troubleshooting problems and it's tedious to copy the required library files each time.

One can add the folder containing device library files to the Windows <code>PATH</code> variable, by:
* Right-click the My Computer icon on the desktop or start menu
* Click <code>Properties</code> and on the <code>Advanced</code> tab choose <code>Environment</code> variables.
* On the <code>System Variables</code> list, find "Path" or "PATH" and click edit.  DO NOT DELETE ANYTHING.  Just add <code>;C:\Path\to\your\library\</code> on the end of the line on the edit window. The leading semi-colon (;) is necessary or you might break something on your windows installation.
* If your OS is older than Windows Vista, restart your computer for the new <code>PATH</code> to take effect.


<!--
== Device Manager ==
=== Changing COM Port Numbers ===
=== Downgrading drivers ===

== Diagnostics ==
=== Event Viewer ===
-->

{{Documentation_Sidebar}}
