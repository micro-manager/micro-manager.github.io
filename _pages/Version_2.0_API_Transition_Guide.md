One of the major changes in 2.0 is a restructuring of the API. In 1.4, most of the functionality of the API was in a single module, [https://valelab.ucsf.edu/~MM/doc/mmstudio/org/micromanager/api/ScriptInterface.html ScriptInterface]. In 2.0, the API has been subdivided, and some methods have been replaced by new techniques for accomplishing similar tasks. This page runs down the list of methods in 1.4's ScriptInterface and tells you how to perform the equivalent task in 2.0.

=== CompatibilityInterface, AcquisitionManager, Application, and PositionListManager ===

First, note that the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/CompatibilityInterface.html CompatibilityInterface], [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/AcquisitionManager.html AcquisitionManager], [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Application.html Application], and [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/PositionListManager.html PositionListManager] modules contain many old methods from ScriptInterface, unmodified. These methods work as they did in 1.4, and include the following:

* CompatibilityInterface
** getVersion
** versionLessThan
** getCameraTransform
** setCameraTransform
* AcquisitionManager
** attachRunnable
** clearRunnables
** getHideMDADisplayOption
** getPositionList
** isAcquisitionRunning
** isPaused
** loadAcquisition
** runAcquisition
** setAcquisitionSettings
** setPause
* Application
** refreshGUI
** refreshGUIFromCache
** setExposure
** setChannelExposureTime
** getChannelExposureTime
** showAutofocusDialog
** showPositionList
** setROI
** makeActive
** getHideMDADisplayOption
** getMainWindow
* PositionListManager
** getPositionList
** markCurrentPosition
** setPositionList

You can access the CompatibilityInterface by calling the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio's] [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#compat() compat] method, the AcquisitionManager by calling the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio's] [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#acquisitions() acquisitions] method, the Application by calling the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio's] [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#app() app] method, and the PositionListManager by calling the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio's] [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#positions() positions] method. The Studio in turn is available in the BeanShell window as "mm", and is provided to plugins when they are initialized.

=== acquisitionExists ===

In 1.4, Micro-Manager maintained a registry of all "open" datasets (a.k.a. acquisitions), using a unique string key for each one. In 2.0, such a registry no longer exists. Any code that creates a new [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore] (the 2.0 equivalent to a 1.4 acquisition) is responsible for holding onto references to it, destroying it, recreating it, etc.

It is theoretically possible to find Datastores by way of their [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayWindow.html DisplayWindows], the windows that show images from the Datastore. You can ask the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayManager.html DisplayManager] for a list of all DisplayWindows, and ask each DisplayWindow for its Datastore using the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayWindow.html#getDatastore() getDatastore] method. However, remember that Datastores are not required to have any DisplayWindows (and also that it is possible to have multiple DisplayWindows for a single Datastore). If you really need for your code to find a Datastore created by someone else's code, then you should find a better way for the two components to talk to each other.

=== addImageToAcquisition ===

In 2.0, third-party code is responsible for maintaining its own [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastores] (the rough equivalent of 1.4 acquisitions), and can freely add images to Datastores themselves using the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html#putImage(org.micromanager.data.Image) putImage] method.

=== addMMBackgroundListener ===

This method was used as part of 1.4's day/night system for enabling low-contrast displays for use in darkrooms. 2.0 uses a different system that works automatically across the entire program; there is no need for individual components to register themselves. Thus this method is obsolete.

=== addMMListener / removeMMListener ===

These methods allowed code to listener for code event callbacks by implementing the MMListener interface, which is no longer in the API in 2.0. Instead, you can listen for events that correspond to each of the callbacks (for example, [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/events/PropertyChangedEvent.html PropertyChangedEvent] instead of the old propertyChangedAlert method), by using 2.0's event publishing system. Remember to annotate the method that listens to the event, with a [https://github.com/google/guava/wiki/EventBusExplained Subscribe annotation], and to register your object for event notifications via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/events/EventManager.html EventManager] accessible via [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#events() Studio.events()].

=== addToAlbum ===

The "album" [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore] is now available via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio's] [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#album() album] method, and you can freely add images to it yourself (see the <code>addImageToAcquisition</code> notes above)

=== autostretchCurrentWindow ===

You can now autostretch individual [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayWindow.html DisplayWindows] using their <code>autostretch</code> method. Thus this method can be replaced by calling <code>displays().getCurrentWindow().autostretch()</code>.

=== clearMessageWindow ===

This method was moved to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/ScriptController.html ScriptController] object accessible via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio's] [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#scripter() scripter] method.

=== closeAcquisition ===

As discussed in the notes on <code>acquisitionExists</code>, above, Micro-Manager no longer maintains responsibility for all open datasets. If you want to clean up a [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore], you must remove all references to that Datastore from memory. Micro-Manager will not maintain open references itself except via any [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayWindow.html DisplayWindows] you may have requested be created. You can close all open DisplayWindows for a given Datastore via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayManager.html DisplayManager's] [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayManager.html#closeDisplaysFor(org.micromanager.data.Datastore) closeDisplaysFor] method.

=== closeAcquisitionWindow ===

See the notes on <code>closeAcquisition</code>, above.

=== closeAllAcquisitions ===

As discussed in the notes on <code>acquisitionExists</code>, above, Micro-Manager no longer maintains a listing of all "acquisitions". Third-party code can freely create new [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastores] and Micro-Manager will not be able to "see" them. Thus this method is impossible to implement in 2.0. 

However, if you just want to clean up the UI, then the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayManager.html DisplayManager] has a [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayManager.html#closeAllDisplayWindows(boolean) closeAllDisplayWindows] method.

=== createAcquisition ===

You can request your own new [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastores] (the rough equivalent of 1.4 acquisition objects) via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/DataManager.html DataManager's] various "createDatastore" methods (e.g. [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/DataManager.html#createRAMDatastore() createRAMDatastore], [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/DataManager.html#createMultipageTIFFDatastore(java.lang.String,%20boolean,%20boolean) createMultipageTIFFDatastore], and [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/DataManager.html#createSinglePlaneTIFFSeriesDatastore(java.lang.String) createSinglePlaneTIFFSeriesDatastore]). 

=== displayImage ===

This has been replaced by [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayWindow.html DisplayManager's] [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayManager.html#show(org.micromanager.data.Image) show] method. Note that this method creates a new [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore] to store the image in. The old behavior of showing images in the Snap/Live Window is no longer possible.

=== enableLiveMode ===

This has been replaced by [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/SnapLiveManager.html SnapLiveManager's] [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/SnapLiveManager.html#setLiveMode(boolean) setLiveMode] method. You should also be aware of the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/SnapLiveManager.html#setSuspended(boolean) setSuspended] method if you need to briefly stop live mode, only to resume it later.

=== enableRoiButtons ===

This method was removed because it is unused by all known third-party code.

=== getAcqDlg === 

This method was deprecated in 1.4, and has been removed in 2.0. 

=== getAcquisition ===

This method was deprecated in 1.4 and has been removed in 2.0.

=== getAcquisitionPath ===

As discussed in the notes on <code>acquisitionExists</code>, above, Micro-Manager no longer maintains records on any acquisition objects; you are responsible for maintaining your own references to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore] that your data is in.

You can access the save path for a Datastore via its [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html#getSavePath() getSavePath] method.

=== getAcquisitionImageBitDepth ===

As discussed in the notes on <code>acquisitionExists</code>, above, Micro-Manager no longer maintains records on any acquisition objects; you are responsible for maintaining your own references to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore] that your data is in.

Image bit depth is now a property of the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Image.html Image] objects in the Datastore, and is theoretically not required to be the same for all Images in that Datastore (though in practice we do not expect varying bit depths to work right now). You can get the bit depth for an Image by asking for its [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Metadata.html Metadata] (via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Image.html#getMetadata() getMetadata] method) and then calling the Metadata's [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Metadata.html#getBitDepth() getBitDepth] method. 

If you need to get a single image out of a Datastore, you can call its [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html#getAnyImage() getAnyImage] method. 

=== getAcquisitionImageByteDepth ===

As discussed in the notes on <code>acquisitionExists</code>, above, Micro-Manager no longer maintains records on any acquisition objects; you are responsible for maintaining your own references to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore] that your data is in.

Image byte depth is now a property of the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Image.html Image] objects in the Datastore, and is theoretically not required to be the same for all Images in that Datastore (though in practice we do not expect varying byte depths to work right now). You can get the byte depth for a single image by calling its [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Image.html#getBytesPerPixel() getBytesPerPixel] method. 

If you need to get a single image out of a Datastore, you can call its [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html#getAnyImage() getAnyImage] method.

=== getAcquisitionImageCache ===

As discussed in the notes on <code>acquisitionExists</code>, above, Micro-Manager no longer maintains records on any acquisition objects; you are responsible for maintaining your own references to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore] that your data is in.

The Datastore functions as the equivalent of 1.4's image cache. You can ask it for images using its [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html#getImage(org.micromanager.data.Coords) getImage] method.

=== getAcquisitionImageHeight ===

As discussed in the notes on <code>acquisitionExists</code>, above, Micro-Manager no longer maintains records on any acquisition objects; you are responsible for maintaining your own references to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore] that your data is in.

Image height is now a property of the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Image.html Image] objects in the Datastore, and is theoretically not required to be the same for all Images in that Datastore (though in practice we do not expect varying image heights to work right now). You can get the height for a single image by calling its [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Image.html#getHeight() getHeight] method.

If you need to get a single image out of a Datastore, you can call its [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html#getAnyImage() getAnyImage] method.

=== getAcquisitionImageWidth ===

As discussed in the notes on <code>acquisitionExists</code>, above, Micro-Manager no longer maintains records on any acquisition objects; you are responsible for maintaining your own references to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore] that your data is in.

Image width is now a property of the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Image.html Image] objects in the Datastore, and is theoretically not required to be the same for all Images in that Datastore (though in practice we do not expect varying image widths to work right now). You can get the width for a single image by calling its [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Image.html#getWidth() getWidth] method.

If you need to get a single image out of a Datastore, you can call its [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html#getAnyImage() getAnyImage] method.

=== getAcquisitionMultiCamNumChannels ===

As discussed in the notes on <code>acquisitionExists</code>, above, Micro-Manager no longer maintains records on any acquisition objects; you are responsible for maintaining your own references to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore] that your data is in.

In 2.0 this method is not available. You may try to replicate it by comparing the number of channels in the Datastore (via its [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html#getAxisLength(java.lang.String) getAxisLength] method) to the number of unique cameras declared by the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Metadata.html Metadata]s of the various images (see [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Metadata.html#getCamera() Metadata.getCamera]). You can iterate over all images in the Datastore via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html#getUnorderedImageCoords() getUnorderedImageCoords] method combined with the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html#getImage(org.micromanager.data.Coords) getImage] method.

=== getAcquisitionPath ===

As discussed in the notes on <code>acquisitionExists</code>, above, Micro-Manager no longer maintains records on any acquisition objects; you are responsible for maintaining your own references to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore] that your data is in. 

The path of a Datastore's saved location on disk is accessible via its [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html#getSavePath() getSavePath] method.

=== getAutofocus ===

Use [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/AutofocusManager.html#getAutofocusMethod AutofocusManager.getAutofocusMethod] instead.

=== getAutofocusManager ===

Use [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio#getAutofocusManager Studio.getAutofocusManager] instead.  

=== getBackgroundColor ===

As discussed in the notes for <code>addMMBackgroundListener</code>, background color selection is now handled automatically. Thus this method is no longer needed. However, if you need to manually set colors for the few edge cases where colors are not handled automatically, you should investigate the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/ApplicationSkin.html ApplicationSkin] module.

=== getBackgroundStyle ===

This method was replaced by the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/ApplicationSkin.html#getSkin ApplicationSkin.getSkin] method.

=== getCacheForWindow ===

This has been replaced by the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayWindow.html DisplayWindow]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayWindow.html#getDatastore() getDatastore] method.

=== getCurrentAlbum ===

The Album Datastore can be accessed via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#album() album] method.

=== getMMCore ===

The Micro-Manager Core object can be accessed via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#core() core] method.

=== getROI ===

Use the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmcorej/mmcorej/CMMCore.html Core's] [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmcorej/mmcorej/CMMCore.html#getROI() getROI] method.

=== getSnapLiveWin ===

This has been replaced by the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/SnapLiveManager.html SnapLiveManager]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/SnapLiveManager.html#getDisplay() getDisplay] method. You can access the SnapLiveManager via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#live() live] method.

Please note that the snap/live display is prone to being destroyed and recreated. It is not recommended that you keep references to the snap/live window in memory; request it anew each time you need it.

=== getUniqueAcquisitionName ===

As discussed in the notes on <code>acquisitionExists</code>, above, Micro-Manager no longer maintains records on any acquisition objects; you are responsible for maintaining your own references to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore] that your data is in.

Consequently, there is no need to generate unique acquisition names.

=== getXYPosListDlg ===

This method was deprecated in 1.4 and has been removed in 2.0

=== getXYStageName ===

This information can be accessed via the [https://valelab.ucsf.edu/~MM/doc/mmcorej/mmcorej/CMMCore.html Core]'s [https://valelab.ucsf.edu/~MM/doc/mmcorej/mmcorej/CMMCore.html#getXYStageDevice() getXYStageDevice] method. The Core in turn can be accessed via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#core() core] method.

=== initializeAcquisition ===

The metadata set by this method is now handled automatically when images are saved; consequently, it is no longer needed.

=== installAutofocusPlugin ===

AutofocusPlugins should now be compiled and annotated with the @Plugin annotation (as described in [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/MMPlugin.html MMPlugin]). If this is done and the resulting jar file is included in the mmautofocus directory of your ImageJ installation, then the plugin will automatically be detected at runtime. There is no mechanism for loading a plugin after µManager's initialization has completed.

=== isLiveModeOn ===

This method has been replaced by the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/SnapLiveManager.html SnapLiveManager]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/SnapLiveManager.html#getIsLiveModeOn() getIsLiveModeOn] method. The SnapLiveManager in turn can be accessed via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#live() live] method.

Note that if you just want to temporarily suspend live mode, to resume it later, then you can make use of the SnapLiveManager's [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/SnapLiveManager.html#setSuspended(boolean) setSuspended] method.

=== logError ===

Replaced by the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/LogManager.html LogManager]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/LogManager.html#logError(java.lang.Exception) logError] method (and similarly for the variants on this method). The LogManager can be accessed via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#logs() logs] method.

=== logMessage ===

As with <code>logError</code>, replaced by the LogManager's [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/LogManager.html#logMessage(java.lang.String) logMessage] method.


=== logStartupProperties ===

This method was removed as it is unused by all known third-party code.

=== message ===

Replaced by the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/ScriptController.html ScriptController]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/ScriptController.html#message(java.lang.String) message] method. The ScriptController in turn can be accessed via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#scripter() scripter] method.

=== openAcquisition ===

As discussed in the notes on <code>acquisitionExists</code>, above, Micro-Manager no longer maintains records on any acquisition objects; you are responsible for maintaining your own references to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore] that your data is in.

You can request new Datastores via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/DataManager.html DataManager]'s various "createDatastore" methods (e.g. [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/DataManager.html#createRAMDatastore() createRAMDatastore], [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/DataManager.html#createMultipageTIFFDatastore(java.lang.String,%20boolean,%20boolean) createMultipageTIFFDatastore], and [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/DataManager.html#createSinglePlaneTIFFSeriesDatastore(java.lang.String) createSinglePlaneTIFFSeriesDatastore]). If you use a file-backed Datastore, then images will automatically be saved to disk as you add them to the Datastore, though you should make certain to call the Datastore's [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html#freeze() freeze] method when you are done to ensure that saving completes successfully.

If you wish to view the images in the Datastore, use the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayManager.html DisplayManager]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayManager.html#createDisplay(org.micromanager.data.Datastore) createDisplay] method. The DisplayManager in turn can be accessed via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#displays() displays] method.

In any case, there is no need to specify the dimensionality of the dataset ahead of time as was the case with <code>openAcquisition</code>

=== openAcquisitionData ===

Replaced by [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/DataManager.html DataManager]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/DataManager.html#loadData(java.lang.String,%20boolean) loadData] method. The DataManager in turn can be accessed via the http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#data() data] method.

=== promptToSaveAcquisition ===

As discussed in the notes on <code>acquisitionExists</code>, above, Micro-Manager no longer maintains records on any acquisition objects; you are responsible for maintaining your own references to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore] that your data is in.

Replaced by the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html#save(org.micromanager.data.Datastore.SaveMode,%20java.awt.Window) save] method.

=== registerForEvents ===

Moved to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/events/EventManager.html EventManager], which can be accessed via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#events() events] method.

=== removeMMBackgroundListener ===

As discussed in <code>addMMBackgroundListener</code> above, day/night changes now happen automatically, so this method is obsolete.

=== saveConfigPresets ===

While this method still exists (as part of the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Application.html Application] module), it now two parameters: a path string to save the config to, and a boolean for whether to allow overwriting of existing files. The old functionality that displayed a save dialog has been removed.

=== setAcquisitionAddImageAsynchronous ===

As discussed in the notes on <code>acquisitionExists</code>, above, Micro-Manager no longer maintains records on any acquisition objects; you are responsible for maintaining your own references to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore] that your data is in.

As you now have complete control over adding images to your Datastores, it is up to you to implement asynchronous image-adding if you need it.

=== setAcquisitionProperty ===

As discussed in the notes on <code>acquisitionExists</code>, above, Micro-Manager no longer maintains records on any acquisition objects; you are responsible for maintaining your own references to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore] that your data is in.

Arbitrary metadata storage is available for both [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/SummaryMetadata.html SummaryMetadata] and individual image [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Metadata.html Metadata] via their respective <code>userData</code> fields.

=== setBackgroundStyle ===

This method was replaced by the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/ApplicationSkin.html#setSkin ApplicationSkin.setSkin] method.

=== setChannelColor ===

As discussed in the notes on <code>acquisitionExists</code>, above, Micro-Manager no longer maintains records on any acquisition objects; you are responsible for maintaining your own references to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore] that your data is in. Likewise, you are responsible for keeping track of any associated [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayWindow.html DisplayWindow]s open for a given Datastore. However, for managed Datastores, you can request all open DisplayWindows via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayManager.html DisplayManager]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayManager.html#getDisplays(org.micromanager.data.Datastore) getDisplays] method.

Channel color is a property of the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplaySettings.html DisplaySettings] for a given DisplayWindow. You can create a new DisplaySettings with adjusted channel colors (e.g. by using the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplaySettings.html#copy() copy] method), and then cause a DisplayWindow to use the new channel color via its [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayWindow.html#setDisplaySettings(org.micromanager.display.DisplaySettings) setDisplaySettings] method.

The above logic relies on you understanding the use of Builder patterns. See [[Using_Builders]] for more information.

=== setChannelContrast ===

As discussed in the notes on <code>acquisitionExists</code>, above, Micro-Manager no longer maintains records on any acquisition objects; you are responsible for maintaining your own references to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore] that your data is in. Likewise, you are responsible for keeping track of any associated [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayWindow.html DisplayWindow]s open for a given Datastore. However, for managed Datastores, you can request all open DisplayWindows via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayManager.html DisplayManager]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayManager.html#getDisplays(org.micromanager.data.Datastore) getDisplays] method.

Channel contrast settings are properties of the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplaySettings.html DisplaySettings] for a given DisplayWindow. You can create a new DisplaySettings with adjusted contrast (e.g. by using the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplaySettings.html#copy() copy] method), and then cause a DisplayWindow to use the new channel color via its [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayWindow.html#setDisplaySettings(org.micromanager.display.DisplaySettings) setDisplaySettings] method.

The above logic relies on you understanding the use of Builder patterns. See [[Using_Builders]] for more information.

=== setChannelName ===

As discussed in the notes on <code>acquisitionExists</code>, above, Micro-Manager no longer maintains records on any acquisition objects; you are responsible for maintaining your own references to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore] that your data is in.

Channel names are a property of the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/SummaryMetadata.html SummaryMetadata] associated with a given Datastore. You can access the SummaryMetadata using the Datastore's [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html#getSummaryMetadata() getSummaryMetadata] method, make a copy with the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/SummaryMetadata.html#copy() copy] method, adjust the channel names to suit, and then cause the Datastore to use the new summary metadata using the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html#setSummaryMetadata(org.micromanager.data.SummaryMetadata) setSummaryMetadata] method.

The above logic relies on you understanding the use of Builder patterns. See [[Using_Builders]] for more information.

=== setContrastBasedOnFrame ===

As discussed in the notes on <code>acquisitionExists</code>, above, Micro-Manager no longer maintains records on any acquisition objects; you are responsible for maintaining your own references to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore] that your data is in. Likewise, you are responsible for keeping track of any associated [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayWindow.html DisplayWindow]s open for a given Datastore. However, for managed Datastores, you can request all open DisplayWindows via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayManager.html DisplayManager]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayManager.html#getDisplays(org.micromanager.data.Datastore) getDisplays] method.

This method is not available in 2.0. However, you can replicate its functionality for a given DisplayWindow by combining the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplayWindow.html#setDisplayedImageTo(org.micromanager.data.Coords) SetDisplayedImageTo] method of DisplayWindow and the <code>shouldAutostretch</code> field of the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/display/DisplaySettings.html DisplaySettings].

=== setConfigChanged ===

This method was removed as it is unused by all known third-party code.

=== setImageProperty ===

As discussed in the notes on <code>acquisitionExists</code>, above, Micro-Manager no longer maintains records on any acquisition objects; you are responsible for maintaining your own references to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore] that your data is in.

Arbitrary metadata storage is available for both [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/SummaryMetadata.html SummaryMetadata] and individual image [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Metadata.html Metadata] via their respective <code>userData</code> fields.

=== setImageSavingFormat ===

When saving the contents of a [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore], you must specify the format you want to use in the form of a [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.SaveMode.html Datastore.SaveMode]. Alternately, if you want to show the user a save-file dialog, then that dialog will include a file format dropdown menu that they can use to decide which format to use. The dropdown menu (and the MDA dialog's save-files section) will automatically default to the format the user last used to save files.

=== setRelativeStagePosition ===

This functionality be accessed via the [https://valelab.ucsf.edu/~MM/doc/mmcorej/mmcorej/CMMCore.html Core]'s [https://valelab.ucsf.edu/~MM/doc/mmcorej/mmcorej/CMMCore.html#setRelativePosition() setRelativePosition] method. The Core in turn can be accessed via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#core() core] method.

=== setRelativeXYStagePosition ===

This functionality can be accessed via the [https://valelab.ucsf.edu/~MM/doc/mmcorej/mmcorej/CMMCore.html Core]'s [https://valelab.ucsf.edu/~MM/doc/mmcorej/mmcorej/CMMCore.html#setRelativeXYPosition() setRelativeXYPosition] method. The Core in turn can be accessed via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#core() core] method.

=== setStagePosition ===

This functionality can be accessed via the [https://valelab.ucsf.edu/~MM/doc/mmcorej/mmcorej/CMMCore.html Core]'s [https://valelab.ucsf.edu/~MM/doc/mmcorej/mmcorej/CMMCore.html#setPosition() setPosition] method. The Core in turn can be accessed via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#core() core] method.

=== setXYOrigin ===

This functionality can be accessed via the [https://valelab.ucsf.edu/~MM/doc/mmcorej/mmcorej/CMMCore.html Core]'s [https://valelab.ucsf.edu/~MM/doc/mmcorej/mmcorej/CMMCore.html#setOriginXY() setOriginXY] method. The Core in turn can be accessed via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#core() core] method.

=== setXYStagePosition ===

This functionality can be accessed via the [https://valelab.ucsf.edu/~MM/doc/mmcorej/mmcorej/CMMCore.html Core]'s [https://valelab.ucsf.edu/~MM/doc/mmcorej/mmcorej/CMMCore.html#setXYPosition() setXYPosition] method. The Core in turn can be accessed via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#core() core] method.

=== showError ===

Moved to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/LogManager.html LogManager] object, which can be accessed via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html logs] method.

=== showMessage ===

Moved to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/LogManager.html LogManager] object, which can be accessed via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html logs] method.

=== showXYPositionList ===

For consistency, this method was renamed to [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/PositionListManager.html#showPositionList() showPositionList] in [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/PositionListManager.html PositionListManager].

=== sleep ===

This method has been removed. Use [http://docs.oracle.com/javase/7/docs/api/java/lang/Thread.html#sleep%28long%29 Thread.sleep] instead.

=== snapAndAddImage ===

As discussed in the notes on <code>acquisitionExists</code>, above, Micro-Manager no longer maintains records on any acquisition objects; you are responsible for maintaining your own references to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html Datastore] that your data is in.

You can replicate the functionality of this method through a combination of the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/SnapLiveManager.html SnapLiveManager]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/SnapLiveManager.html#snap(boolean) snap] method and the Datastore's [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/data/Datastore.html#putImage(org.micromanager.data.Image) putImage] method. The SnapLiveManager can be accessed from the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#live() live] method.

=== snapSingleImage ===

Replaced by the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/SnapLiveManager.html SnapLiveManager]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/SnapLiveManager.html#snap(boolean) snap] method.

=== unregisterForEvents ===

Moved to the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/events/EventManager.html EventManager] object, which can be accessed via the [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html Studio]'s [http://valelab.ucsf.edu/~MM/doc-2.0.0-beta/mmstudio/org/micromanager/Studio.html#events() events] method.


{{2.0_Sidebar}}
