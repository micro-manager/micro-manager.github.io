{| style="text-align: left"
!Summary:
|Interfaces with Andor laser combiner
|-
!Author:
|Karl Hoover, UCSF - µManager device adapter
|-
!Maintainer:
|Pariksheet Nanda, Andor - this documentation and µManager device adapter
|- valign="top"
!Contributors:
|Ed Simmons, ES Imaging - patch for GUI TTL outputs<br>Pedro Almada, documentation fixes
|-
!License:
|BSD
|- valign="top"
!Platforms:
|Windows (No Mac or Linux driver available)
|- valign="top"
!Devices:
|LC-401, LC-501, LC-601 (only 4 laser LC-601 systems supported; 5 and 6 line support possible but not yet implemented)
|- valign="top"
!Since version
|1.3.47
|}
----


== Installation ==

In most cases the ALC will work "out of the box".

But if you're setting up a brand new computer, continue on to [[#Configure ALC_SDK dependencies]], and for Micro-Manager versions than nightly build 1.4.16_20131025 follow the [[#Library installation for MM 1.4.15 and earlier]].

== Hardware-based Synchronization ==

[[ESIOImagingControllers]] can be used with an ESio adapter cable for the ALC to run [[hardware-based synchronization]].  The ALC lacks the onboard programming to allow the camera TTL synchronization used by the Micro-Manager architecture, thus another supported triggering device is needed.

== Hardware Configuration Wizard ==

Description of devices available in the Hardware Configuration Wizard:

{| class="wikitable"
!style="width: 20%;"| Available Devices
! Description
|- valign="top"
| AndorLaserCombiner
| Main device required for your hardware configuration.
|- valign="top"
| Piezostage
| Enable Andor's analog BNC control for your Piezo Z device.  Generally, confocal systems have this configuration since it moves the Piezo faster than RS-232 serial control.  If you are unsure about this, look at the front of your Andor Precision Control Unit (PCU)- if you see a BNC cable connected from A5 of the PCU to your Piezo Z controller, you should enable this option.  If you see the A5 BNC sealed off, you have a 6 laser system that therefore does not have this feature.
|}

{| class="wikitable"
!style="width: 20%;"| Initialization Properties
! Description
|- valign="top"
| MultiPortUnitPresent
| Leave as the default "0" (false) if you only see a single fiber optic connected horizontally to the front of the laser combiner.  Otherwise select "1" (true) if you see the multi fiber optic switcher attachment.
|}

For <code>Auto-Shutter</code> setting in Step 3 of 6, set the <code>Default Shutter</code> to the <code>AndorLaserCombiner</code> and in Step 4 of 6 use the default <code>Delay [ms]</code> of <code>0.0</code> since a fast AOTF gates the laser output.

== Device Properties ==

{| class="wikitable"
!style="width: 20%;"| Property
! Description
|- valign="top"
| Enable
| Logical shutter to allow selection of laser line.  It can also set the laser to TTL mode, if the laser supports it.  TTL mode requires firmware 2.  When creating laser imaging channels, you should add the <code>Enable</code> properties for each laser wavelength to turn on only the wavelength(s) you need.
|- valign="top"
| SaveLifetime
| Allows lasers to be put in standby mode to preserve lifetime hours.  Changes to this property are saved onto the device memory, so the setting is persistently between Micro-Manager sessions.  Since going into and coming out of standby can take a few seconds, best practice is leave this property "global" by not including it in channels.  Instead, one could add these properties to the <code>System</code> <code>Startup</code> preset, or just create shortcuts by creating groups with only the SaveLifetime setting(s).
|- valign="top"
| IsLinear
| Reads whether linear correction algorithm is being applied to AOTF by <code>PowerSetpoint</code>, otherwise AOTF laser power output is sigmoid.
|- valign="top"
| PowerSetpoint
| AOTF intensity setting.  Actual power output may or may not be linear depending on the value of <code>IsLinear</code>.
|- valign="top"
| PowerReadback
| Current laser head power output. Output of 0, could be due to laser being put in Standby using SaveLifetime, or a fault with the laser head.  If power is more than a few percent lower than MaximumLaserPower, it also indicates a faulty laser head, but some lasers can take up to 5 minutes to warm up (most warm up in 2 minutes).
|- valign="top"
| MaximumLaserPower
| Laser rated operating power in milli-Watts.
|- valign="top"
| Hours
| Indicates laser expired life to plan warranty contracts. (Unfortunately this always shows a value of "0" because the feature is not yet implemented by the Andor ALC SDK)
|- valign="top"
| WaveLength
| Wavelength of laser line.
|- valign="top"
| LaserState
| Laser state: "0" indicates off, "1" warm up (if <code>SaveLifetime</code> is set to "PowerOn") or standby (if <code>SaveLifetime</code> is set to "Standby"), and "2" is stable output.
|- valign="top"
| NLasers
| Number of lasers available.
|- valign="top"
| LaserPort
| Multi fiber port unit control.
|- valign="top"
| DOUT
| Digital 8-bit output from Precision Control Unit.  The lowest 2 bits are not accessible if a multi fiber port unit is present.
|- valign="top"
| DIN
| Digital 8-bit input from Precision Control Unit.  Reads TTL input signal state.
|}

== Troubleshooting (known issues and fixes) ==

=== No laser, but laser emission LEDs are illuminated ===
{| class="wikitable"
!style="width: 20%;"|Description
|The hardware appears to be operating correctly, but there is no laser output.  The camera is running live, feeding the Active Blanking signal.
|- valign="top"
!Cause
|DEMO-BOARD device listed in InstaCal
|- valign="top"
!Workaround
|Delete the DEMO-BOARD device by opening InstaCal from <code>Start Menu > Programs > Measurement Computing</code>
|}

=== Microsoft Visual C++ error(s) opening HCW ===
{| class="wikitable"
!style="width: 20%;"|Description
|Opening the <code>Hardware Configuration Wizard</code> shows one or more of the following error windows, and closing the window immediately crashes µManager:
[[File:Alc_mscv_error.jpg|frame|Figure: Error due to incorrect internal laser power setting]]
|- valign="top"
!Cause
|Bug in ALC_SDK (Laser power setting exceeding rated value) <!-- TODO: Add Andor's Bugzilla bug number -->
|- valign="top"
!Workaround
|Request Andor support to remotely connect to each laser head and adjust the "set power" (using the <code>p=</code> serial command) to the rated value of the laser head.
|}

=== Hang due to USB power saving ===
{| class="wikitable"
!style="width: 20%;"|Description
|Micro-Manager hangs during acquisition.
|- valign="top"
!Cause
|Windows Vista and newer enable USB power saving, even in the "High Performance" power plan, by default.
|- valign="top"
!Fix
|[[Personal computer setup#Power_Options|Disable Windows "USB selective suspend setting"]].
|}

=== Hang due to incorrect Prolific USB-Serial driver ===
{| class="wikitable"
!style="width: 20%;"|Description
|Micro-Manager hangs during acquisition.
|- valign="top"
!Cause
|Buggy Prolific driver (version 3) bundled by Windows 7.  In the Device Manager when you right-click on the Prolific serial port:
   Ports (COM & LPT)
         ...
         Prolific USB-to-Serial Comm Port (COM201)
         ...

... it will show a newer driver version than 2.0.13.130.
|- valign="top"
!Workaround
|
# Install Prolific driver  [[:File:PL2303_DriverInstaller_v1413_20110219.gz|version 2.0.13.130]]
# Disable Microsoft server driver installation.  When Windows says it's searching for drivers, it fetches them from the Microsoft server.  Turn off this driver updating behavior because if e.g. the USB bus glitches for whatever reason it will try to reinstall the buggy version 3 drivers (you have to do this step even if you have Windows updates disabled) via the Start menu > (Type in the "Search programs and files" box) change dev > Change device installation settings > No, Let me choose what to do > Never install driver from Windows Update
# In your Device Manager, right-click on the Prolific ports and check the driver version.  The good version is 2.0.13.130.  Most likely you will see something like 3.4.48.272.  Right-click on the Prolfic entry in the Device Manager > Uninstall > Delete the driver software for this device > OK.  Repeat for all Prolific COM20x ports.  Then to pick up the next available driver in Windows, in the Device Manager click Action > Scan for hardware changes).  Until you get 2.0.13.130, repeat the above of uninstall+deleting the driver.  You will then need to reassign the COM ports to 20x which is detailed in [[AndorLaserCombiner#Configure_ALC_SDK_dependencies]].
{{Note|Andor's ALCs have since switched to using FTDI USB-serial convertors because Prolific considers the PL-2303 an obsolete product and Prolific won't fix the issue with Microsoft distributing faulty drivers.}}
|}

== Resources ==

=== Laser Combiner questions ===
For contacting Andor product support regarding any questions, use this [http://www.andor.com/contact_us/support_request/documentation/default.aspx?product=Revolution%C2%AE%20XD Andor Product Support link]

{{Listserv_Search|Andor}}

=== Development support ===
This driver is not actively maintained by the Andor software team.
For feature requests or bug reports, please liaison with µManager developers on [[Micro-Manager_Community|the mailing list]] and Pariksheet Nanda.


== Appendix ==
=== Library installation for MM 1.4.15 and earlier ===
* In older versions of Micro-Manager, the ALC_SDK library files were not included in the main Micro-Manager directory.  For convience the files have been uploaded (with permission) to this wiki:

{| class="wikitable"
!
! ALC Driver Pack
! Visual C++ 2008 redist<br/>(Only for MM 1.4.14 and earlier)
|-
! 32-bit
| [[:File:libalc_x86.tar.gz|ALC_SDK Libraries 2.0 (32-bit)]]
| [http://www.microsoft.com/download/en/details.aspx?displaylang=en&id=11895 vcredist_x86.exe]
|-
! 64-bit
| [[:File:libalc_x64.tar.gz|ALC_SDK Libraries 2.0 (64-bit)]]
| [http://www.microsoft.com/download/en/details.aspx?displaylang=en&id=11895 vcredist_x64.exe]
|}

* Unzip the <code>ALC_SDK Libraries</code> to a new folder and [[Personal computer setup#Add_device_libraries_to_Windows_PATH|add it to the Windows PATH]]:
          C:\ProgramData\Andor_ALC_library\
* If you already have control of your ALC in another software, your ALC_SDK installation is complete because all the Windows device drivers would be installed.  Otherwise continue on to [[#Configure ALC_SDK dependencies]].

=== Configure ALC_SDK dependencies ===
* There are 3 dependency drivers:
** DeVaSys (for front USB control to enable interlocks)
** Prolific PL-2303 USB (for laser serial communication).  On the ALC-601 these have been replaced with standard Tronix FTDI drivers which don't require driver installation as they are bundled with Windows 7.
** Measurement Computing (for PCI DAC card)
:Install them from:
{| class="wikitable"
! OS version || DeVaSys || Prolific || Measurement Computing
|-
! 32-bit
| [http://devasys.net/support/current/usbi2cio/software/UsbI2cIoDrivers0500x86.msi UsbI2cIo 5.00 (32-bit)]
|rowspan="2"| [[:File:PL2303_DriverInstaller_v1413_20110219.gz|Prolific 2.0.13.130]]
|rowspan="2"| [ftp://ftp.mccdaq.com/Archive/InstaCal/Archive_6.10/icalsetup.exe InstaCal 6.10]
|-
! 64-bit
| [http://devasys.net/support/current/usbi2cio/software/UsbI2cIoDrivers0500x64.msi UsbI2cIo 5.00 (64-bit)]
|}
* The devices will be detected in the Device Manager as:
      DAS Component
         PCIM-DDA06/16
      DeVaSys USB Interfaces
         USB-I2C/IO Board
      ...
      Ports (COM & LPT)
         ...
         Prolific USB-to-Serial Comm Port
         ...
* Run Instacal from Windows Start Button > All Programs > Measurement Computing.  You will see the "Plug and Play Board Detection" window finding your PCIM-DDA06/16 card.  Click OK and Exit Instacal.  This has now written your DAC card configuration file.
* Open the Device Manager to check the COM port numbers for the USB-to-Serial COM ports built into the ALC.  Andor's library reserves specific port numbers for the combiner and expects them to be COM201-206.  Change the port numbers as follows:
** Unplug the blue USB cable from the front of the ALC and check if any such ports remain, to confirm if you have other Prolific USB-to-Serial devices attached.  If see some still left, make a note of their COM numbers so that you don't change them.  Plug the ALC back in and note the new COM numbers.
** For each of your reappeared COM ports, check the port physical location by (Right-click) > Properties.  On Windows 7, the "Port" is immediately visible under <code>Location</code> in the <code>General</code> tab.  Search the <code>Properties</code> of all the Prolific USB-to-Serial devices until you see <code>Port_#0001</code>.  That port will need to be changed to COM 201.  Note the corresponding <code>Hub_#</code> number of that port.
** Reassign your COM ports number by (Right-click) > Properties > Port Settings (tab) > Advanced > change the COM port number to 201
**  With your <code>Hub</code> number of COM 201 noted above, reassign the remaining <code>Port_#0002, Port_#0003, Port_#0004</code> for that Hub as COM 202, 203, 204 as above.
**  If your sled has 5 or 6 lasers you will be left with two more Prolific USB-to-Serial ports.  You will need to reassign <code>Port_#0002, Port_#0003</code> as COM 205 and 206, respectively
* Restart the computer to apply the COM port changes

{{Devices_Sidebar}}
