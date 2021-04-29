= Introduction =

In order to control a specific microscope, the Micro-Manager application needs to know what hardware is part of the microscope, load and initialize the appropriate drivers, define configuration presets, create labels for device positions, etc.. Typically, on startup the Micro-Manager application loads a configuration file containing commands configuring all aspects of the system. To start using Micro-Manager, you will first need to create a configuration file specific for your system

[[Image:startup.gif|center|Startup screen]]<br /> Figure 1. Startup screen: selection of the configuration file<br />

Upon Micro-Manager startup an introductory splash screen pops-up displaying the configuration file that is about to be loaded. By default, Micro-Manager attempts to load the file used in the previous session. You can either use that file, load another configuration file, or start Micro-Manager with no configuration file by selecting "none". After pressing OK the initialization process starts and when it finishes without errors, Micro-Manager is ready for use. Configuration files can be also loaded at any time using the <span>'''Tools | Load Hardware Configuration'''</span> command from the main menu. Each time you load a configuration file, the current configuration is un-initialized (shut down) and the new one is initialized. Re-loading a configuration file has (almost) the same effect as restarting the application. You may also switch and save any configuration files under the '''Tools''' menu. 

The way to create a configuration file is by using the Configuration Wizard (<span>'''Tools | Hardware Configuration Wizard'''</span>), which will guide you, step-by-step, through the configuration process and generate a configuration file for you. The wizard will generate a text file that can be edited in a text editor. The syntax of this file is described [[#Configuration file syntax|below]].

<br />

= Hardware Configuration Wizard =

The hardware configuration wizard guides you through the creation of a configuration file in 6 steps. Each step will display specific help in the right  side of the wizard window. Before you begin, you should assemble as much information about your hardware as possible. For instance, you should know which serial ports of your computer are attached to what hardware. Preferably, you should test the functionality of the hardware with software provided by the vendor. Information and helpful advice about specific devices can be found in the [[Device_Support|Device Support]] page. When you get stuck, you can get support through the [https://lists.sourceforge.net/lists/listinfo/micro-manager-general Micro-Manager mailing list]. Remember, this is the most important part in getting Micro-Manager to be fully functional.

[[Image:Wizardstep2.png|Hardware wizard step 2]]<br /> Figure 2. Step 2 of the hardware configuration wizard: selection of devices.<br />

You can exit the wizard at any step by closing the wizard window. You will be prompted to save the configuration file. Doing so (even when something did not work) will be helpful in trouble shooting potential issues. The most critical part of the wizard is in step 2. At this point the hardware is being initialized, and errors/problems may manifest themselves here. At the end of the wizard, save the file using the '.cfg' extension.

<br />

= Configuration Presets =

Any property that Micro-Manager knows about can be changed using the Property Browser (<span>'''Tools | Device/Property Browser'''</span>). Changing properties using the Property Browser quickly becomes cumberson and impracticle. Micro-Manager therefore uses the concept of 'Configuration Presets' that let you quickly change a group of device properties. Configuring these Configuration Presets in a meaningful way is a very important part of configuring Micro-Manager. Configuration Presets also let you modify the User Interface of Micro-Manager to suit your needs.

[[Image:presets.gif|Configuration Presets]]<br /> Figure 3. Example of Configuration Presets in the Main Micro-Manager window<br />

Before setting up Configuration Presets, you should familiarize yourself with the [[Micro-Manager User's Guide#Exploring devices: Device/Property Browser|Device/Property Browser]]. It is also worthwhile to experiment with the Configuration Presets in the demo configuration.

[[Image:groupEditor.png|Preset Editor]]<br /> Figure 4. Initial Screen of the Preset Editor<br />

To make a new configuration group (a new row in the table with '''Configuration settings'''), press the Group '+' button at the bottom left of the Configuration Settings table. A '''Group Editor''' window will appear that looks similar to the Device/Property Browser, but has a third column called 'Use in Group?'. Check the box in the 'Use' column for any property that you want to be included in this configuration group. For instance, you might want to make a group called 'Channel' in which you 'Use' the emission and excitation filter wheels in your system and also set the Core-Shutter (to switch between the fluorescent and transmitted light shutter).

You will now be presented with a second window, (the '''Preset Editor'''), that will list only those properties you have chosen for your new group. Set the properties that you selected to their desired positions and name the Preset (for instance: 'GFP'). Click 'OK', and you will have the first Configuration Prest in this group. To add Presets to the group, select the group (by clicking on the name of the group, 'Channel' in this example), and clicking the Preset '+' button. The Preset Editor will appear again for each new preset. The 'Configuration' column in the user interface will now be a dropdown menu, selecting an item from this menu will change the state of your microscope.

When you select only a single property in the 'Use' column when making a new Configuration Preset Group, Micro-Manager will do some magic. For instance, when this property is displayed as a slider in the Device/Property Browser, a slider will appear in the main Micro-Manager window. If the property has a few values (like a filter wheel), all available values will appear in a dropdown list in the main window. This way you can quickly add control over a single device property, for instance the position of a filter wheel, to the main Micro-Manager window.

Once you are satisfied with your current presets you save them into the current configuration file (or a new one) using "Save" button next to 'Configuration settings'. You can save the presets to the configuration file that you made previously. Next time you start up with that configuration file, your presets will be automatically loaded.

The 'Edit' and '-' (Delete) buttons allow you to change and remove Configuration Groups and Presets. If you add a property to a Group, then all existing Presets in that Group will now include the current value of the new Property.

==Core Properties==

In the [[Micro-Manager User's Guide#Exploring devices: Device/Property Browser|Device/Property Browser]] you will find a list of properties of the Micro-Manager Core, such as core-camera, core-shutter etc. Micro-Manager can work with multiple cameras, shutters etc., however, commands will work only on the 'active' camera, shutter, etc.   If your system has multiple shutters, such as a fluorescent shutter and a trans-illumination shutter you should set the 'active' shutter using the core-shutter property. In configuration groups, never set the state of a shutter directly, rather, rely on Micro-Manager's Autoshutter functionality and use the core-shutter property to select the shutter that should be opened/closed.  For instance, in GFP channel, set the core-shutter property to fluorescent shutter (and do not include the state of the fluorescent shutter) and in the DIC (or trans) channel set the core-shutter property to the trans-illumination shutter.

<br />

= Startup Presets =

There are a few configuration group/preset names with special meaning to Micro-Manager. If you make a configuration preset group called 'System', then you can define the groups 'Startup' and 'Shutdown'. These configuration presets will be applied on startup and shutdown of Micro-Manager respectively.

<br />

= Pixel Size Calibration =

Pixel size calibrations are organized in a way similar to Configuration Preset Groups. You will define a group of properties that affect the pixel size, and when the current settings of the system 'matches' one of the Pixel Size Calibration 'Presets', Micro-Manager will apply that pixel size to the metadata of the images you take.

[[Image:calibration.gif|Pixel Size Calibration Editor]]<br /> Figure 5. Pixel Size Calibration Editor<br />

To set up Pixel Size Calibrations, start the Pixel Size Calibration editor (<span>'''Tools | Pixel Size Calibration'''</span>). Click the 'New' button. A window, very similar to the window you saw when setting up new Configuration Preset Groups will appear. Check the boxes in the 'Use' column for those properties that affect the pixel size i.e objectives, auxiliary magnification (Optovar) etc. Do not check the camera 'Binning'property (binning is automatically taken into account by Micro-Manager). Some other properties might not appear in the list since they are automatically taken into account (so called 'Magnifier' devices, these automatically tell Micro-Manager how they affect pixel size). Give this Pixel Size Calibration a label (the name is unimportant, it should be unique and might help you to remember the settings) and enter the pixel size. When you press 'New' again, only the previously selected properties will appear. Set these to the appropriate settings, give a label and the pixel size. The Pixel Size can also be edited inside the 'Pixel Size calibration' window.

If a non-motorized device affects the pixel size calibration (for instance: your objective turret is non-motorized) you can add a device from the demo-adapter to represent this non-motorzied device and include this demo device in the pixel size calibration settings. When you now manually change the setting of the non-motorized device you should also change the setting of the demo device and Micro-Manager will select the correct pixel size calibration.

Again, do not forget to save the configurations after editing pizel size calibrations (you can use the 'Save' button next to Configuration Presets in the main window to this end). These settings are saved in the same file to describe the hardware and configuration presets (your 'configuration' file).

<br />

= Configuration file syntax =

A configuration is defined in a text file (with default extension *.cfg) containing a list of simple commands to build the desired system state: devices, labels, equipment, properties, and configurations. The format is as follows:<br />
* Each line consists of a number of string fields separated by "," (comma) characters. No extra spaces are allowed for formatting, i.e. space characters will treated as parts of the field.
* Lines beginning with "#" are ignored (can be used for comments).<br />
* Each line in the file will be parsed by the system and as a result a corresponding command will be immediately executed.<br />

The first field in the line always specifies the command from the following set of values:<br />

* Device -- loads device<br />
* Label -- attaches a label to the specified device position<br /> 
* Equipment -- defines various equipment attributes used for image annotation<br />
* Property -- sets a specific device property 
* ConfigGroup -- defines a single entry in the configuration group<br /><br /> Remaining fields in the line are used for specifying the corresponding command parameters. The number of parameters depends on the actual command used.<br /><br /> The following listing shows configuration file for the Demo setup.<br /><br />

<div class="source"><span><font face="Courier New"><nowiki># Generated by Configurator on Wed Jan 10 12:06:46 PST 2007</nowiki><br /><br /> # Reset<br /> Property,Core,Initialize,0<br /><br /> # Devices<br /> Device,Camera,DemoCamera,DCam<br /> Device,Dichroic,DemoCamera,DWheel<br /> Device,Emission,DemoCamera,DWheel<br /> Device,Excitation,DemoCamera,DWheel<br /> Device,Objective,DemoCamera,DObjective<br /> Device,Z,DemoCamera,DStage<br /> Device,Path,DemoCamera,DLightPath<br /> Device,XYStage,DemoCamera,DXYStage<br /><br /> # Pre-init settings for devices<br /><br /> # Pre-init settings for COM ports<br /><br /> # Initialize<br /> Property,Core,Initialize,1<br /><br /> # Delays<br /><br /> # Roles<br /> Property,Core,Camera,Camera<br /> Property,Core,Focus,Z<br /> Property,Core,AutoShutter,1<br /><br /> # Camera-synchronized devices<br /><br /> # Labels<br /> # Dichroic<br /> Label,Dichroic,9,State-9<br /> Label,Dichroic,8,State-8<br /> Label,Dichroic,7,State-7<br /> Label,Dichroic,6,State-6<br /> Label,Dichroic,5,State-5<br /> Label,Dichroic,4,State-4<br /> Label,Dichroic,3,State-3<br /> Label,Dichroic,2,Q585LP<br /> Label,Dichroic,1,Q505LP<br /> Label,Dichroic,0,400DCLP<br /> # Emission<br /> Label,Emission,9,State-9<br /> Label,Emission,8,State-8<br /> Label,Emission,7,State-7<br /> Label,Emission,6,State-6<br /> Label,Emission,5,State-5<br /> Label,Emission,4,State-4<br /> Label,Emission,3,Chroma-HQ700<br /> Label,Emission,2,Chroma-HQ535<br /> Label,Emission,1,Chroma-D460<br /> Label,Emission,0,Chroma-HQ620<br /> # Excitation<br /> Label,Excitation,9,State-9<br /> Label,Excitation,8,State-8<br /> Label,Excitation,7,State-7<br /> Label,Excitation,6,State-6<br /> Label,Excitation,5,State-5<br /> Label,Excitation,4,State-4<br /> Label,Excitation,3,Chroma-HQ620<br /> Label,Excitation,2,Chroma-HQ570<br /> Label,Excitation,1,Chroma-HQ480<br /> Label,Excitation,0,Chroma-D360<br /> # Objective<br /> Label,Objective,5,Objective-5<br /> Label,Objective,4,Objective-4<br /> Label,Objective,3,Nikon 20X Plan Fluor ELWD<br /> Label,Objective,2,Objective-2<br /> Label,Objective,1,Nikon 10X S Fluor<br /> Label,Objective,0,Nikon 40X Plan Flueor ELWD<br /><br /> # Configuration presets<br /> # Group: Camera<br /> # Preset: MedRes<br /> ConfigGroup,Camera,MedRes,Camera,Binning,2<br /> ConfigGroup,Camera,MedRes,Camera,PixelType,8bit<br /><br /> # Preset: Default<br /> ConfigGroup,Camera,Default,Camera,Binning,1<br /> ConfigGroup,Camera,Default,Camera,PixelType,8bit<br /><br /> # Preset: LowRes<br /> ConfigGroup,Camera,LowRes,Camera,Binning,4<br /> ConfigGroup,Camera,LowRes,Camera,PixelType,8bit<br /><br /> # Preset: HiRes<br /> ConfigGroup,Camera,HiRes,Camera,Binning,1<br /> ConfigGroup,Camera,HiRes,Camera,PixelType,16bit<br /><br /><br /> # Group: Objective<br /> # Preset: 20X<br /> ConfigGroup,Objective,20X,Objective,State,3<br /><br /> # Preset: 40X<br /> ConfigGroup,Objective,40X,Objective,State,0<br /><br /> # Preset: 10X<br /> ConfigGroup,Objective,10X,Objective,State,1<br /><br /><br /> # Group: Channel<br /> # Preset: FITC<br /> ConfigGroup,Channel,FITC,Dichroic,Label,Q505LP<br /> ConfigGroup,Channel,FITC,Emission,Label,Chroma-HQ535<br /> ConfigGroup,Channel,FITC,Excitation,Label,Chroma-HQ480<br /><br /> # Preset: Rhodamine<br /> ConfigGroup,Channel,Rhodamine,Dichroic,Label,Q585LP<br /> ConfigGroup,Channel,Rhodamine,Emission,Label,Chroma-HQ700<br /> ConfigGroup,Channel,Rhodamine,Excitation,Label,Chroma-HQ570<br /><br /> # Preset: DAPI<br /> ConfigGroup,Channel,DAPI,Dichroic,Label,400DCLP<br /> ConfigGroup,Channel,DAPI,Emission,Label,Chroma-HQ620<br /> ConfigGroup,Channel,DAPI,Excitation,Label,Chroma-D360<br /><br /> # Preset: Cy5<br /> ConfigGroup,Channel,Cy5,Dichroic,Label,400DCLP<br /> ConfigGroup,Channel,Cy5,Emission,Label,Chroma-HQ700<br /> ConfigGroup,Channel,Cy5,Excitation,Label,Chroma-HQ570<br /><br /><br /> # Group: System<br /> # Preset: Startup<br /> ConfigGroup,System,Startup,Camera,CCDTemperature,-85.26<br /> ConfigGroup,System,Startup,Camera,Gain,3<br /><br /> # Preset: Shutdown<br /> ConfigGroup,System,Shutdown,Camera,CCDTemperature,0.00<br /> ConfigGroup,System,Shutdown,Camera,Gain,0<br /><br /><br /> # Group: LightPath<br /> # Preset: Camera-left<br /> ConfigGroup,LightPath,Camera-left,Path,State,1<br /><br /> # Preset: Eyepiece<br /> ConfigGroup,LightPath,Eyepiece,Path,State,0<br /><br /> # Preset: Camera-right<br /> ConfigGroup,LightPath,Camera-right,Path,State,2<br /><br /><br /> # PixelSize settings<br /> # Resolution preset: 20x<br /> ConfigPixelSize,20x,Objective,Label,Nikon 20X Plan Fluor ELWD<br /> PixelSize_um,20x,0.5<br /><br /> # Resolution preset: 40x<br /> ConfigPixelSize,40x,Objective,Label,Nikon 40X Plan Flueor ELWD<br /> PixelSize_um,40x,0.25<br /><br /> # Resolution preset: 10x<br /> ConfigPixelSize,10x,Objective,Label,Nikon 10X S Fluor<br /> PixelSize_um,10x,1.0<br /><br /></font></span></div>


= Memory Settings =

<div id="MemorySettings"></div>
It is often necessary to adjust memory settings in order to optimize Micro-Manager performance and prevent errors. Different parts of Micro-Manager use different types of memory that can be individually tuned.

The ImageJ memory limit ('''ImageJ | Edit | Options | Memory & Threads...'''), and the sequence buffer size ('''Tools | Options''') can be changed. These each need to be large enough for what they are used for, but small enough to leave RAM for the other, and for the Operating System. 

The sequence buffer is used to hold freshly acquired images until the Micro-Manager application is ready to process (display, save, etc.) them. It helps absorb occasional glitches that slow down software processing, so that the camera can acquire images at its set rate. The sequence buffer is not used for Snap acquisitions or those Multi-Dimensional Acquisitions where there is plenty of time between frames. 

The ImageJ memory limit (actually the maximum amount of memory that can be used by the Java Virtual Machine running ImageJ/Micro-Manager) determines the amount of RAM that can be used for general application memory.  To complicate matters, some versions of Micro-Manager store images outside of this JVM memory (1.4 since 2013, and 2.0 until April 2020), whereas others (pre-2013 and 2.0 since April 2020) store images inside the ImageJ memory limit.  If you are unsure which one you use, open the ImageJ memory monitor tool ('''ImageJ | Plugins | Utilities | Monitor Memory...'''), run an acquisition that stores a significant number of images in RAM, and note if the memory usage goes up accordingly (occasionally pressing the ImageJ status bar to invoke the Java memory garbage collector). If memory usage stays low, your version of MM stores images outside of the JVM memory. 

Here are some guidelines for adjusting memory settings:

- If Micro-Manager stores images outside of the JVM, you do not need to set the ImageJ memory setting very large, unless you experience "out of memory" errors when processing images using ImageJ and ImageJ plugins. For the 64-bit version, 1-4 GB is recommended (but leave several GB of your total RAM for other purposes). For the 32-bit version, it is important ''not'' to set the ImageJ memory too large. 400-800 MB is usually a good range, and you should not exceed 1.2 GB (a little larger is okay on OS X).

- If Micro-Manager stores images inside the JVM (2.0 since April 2020), set the ImageJ memory limit as high as possible, but make sure the total amount of memory set for the circular buffer plus ImageJ does not exceed ~80-90% of the total memory in your computer.

- For the sequence buffer size setting, try first setting the buffer to 20-100 times the size of a single image from your camera. You may get "sequence buffer overflow" (also known as "circular buffer overflow") errors during acquisitions, especially at high frame rates. If so, try increasing the sequence buffer size (for fast streaming of large images, much larger settings can sometimes be useful). You can also use the Sequence Buffer Monitor plugin ('''Plugins | Developer Tools''') to see how much of the sequence buffer is actually used during a Multi-Dimensional Acquisition.

If you have another installation of ImageJ on your computer, keep in mind that Micro-Manager uses its own copy of ImageJ and that you need to set memory options on both.

Finally, note that the sequence buffer size setting is saved per user profile, while the ImageJ memory setting is saved per copy of ImageJ.

= Troubleshooting =
Micromanager GUI (MMStudio) handles other non-hardware settings through [http://docs.oracle.com/javase/7/docs/api/java/util/prefs/package-summary.html Java preferences API] (<small>java.util.prefs</small>), so they're persistent even after uninstall. In some cases (e.g. after using development version or  upgrade) old properties can cause GUI misbehaviour (e.g. inability to save changed histogram range).

Windows user can find preferences in <small>HKEY_CURRENT_USER\Software\JavaSoft\Prefs\Org\micromanager</small> registry branch and remove manually. New properties will be created automatically. Hardware configuration remains unchanged.

<span>'''Created on July 31, 2006 by Nenad Amodaj<br /> Revised on January 31, 2007<br /> Revised on August 21, 2008 by Nico Stuurman<br /> Revised on May 16, 2012 by Ziah Dean'''<br />'''Revised on December 3, 2014, by Mark Tsuchida'''<br />'''Extended on October 5, 2015 by Eugene Dvoretsky'''</span>


{{Documentation_Sidebar}}
