The 2.0 API of Micro-Manager is a substantial departure from previous versions. With it, we want to provide access to many aspects of the program that were previously hidden in internal classes. For example, it is now much more straightforward to access acquisition image data, control image display windows, read and modify acquisition metadata, and save data to disk. Additionally, we have rearranged the <code>org.micromanager</code> package. <code>org.micromanager.api</code> has been removed; instead, everything that is ''not'' part of the API has been moved into various "internal" packages (like <code>org.micromanager.internal</code>, <code>org.micromanager.display.internal</code>, etc.). 

The [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/ Javadocs] should prove useful to anyone wanting to familiarize themselves with the API. This page provides some more focused and descriptive guidance, with reference to the Javadocs where appropriate.

== Acquisition data: the data API ==

The [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/package-frame.html org.micromanager.data] package contains all of the API for reading and manipulating acquisition data. In particular, there are several new classes that you should familiarize yourself with if you want to read, modify, or create acquisition data or metadata.

As a general note, many of the classes (in particular, [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/Image.html Image], [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/Coords.html Coords], [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/Metadata.html Metadata], and [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/SummaryMetadata.html SummaryMetadata]) below are immutable. This means that a given instance of the class cannot be modified -- it will have methods to read its state, but no methods to modify them. If you want a modified version of a class, instead you make a copy that is different in the relevant ways. Immutability provides many advantages for ensuring coherency of data in complex workflows. However, it can take some getting used to.

=== The Datastore class ===

[http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/Datastore.html org.micromanager.data.Datastore] is a new class that holds the image data and summary metadata of an acquisition. Every acquisition has an associated Datastore, and you can create your own Datastores to perform custom acquisitions (see the section on the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/DataManager.html DataManager], below). 

The primary functions you will likely be interested in are:

* [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/Datastore.html#putImage(org.micromanager.data.Image) putImage] and [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/Datastore.html#getImage(org.micromanager.data.Coords) getImage], which allow you to add and retrieve Images from the Datastore (see the <code>Image</code> class, below).
* [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/Datastore.html#save(org.micromanager.data.Datastore.SaveMode,%20java.lang.String) save], which saves the contents of the Datastore to disk. There's also [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/Datastore.html#save(org.micromanager.data.Datastore.SaveMode,%20java.awt.Window) a version of the method] that prompts the user for a directory to save to.
* [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/Datastore.html#registerForEvents(java.lang.Object) registerForEvents], which allows you to be notified whenever the data in the Datastore (i.e. the Images or SummaryMetadata) are modified. The Datastore has a [http://docs.guava-libraries.googlecode.com/git/javadoc/com/google/common/eventbus/EventBus.html com.google.common.eventbus.EventBus] that signals events; appropriate methods with the [http://docs.guava-libraries.googlecode.com/git/javadoc/com/google/common/eventbus/Subscribe.html com.google.common.eventbus.Subscribe] annotation will be called when the event occurs. For example:

<code>
 import com.google.common.eventbus.Subscribe;
 import org.micromanager.data.Datastore;
 import org.micromanager.data.Image;
 import org.micromanager.data.NewImageEvent;
 import org.micromanager.Studio;

 public class MyClass {
    public MyClass(Studio studio) {
       Datastore myDatastore = studio.data().createRAMDatastore();
       myDatastore.registerForEvents(this);
    }

    @Subscribe
    public void onNewImage(NewImageEvent event) {
       Image newImage = event.getImage();
       // Examine the newly-added image...
    }
 }
</code>

=== The Image class ===

The [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/Image.html Image] class replaces the old <code>TaggedImage</code> class as our internal representation of a single 2D, monochromatic image. Where <code>TaggedImage</code> had a <code>JSONObject</code> for all metadata and an <code>Object</code> for the image pixel data, Image has getter methods for:

* The [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/Metadata.html Metadata] of the image (see below)
* The [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/Coords.html Coords] of the image, which represent its location within the Datastore.
* The image data itself. As with TaggedImage, this data is available as a raw Object (most likely a <code>byte[]</code> or <code>short[]</code>); however, the Image class can also generate an ImgPlus if you are running in Fiji and want to make use of the ImgLib image manipulation routines.

In addition there are various methods for creating copies of the <code>Image</code> with different metadata or at different coordinates. 

While <code>Image</code> is intended to completely supplant <code>TaggedImage</code>, the latter class is not completely gone; it is still generated by various <code>MMCore</code> functions. You can generate an <code>Image</code> from a <code>TaggedImage</code> by calling the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/DataManager.html#convertTaggedImage(mmcorej.TaggedImage) convertTaggedImage] method of the <code>DataManager</code>, below.

=== [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/Metadata.html Metadata] and [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/SummaryMetadata.html SummaryMetadata] ===

These classes replace the <code>JSONObject</code> that 1.4 used to store image metadata and acquisition summary metadata. The old system did not enforce any kind of type safety, tended to have redundant and/or vaguely-named entries, and was slow. The new classes have pre-defined supported fields that are strongly-typed, and can be rapidly constructed based on a template metadata object.

Both of these classes (and the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/Coords.html Coords] and [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplaySettings.html DisplaySettings] classes, discussed later) use a "Builder" pattern to create new instances. See [[Using_Builders]] for more information.

If you have extra fields that you wish to include in the metadata or summary metadata, there is a <code>userData</code> field with the type of [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/PropertyMap.html PropertyMap], which allows for storing semi-arbitrary key-value pairs. You can add whatever fields you like to this object. Micro-Manager itself (the "first-party" code) will not pay any attention to values in that object, but it will preserve them for any third-party code (plugins and scripts) that does.

=== Coords ===

A [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/Coords.html Coords] is a location in N-dimensional space. It includes an arbitrary list of axes (represented by strings like "time", "channel", etc.), and a position along each axis. Every [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/Image.html Image] has a Coords denoting its position in the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/Datastore.html Datastore], and every Image's coordinates must be unique. If you attempt to add an Image to a Datastore whose Coords match those of an image that is already in the Datastore, then the old image is replaced by the new one.

You are not restricted to the classic 4 axes of channel, time, z slice, and stage position. You can freely add additional axes and call them whatever you like. The only axis that Micro-Manager treats specially is the channel axis, and then only in the display code. Additionally, you are not required to provide a position along any given axis. If you ask a Coords what its position is for an axis it does not have, it will return -1.

However, please note that Micro-Manager's savefile formats do not support extra axes at this time. Consequently, use of arbitrary axes must be limited to RAM-based Datastores (created with [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/DataManager.html#createRAMDatastore() DataManager.createRAMDatastore]). In the future we will add support for saving arbitrary axes to disk.

As with the <code>Metadata</code> and <code>SummaryMetadat</code> classes, <code>Coords</code> are generated using a builder.

<code>
 Coords.CoordsBuilder builder = mm.data().getCoordsBuilder();
 // Convenience functions to set the standard axes
 builder.time(4); // 5th timepoint
 builder.channel(0); // 1st channel
 builder.position("polarization", 2); // Example custom axis

 Coords coords = builder.build();
 int timepoint = coords.getPositionAt(Coords.TIME); // 4
 int polarization = coords.getPositionAt("polarization"); // 2
 int zSlice = coords.getPositionAt(Coords.Z) // -1
</code>

=== The [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/DataManager.html DataManager] ===

Because the API only exposes interfaces (i.e. it does not expose concrete implementations of classes), you do not have the ability to directly create new instances of the Datastore, Image, Coords, Metadata, and SummaryMetadata classes. The DataManager provides that functionality for you (via e.g. [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/DataManager.html#getCoordsBuilder() getCoordsBuilder], [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/DataManager.html#getMetadataBuilder() getMetadataBuilder], and [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/DataManager.html#getSummaryMetadataBuilder() getSummaryMetadataBuilder]), and also implements some useful utility methods (like [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/DataManager.html#convertTaggedImage(mmcorej.TaggedImage) convertTaggedImage], mentioned earlier, and [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/DataManager.html#loadData(java.lang.String,%20boolean) loadData] to load data from disk). The DataManager can be accessed via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/Studio.html#data() Studio.data()] method, and uses of it are shown in examples above.

== Display controls: the display API ==

The [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/package-frame.html display] package contains the API for creating, controlling, and manipulating image display windows. It provides the ability to create new display windows, programatically control them (including both adjusting the parameters used to draw the image, and the ability to draw overlays), and listen to certain events they generate when interacted with.

=== DisplayWindow ===

[http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplayWindow.html DisplayWindow] is the class that all Micro-Manager image display windows implement. Every DisplayWindow is associated with a single [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/Datastore.html Datastore], and displays the images in that store. However, there may be multiple DisplayWindows for a single Datastore. The DisplayWindow class exposes a large number of methods for selecting which images are displayed and controlling how they are displayed. For example, the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplayWindow.html#setDisplayedImageTo(org.micromanager.data.Coords) setDisplayedImageTo] method takes a [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/Coords.html Coords] object (described above) and changes the displayed image to be the one at the specified coordinates. 

Most of the properties of the display, like the channel colors, contrast settings, and magnification, are encompassed by the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplaySettings.html DisplaySettings] object (see below). This object can be accessed with [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplayWindow.html#getDisplaySettings() getDisplaySettings] and changed with [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplayWindow.html#setDisplaySettings(org.micromanager.display.DisplaySettings) setDisplaySettings]. 

If you need to perform ImageJ operations on the display, use the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplayWindow.html#getImagePlus() getImagePlus] method to retrieve the ImagePlus object used for displaying images. Some properties of the image, like contrast and magnification, can potentially be manipulated both through the ImagePlus and through the DisplaySettings. Where redundancy like this exists, you should always use the DisplaySettings. Micro-Manager will handle ensuring that ImageJ's knowledge of the display is accurate, but ImageJ will not do the same for Micro-Manager; thus changing state via ImageJ can result in an inconsistent program state.

An important caveat for ImageJ operations: Micro-Manager's DisplayWindow is not an ImageJ [http://rsb.info.nih.gov/ij/developer/api/ij/gui/StackWindow.html ij.gui.StackWindow] as it was in the 1.x versions. Micro-Manager strives to maintain backwards compatibility by creating a hidden StackWindow that transparently redirects most calls to the DisplayWindow; this allows ImageJ plugins and tools to still largely operate as expected. However, direct window manipulations (e.g. changing the window size or position), and possibly other operations, could behave unexpectedly. If you need to find a DisplayWindow (i.e. you do not have a reference to it handy), use the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplayManager.html#getCurrentWindow() DisplayManager.getCurrentWindow] method or the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplayManager.html#getAllImageWindows() DisplayManager.getAllImageWindows] method. If you need to manipulate a DisplayWindow as a Java window (for example to change its position onscreen), use the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplayWindow.html#getAsWindow() DisplayWindow.getAsWindow] method.

As with [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/Datastore.html Datastore], each DisplayWindow has a [http://docs.guava-libraries.googlecode.com/git/javadoc/com/google/common/eventbus/EventBus.html com.google.common.eventbus.EventBus], whose events you can subscribe to using the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplayWindow.html#registerForEvents(java.lang.Object) registerForEvents] method. In particular, you should listen to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/RequestToCloseEvent.html RequestToCloseEvent] if you want to be notified when the user clicks on the close button of the window. DisplayWindows cannot close unless their [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplayWindow.html#forceClosed() forceClosed] method is called. If you are not interested in handling this logic, read about DisplayWindow tracking in the DisplayManager section, below.

=== DisplaySettings ===

The [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplaySettings.html DisplaySettings] class tracks most aspects of how exactly images are displayed in a particular [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplayWindow.html DisplayWindow]. As with the Metadata and SummaryMetadata classes discussed earlier, [https://micro-manager.org/wiki/Using_Builders it is constructed with a Builder pattern].

Whenever the DisplayWindow receives new DisplaySettings (e.g. via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplayWindow.html#setDisplaySettings(org.micromanager.display.DisplaySettings) setDisplaySettings] method), it posts a [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/NewDisplaySettingsEvent.html NewDisplaySettingsEvent] on its [http://docs.guava-libraries.googlecode.com/git/javadoc/com/google/common/eventbus/EventBus.html EventBus]. The various controls in the window listen for this event, and automatically update themselves to reflect the new settings. Your own code may also listen for this event if you have controls that need to be updated to reflect the new state of the display.

=== DisplayManager ===

The [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplayManager.html DisplayManager] class (accessible via [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/Studio.html#displays() Studio.displays]) performs various tasks that aren't specific to other classes in the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/package-frame.html display] package. In particular, as with [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/DataManager.html DataManager] above, it provides ways to instantiate objects whose constructors are not exposed in the API: [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplayManager.html#createDisplay(org.micromanager.data.Datastore) createDisplay] to create a new [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplayWindow.html DisplayWindow], and [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplayManager.html#getDisplaySettingsBuilder() getDisplaySettingsBuilder] to generate a new [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplaySettings.DisplaySettingsBuilder.html DisplaySettingsBuilder]. It also implements two utility methods to find DisplayWindows: [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplayManager.html#getCurrentWindow() getCurrentWindow] to return the topmost DisplayWindow, and [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplayManager.html#getAllImageWindows() getAllImageWindows] to return a list of all DisplayWindows.

==== Display Management ====

In addition to the above, DisplayManager also handles management of [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/Datastore.html Datastores]. A "managed" Datastore will be disposed of when all of its DisplayWindows go away. Additionally, before the last DisplayWindow is allowed to close, either the Datastore must have saved its data, or the user must have explicitly confirmed closing without saving.

By default, newly-created Datastores from the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/DataManager.html DataManager]'s Datastore-creation methods are ''not'' managed; thus, you are responsible for ensuring that they are saved, if so desired, as well as calling the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplayWindow.html#forceClosed() forceClosed] method of windows that are no longer needed. If you want to transfer this responsibility to Micro-Manager, call the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/DisplayManager.html#manage(org.micromanager.data.Datastore) manage] method of DisplayManager. It will automatically find all DisplayWindows associated with the Datastore, and register on their EventBuses. All DisplayWindows except the last are allowed to close when the user clicks the close button. When the last one tries to close, the DisplayManager will ensure that the user has a chance to save their data.

All Datastores that Micro-Manager creates for its own purposes (for example, for storing the results of a multi-dimensional acquisition) are automatically managed.

== Other API entities ==

=== Album ===

The [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/Album.html Album] provides access to a "contextual" Datastore that users can use to create ad-hoc collections of images. This is the store that the "Snap to image" button adds images to. You can access the Album via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/Studio.html#album() Studio.album] method.

=== CompatibilityInterface ===

The [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/CompatibilityInterface.html CompatibilityInterface] is where various miscellaneous API methods from 1.4 live. These include methods for running acquisitions, manipulating the data processing pipeline, checking the day/night mode, working with the Stage Position List, etc. Effectively it is a subset of the old ScriptInterface object from 1.4; however, many methods that used to be in it have been moved into more specific entities, or removed altogether due to changes in how 2.0 handles data.

You can access the CompatibilityInterface via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/Studio.html#compat() Studio.compat] method.

=== MMCore ===

The Micro-Manager Core is unchaged compared to 1.4. You can access it using [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/Studio.html#core() Studio.core]. 

=== EventManager ===

The [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/events/EventManager.html EventManager] is used to register for various system-wide events, as listed in the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/events/package-frame.html org.micromanager.events package]. You can access the EventManager via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/Studio.html#events() Studio.events] method.

=== SnapLiveManager ===

[http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/SnapLiveManager.html SnapLiveManager] is used for controlling the "Snap" and "Live" components and is thus important for taking images with the camera(s). It can be accessed via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/Studio.html#live() Studio.live] method.

=== LogManager ===

The [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/LogManager.html LogManager] is used to log and display messages, which can be useful for indicating when important events occur or when something goes wrong. Accessed via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/Studio.html#logs() Studio.logs] method.

=== UserProfile ===

The [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/UserProfile.html UserProfile] stores information specific to the current user of the microscope, such as preferred window positions and remembered form inputs. When the user starts Micro-Manager, they are prompted to select a profile to use; relevant information is then pulled from that profile. You can use the UserProfile to store and retrieve values using a simple key/value system. Accessed via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/Studio.html#profile() Studio.profile] method.

=== ScriptController ===

[http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/ScriptController.html ScriptController] is a small entity for interacting with the BeanShell scripting system. Access via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/Studio.html#scripter() Studio.scripter] method.

{{2.0_Sidebar}}
