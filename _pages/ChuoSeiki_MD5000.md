== [[ChuoSeiki]] MD5000 ==

<table>
<tr><td>'''Summary:'''</td><td>Micro-Manager device adapters for MD5000-series controllers</td></tr>
<tr><td>'''Author:'''</td><td>[https://micro-manager.org/wiki/User:Nowt75 Naoto Hirose] ([http://www.chuo.co.jp/english/ Chuo Precision Industrial Co.,LTD.])</td></tr>
<tr><td></td><td>Duong Quang Anh ([http://www.chuo.co.jp/english/ Chuo Precision Industrial Co.,LTD.])</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>All (uses virtual serial via USB interface)</td></tr>
<tr><td>'''Devices:'''</td><td>2-Axis: MD5230D</td></tr>
<tr><td>              </td><td>1-axis: MD5123D </td></tr>
<tr><td>'''Available since version:'''</td><td> 1.4.23 20181215 ([[Nightly Builds]])</td></tr>
</table>
-----------------------------------------------------

The <b>MD5000 series controllers</b> use a virtual serial port via the USB interface. You have to install the MD5000 USB driver before using. You can also install the MD51_52OPTOOL to customize some parameters that can not be changed in Micro-Manager (such as acceleration time, motor current, sensor settings, home-search settings, etc.).

Please click here [https://micro-manager.org/wiki/File:MD5000USBdriver.zip] to download the <b>MD5000 USB driver</b> and here [https://micro-manager.org/wiki/File:MD51_52OPTOOL.zip] for the <b>MD51_52OPTOOL</b> software.

To download the <b>MD5000 user manual</b>, please follow this link [http://www.novaelec.co.jp/eng/down/file/md515230de.pdf]

The <b>ChuoSeiki MD5000</b> device adapter can control one or more MD-controllers. You can register multi adapters in <em>Hardware Configuration Wizard</em> with different serial ports (USB-virtual), and each device adapter drives one controller via one serial port.

The Serial port settings are as following:

'''Serial port settings'''
{| class="wikitable"
|Baudrate            ||115200 ||bps
|-
|DataBits            ||8      ||bits
|-
|StopBits            ||1      ||bit
|-
|ParityBits          ||None   ||bit
|-
|AnswerTimeout       ||500    ||ms
|-
|DelayBetweenCharsMs ||0.00   ||ms
|-
|Handshaking         ||OFF    ||
|}

<table>
<tr><td>'''Device Adapter Initilization'''</td></tr>
<tr><td>The "ChuoSeiki MD 2-Axis||XY stages" asks to register the Serial port and Serial port settings.</td></tr>
<tr><td>The "ChuoSeiki MD 1-Axis||Z stages" asks to register the Serial port, Serial port settings, and Axis name (or controller channel name).</td></tr>
</table>

'''Default Stage Settings'''
{|  class="wikitable"
|Speed               ||1000 ||pps
|-
|StepSize            ||1    ||um    
|-
|Acceleration pattern||"1" ||(0 ms)
|}

<em>Please customize your stage settings using <em>Group</em> and <em>Preset settings</em> in Micro-Manager. Or you can load the setting from a saved .cfg file.</em>

{{Note|'''Axis Name Registration'''}}

The "ChuoSeiki MD 2-Axis||XY stages" supports only the 2-axis controller (MD5230D). In this device adapter, the 2 stages names are defined as "X" and "Y", respectively. It uses some functions that work only on MD5230D controller.

The "ChuoSeiki MD 1-Axis||Z stage" supports the 1-axis controller (MD5130D) or controls 1 channel of the MD5230D. The axis name can be defined when initializing the device adapter. For MD5130D, the axis name must be set as default ("X"). For MD5230D, the axis name can be defined as "X" or "Y", depends on which channel is connected to the Z-stage.

{{Note|'''Acceleration Pattern'''}}

In Device adapter, the Acceleration pattern (include acceleration and deceleration times) can be changed from "1", "2", "3" and "4". They correspond to the 4 acceleration times that are registered in Controller speed settings 1,2,3 and 4, respectively. To use a customized acceleration time, please change and register using MD51_52OPTOOL software.

Default Acceleration pattern:
{|  class="wikitable"
|Pattern  ||Acceleration time   || Deceleration time 
|-
|| "1"    || 0 (ms)             ||0 (ms)
|-
|| "2"    || 500 (ms)           || 0 (ms)
|-
||  "3"   || 500 (ms)           || 0 (ms) 
|-
||  "4"   || 500 (ms)           || 0 (ms)
|}

{{Note|'''Step Resolution'''}}

The default step resolution registered in MD51_52OPTOOL is 20 um, please change this parameter in the first use.

The Step resolution (step zise) can be initialized to the controller using MD51_52OPTOOL or be registered in Micro-Manager. Therefore, be carefull with the interpolation error if the step resolution is registered two times.
<table>
<tr><td>For example, in case of your step resolution is 2 um:</td></tr>
<tr><td>- If you registered 2 um in the MD51_52OPTOOL, then please set step resolution = 1 in the device adapter.</td></tr>
<tr><td>- If you registered 1 um in the MD51_52OPTOOL, then please set step resolution = 2 in the device adapter.</td></tr>
</table>
