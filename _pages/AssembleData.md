---
autogenerated: true
title: AssembleData
redirect_from: /wiki/AssembleData
layout: page
---

## Assemble Data Plugin

Combines images takes with different camera/different views into a
single data set.

Since: \~May 2019, 2.0-gamma and newer

To use this plugin effectively, you will need to calibrate the relation
(affine transform) between XY stage movement and camera for each camera
in your system. The plugin will use this information to overlay the
images precisely.

![](/media/AssembleData.png)

Open the two data sets you would like to combine. They can be
multi-dimensional acquisitions, and can even contain data from multiple
positions, in which case the plugin will attempt to overlay the
positions. An example script used to acquire such data is here:

Select the two data sets in the drop down menus. Enter the offset
between the two views. You may need to find the correct number by trial
and error. The "Test" button will assemble only the first channel and
first time point of both datasets. Once things look good, press the
"Assemble" button to obtained the complete, overlayed data.

![](/media/AssmbleResult.jpg)

{% include Listserv_Search text="AssembleData" %}

