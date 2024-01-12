---
title: NotificationTester
layout: page
---

| Summary | Simulated devices for interactive and automated testing of event notifications |
| Author  | Mark A. Tsuchida |
| License | BSD |
| Platforms | All |

---

## Introduction

The NotificationTester device adapter provides simulated devices for testing
application behavior in response to devices that notify (or don't notify) when
their state changes.

Uses might include testing of GUI controls (Device Property Browser, Stage
Control) or automated integration testing of models that underly GUI
components.

The following event notifications can be simulated:

- `OnPropertyChanged` (any device type; any property)
- `OnStagePositionChanged` (single-axis stage; position)
- `OnXYStagePositionChanged` (XY stage; 2D position)

The following additional event notifications are **not** implemented (yet) by
NotificationTester:

- `OnPropertiesChanged` (any device type; use by device usually not recommended)
- `OnExposureChanged` (cameras; exposure)
- `OnSLMExposureChanged` (SLMs; exposure)
- `OnMagnifierChanged` (Magnifiers; magnification)

Because MMDevice did not specify the precise requirements for event
notifications (and different hardware devices and their drivers have different
capabilities), device adapters implement notifications differently:

- Some do not issue any event notifications (this is not necessarily a defect)
- Some issue notifications from a thread owned by the device adapter or driver.
  These we call "asynchronous" notifications.
- Some issue notifications from the thread that called into the device to set
  its state, notifying the requested change and possibly changes to other
  properties and parameters. These we call "synchronous" notifications.

At present, applications that use MMCore need to be written to work reasonably
well in all cases. For this reason, NotificationTester provides synchronous and
asynchronous versions of the test devices, with a number of configuration
options.

It is important to note that the notifications, in general, occur on a
different timeline from the control initiated by the application. That is, the
result of a given application-initiated action may be notified (if at all) with
no particular temporarl ordering with respect to the action, or the results of
actively reading the device state. All that can be said is that each
notification reflects the state of the device at a timepoint in the recent past
and that they are received in order (relative to other notifications for a
given property/parameter). This also means that notifications are in general a
bad way to detect completion of a given action; for that, `Busy()` (or the
`waitForDevice()` family of `CMMCore` methods) needs to be used.

For this reason, notifications are more useful for keeping GUI displays and
controls up to date (in a "best effort" manner, to be precise), and less useful
(if at all) for controlling and sequencing experiments.

## Devices and settings

### Property change notifications

Device `NTSyncProperty` has `TestProperty` (float) which immediately reflects
the set value (the device is never busy). If `NotificationsEnabled` is set to
`Yes`, `OnPropertyChanged()` is called from within the property `AfterSet`
handler, on the same thread that called into the device adapter. (From the
application's point of view, `onPropertyChanged()` is called on the thread
calling into `setProperty()`. This means applications need to take care not to
call any `CMMCore` methods that may call into the same device adapter, because
deadlock may result.)

Device `NTAsyncProperty` has `TestProperty` (float) which distinguishes the
target value from the current value. Setting the `TestProperty` returns without
blocking and the current value is slewed toward the target at a constant rate
(`SlewTimePerUnit_s`, which is the reciprocal of the [slew
rate](https://en.wikipedia.org/wiki/Slew_rate)), updating periodically
(`UpdateInterval_s`). The last update is guaranteed to match the target value
(even if that happens mid-update-interval). `Busy()` returns true when the
current value differs from the target value. Reading the property always
returns the last-updated current value (as opposed to the target). If the
property is set before the previous slewing completed, the previous target is
forgotten and a slew toward the new target is begun.

When `NotificationsEnabled` is `Yes`, `OnPropertyChanged()` is called on every
update, after an optional, independent delay (`NotificationDelay_s`), always
from a background thread owned by the device adapter. A device that only
notifies once per change can be simulated by setting the update interval to be
longer than the total slew time.

For both devices, setting the `ExternallySet` property will simulate the target
value being changed from the hardware side (or, by definition, as a consequence
of setting a different property than `TestProperty` being observed). The
`ExternallySet` property itself is always read as last written.

### Stage position notifications

`NTSyncStage` and `NTAsyncStage` work similarly to `NTSyncProperty` and
`NTAsyncProperty`, except that busy status and notifications apply to the stage
position instead of a test property. Notifications are via
`OnStagePositionChanged()`. These devices have `ExternallySetSteps` instead of
`ExternallySet` and `SlewTimePerStep_s` instead of `SlewTimePerUnit_s`. The
step size is fixed at 0.1 um.

`NTSyncXYStage` and `NTAsyncXYStage` are analogous devices simulating XY
stages. Notifications are via `OnXYStagePositionChanged()`. The
`ExternallySetSteps` property takes a string consisting of two integers
separated by `;` (semicolon). The step size is fixed at 0.1 um for both X and
Y. For `NTAsyncXYStage`, when the position is set, each of the X and Y axes is
slewed at the same rate toward the setpoint; if one axis reaches the setpoint
first, it stops first and the other axis keeps slewing.

The Z and XY stages do not support homing but do support stopping.

## Logging

In the CoreLog, the NotificationTester devices log debug-level entries for the
following:

- `sp = <setpoint>` when the tested parameter's target is changed directly
- `sp = <setpoint> (external)` when the target is changed via the
  `ExternallySet` property
- `PV = <process variable>` when the tested parameter's current measurement is
  changed (immediately for synchronous; every update interval for asynchronous)
- `Notifying: PV = <process variable>` just before issuing a notification

(See Wikipedia for the [setpoint][setpoint] and [process variable][process
variable] terminology.)

[setpoint]: https://en.wikipedia.org/wiki/Setpoint_(control_system)
[process variable]: https://en.wikipedia.org/wiki/Process_variable
