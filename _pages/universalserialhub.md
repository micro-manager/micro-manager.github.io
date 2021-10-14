---
title: Universal Serial Hub
description: Micro-Manager adapter for Universal Serial Hub
layout: page
---

## Universal serial Hub

<table>
<tr>
<td markdown="1">

**Summary:**

</td>
<td markdown="1">

This is a universal adapter for a user-defined hardware controller.

</td>
</tr>
<tr>
<td markdown="1">

**Author:**

</td>
<td markdown="1">

Artem Melnykov (melnykov.artem at gmail.com)

</td>
</tr>
<tr>
<td markdown="1">

**License:**

</td>
<td markdown="1">

BSD

</td>
</tr>
<tr>
<td markdown="1">

**Platforms:**

</td>
<td markdown="1">

All platforms (uses serial port)

</td>
</tr>
<tr>
<td markdown="1">

**Devices:**

</td>
<td markdown="1">

Shutter, State, Stage, XYStage, Generic

</td>
</tr>
<tr>
<td markdown="1">

**Example Config File:**

</td>
<td markdown="1">

None

</td>
</tr>
</table>

The goal of this project is to provide a universal adapter for a custom hardware controller. The hardware controller itself has to be implemented by the user and is expected to:
* be able to communicate with the computer via a serial port;
* use the text string interface (specified below) for describing implemented devices.

An example controller based on Arduino is available [here](https://github.com/artmeln/ush_controller_examples).

## Known limitations
* sequencing is not implemented;
* pre-initialization properties are not supported;
* the only devices that are implemented are Shutter, State, Stage, XYStage, and Generic.

## Providing device descriptions
Each device implemented in the controller should be described by a sequence of strings. When the controller receives keyword “Start”, it is expected to return the first string of the first device description. After that, every keyword “Next” received by the controller should be replied to with the next line in the device descriptions. When the end of all device descriptions has been reached, the controller should return the keyword “End”.

**Here is an example description of two shutter device:**

Name|Shutter-A

Description|An example shutter

Timeout|1000

Command|SetOpen|SO

Command|GetOpen|cashed

Command|Fire|not supported

PropertyStringAction|Pin|5|false|PIN|false|1:2:3:4:5:6:7:8

PropertyFloatAction|Power|0.0|false|PW|false|0.0:2.5

Name|Shutter-B

Description|An example shutter

Timeout|1000

Command|SetOpen|SO

Command|GetOpen|cashed

Command|Fire|not supported

PropertyStringAction|Pin|5|false|PIN|false|9:10:11:12:13:14:15:16

PropertyFloatAction|Power|0.0|false|PW|false|1.0:5.3

**The initial exchange between the adapter and the controller will look like this:**

OUT:	Start;

IN:	Name|Shutter-A

OUT:	Next

IN:	Description|An example shutter

OUT:	Next

IN:	Command|SetOpen|SO

*etc*

OUT:	Next

IN:	PropertyFloatAction|Power|0.0|false|PW|false|0.0:2.5

OUT:	Next

IN:	Name|Shutter-B

*etc*

OUT:	Next

IN:	PropertyFloatAction|Power|0.0|false|PW|false|1.0:5.3

OUT:	Next

IN:	End

A device description must start with the *Name* string. In addition, the name of the device must begin with the device type recognized by MM (for example, “Shutter-1” or “Stage focus” are legitimate names while “Example-Shutter” is not). The next line is optional and provides device description. It is followed by definitions of commands required by the adapter for this device (SetOpen, GetOpen, and Fire in the case of a Shutter device). The last field in each definition is the short-hand command notation that will be recognized by the controller (two expressions, ‘not supported’ and ‘cashed’, have special meaning and are explained below).
Command definitions are followed by property definitions. Any number of properties can be defined in the following format:

PropertyType | Name | defaultValue | isReadOnly | Shorthand | isPreinitialization | ListOrRange

## Principles of communication

Every property change or method call (such as ‘set shutter open’) in the adapter results in a serial command sent to the controller. The controller is expected to perform the requested action and report back; the device status will remain busy until this response is received. The outgoing command has the format
DeviceName>Command>Value1{:Value2:Value3:...};
For example, to set open the shutter defined in the previous section the adapter will send the following command:

Shutter-A>SO>1;

(set shutter Shutter-A open)

Responses from the controller have a similar format but are separated by a different character and contain not only the actual values at the end of the action but also information about device status:
DeviceName<Command<StatusCode{:Value1:Value2:Value3:...};
Possible StatusCode values include 0 (device is ready for a command), 1 (device is busy), >1 device experienced an error. Error codes are described in more detail later.

Shutter-A<SO<0:1;

(Shutter-A responded to SetOpen command, device is not busy, shutter is open)

Shutter-B<SO<1:0;

(Shutter-B responded to SetOpen command, device is busy, shutter is closed)

Shutter-B<GO<0:1;

(Shutter-B responded to GetOpen command, device is not busy, shutter is open)

Shutter-B<SO<503;

(Shutter-B responded to SetOpen command with error code 503)

In addition, the controller can send a command to the adapter at any time. This may be necessary to set the timeout value for a device (Shutter-A<Timeout<10000; timeout values have units of ms) or to inform the adapter that the status of the device has changed (Shutter-A<SetOpen<0:0;).

Two shorthand commands(“not implemented” and “cashed”) have special meaning. In both cases the adapter will not send a command to the controller.
If the command is not implemented, the adapter will return an error to the GUI level.
The “cashed” definition should be used for commands that inquire about the status of the device (such as GetOpen) in cases when this functionality is not supported by the controller.
For example, if the controller has no knowledge of the status of the shutter, the cashed version of the shutter state should be used.

## Busy status and timeout values
As soon as a serial command is sent to the controller, the device status will be set to ‘busy’.
The device will remain busy until one of the two happens i) a response from the controller for this device is received; ii) the time allotted in the adapter for command execution has elapsed.
This time value is set for each device by the controller using DeviceName<Timeout<Value; command where Value is time in ms.

## Reserved values and error codes
Several reserved values, such as separators within the command and serial end of line separator, are defined in a header file used by the adapter (ushreserved.h). 
Whenever possible, the controller should also use this fie for better compatibility. 
Standard error codes are also defined in this file. By convention, errors generated by the adapter are assigned a code starting with 401 while errors generated by the controller start at 501.
