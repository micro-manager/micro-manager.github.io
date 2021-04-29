= FrameCombiner =

A [https://micro-manager.org/ Micro-Manager 2] plugin that can process stack images in time. The processing can be applied in real-time (live mode) or during an acquisition (MDA).

This plugin was inspired by the excellent FrameAverager plugin from [http://www.openpolscope.org/pages/MMPlugin_Frame_Averager.htm OpenPolScope] available on github at https://github.com/LC-PolScope/Micro-Manager-Addons.

The motivation to create this plugin was to make it compatible with Micro-Manager 2 and also add more processing operations. This plugin is not compatible with earlier versions of Micro-Manager.

= Usage =

* Launch Micro-manager.
* Execute the plugin with Plugin ▶ On-The-Fly Image Processing ▶ Frame Processor.
* Launch a live or MDA acquisition.
* Set the number of frames you want to process and the algorithm you want to apply on the stack such as mean, max, min, or sum.
* The acquisition window displays the processed images (mean image of the last 10 images by default).

Please report any issue to https://github.com/micro-manager/micro-manager/issues.

= Features =

* This plugin can perform several classic operations during '''live''' or '''MDA''' such as <code>mean</code>, <code>sum</code>, <code>max</code> and <code>min</code> on a user-specified number of frames.
* Images are processed for each combinations of Z, Channel and Stage Position.
* User can choose a set of channels to be ignored by the processor.

= Screenshot =

[[File:FrameProcessor Screenshot.png|600px|thumb|left|alt=Screenshot of the Frame Processor plugin]]

= Authors =

<code>FrameCombiner</code> was written by [mailto:hadrien.mary@gmail.com Hadrien Mary].

This work started in 2016 at the [http://brouhardlab.mcgill.ca/ Gary Brouhard laboratory] at the University of McGill.


{{Documentation Sidebar}}
