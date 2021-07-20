== ASI Stage ==

<table><tr><td>
'''Summary:'''</td><td>For ASI MS2000 controllers, including stages (XY, Z, piezo) and CRISP autofocus. Also MFC-2000.</td></tr>
<tr><td>'''Author:'''</td><td>Jizhen Zhao, based on Nenad Amodaj's Prior adapter.  CRIFF, CRISP, and AZ100 Turret by Nico Stuurman.  Generic state device (for filter sliders and motorized turrets) and TIRF device by Jon Daniels. Magnifier device by SS at ASI.  Currently maintained by Nico Stuurman and Jon Daniels</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>All platforms (uses serial port)</td></tr>
<tr><td>'''Devices:'''</td><td>XYStage, ZStage, CRIF, CRISP, AZ100 Turret, LED</td></tr>
<tr><td>'''Example Config File:'''</td><td>None</td></tr>
</table>

NB: there is a separate device adapter for modular TG1000 "Tiger" controllers [[ASITiger]].

Controls ASI's stage controllers such as the MS2000 [http://www.asiimaging.com/products/controllers/ms-2000-wk-multi-axis-stage-controller/], [http://www.asiimaging.com/products/controllers/rm-2000-rack-mount-stage-controller/].  Depending on installed hardware, the controller works with XY, Z stages (linear and piezo) and the CRISP or CRIFF autofocusing modules.  In Micro-manager, each stage or device connected to the controller is added as a separate device assigned to the appropriate serial port (even though all devices might actually be attached to one and the same controller and this controller is attached to the PC through a serial cable).  

The MS2000 and relatives can control two different Z stages, a normal one ("Z"), and a piezo Z stage which can either be called "Z", or - if a normal motorized stage is installed "F".  As of Micro-Manager version 1.2.7, you can instantiate multiple ASI Z-stages, which will take a pre-initialization property 'Axis' that can be set to either "Z" or "F" (do not instantiate the same axis twice!).

The piezo Z stage can be set up to receive trigger signals from many cameras (see documentation on Micro-Manager's [[Hardware-based_synchronization]] feature). A BNC cable is connected from the camera's TTL output to the MS2000 controller's piezo trigger input.  By synchronizing Z slices with camera exposures, you can acquire very fast Z stacks. Most ASI firmware includes the required ring buffer module with 50 positions; if you want to acquire Z stacks with more slices or do not have ring buffer support, please [http://www.asiimaging.com/contact-us/ contact ASI directly] for a firmware update, ideally including the controller serial number. To use this feature, set the property "Use Sequence" to value "Yes" under device "ZStage" in the Property Browser.

If you have firmware from October 2015 or newer then you need to use a build of Micro-Manager newer than March 2016. (The firmware code was "fixed" to make it more self-consistent but which broke the original Micro-Manager code for loading sequence points; as of March 2016 the device adapter handles any firmware).

There is a further feature designed for collecting sequential Z-stacks with minimal delay by eliminating serial communication between Z-stacks and relying completely on TTL. This is the "Use Fast Sequence" property. To use, first set the property value set to "No" (but "Use Sequence" must be set to "Yes") and run a Z-stack (alternatively, if you are scripting you need to invoke mmc.loadStageSequence(), which call the device adapter's SendStageSequence()).  This forces Micro-Manager to compute the ring buffer positions and send them to the controller. Then set the property value to "Armed" and perform desired acquisitions. Afterwards be sure to set the value back to "No" because the controller will not interact with Micro-Manager normally when set to "Armed" (sequence operations are short-circuited as is the widely-used API function Busy()).

Starting in mid-2013 the firmware reports the number of ring buffer positions, thus obviating the prior need for the user specifying the number of positions as a pre-init property.  As of the 20160316 nightly build detecting the number of ring buffer positions happens automatically if at all possible, and if it is not possible then a standard (not pre-init) property is used to set the number of positions.  This is a convenience for most users, but if you have an existing config file will need to slightly modify it after updating Micro-Manager to anything newer than March 2016.  Open the config file (.cfg) in a text editor and delete the line that looks like "Property,ZStage,RingBufferSize,50".  If you have firmware before mid-2013 with a 250-position ring buffer then you further should add the property "RingBufferSize" to the System/Startup group/preset with value set to 250.

CRIFF [http://www.asiimaging.com/products/focus-stabilization/criff-continuous-reflective-interface-feedback-focus-system/] was ASI's original autofocus product, and has been replaced by the CRISP autofocus system [http://www.asiimaging.com/products/focus-stabilization/crisp-autofocus-system/].  In both, the user can cycle of several states states (laser idle, laser on, calibrate, lock/unlock, laser off) by pressing the middle "@" button on the controller for 6 seconds (see the CRIFF manual [http://www.asiimaging.com/ftp2asi/Manuals/CRIFF%20Manual.pdf]).  Most of these state changes are implemented in the CRIFF and CRISP adapters.  In general, it is easiest to first calibrate the CRIFF/CRISP by hand and then use Micro-manager to lock and unlock the CRIFF/CRISP.

{{Note|For the CRISP focus curve to work correctly, you need to increase the serial port timeout to approximately 1500 ms.}}

As of ASI controller version 8.0 (called the 'WK Whizkid'), the built-in USB connection is actually a USB to serial converter.  You can find drivers for Windows, Mac OS X, and linux at the [http://www.silabs.com/products/mcu/Pages/USBtoUARTBridgeVCPDrivers.aspx silabs] website.

The DIP switches on the back on recent controllers control the baudrate for both the real serial and the USB to serial ports on the controller.  See your manual for details.

The following is an incomplete list of properties currently implemented in the Micro-Manager ASI stage adapter:
<table>
<tr><th>Property</th><th>Description</th></tr>
<tr><td><b>Stepsize</b> (for X and Y in um)</td><td>  Read-only property.</td></tr>
<tr><td><b>WaitCycles</b></td><td>Sets how long the controller will wait after reaching its target position before clearing its 'busy' signal in milliseconds.  For firmware version 8.4 and earlier (2008 vintage) the number of wait cycles is limited to 255 and is specified in the number of servo cycles instead of ms; for such old systems the servo cycle time is generally 1-10ms depending on exact hardware and firmware.</td></tr>
<tr><td><b>Speed</b> (for both X and Y)</td><td>Sets the maximum speed at which the stage will move in mm/sec.  Hardware maximum is 7.5 mm/s for 6.5 mm pitch leadscrews</td></tr>
<tr><td><b>Backlash</b> (for both X and Y, in mm)</td><td>Makes the controller approach the target always from the same direction, starting the set number of mm away from the target position</td></tr>
<tr><td><b>Error</b> (for both X and Y, in nm)</td><td>When the difference between the current position (as read from the encoders) is larger than this number, the controller will re-engage the motors to reach the target position</td></tr>
<tr><td><b>Finish Error</b> (for both X and Y in nm)</td><td>This setting controls at what difference between the target and current position the controller will stop trying to get closer to the target.  Similar to Error, but this one applies to ongoing movements.</td></tr>
<tr><td><b>OverShoot</b> (for both X and Y)</td><td>Analogous to backlash, but will always overshoot the desired position by the set amount and then come back, whereas backlash always approaches from the same direction.  Backlash move, if any, occurs before the overshoot move.</td></tr>
<tr><td><b>MotorOnOff</b> (for  both X and Y)</td><td>  Switches motor On or Off.</td></tr>
<tr><td><b>NrMoveRepetition</b></td><td> Number of times the stage sill approach the same position.  Setting this to 0 will cause one approach.  Settings this to 2 or 3 can increase the accuracy with which a position is reached.</td></tr>
<tr><td><b>SerialCommand</b></td><td>Use this property to send arbitrary serial commands.  By default the command is sent only sent when a change is made; to resend same command you can add a space; change the property "OnlySendSerialCommandOnChange" property to "No" to change this behavior. This is due to the behavior of Micro-manager often refreshing the property values which can cause the command to be sent multiple times. See the corresponding serial response using the read-only property "SerialResponse".</td></tr>
</table>

The TIRF device has a pre-init property with units of millimeters that is used to set the relationship between the TIRF actuator and the resulting angle.  For example, if the TIRF lens is an Olympus 60x objective, it has focal length of 3.0mm and if the TIRF lens has 180mm focal length and the collimator lens has focal length 100mm, the effective combined focal length will be 3/180*100 = 1.67mm.  

{{Devices_Sidebar}}
