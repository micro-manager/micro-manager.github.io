The following instructions for debugging Micro-Manager's Java code with NetBeans are intended to work on Windows or Mac. Updated for 2.0-gamma

(See also: [[Writing plugins for Micro-Manager]])

# Download and install a recent Micro-Manager nightly build. We will refer to the installed Micro-Manager directory as <code>$INSTALLDIR</code> below.
<!--
-->
# Use [http://subversion.tigris.org/ Subversion] to download a copy of the latest [http://micro-manager.org/wiki/Micro-Manager_Source_Code Micro-Manager source]. We'll refer to the root source directory as <code>$SRCDIR</code> below.<!--
-->
# Download, install and run [http://netbeans.org NetBeans]. The Java SE Bundle is sufficient if you already have the JDK (Java Development Kit) installed on your computer. Otherwise, download a JDK from [https://adoptopenjdk.net/ AdoptOpenJDK] . Micro-Manager is currently developed with JDK 8.
<!--
-->
# Choose '''File''' > '''New Project...''' >  [Categories] '''Java''' > [Projects] '''Java Project with Existing Sources'''. Press '''Next'''.
<!--
-->
# Give your project a name. The '''Project Folder''' is best saved outside of the Micro-Manager source directory. Press '''Next'''.
<!--
-->
# Under '''Source Package Folders''', click '''Add Folder''' at right and browse to <code>$SRCDIR/mmstudio/src/main/java</code>, as well as <code>$SRCDIR/mmstudio/src/main/resources</code>. If you want to develop a plugin, you can also add <code>$SRCDIR/plugins/*/src/main/java</code> at this time. You can also add plugins later. Press '''Next'''.
<!--
-->
# Include all files ('''**'''). Press '''Finish'''.
<!--
-->
# Right-click your project in the '''Projects''' tab (probably at left) and select '''Properties'''.
<!--
-->
# Select '''Libraries''' under '''Categories'''. Make sure the '''Java Platform''' matches the version of Micro-Manager you are using (e.g., 64-bit JDK 1.8 - but using a newer Java Platform in NetBeans than the one shipped with Micro-Manager is usually okay).
<!--
-->
# Under '''Compile''' > '''Compile-time Libraries''', click '''Add Jar/Folder''' and add <code>$INSTALLDIR/ij.jar</code>, as well as  all jars in <code>$INSTALLDIR/plugins/Micro-Manager</code> ''except for'' <code>MMJ_.jar</code>.
<!--
-->
# Select '''Run''' under '''Categories'''. For the <default config>, set the following parameters:
<!--
-->
#* '''Main Class:'''  type in <code>ij.ImageJ</code>
<!--
-->
#* '''Working Directory:''' type in your <code>$INSTALLDIR</code>
<!--
-->
#* '''VM options:''' for 64 bit systems, type in <code>-Xmx3000M</code>, otherwise use <code>-Xmx600M</code>. This sets the maximum memory (megabytes) used by Java. If running Micro-Manager 2.0, you also need to supply <code>-Dforce.annotation.index=true</code>.
<!--
-->
# Click '''OK''', and then right-click your project and choose '''Debug'''. If all is well, then Micro-Manager should launch inside ImageJ.

{{Note|The components from the installed Micro-Manager can get out of sync with the Subversion source. If you encounter unexpected errors, update to the latest nightly build and the latest source revision.}}

{{Programming_Sidebar}}
