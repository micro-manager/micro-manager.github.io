=== Something does not work.  What do I do? ===
1) Try downloading and installing the latest [[Micro-Manager_Nightly_Builds|Nightly Build]] and check if the problem still persists. 

2) If the issue still remains click 'Help' on the main window -> then click 'Report Problem'. 

* In this panel you will need to fill in your name, organization, email and a description of the problem. 

* You will then notice a dialogue in the bottom which will guide you to sending us the report. 

* This report will also consists of a log file and your configuration settings. 

* All of this information will then be packaged and sent to us via email. We will then be able respond back and assist you with a better understanding of your situation.

=As compared to the previous=


=== Something does not work.  What do I do? ===
Download and install the latest [[Micro-Manager_Nightly_Builds|Nightly Build]] and check if the problem still persists. Send an email describing your problem to the [https://lists.sourceforge.net/lists/listinfo/micro-manager-general Micro-Manager mailing list].  Describe your system (OS, attached hardware), and describe the steps that lead to the problem you encounter as well as the error message you see. Include the configuration file that you are using (the *.cfg file you select on startup).  Please do not send screenshots!

If the problem is not resolvable through the email list, you will need to send more debug information. To do so, go to the 'Tools' menu in Micro-Manager and select 'Options...'. Click the 'Clear log file' button and make sure that the 'Debug log enabled' checkbox is checked.  Now repeat the steps that cause the error and then email the entire 'CoreLog.txt' file (in your Micro-Manager directory) to [mailto::info@micro-manager.org info@micro-manager.org] together with your config file and a description of the problem (include the error message on the screen). We will likely need your help to test some code modifications to deal with your problem.

In some cases, even more debug output can be obtained by running Micro-Manager from a command terminal.  On the Mac:<br>
1. open a terminal (Applications/Utilities/Terminal)<br>
2. Type: cd /Applications/Micro-Manager1.3<br>
3. Start Micro-Manager by typing: java -cp ij.jar ij.ImageJ<br>
4. Copy relevant output from the terminal into your email.<br>

On Windows:<br>
1. open a terminal (Start->Run..., type 'cmd', click 'OK')<br>
2. Type: cd "C:\Program Files\Micro-Manager1.3"<br>
3. Start Micro-Manager by typing: jre\bin\java -cp ij.jar ij.ImageJ<br>
4. Copy relevant output from the terminal into your email.<br>

Some problems are only due to missing .dll files required by Micro-Manager's device drivers. To find out whether that is the case, use [http://www.dependencywalker.com/ Dependency Walker] on Windows, ''otool -L'' on MacOSX or ''ldd'' on Linux to determine the status of the dependencies of the Micro-Manager driver (i.e. a file whose name starts with ''mmgr_dal_'' in the Micro-Manager directory).
