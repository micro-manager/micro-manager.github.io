---
title: 3D Animation Script
layout: page
---

## 3D Animation Script

| | |
|---|---|
| **Summary:** | Scripted 3D animations for the ClearVolume 3D viewer plugin |
| **Author:** | Nico Stuurman |
| **License:** | BSD |
| **Platforms:** | All platforms supported by Micro-Manager |
| **Requires:** | ClearVolume plugin; optionally [ffmpeg](https://ffmpeg.org) for MP4 export |

## Overview

The **3D Animation Script** dialog, accessible from the ClearVolume 3D viewer,
lets you write scripts that drive the viewer through a series of camera
movements, zoom changes, clipping adjustments, and channel property changes
across a defined number of frames. Animations can be previewed interactively,
exported as an ImageJ stack, or encoded as an MP4 movie using ffmpeg.

The scripting language follows the one described in:

> Wan *et al.* (2019) ["The 3Dscript animation language."](https://www.nature.com/articles/s41592-019-0359-1) *Nature Methods* 16, 1179–1180.

Further documentation for the script language is available on the
[3Dscript website](https://bene51.github.io/3Dscript/) and the
[3Dscript wiki](https://github.com/bene51/3Dscript/wiki).

## Opening the 

In the ClearVolume Insepctor panel, click the **Script...** button

## Dialog Controls

| Control | Description |
|---------|-------------|
| **Animation script** | Text editor for the animation script. Supports monospaced editing with tab indentation. |
| **Save… / Load…** | Save the current script to a `.cvs` file, or load one from disk. The last used directory is remembered between sessions. |
| **Frames per second** | Playback and capture rate (1–120 fps). |
| **Total frames** | Total number of frames to render. |
| **Export to** | *Preview* — play the animation live in the viewer without capturing. *ImageJ stack* — collect each frame into an ImageJ window. *Movie (ffmpeg)* — encode the frames as an MP4 file via ffmpeg. |
| **Restore viewer state after animation** | When checked, the viewer is returned to exactly the state it was in before the animation started (rotation, zoom, clipping, channel properties). Useful when using Preview mode to test a script. |
| **Output file (.mp4)** | File path for the MP4 output (visible only when *Movie (ffmpeg)* is selected). |
| **Run / Stop** | Start or abort the animation. |
| **Help** | Opens this page. |

## Script Language

### Time intervals

Every instruction must be associated with a time interval.
Two forms are supported:

```
From frame 1 to frame 120:
- action one
- action two

At frame 60:
- action three
```

A line ending with `:` acts as a header shared by all immediately following
lines that start with `-`. A line without `:` combines the interval and a
single action on the same line.

Frame numbers are zero-based. The *Total frames* spinner in the dialog sets
how many frames are rendered in total.

### Comments

Lines starting with `#` are ignored:

```
# This is a comment
```

### Actions

All keywords are case-insensitive.

#### Rotation

```
rotate by <degrees> degrees horizontally
rotate by <degrees> degrees vertically
rotate by <degrees> degrees around <ax> <ay> <az>
```

Rotates the camera incrementally over the interval. The total rotation
across the full interval is `<degrees>`. For example, to spin the volume
one full turn over 120 frames:

```
From frame 1 to frame 120:
- rotate by 360 degrees horizontally
```

#### Translation

```
translate horizontally by <amount>
translate vertically by <amount>
translate <dx> <dy> <dz>
```

#### Zoom

```
zoom by a factor of <factor>
```

Positive values zoom in; negative values zoom out. The value is
accumulated as a delta each frame, so a factor of `1` moves the camera
by 1 unit per frame over the interval.

#### Clipping / bounding box

```
change front clipping to <value>
change back clipping to <value>
change front/back clipping to <value>
change bounding box min x to <value>
change bounding box max x to <value>
change bounding box x to <min> <max>
```

Also supported for axes `y` and `z`. Values are in the range −1 to 1.

#### Channel intensity

Channels are numbered from 1 (matching the Micro-Manager UI).

```
change channel <c> min intensity to <value>
change channel <c> max intensity to <value>
change channel <c> intensity gamma to <value>
change channel <c> intensity to <min> <max> <gamma>
```

Intensity values are normalised in the range 0–1.

#### Channel color

```
change channel <c> color to <r> <g> <b>
```

Color components are in the range 0–255.

#### Channel weight

```
change channel <c> weight to <value>
```

Interpolates a weight value (0–1). Because ClearVolume controls channel
visibility as a boolean, values above 0.5 show the channel and values at
or below 0.5 hide it.

#### Channel visibility

```
change channel <c> visibility to on
change channel <c> visibility to off
```

Also accepts `true`/`false` and `show`/`hide` in place of `on`/`off`.

#### Time point

```
change time to <n>
change time from <a> to <n>
```

Moves to time point `<n>` (1-based, matching the Micro-Manager UI). This
action is intended for time-lapse datasets and lets you animate through the
T axis of a multi-time-point acquisition.

In a `From frame A to frame B` block the time point is linearly interpolated
and **rounded to the nearest integer** each frame, so it steps discretely
through the dataset. Easing keywords apply and control the stepping rate
(e.g. `ease-in-out` dwells longer at the beginning and end of the sweep).

With the `to <n>` form, interpolation starts from the time point currently
displayed in the viewer when the animation begins. With the `from <a> to <n>`
form, interpolation always starts at `<a>` regardless of the viewer state.

In an `At frame N` block the time point jumps immediately to `<n>`.

Example — sweep through 10 time points while rotating the volume:

```
From frame 1 to frame 120:
- rotate by 360 degrees horizontally
- change time from 1 to 10
```

If **Restore viewer state after animation** is checked, the viewer returns
to the time point it was showing before the animation started.

A script function can also supply the time point dynamically. For example,
to hold each time point for 12 frames before stepping to the next:

```
From frame 1 to frame 120:
- change time to timeFn

script
function timeFn(t) {
    // Steps through time points 1–10, holding each for 12 frames.
    return floor((t - 1) / 12) + 1;
}
```

### Easing

Any action line may end with an easing keyword that controls the speed
curve of the interpolation:

| Keyword | Behaviour |
|---------|-----------|
| *(none)* | Linear (constant speed) |
| `ease` | Smooth S-curve (less dramatic than ease-in-out) |
| `ease-in` | Starts slow, then accelerates |
| `ease-out` | Starts fast, then decelerates |
| `ease-in-out` | Slow start and slow end |

Example:

```
From frame 1 to frame 120:
- rotate by 360 degrees horizontally ease-in-out
```

### Script functions

An optional `script` block at the end of the script text may define
JavaScript functions. Any numeric parameter in an action line can be
replaced by the function's name; the function is called with the current
1-based frame number as its argument and its return value is used as the
parameter for that frame.

Available math shims (matching ImageJ macro syntax): `sin`, `cos`, `tan`,
`asin`, `acos`, `atan`, `atan2`, `sqrt`, `exp`, `log`, `abs`, `floor`,
`ceil`, `round`, `pow`, `min`, `max`, `PI`, `E`.

```
From frame 1 to frame 120:
- rotate by 360 degrees horizontally ease-in-out
- zoom by a factor of zoomFn

script
function zoomFn(t) {
    // Returns a per-frame zoom delta.
    // Absolute position = 0.1 + 2.9 * sin(PI * (t-1) / 119)
    // ranges from 0.1 at t=1, peaks at 3.0 near t=60, returns to 0.1 at t=120.
    // The delta is the derivative of that curve.
    var pos  = 0.1 + 2.9 * sin(PI * (t - 1) / 119);
    var prev = 0.1 + 2.9 * sin(PI * (t - 2) / 119);
    return pos - prev;
}
```

In the example above the zoom follows a smooth arc from 0.1× up to 3.0× and
back while the volume rotates. Note that when a script function is supplied,
the easing keyword has no effect on that parameter — the function controls the
value directly. Because `zoom by a factor of` accumulates a delta each frame,
`zoomFn` returns the difference between the desired absolute position at frame
`t` and at frame `t − 1`.

## Complete Example

```
# Rotate 360° while pulsing zoom (0.1x → 3.0x → 0.1x) and gradually
# revealing the volume by opening the front clip.

From frame 1 to frame 120:
- rotate by 360 degrees horizontally ease-in-out
- zoom by a factor of zoomFn

From frame 1 to frame 60:
- change front clipping to -0.5

From frame 61 to frame 120:
- change channel 1 max intensity to 0.9 ease-out

At frame 60:
- change channel 2 visibility to on

script
function zoomFn(t) {
    // Smooth arc: 0.1 at t=1, peaks at 3.0 near t=60, returns to 0.1 at t=120.
    var pos  = 0.1 + 2.9 * sin(PI * (t - 1) / 119);
    var prev = 0.1 + 2.9 * sin(PI * (t - 2) / 119);
    return pos - prev;
}
```

## Exporting with ffmpeg

Select **Movie (ffmpeg)** from the *Export to* drop-down, specify an
output `.mp4` file path, and click **Run**. The plugin renders each
frame using the OpenGL renderer, writes lossless PNG frames to a
temporary directory, then invokes ffmpeg with the H.264 codec
(`libx264`, `yuv420p`, `medium` preset) and cleans up the temporary
files automatically.

ffmpeg must be installed and locatable on your system.
On the first export the plugin will prompt you to locate the ffmpeg
binary if it cannot find it automatically.

{% include Listserv_Search text="ClearVolume 3DScript animation" %}
