== JAI Cameras (USB interface) with eBUS drivers ==

<table>
<tr><td>
'''Summary:'''</td><td>JAI Cameras with eBUS drivers</td></tr>
<tr><td>
'''Author:'''</td><td>[http://nenad.amodaj.com Nenad Amodaj]</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows 7, 8 and 10, both 32 and 64</td></tr>
<tr><td>'''Devices:'''</td><td>all JAI [https://www.jai.com/products/product-lines/apex-series-3-sensor-area-scan APEX] series cameras, with USB interface and eBUS drivers</td></tr>
<tr><td> '''Support:''' </td><td> [[#Contact]] </td></tr>
</table>

== Installation Instructions ==

Instructions apply only to JAI cameras based on the Pleora eBUS interface, such as Apex Series. At this time only Apex Series color cameras with USB interface are supported.

Windows 7 and higher is supported, both 32 and 64-bit/ driver was tested on AP-3200T-USB camera model on Windows 10 with 64-bit version of Micro-manager.

Download and install JAI SDK from [https://www.jai.com/support-software/downloads JAI support page]. Select APEX series eBUS-SDK for JAI, either 64-bit or 32-bit, depending on which version of Micro-manager you intend to use the camera with (64-bit or 32-bit). Installing eBUS-SDK is the only requirement for using Apex Series cameras with Micro-manager. 

Open eBus Player application and verify the camera is working as expected before configuring it with Micro-manager. JAI cameras are supported in Micro-manager Nightly Builds starting on November 1, 2018.

=== Hardware Configuration Wizard Notes ===

Start Micro-manager and select Tool | Hardware Configuration Wizard command. Create new configuration and scroll down the “Available Devices” tree to “JAI” entry. Expand the node and select JAI Camera. Press “Add” button. Camera dialog will pop up

Currently multiple camera configurations are not supported, so leave CameraID as “0”. This number will be ignored.

== Troubleshooting ==

=== Baseline testing procedure ===

Before configuring camera with Micro-manager verify that everything works properly with eBUS Player. Whenever in doubt use eBUS Player first as a baseline test for the camera. However, have in mind that camera can’t work with Micro-manager and eBUS Player at the same time. Always make sure to shut down the other application.

=== JAI Camera does not appear in the “Available” list ===
If the camera does not appear in Hardware Configuration Wizard “Available Devices” list, it means that eBUS SDK is not installed on the computer, or that the wrong version of the SDK is installed. Check the version of the JAI SDK on the JAI website and test with eBUS Player.

If it does not appear in “Available”, JAI driver should be listed at the bottom of the “Devices” tree-view under “Not available”. As stated above this indicates that something is wrong with the camera SDK. But, if JAI does not appear in either of the two lists, it means that the Micro-manager version on your computer does not support this camera and that it must be updated from the Nightly Builds web page.

=== Camera fails during configuration ===

If you see an error message when you try to “Add” camera to the configuration list in Hardware Configuration Wizard, that means one of the following:
a)	camera is not connected
b)	power supply is not attached to the camera
c)	camera model is not supported
d)	some other application is using the camera and it must be closed

== Camera Settings ==
This section provides some information on camera settings that require special consideration in Micro-manager environment.

=== White Balance ===
JAI cameras have built-in white balance correction which can be determined on a specific image or applied continuously. By default, camera WhiteBalance property is set to OFF. If we choose any other option for camera White Balance, it is important to disable “Autostretch” option in the main panel. Autostretch function in Micro-manager automatically adjusts black level and contrast for each channel, therefore acting as a simple white-balance and contrast stretch function. However, Micro-manager Autostretch feature will defeat camera white balance if it is turned on.

Autostretch does not modify the image pixels, it just affects the display. If we save the image it will be recorded as received from the camera.

=== Gamma ===

JAI cameras provide a “Gamma” property to adjust the image gamma function. When using this property, keep in mind that Micro-manager also applies gamma correction on the displayed image and the final result will be displayed with a compound gamma setting. By default in Micro-manager gamma is set to 1.0 and will therefore not affect the image coming from the camera.

If you are planning to use/adjust Micro-manager gamma it is recommended to set the camera “Gamma” property to 1.0.

It is important to note that Micro-manager gamma setting is only for display purposes. Actual image pixels will not be affected, i.e., saved images will always have gamma as provided by the camera.

=== Test Pattern ===

Several test pattern functions (including moving color bars and gradients) are provided for testing the camera. Changing test patterns during Live image acquisition is not supported. If we attempt to set or change the Test Pattern property during Live acquisition an error message will be displayed. The camera must be stopped before setting or changing the TestPattern property.

== Contact ==

=== The Americas (USA, Canada, Mexico, South America) ===

E-mail: support@jai.com
Phone: (Toll-free): +1 800 445 5444

=== Europe, Middle East and Africa (EMEA) ===
E-mail: support@jai.com
Phone: +45 4457 8950  

=== Japan ===
E-mail: support@jai.com
Phone: +81 45 440 0154

=== Other Asia and Pacific Rim (APAC) ===
E-mail: support@jai.com
Phone: +81 45 440 0154

When you have sent an e-mail to our support system, you will automatically receive a support reference number in your e-mail in-box.
