{| style="text-align: left"
!Summary:
|Interfaces to Sutter Lambda 10-3 controller
|- valign="top"
!Authors:
| Nick Anthony. Based off of the [[SutterLambda]] adapter
|- valign="top"
|-
!License:
|BSD
|-
!Platforms:
|Windows, Mac OS X and Linux (only serial port, no parallel port or USB)
|- valign="top"
!Devices:
|[http://sutter.com/IMAGING/lambda103.html Lambda 10-3]<br/>
|}
----

== Device Configuration ==

=== Serial port issues ===
The Lambda 10-3 Controller uses a straight through (i.e., not null modem) DB9 serial cable.  The default baud rates are 9600 for serial ports and 128000 for USB ports (which use a build-in USB-serial converter, drivers can be found [http://www.sutter.com/SOFTWARE/imaging.html here])

=== Wheel speed ===
95% of the time speed <code>#1</code> works best (<code>#0</code> being the fastest, which only works with an empty wheel). If speed <code>#1</code> does not work you can try the slowest (speed <code>#7</code> IIRC).  Best practice is to [[Micro-Manager_Configuration_Guide#Startup_Presets|set the desired wheel speed during startup]], i.e. in your <code>Startup</code> Preset of the <code>System</code> Group.

=== Lambda VF5 ===
The Lambda VF5 tunable filter changer consists of a filter wheel which can additionally be tilted to provide a specific bandpass wavelength. In addition to selecting a wheel speed (described above) you can also select a tilt speed between 0 and 3.


{{Devices_Sidebar}}
