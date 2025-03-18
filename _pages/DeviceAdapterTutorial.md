---
title: Creating a Micro-Manager Device Adapter
layout: page
section: Extend:Device Adapters
---

## Introduction


Micro-Manager device adapters allow you to add support for new hardware by writing C++ code that translates between the manufacturer's API and Micro-Manager's interface. This tutorial will walk through creating a device adapter from scratch.


# Setup

#### Source code and dependencies

1. Download the necessary [source code and dependencies](/DevEnvironmentSetup) 

2. Download and install Micro-Manager, either by downloading a [nightly build](/Micro-Manager_Nightly_Builds)

#### C++ development environment

Download Microsoft Visual Studio as described [here](/Building_MM_on_Windows)


# A minimal device adapter

- Follow steps 1-10 [here](/Visual_Studio_project_settings_for_device_adapters) to create a new device adapter. 
- After step 10, right click project, click add--new item-- cpp file. Name it `MyNewDevice.cpp`
Same thing with a .h header file, name it `MyNewDevice.h`. Paste in the following contents.


```cpp
// MyNewDevice.h: A header file for a minimal device adapter

#pragma once

#include "DeviceBase.h"

const char* g_MyNewDeviceName = "NewDevice";

class MyNewDevice : public CGenericBase<MyNewDevice>
{
public:
    MyNewDevice();
    ~MyNewDevice();

    // MMDevice API
    int Initialize();
    int Shutdown();
    void GetName(char* name) const;
    bool Busy();

};
```


```cpp
// MyNewDevice.cpp: A minimal device adapter

#include "MyNewDevice.h"

#include "ModuleInterface.h"

#include <cstring>

MODULE_API void InitializeModuleData()
{
    RegisterDevice(g_MyNewDeviceName, MM::GenericDevice, "Description for My New Device");
}

MODULE_API MM::Device* CreateDevice(const char* deviceName)
{
    if (deviceName == 0)
        return 0;

    if (std::strcmp(deviceName, g_MyNewDeviceName) == 0)
    {
        return new MyNewDevice();
    }
    return 0;
}

MODULE_API void DeleteDevice(MM::Device* pDevice)
{
    delete pDevice;
}

// Implementation of MyNewDevice methods
MyNewDevice::MyNewDevice()
{

}

MyNewDevice::~MyNewDevice()
{
    Shutdown();
}

void MyNewDevice::GetName(char* name) const
{
    CDeviceUtils::CopyLimitedString(name, g_MyNewDeviceName);
}

int MyNewDevice::Initialize()
{
    return DEVICE_OK;
}

int MyNewDevice::Shutdown()
{
    return DEVICE_OK;
}

bool MyNewDevice::Busy()
{
    return false;
} 
```



Next, follow steps [10-end](/Visual_Studio_project_settings_for_device_adapters) 

You should now be able to build your device adapter by right clicking on it in the solution explorer and clicking `build`. This will create (on Windows) a file `mmgr_dal_MyNewDevice.dll`
at at the path `micro-manager\mmCoreAndDevices\build\Debug\x64\` (or possibly `Release` instead of `Debug`). Copy this file into the install directory of Micro-manager (e.g. `Program Files/Micro-Manager`).

Now launch Micro-Manager. Click `Devices--Hardware configuration wizard`. Click next to create a new configuration, find `MyNewDevice` and add it. Click through the rest of the wizard to save the configuration. Your new device adapter should now be successfully loaded.

**Note:** Every time you save and recompile you device adapter, you need to copy the new dll file into the Micro-Manager installation.


# Interfacing with hardware

To interface with hardware, you may need to take additional steps depending on your device type.

## Drivers and SDKs

(Devices that connect via serial port (RS-232) typically don't require drivers, so you can skip this section)

For devices that require drivers:

- Check if your device is recognized in Windows Device Manager (try unplugging and replugging to identify it). If it's not recognized, the driver is likely missing.
- Install the device manufacturer's software, which usually includes the necessary drivers.
- Run the manufacturer's software to verify that the device works as expected.
- At runtime, you might need to copy driver files into the Micro-Manager installation directory. If the hardware configuration wizard shows "device unavailable," this often means the driver cannot be found.

For development, you'll typically need the manufacturer's SDK, which contains headers, libraries, and documentation needed to communicate with the device.

If you need to link your code against manufacturer's proprietary libraries, copy the required files and directories (usually header files and dynamic or static libraries) to `3rdparty/ManufacturerName` or `3rdpartypublic/ManufacturerName`. This enables the project to find them at compile time.

### Visual Studio settings for dependencies

When using third-party libraries, you'll need to adjust your project settings. Failure to set these properties will lead to compile-time errors.

Right click on the device adapter project and select "Properties":

**C/C++ > General > Additional Include Directories**: Add the directory containing third-party header files. This might be something like: `$(MM_3RDPARTYPRIVATE)\ManufacturerName\Windows\version_number\include`

**Linker > General > Additional Library Directories**: Add the directory containing the .lib files. This might be something like: `$(MM_3RDPARTYPRIVATE)\ManufacturerName\Windows\version_number\lib\x64`


# Anatomy of a Device Adapter

A device adapter is a C++ class that bridges Micro-Manager and your hardware device. Each adapter implements one of the abstract interfaces defined in `MMDevice.h` and exposes functionality through methods and properties (described below).

In addition to this tutorial, looking through the code of
[existing device adapters](https://github.com/micro-manager/mmCoreAndDevices/tree/main/DeviceAdapters) can be helpful to understand their structure.


## Modules
Device adapters are organized into modules (DLLs on Windows, e.g., `mmgr_dal_MyDevice.dll`). A single module can contain multiple device adapters, which is useful when multiple device types need to be connected to the same hardware unit at runtime - for example, a motorized microscope might require several Device Adapter classes that all connect to the same controller or Hub device (see more details [here](/Hub_Device_Adapters)).


Each module must implement three key functions:

```cpp
// Registers all devices in this module with Micro-Manager
MODULE_API void InitializeModuleData()
{
    // Register each device with: name, type, and description
    RegisterDevice(g_MyNewDeviceName, MM::GenericDevice, "Description for My New Device");
    // Add more devices as needed:
    // RegisterDevice(g_MyOtherDeviceName, MM::CameraDevice, "My Camera Description");
}

// Factory function that creates device instances when requested
MODULE_API MM::Device* CreateDevice(const char* deviceName)
{
    if (deviceName == 0)
        return 0;

    // Create the appropriate device based on the requested name
    if (std::strcmp(deviceName, g_MyNewDeviceName) == 0)
    {
        return new MyNewDevice();
    }
    // Add more device types as needed
    
    return 0; // Return null if device name not recognized
}

// Cleanup function to delete device instances
MODULE_API void DeleteDevice(MM::Device* pDevice)
{
    delete pDevice;
}
```


## Device Types

Micro-Manager defines several device types in [MMDevice.h](https://github.com/micro-manager/mmCoreAndDevices/blob/main/MMDevice/MMDevice.h), each corresponding to a specific hardware category:

- `MM::Generic` - For simple devices or those that don't fit other categories
- `MM::Camera` - For image acquisition devices
- `MM::Shutter` - For devices that block/unblock light
- `MM::Stage` - For Z positioning devices
- `MM::State` - For devices with discrete states (e.g., filter wheels)
- `MM::XYStage` - For devices that move in XY plane
- `MM::AutoFocus` - For autofocus devices
- `MM::Hub` - For controller devices that manage multiple sub-devices

Each device type (except for `MM::Generic`) requires you to implement a specific API defined in the corresponding abstract class.

### Base Classes

To simplify development, Micro-Manager provides base classes in [DeviceBase.h](https://github.com/micro-manager/mmCoreAndDevices/blob/main/MMDevice/DeviceBase.h) that handle common functionality. You should inherit from these base classes rather than implementing the interfaces directly.

For example:
- `CGenericBase<T>` for generic devices
- `CCameraBase<T>` for cameras
- `CShutterBase<T>` for shutters
- `CStageBase<T>` for Z stages
- `CXYStageBase<T>` for XY stages
- `CStateDeviceBase<T>` for state devices

### Example: XYStage Device

Let's modify our previous example to create an XY stage device:

First, we need to register an XYStage device instead of a Generix device:

```cpp
MODULE_API void InitializeModuleData()
{
    RegisterDevice(g_MyNewDeviceName, MM::XYStage, "Description for My New Device");
}
```



Then, we change the class declaration in the header file:

```cpp
// in .h file
class MyNewXYStage : public CXYStageBase<MyNewXYStage>
```

Then we change the constructor:

```cpp
// in .cpp file

// This calls the default constructor of the base class when ours is initialized
MyNewXYStage::MyNewXYStage() : CXYStageBase<MyNewXYStage>(),
```


The key difference between a `Generic` device and an `XYStage` device is that the XYStage requires you to implement additional methods for positioning control. These methods allow Micro-Manager to move the stage, query its position, and understand its limits.


```cpp
// in .h file
class MyNewXYStage : public CXYStageBase<MyNewXYStage>
{
public:
    MyNewXYStage();
    ~MyNewXYStage();

    // MMDevice API - required for all devices
    int Initialize();
    int Shutdown();
    void GetName(char* name) const;
    bool Busy();
    
    // XYStage API - required for XY stages
    int SetPositionUm(double x, double y);
    int GetPositionUm(double& x, double& y);
    int SetPositionSteps(long x, long y);
    int GetPositionSteps(long& x, long& y);
    int SetOrigin();
    int Home();
    int Stop();
    int GetLimitsUm(double& xMin, double& xMax, double& yMin, double& yMax);
    int GetStepLimits(long& xMin, long& xMax, long& yMin, long& yMax);
    double GetStepSizeXUm();
    double GetStepSizeYUm();
};
```

Note that you only need to implement the methods listed above. The `MM::XYStage` interface defines additional methods like `SetRelativePositionUm(double dx, double dy)`, but the base class `CXYStageBase` already provides default implementations for these. You can override these default implementations if you want to provide more efficient or hardware-specific behavior.

For example, the default implementation of `SetRelativePositionUm` simply calls `GetPositionUm` followed by `SetPositionUm` with the new coordinates. If your hardware supports relative movement commands directly, you might want to override this method to use those commands instead.


## Properties

Properties are name-value pairs that allow custom settings and behavior of Device Adapters. 
While the device type APIs above defines required functionality that must be implemented, 
properties are flexible - as many or as few as needed can be created to control 
hardware effectively.


### Creating properties

#### Pre-initialization Properties

Some properties are needed prior to initialization. These should be created in the constructor:

```cpp
// In constructor
// CreateProperty(name, defaultValue, readOnly)
int ret = CreateStringProperty(MM::g_Keyword_Name, g_CameraDeviceName,  true);
if (DEVICE_OK != ret)
   return ret;
```

This concept is described more below.

#### Regular properties

Most properties are not needed prior to initialization, so they can be created in the `Initialize()` method:

```cpp
// In Initialize()
// CreateProperty(name, defaultValue, type, readOnly)
ret = CreateStringProperty(MM::g_Keyword_Binning, "1", false);
if (ret != DEVICE_OK)
   return ret;
```

#### Allowed values and limits
Many properties are only allowed to take certain values. These values can be specified when the property is created.

```cpp
// SetAllowedValues(propertyName, allowedValuesList)
std::vector<std::string> binningValues;
binningValues.push_back("1");
binningValues.push_back("2");
binningValues.push_back("4");
ret = SetAllowedValues(MM::g_Keyword_Binning, binningValues);
```

Alternatively, for numeric ranges, min and max values can be set:

```cpp
// CreateProperty(name, defaultValue, readOnly)
ret = CreateIntegerProperty("StripeWidth", "8", false);

// SetPropertyLimits(propertyName, minValue, maxValue)
ret = SetPropertyLimits("StripeWidth", 1, 10);
```


### Action handlers


Most properties interact with the underlying hardware through action handlers. For example, when the application gets a property value, the device adapter should query the hardware. When a property value is set, the device adapter should send the new value to the hardware. 

Best practice is to minimize caching values in the device adapter itself, as this can lead to the property value becoming out of sync with the hardware's actual state.

An action handler is a function called whenever a property is accessed. 

Action handlers can be created and linked to the property when it is created:

```cpp
CPropertyAction *pAct = new CPropertyAction (this, &CDemoCamera::OnGain);
int ret = CreateFloatProperty("Gain", 1, false, pAct);
assert(ret == DEVICE_OK); // make sure property creation was successful
```

This links to the action handler function elsewhere in the file `OnGain`:

```cpp
int MyNewCameraDevice::OnGain(MM::PropertyBase* pProp, MM::ActionType eAct)
{
	if (eAct == MM::AfterSet) {
        // Called after Micro-Manager sets a new property value
        // get the new value from the property and send it to your hardware.
        double value
        pProp->Get(value);
        SetGainValueOnDevice(value);
	}
	else if (eAct == MM::BeforeGet) {
        // Called before Micro-Manager reads the property value
        //  Query your hardware and update the property with the current value.
        double value = GetValueFromDevice();
        pProp->Set(value);
	}
	return DEVICE_OK;
}

```






## Constructor and destructor

When implementing constructors and destructors for Micro-Manager device adapters, follow these important guidelines:

1. **No hardware communication** - Never communicate with hardware in constructors or destructors. Hardware connections should be established in Initialize() and terminated in Shutdown(). Design your constructor and destructor to be lightweight so that creating and destroying instances without initialization has minimal overhead and no effect on hardware.

2. **Set device-independent properties** - Use the constructor to create and set properties that don't depend on hardware, such as description strings and adapter names.

3. **Create pre-initialization properties** - Use the constructor to create properties required for hardware initialization ("pre-initialization properties"). For example, a serial port property must be set before `Initialize()` is called since the device adapter needs to know which COM port to use when establishing communication. These properties that must be configured before initialization are called "pre-initialization properties."



## `Initialize()` and `Shutdown()`

The `Initialize()` and `Shutdown()` methods are critical for proper device adapter behavior within Micro-Manager. Follow these key rules:

- No hardware communication should occur before `Initialize()` is called
- Use `Initialize()` to establish the connection to hardware and prepare the device for commands
- Use `Shutdown()` to disconnect from the hardware, reversing the effects of `Initialize()`
- MMCore guarantees that `Initialize()` is called at most once during the device object's lifetime
- MMCore guarantees that `Shutdown()` is called before the device object is destroyed if `Initialize()` was called
- Calling `Shutdown()` without prior initialization must have no effect
- `Shutdown()` must perform the correct cleanup whether or not the call to `Initialize()` was successful
- After `Shutdown()`, the device adapter should never communicate with hardware


## Instance management

Micro-Manager's API allows for multiple instances of the same Device Adapter, meaning multiple objects can share the same Device Name. However, whether multiple instances make sense depends on your specific hardware and implementation. The device adapter library is responsible for managing these instances and any shared global data.

When implementing a library with multiple identical devices, you need a strategy to distinguish between instances, as each class instance corresponds to a specific physical hardware device.


The simplest scenario involves multiple identical devices independently connected to the host computer. For example, with multiple filter changers each connected to a different COM port:

1. Create a single class (e.g., `MyFilterChanger`) derived from the appropriate base class (e.g., `CStateDeviceBase`)
2. Add a pre-initialization property (e.g., `Port`) that identifies which physical device the instance controls
3. At runtime, Micro-Manager can create multiple instances of `MyFilterChanger`, each configured with a different port

This approach works well when each device instance connects to a physically separate hardware unit, and the distinguishing property (like `Port`) ensures each instance controls its own hardware.

A more complicated scenario occurs when multiple device adapters need to share access to the same physical hardware unit. In this case, you should implement a Hub-Peripheral architecture as described in [Hub Device Adapters](/Hub_Device_Adapters).



## Core Callbacks

[Certain functionality](https://micro-manager.org/apidoc/MMDevice/latest/class_m_m_1_1_core.html) requires devices to interact with the Micro-Manager Core. For example, camera devices must send the data they capture to the core. Device adapters can obtain a pointer to the Core via the `GetCoreCallback()` method




# Device adapter examples

Examining existing device adapters can provide valuable insights before writing your own. The Micro-Manager [codebase](https://github.com/micro-manager/mmCoreAndDevices/tree/main/DeviceAdapters/) contains numerous open-source examples.

## DemoCamera

The DemoCamera adapter contains several example device adapters of different types along with extensive comments explaining API functionality. It also contains error simulation capabilities (e.g., timeouts). These simulated devices primarily respond to commands without performing real actions, making them useful for testing the application without physical hardware.

# Debugging device adapters

## C++ debugger
You can attach a C++ debugger to micro-manager to step line by line through your code and understand problems. To do this:

- Make sure your device adapter has been built in "Debug" mode
- Launch Micro-Manager
- In Visual Studio, select **Debug > Attach to process** and select **javaw.exe**

This allows you to set breakpoints and examine code during execution.

## Logging
The Micro-Manager CoreLog can also contain helpful information (including whatever
your device adapter logs using the `LogMessage()` function). Make sure
to enable Debug Logging (in **Tools > Options**).

To debug DLL loading issues (such as when your device adapter is labeled
"(unavailable)" in the Hardware Configuration Wizard), examine the
CoreLog section from when you opened the Hardware Configuration Wizard.
It should log the error causing the failure. On Windows, you may want to 
test if any dependencies are missing by using one of the [Dependency Walker
alternatives](Free_third-party_tools_for_testing_communications_with_hardware.md).


## Scripting environment

It can be helpful to test device adapters from a scripting environment to write automated tests and avoid having to click through many buttons on the GUI. One way to do this is in python is with [pycromanager](https://pycro-manager.readthedocs.io/en/latest/).

For example, the following code will launch an instance of the Core automatically, load the demo configuration, and call the `snap_image()` function

```python

config_file = 'MMConfig_demo.cfg'

from pycromanager import start_headless, stop_headless, Core

start_headless('C:/Program Files/Micro-Manager', config_file)
core = Core()
core.snap_image()

# Your tests here
```



# Contributing Device Adapter Source code to Micro-Manager

When you've finished creating your device adapter, contribute it back to the codebase so others can use it!

See:
[Policies\_for\_inclusion\_of\_source\_code](Policies_for_inclusion_of_source_code)

