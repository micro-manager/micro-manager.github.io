This page documents the various events that the 2.0 API exposes, and what you need to subscribe to to access those events.

=== Global events ===

These events are posted to the <code>EventManager</code>. You can subscribe to them via <code>mm.events().registerForEvents()</code>. The full list of Events can be found [https://valelab4.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/events/package-tree.html here].  Some examples:

* DatastoreClosingEvent: a Datastore was closed.
* DisplayAboutToShowEvent: a DisplayWindow is just about to show its GUI, which happens once there's at least one image for it to display.
* NewDisplayEvent: a new DisplayWindow was created. This is posted before that display's GUI becomes available.
* LiveModeEvent: Live mode was started or stopped


In addition to the above, the various events made available in 1.4 are still present:

* PropertiesChangedEvent: A Device Adapter has notified the core that at least one device property has changed. Note that not all property changes result in notifications; the adapter must be specifically coded to send them.
* PropertyChangedEvent: As above, but for a specific property.
* ConfigGroupChangedEvent: a config group has changed which preset it is using.
* SystemConfigurationLoadedEvent: a new config file has been loaded.
* PixelSizeChangedEvent: the pixel size has changed.
* StagePositionChangedEvent: a Z positioner has moved.
* XYStagePositionChangedEvent: an XY positioner has moved.
* ExposureChangedEvent: the exposure time has changed.
* SLMExposureChangedEvent: the exposure time of an SLM device has changed.

=== Display events ===

These events are specific to a single DisplayWindow, and can be accessed via <code>DisplayWindow.registerForEvents</code>. If you do register for a DisplayWindow's events, then you should remember to call <code>DisplayWindow.unregisterForEvents</code> if the object that is registered is discarded; otherwise, the DisplayWindow will keep a reference to your object, and errors may occur when the window attempts to send events to it. DisplayWindow events can be found [https://valelab4.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/display/package-tree.html here].

* DisplayDidShowImageEvent: A new image was shown in this display
* DisplayPositionChangedEvent: ?
* DisplaySettingsChangedEvent: Display settings (such as brightness/contrast) were changed

=== Datastore events ===

These events are specific to a single Datastore, and can be accessed via <code>Datastore.registerForEvents</code>. As with DisplayWindows, if you have an object listening to Datastore events, and that object is discarded, you should make certain to unregister it first. Javadoc for events posted by Datastores can be found [https://valelab4.ucsf.edu/~MM/doc-2.0.0-gamma/mmstudio/org/micromanager/data/package-summary.html here].

* DataProviderHasNewImageEvent: Signifies that an image has been added to a DataProvider.
* DataProviderHasNewNameEvent
* DataProviderHasNewSummaryMetadataEvent: Indicates that new summary metadata has been set for a DataProvider.
* DatastoreClearedEvent: Signals that all images have been deleted from the Datastore.
* DatastoreFrozenEvent: Indicates that a Datastore was frozen and cannot be written to any more (but read actions can still occur).
* ImageDeletedEvent: Signals that an image has been deleted from the Datastore.
* ImageOverwrittenEvent: Signals that an image in the Datastore has been overwritten.


{{2.0_Sidebar}}
