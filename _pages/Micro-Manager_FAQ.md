'''Micro-Manager, Frequently Asked Questions'''
=== Does Micro-Manager work with ... camera/microscope/etc? ===
Check the list of [[Device Support|supported hardware]].  If you are unsure, post your question to the [https://lists.sourceforge.net/lists/listinfo/micro-manager-general Mailing List]

=== There is an ImageJ driver for my camera.  Can I use the camera with Micro-Manager? ===
Not necessarily.  Micro-Manager provides an identical interface to all cameras, which means that scripts and applications written using Micro-Manager will work with all supported cameras.  ImageJ camera drivers do not work that way (i.e., they are all different, and Micro-Manager has no way of operating with them), so whether or not there is an ImageJ driver for a device has no bearing on it working with Micro-Manager.  In technical terms, to make a camera work in Micro-Manager, you will need a Micro-Manager device adapter (written in C++), which is very different from an ImageJ camera driver.  Check the list of [[Device Support|supported hardware]] to see if there is a Micro-Manager device adapter for your camera.

=== Why are my images being displayed incorrectly on screen? ===

Sometimes ImageJ and Micro-Manager images show strange blocky artifacts on Windows XP. You may be able to fix this problem by turning off Direct3D for Java. To do so, set the following environment variable in your system:
<pre>
Variable: J2D_D3D
Value: false
</pre>
(To edit environment variables, right click on My Computer, select Properties > Advanced > Environment Variables)

=== I have some hardware that is not supported by Micro-Manager.  How do I make it work? ===
First, contact the manufacturer of the hardware and express your interest in a Micro-Manager adapter.  We simply do not have the resources to work on every piece of hardware out there and we made an open interface so that everyone can write support for any piece of hardware.  We strongly encourage companies producing hardware to take care of Micro-Manager support themselves (and quite a few have already done so).  The company might be persuaded if they hear from enough customers.  Alternatively, you can write the adapter yourself, or find a friend with experience writing code in C++  (there are quite a few examples so it will not be extremely difficult).  There is a [[Micro-Manager Device Developer's Kit for Windows]], and providing support to people writing device adapters is one of our top priorities.  Lastly, post your request to the  [https://lists.sourceforge.net/lists/listinfo/micro-manager-general Micro-Manager mailing list].  We or others might be persuaded to work on this if we hear that people need it.

=== Does Micro-Manager work with my Axiocam camera? ===
'''Update:''' As of Micro-Manager version 1.4.13 or so, the [[AxioCam MR]] is supported.  If you need support for other models, please let us know.

=== When I do something on my system that takes more than a few seconds, I get the error: "Wait for device X timed out after 5000ms". How do I fix this? ===
In the Device/Property browser, set the property: "Core-TimoutMs" to a value higher than 5000ms (just a bit longer than it takes your device to do whatever it is doing).  To make this setting persist through Micro-Manager restarts, add it to the System - Startup group (see [[Micro-Manager_Configuration_Guide#Startup_Presets]])

=== Something does not work.  What do I do? ===
1) Try downloading and installing the latest [[Micro-Manager_Nightly_Builds|Nightly Build]] and check if the problem still persists. 

2) If the issue still remains click 'Help' on the main window -> then click 'Report Problem'. 

* In this panel you will need to fill in your name, organization, email and a description of the problem. 

* You will then notice a dialogue in the bottom which will guide you to sending us the report. 

* This report will also consists of a log file and your configuration settings. 

* All of this information will then be packaged and sent to us via email. We will then be able respond back and assist you with a better understanding of your situation.

=== How do I get Micro-Manager to prompt me to manually put specific filters in place? ===
See [[Using_Multi-Dimensional_Acquisition_with_a_manual_microscope]]

=== Citing Micro-Manager ===
You can cite either:<br>
* Arthur Edelstein, Nenad Amodaj, Karl Hoover, Ron Vale, and Nico Stuurman (2010) Computer Control of Microscopes Using μManager. '''Current Protocols in Molecular Biology''' 14.20.1-14.20.17<br>
* Stuurman, N., Amodaj N., Vale, R.D. (2007). Micro-Manager: Open Source software for light microscope imaging. '''Microscopy Today'''. 15(3):42-43.<br>
and/or the website:<br>
* µManager (http://www.micro-manager.org)

Also, please update  "[[Papers citing Micro-Manager]]" with a reference to your paper. We will need this information to secure future funding.

{{Documentation Sidebar}}
