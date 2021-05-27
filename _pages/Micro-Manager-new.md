__NOTOC__
===The Open Source Microscopy Software===
μManager is a software package for control of automated microscopes. It lets you execute common microscope image acquisition strategies such as time-lapses, multi-channel imaging, z-stacks, and combinations thereof. μManager works with microscopes from all four major manufacturers (Leica, Nikon, Olympus and Zeiss), most scientific-grade cameras and many peripherals (stages, filter wheels, shutters, etc.) used in microscope imaging (check the [[Device_Support|list of supported hardware]]). Since μManager runs as a plugin to [http://rsb.info.nih.gov/ij/ ImageJ], image analysis routines are available within the application. μManager software is available for multiple platforms (Windows, Mac, and Linux) and is free. [[Download Micro-Manager Latest Release|Download]] the most recent version (1.4) from our website.

=== ANOTHER MICROSCOPY SOFTWARE PACKAGE? WHY? ===

You have a choice of many commercial packages available, too many, perhaps. Some are produced by microscope or camera manufacturers, others by third parties but they all suffer from the same problems: lack of flexibility and proprietary drivers - [http://valelab.ucsf.edu/~MM/MMwiki/index.php/Why_Micro-Manager%3F read more...]

=== DECIDE IF YOU SHOULD GIVE IT A TRY ===

If you like and use ImageJ, if you are new to microscopy, or if you have limited resources, Micro-Manager will be your natural first choice. But if you do have a comfortable budget, or if you are already used to another software package, you'll have to make a decision whether to invest time and energy in μManager. As with everything else, there are some pros and cons. [http://valelab.ucsf.edu/~MM/MMwiki/index.php/Who_should_use_Micro-Manager Should you give it a try?]

=== HARDWARE ISSUES ===

If you are putting together or building a serious, automated microscopy system, open source solutions like this one may be a much better choice than anything else. You can use our default, ImageJ-compatible user interface, or build you own. Micro-Manager will even let you control your microscope from Matlab programs. In any case, whether you can use it right away or not depends on whether your particular hardware is supported. If not, contact us and express your desire. [http://valelab.ucsf.edu/~MM/MMwiki/index.php/Device_Support Check the current hardware list]

=== EXTENDING μMANAGER ===

Even if you are not interested in writing software code for your microscope, the open software architecture of μManager will benefit you. For instance, the Open Device Interface lets anyone write code to control microscope-related equipment, resulting a large and growing list of supported equipment. A scripting interface makes it possible to accomplish tasks that can not be execute within the GUI. Lastly, the μManager programming interface can be used from many different environments (including Matlab) to develop new applications, all using the same μManager Microscope device control.

{{Main Page Sidebar}}
