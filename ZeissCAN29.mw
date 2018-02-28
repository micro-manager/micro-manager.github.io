== Zeiss CAN29 adapter ==

<table><tr><td>
'''Summary:'''</td><td valign="top">Controls Zeiss microscopes that use the ''CAN29'' protocol (AxioObserver/Imager D1 and Z1)</td></tr>
<tr><td>'''Author:'''</td><td>Nico Stuurman</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows, Mac OS X and linux (serial port)</td></tr>
<tr><td valign="top">'''Devices:'''</td><td>Scope, Shutter (external and internal), Reflectorturret, SideportTurret, ObjectiveTurret, Excitation Lamp Switcher, Halogenlamp, Z-drive, XY-Stage, Condenser, Field and Aperture Diaphragms.  (since 1.3.40) Definite Focus, Colibri.</td></tr>
<tr><td valign=top>'''Default serial port settings:'''</td><td valign=top>

{| cellspacing="2" border="0" cellpadding=3
|-AnswerTimeout||500
|-
|BaudRate||57600
|-
|DelayBetweenCharsMs||0
|-
|Handshaking||Off
|-
|Parity||None
|-
|StopBits||1
|}


</table>


<p>This adapter controls Zeiss microscopes that use the CAN29 bus interface. The adapter directly communicates to the microscope through the serial port (i.e., it does not use the MTB library provided by Zeiss) and therefore works on all platforms.  No additional software is needed.  USB and ethernet communication is not (yet) supported. </p>

<p>Zeiss microscopes require a female-to-female null-modem cable for RS-232 communication.</p>

<p>You will need to define all hardware that is part of your microscope in the Hardware Configuration Wizard (i.e., Micro-Manager does not query the microscope itself for devices present).  In any case, you will need to define the 'ZeissScope' device as this defines the serial port to which the scope is attached.    Most labels (reflectors, objectives, sideport) will be read from the controller, so you do not need to set those in the Hardware Config Wizard.</p>

<p>The Zeiss AxioObserver has a few features that are meant to make operating the microscope nicer, but that interfere with software control of the microscope.  They are: <b>Light Manager</b> and <b>Dazzle Protect</b>.  Both of these features should be switched off when using Micro-Manager with the microscope, or unexpected things (like shutters opening and closing when moving the reflector turret) will happen.</p>

<p>Since version 1.3.40 there is support for the Colibri LED illuminator and the Definite Focus autofocus device.  The <b>Colibri</b> appears as a shutter device in Micro-Manager.  If you do not want to use a given LED (the Colibri has four), set its intensity to 0.  You can make different configuration presets with different (combinations of) LEDs.  The Colibri "Shutter" property determines whether the LEDs or the external shutter will be used.</p>
<p>The <b>Definite Focus</b> adapter has the important property "Focus Method".  Set this to "Measure" and pressing the autofocus button in the front panel will train the Definite Focus to find this specific focal plane.  Set this to "Apply" and pressing the autofocus button in the front panel will activate the Definite Focus (once) to return to the previously specified focal plane.  Measuring the focal plane takes a long time, therefore please set the property Core-Timeout to 25,000 ms.  If you want to acquire multiple XY-positions and use different working positions for the Definite Focus at each of these, then you will need to include the ZeissDefiniteFocusOffset adapter in your configuration.  This device will appear as a stage device in the Position List dialogue (make sure that its property "Autofocus Device" is set to your Definite Focus).  For each position, first train the Definite Focus (use the "Focus Method" "Measure" and press the autofocus button in the main window), then Mark the position.  Before running the Multi-Dimensional Acquisition, set the "Focus Method" to "Apply".</p>

An MCU 28 controller connected to the microscope stand cannot currently be controlled by the ZeissCAN29 device adapter. See the [[ZeissCAN]] adapter for controlling an MCU 28 that is directly connected to the computer using a serial cable (only XY stage is supported).


{{Listserv_Search|Zeiss}}

{{Devices_Sidebar}}
