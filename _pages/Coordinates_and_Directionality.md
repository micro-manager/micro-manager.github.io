---
autogenerated: true
title: Coordinates and Directionality
layout: page
---

To assure that movement of stages and the orientation of images is as
you expect, microscope acquisition software needs to have information
about the direction of motion of stages and image orientation. In
Micro-Manager, we attempt to overcome confusion about directionality by
mandating a single coordinate system. The 'Micro-Manager' coordinate
system uses micrometers as its unit, and places the origin (0,0) in the
top left corner for XY stages (when viewed from above, this holds true
for both inverted and upright microscopes). Positive movement along the
X-axis moves the stage to the left, positive movement along the Y-axis
moves the stage to the top (away from the observer). This coordinate
system follows that of SBS multi-well plate, with (for a 96 well plate)
well A1 in the top left corner and well H12 in the bottom right corner
(in the Micro-Manager coordinate system, well A1 will have low X and Y
coordinates, and well H12 will have high X and Y coordinates).

**XYStages:** It is the task of the stage adapter to guarantee that this
coordinate system is imposed. However, this is not guaranteed to work
yet for all stages. Also, user input concerning directionality of the
stage might be needed, since this information cannot always be learned
from the hardware. To check that the stage moves in the correct
orientation, you can execute the following (one line) script in the
Micro-Manager script panel:  
mmc.setRelativeXYPosition(mmc.getXYStageDevice(), 1000, 1000);  
This should move the stage by 1 mm to the left and 1 mm to the top, away
from the observer.
{% include Note text="Check that the 'pitch' of the stage is correct, i.e., the stage really moves by 1 mm." %}

**Z-Stages** (Focus stages) will have their lowest values away from the
sample (at the lowest point for inverted scopes and the highest point of
upright scopes). Movement in the positive direction will move the
objective lens towards the sample. This directionality should be
guaranteed by the device adapter, however, as of now (version 1.2.15)
this has not been verified for any focus drive adapter. The following
script should move the focus drive by 1 mm towards the sample (make sure
that the objective is far enough away from the sample before executing
this command!):  
mmc.setRelativePosition(mmc.getFocusDevice(), 1000);

**Camera** images can be different from the desired orientation in three
ways: they can be rotated, mirrored along the X-axis, and mirrored along
the Y-axis. All camera adapters now (as of version 1.2.15) have three
properties (TransposeXY, TransposeMirrorX, TransposeMirrorY) that
describe the needed transformations. The transformations will be
executed in that order (first swap X and Y axis, then mirror along the X
and/or Y axis). It is the end-users responsibility to set these
properties up correctly. It is easiest to first ensure correct
directionality of the XY stage and use a one line script as above to
move the stage in a defined orientation and observer the movement of an
object in the image.
{% include Note text="Some changes in camera properties (for instance, the choice of readout port for some EM cameras) can change image orientation.  Camera adapters can also carry out these transformations on the image (generating an image in the 'correct' orientation).  Whether or not the adapter carries out these transformations is indicated with the property 'TransposeCorrection'.  There are not yet any adapters that carry out such corrections." %}

**Store settings**: It is highly desirable to have the camera Transpose
settings as well as other configuration settings describing
directionality set on startup. The easiest way of doing so is to create
a configuration group called 'System' and to create a preset in this
group called 'Startup' that sets these parameters (and anything else you
want to be set on startup). Likewise, the preset 'Shutdown' will be set
when Micro-Manager shuts down.

--[Nico](User:Nico "wikilink") 17:52, 31 May 2008 (PDT)

{% include Documentation_Sidebar text="" %}