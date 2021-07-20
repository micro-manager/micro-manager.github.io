== Stitching Images Acquired in Micro-Manager ==

There are a number of programs available for stitching images acquired 
in Micro-Manager, or stitching images more generally.  For images acquired 
from Micro-Manager, the simplest option is to use the 
Grid/Collection Stitching Plugin.  This is installed by default in the [http://fiji.sc Fiji] distribution. The major disadvantage to this program  is that it will not stitch images larger than 2.14 gigapixels. 

=== Acquiring a grid of images in Micro-Manager ===

The easiest way to do this is by using the Create Grid option in the Multi-Dimensional acquisition GUI.  To access it:

# Open up Multi-Dimensional Acquisition in Micro-Manager.
# Click the Edit position list button.
# Click the Create Grid button.
# Move to the left edge of your sample and click the left-most set button.
# Repeat this procedure for the other three edges of your sample.
# Set the overlap (5-20% seems to work well).
# Acquire your data (make sure to save in Image stack format).
# You may want to use the BFcorrector plugin to flat-field correct your images.

=== Stitching images using the Grid/Collection Stitching plugin in Fiji ===
# The Grid/Collection Stitching Plugin is located in Plugins -> Stitching -> Grid/Collection Stitching.
# In the first dialog box, select Type: "Positions from file" and Order: "Defined by image metadata"
# In the second dialog box select the first position in your grid for "Multi series file".
# Depending on the orientation of your camera relative to your stage you may need to select "Invert X Coordinates" or "Invert Y Coordinates".
# Otherwise, the default options usually work well.
# Hit OK, and you should have your stitched image in a few minutes.
# This works for single channel and multicolor images, and should work for Z-stacks as well, although I haven't tested it as extensively for Z-stacks.

Information about other stitching options is available on the [http://nic.ucsf.edu/dokuwiki/doku.php?id=image_stitching_in_micro-manager NIC wiki].

{{Documentation_Sidebar}}
