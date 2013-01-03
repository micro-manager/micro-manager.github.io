== Zeiss AxioCam MR/HR Adapter ==

<table><tr><td>
'''Summary:'''</td><td>Interfaces Zeiss AxioCam medium resolution and high resolution color and monochrome cameras</td></tr>
<tr><td>'''Author:'''</td><td>Henry Pinkard</td></tr>
<tr><td>'''License:'''</td><td>Source code cannot be made available</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows</td></tr>
<tr><td>'''Devices:'''</td><td>AxioCam MRm/MRc/HRm/HRc, MRm/MRc/HRm/HRc Rev. 2, and MRm/MRc/HRm/HRc Rev. 3 (only tested with Rev. 3 cameras) </td></tr>
</table>


Because of built in delays in the AxioCam's image acquisition, there is a delay of approximately 200ms between when Micro-Manager sends the command to open the shutter and when the AxioCam's exposure begins. If over exposure of the sample is a concern, it is highly recommended that hardware triggering is used with these cameras. Refer to the below descriptions of hardware triggering to do so (All images and text below ©2010 Carl Zeiss MicroImaging GmbH. All rights reserved.).


<h2>Trigger-Out</h2>

<p>Via a supplementary cable the AxioCam has the capability of sending out a
TTL trigger pulse to an external device, for example a mechanical shutter. This
trigger pulse can be used to synchronize
the exposure of the camera and the task of the external device, as you can
specify the delay between sending out
the trigger signal and actually starting the acquisition.</p>

<p>To meet the requirements of the device you are using, you can
invert the polarity that you want the
signal to have.</p>

<h2>'''Trigger-In'''</h2>

The exact time of exposure can be triggered from outside the camera. When the trigger-in is enabled and an acquisition function is called, the camera will delay the acquisition and wait for a trigger-in signal to be sent from an external device until it invokes the exposure.
The following graphic demonstrates the two camera models' reaction to the trigger signal when performing a triggered acquisition. An acquisition request is sent out at each '''T''', the acquisition takes place at an '''A''':
[[Image:AxioCamFig1a.png]]

[[Image:AxioCamFig1b.png]]

NOTE: The trigger OUT of the AxioCam HR / MR expects a TTL signal.



<h2>Trigger Timing</h2>

<p>Due to different hardware and trigger mechanisms, the precise calculation of
the camera's timing when involvong the trigger IN / OUT is a bit difficult and
depends on the camera model's internal design.</p>

<p>The following charts demonstrate, how an example acquisition using both
trigger IN and trigger OUT could look like and explain how to precisely
calculate the timing.</p>

<table border=1 bordercolor=#999999 cellpadding=5 cellspacing=0
       style='margin:10pt 20pt 10pt; font-family:sans-serif; font-size:9pt'>
<tr>
<td bgcolor=#CCCCCC><b>AxioCam HR / MR</b></td>
</tr>

<tr>
<td>The AxioCam HR / MR accepts only positive values for the trigger OUT delay, ranging from 0 to 255 row cyles,
where 1 cycle lasts 154 &micro;s (AxioCam HR) respectively 99 &micro;s (AxioCam MR).<br />
When the delay is set, the trigger OUT signal is sent prior to exposing the CCD sensor. The camera takes the
following steps when performing an acquisition using trigger IN and OUT:<br />
<ul>
<li>receive acquisition call (snap)</li>
<li>wait for trigger IN signal to arrive</li>
<li>send trigger OUT signal</li>
<li>delay the exposition (0-255 row cycles)</li>
<li>acquire</li>
</ul></td>
</tr>

</table>


[[Image:AxioCamFig2.png]]



<table border=1 bordercolor=#999999 cellpadding=5 cellspacing=0
       style='margin:10pt 20pt 10pt; font-family:sans-serif; font-size:9pt'>

<tr>
<td bgcolor=#CCCCCC><b>AxioCam MRc5 / MR Rev.3 / HS</b></td>
</tr>

<tr>
<td>The AxioCam MRc5 / MR Rev.3 / HS allows both positive and negative values for the trigger OUT delay, ranging from +4095 row cycles
to -4095 row cyles, where 1 cycle lasts 244 &micro;s.<br />
&nbsp;<br />
A <b>negative</b> delay means sending the trigger OUT signal prior to exposing the sensor (like AxioCam HR/MR).<br />
A <b>positive</b> delay means sending the trigger OUT signal after starting the exposition of the CCD sensor.<br />
&nbsp;<br />
<u>Sensor cleanout:</u><br />
&nbsp;<br />
Before the AxioCam MRc5 / MR Rev.3 / HS is able to acquire an image, a certain 'cleanout time' is required to erase any existing data
from the CCD sensor. When an acquisition call has been sent by the user / program and the trigger IN signal is being
received, the camera needs about 6.5 ms of processing time. Now the initialization takes place, including a fixed 1ms
delay (4 idle rows) and the sensor cleanout time, which depends on the current exposure time. A simplified formula for
the cleanout time is:<br />
&nbsp;<br />
cleanout time = ( 1003 - (exposure time - 1) * binning factor ) / 23&nbsp;&nbsp;&nbsp;&nbsp;<em>[ unit: row cycles = 250 &micro;s ]</em><br />
&nbsp;<br />
<u>Note:</u> when the exposure time is set to 1004 row cycles ( approx. 251ms ) or more, the cleanout time will be zero.</td>
</tr>


<tr>
<td bgcolor=#CCCCCC>- negative delay<br />
</tr>

<tr>
<td>If the specified trigger OUT delay is longer than the interval for the fixed idle rows and clearing the sensor,
the trigger OUT is sent directly after the initialization has been completed. The camera performs the cleanout
and then waits an appropriate amount of time until the exposition is invoked.<br />
<ul>
<li>receive acquisition call (snap)</li>
<li>waits for trigger IN signal to arrive</li>
<li>approx. 6.5 ms processing time</li>
<li>send trigger OUT signal
<li>finish idle rows and sensor cleanout</li>
<li>wait delta( trigger OUT delay - idle rows - cleanout time )</li>
<li>start acquisition</li>
</ul></td>
</tr>

</table>


[[Image:AxioCamFig3.png]]


<table border=1 bordercolor=#999999 cellpadding=5 cellspacing=0
       style='margin:10pt 20pt 10pt; font-family:sans-serif; font-size:9pt'>
<tr>
<td>If the specified trigger OUT delay is shorter than the interval for the fixed idle rows and clearing the sensor,
the camera starts the sensor cleanout right after the initialization was finished and delays sending the trigger
OUT signal to achieve the desired trigger OUT delay.<br />
<ul>
<li>receive acquisition call (snap)</li>
<li>waits for trigger IN signal to arrive</li>
<li>approx. 6.5 ms processing time</li>
<li>start idle rows and sensor cleanout</li>
<li>wait delta( idle rows + cleanout time - trigger OUT delay ), then send trigger OUT
<li>start acquisition</li>
</ul></td>
</tr>

</table>


[[Image:AxioCamFig4.png]]


<table border=1 bordercolor=#999999 cellpadding=5 cellspacing=0
       style='margin:10pt 20pt 10pt; font-family:sans-serif; font-size:9pt'>

<tr>
<td bgcolor=#CCCCCC>- positive delay</td>
</tr>

<tr>
<td><ul>
<li>receive acquisition call (snap)</li>
<li>waits for trigger IN signal to arrive</li>
<li>approx. 6.5 ms processing time</li>
<li>sensor cleanout</li>
<li>start acquisition</li>
<li>delay the trigger OUT and send it</li>
</ul></td>
</tr>

</table>


[[Image:AxioCamFig5.png]]



--[[User:Henry Pinkard|Henry Pinkard]] 10:58, 1st October 2012 (PDT)

{{Listserv_Search|AxioCam}}


{{Devices_Sidebar}}
