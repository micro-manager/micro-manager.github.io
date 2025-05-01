---
title: Hub Device Adapters
layout: page
section: Programming:Device Adapters
---



### Multiple devices sharing the same controller

More complicated example would be a controller box with two filter
changers, say A and B. The controller is attached to a single COM port
and each command in the command set has a variable that can be either
“A” or “B” depending on which filter changer we want to move. The most
straightforward way would be to implement “MyController” class with
“Port” property and have that adapter communicate with the hardware box.
MyController is obviously not a filter changer but rather a generic
device used to communicate with a host computer. For

Now we can add two filter changer devices with distinct device names
“MyFilterA” and “MyFilterB”. The library will now contain three Device
Adapters: MyController, MyFilterA and MyFilterB. Since the last two are
virtually identical except for using a different variable (“A” or “B”)
when talking to the controller, internally we can use the same class to
implement both of them. Deciding whether instance of that class will act
as device A or device B can be easily accomplished by passing an
appropriate parameter in the constructor.

Micro-manager supports the concept of the "parent" device (Hub) which
exactly fits the description of the MyController. Designing and
implementing multi-device libraries with Hub controller is described at
lenngth in section [Complex device management: writing Hub
adapters](#complex-device-management-writing-hub-adapters).



## Complex device management: writing Hub adapters

{% include notice icon="info" content="This is an advanced topic and is generally not relevant for implementation of single device libraries." %}

### Introduction

Concept of a Hub or “parent” device was introduced to micro-manager to
represent complex motorized microscopes. Typically a motorized
microscope contains multiple devices: stages, filter changers, shutters,
etc. All of these devices are controlled through a microscope stand
which serves as a master (parent) device. Such device is designated in
micro-manager as “Hub”. A Hub on the typically does not perform any
concrete task other than managing connection with the host and
dispatching commands to its “child” devices. However, in certain cases
hub devices can be very complex. They can monitor notifications that
come from the microscope stand and synchronize status of its child
devices. They also perform automatic detection of which hardware
components are installed and build configurations accordingly.

Hub concept is by no means restricted to motorized microscopes. Any
hardware component that has a single controller connected to multiple
devices fits the description of a Hub. For example a simple filter wheel
controller is a Hub because it is connected to multiple filter wheels.
Filter wheel devices depend on the hub to be able to communicate with
the host. At the very least, in its minimal functionality, a Hub
represents and encapsulates a communication port (USB or RS232) that is
shared between multiple devices.

### Implementation guidelines

A well-behaved hub device should perform the following functions:

-   Auto-detection of all installed “child” devices by implementing
    MM::Hub::DetectInstalledDevices(), MM::Hub::GetInstalledDevice() and
    MM::Hub::GetNumberOfInstalledDevices()
-   If the device uses a serial port, communication with the host
    computer by managing the port and providing the “Port” property

Since the Hub now represents the master controller, devices should not
access any hardware resources (such as ports) directly, but rather via
the associated Hub (parent). In the same vein, using global references
to any other shared resources should be avoided and hopefully completely
eliminated. All shared resources should be managed and encapsulated by
the Hub device and the access to these should be granted only by calling
appropriate Hub methods.

If we build device adapter libraries following the above guidelines, our
devices will automatically support configurations with multiple hubs and
provide more robust operation within micro-manager environment.

### Obtaining the parent Hub instance

Since now all access to shared resources is handled by the Hub, we have
to describe how is any specific device (e.g. a filter wheel or a stage)
supposed to find its parent Hub, i.e. the controller that it is
connected to. For example, in order to send a command through serial
port (or some other way) a device must first obtain an instance of its
parent Hub and then call appropriate method.

Micro-manager provides appropriate mechanisms that automatically
establish and identify parent-child relationships between devices.
Getting a parent Hub instance is very simple:

```
  MM::Hub* hub = GetParentHub();
  if (!hub)
     return ERR_NO_HUB;
```

GetParentHub() method is implemented in the base class to all devices
MM::DeviceBase. If this call fails (null pointer returned) it means that
the parent hub device is not configured. This error means that the
Micro-manager configuration file lacks information needed to establish
parent device relationship.

When successful this call returns only a Hub base class instance and its
API can’t do any useful work. So, we have to dynamically cast to the hub
that belongs to our library and the API that has methods that we need.

```
  MyHub* myHub = dynamic_cast<MyHub*>(hub);
  if (!myHub)
     return ERR_NO_HUB;
```

Micro-manager configuration process ensures that cast always succeeds,
i.e. we can only get the Hub instance of the class belonging to our
library (MyHub). Failure of dynamic cast points to some unusual and
catastrophic bug in the build procedure or misunderstanding in the
library design.

Once we obtain a handle to our specific Hub object we can call custom
methods to send or receive commands. For example:

```
  int ret = myHub->SendCommandToHardware(this, myCmd);
  if (ret != DEVICE_OK)
     return ret;
```

Actual methods in the Hub interface exposed to its “child” devices are
completely at the discretion of the library designer. Typically they are
related to exchange of commands between the hardware controller and the
device.

### Practical considerations

It is important to keep in mind that a device obtains a pointer to its
parent Hub dynamically, by request to the Micro-manager system
(GetParentHub() method). However, the parent Hub instance becomes
available only during and after initialization. So, we should never
attempt to obtain Hub pointer in the constructor (before Intialize() has
been called).

The first time we can access parent Hub services is in the Initialize()
method. The obvious question is if it makes more sense to cache the
pointer to the Hub obtained in the Initialize() for later use, or to
call GetParentHub() each time we need to send commands to the hardware.
Either way is fine, with later being more robust and transparent, but
somewhat less efficient. The overhead of calling GetParentHub() is low,
so for most cases it does not make that much difference in terms of
speed.

Parent-child relationship between Hub and its devices persists in the
configuration file through directive “Parent”. For example:

```
 Parent,MyDevice,MyHub
```

establishes that MyDevice belongs to MyHub, i.e. that MyHub is parent to
MyDevice. The only requirement is that MyHub is listed in the
configuration file before MyDevice, which will ensure that parent device
is initialized before its dependent child devices. Appropriate “Parent”
directives and order of initialization is automatically ensured if we
use Hardware Configuration Wizard to create configuration files.

### Example Hub library: Arduino

Arduino library is a good example of the Hub implementation and the
relationship with its child devices. It would be a good idea to have a
look at the source code before attempting to write a new Hub class from
scratch: [Arduino device adapter
library](https://github.com/micro-manager/mmCoreAndDevices/tree/main/DeviceAdapters/Arduino/).

Especially important are implementations of the following methods from
the MM::Hub device API:

```
 MM::DeviceDetectionStatus DetectDevice(void);
 int DetectInstalledDevices();
```

These two methods are critical for the configuration process. Hardware
Configuration Wizard uses the first one automatically detect the port to
which the Hub is connected and the second one to list all installed
hardware devices.
