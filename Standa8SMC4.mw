== Standa Microstep Controller adapter using XIMC library ==

<table cellspacing=3><tr><td>
'''Summary:'''</td><td valign="top">Interface to Standa 8SMC4-USB using XIMC interface</td></tr>
<tr><td>'''Author:'''</td><td> Standa ([mailto:8smc4@standa.lt 8smc4@standa.lt])</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows</td></tr>
<tr><td>'''Available since version:'''</td><td>1.4.22</td>
<tr><td>'''Website:'''</td><td>[http://en.xisupport.com en.xisupport.com]</td>
</table>

== Differences between Standa adapters ==

There are three different device adapters for Standa motor controllers:
* Standa8SMC4 – official adapter (this one) for operation with 8SMC4-USB motor controller which was developed by Standa motion control department.
* Standa – adapter for 8SMC1-USBhF (old version of motor controller from Standa).
* StandaStage – another adapter with 8SMC1-USBhF support.

== Supported platforms ==

Currently only Windows platform is tested and supported.
Device adapter can be compiled and launched on Linux and Macintosh as well but it is not tested yet.

== Preparation ==

* Install Micro-Manager. It is straightforward procedure and there are usually no problems with setup process.
* Download [https://ximc.ru/attachments/download/16220/ximc-2.7.6.tar.gz libximc-2.7.6] library distribution.
* Copy following DLLs from extracted directory <code>ximc-2.7.6/ximc/win32/</code> to the Micro-Manager directory: <code>libximc.dll, xiwrapper.dll, bindy.dll</code>
* Install VC++ 2013 Redistributable Package from the extracted file <code>ximc-2.7.6/ximc/win32/vcredist_x86.exe</code>
* Connect a power supply to ''8SMC4-USB'' and set the appropriate voltage for motors in your stage. Turn a power supply on.
* You need XiLab to check your ''8SMC4-USB'' controllers and set it. XiLab version depends on the controller firmware version. You can download XiLab and update controller's firmware attachments [https://en.xisupport.com/projects/enxisupport/wiki/Software this page].
* Connect ''8SMC4-USB'' controllers to computer via USB and open them in XiLab software. Click ''Restore from file...'' in ''Settings...'' window of XiLab and choose appropriate profile for your stage. Click ''Save to flash''. For additional information check [https://en.xisupport.com/projects/enxisupport/wiki/XILab_application_User's_guide User guide].

{{Note|64-bit version is supported too. Do not forget to use libraries from <code>ximc-2.7.6/ximc/win64/</code> directory instead of <code>win32</code>.
}}

[[File:uM_set_XiLab.png|600px]]

== Getting started with Micro-Manager ==

=== Run Micro-Manager ===

{{Note|
Note. When installing the Micro-Manager in <code>C:\Program Files</code> access to configuration files is limited and you need to have administrator privileges. To start an application as administrator right click by its icon and choose <code>Run as administrator</code>. 
}}

* Run Micro-Manager from the shortcut at your desktop or start ''ImageJ.exe'' application from installation directory. First time it will greet you and suggest to type some information about yourself.
* The next window contains drop-down list with configuration files. Choose ''None''.

=== Configure hardware ===

In the main window choose ''Tools -> Hardware configuration wizard''.

[[File:uM_HCW.png]]

The process of hardware configuration consists of 6 steps: 

1. At start, choose ''Create new configuration'' and click ''Next''.

[[File:uM_newconf.png|600px]]

2. At the second step Micro-Manager prompts you to add hardware. If you want to use MicroManager with ''8SMC4-USB'' motor controller choose ''Standa8SMC4'' folder in down window with available devices. There are two drivers: ''Standa8SMC4Z'' for motor controller with one axis and ''Standa8SMC4XY'' for controller with 2 axes. When you select one of them, a dialog box with properties will appear.

[[File:uM_set.png|600px]]

3. In the ''Value'' column type the COM port number for motor controller in the next format:

<code>
xi-com:%5C%5C.%5CCOMn
</code>

Trailing letter '''n''' is a number of corresponding COM port (look at the screenshot above). You can find it in XiLab or in ''Device Manager -> Ports''. Click ''Ok''. ''Unit Multiplier X/Y'' fields are leaved with default values. These values allow you to set stage speed.
4. For ''Standa8SMC4Z'' you should type COM port and Unit Multiplier too. Z axis is usually used as a focusing stage.
5. Camera is added in the same way. You need to know correct driver name for your camera. ''OpenCVGrabber'' driver may be used for any USB camera. Choose OpenCVGrabber folder in Available Devices. The next window will appear. Click ''Ok''.

[[Image:uM_set_OpenCV.png|600px]]

6. Click ''Next'' and ''Finish'' in the last step.

The system configuration is finished.

=== Device usage ===

We have installed and configured Micro-Manager and can check how does it work.

1. Set the pixel size parameter in ''Tools -> Pixel Size Calibration...''. There are you should type the pixel size value and mark parameters that Micro-Manager should consider. Click ''New'' to create new pixel size. In appeared window mark resolution of your camera (with ''OpenCVGrabber'' it is ''OpenCVGrabber - Resolution'' parameter) and type pixel size (in um). If you want to calculate pixel size parameter you need to know image size from microscope, its resolution and displacement (from screw pitch) for you stage.

2. Modify ''UnitMultiplierX'' and ''UnitMultiplierY'' (''Tools -> Hardware Configuration Wizard'', then select ''Modify or explore the existing configuration'', then click ''Next'', then double click to ''Standa8SMC4XY'' in ''Installed Device window''). It is needed for correct conversion from stage movement distance to pixel size value change.

3. Choose ''Tools -> Stage Position List...''. Click ''Set Origin'' to set zero of your stage coordinate system. Then, in the main window click ''Live''. Choose ''Scrolling Tool'' (like a hand) in the ''ImageJ'' window. Make sure that cursor looks like a hand on the screen. Click the windows with the video from camera. Now you can control your stage by keyboard (arrow keys to control XY axis and U,J buttons to control Z axis). 

4. You can scroll an image from a camera with the mouse cursor. Click ''Tools -> Mouse Moves Stage'' (Use Hand Tool). Now click video window and drag it in the desired direction. Stage will move in the same direction. Double click will allow you to center the view on the chosen point in the image.

{{Note|
For example you set the pixel size is equal to 1um. And ''UnitMultiplierX/Y'' is equals to 1.0000. With 8MTF stage table one pixel shift corresponds to 12.5um. If we will set ''UnitMultiplierX/Y'' to 12.5 than movement at one pixel will corresponds to 1um.
}}

{{Note|
You may decrease ''UnitMultiplier'' if the stage speed is low and increase it if the stage speed is very high. 
}}
