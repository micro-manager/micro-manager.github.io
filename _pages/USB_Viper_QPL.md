== QiOptiq iFLEX - Viper ==

<table><tr><td>
'''Summary:'''</td><td>Adapter for the iFLEX-Viper light source</td></tr>
<tr><td>'''Author:'''</td><td> Tom Porter (Excelitas)</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows</td></tr>
<tr><td>'''Devices:'''</td><td>iFLEX-Viper</td></tr>
</table>

== Device Configuration ==
To enable the driver:
# Download and install InstaCal from measurement computing. http://www.mccdaq.com/software.aspx
# Restart your computer
# In the Measurement Computing Folder, run InstaCal.
# InstaCal will find a USB-3103 board, add to the configuration file.
# When the board is added in InstaCal, ensure the board identifier # is 0.
# If the board # is not 0, right click on the USB-3103 device and select "Change Board#..."
# Start Micro Manager and the USB_Viper_QPL will be selectable.

{{Devices_Sidebar}}
