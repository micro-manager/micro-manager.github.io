'''An Andor camera and an automated Nikon microscope under Windows 7 x64''' <br />
Christian Hentrich, 9/2011<br />
hentrich@molbio.mgh.harvard.edu

{{Note|This page is more about the specific devices mentioned below than Micro-Manager itself, and may be out of date even when concerning those devices. --[[User:Mark Tsuchida|Mark Tsuchida]] ([[User talk:Mark Tsuchida|talk]]) 16:02, 17 September 2013 (PDT)}}

The obvious advantage for using 64 bit in Micro-Manager is the larger amount of memory one can assign to ImageJ/Micro-Manager, as the 2GB per process limit for 32 bit Windows can be very restricting.

This guide is tested for Andor cameras that connect via USB (in this case a Luca R) and an automated Nikon microscope that is also connected via a single USB cable (Nikon Ti Hub, as for example on an Eclipse Ti). In my case the shutters (Sutter) are also controlled via this hub. It might also work with similar equipment. In this guide Windows 7 x64 Professional is used, and Windows 7 x64 Ultimate or Enterprise will also work. I am not sure if it will work with the home edition.

You should have advanced Windows experience and of course Admin privileges.
You need the following files to begin with:
*	Andor_SDK_X.XX.XXXXX.X.zip, 
*	Ti_SetupTool_VerXXX_64bit_E.zip
(these two you should get directly from Andor and Nikon) and
*	MMSetup64BIT_X.X.X.exe
(from the Micro-Manager homepage). X stands for a number.
In this case, the files used were Andor_SDK_2.91.30000.0.zip, Ti_SetupTool_Ver432_64bit_E.zip and MMSetup64BIT_1.4.6.exe.

1. Install Micro-Manager <br />

2. Locate the Micro-Manager directory (by default c:\program files\Micro-Manager-1.4 )<br />

3. Select the directory, right click and select properties (of the folder)<br />

4. Select the tab "Security"<br />

5. Press "Edit"<br />

6. Select Users in the top box<br />

7. Select "Full Control" in the left column of the bottom box (under "allow") and press apply.<br />

8. Close the dialogue<br />

This allows Micro-Manager to write into its own directory, otherwise it will complain and not remember settings.<br />

9. Extract the zip files of the Andor and Nikon drivers to individual folders (right click, extract all, "Extract").<br />

10. Install the Andor drivers by starting "Setup.exe" in the Andor directory. Choose the 64 bit version.<br />

11. Install the Nikon drivers by starting "Setup.exe" in the Nikon directory.<br />

In an ideal world we would be done by now, however the 64 bit drivers for both devices are not signed, as you will notice when you try to connect the USB cables of both devices now (they fail to install). Fortunately Microsoft has left open a back door for cases like this. But it's rather complicated.<br />

12. Go to the Start menu, click on "All programs", click on "Accessories" and the right click on "Command prompt". Choose "Run as Administrator". Then type into the command window:<br />
bcdedit /set loadoptions DDISABLE_INTEGRITY_CHECKS <br />
Confirm with Enter.<br />

13. Type "user account" into the start menu (that appears when you press the little windows logo) search box. Select "Change User Account Control Settings" from the results to open up the UAC control panel.<br />

14. Select the lowest setting on the slider and press OK, and acknowledge all the warnings.<br />

15. Download the latest version of the Driver Signature Enforcement Overrider from http://www.ngohq.com/home.php?page=Files&go=cat&dwn_cat_id=34 . In this case the file used was dseo13b.exe. Some virus scanners will give you a warning for this file as it allows deeper system access than a user typically should have. It is safe to ignore this warning. If you are paranoid, upload the file to an online virus scanner like http://www.virustotal.com and see for yourself that it is a false alarm.<br />

16. Start this tool (in my case dseo13b.exe).<br />

17. Once you are past the warnings and in the main menu, select the top option "Enable Test Mode", press next and confirm.<br />

18. Reboot<br />

You are now in "Test Mode", which software developers use to test their latest drivers. Until Andor and Nikon come up with better drivers, you'll need to run Windows in this mode.<br />

19. Again start the Driver Signature Enforcement Overrider tool (in my case dseo13b.exe).<br />

20. Select "Sign a System File"<br />

21. Type in C:\Windows\System32\drivers\libusb0.sys (this is the Andor Driver) and confirm with ok.<br />

22. Again start the tool and choose "Sign a System File"<br />

23. Type in C:\Windows\System32\drivers\micusb.sys <br /> 
(this is the Nikon Driver) and confirm with ok.<br />

NOTE: These are the two filenames of the drivers for the current versions. If these files are not found, the file names might have changed. To find out the new names, connect the USB cables to the computer. The drivers will fail to load. Then type "event" in the windows 7 start menu and select "Event viewer" from the programs. There should be entries under the category "Audit Failure" in the central pane. Click on the Plus sign and double click on the entry that pops out, Now you should have a listing of the events where a driver failed to load due to lack of signature and the file names should be displayed centrally for each event. Just replace "\Device\HarddiskVolumeX" with "C:"<br />

24. Reboot<br />

25. '''Congratulations''', you are done; all drivers should work now and can be integrated into Micro-Manager. If you are annoyed by the "Test mode" watermark on the desktop, you can start the Driver Signature Enforcement Overrider tool again, select "Remove Watermarks" and follow the instructions that come up (you need to download another tool). Finally you should re-enable the UAC to the second highest setting (see steps 13-14).<br />


Acknowledgements: <br />
Techspot forum: http://www.techspot.com/vb/topic127187.html<br />
