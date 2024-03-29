---
autogenerated: true
title: OlympusIX81
redirect_from: /wiki/OlympusIX81
layout: page
---

## Olympus IX81/ BX61 adapter

<table cellspacing=3>
<tr>
<td markdown="1">

**Summary:**

</td>
<td markdown="1" valign="top">

Controls Olympus IX81/ BX61 microscope

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


<div markdown="1">
These serial port settings require all DIP switches on the front of the
"Frame Control Unit" (the box connected to the serial cable) to be in
their default position: off (zero).

BX61 specific notes: Currently only one filter wheel is supported
(connected to FW1 port on the controller).
</div>
