---
title: Camera Device Adapters
layout: page
section: Extend:Device Adapters
---

# Camera Device Adapters

In 2025, Micro-Manager [introduced a new camera API](https://github.com/micro-manager/mmCoreAndDevices/pull/593) based on the  [GenICam standard features naming convention v2.7](https://www.emva.org/wp-content/uploads/GenICam_SFNC_v2_7.pdf). This new API provides a standardized way to interact with camera hardware, simplifying development and ensuring consistency across different camera device adapters.


## Required Methods

When implementing a camera device adapter using the new API, you must inherit from `CNewAPICameraBase` and implement the following required methods:

```cpp
virtual bool IsNewAPIImplemented() = 0;
virtual int TriggerSoftware() = 0;
virtual int AcquisitionArm(int frameCount) = 0;
virtual int AcquisitionStart() = 0;
virtual int AcquisitionStop() = 0;
virtual int AcquisitionAbort() = 0;
```


### Notes
- All image acquisition is initiated through the `AcquisitionStart()` method
- `AcquisitionStart()` returns immediately. Device adapters must explicitly call `GetCoreCallback()->AcqFinished()` when acquisition completes.
- Data should be read out via the buffer methods (`core.popImage()` or `core.getLastImage()`), not `core.getImage()`.
- `AcquisitionArm(int numImages)` prepares the camera for acquisition, allowing pre-allocation of resources. Use `0` for continuous acquisition.

### Events

GenICam-style camera events are supported but should not be relied upon for critical operations (e.g., closing shutters), as event delivery is not guaranteed. 



### Standard Properties

Additional camera functionality is implemented through standard properties following the GenICam naming convention. These properties ensure consistent naming and behavior across different camera adapters. The current standard properties include:

- `TriggerSelector`
- `TriggerMode`
- `TriggerSource`
- `TriggerActivation`
- `TriggerDelay`
- `TriggerOverlap`
- `ExposureMode`
- `ExposureTime`
- `AcquisitionBurstFrameCount`
- `AcquisitionFrameRate`
- `AcquisitionFrameRateEnable`
- `AcquisitionStatusSelector`
- `AcquisitionStatus`
- `LineSelector`
- `LineMode`
- `LineInverter`
- `LineSource`
- `LineStatus`
- `EventSelector`
- `EventNotification`

The values of the properties in many cases are not standardized to allow for custom, device-specific implementations. But whenever a property implements a value that is consistent with the [GenICam standard features naming convention](https://www.emva.org/wp-content/uploads/GenICam_SFNC_v2_7.pdf), its name should be derived from there.

An up-to-date list of standard properties and their specifications can always be found in [MMDevice.h](https://github.com/micro-manager/mmCoreAndDevices/blob/main/MMDevice/MMDevice.h).

### Implementing Standard Properties

Standard properties are opt-out for new-API camera device adapters. This means that your device adapter must explicitly declare any standard properties it chooses to skip during initialization. To implement standard properties, use the provided initialization methods:

```cpp
InitOrSyncTriggerSelectorStandardProperty();
InitOrSyncTriggerModeStandardProperty();
InitOrSyncTriggerSourceStandardProperty();
// ... additional standard properties
```

# Migrating an Existing Camera Device Adapter

Existing camera adapters can incrementally adopt standard properties without fully migrating to the new API. To do this:

- Identify existing properties that match standard properties.
- Create the standard property using the provided initialization method, reusing the existing property handler.
- Keep the legacy property name for backward compatibility.

For example, if your existing camera adapter has a property named `"TriggerMode"`, you can migrate it to the standard property `"api//TriggerMode"` while maintaining backward compatibility:

```cpp
// In Initialize() method
int ret = CreateTriggerModeStandardProperty("Internal", pAct);
if (ret != DEVICE_OK)
   return ret;

// Keep legacy property for backward compatibility
ret = CreateStringProperty("TriggerMode", "Internal", false, pAct);
if (ret != DEVICE_OK)
   return ret;
```


### Migrating old API methods

Several old-style methods must also be updated or removed:

#### Exposure

Previously, exposure was implemented using these methods:

```cpp
virtual void SetExposure(double exp_ms) = 0;
virtual double GetExposure() const = 0;
```

In the new API, exposure is handled through the standard property `ExposureTime`:

```cpp
CreateExposureTimeStandardProperty("10", minValue, maxValue, action);
```

Note that GenICam style exposure is in units of us, while the old micromanager camera API uses ms.

#### Snap Image and Image Buffer

The following methods are no longer implemented in the new API:

```cpp
virtual const unsigned char* GetImageBuffer() = 0;
virtual long GetImageBufferSize() const = 0;
virtual int SnapImage() = 0;
```

Instead, all image acquisition (including single-image snaps) is performed through the new acquisition methods (`AcquisitionArm`, `AcquisitionStart`) and images are retrieved via the core buffer methods (`core.popImage()` or `core.getLastImage()`).


#### Sequence Acquisitions

Previously, sequence acquisitions were implemented using these methods:

```cpp
virtual int PrepareSequenceAcqusition() = 0;
virtual int StartSequenceAcquisition(double interval) = 0;
virtual int StartSequenceAcquisition(long numImages, double interval_ms, bool stopOnOverflow) = 0;
virtual int StopSequenceAcquisition() = 0;
```

In the new API, these map to the following methods:

- `PrepareSequenceAcqusition()` functionality should be moved into `AcquisitionArm()`.
- `StartSequenceAcquisition()` is replaced by `AcquisitionStart()`. Note that the number of images (`numImages`) is now specified in `AcquisitionArm()`, which is required.
- `StopSequenceAcquisition()` is replaced by `AcquisitionStop()` or `AcquisitionAbort()`.

