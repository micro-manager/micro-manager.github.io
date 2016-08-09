== PeCon Series 2000 Incubation Controllers Adapter ==

<table>
  <tr>
    <td>'''Summary:'''</td>
    <td>Controls PeCon Series 2000 Incubation System Devices</td>
  </tr>
  <tr>
    <td>'''Author:'''</td>
    <td>[[User:Csachs|Christian Sachs]] ([https://github.com/csachs @csachs])</td>
  </tr>
  <tr>
    <td>'''License:'''</td>
    <td>BSD (2-clause/FreeBSD license)</td>
  </tr> 
  <tr>
    <td>'''Devices:'''</td>
    <td>[http://www.pecon.biz/?page_id=2501 TempController&nbsp;2000-1], [http://www.pecon.biz/?page_id=2499 TempController&nbsp;2000-2],  [http://www.pecon.biz/?page_id=4146 CO<sub>2</sub>–Controller&nbsp;2000], [http://www.pecon.biz/?page_id=4124 CO<sub>2</sub>–O<sub>2</sub>–Controller&nbsp;2000]
    </td>
  </tr>
</table>

Device Adapter for [http://www.pecon.biz/ PeCon] [http://www.pecon.biz/?page_id=126 Series 2000] Incubation Controllers (Temperature/Gas, connected via USB). Available in the nightly builds as of August 04, 2016. The Device Adapter is built as a hub device, which enumerates all connected PeCon Series 2000 controllers.

You can control the desired value (''Setpoint''), read the current value (''ActualValue''), and set whether the controller should control towards the setpoint (''LoopControl''). 

Status of the device and control channel is available in three variants: ''Numeric'' as numeric value and ''Identifier'' as short string value for scripting usages, and ''Message'' as human readable message.

Keypad access can be blocked by ''KeypadBlocked'', however to retain the lock, the device must be queried (by reading the ''Status'' properties) at least every 5 seconds.

Thanks go to Dr. Oliver Merk of PeCon for providing the SDK as well as for testing and discussions. If you encounter any error, please contact the author.

{{Devices_Sidebar}}
