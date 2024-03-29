---
autogenerated: true
title: Olympus
redirect_from:
  - /wiki/Olympus
  - /wiki/OlympusIX81%2FBX61
layout: page
---

## Olympus IX81/IX71/BX61/BX51 adapter
<table>
<tr>
<td markdown="1">

**Summary:**

</td>
<td markdown="1" valign="top">

Controls Olympus IX81, IX71, BX61, BX51 microscopes

</td>
</tr>
<tr>
<td markdown="1">

**Author:**

</td>
<td markdown="1">

Jeff Kuhn and Arthur Edelstein, BX61 support added by Shalin Mehta

</td>
</tr>
<tr>
<td markdown="1">

**License:**

</td>
<td markdown="1">

not Open Source

</td>
</tr>
<tr>
<td markdown="1">

**Platforms:**

</td>
<td markdown="1">

Windows, Mac OS X (through serial port)

</td>
</tr>
<tr>
<td markdown="1">

**Available since version:**

</td>
<td markdown="1">

1.3.22

</td>
</tr>
<tr>
<td markdown="1" valign=top>

**Default serial port settings:**

</td>
<td markdown="1" valign=top>

|                     |       |
|---------------------|-------|
| AnswerTimeout       | 500   |
| BaudRate            | 19200 |
| DelayBetweenCharsMs | 0     |
| Handshaking         | Off   |
| Parity              | Even  |
| StopBits            | 2     |

</td>
</tr>
</table>

<div markdown="1">
## Installation

### Cabling and DIP switches

Olympus microscopes generally require straight-through (not null-modem)
RS-232 cables (confirmed with an IX2-UCB).

These serial port settings require all **DIP switches** on the front of
the "Frame Control Unit" (the box connected to the serial cable) to be
in their default position: off (zero). Switching of these DIP switches
must be done while the unit is turned off.

### BSW Software

The IX-81 seems to require the Olympus BSW software to be installed and
configured otherwise Micro-Manager complains about "Error in device
OlympusHub: Error code 17 (11 Hex)". Make sure you can connect
successfully in BSW, i.e. "Log in".

### Hardware Configuration Wizard

Add an Olympus Hub device to your hardware configuration and choose its
serial port. Other devices (stage, filter wheel, etc) then communicate
to the hardware through the (software) Hub.

## Device Configuration

There are two modes of Control: Computer and "Manual + Computer". The
former is faster, but disables the manual controls. The latter is
slower, but allows you to manually control the turret positions, focus
drive, etc.

If you are using the Olympus ZDC unit (Z-drift correction), you will
need to set two properties: the ObjectiveTypeSetting and the SearchRange
(a size in microns). Choose MeasureOffset-&gt;Now to fix your current z
offset, and then running autofocus will return the focus drive to that
offset.

{% include notice icon="info" content="For the BX61, currently only one filter wheel is supported, which is connected to FW1 port on the controller." %}

{% include Listserv_Search text="Olympus" %}
</div>
