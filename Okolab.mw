== Okolab Microscope Incubators and Gas Controllers ==
<table>
<tr><td>'''Summary:'''</td><td>Controls Okolab incubators and gas controllers</td></tr>
<tr><td>'''Author:'''</td><td>Okolab srl</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr>
<tr><td>'''Platforms:'''</td><td>Windows 32-bit and 64-bit</td></tr>
<tr><td>'''Since version:'''</td><td>1.4.23_20151018 / 1.4.15 (legacy) </td></tr>
<tr><td>'''Peripheral device discovery:'''</td><td>Supported</td></tr>
</table>

== Compatible devices ==

Any Okolab device.

== Installation ==

Connect the port named USB on the rear of the Unit to the PC USB port, using a standard mini-USB cable. Please consider that you may need an USB Male-to Male cable, depending on the hardware revision of your control unit.

{{Important|If you have more than one controller, please make sure to plug the USB cable to the unit which is directly connected to the Oko-Touch.
When two (or more) units are connected in a stack, one becomes the master and the other is acting as a "slave device", so only the controller connected to the Oko-Touch will answer to USB commands}}

{{Note|The Nightly Build version of Micro-Manager 2.0-gamma may not install a required folder.
If, after the installation, the ''okolib'' folder is missing in your Micro-Manager installation folder, please download the following file [http://www.oko-lab.com/public/micro-manager-2.0/okolib.zip Okolib db folder] and un-compress it in Micro-Manager installation folder.}}


== Configuration ==

# Open the ''Hardware Configuration Wizard'' from the ''Tools'' menu.
# Select desired configuration (new or existing) and  press the bottom-right ''Next'' button.
# Add ''Okolab'' device to the current configuration double-clicking on it or clicking the ''Add'' button when selected.
# Select the right COM Port or select Auto and press OK.

{{Note|Okolab devices can be found in the ''Okolab'' node if ''Available Devices'' list is ordered by vendor or in the ''Generic Device'' node if list is ordered by type.}}

== Usage ==
=== Properties ===

For every Device added to the Configuration, some managed properties are shown in the ''Device/Property Browser'' list (''Tools'' menu). Okolab devices properties are listed only if ''Show other devices'' checkbox is enabled.
Any writeable property is listed as a white row and can be changed clicking on it and then clicking enter (eg. ''H301-T Unit-BL Set Point'').

=== Live mode ===

If live is enabled, any value acquired from Okolab devices is automatically refreshed in the ''Metadata'' tab.

=== Logging ===

To log data acquired from Okolab devices, an experiment must be started (''Tools'' > ''Multi-Dimensional Acquisition''). Data are logged in the metadata.txt file if ''Separate images files'' is selected or in the image file itself if ''Image stack file'' is selected.

== Support ==

* [http://www.oko-lab.com Okolab website]
* [http://www.oko-lab.com/support#contact Online Support]
* [mailto:software.support@oko-lab.com Email Support]

== Legacy version ==

=== Compatible devices ===
* [http://www.oko-lab.com/live-cell-imaging Microscope Incubators]
** [http://www.oko-lab.com/live-cell-imaging/cage-incubator Bold Line Cage Incubator (H201)]
** [http://www.oko-lab.com/live-cell-imaging/stage-top-digital-gas Bold Line Top Stage Incubator (H301)] 

* [http://www.oko-lab.com/live-cell-imaging/stage-top-digital-gas#gas_controller Bold Line Gas Controllers]
** [http://www.oko-lab.com/live-cell-imaging/stage-top-digital-gas/co2-o2/co2-unit-bl CO2 Unit-BL]
** [http://www.oko-lab.com/live-cell-imaging/cage-incubator/co2-o2/o2-unit-bl-1-20 O2 Unit-BL &#91;1-20&#93;]
** [http://www.oko-lab.com/live-cell-imaging/stage-top-digital-gas/co2-o2/co2-o2-unit-bl-0-10-1-18 CO2-O2 Unit-BL &#91;0-10;1-18&#93;]
** [http://www.oko-lab.com/live-cell-imaging/stage-top-digital-gas/co2-o2/co2-o2-unit-bl-0-20-1-95 CO2-O2 Unit-BL &#91;0-20;1-95&#93;]
** [http://www.oko-lab.com/live-cell-imaging/stage-top-digital-gas/co2-o2/co2-o2-unit-bl-0-10-0-1 CO2-O2 Unit-BL &#91;0-10;0-1&#93;]

* [http://www.oko-lab.com/live-cell-imaging/stage-top-digital-gas#humid_controller_stage Humidity controllers]
** [http://www.oko-lab.com/live-cell-imaging/stage-top-digital-gas#humid_controller_stage HM-ACTIVE]

=== Installation ===

Connect the port named USB on the rear of the Unit to the PC USB port, using a standard mini-USB cable. Please consider that you may need an USB Male-to Male cable, depending on the hardware revision of your control unit.

{{Important|If you have more than one controller, please make sure to plug the USB cable to the unit which is directly connected to the Oko-Touch.
When two (or more) units are connected in a stack, one becomes the master and the other is acting as a "slave device", so only the controller connected to the Oko-Touch will answer to USB commands}}

To use this adapter, you must manually install OKO-Control Server software which can be downloaded [https://dl.dropboxusercontent.com/u/29705430/OCS/last/OKO-Control%20Server.zip here].
The installation is straightforward, default settings can be used.

=== Configuration ===

# Open the ''Hardware Configuration Wizard'' from the ''Tools'' menu.
# Select desired configuration (new or existing) and  press the bottom-right ''Next'' button.
# Add ''OKO Control Server'' device to the current configuration double-clicking on it or clicking the ''Add'' button when selected.
# Check the right COM Port number, opening ''Windows Control Panel'' and choosing first ''System'' then ''Device Manager'' then ''Ports (COM & LPT)''. There should be an entry like ''USB serial Port (COMX)'', where X is the COM Port number assigned. A good way to double-check is to remove the Okolab USB cable from the PC, as this Port should not be listed anymore. 
# Add the needed Okolab devices to the Micro-Manager configuration, writing the whole COM string into Value field of Property COM Port (eg. ''COM1'').

{{Note|Okolab devices can be found in the ''Okolab'' node if ''Available Devices'' list is ordered by vendor or in the ''Generic Device'' node if list is ordered by type.}}

=== Usage ===
See current version


{{Listserv_Search|Okolab}}

{{Devices_Sidebar}}
