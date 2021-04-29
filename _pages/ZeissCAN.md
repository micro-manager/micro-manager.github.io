== Zeiss CAN adapter ==

<table><tr><td>
'''Summary:'''</td><td valign="top">Controls Zeiss microscopes that use the ''CAN'' protocol (Axiovert 100m, Axiovert200m, Axioplan2, Axioplan2+)</td></tr>
<tr><td>'''Author:'''</td><td>Nico Stuurman</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows, Mac OS X and linux (serial port)</td></tr>
<tr><td valign="top">'''Devices:'''</td><td>Scope, Shutter (external and internal), Reflectorturret, SideportTurret, ObjectiveTurret, Excitation Lamp Switcher, Halogenlamp, Z-drive; XY stage via MCU 28</td></tr>
<tr><td width=20%>'''Serial Port settings:'''</td><td>9600 baud, 1 stop bit, 2000 ms answertime out, 0 ms delaybetweenCharsMs, Handshaking none.</td></tr>

<tr><td><b>Automated Serial Port Setup:</b></td><td>Yes</td></tr>

<tr><td><b>Peripheral device discovery:</b></td><td>Supported</td></tr>

</table>


This adapter controls Zeiss microscopes that use the (older) CAN bus interface, but does not control the newer Zeiss microscopes (like the AxioObserver) that use the [[ZeissCAN29]] protocol.  The adapter directly communicates to the microscope through the serial port (i.e., it does not use the MTB library provided by Zeiss) and therefore works on all platforms.  No additional software is needed.   You will need to define all hardware that is part of your microscope in the Hardware Configuration Wizard (i.e., Micro-Manager does not query the microscope itself and it also does not use the information you might have entered in the Axioset program).  In any case, you will need to define the 'ZeissScope' device as this tells to which serial port the scope is attached.  Serial port settings are: 9600 baud, 1 stop bit, 2000 ms answertime out, 0 ms delaybetweenCharsMs. For Handshaking, first try 'Hardware' and if that does not work try 'None'.

For older microscopes that have the 'MF' firmware instead of the newer 'ZM' firmware (the firmware version will be a property of the Zeisscope device, in general, the AxioPlan 2 and Axiovert 100m have the MF firmware and the AxioPlan2+ and Axiovert200m have the ZM firmware) use the ZeissShutterMFFirmware instead of the ZeissShutter.  There are three types of the ZeissShutterMFFirmware shutter: 1 = incident light, 2= condenser front lens, 3 = external motorized Mirror with two lamps.  {{Note|With ZM firmware, the external motorized mirror is a different device (Excitation Lamp Switcher).}}

--[[User:Nico|Nico]] 17:23, 8 September 2007 (PDT)

An XY stage controlled via an MCU 28 controller can be control either through the microscope stand (if the stand and MCU 28 are connected with a CAN bus cable) or, since version 1.4.16 or the 20131203 nightly build, directly (if the MCU 28 is directly connected to the computer using a serial cable). (Since currently only one ZeissCAN microscope is supported, you cannot control a directly-connected MCU 28 at the same time as a microscope stand. This restriction may be lifted in the future.)

Zeiss microscopes require a female-to-female null-modem cable that supports hardware handshaking for RS-232 communication. Not all null modem cables cross the hardware handshaking lines that the Zeiss microscope requires. Specifically, pins 2 and 3 must be crossed and pins 7 and 8 must be crossed.

{{Listserv_Search|Zeiss}}

{{Devices_Sidebar}}
