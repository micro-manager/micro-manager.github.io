{{Note|This documentation is specific for Micro-Manager 1.4. For Micro-Manager 2.0 plugins, please see [[Version_2.0_Plugins]]. }}

Micro-Manager has a Java-based plugin system similar to ImageJ's. To write a Micro-Manager plugin, simply implement the [https://valelab4.ucsf.edu/trac/micromanager/browser/mmstudio/src/org/micromanager/api/MMPlugin.java <code>MMPlugin</code> interface]. {{Note|The static String <code>menuName</code> lets you control the name of the plugin that appears in the Micro-Manager Plugins menu.}}

Micro-Manager's classpath is set up so that Micro-Manager plugins can import classes from:
# the [http://java.sun.com/j2se/1.6.0/docs/api/ Java 2 SE 6.0 Libraries]
# [https://valelab.ucsf.edu/~MM/doc/mmcorej/index.html Micro-Manager Core]
# [https://valelab.ucsf.edu/~MM/doc/mmstudio/index.html Micro-Manager GUI]
# [http://rsbweb.nih.gov/ij/developer/api/ ImageJ]
# [http://commons.apache.org/math/userguide/overview.html Apache Commons Math]

The MMPlugins API provides you access to the GUI and core instances (objects) already created by Micro-Manager startup. Micro-Manager will call
<code>public void setApp(ScriptInterface app);</code>
you can get the GUI object, core and acquisition engine objects thus:
<div class="source">
    MMStudioMainFrame gui_ = (MMStudioMainFrame) app;
    CMMCore core_ = gui_.getMMCore();
    AcquisitionEngine acq_ = gui_.getAcquisitionEngine();
</div>

Once you have compiled your code into a <code>.class</code> file or a <code>.jar</code> file, drop that file into Micro-Manager's <code>mmplugins</code> directory, and it will be loaded at startup.

The source code for a number of Micro-Manager plugins is publicly available [https://valelab4.ucsf.edu/trac/micromanager/browser/plugins here]. You may also find this [[Media:HelloWorldPlugin.zip|Hello World Example plugin]] useful as a template for getting started.

The use of two common IDEs for plugin development, '''Netbeans''' and '''Eclipse''', are described next. Which IDE you use is a matter of personal preference. (Dennis Trautwein has written [http://trtwn.de/intellij-micro-manager/ a guide for IntelliJ].)


== Using Netbeans ==
{{Note|Here, the text assumes that MicroManager is installed in the <code>C:\Program Files\Micro-Manager-1.4\plugins\Micro-Manager</code> directory. However, in the screenshots, the location is <code>/home/maxime/code/mm/builds/ImageJ</code>.}}
The dynamic loading feature (described above) is useful if you are developing your plugin using an IDE such as Eclipse or Netbeans. (The Micro-Manager distribution includes <code>swing-layout-*.*.jar</code> so that you can use the free Netbeans GUI Builder for your plugin.) Here are the steps for Netbeans:
# Install [http://netbeans.org Netbeans]. Note, Netbeans currently comes with the Java 1.7.0 run time environment. After install, you will need to manually install and add the JRE that Micro-Manager uses: 1.6.0, 64-bit if you need it.  Additionally, if you are developing with JDK 6, you will need [https://netbeans.org/downloads/7.3.1/index.html NetBeans 7.3.1] * as that was the last release compatible with JDK 6 and later versions require JDK 7. *Netbeans 12.0 can be used with JDK 6 on a Mac, but you may need to install a legacy version of JDK 6 if you are using a newer Mac OS. Using JDK 7 may cause plugins to fail to load.
# Select New > New Project... > Java > '''Java Class Library'''. [[File:Netbeans8 new project.png|450px]]
# Name your plugin project and press Finish.
# Under the Projects tab, right-click your plugin project and choose Properties.
# Then choose Libraries > Compile > Add JAR/Folder.
## Browse to <code>C:\Program Files\Micro-Manager-1.4\plugins\Micro-Manager</code> and choose all jars in that directory.
## Click Add JAR/Folder again and add <code>C:\Program Files\Micro-Manager-1.4\ij.jar</code> [[File:Netbeans8 library tab.png|450px]]
## Click Categories > Run and set Main Class to <code>ij.ImageJ</code>, working directory to <code>C:\Program Files\Micro-Manager-1.4\</code> . Click OK. [[File:Netbeans8 run tab.png|450px]]
# Now choose Debug > Debug Project from the Menu and ImageJ/Micro-Manager should launch. Close it for now.
# Right-click your Source Packages in your project, under the Projects tab. Select New > Java Class... and give your plugin a class name and package name.
# Edit the class declaration so that it contains the phrase <code>implements org.micromanager.api.MMPlugin</code>. Left-click on the light-bulb with a red pimple to the left of this line, and select "Implement all abstract methods." The plugin will also work if you use "implements MMplugin". 
# Compile your project, and manually copy the project jar file to Micro-Manager's <code>mmplugins</code> directory. Alternatively, you can add the following to your project <code>build.xml</code> file (look in the Project "Files" tab in Netbeans):
<div class="source">
        <property name="pluginsDir"  location="C:\Program Files\Micro-Manager-1.4\mmplugins" />
        <target name="-post-jar">
        <echo message="--Copied MM plugin JAR to basedir: ${basedir}" />
        <copy file="${basedir}/${dist.jar}" toDir="${pluginsDir}" />
        </target>
</div>
:When "Clean and Build" is run, this will automatically copy the current version of your plugin to the <code>mmplugins</code> folder.
<ol><li value=10>Now choose Debug > Debug Project and your nascent plugin should appear in the Plugins menu. Try this in your own Micromanager installation as well. If the plugin is not loaded, check the CoreLogs folder to find the stack trace which will show the source of any plugin loading errors. </li></ol>
:You can also dynamically load your plugin by including a line in the <code>MMStartup.bsh</code> file. (This file should reside in the root directory of your Micro-Manager installation; if there isn't one yet, you can create it with any text editor program.) For example:
<div class="source">
        gui.installPlugin("org.micromanager.surveyor.SurveyorPlugin");
</div>
:Make sure you change the "Layout Generation Style" property from "Automatic" to "Swing Layout Extensions Library". You may find this by going to Preferences > Java > GUI builder > Layout Generation Style and select "Swing Layout Extensions Library".

== Using Eclipse ==

# Get Micro-manager source code if you don't already have it, at least the trunk (see [http://www.micro-manager.org/wiki/Micro-Manager_Source_Code this page])
# Make sure Micro-Manager is installed
# Install Eclipse (these instructions for Kepler, Luna, and Mars)
# Add Micro-manager's JRE to Eclipse
## Window -> Preferences; under Java, select Installed JREs and click Add...
### Use Standard VM
### Set the JRE Home to <code>C:\Program Files\Micro-Manager-1.4\jre</code> (or similar).
### Eclipse should fill in the rest.
### Consider making the Micro-manager JRE the default, or when you create projects make sure to select this as the JRE
### Click Finish
## Check the checkbox next to the newly-added JRE. 
# Create a new project for Micro-Manager Studio:
## File -> New -> Java Project...
### Select an appropriate name (e.g. the name of the plugin)
### Uncheck "Use Default Location"
### Point Location to plugin code location, in trunk the path is <code>plugins\<plugin name></code> (note: do not use <code>plugins\<plugin name>\src\org\micromanager\<plugin name></code>)
### Eclipse should auto-configure all sorts of useful things. 
## Click Next
###  On the Libraries tab, click Add External JARs and add all the JARs in Browse to <code>C:\Program Files\Micro-Manager-1.4\plugins\Micro-Manager</code> (or similar):
### Also Add External JAR ij.jar at <code>C:\Program Files\Micro-Manager-1.4\</code> (or similar)
### Add any other relevant JARs, or add later from Project Properties
### Important note: whenever the set of JARs distributed with Micro-Manager ever changes you will need to update Eclipse's list of JARs.  You can access them under Project->Properties, then under Java Build Path and under Libraries.  This doesn't happen every week but maybe a few times a year.
## Click Finish. 
# Tweak project settings at Project -> Properties
## Under Java Compiler consider setting compliance to Java 1.6
# Set up debug configuration at Project -> Properties; then Run/Debug Settings
## Add New configuration, Java Application; click "OK"
### Make sure the project is set to be the current project
### Specify the main class as <code>ij.ImageJ</code>
### At the bottom of the Arguments tab, change the working directory to "other" and browse to <code>C:\Program Files\Micro-Manager-1.4\</code>
### Click OK
## Make sure everything works by launching debug view from Run -> Debug
# To build a JAR file
## File -> Export (or right click on the project in the Project Explorer, select Export)
## Select Java -> JAR file, then click "Next"
## Point JAR export location to <code>C:\Program Files\Micro-Manager-1.4\mmplugins\<plugin name> </code>
## Click "Finish"





{{Programming_Sidebar}}
