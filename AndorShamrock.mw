{| style="text-align: left"
!Summary:
|Interfaces with Andor Smamrock Spectrograph
|-
!Authors:
|Francis McCloy(Andor)<br />Cary McPoland (Andor)
|-
!Maintainers:
|Francis McCloy(Andor)<br />Cary McPoland (Andor)
|-
!License:
|LGPL
|- valign="top"
!Platforms:
|Windows
|- valign="top"
!Devices:
|Andor Shamrock 193i, 300, 500 & 750
|- valign="top"
!Since version
|1.4.20
|}

----

==Dependencies==
*'''mmgr_dal_AndorShamrock.dll'''
*'''atshamrock.dll'''
*'''ShamrockCIF.dll'''

==Installation==
All the dlls mentioned in the dependencies section are all required to run up an Andor Shamrock. The '''mmgr_dal_AndorShamrock''' dll ships with MicroManager ever since version 1.4.20. The '''atshamrock''' and '''ShamrockCIF''' dlls can be obtained from the MyAndor website. After all dependencies are in place (e.g. C:\Program Files\Micro-Manager1.4\) the device can be initialized and added to a configuration file.

===Hardware Configuration Manager===
Follow the usual instructions to add a device to a config file in Micro-Manager (i.e. Tools->Hardware Configuration Wizard). Providing all dlls are in the right place and the device is on and connected to the computer, it should appear in the list of available devices to add.


[[Image:AddingSR.JPG|frame|center]]

Continue with addition of other devices such as cameras, microscopes, stage devices and save the configuration file that is generated.

===Suggested Presets===

Ideal for spectroscopy application:

{| class="wikitable"
!style="width:20%;" | Device Name
!Property Name
!Property Value
|-
!Andor Camera
|ReadMode
|FVB
|-
!Andor Shamrock
|No. of Detector Pixels
|Width of sensor of attached camera
|-
!Andor Shamrock
|Centre wavelength
|gt 0
|-
!Andor Shamrock
|Detector Pixel Width (um)
|gt 0
|}


{{Listserv_Search|Shamrock}}

{{Devices_Sidebar}}
