<table>
<tr>
  <td valign=top>'''Summary:'''</td>
  <td>This adapter supports two [http://www.ScopeLED.com/ ScopeLED illuminators]: ScopeLED-MSB/MSP for the microscope illuminator, and ScopeLED-FMI for the fluorescence illuminator. 
Both devices are implemented as shutters, and both devices communicate via USB. 
 </td>
</tr>
<tr>
  <td valign=top>'''Author:'''</td>
  <td>Ryan Clark <rclark AT diconlighting DOT com></td>
</tr>
<tr>
   <td valign=top>'''License:'''</td>
   <td>LGPL</td>
</tr> 
<tr>
   <td valign=top>'''Platforms:'''</td>
   <td>Windows 2000 and higher.<br>Micro-Manager v1.4.10 and higher.<br>Requires DiCon USB Communication Adapter version 2.0.0.0 or newer (see Dependencies section, below).
   </td>
</tr>
<tr>
   <td valign=top>'''Dependencies:'''</td>
   <td>This device adapter requires a USB Communication Adapter, which is available for free at http://www.scopeled.com/resources/downloads.php.</td>
</tr>
</table>



=== Properties Documentation ===
(This documentation is also [https://valelab.ucsf.edu/svn/micromanager2/trunk/DeviceAdapters/ScopeLED/Properties.doc available here.])

'''All ScopeLED Illuminators'''

<table width=100%>
<tr>
  <td valign=top width=10%>Property</td>
  <td>VendorID</td>
</tr>
<tr>
  <td valign=top>Type</td>
  <td>Numeric value from 0 to 65535. The DiCon USB Vendor ID is 9410 (0x24C2).</td>
</tr>
<tr>
  <td valign=top>Function</td>
  <td>Sets the USB Vendor ID used to identify the target device. This property must be set before the device is instantiated.</td>
</tr>
</table><br>
<table width=100%>
<tr>
  <td valign=top width=10%>Property</td>
  <td>ProductID</td>
</tr>
<tr>
  <td valign=top>Type</td>
  <td>Numeric value from 0 to 65535.</td>
</tr>
<tr>
  <td valign=top>Function</td>
  <td>Sets the USB Product ID used to identify the target device. This property must be set before the device is instantiated.</td>
</tr>
</table><br>
<table width=100%>
<tr>
  <td valign=top width=10%>Property</td>
  <td>InitSerialNumber</td>
</tr>
<tr>
  <td valign=top>Type</td>
  <td>String value</td>
</tr>
<tr>
  <td valign=top>Function</td>
  <td><p>Prior to initialization, this property indicates the Serial Number string to be used to identify the target device. It is optional to set this property.</p><p>Use this value to identify a specific device in a system where more than one device is present. </p><p>If this value is not set prior to initialization, Micro-Manager will open the first available device with the matching VendorID and ProductID. </p>
</td>
</tr>
</table><br>
<table width=100%>
<tr>
  <td valign=top width=10%>Property</td>
  <td>SerialNumber</td>
</tr>
<tr>
  <td valign=top>Type</td>
  <td>String value</td>
</tr>
<tr>
  <td valign=top>Function</td>
  <td><p>During initialization, this property is set to the Serial Number string of the device.</p><p>Micro-Manager makes no use of this property. It is for information purposes only. Changing the value will not make any changes to the device. </p> 
</td>
</tr>
</table><br>
<table width=100%>
<tr>
  <td valign=top width=10%>Property</td>
  <td>Version</td>
</tr>
<tr>
  <td valign=top width=10%>Type</td>
  <td>Numeric</td>
</tr>
<tr>
  <td valign=top width=10%>Function</td>
  <td>Read-only value indicating the firmware version of the device.
The version is a four-byte value. Each byte represents one portion of the version number. The most significant byte contains the most significant version number. For example, a Version value of 0x02030100 (note the hexadecimal notation) indicates a version of 2.3.1.0. 
</td>
</tr>
</table><br>
<table width=100%>
<tr>
  <td valign=top width=10%>Property</td>
  <td>LastError</td>
</tr>
<tr>
  <td valign=top>Type</td>
  <td>Numeric</td>
</tr>
<tr>
  <td valign=top>Function</td>
  <td>Read-only value indicating the last USB communication error. See Appendix A for a description of the error codes.</td>
</tr>
</table><br>
<table width=100%>
<tr>
  <td valign=top width=10%>Property</td>
  <td>LastDeviceResult</td>
</tr>
<tr>
  <td valign=top>Type</td>
  <td>Numeric</td>
</tr>
<tr>
  <td valign=top>Function</td>
  <td>Read-only value indicating the last device error. See your device documentation for a description of the error codes.</td>
</tr>
</table><br>

'''ScopeLED-G'''
<br>ScopeLED Fiber Guide Illuminators
{{Note|The ProductID for G-Series illuminators is 4867 (0x1303).}}
<table>
<tr>
  <td valign=top width=10%>Property</td>
  <td>Channel1Brightness, Channel2Brightness, Channel3Brightness, Channel4Brightness</td>
</tr>
<tr>
  <td valign=top>Type</td>
  <td>Floating-point value from 0 to 100, representing the percentage.</td>
</tr>
<tr>
  <td valign=top>Function</td>
  <td>Gets or sets the brightness level of the indicated channel. This property changes the cached value. The new value will not take effect until the shutter is next opened.</td>
</tr>
</table><br>

'''ScopeLED-B'''
<br>ScopeLED Brightfield Microscope Illuminators
{{Note|The ProductID for B-Series illuminators is 4874 (0x130A).}}
<table width=100%>
<tr>
  <td valign=top width=10%>Property</td>
  <td>ActivePresetMode</td>
</tr>
<tr>
  <td valign=top>Type</td>
  <td>Integer value from 0 to 6, representing the active Preset Mode. </td>
</tr>
<tr>
  <td valign=top>Function</td>
  <td>Gets or sets the active Preset Mode.The brightness of the illuminator will be controlled according to the setting of the corresponding preset mode. Preset Mode 0 activates brightness control for the individual channels via the properties Channel1Brightness, Channel2Brightness, Channel3Brightness, and Channel4Brightness.</td>
</tr>
</table><br>
<table width=100%>
<tr>
  <td valign=top width=10%>Property</td>
  <td>Channel1Brightness, Channel2Brightness, Channel3Brightness, Channel4Brightness</td>
</tr>
<tr>
  <td valign=top>Type</td>
  <td>Floating-point value from 0 to 100, representing the percentage.</td>
</tr>
<tr>
  <td valign=top>Function</td>
  <td>Gets or sets the brightness level of the indicated channel. The intensities set by these properties are only active when ActivePresetMode is set to 0. </td>
</tr>
</table><br>
<table width=100%>
<tr>
  <td valign=top width=10%>Property</td>
  <td>PresetMode1Brightness, PresetMode2Brightness, PresetMode3Brightness, PresetMode4Brightness, PresetMode5Brightness, PresetMode6Brightness</td>
</tr>
<tr>
  <td valign=top>Type</td>
  <td>Floating-point value from 0 to 100, representing the percentage.</td>
</tr>
<tr>
  <td valign=top>Function</td>
  <td>Gets or sets the brightness level of the indicated Preset Mode. The intensities set by these properties are only active when ActivePresetMode is set to the corresponding Preset Mode. For example, in order to make active PresetMode4Brightness, ActivePresetMode must be 4. </td>
</tr>
</table><br>

'''ScopeLED-F'''
<br>ScopeLED Fluorescence Microscope Illuminators
{{Note|The ProductID for F-Series illuminators is 4869 (0x1305).}}
<table width=100%>
<tr>
  <td valign=top width=10%>Property</td>
  <td>LEDGroup</td>
</tr>
<tr>
  <td valign=top>Type</td>
  <td>Integer from 1 to 9.</td>
</tr>
<tr>
  <td valign=top>Function</td>
  <td>Gets or sets the active LED group. </td>
</tr>
</table><br>
<table width=100%>
<tr>
  <td valign=top width=10%>Property</td>
  <td>Channel1Brightness, Channel2Brightness, Channel3Brightness, Channel4Brightness</td>
</tr>
<tr>
  <td valign=top>Type</td>
  <td>Floating-point value from 0 to 100, representing the percentage.</td>
</tr>
<tr>
  <td valign=top>Function</td>
  <td>Gets or sets the brightness level of the indicated channel. This property sends a command to the device, so if the shutter is open, the brightness is affected immediately.</td>
</tr>
</table><br>
<table width=100%>
<tr>
  <td valign=top width=10%>Property</td>
  <td>Channel1Wavelength, Channel2Wavelength, Channel3Wavelength, Channel4Wavelength</td>
</tr>
<tr>
  <td valign=top>Type</td>
  <td>Integer value indicating the wavelength in nanometers</td>
</tr>
<tr>
  <td valign=top>Function</td>
  <td>Gets the wavelength of the indicated channel in nanometers.</td>
</tr>
</table><br>
<table width=100%>
<tr>
  <td valign=top width=10%>Property</td>
  <td>LEDGroup1Channels, LEDGroup2Channels, LEDGroup3Channels, LEDGroup4Channels, LEDGroup5Channels, LEDGroup6Channels, LEDGroup7Channels, LEDGroup8Channels, LEDGroup9Channels</td>
</tr>
<tr>
  <td valign=top>Type</td>
  <td>Integer value representing a bit-map of the active channels</td>
</tr>
<tr>
  <td valign=top>Function</td>
  <td>Read-only bit-map that indicates which channels are available for the indicated LED group.</td>
</tr>
</table><br>

<table width=100%>
 <tr>
  <td valign=top width=10%>Property</td>
  <td>ActiveChannels</td>
 </tr>
 <tr>
  <td valign=top>Type</td>
  <td>String</td>
 </tr>
 <tr>
  <td valign=top>Function</td>
  <td>Gets a comma-separated list of active channels for the current active LED group. The channel is in the format “ChX” where X is the channel number.</td>
 </tr>
</table><br>

<table width=100%>
 <tr>
  <td valign=top width=10%>Property</td>
  <td>ActiveWavelengths</td>
 </tr>
 <tr>
  <td valign=top>Type</td>
  <td>String</td>
 </tr>
 <tr>
  <td valign=top>Function</td>
  <td>Gets a comma separated list of active wavelengths for the current active LED group.</td>
 </tr>
</table><br>

<table width=100%>
 <tr>
  <td width=10%>Property</td>
  <td>OptimalStagePosition</td>
 </tr>
 <tr>
  <td>Type</td>
  <td>String</td>
 </tr>
 <tr>
  <td>Function</td>
  <td>Gets the X and Y stage coordinates that are optimal for the current active LED group.</td>
 </tr>
</table><br>


'''Appendix A: USB Error Codes'''

The following table lists the error values returned by the LastError property. 

<table>
<tr>
   <td>Error Value</td>
   <td>Description</td>
</tr>
<tr>
   <td valign=top>0</td>
   <td>No error.</td>
</tr>
<tr>
   <td valign=top>1</td>
   <td>A parameter is invalid.</td>
</tr>
<tr>
   <td valign=top>2</td>
   <td valign=top>Device not found.
<p><i>
Make sure that the device is properly connected to your computer and powered on.
</i></p>
<p><i>Make sure that the VendorID, ProductID and SerialNumber (optional) properties match your device. 
</i></p></td>
</tr>
<tr>
   <td valign=top>3</td>
   <td>Failed memory allocation. </td>
</tr>
<tr>
   <td valign=top>4</td>
   <td>Failed HID enumeration.</td>
</tr>
<tr>
   <td valign=top>5</td>
   <td>Failed to initialize the device.</td>
</tr>
<tr>
   <td valign=top>6</td>
   <td>Operation aborted. The communication operation was aborted by the user. </td>
</tr>
<tr>
   <td valign=top>7</td>
   <td>Device is not connected.</td>
</tr>
<tr>
   <td valign=top>8</td>
   <td>Invalid device state.</td>
</tr>
<tr>
   <td valign=top>9</td>
   <td>The buffer is too small.</td>
</tr>
<tr>
   <td valign=top>10</td>
   <td>An HID API function failed.</td>
</tr>
<tr>
   <td valign=top>11</td>
   <td>Queue error.</td>
</tr>
<tr>
   <td valign=top></td>
   <td></td>
</tr>
</table>
