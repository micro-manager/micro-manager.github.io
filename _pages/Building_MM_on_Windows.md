{{Note|Updated for Visual Studio 2010. The following applies since SVN r11946. --[[User:Mark Tsuchida|Mark Tsuchida]] ([[User talk:Mark Tsuchida|talk]]) 11:15, 10 October 2013 (PDT)}}

== Before you start ==

First make sure you have enough hard disk space. 15 GB is probably enough.


== Setting up the required tools ==

Note that many people do not need to build MM at all, e.g. if you are only using MMCore and not editing it nor the device adapters then most of this doesn't apply to you.

=== Subversion client ===

You will need a [http://subversion.apache.org/packages.html#windows Subversion client]. GUI clients such as [http://tortoisesvn.net/ TortoiseSVN] also work well.

=== Microsoft Visual Studio 2010 SP1 Express ===

{{Note|The official binaries are, for the time being, still built with VS 2010. However, it is possible to build device adapters using any newer version of VisualStudio, and this may be preferred for newer systems where VS 2010 binaries are hard to come by. Device adapters are '''not''' required to be built by the same version of VS as MMCore.  See [http://micro-manager.3463995.n2.nabble.com/Building-Device-Adapters-on-Windows-10-with-Visual-Studio-2015-Community-tp7587098.html this thread] in the mailing list archives about using VS 2015.}}

Micro-Manager's C++ components (Core, MMCoreJ, MMCorePy, and device adapters) are currently built using Visual Studio 2010 Express. To install a complete build environment, follow these instructions (all are free downloads):

# Open Control Panel > "Uninstall a program". If there are any items named '''Microsoft Visual C++ 2010 Redistributable''' with version number greater than 10.0.30319, '''''uninstall''''' them (see the note below for why).
# Install '''Microsoft Windows SDK 7.1 and .NET Framework 4''' (http://www.microsoft.com/en-us/download/details.aspx?id=8279). If installation of the .NET fails, see the notes below.
# Install '''Visual C++ 2010 Express''' from https://www.visualstudio.com/vs/older-downloads/.
# Upgrade to '''Visual Studio 2010 SP1''' (https://www.visualstudio.com/vs/older-downloads).
# '''Repair the compilers''' that come with Windows SDK 7.1 by installing this package: http://www.microsoft.com/en-us/download/details.aspx?id=4422

{{Note|The '''order if installation is important'''. In particular, the SDK 7.1 installer will fail if VS2010 SP1 is installed first. If you are in that situation, the only way out that I have found is to go to Control Panel > "Uninstall a program", uninstall everything with "Microsoft Visual ... 2010" in its name (Redistributable, Runtime, Express, Compilers, Service Pack, Tools for Office Runtime), and start over.}}

{{Note|It is also possible that installation of the Windows SDK can fail (even if you don't have VS2010 installed) if you have a newer version of '''Microsoft Visual C++ 2010 Redistributable''' than the version that the SDK installer tries to install (which is 10.0.30319). The VC++ Redistributable is installed by various programs, including Micro-Manager). }}

{{Note|If the SDK installation fails with '''Fatal error during installation''', you may need to first uninstall the VS2010 redistributables (x86 and x64), uninstall the broken 7.1 SDK install, reinstall the 7.1 SDK and untick "Visual C++ compilers" from the list as mentioned in KB KB2519277. If you are successful, install the VC-Compiler-KB2519277.exe patch afterwards.}}

=== Java Development Kit (JDK) for Java Standard Edition (Java SE) ===

Download and install from [http://java.sun.com/javase/downloads/index.jsp Oracle]. Version 6 or later is required. The official Micro-Manager build currently uses JDK 6.

You do not need the JDK if you are only building device adapters or other C++ components.

=== Apache Ant ===

[http://ant.apache.org/ Apache Ant] is the build tool used to automate the full Windows build of Micro-Manager. Version 1.8.1 or later is required (tested with 1.9.2).

Download the [http://ant.apache.org/bindownload.cgi binary package].

You do not need Ant if you are only building device adapters of other C++ components.

=== Environment variables ===

For building the Java and Clojure components using Ant, the following environment variables need to be set correctly. They can be added in Control Panel > System and Security > System > "Advanced system settings" > "Environment variables...".

* <code>JAVA_HOME</code>: set to the path to your JDK installation, e.g. <code>C:\Program Files\Java\jdk1.6.0_45</code>. Do not add quotes to the value, even if it contains spaces.
* <code>ANT_HOME</code>: set to the path to your Ant installation (whereever you placed the extracted binary package), e.g. <code>C:\apache-ant-1.9.1</code>. Do not add quotes to the value, even if it contains spaces.
* <code>PATH</code>: It is convenient to add Ant to the command search path. You can append <code>;%ANT_HOME%\bin</code> to the end of the System <code>PATH</code> varialbe, or add a User variable named <code>PATH</code> and set its value to <code>%PATH%;%ANT_HOME%\bin</code>.

== Preparing the source code ==

=== Directory layout ===

Create a directory named <code>projects</code> (the name is not important, but we will refer to this name below). The <code>projects</code> directory may reside anywhere you like (but paths containing spaces and special characters should be avoided) and will contain the subdirectories <code>micromanager</code>, <code>3rdpartypublic</code>, and (optionally) <code>3rdparty</code>.

All directories mentioned below that don't start with <code>project</code> are relative to <code>projects\micromanager</code>.

=== Obtaining the source code ===

Checkout the [[Micro-Manager Source Code]] inside the <code>projects</code> directory, using your Subversion client (use git for the 2.0 micromanager source). This should result in the following directories:

 projects\micromanager
 projects\3rdpartypublic

=== Vendor SDKs and libraries ===

If you have third-party libraries (e.g. from device vendors), create the directory <code>projects\3rdparty</code> and place them in an appropriately named subdirectory.

If you are building a device adapter included in the Micro-Manager Subversion repository, and it requires third-party libraries, you will need to place them in the correct directory within <code>projects\3rdparty</code>, as determined by the settings in the Visual Studio project file for the adapter. Alternatively, you can locally edit the build settings in the project file.

(There are cases where the location of a header file is hard-coded (relative to the <code>3rdparty</code> directory) in the source (.h and .cpp) files. This practice is discouraged, but if you encounter it, you might have to edit the path.)


== Building Micro-Manager ==

=== Building the C++ components ===

Open <code>micromanager.sln</code> (in the root of <code>projects\micromanager</code>). Visual Studio will warn you that some projects are missing (they are the closed-source device adapters), but you can ignore that message. Choose the correct configuration (try Release if Debug fails) and platform (Win32 or x64). Then simply right-click the desired projects and select Build.

DeviceAdapters that depend on code in the 3rdparty directory will only build if you download the correct libraries yourself and place them in your own copy of the 3rdparty directory. For legal reasons, we are not allowed to make these libraries public.  In general, however, you may simply ignore DeviceAdapters that do not build because you do not have the correct dependencies.

Note that the built binaries are placed under the directory <code>build</code> at the root of <code>projects\micromanager</code>.

If you build MMCoreJ, <code>MMCoreJ_wrap.dll</code> will be generated. Additionally, Java source files are generated in <code>build\intermediates\Swig\MMCoreJ\</code>. These files are compiled into <code>MMCoreJ.jar</code> in a separate step by Ant (see below).

You can also build all available projects by right-clicking the Solution (at the very top of the Solution Explorer) and choosing Build.

=== Building single device adapters ===

The easiest method to build a device adapter is to use <code>micromanager.sln</code> as described above. However, you may want to be able to work on a single device adapter without seeing all the other projects (which also slow down Visual Studio). You can do so by creating your own solution file (a solution (<code>.sln</code>) file is essentially a container for multiple projects).

Device adapters need to be linked to the MMDevice static library (which itself needs to be built). This is done automatically within <code>micromanager.sln</code>. When building device adapters outside of <code>micromanager.sln</code>, you need to include the required MMDevice project in your solution (even though the required settings are already contained in the device adapter project file (<code>.vcxproj</code>)). To do so:

Open the device adapter project file (e.g. <code>DeviceAdapters\DemoCamera\DemoCamera.vcxproj</code>) in Visual Studio.

Right-click on the Solution, and select Add > Existing Project... (or, equivalently, select File > Add > Existing Project...). Choose <code>MMDevice\MMDevice-SharedRuntime.vcxproj</code>.

At this point, close the solution file (File > Close Solution, or just quit Visual Studio). It will prompt you to save a solution file (.sln). Save it in the default location (next to the device adapter project). Then, reopen either the device adapter project or the newly saved solution (either will have the same result). (This extra step is necessary because Visual Studio does not correctly update its internal state when you add projects that theoretically know their interdependencies.)

Now select the Debug or Release configuration and the Win32 or x64 platform from the drop-down menus (for various reasons, the Debug configuration does not work for all device adapters). If everything is configured correctly as described above, you should now be able to simply select Build.

If you get an LNK1104 error involving <code>MMDevice-StaticRuntime.lib</code> (as opposed to <code>MMDevice-SharedRuntime</code>), you are probably building one of the few device adapters that require this special version of the MMDevice library. Remove the MMDevice-SharedRuntime project from the solution, and add <code>MMDevice\MMDevice-StaticRuntime.vcxproj</code> instead. Reload the solution file, and you should be ready to build.

In Visual Studio 2010 and later, the solution is little more than a list of project files to be built together, so our policy is not to include solution files for each project in the repository (but see below about the master <code>micromanager.sln</code> file).

The build binaries are placed under the directory <code>build</code>, within the device adapter directory (actually, relative to where you saved the solution file).

Some device adapters (those made up of more than one project) may not build correctly by this method. In that case, build it from <code>micromanager.sln</code> as described above.

=== Building MMCorePy ===

First, you need to install Python 2.7 and Numpy 1.7 (different versions, such as Python 2.6, may work if the project settings are appropriately edited).

'''Note for Visual Studio 2010:''' If you are using Visual Studio 10, then MMCorePy must be compiled with a compatible version of the Python27.dll, otherwise importing MMCorePy will crash Python. You will either need to compile Python from source using VS2010, or download an already compiled and compatible Python distribution. The [http://www.p-nand-q.com/python/building-python-27-with-visual_studio.html p-nand-q.com website] has instructions for doing both.

To tell Visual Studio where to find the Python installation, open <code>MMCorePy_wrap\Python.props</code> in a text editor (these settings can be edited in Visual Studio, but it's simpler to explain how to manually edit this file). Find the block that starts with <code>PropertyGroup Label="UserMacros"</code>, which contains a line for <code>PythonDir</code>. Set its value to the path to your Python installation. If you installed Python 2.7 in the default location, you probably just need to remove the <code>-$(Platform)</code> part.

Once this is done, you should be able to build MMCorePy from <code>micromanager.sln</code> by the steps described above. Make sure to select the Release configuration and the platform that matches your Python binaries.

The build will generate <code>_MMCorePy.pyd</code> (the extension module) and <code>MMCorePy.py</code> (the Python wrapper module).

=== Building individual Java components ===

On Windows, Micro-Manager's Java components are built using Apache Ant. Before running the Ant targets described below, you must first run the following command, which downloads some Java libraries required by Micro-Manager:

  ant -f buildscripts/fetchdeps.xml
  ant build-buildtools

Each Java (and Clojure) component has a <code>build.xml</code> (an Ant build script):

  MMCoreJ_wrap\build.xml
  mmstudio\build.xml
  acqEngine\build.xml
  plugins\*\build.xml
  autofocus\build.xml

See below about the required order of building.

To build one of these components, open the Command Prompt, and change to the directory containing the build script. Then type

  ant jar

This should produce the jar file in <code>build\Java</code>. (Ant automatically uses the <code>build.xml</code> file in the current directory.)

For example,

  cd MMCoreJ_wrap
  ant jar

will produce <code>build\Java\MMCoreJ.jar</code>.

Some of the Java components depend on each other. When building the components one by one, you will need to build them in the order listed above (see below for building everything automatically).

To build <code>MMCoreJ.jar</code> (and, by transitive dependency, any of the other Java components), you need to have built the C++ part of MMCoreJ (either in Visual Studio as described above, or using Ant as described below) before running Ant.

Building Clojure components (acqEngine and some of the plugins) requires a loadable <code>MMCoreJ_wrap.dll</code>. "Loadable", in this context, means that it is built for the same architecture (32-bit vs 64-bit) as your Java runtime (on which Ant is running). If you are using a 32-bit JDK but have built MMCoreJ for 64-bit, you will also need to build the 32-bit MMCoreJ_wrap.dll (and vice versa). The MMCoreJ_wrap.dll for the two architectures go in different directories, so there is no harm in building both in the same source tree.

It is possible for the build to drop into an inconsistent state when the source code is updated. The following might fix it (at the root of the source tree):

  ant clean-all
  rmdir /s /q dependencies

Afterwards you will need to go back to the start of this section and re-run <code>ant -f buildscripts/fetchdeps.xml</code>

=== Building all components ===

The master Ant build script (<code>build.xml</code> at the root of the source tree) can be used to build the whole application. It's usage differs from the individual build scripts for each Java component.

Open the Command Prompt, and change to the <code>projects\micromanager</code> directory. Type

  ant -p

This should list a number of options.

To build all C++ components (similar to building the <code>micromanager.sln</code> Solution in Visual Studio), type

  ant build-cpp -Dmm.build.failonerror=false -Dmm.architecture=Win32

Setting the <code>mm.build.failonerror</code> property to <code>false</code> allows the build to continue even if some of the projects (e.g. device adapters that depend on libraries you don't have) fail to build. (But you will want to check that the ones you want did build. Look in the <code>build</code> directory.)

The architecture (what Visual Studio calls 'platform' - but we reserve that term for Windows vs OS X vs Linux) can be set to <code>Win32</code> or <code>x64</code>. By default, it is <code>x64</code> on 64-bit Windows and <code>Win32</code> otherwise.

The command

  ant build -Dmm.build.failonerror=false -Dmm.architecture=Win32

will build everything (all C++, Java, and Clojure compoenets).

There is also a <code>build-java</code> target that you can use to build just the Java and Clojure components (it will not try to build the C++ components).

You can then type

  ant stage-only -Dmm.architecture=Win32

This will construct a near-complete Micro-Manager installation in the <code>stage\Release\Win32</code> directory. The only thing lacking is the Java Runtime; you will need to copy over the <code>jre</code> folder from inside your JDK installation before launching <code>ImageJ.exe</code>. (Note that the <code>ImageJ.cfg</code> file determines where the JRE is searched for.)

To recap, the steps to build everything available with the default architecture are:

  ant -f buildscripts\fetchdeps.xml
  ant build -Dmm.build.failonerror=false
  ant stage-only
  (then copy over jre folder)

The <code>stage</code>, <code>run</code> and <code>package</code> targets are not yet fully implemented for general use (they expect files to be present at specific paths).


{{Programming_Sidebar}}
