The following instructions for debugging Micro-Manager's Java code with IntelliJ are intended to work on Windows or Mac. Updated for 2.0-gamma

(See also: [[Writing plugins for Micro-Manager]])

# Download and install a recent Micro-Manager nightly build. We will refer to the installed Micro-Manager directory as <code>$INSTALLDIR</code> below.
<!--
-->
# Use git to clone the micro-manager source code [https://github.com/micro-manager/micro-manager]. We'll refer to the root source directory as <code>$SRCDIR</code> below.<!--
-->
# Download, install and run [https://www.jetbrains.com/idea/download IntelliJ Community Edition]. You may also need to download a JDK from [https://adoptopenjdk.net/ AdoptOpenJDK]. Micro-Manager is currently developed with JDK 8 (Java Development Kit 1.8).
<!--
-->
# Choose '''Create New Project'''
<!--
-->
# Name the Project (i.e. Micro-Manager2), and select the JDK (11 may work, but MM is developed with JDK8).
<!--
-->
# Select the project and right click and find "Open Module Settings (F4)".
<!--
-->
# Click on "Add Content Root". From <code>$SRCDIR</code> select '''mmstudio/src/main/java''' and '''mmstudio/src/main/resources'''
<!--
-->
# In the Project Settings dialog, select "Libraries". Use the "+" button in the second column to add libraries.  If you have ant installed and ran '''ant -f buildscripts\fetchdeps.xml'' before, add <code>$SRCDIR/dependencies/artifacts/imagej</code>, <code>$SRCDIR/dependencies/artifacts/compile</code>.  If you did not, you can try adding the plugins/micro-manager directory of your micro-manager installation. You will also need to supply MMAcqEngine.jar and MMCoreJ.jar, which you either build yourself, or that can be found in <code>$INSTALLDIR/polugins/micro-manager</code>.  Click "OK"
<!--
-->
# in the IntelliJ menu, select Run > Edit Configurations. Add new Configuration, type "Application".  
<!--
-->
#* '''Main Class:'''  type in <code>ij.ImageJ</code>
<!--
-->
#* '''VM options:''' type in <code>-Xmx3000M</code>. This sets the maximum memory (megabytes) used by Java .Also add <code>-Dforce.annotation.index=true</code>.<!--
-->
#* '''Working Directory:''' type in your <code>$INSTALLDIR</code>
<!--
-->
# You should now be able to Run and Debug the code.


{{Note|'''Explanation of the  <code>-Dforce.annotation.index</code> option''': Micro-Manager uses Scijava plugins for many of its internal components. In order for plugins to be detected at runtime it is important that the annotation processor is enabled.The <code>-Dforce.annotation.index</code> option will attempt to force to processor to be enabled. Optionally, you could also go to "settings->Build,Execution,Deployment->Annotation Processors" and make sure that "Enable annotation processing" is checked. If you find that the program crashes with a `NullPointerException` on startup you may have forgotten to enable annotation processing.}}


{{Note|The components from the installed Micro-Manager can get out of sync with the source code. If you encounter unexpected errors, update to the latest nightly build and the latest source revision.}}

{{Programming_Sidebar}}
