---
autogenerated: true
title: Well Plate Plugin
redirect_from: /wiki/Well_Plate_Plugin
layout: page
---

## Summary

<table>
<tr>
<td markdown="1" valign=top>

**Summary:**

</td>
<td markdown="1">

Multiwell Plate Java Class

</td>
</tr>
<tr>
<td markdown="1" valign=top>

**Authors:**

</td>
<td markdown="1">

Karl Bellvé, Ben Czech

</td>
</tr>
<tr>
<td markdown="1" valign=top>

**Maintainers:**

</td>
<td markdown="1">

Karl Bellvé

</td>
</tr>
<tr>
<td markdown="1" valign=top>

**License:**

</td>
<td markdown="1">

LGPL

</td>
</tr>
<tr>
<td markdown="1" valign=top>

**Platforms:**

</td>
<td markdown="1">

All

</td>
</tr>
</table>

## Description

Designed to handle standard SBS well plates from 24, 96, 384 and 1536
wells.

The plugin will calculate the correct coordinates for each well
position. You can then iterate through each well, starting at the first
well. You may either zero position of the XY stage on the microscope for
the center of well A1 to coordinates to {0,0} or you can pass the X and
Y offsets.

The plugin will move the stage down or up each column, until the last
row, before moving to the next column and reversing direction. The
zig-zag path chosen for moving the stage is the fastest path on an Zeiss
AxioObserver Z1.

You can change the starting well, or the ending well to only work on a
subregion.

## Setup

big.jar must be installed and imported into the bsh script.

```
addClassPath("Big.jar");
import edu.umassmed.big.SBSPlate;
```

## Class Functions

Most functions expect well positions in X, Y coordinates, where X is the
long axis, and Y is the short axis of the well plate. X might have a
range from 1 to 48 and Y might have a range from 1 to 32, depending upon
plate size. Functions with Position in the name return coordinates in
microns relative to well A1 plus an offset.

SBSPlate()  
Initializes the plugin and uses 96 as the size of the well plate.

<!-- -->

SBSPlate(int size)  
Initializes the plugin for use with well plate of a set size. Acceptable
sizes are 24, 96, 384, and 1536. Assumes Well A1 is at

coordinates 0,0.

<!-- -->

SBSPlate(int size, double x, double y)  
This also sets the X and Y stage coordinates of well A1. Only use one
initialization SBSPlate();

<!-- -->

void SetPositionA1(double x, double y)  
Tells the class the offset of well A1. If X, and Y can't be set to 0,0
at position A1, then you must use this function.

<!-- -->

void setFirstWell(int x, int y)  
Changes the starting position from {1,1} to {x,y}, assuming 96 well
plate. Index is 1 based. X is the long dimension, and Y is the short
dimension of the well plate. For example, setFirstWell(1,2) would start
at well B1.

<!-- -->

void setLastWell(int x, int y)  
Changes the ending position from {12,8} to {x,y}. Index is 1 based. X is
the long dimension, and Y is the short dimension of the well plate. For
example, setLastWell(10,7) would finish at well G10.

<!-- -->

double\[\] getWellPosition (int x, int y)  
Returns the absolute position in microns relative to well A1. Calling X
and Y is 1 indexed but returns X and Y 0 indexed position in microns.

<!-- -->

String getWellLabel(int well)  
Returns the SBS name of the well as a String formatted as letter and
number. For example, A01. If you are only using a subregion, then you
only need to pass the well number of that subregion, with well 1 being
the start of the subregion. The function will calculate the correct SBS
label of that subregion based on where that subregion is on the well
plate.

<!-- -->

int getNumberOfWells()  
Returns the number of wells in the entire plate, or the number of wells
in a subregion.

<!-- -->

int getNumberOfWellPositions()  
Returns the number of positions in the current well if it exists,
otherwise :returns the number of positions in the global list.

<!-- -->

int getNumberOfWellPositions(int well)  
Returns the number of positions in a specific well if it exists,
otherwise :returns the number of positions in the global list.

<!-- -->

double\[\] getNextPosition()  
Deprecated. Please use getNextPlatePosition()

<!-- -->

double\[\] getNextPlatePosition()  
Returns the {x,y} coordinates in microns of the next well. If at the
last :well, it will return the first well's coordinates.

<!-- -->

double\[\] getNextWellPosition(int well)  
Returns the {x,y} coordinates in microns of the next position within a
:specific well.

<!-- -->

void addPosition(double x, double y, double z)  
Adds a x,y,z position to the global position list. X and Y submitted
values :need to be passed relative to the center of the well. X, and Y
are lated :returned as absolute positions. Z is later returned
unmodified.

<!-- -->

void addPosition(double x, double y, double z, int well)  
Adds a x,y,z position to a specific well. Any positions stored for a
specific :well overrides global position lists. X and Y submitted values
need to be :passed relative to the center of the well. X, and Y are
later returned as :absolute positions. Z is later returned unmodified.

<!-- -->

void clearPositions()  
Clears the global position list

<!-- -->

void clearPositions(int well)  
Clears the position list of a specific well

<!-- -->

void skipWell(Boolean skip)  
Use to either to skip or not skip (default) the current well.

<!-- -->

Boolean skipWell(int well)  
Returns TRUE if the specific well needs to be skipped.

## Example of a Micro-Manager BSH Script

```
////////////////////////////////////////////////////////////////////////////////////////////////
//

// Karl Bellve
// Biomedical Imaging Group
// Program in Molecular Medicine
// University of Massachusetts Medical School
// Karl.Bellve@umassmed.edu
// 
// Ben Czech 
// czechben@gmail.com
// 
//
// Script lets you mark positions in each well, with each position
// saved into Micro-Manager's internal position system
//
//////////////////////////////////////////////////////////////////////////////// ////////////////
//********************************************************************************************//
// Edit below
                              //           {column,row}
int[] firstWell = {1,1};      // 1 indexed {min 1,1}
int[] lastWell = {12,8};      // 1 indexed {max 12,8}
int plateType = 96;           // could be 24, 96, 384, 1536, must conform to SBS standard

// Edit above
//********************************************************************************************//
////////////////////////////////////////////////////////////////////////////////////////////////

import edu.umassmed.big.SBSPlate;
import ij.gui.*;
import java.lang.Math;

// They moved PositionList from org.micromanager.navigation to
org.micromanager.api

import org.micromanager.api.PositionList;
import org.micromanager.api.Autofocus;
import org.micromanager.api.AcquisitionOptions;
import org.micromanager.PositionListDlg;

/////////////////////////////////////////////////////////////////////////////////////

move(double x, double y, double z)
{
  print("Moving to " + (x - startX) + "," + (y - startY) + "," + (z - startZ));

  mmc.setXYPosition(xystage,x,y);
  mmc.waitForDevice(xystage);

  mmc.setPosition(zstage,z); 
  mmc.waitForDevice(zstage); 
  // add an extra second...
  mmc.sleep(1000);
}

gui.clearMessageWindow();
gui.closeAllAcquisitions();

//////////////////////////////////////////////////////////////////////////////// /////
// Variables
// 0 indexed in microns
// X, Y and Z
double[] position = {0.0,0.0,0.0}; 
double x0,y0,z0,z1,startX,startY,startZ;
// End Variables
//////////////////////////////////////////////////////////////////////////////// /////

//sets starting position
xystage = mmc.getXYStageDevice();
zstage = mmc.getFocusDevice();
startX = mmc.getXPosition(xystage);
startY = mmc.getYPosition(xystage);
startZ = mmc.getPosition(zstage);

// Plate and position list setup
PositionListDlg plg=gui.getXYPosListDlg();
PositionList pl=new PositionList();
gui.setPositionList(pl);
plg.setVisible(true);
SBSPlate plate = new SBSPlate(plateType,startX,startY);
plate.setFirstWell(firstWell[0],firstWell[1]);
plate.setLastWell(lastWell[0],lastWell[1]);
numberOfWells = plate.getNumberOfWells();

// if first well is not {1,1}, move to that position
position = plate.getPlatePosition(firstWell[0],firstWell[1]);
x0 = position[0];
y0 = position[1];
z1 = z0 = mmc.getPosition(zstage);

move(x0,y0,z0);

// This loop cycles through all the wells so you can set multiple X, Y and Z  positions
// within each well

int index=0;
int countPositions=0;

for (well = 0; well < numberOfWells;) {
   GenericDialog dialog = new GenericDialog("Mark Positions");
   dialog.addMessage(plate.getWellLabel(well));
   dialog.enableYesNoCancel("Mark","Next Well");
   dialog.showDialog();
   if (dialog.wasOKed()) {
      // set a position within this well
      gui.markCurrentPosition();
      print("Position has been marked at "+plate.getWellLabel(well)+"_"+index);
      pl=gui.getPositionList();
      pl.setLabel(countPositions,plate.getWellLabel(well)+"_"+index);
      countPositions++;
      gui.setPositionList(pl);
      index++;
   } else if (dialog.wasCanceled()) {
      //ends the script    
      GenericDialog dialog2 = new GenericDialog("Cancel?");
      dialog2.addMessage("Select OK if you really want to cancel");
      dialog2.showDialog();
      if (dialog2.wasOKed()) {
         done();
         print("User cancelled, exiting script");
         return false;
      }
   } else {
      // Move to next well
      print("Next Well: " + (well + 1));
      if (dialog.getNextBoolean() != true) {       
         print("Skipping well " + well + " with label " + plate.getWellLabel(well));
      }
      // move the stage to the next well
      position = plate.getNextPlatePosition(); // 0 indexed in microns
      x0 = position[0];
      y0 = position[1];
      z0 = position[2];
      // using last Z and not the default Z
      move(x0,y0,z1);
      index=0;
      well++;
   }
}

pl=gui.getPositionList();
gui.setPositionList(pl);
print("Positions have been marked... Moving back to start position");
move (startX, startY, startZ);
print("Finished");
```
--Karl Bellvé, Biomedical Imaging Group, University of Massachusetts\\
07:40, 7 August 2012 (PDT)
