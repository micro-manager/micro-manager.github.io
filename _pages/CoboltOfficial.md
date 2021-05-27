'''Cobolt Official Driver for Cobolt Lasers'''
------------------------------
{| style="text-align: left"
!Summary:
|Interfaces with Cobolt lasers.
|- valign="top"
!Author:
|Lukas Kalinski, Cobolt AB [http://www.coboltlasers.com]
|- valign="top"
!Contributors:
|Melissa Haahr, Cobolt AB [http://www.coboltlasers.com]
|- valign="top"
!License:
|
|- valign="top"
!Platforms:
|Windows (No Mac or Linux driver available)
|- valign="top"
!Devices: 
|Cobolt 06-01 Series lasers; Cobolt Skyra multi-line laser; and C-FLEX laser combiner equipped with Cobolt 06-01 Series lasers.
|- valign="top"
|}
----

== Compatible with: ==


Cobolt 06-01 Series lasers

Cobolt Skyra Multi-line lasers

C-FLEX laser combiners equipped with Cobolt 06-01 Series lasers

------------------------------

== Information and Tips: ==

*Select the COM Port for your Cobolt laser
*Select Baud Rate: 115200

*The laser will connect in "not emitting" mode. Open the Device Property Browser to enable control of the laser. 

*In order to control the laser with an external function generator, it is necessary to put the laser in "Modulation Mode" in the Device Property Browser. 


Troubleshooting tip: If the program or computer disconnects unexpectedly, the laser will re-start in "not emitting" mode the next time that it is connected to any program (Micro-Manager, Cobolt Monitor GUI, LabView, etc.). 


Troubleshooting tip: Cobolt lasers can only be connected to one program at a time. If you are unable to connect to Micro-Manager, check your system for any other programs which may be communicating with the laser (Cobolt Monitor, LabView, etc.)


Contact information for questions and feedback: info@coboltlasers.com
[Http://www.hubner-photonics.com]
