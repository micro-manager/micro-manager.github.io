{| style="text-align: left"
!Summary:
|Interfaces to Sutter Lambda 10 controllers, Lambda SC controller, and DG4
|- valign="top"
!Authors:
| Nenad Amodaj
|- valign="top"
!Maintainers:
|Arthur Edelstein
|-
!License:
|BSD
|-
!Platforms:
|Windows, Mac OS X and Linux (only serial port, no parallel port or USB)
|- valign="top"
!Devices:
|[http://sutter.com/IMAGING/lambdasc.html Lambda SC]<br/>[http://sutter.com/IMAGING/lambda10b.html Lambda 10-B]<br/>[http://sutter.com/IMAGING/lambda102.html Lambda 10-2]<br/>[http://sutter.com/IMAGING/lambda103.html Lambda 10-3]<br/>[http://sutter.com/IMAGING/lambdadg4.html Lambda DG-4]
|}
----

== Device Configuration ==

=== Serial port issues ===
Sutter devices use a straight through (i.e., not null modem) DB9 serial cable.  The default baud rates are 9600 for serial ports and 128000 for USB ports (which use a build-in USB-serial converter, drivers can be found [http://www.sutter.com/SOFTWARE/imaging.html here])

=== Wheel speed ===
95% of the time speed <code>#1</code> works best (<code>#0</code> being the fastest, which only works with an empty wheel). If speed <code>#1</code> does not work you can try the slowest (speed <code>#7</code> IIRC).  Best practice is to [[Micro-Manager_Configuration_Guide#Startup_Presets|set the desired wheel speed during startup]], i.e. in your <code>Startup</code> Preset of the <code>System</code> Group.

=== Lambda SC ===
For the Lambda SC Smart shutter controller, select the "Shutter-A|Lambda 10 shutter A" in the Hardware Configuration Wizard.

== Troubleshooting ==

=== Wheel re-homing during imaging ===

You need to optimize the filter speed setting if you ever encounter the dreaded re-homing sound due to the wheel failing to move to a filter position during Multi-Dimensional Acquisition. The wheel itself has a resonance frequency associated with the load of filters. Practically one finds the ideal speed by empirically checking which speed introduces the least vibration.

See the Operation Manual (available at http://www.sutter.com/) section "Helpful Tips about Filter Wheel Movement Errors".


=== Note ===
Newer devices from Sutter are supported in the [[SutterLambda2]] adapter. If you would like to add support for a Sutter device that is currently unsupported please add your code to the newer adapter.

{{Devices_Sidebar}}
