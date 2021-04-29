The Micro-Manager image pipeline is designed to allow programmers to provide code to analyze images as they are acquired.

To take advantage of this, you will need to write a class (in a Java Micro-Manager plugin or Beanshell script) that overrides the "analyze" method in the [https://valelab.ucsf.edu/svn/micromanager2/trunk/mmstudio/src/org/micromanager/api/TaggedImageAnalyzer.java org.micromanager.api.TaggedImageAnalyzer] abstract class.

The analyze method takes a TaggedImage as it arrives from acquisition. Each [https://valelab.ucsf.edu/svn/micromanager2/trunk/MMCoreJ_wrap/TaggedImage.java TaggedImage] consists of raw pixels (either an array of bytes or shorts, depending on the pixel bit depth) and a JSON Object of Metadata.

In a plugin or script you can provide your class derived from TaggedImageAnalyzer to the acquisition engine:

 acq.addImageProcessor(TestTaggedImageAnalyzer.class);

It will then analyze the images as soon as they are available, before sending them to be saved and displayed.
