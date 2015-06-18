== Adapter for the Agilent Monolithic LaserCombiners (MLC400 and MLC400B) ==

<table cellspacing=3><tr><td>
'''Summary:'''</td><td valign="top">Interface to [http://www.home.agilent.com/agilent/techSupport.jspx?cc=US&lc=eng&nid=-33361.917948&pid=1765735&pageMode=OV Agilent Monolithic LaserCombiners]</td></tr>
<tr><td>'''Author:'''</td><td>Nico Stuurman</td></tr>
<tr><td>'''Platforms:'''</td><td>Windows 32 and 64 bits</td></tr>
<tr><td>'''Devices:'''</td><td>MLC400 and MLC400B</td></tr>
<tr><td>'''Requires:'''</td><td>LaserCombinerSDK DLL provided by Agilent</td></tr>
<tr><td>'''Available since version:'''</td><td>1.4.11</td></tr>
</table>


----
The Agilent Monolithic LaserCombiner can be controlled either using external signals (digital and analogue control of the individual laserlines) or using an internal micro-controller board that interfaces to the computer through USB.  The internal micro-controller board lets you set the intensity and on/off states of the individual laser lines directly, and controls the safety shutter, ND filters and fiber switcher (if your unit has these).  In addition, the board can tightly synchronize light output with an external trigger (usually provided by the camera, signalling camera exposures).  The adapter and board support the Micro-Manager sequence interface that can be used to change the wavelength of the light output at very high speeds, synchronized with camera exposures.  

To use the adapter, you will need to copy the dll named "[https://valelab.ucsf.edu/svn/micromanager2/trunk/DeviceAdapters/AgilentLaserCombiner/lib/LaserCombinerSDK.dll LaserCombinerSDK.dll]" (for 32 bit Windows) or "[https://valelab.ucsf.edu/svn/micromanager2/trunk/DeviceAdapters/AgilentLaserCombiner/lib/LaserCombinerSDK64.dll LaserCombinerSDK64.dll]" (for 64 bit Windows) into the Micro-Manager directory.  Select the LC-Shutter and LC-SafetyShutter devices.  It is most practical to add the LC-SafetyShutter-State property to your System-Startup group and open it there.  Make sure that the LC-Shutter is set to internal control.  If synchronization with the external trigger does not work (i.e., LC-Shutter is open, laserline is selected, external trigger property is on,  TTL trigger is provided on the external trigger input, and no light comes out of the fiber, then you will need an updated version of the firmware (contact Agilent).  

Modifications to this adapter on August 23 broke compatibility with earlier configuration files.  If you update, please build a new configuration file.
