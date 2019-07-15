== Custom Arduino Devices ==

<table cellspacing=3><tr><td>
'''Summary:'''</td><td valign="top">Creating custom devices using Arduinos that implement existing communication protocols</td></tr>
<tr><td>'''Author:'''</td><td>Jerome Mutterer</td></tr>
<tr><td>'''Platforms:'''</td><td>Windows, Mac, Linux (serial port)</td></tr>
<tr><td>'''Devices:'''</td><td>Many</td></tr>
<tr><td>'''Available since version:'''</td><td>1.4.22</td></tr>
<tr><td>'''Example Config File:'''</td><td>[https://github.com/mutterer/MM_CustomArduino MM_CustomArduino]</td></tr>
</table>


----

'''Introduction'''

MicroManager supports a wide range of existing devices by providing refined device adapters. Those adapters implement the communication protocol needed for MicroManager to issue commands and read responses from devices. To create a custom made device that meets custom specifications, an Arduino board can be programmed to implement the same protocol, while being able to physically interface with sensors and actuators, like position sensors, switches, motors or LEDs. 

For example, creating a custom stage device that will work with MicroManager out of the box, one could wire two steppers motors to the Arduino board, and have the Arduino firmware ‘talk’ the Marzhauser L-Step protocol. 
Here are included two example Arduino firmware : 
* MM_vLStep_Z.ino : 
Emulates a Z-Axis L-Step stage by implementing a subset of the Marzhauser L-Step protocol. Expects an Arduino Uno with a LCD Keypad Shield for feedback and a servo motor attached to pin 3.
* MM_vCoolLed.ino : 
Emulates a CoolLED illumination device by implementing a subset of the PrecisExcite protocol. Expects an Arduino Uno with a LCD Keypad Shield for feedback and a NeoPixel LED device to pin 3.
Basically, you have to make the Arduino understand the commands that MicroManager sends, and when needed, reply with the expected answers. 
* MM_vVincentD1 shutter-like device
Emulates a Vincent D1 shutter device by implementing a subset of the protocol: Open, Close and Reset shutter. Only 1 channel. A NeoPixel LED device must be attached to pin 3.

Basically, you have to make the Arduino understand the commands that MicroManager sends, and when needed, reply with the expected answers. 

'''Installation'''
* vLStep Z-Axis
  - Upload the MM_vLStep_Z.ino Arduino firmware to the Uno using the Arduino software.
  - In the « Hardware Configuration Wizard… » add the Z-Axis device from MarzhauserLStep group.
   - Choose the serial port matching the Arduino, with default settings, except for the AnswerTimeout property that you should set to 2000.0000 
  - Resume the configuration wizard.
  - Test your device by opening the stage control widget from Plugins>Device Control>Stage Control.

* vCoolLed Illuminator
  - Upload the MM_vCoolLed.ino Arduino firmware to the Uno using the Arduino software.
  - In the « Hardware Configuration Wizard… » add the PrecisExcite device.
  - Choose the serial port matching the Arduino, with default settings, except for the AnswerTimeout property that you should set to 2000.0000 
  - Resume the configuration wizard.
  - Test your device using Tools>Device Property Browser . 

* MM_vVincentD1 shutter-like device
  - Upload the MM_vVincentD1_shutter.ino Arduino firmware to the Uno using the Arduino software.
  - In the « Hardware Configuration Wizard… » add the Vincent D1 shutter device.
  - Choose the serial port matching the Arduino, with default settings
  - Resume the configuration wizard.
  - Test your device using Tools>Device Property Browser . 


{{Note|For a given device or devices class, the adapter communication details can be found in the protocol documentation if it's publicly available, or if not available, details can be extracted from the [https://github.com/micro-manager/micro-manager/tree/master/DeviceAdapters device adapter source code]. This last solution is sometimes to be preferred, as it happens that the current MicroManager device adapter only partially implements the device’s protocol : some protocol features are ignored.}}
