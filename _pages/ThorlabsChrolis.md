---
title: Thorlabs CHROLIS Light Engine
layout: page
---

| Summary | [Thorlabs](https://www.thorlabs.com/) [CHROLIS](https://www.thorlabs.com/newgrouppage9.cfm?objectgroup_id=13597&pn=CHROLIS) |
| Author  | Thorlabs |
| License | BSD |
| Platforms | Windows |
| Devices | CHROLIS (USB) |

---

## Installation

1. Install the [CHROLIS software package](https://www.thorlabs.com/software_pages/ViewSoftwarePage.cfm?Code=CHROLIS) from the Thorlabs   website. This includes executable files for installing the CHROLIS Control UI Application, drivers, and supporting libraries for operation. All of these should be installed before testing the CHROLIS Device Adapter.

2. Copy the CHROLIS DLL (`C:\Program Files\IVI Foundation\VISA\Win64\Bin\TL6WL_64.dll`) to the Micro-Manager install folder.

It is recommended to test the CHROLIS with the Thorlabs application before controlling in Micro-Manager

## Configuration

1. In the Hardware Configuration Wizard, add **ThorlabsCHROLIS > Thorlabs CHROLIS Hub**.

2. Set the serial number property on the **Initialization Properties** window for the Hub. The drop-down list is auto-populated with all detected CHROLIS devices available on the PC.Selecting the DEFAULT option will instruct the software to connect to the first available device. If you do not see your device serial number in the list, please refer to the Troubleshooting section of this guide.

3. When the list of peripherals is shown, check the box for each available device. 


## Operation

Output of the CHROLIS is enabled with the Shutter button on the front panel. This is a general-purpose on/off and can be used to disable all LED's simultaneously without losing the states of each LED. Re-enabling the output will restore the previous LED enable and brightness values for the device.

LED Enable and Brightness states are set through the Device Property browser. 

## Device Property Browser
### Read-Only Properties
- Available Wavelengths: A list of the center wavelengths of the installed LED's in the device. 
- Serial Number: The Serial Number of the connected device
- Device Status: The status of the connected device. This displays "No Error" if device is functioning correctly. This will also display any hardware warnings in the event of any malfunction or safety issue. 
- Manufacturer Name: The manufacturer of the connected device. 

### Editable Properties
- LED Power (1 for each LED): The brightness of the LED. This is a relative value from 0 to 1000. 
- LED Enable State (1 for each LED): The on/off state of the LED. This is an integer value equal to 0 or 1. 
- Led Control State: The combined LED state of the system. This is an integer value formed from the binary mask of each LED. For example, if the LED states are 
 
  __1: On - 2: Off - 3: Off - 4: On - 5: Off - 6: On__

  Then the resulting integer state value will be __101001 = 41__. This value will also update as the individual LED Enable States are changed. 


## Troubleshooting 
### Insufficient location information of the device...
This error is returned when the requested resource cannot be found on the system. When this happens it is recommended to close down all other applications that are accessing the device. If problems persist, re-check the device connections and power cycle the device.

### Possible Status Messages and Recommended Action
- Box is Open: Fully close the side panel of the device. This status will prevent the LED's from being enabled
- LLG not Connected: Reconnect the liquid light guide to the device. This status will prevent the LED's from being enabled
- Interlock is Open: Insert the interlock pin into the back of the device or close the interlock safety circuit. This status will prevent the LED's from being enabled
- Using Default Adjustment: No action needed.
- Box Overheated: Please power down the device and wait for it to cooldown. If the problem persists, please contact your local Thorlabs Support team.
- LED Overheated: Please power down the device and wait for it to cool down. If the problem persists, please contact your local Thorlabs Support team.
- Invalid Box Setup: Please contact your local Thorlabs Support team.

If any of these statuses are received and they do not represent the actual state of the device, please contact your local [Thorlabs Support Team](https://www.thorlabs.com/locations.cfm).

## External Resources
[Link to the CHROLIS Manual](https://www.thorlabs.com/_sd.cfm?fileName=MTN019858-D02.pdf&partNumber=CHROLIS)

[Link to this Device Adapter on Github](https://github.com/micro-manager/mmCoreAndDevices/tree/main/DeviceAdapters/ThorlabsCHROLIS)

[Link to the Thorlabs Github](https://github.com/Thorlabs)
