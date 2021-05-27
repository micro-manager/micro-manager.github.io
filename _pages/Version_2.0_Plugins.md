This page provides an overview of how to write new plugins in [[Version_2.0]]. While the basic concepts are similar to how they worked in previous versions, important details have changed.

== Defining a Plugin ==

Version 2.0 uses the SciJavaPlugin framework for detecting and loading plugins at runtime. What this means for you as a plugin author is that your plugin class must do the following things to be detected and loaded:

# Its jar must be located in the mmplugins directory of your ImageJ installation.
# It must implement the [http://valelab.ucsf.edu/~MM/doc-2.0.0-alpha/mmstudio/org/micromanager/MMPlugin.html MMPlugin] interface, or one of the interfaces that inherits from MMPlugin (see the list further down the page)
# It must implement the <code>org.scijava.plugin.SciJavaPlugin</code> interface. This interface does not specify any methods (so all you need to do is add SciJavaPlugin to the list of interfaces implemented by your plugin class); it just marks the plugin class for later detection.
# It must have the <code>org.scijava.plugin.Plugin</code> annotation, with the "type" parameter matching the type of the plugin you wish to implement.

For example, if you want to add a new MenuPlugin to the Plugins menu, then you would need to have a plugin class that looks something like this:

<code>@Plugin(type = MenuPlugin.class)<br>
public class MyPlugin implements MenuPlugin, SciJavaPlugin {<br>   ...plugin implementation goes here...<br>}</code>

== Plugin instantiation ==

In µManager 2.0, all plugins are loaded ''and instantiated'' when µManager launches. This is different from prior versions, where plugins were instantiated on an as-needed basis. You will know your plugin has finished loading when its <code>[http://valelab.ucsf.edu/~MM/doc-2.0.0-alpha/mmstudio/org/micromanager/MMPlugin.html#setContext%28org.micromanager.Studio%29 setContext()]</code> method is called. The <code>[http://valelab.ucsf.edu/~MM/doc-2.0.0-alpha/mmstudio/org/micromanager/Studio.html Studio]</code> object passed as a parameter to that method provides the plugin with access to the µManager API.


== Building a Plugin jar file with IntelliJ ==

To start running a new plugin, you first need to build a jar file of the plugin and copy it into the Micro-Manager directory "mmplugins".  You can build this jar file with the command line tool "ant", but it is also possible to do so completely with the IDE IntelliJ (and possibly others).  For these step by step instructions we use the "Example" plugin, included in the 2.0 source code.

<ul>
<li>In the IntelliJ menu, select "File" > "New" > "Project from existing sources" and point to the "Example" directory.  IntelliJ will find the sources, but no libraries. Select the JDK you want to work with, and open the project. </li>
<li>Select "File" > "Project Structure" and click on "Libraries".  Click on the "+" (New Project Libraries), Select Java, and select the plugins/micro-manager directory in your Micro-Manager installation (usually in C:/Program Files/Micro-Manager-2.0gamma).  Also add ij.jar (in C:/Program Files/Micro-Manager 2.0gamma).  This should allow you to build the code.</li>
<li> To tell IntelliJ to do annotation processing select "File" > "Settings", then find "Build, Execution, Deployment" > "Compiler" > "Annotation Processors".        Select the project name (Example) and check "Enable annotation processing", "Obtain processors from project classpath" and click OK.</li>
<li>Select "File" > "Project Structure" and click on "Artifacts". Click the "+" and "Jar(Empty)".  Name it "Example".  From "Available Elements", select "Example compile output". </li>
<li>To build the jar, you can now select "Build" > "Build Artifact"</li>
<li>Copy the jar produced by IntelliJ to the mmplugins directory under the Micro-Manager installation directory, and the next time you run Micro-Manager, your "Example" plugin should appear under the plugins menu (under "Developer Tools".</li>
<li>To start debugging the code in IntelliJ, select "Run" > "Edit Configurations". Click the "+" button and select the Template "Application".  Enter the following values: <br/>
Main class: "ij.ImageJ"<br/>
VM Options: "-Xmx3000m -Dforce.annotation.index=true"<br/>
Working directory: "C:\Program Files\Micro-Manager-2.0gamma" (or wherever you have MM)<br/>
Use classpath of module: "Example" (unless you changed the name)<br/></li>
<li>"Run" > "Debug 'Example' starts ImageJ - Micro-Manager, and lets you stop at breakpoints in your code</li>
</ul>

== Types of plugins ==

µManager 2.0 has a considerably expanded number of plugin types compared to 1.4, which are enumerated here.

=== MMPlugin ===

This is the most basic type of plugin. It is not explicitly exposed anywhere in the program, and thus should only be used by plugins that want to be fully in charge of their behavior and create their own UIs, largely independent of µManager itself. Be careful that your UI behaves sanely when closed (or has no mechanism to be closed), as once it is closed there will be no way to access it short of restarting the program.

=== MenuPlugin ===

[http://valelab.ucsf.edu/~MM/doc-2.0.0-alpha/mmstudio/org/micromanager/MenuPlugin.html MenuPlugin] plugins are displayed in the Plugins menu. The <code>[http://valelab.ucsf.edu/~MM/doc-2.0.0-alpha/mmstudio/org/micromanager/MenuPlugin.html#getSubMenu() getSubMenu()]</code> method allows them to declare where in the Plugins menu they appear, and the <code>[http://valelab.ucsf.edu/~MM/doc-2.0.0-alpha/mmstudio/org/micromanager/MenuPlugin.html#onPluginSelected() onPluginSelected()]</code> method is called when the user selects their entry from the menu.

Most plugins are MenuPlugins. One good example is the RecallPlugin.

=== ProcessorPlugin ===

[http://valelab.ucsf.edu/~MM/doc-2.0.0-alpha/mmstudio/org/micromanager/data/ProcessorPlugin.html ProcessorPlugin] plugins are used in the data processing pipeline, which modifies images as they are acquired. They appear in the Plugins menu, under "On-The-Fly Image Processing". A ProcessorPlugin is really a gateway to two other objects. The first is the [http://valelab.ucsf.edu/~MM/doc-2.0.0-alpha/mmstudio/org/micromanager/data/ProcessorConfigurator.html ProcessorConfigurator], which is a user interface that allows the user to configure how this plugin should process data. This configuration is output as a [http://valelab.ucsf.edu/~MM/doc-2.0.0-alpha/mmstudio/org/micromanager/PropertyMap.html PropertyMap] (effectively a key-value store). The second is the [http://valelab.ucsf.edu/~MM/doc-2.0.0-alpha/mmstudio/org/micromanager/data/ProcessorFactory.html ProcessorFactory], which produces [http://valelab.ucsf.edu/~MM/doc-2.0.0-alpha/mmstudio/org/micromanager/data/Processor.html Processors] based on the PropertyMap they have been provided.

This is a complicated mechanism, but the upshot is that a single ProcessorPlugin can create multiple independent ProcessorConfigurators, the configurations generated by those Configurators can be stored via PropertyMaps and restored later (e.g. in later sessions of the program), and each Processor is wholly independent of any others, allowing for multiple independent image processing pipelines.

Example ProcessorPlugins include the SplitView and ImageFlipper plugins.

=== OverlayPlugin ===

[http://valelab.ucsf.edu/~MM/doc-2.0.0-alpha/mmstudio/org/micromanager/display/OverlayPlugin.html OverlayPlugin] plugins are used to draw overlays on the image display window. They are made available via the "Overlays" section of any Inspector window. OverlayPlugins are primarily responsible for creating [http://valelab.ucsf.edu/~MM/doc-2.0.0-alpha/mmstudio/org/micromanager/display/OverlayPanelFactory.html OverlayPanelFactories], which in turn create the [http://valelab.ucsf.edu/~MM/doc-2.0.0-alpha/mmstudio/org/micromanager/display/OverlayPanel.html OverlayPanels] that are responsible for actually deciding what to draw and how to draw it. Copies of each OverlayPanel are embedded into each Inspector window, by way of the Factory.

An example OverlayPlugin is the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/internal/overlays/TimestampPlugin.html TimestampPlugin], with the corresponding [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/internal/overlays/TimestampFactory.html TimestampFactory] and [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/internal/overlays/TimestampPanel.html TimestampPanel] classes.

=== AutofocusPlugin ===

[http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/AutofocusPlugin.html AutofocusPlugin] plugins are used to perform autofocus operations, typically in software. They are accessible via the autofocus UI in the main window and MDA window in the program. They remain largely unchanged from prior versions of µManager.

=== IntroPlugin ===

[http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/IntroPlugin.html IntroPlugin] plugins allow for some basic customization of the introductory dialog when µManager is launched. They can specify a list of config files that ought to always be available to users, and they can replace the "splash screen" image with their own image.

=== InspectorPlugin ===

[http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/InspectorPlugin.html InspectorPlugin] plugins produce [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/InspectorPanel.html InspectorPanel]s that are displayed in the Inspector window(s). An InspectorPanel is simply a set of controls or informational displays related to the currently active [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DataViewer.html DataViewer] or [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayWindow.html DisplayWindow]. Example InspectorPanels include [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/internal/inspector/HistogramsPanel.html HistogramsPanel], which displays the histograms, [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/internal/inspector/MetadataPanel.html MetadataPanel], which shows image metadata, and [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/internal/inspector/OverlaysPanel.html OverlaysPanel], which draws overlays on the currently-displayed image.

=== QuickAccessPlugin ===

[http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/quickaccess/QuickAccessPlugin.html QuickAccessPlugin] plugins create tools that can be embedded into the [[Version 2.0 Users Guide#Quick_Access_Panel|Quick Access Panel]]. They allow easy access to custom controls, so if your plugin has some simple controls that you want users to always be able to access (and that don't warrant a more fully-fledged GUI), you can use a QuickAccessPlugin to create those controls.

More specifically, you should create a [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/quickaccess/SimpleButtonPlugin.html SimpleButtonPlugin], [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/quickaccess/ToggleButtonPlugin.html ToggleButtonPlugin], or [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/quickaccess/WidgetPlugin.html WidgetPlugin], depending on how complicated the usage logic is for your control. QuickAccessPlugin itself does not have any methods that get called when the control is interacted with, so the more specific child interfaces are necessary to do anything with the Quick Access Panel.

== Providing an API for your plugin ==

If your plugin contains generally useful functionality that other code might want to call, it is a good idea to provide a stable programming interface (API) for it. Since classes in plugin JARs are not usually available on the classpath, you need to provide your API in a separate "library" JAR, to be included in the classpath. Your plugin will then be a wrapper around your library.

You can split the plugin and library in one of two ways:
* Library = interface definitions only; Plugin = code that implements the interfaces, plus MMPlugin classes
* Library = interface definitions, plus implementation code; Plugin = MMPlugin classes (thin wrappers that call the library)

If you use the latter scheme, it is important to make it clear which interfaces (and, possibly, classes) are part of the API (to be maintained stably to ensure compatibility) and which are implementation details (which the library author can change any time). We recommend following the MMStudio convention of placing implementation classes in packages that contain "internal" as an item in their fully qualified name.

{{2.0_Sidebar}}
