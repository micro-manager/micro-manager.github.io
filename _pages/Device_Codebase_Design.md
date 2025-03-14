---
title: MMDevice codebase architecture
layout: page
section: Extend:Device Adapters
---

## Terminology

-   **Module** – a run-time software component located in a single file,
    usually an executable or dynamic library
-   **Device Adapter** – a C++ class that converts a device
    manufacturer’s command set (or API) to Micro-Manager’s device
    interface API
-   **Driver** – one or more software components provided by the device
    manufacturer to enable other software such as Micro-Manager to
    control the device (some devices do not require drivers)
-   **Library** – dynamic library (e.g. dll, dylib, so, etc.) conforming
    to Micro-Manager’s module API and naming convention that contains
    one or more Device Adapters


## Project settings (Windows)

Each Micro-manager Device Adapter is a C++ class residing in a Library
(dynamically linked). One Library usually contains more than one
DeviceAdapter. Micro-manager application does not link against any of
the Device Adapter libraries at build time. Libraries are discovered by
scanning the application default directory for dynamic libraries
following the specific naming convention:
```
mmgr_dal_<device name>.dll
```
In other words it will try to load at run-time only libraries with
prefix `mmgr_dal`. In our case our new adapter (once we are finished
with it) should build as `mmgr_dal_mynewdevice.dll`.



The plug-in interface along with utility classes is contained in single
directory:

```
/projects/micromanager1.4/MMDevice
```

Device adapters incorporate code from this directory via a static
library called MMDevice-SharedRuntime.lib. See [Visual Studio project
settings for device
adapters](Visual_Studio_project_settings_for_device_adapters)
for details on how this works.

Each device Library
(dynamic library) can contain one or more device adapters. The Library
module must also implement plug-in API defined in the
**ModuleInterface.h** in order to be loaded by Micro-manager
applications. In theory, these two files plus **MMDeviceConstants.h**
(for error codes and other constants) are all we need to create device
adapters: if you implement the required API with the correct behavior,
the Micro-Manager application will be able to make use of it.

**MMDevice.h, ModuleInterface.h and MMDeviceConstants.h** essentially
define the plug-in interface and are also used by the Micro-manager
application. We should never modify these files – any discrepancy
between your version and the one used to build the main application will
likely result in the system crash or severe malfunction

### Utility classes and files

To make building device adapters easier, we provide a couple of
additional files to use as building blocks. First, **DeviceBase.h**
contains base class partial API implementations for all device classes.
The idea is to derive our particular device adapter class from the
appropriate class defined in the **DeviceBase.h**. This header file
contains method implementations as well, so there is no corresponding
cpp file.

Since **DeviceBase.h** and other utility files are not used by the main
application, you can modify them if you wish. However, the best strategy
is to avoid changing any of the supplied utility files since they
implement some of the essential device behavior that the main
application is relying on.

**Property.h** and **Property.cpp** provide the implementation of the
Micro-Manager "Property" mechanism, but again, only on the device side –
they are not used in the rest of the application. Property class is used
by the **DeviceBase.h** classes and most of the time you won't have to
deal with it directly.

**DeviceUtils.h** and **DeviceUtils.cpp** contain a couple of relatively
simple helper functions we may or may not want to use.

**ImgBuffer.h** and **ImgBuffer.cpp** provide a simple implementation of
the generic image buffer, which you may or may not find useful for
building camera adapters. We can disregard this class if we have a
better one or if our device does not need to deal with images.


