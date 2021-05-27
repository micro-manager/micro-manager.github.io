= Micro-Manager Programming Guide =

<span>''Created on November 16, 2005 by Nenad Amodaj<br /> Updated for release 1.0.37(beta) on July 28, 2006''</span><br />

{{Note|Micro-Manager 1 and 2 use the same C++ layer, hence this guide is applicable to both versions.  However, the Java interfaces are different.   Please use the version 2 api unless you have very good reasons not to.}}

== Introduction ==

Before diving into Programming within Micro-Manager, it is useful to review the general [[Overview of the documentation|overview of the documentation]] as well as the [[Micro-Manager Project Overview|overview of the software architecture]]. <br /><br />

<div>Micro-Manager central component is the <span>''MMCore''</span> class encapsulating the entire automated microscope. <span>''MMCore''</span> API represents a high-level abstraction for any combination of standard components used in automated digital microscopy. A program written to the <span>''MMCore''</span> API should be able to successfully execute regardless of specific devices used, or in the worst case gracefully degrade if the minimal conditions are not satisfied. By using run-time configuration discovery features of the<span>'' MMCore''</span> API, a program can automatically determine whether minimal conditions for its execution are satisfied, e.g. if required devices are present and if they have required capabilities.</div>

<br />The <span>''MMCore''</span> API enables the program designer to build user interface or automation protocol in a device-independent way and with minimal effort. <span>''MMCore''</span> provides implementations for the most of the common tasks that automated microscope is expected to perform in the laboratory or screening setting.<br /><br /> We are using the term "program" in a relatively loose sense, since <span>''MMCore''</span> implementation is in essence language agnostic. For example, a "program" can be C++ source code implementing complicated user interface or a simple and small Beanshell (Java-like) script to acquire a sequence of images. The <span>''MMCore''</span> API is designed with scripting transparency in mind. For purely practical reasons all examples in this guide are shown in Java programming language while API reference is specified in C++, but we assume that translation of both to any other programming environment is straightforward. <br /><br />

== Setting up the run-time environment ==

Micro-Manager is in principle both platform independent and language neutral. But, in practice <span>''MMCore''</span> component is intended to run only on Windows, Mac OS X and Linux, and to be used from C++, Java, Matlab and Python programs. Setting up the environment is somewhat different for each language/OS combination.<br />

See also: [[Search Paths]]

=== Java ===

<span>''MMCore''</span> Java API is contained in the <span>'''MMCoreJ.jar'''</span>. Any Java program using <span>''MMCore''</span> API must have <span>'''MMCoreJ.jar'''</span> in its class path. When CMMCore Java object is first created in the calling program it will automatically attempt to load native library MMCoreJ_wrap. This library must be visible to the Java run-time. Default locations and exact names of libraries are platform dependent.<br /><br /> On Windows, native library file is MMCoreJ_wrap.dll and it must reside either in the system path or in the current working directory of the program in order to be detected by the Java run-time.<br />

=== C++ ===

In C++ MMCore can be used as a static library which needs to be linked to the calling program. Interface is specified in header files MMCore.h and Configuration.h.  You only need to set up the C++ environment if you are editing device adapters or the MMCore code.


=== Matlab ===

<span>''MMCore''</span> can be used in Matlab through its Java interface. After setting up the Java environment as described above, MMCoreJ.jar must be added to Matlab Java class path and the directory for the MMCore dynamic libraries (including MMCoreJ_wrap) must be added to the system path.<br />

=== Other ===

The current version of the MMCore does not support programming environments other than Java, Matlab and C++. Additional support for dynamic languages such as Python will be added in the future, if there is enough interest . <br /><br />

== Getting started ==

You can use any editor or Java IDE of your preference to try examples from this guide. Java run-time should be version 1.6 or higher (for MM version 2, it should be Java 1.8 or higher). Instructions to work with several Java IDEs are available:

* [[Using Netbeans|Netbeans]], which seems to be the recommended IDE ([[Writing_plugins_for_Micro-Manager|see previous instructions]])
* [[Using Eclipse|Eclipse]].([[Writing_plugins_for_Micro-Manager#Configure_Eclipse_to_edit_a_plugin|see previous instructions]])

<br />

=== Creating the CMMCore object ===

First thing to do is to create the CMMCore object. For example, we can create the object and display the software version:<br /><br />

<div class="source"> CMMCore core = new CMMCore();<br /> String info = core.getVersionInfo();<br /> System.out.println(info);<br /></div>

<br /> When executed, this little program should display something like:<br /><br /><span class="source"> MMCore version 1.0.16 (debug)</span><br /><br /> However, at this point <span>''MMCore''</span> canâ€™t do much more than that, because it does not know about any devices yet. In the next section we are going to try to use a camera by loading the appropriate device adapter.<br />

=== Loading devices ===

In order to control a hardware device <span>''MMCore''</span> needs to load the corresponding device adapter. We use the term "adapter" rather than "driver" to make a distinction from the low-level software supplied by the device manufacturer. For example, digital cameras come with manufacturer's drivers which need to be installed independently from the Micro-Manager. adapters are relatively simple software components translating specific device driver API to common Micro-Manager plug-in interface. For simpler devices controlled by serial ports, there are no special manufacturer's drivers to install. In that case adapter is at the same time a device driver as well.<br /><br /> Device adapters are packaged as dynamic libraries and CMMCore loads them only when specifically requested by the calling program. Let's see how we can configure MMCore to control a camera.<br /><br /> The command to load device in MMCore has the following signature:<br />

<div class="source">public void loadDevice(String label, String library, String name) throws java.lang.Exception</div>

<br /> We can use it like this:<br />

<div class="source">CMMCore core = new CMMCore();</div><div class="source">core.loadDevice("Camera", "DemoCamera", "DCam");</div>

<br /> The command above has three parameters: label, library and name. Device label is the name we want to assign to a specific device. It is completely arbitrary and entirely up to us. We chose to call our camera simply "Camera". "DemoCamera" is the dynamic library name where the adapter resides. "DCam" is the name of the device adapter we want to load.<br /><br /> After loading the adapter the device is still inactive. Before starting to control the device we must perform initialization:<br />
<span class="source">core.initializeDevice("Camera");</span><br /><br /> 
The core may know about multiple camera devices, and needs to be told which one to use:<br />
<span class="source">core.setCameraDevice("Camera");</span><br /><br />
The following program puts all of the above together: loads the camera adapter, initializes it and additionally snaps an image with exposure set to 50ms.<br />

<div class="source"> 
CMMCore core = new CMMCore();<br /> 
core.loadDevice("Camera", "DemoCamera", "DCam");<br /> core.initializeDevice("Camera");<br /> 
core.setCameraDevice("Camera");<br />
core.setExposure(50);<br /> 
core.snapImage();<br /> 
byte image[] = (byte[]) core.getImage();<br /> 
long width = core.getImageWidth();<br /> 
long height = core.getImageHeight();<br />
</div>

<br /> For clarity the above example omits some details necessary to really compile and run this example. Complete Java code is here: [http://valelab.ucsf.edu/~MM/files/Tutorial1.java Tutorial1.java]<br />

=== Error handling ===

If an error occurs during execution of the function call, CMMCore object will throw a java exception, which you can handle in any standard way. For example:<br />

<div class="source">try {</div><div class="source"> core.loadDevice("Camera", "Hamamatsu", "Hamamatsu_DCAM");</div><div class="source"> core.initializeAllDevices();</div><div class="source">} catch (Exception e){</div><div class="source"> System.out.println("Exception: " + e.getMessage() + "\nExiting now.");</div><div class="source"> System.exit(1); </div><div class="source">}</div>

== Using device properties ==

Each device loaded into the MMCore will expose a number of properties which we can read or change. A property is simply a named tag, or a field consisting of a name and value.<br /><br />

<div class="source">// get some properties</div><div class="source">String propBinning = core.getProperty("Camera", "Binning");</div><div class="source">String propPixelType = core.getProperty("Camera", "PixelType");</div><div class="source"><br /> // set some properties</div><div class="source">core.setProperty("Camera", "Binning", "4");</div><div class="source">core.setProperty("Camera", "PixelType", "16bit");</div>

<br /> To get or set the property you have to supply two parameters: device label and property name. "getProperty" method will return the value, while in the "setProperty" method you have to supply the value as an additional, third parameter. All property values are always treated as strings regardless of the actual data type they represent.<br /><br /> How do you find out which properties are supported by a particular device? This code prints all properties of the "Camera" and their current values:<br /><br />

<div class="source"> StrVector properties = core.getDevicePropertyNames("Camera");</div><div class="source"> for (int i=0; i<properties.size(); i++) {</div><div class="source"> String prop = properties.get(i);</div><div class="source"> String val = core.getProperty("Camera", prop);</div><div class="source"> System.out.println("Name: " + prop + ", value: " + val);</div><div class="source"> }</div>

<br /> Note the use of the StrVector class as a simple vector containing of strings (String class) containing property names. This class is defined within MMCoreJ.jar.}}<br /><br /> How do you find out which values are valid for a particular property? This code prints all allowed values for the "PixelType" property:<br /><br />

<div class="source"> StrVector values = core.getAllowedPropertyValues("Camera", "PixelType");</div><div class="source"> for (int i=0; i<values.size(); i++) {</div><div class="source"> String val = values.get(i);</div><div class="source"> System.out.println(val);</div><div class="source"> }</div>

<br /> If the getAllowedProperties() call returns empty vector, it means that the range of possible values is so broad that it is not practical to enumerate them, or that the device adapter does not have this information. You could interpret that as if any value is allowed. However, it is not guaranteed that the device will be able to accept any particular value in a given context. On the other hand, if the returned vector is not empty you can expect that setting any of the allowed values will succeed.<br /><br /> Some properties are read-only. For example, you can discover if the camera property "Description" is read-only by using:<br />

<div class="source"> boolean ro = core.isPropertyReadOnly("Camera", "Description");</div>

<br /> Complete Java code is here: [http://valelab.ucsf.edu/~MM/files/Tutorial2.java Tutorial2.java].<br />

=== Relationship between properties and device specific calls ===

By examining the two examples [content/code_examples/Tutorial1.java Tutorial1.java] and [content/code_examples/Tutorial2.java Tutorial2.java] you can get an insight on two different ways to control devices: device specific API and generalized property mechanism.<br /><br /> Device specific API consists of commands which imply device of certain type. This API reflects capabilities expected from and any automated microscope, regardless of specific devices used to build it. For example:<br /><br />

<div class="source"> // commands which imply a single device attached to the system,</div><div class="source"> // in this case a camera.</div><div class="source"><br /> core.snapImage();</div><div class="source"> long h = core.getImageHeight();</div><div class="source"> double e = core.getExposure();</div><div class="source"><br /></div><div class="source"> // example commands which imply a specific device type</div><div class="source"> // (device label must be provided)</div><div class="source"><br /> core.setPosition("Z", 120.0); // works only for stages</div><div class="source"> core.setState("F1", 3); // works only for filter wheels, shutters, etc.</div>

<br /> On the other hand, the property mechanism is very general and does not assume anything about the device. In this way you can use a very flexible conceptual model in which the entire system is just a collection of various devices and each device has a number of property tags which you read or change. The property mechanism makes possible to build robust user interfaces and programs which automatically re-configure based on specific run-time configuration of the system.<br /><br />

<div class="source"> // these two commands</div><div class="source"> core.setPosition("Z", 123.0);</div><div class="source"> core.setExposure("Camera", 55.0);</div><div class="source"><br /> // have exactly the same effect as</div><div class="source"> core.setProperty("Z", "Position", "123.0");</div><div class="source"> core.setProperty("Camera", "Exposure", "55.0");</div>

<br /> Also, the property mechanism allows us to control many details which are very specific to the device type. For example, some cameras will have an "Offset" property available and some will not.<br />

== Working with multiple devices ==

Let us consider a somewhat more complicated system with four devices: camera, shutter, and two filter wheels.<br /><br />

<div class="source"> // clear previous setup if any</div><div class="source"> core.unloadAllDevices();</div><div class="source"><br /> // load devices</div><div class="source"> core.loadDevice("Camera", "DemoCamera", "DCam");</div><div class="source"> core.loadDevice("Emmision", "DemoCamera", "DWheel");</div><div class="source"> core.loadDevice("Exictation", "DemoCamera", "DWheel");</div><div class="source"> core.loadDevice("Shutter", "DemoCamera", "DWheel");</div><div class="source"> core.loadDevice("Z", "DemoCamera", "DStage");</div><div class="source"></div><div class="source"> // initialize</div><div class="source"> core.initializeAllDevices();</div><div class="source"></div><div class="source"> // list devices</div><div class="source"> StrVector devices = core.getLoadedDevices();</div><div class="source"> System.out.println("Device status:");</div><div class="source"></div><div class="source"> for (int i=0; i<devices.size(); i++){</div><div class="source"> System.out.println(devices.get(i)); </div><div class="source"></div><div class="source"> // list device properties</div><div class="source"> StrVector properties = core.getDevicePropertyNames(devices.get(i));</div><div class="source"> for (int j=0; j<properties.size(); j++){</div><div class="source"> System.out.println(" " + properties.get(j) + " = "</div><div class="source"> + core.getProperty(devices.get(i), properties.get(j)));</div><div class="source"> StrVector values = core.getAllowedPropertyValues(devices.get(i),</div><div class="source"> properties.get(j));</div><div class="source"></div><div class="source"> for (int k=0; k<values.size(); k++){</div><div class="source"> System.out.println(" " + values.get(k));</div><div class="source"> }</div><div class="source"> }</div>

<br /> Complete Java code is here: [http://valelab.ucsf.edu/~MM/files/Tutorial3.java Tutorial3.java].<br />

== Using serial ports ==

Many devices use serial ports for communication with the host computer. For MMCore serial port is also a device with number of properties to manipulate.<br />

<div class="source"> core.loadDevice("Port", "SerialManager", "COM1");</div><div class="source"> core.setProperty("Port", "StopBits", "2");</div><div class="source"> core.setProperty("Port", "Parity", "None");</div><div class="source"> core.initializeDevice("Port");</div>

<br /> Once the property is loaded and initialized, you can send and receive terminated command strings like this:<br /><br />

<div class="source"> core.setSerialPortCommand("Port", "MOVE X=300", "\r");</div><div class="source"> String answer = core.getSerialPortAnswer("Port", "\r");</div>

<br /> The last parameter in both send and receive commands is a terminating sequence, in this case carriage return. The receive command getSerialPortAnswer() will wait until it detects the terminating sequence or times out.<br /><br /> Most of the devices use similar protocol and therefore in principle you can control any device supporting serial port communication even if you do not have device adapter. Just send and receive commands through the serial port. Of course, this way you won't be able to use many of the more advanced features of the Micro-Manager system (such as device synchronization, metadata) and your code will not portable. <br />

== Using State devices ==

State device is any device with a relatively small number of discrete states. The most common examples of state device are filter switchers (wheels) and objective turrets.<br /><br />

<div class="source"> core.loadDevice("Emission", "DemoCamera", "DWheel");</div><div class="source"> core.loadDevice("Excitation", "DemoCamera", "DWheel");</div><div class="source"> core.loadDevice("Dichroic", "DemoCamera", "DWheel");</div><div class="source"> core.loadDevice("Objective", "DemoCamera", "DObjective");</div><div class="source"><br /> core.initializeAllDevices();</div><div class="source"><br /> // set emission filter to position 2</div><div class="source"> core.setState("Emission", 2);</div><div class="source"><br /> // verify position</div><div class="source"> core.waitForDevice("Emission"); // until it stops moving</div><div class="source"> long state = core.getState("Emission"); </div>

<br /> Almost invariably state devices serve as placeholders for interchangeable equipment: objectives or filters. To make code more readable, and more device independent, instead of just using position numbers as shown above it is much better to refer to positions with meaningful names such as "Nikon S Fluor 10X" or "Chroma-D360". State devices support position labeling feature and any position can be assigned with an arbitrary name:<br /><br />

<div class="source"> // define emission filter positions</div><div class="source"> core.defineStateLabel("Emission", 0, "Chroma-D460");</div><div class="source"> core.defineStateLabel("Emission", 1, "Chroma-HQ620");</div><div class="source"> core.defineStateLabel("Emission", 2, "Chroma-HQ535");</div><div class="source"> core.defineStateLabel("Emission", 3, "Chroma-HQ700");</div><div class="source"><br /> // set position using label</div><div class="source"> core.setStateLabel("Emission", "Chroma-D460");</div><div class="source"><br /> // verify position</div><div class="source"> core.waitForDevice("Emission"); // until it stops moving</div><div class="source"> String stateLabel = core.getStateLabel("Emission");</div>

<br /> The state device used in tutorial examples is really a software simulator (from the DemoCamera adapter library) and it does not use any hardware connections. But most state devices are controlled through serial ports, so in order to control them you'll need to link state device to appropriate serial port device:<br /><br />

<div class="source"> core.unloadAllDevices();</div><div class="source"><br /> // setup serial port</div><div class="source"> core.loadDevice("P1", "SerialManager", "COM1");</div><div class="source"> core.setProperty("P1", "StopBits", "1");</div><div class="source"><br /> // setup filter wheels</div><div class="source"> core.loadDevice("WA", "SutterLambda", "Wheel-A");</div><div class="source"> core.setProperty("WA", "Port", "P1");</div><div class="source"> core.loadDevice("WB", "SutterLambda", "Wheel-B");</div><div class="source"> core.setProperty("WB", "Port", "P1");</div><div class="source"><br /> mmc.initializeAllDevices();</div>

<br /> The code above looks fairly straightforward, but there are a couple of important points to consider here. {{Note|Micro-Manager device adapters do not take control of serial ports directly.}} We first loaded serial port device "P1" on COM1 and then we just supplied the filter wheel devices "WA" and "WB" with the port label. Devices will use port labels through MMCore internal mechanisms to transmit and receive data from ports, and will not be able to lock them or take control of them.<br /><br /> You will notice that both devices "WA" and "WB" appear to be connected to the same port "P1". That's because they physically belong to the same controller box which uses single port to control multiple devices. This is a relatively common situation, but having each filter on a different port is also fine. <br /><br /> In all examples from previous sections we started manipulating properties only after we initialized the system either by initializeDevice() or initializeAllDevices(). In fact, most of the device properties are even not available before the device has been initialized. But, in the example above we set port related properties before initializing the system. We had to do it that way because these properties must be specified correctly in advance in order for initialization to succeed. Which properties, if any, are required or accessible before initialization depends on the specific device adapter. Camera adapters, for example, usually do need or expose any pre-initialization properties.<br /><br /> The order in which devices are loaded will be the same order in which they are going to be initialized in the initializeAllDevices() command. Therefore, port devices should be loaded before other devices using them.<br />

== Using configurations ==

In practical situations we often need to execute groups of multiple commands over an over again. For example, to set the correct light path for imaging DAPI fluorescence channel you need to set three filters in proper positions:<br /><br />

<div class="source"> // Set DAPI imaging path</div><div class="source"> core.setState("Emission", 1);</div><div class="source"> core.setState("Excitation", 2);</div><div class="source"> core.setState("Dichroic", 0);</div><div class="source"><br /> Or equivalently, by exploiting property mechanism:</div><div class="source"> // equivalent to above</div><div class="source"> core.setProperty("Emission", "State", "1");</div><div class="source"> core.setProperty("Excitation", "State", "2");</div><div class="source"> core.setProperty ("Dichroic", "State", "0");</div><div><br /></div>

To simplify programming Micro-Manager provides configuration feature in which you can define groups of commands and execute them as a single command. To define "DAPI" configuration (group of commands) you need to write:<br /><br />

<div class="source"> // Define DAPI configuration once at the beginning of the session</div><div class="source"> core.defineConfigGroup("Channel","DAPI", "Emission", "State", "1");</div><div class="source"> core.defineConfigGroup("Channel","DAPI", "Excitation", "State", "2");</div><div class="source"> core.defineConfigGroup("Channel","DAPI", "Dichroic", "State", "0");</div><div class="source"><br /> // use configuration command many times</div><div class="source"> core.setConfig("DAPI);</div><div><br /></div>

Each time you execute setConfiguration("DAPI"), the three filters will be set to the defined positions. There is no limit in the number of devices or number of different properties you include in one configuration. You can set objectives, filters, stage positions, camera parameters in a single configuration command. Typically predefined configurations are automatically defined once at the initialization (when the program starts up) phase and used thereafter in the acquisition scripts or interactively. <br /><br /> To discover which configurations are currently defined in your system and what exact settings they consist of, you can use:<br /><br />

<div class="source"> StrVector configs = core.getAvailableConfigGroups();</div><div class="source"> for (int i=0; i<configs.size(); i++){</div><div class="source"> Configuration cdata = core.getConfigData(configs.get(i));</div><div class="source"> System.out.println("Configuration " + configs.get(i));</div><div class="source"> for (int j=0; j<cdata.size(); j++) {</div><div class="source"> PropertySetting s = cdata.getSetting(j);</div><div class="source"> System.out.println(" " + s.getDeviceLabel() + ", " + s.getPropertyName() + ", " + s.getPropertyValue());</div><div class="source"> }</div><div class="source"> }</div>

<br /> Note the two new classes defined in the MMCoreJ: Configuration and PropertySetting. PropertySetting is a triplet of strings: DeviceLabel, PropertyName and PropertyValue. Configuration is just a collection of PropertySetting objects.<br /><br /> To discover which configuration the system is currently in:<br /><br />

<div class="source"> String config = core.getConfiguration();</div><div><br /></div>

This command can return an empty string if the system current state does not match any of the defined configurations. getConfiguration command will return the matching configuration name (if any) even if the individual commands were used instead setConfiguration.<br />

== Synchronization ==

This section is '''not''' talking about hardware-triggered acquisitions using e.g. TTL pulses, which is called "hardware synchronization" in the publication at http://www.jbmethods.org/jbm/article/view/36/29 and elsewhere.

Each device loaded in MMCore reports its status by using "Busy" flag. A device declares that it is busy if it is still executing the previous command. To check the status of a single device or the entire system: <br /><br />

<div class="source"> // check Z stage status</div><div class="source"> boolean ZStageBusy = core.deviceBusy("Z");</div><div class="source"><br /> // check if any of the devices in the system are busy</div><div class="source"> boolean systemBusy = core.systemBusy();</div>

<br /> Very often you check the device status because you shouldn't proceed with some action until the devices stopped moving or executing previous commands. To relieve the programmer of the boring task of writing polling loops, we provided special commands to implement waiting for devices:<br /><br />

<div class="source"> // wait until Z stage stops moving</div><div class="source"> core.waitForDevice("Z");</div><div class="source"> core.snapImage();</div><div class="source"><br /> // move to new XY position</div><div class="source"> core.SetPosition("X", 1230);</div><div class="source"> core.setPosition("Y", 330);</div>

<br />

<div class="source"> // wait until the all devices in the system stop moving</div><div class="source"> core.waitForSystem();</div><div class="source"> core.snapImage();</div><div class="source"> Imaging</div><div class="source"> To further streamline synchronization tasks you can define all devices which must be non-busy before the image is acquired.</div><div class="source"> // The following devices must stop moving before the image is acquired</div><div class="source"> core.assignImageSynchro("X");</div><div class="source"> core.assignImageSynchro("Y");</div><div class="source"> core.assignImageSynchro("Z");</div><div class="source"> core.assignImageSynchro("Emission");</div><div class="source"><br /> // Set all the positions. For some of the devices it will take a while</div><div class="source"> // to stop moving</div><div class="source"> core.SetPosition("X", 1230);</div><div class="source"> core.setPosition("Y", 330);</div><div class="source"> core.SetPosition("Z", 8000);</div><div class="source"> core.setState("Emission", 3);</div><div class="source"><br /> // Just go ahead and snap an image. The system will automatically wait</div><div class="source"> // for all of the above devices to stop moving before the</div><div class="source"> // image is acquired</div><div class="source"> core.snapImage();</div>

== Shutter control ==

If the shutter is associated with the camera it usually needs to be opened before an image is taken and closed as soon as acquisition is done. If the "auto shutter" feature is turned on the system will automatically perform these operations in the snapImage command. <br /><br />

<div class="source"> // take image with auto shutter</div><div class="source"> core.setAutoShutter(true);</div><div class="source"> core.snapImage();</div><div class="source"><br /> // take image with manual shutter</div><div class="source"> core.setAutoShutter(false); // disable auto shutter</div><div class="source"> core.setProperty("Shutter", "State", "1"); // open</div><div class="source"> core.waitForDevice("Shutter");</div><div class="source"> core.snapImage();</div><div class="source"> core.setProperty("Shutter", "State", "0"); // close</div>

== Configuring the system ==

As you have seen in the earlier sections at startup MMCore object doesn't know about any devices, there are no labels defined, no options set and no synchronization objects assigned. Before normal use of the software the entire system needs to be configured according to the current hardware setup. Here is an example configuration program to be executed at system startup:<br /><br />

<div class="source"> // load devices</div><div class="source"> core.loadDevice("Camera", "DemoCamera", "DCam");</div><div class="source"> core.loadDevice("Emission", "DemoCamera", "DWheel");</div><div class="source"> core.loadDevice("Excitation", "DemoCamera", "DWheel");</div><div class="source"> core.loadDevice("Dichroic", "DemoCamera", "DWheel");</div><div class="source"> core.loadDevice("Objective", "DemoCamera", "DObjective");</div><div class="source"> core.loadDevice("X", "DemoCamera", "DStage");</div><div class="source"> core.loadDevice("Y", "DemoCamera", "DStage");</div><div class="source"> core.loadDevice("Z", "DemoCamera", "DStage"); </div><div class="source"></div><div class="source"> core.initializeAllDevices(); </div><div class="source"> // Set labels for state devices</div><div class="source"> //</div><div class="source"> // emission filter</div><div class="source"> core.defineStateLabel("Emission", 0, "Chroma-D460");</div><div class="source"> core.defineStateLabel("Emission", 1, "Chroma-HQ620");</div><div class="source"> core.defineStateLabel("Emission", 2, "Chroma-HQ535");</div><div class="source"> core.defineStateLabel("Emission", 3, "Chroma-HQ700");</div><div class="source"></div><div class="source"> // excitation filter</div><div class="source"> core.defineStateLabel("Excitation", 2, "Chroma-D360");</div><div class="source"> core.defineStateLabel("Excitation", 3, "Chroma-HQ480");</div><div class="source"> core.defineStateLabel("Excitation", 4, "Chroma-HQ570");</div><div class="source"> core.defineStateLabel("Excitation", 5, "Chroma-HQ620");</div><div class="source"></div><div class="source"> // excitation dichroic</div><div class="source"> core.defineStateLabel("Dichroic", 0, "400DCLP");</div><div class="source"> core.defineStateLabel("Dichroic", 1, "Q505LP");</div><div class="source"> core.defineStateLabel("Dichroic", 2, "Q585LP");</div><div class="source"></div><div class="source"> // objective</div><div class="source"> core.defineStateLabel("Objective", 1, "Nikon 10X S Fluor");</div><div class="source"> core.defineStateLabel("Objective", 3, "Nikon 20X Plan Fluor ELWD");</div><div class="source"> core.defineStateLabel("Objective", 5, "Zeiss 4X Plan Apo");</div><div class="source"></div><div class="source"> // define configurations</div><div class="source"> //</div><div class="source"> core.defineConfiguration("FITC", "Emission", "State", "2");</div><div class="source"> core.defineConfiguration("FITC", "Excitation", "State", "3");</div><div class="source"> core.defineConfiguration("FITC", "Dichroic", "State", "1");</div><div class="source"></div><div class="source"> core.defineConfiguration("DAPI", "Emission", "State", "1");</div><div class="source"> core.defineConfiguration("DAPI", "Excitation", "State", "2");</div><div class="source"> core.defineConfiguration("DAPI", "Dichroic", "State", "0");</div><div class="source"></div><div class="source"> core.defineConfiguration("Rhodamine", "Emission", "State", "3");</div><div class="source"> core.defineConfiguration("Rhodamine", "Excitation", "State", "4");</div><div class="source"> core.defineConfiguration("Rhodamine", "Dichroic", "State", "2");</div><div class="source"></div><div class="source"> // set initial imaging mode</div><div class="source"> //</div><div class="source"> core.setProperty("Camera", "Exposure", "55");</div><div class="source"> core.setProperty("Objective", "Label", "Nikon 10X S Fluor");</div><div class="source"> core.setConfiguration("DAPI");</div>

<br /> Complete example: [http://valelab.ucsf.edu/~MM/files/Tutorial4.java Tutorial4.java]<br />

== Configuration file ==

Instead of executing the initialization script or a program to load devices, create configurations and perform other setup tasks each time the system starts, you can create equivalent configuration file which can be executed with a single command:<br /><br />

<div class="source"> core.loadSystemConfiguration("MMConfig.cfg");</div>

<br /> In this case [http://valelab.ucsf.edu/~MM/files/MMConfig_demo.cfg MMConfig.cfg] is a text file in containing a list of simple commands to build the desired system state: devices, labels, equipment, properties, and configurations. The format of this file and other topics related to configuring the system are covered in [[Micro-Manager Configuration Guide | Configuration Guide]]. <br /><br /> The current system configuration can be saved by the complementary saveConfiguration() command. For example you can build-up the system by using script commands described in this Guide and when you verify that everything is working, you can save the configuration in the file so that it can be recalled in the future with the single command. <br />

{{Programming_Sidebar}}
