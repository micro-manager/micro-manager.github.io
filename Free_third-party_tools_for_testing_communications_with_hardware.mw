__NOTOC__
== Terminal (serial) communications on Windows and Mac ==

=== Windows ===
* Hyperterminal.  Hyperterminal is included with Windows XP, but not available on Windows 7.  We have  [https://valelab.ucsf.edu/~MM/MMwiki/index.php/Windows Instructions] for configuration of Hyperterminal
* [http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html Putty] is mainly intended for ssh communication, but can also be used to communicate through serial ports. (Works on Windows 7.)
* [http://ttssh2.sourceforge.jp/index.html.en TeraTerm] is another serial terminal.
* [http://realterm.sourceforge.net/ Realterm] is designed for testing and is therefore good for debugging hardware, particularly if the commands are binary (not ASCII).

=== Mac ===

There are several alternatives for a serial terminal on OS X.

* Use the Terminal app with a utility named [http://hints.macworld.com/article.php?story=20061109133825654 screen] (both of which are supplied with OS X). Here is a Apple Script that sets up screen:

     tell application "Terminal"
        do script with command "screen /dev/tty.KeySerial1"
        set number of rows of window 1 to 100
        set number of columns of window 1 to 80
        set background color of window 1 to "black"
        set normal text color of window 1 to "green"
        set custom title of window 1 to "SerialOut"
     end tell

* [http://freeware.the-meiers.org/ CoolTerm] This is a free serial terminal emulator that works very well.
* [http://syncterm.bbsdev.net/ SyncTERM] This is another free serial terminal emulator that is available for many operating systems. However is looks distinctly like a port from DOS, even when running on OS X!
* [http://kulesh-software.com/Software/PortTerm/index.html PortTerm] is an application for communicating with external hardware via a serial port under Mac OS X ($20, displays communication in either hex or asci, PPC only but will run under Rosetta)

==Device signals analysis==

Competent hardware manufacturers provide detailed, complete documentation on how to programmatically control their devices. In some cases, when good documentation is not available, it is necessary to analyze and test signals being sent between a device and the computer, or between different software components. A number of free tools are available for this purpose:

* [http://www.serial-port-monitor.com/ '''Free Serial Port Monitor'''] (Windows) allows you to listen in on all messages sent on COM ports.
* [http://www.wireshark.org/ '''Wireshark'''] (Windows, Mac, Linux) allows you to monitor traffic on a large variety of communications protocols, including TCP/IP and USB.
* [http://www.wingmanteam.com/usbsnoopy/ Snoopy] monitors USB traffic and works amazingly well! Windows only.
* [http://www.dependencywalker.com/ '''Dependency Walker'''] (Windows) lets you inspect DLLs and other binary code for function names and function calls. A similar program is [http://www.nirsoft.net/utils/dll_export_viewer.html '''Nirsoft DLL Export Viewer'''].

{{Devices_Sidebar}}
