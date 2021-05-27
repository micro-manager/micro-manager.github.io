{{Note|These instructions are not up to date. If you are just looking for a way to use a Java IDE, see the instructions for [[Using Netbeans]].}}

# Download and install [http://www.eclipse.org/ Eclipse Kepler].  It was formerly claimed that ne can't use the newer Luna, Mars, etc releases, as those [https://wiki.eclipse.org/Eclipse/Installation rely on JDK 1.7], whereas we are limited JDK to 1.6 due to ImageJ.  However, you can use the newer Eclipse releases and in the project settings under "Java Compiler" set it to use a project-specific setting requiring compliance with 1.6.
<!--
-->
# Start Eclipse, when prompted set the workspace to a new directory (NOT the Micro-Manager source).
<!--
-->
# Create a new Java Project (File->New->Other).
<!--
-->
# Select 'Create project from existing source' and specifiy the 'mmstudio' directory in the Micro-Manager source. Newer versions of Eclipse (i.e. Helios) do not have this option. Instead use the 'Java Project from Existing Ant Buildfile' option, select the 'mmstudio/build[32/64].xml' file to suit your platform. Name the project (for instance: 'Micro-Manager1.4').  Click 'Next'.
<!--
-->
# In the Java settings screen, add the following external jars (if they have not been included already) under the 'Libraries' tab: ij.jar, bsh-2.0b4.jar, clojure.jar, clojure-contrib.jar, commons-math-2.0.jar, swing-layout-1.0.4.jar and swingx-0.9.5.jar.  These can be found in the '3rdpartypublic/classext' directory that must reside alongside your MM source code. Also add 'MMCoreJ.jar'.  This can be found in the 'bin' directory of your Micro-Manager source on Windows, or in the MMCoreJ_wrap directory on Mac and Linux. Expand the 'MMCoreJ.jar' entry in the 'Libraries' tab and edit the 'Native library location' such that is points to the root directory of your MM source code.
<!--
-->
# The source code should now compile without errors (but with warnings).
<!--
-->
# Setup the runtime environment: Open the project's properties (Project->Properties), select the 'Run/Debug Settings' and click 'New'.  Select 'Java Application'.  For 'Main Class' select 'MMStudioMainFrame'.  Under 'Arguments', set the Working directory' to the bin folder in your Micro-Manager source directory. 
<!--
-->
# When all is good, you can start Micro-Manager (without ImageJ window) by pressing the green arrow in Eclipse.
<!--
-->
# To debug C++ code, attach your debugger to the running javaw instance.  In Visual Studio: Debug->Attach to Process, select the appropriate javaw process.  On Unix, use top or ps to find the process and start gdb: gdb Jave processID.

{{Programming_Sidebar}}
