You can use Matlab to run and control the Micro-Manager gui and core. Here's how (examples shown using version 1.4.11; use the most recent version you have installed):

1. In Matlab, type
 >> edit classpath.txt
and add the following lines, adjusting the path if necessary:
 C:/Program Files/Micro-Manager-1.4.11/ij.jar
 C:/Program Files/Micro-Manager-1.4.11/plugins/Micro-Manager/MMCoreJ.jar
 C:/Program Files/Micro-Manager-1.4.11/plugins/Micro-Manager/MMJ_.jar
 C:/Program Files/Micro-Manager-1.4.11/plugins/Micro-Manager/bsh-2.0b4.jar
 C:/Program Files/Micro-Manager-1.4.11/plugins/Micro-Manager/swingx-0.9.5.jar
 C:/Program Files/Micro-Manager-1.4.11/plugins/Micro-Manager/swing-layout-1.0.4.jar

you will need the additional items below in the classpath.txt to use the multi-image file format: 

 C:/Program Files/Micro-Manager-1.4.11/plugins/Micro-Manager/ome-xml.jar
 C:/Program Files/Micro-Manager-1.4.11/plugins/Micro-Manager/loci-common.jar
 C:/Program Files/Micro-Manager-1.4.11/plugins/Micro-Manager/scifio.jar
 C:/Program Files/Micro-Manager-1.4.11/plugins/Micro-Manager/slf4j-api-1.7.1.jar

2. Again in Matlab, type
 >> edit librarypath.txt
and add the line:
 C:/Program Files/Micro-Manager-1.4
3. Restart Matlab. Now type the following at the command prompt:
 >> cd 'c:/program files/Micro-Manager-1.4'
 >> import org.micromanager.MMStudio;
 >> gui = MMStudio(false);
 >> gui.show;
 >> mmc = gui.getCore;
 >> acq = gui.getAcquisitionEngine;
Now you have [https://valelab.ucsf.edu/~MM/doc/mmstudio/org/micromanager/api/ScriptInterface.html gui], [https://valelab.ucsf.edu/~MM/doc/mmcorej/mmcorej/CMMCore.html mmc], and [http://micro-manager.org/content/doc/mmstudio/org/micromanager/api/AcquisitionEngine.html acq] objects that you can control from Matlab, very similar to how you would in [[Example_Beanshell_scripts|Beanshell scripts]].

On Mac OS X, current versions of Matlab have a bug that causes Micro-Manager to fail on startup.  To work around this bug, issue the following command before starting the Micro-Manager GUI:

>> java.lang.System.clearProperty('java.util.prefs.PreferencesFactory')

(Reported by Paul Andrews, work around suggested by The Mathworks support).

{{Programming_Sidebar}}
