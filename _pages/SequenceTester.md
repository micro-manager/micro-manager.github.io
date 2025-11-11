---
title: SequenceTester
layout: page
---

| Summary | Mock devices for interactive and automated testing of experiment sequencing |
| Author  | Mark A. Tsuchida |
| License | LGPL |
| Platforms | All |

---

## Introduction

SequenceTester provides pure-software simulated devices that are designed to check the behavior of code that controls and sequences device action, such as

- Acquisition engines
- Virtual devices such as those in the [Utilities](Utilities) device adapter
- MMCore itself
- Any other code that should perform exact control of devices

The SequenceTester devices themselves don't make any assumptions about how the
devices will be controlled, but instead report the log (history) of all device
actions taken prior to image acquisition. This allows automated tests (or a
human) to determine if the expected actions were carried out in the expected
order.

## Configuration

All devices are peripherals of the hub device `THub`, of which only one is
expected to be created at one time.

The peripherals are `TCamera-0`, `TCamera-1`, `TShutter-0`, `TShutter-1`, and
so on. Two distinct mock devices (`-0` and `-1`) are provided for each device
type so that interactions with more than one device can be tested (including
things like `Multi Camera`).

You need to add at least one camera, because the test results are provided in
the "acquired" images. The camera devices have these pre-init properties:

- `ImageWidth` and `ImageHeight` determines the size of images produced (this
  is fixed for simplicity)
- `ImageMode` can be:
  - `HumanReadable`, which draws human-readable text to the images containing
    the test data, for interactive testing
  - `MachineReadable`, which places binary data in
    [MsgPack](https://msgpack.org) format in the image buffer, for automated
    testing

The data encoded in the images is essentially the same for the two values of
`ImageMode`. Any data that doesn't fit in the image size is truncated (this is
more of a concern for the human-readable images).

## Overview of the produced test data

Here we describe the data rendered in the human-readable text images. See the
separate section below for the machine-readable format.

- `HubGlobalPacketNr` is the serial index of the image since when the `THub`
  devices was created, across all cameras (counting from 0; same hereafter).
- Next are a few attributes related to how the image came to be produced:
  - `camera,name` is the name (N.B. not label) of the camera (`TCamera-0` or
    `TCamera-1`) that produced the image.
  - `camera,serialImageNr` is the serial index of the image among those
    produced by the same camera.
  - `camera,isSequence` is true if the image was produced as part of a sequence
    acquisition, as opposed to a snap.
  - `camera,snapImageNr` (only present if `camera,isSequence` is `false`) is
    the serial index of the image among those produced by the same camera via
    snap.
  - `camera,sequenceImageNr` (only present if `camera,isSequence` is `true`) is
    the serial index of the image among those produced by the same camera via
    sequence acquisition.
  - `camera, frameNr` (only present if `camera,isSequence` is true) is the
    serial index of the image among those produced by the same camera in the
    same sequence acquisition.
- The `State` section lists the values of all device parameters at the moment
  when the image was acquired. The list is sorted lexicographically.
- The `History` section lists all _changes_ of device parameters since what was
  reported in the immediately previous image. This captures every change, even
  if the same parameter changed values multiple times. Each change is prefixed
  with a sequential number in brackets.

## Recorded parameters

The parameters recorded in the `State` and `History` section correspond to the
state modeled by each device type. Device name (N.B., not device label) and
parameter name are separated by a comma (`,`).

Some parameters (such as `TCamera-0,Binning` or `TShutter-0,ShutterState`) map
to Micro-Manager properties, but some (such as `TSwitcher-0,GateOpen` or
`TZStage-0,ZPositionUm`) do not.

### The `Busy` parameter

Each device has a `Busy` parameter with an integer value. A value of `0` means
"not busy".

Every time a request is made to the device that could make the device busy
(that is, anything that causes any parameter other than `Busy` itself to
change), the value is incremented (the increment happens just before the
parameter change).

Every time the device interface `Busy()` query is called, the value is
decremented. The `Busy()` call returns true unless the `Busy` parameter has
reached `0`.

Calling MMCore's `waitForDevice()` (or `waitForSystem()`, etc.) results in
calling the device's `Busy()` in a loop until it returns false, which means
that the `Busy` parameter will always reach `0` if all initiated actions have
been waited for before the camera starts "exposing".

If sequencing code initiates a device action but forgets to wait for its
completion, the device's `Busy` parameter will have a non-zero value in the
`State` section. This usually indicates a bug. An example is starting a stage
move but not waiting for the stage device before acquiring an image.

(Note that such bugs are often hard to find when testing with real hardware or
DemoCamera, because not all devices become busy on every action being
initiated---and even if they did, it's not always obvious from the resulting
images that the action had not fully completed: for example, failure to wait
for focus movement to finish during a Z stack may not always be obvious in the
images.)

## Real (wall clock) time is not simulated

The SequenceTester devices intentionally do **not** simulate real time behavior.
That is, actions that would take significant time in real devices take almost
no time, and the devices never sleep to simulate the passage of time.

This is an important design decision, because the point of SequenceTester is to
help test whether requests to devices (including waiting for completion) are
made in the correct sequence. You don't want experiment sequencing code to only
work when the timing is "realistic" in some sense---you want it to perform
logically correct sequencing.

There is also the added advantage that automated tests will run much faster due
to the lack of sleeping.

## Hardware sequencing simulation

The `TZStage-{0,1}` devices support simulation of hardware-sequenced Z
movements, triggered by a camera.

The `TSwitcher-{0,1}` devices support simulation of hardware sequencing of the
`State` property, triggered by a camera.

The simulation is of a hardware setup in which the camera emits triggers and
the above devices receive them.

These devices have the following properties to configure hardware sequencing:

- `TriggerSequenceMaxLength`: if `0`, the device does not support hardware
  sequencing. Otherwise the device reports the given number as the maximum
  supported sequence length.
- `TriggerSourceDevice`: this can be set to `TCamera-0` or `TCamera-1` (device
  name, not label).
- `TriggerSourcePort`: this can be set to `ExposureStartEdge` or
  `ExposureStopEdge`.

When hardware sequencing takes place, the `State` section reflects the
sequenced values. In the `History` section, every received trigger is recorded
with the pseudo-value `(one-shot)`; for example:
`[106]TZStage-0,trig-in:ZPositionUm=(one-shot)`.

Parameter changes caused by hardware triggers do not increment the `Busy` count
of the device.

## Autofocus simulation

The `TAutofocus-{0,1}` devices simulate "autofocus" devices, which model devices
that provide hardware-based focus maintenance.

The TAFStage devices (`TAFStage-{0,1}`) are Z-stages that return `true` from
MMCore's `isContinuousFocusDrive()` query. These are useful for testing code
that needs to distinguish between regular Z-stages and focus-maintenance
"offset" stages. (BUG: These should be linked to the current focus offset of the
corresponding `TAutofocus-{0,1}` device, but they aren't as of this writing).

Caveat: the autofocus behavior simulated does not represent all possible
behaviors of real hardware focus maintenance devices. This is an area in which
we do not have good abstraction between vendor specific behavior.

The autofocus device (`TAutofocus-{0,1}`) provides the following user-accessible
properties:

- `ContinuousFocus` (On/Off): Enable or disable continuous focus operation.
  Equivalent to MMCore's `enableContinuousFocus()` and
  `isContinuousFocusEnabled()`.
- `LinkedZStage`: Specifies the device name (N.B., not label) of a Z-stage to
  _link_ to (typically `TZStage-0` or `TZStage-1`).
- `SetZDisablesContinuousFocus` (Yes/No): When set to `Yes`, any call to move
  the _linked_ Z-stage will automatically disable continuous focus. This
  simulates the behavior of some microscopes that turn off focus maintenance
  when the user or acquisition code manually moves the focus.

In addition to the device properties, the following internal parameters are
recorded in the test output:

- `Offset`: The autofocus offset value, accessed via MMCore's
  `setAutoFocusOffset()` and `getAutoFocusOffset()`.
- `ContinuousFocusEnabled`: Records the continuous focus on/off state.
- `FullFocus`: A one-shot parameter that records when MMCore's `fullFocus()`
  function is called on the autofocus device.
- `IncrementalFocus`: A one-shot parameter that records when MMCore's
  `incrementalFocus()` function is called on the autofocus device.

## Format of the MsgPack test data

Note: This format may change without notice. If a change is made, the new
format will be distinguishable by having a map, rather than an array, as the
outer-most container and/or having something other than an integer as the first
element. Or we might switch entirely to JSON (starting with `'{'`).

Currently, the message (per image) is an array of length 7 with the following
elements:

- 0: Hub-global image (packet) number (a non-negative integer)
- 1: Camera info: an array of length 5
  - 0: camera name
  - 1: serial image number
  - 2: is sequence (boolean)
  - 3: cumulative image number (for the acquisition type: snap or sequence)
  - 4: frame number (valid for sequence acquisition)
- 2: Start change counter (start index of change history since previous image)
- 3: Current change counter (next index of change history)
- 4: Map of state at start (i.e., in previous image)
  - This is identical to the "current state" (the next item) as of the previous
    image (empty for the first ever image)
- 5: Map of current state
  - This is an array of length-2 arrays containing the key and value
    - The key is a length-2 array: device (string) and parameter (string)
    - The value is a length-2 array: type (string) and value:
      - `"bool"`, bool value
      - `"int"`, int value
      - `"float"`, float value
      - `"string"`, str value
      - `"one_shot`, nil value
- 6: Change history
  - This is an array of length-3 arrays containing key, value, and index
    - The key and value are in the same format as the state map
    - The index is the global count of previous change events

Caveat: I wrote the above by reading the source code; it may be good to verify
before assuming it is 100% correct.

## Unfinished work

We ought to have (Python, Java, and possibly C++) libraries to decode the
MsgPack data, abstracting away the details of the format, so that we can make
changes to the format without having to update all tests that use
SequenceTester. Replacing MsgPack with JSON might accomplish the same goal.
