# Design resources

This is information regarding the SVG design files, what is needed for them, how they are expected to be used, and how to tidy them up in preparation for creating the [`../build`](../build/README.md) directory files and release.

## Development reminders

### Initiating new SVG work after releasing to QA for testing

The process of a release creates a number of build files in the [`../build`](../build) directory that reflect the content of the SVG file.

Thus, as soon as the SVG file is touched, the build files no longer are guaranteed to reflect what is in the SVG.

When starting new work after a snapshot has been moved to QA for testing, be sure to keep the `cut-*.*` files in the [`../build`](../build directory) and delete all of the `objects-*.*` and `burn-*.*` files. This way anyone visiting the site will find files only in the QA branch.

Also, the version number in the SVG file needs to be changed early in two different layers (one for print and one for burn) so there is no confusion regarding the SVG file not reflecting the published files.

### SVG layers for the physical levels

The [Inkscape](https://inkscape.org) application helps to manage layers of content. The layer menu reveals:
- 18 layers of burn detail content, organized semantically regarding content and use
- 8 layers of burn summary content, organized as one for each physical level
- 2 layers of scratch-pad work areas, unorganized

The format of the way a detail layer is labeled is: `L#:B#-#` representing:
- `L#`{level of the physical board}`:B1-#`{count of layers of burns for the level}
   - main objects layer for the given level
- `L#`{level of the physical board}`:B#`{index of layer of burns for the level}
   - supplemental layer for the level
   - layer 2 has the outside cuts and the alignment holes
   - layer 3 has the peg holes

The summary layers are labeled as "front", "middle", "back", and "test", followed by the level number. Note there are multiple back layers and only one of them is used in a given assembly. Level 6 is blank, while other back layers are decorated in some way (e.g. level 7 is a simple surrounding band).

## Fonts

These design files use the "Noto Serif" and "Noto Sans" available for free from the [`https://fonts.google.com/noto`](https://fonts.google.com/noto) site. The compressed and extra-compressed font variants are used predominantly.

## Release notes

These are the steps undertaken to make a final release suitable for checking into QA for testing. They are documented to help the developers remember to do everything, since there are many steps that need to be followed.

Remember to save frequently as Inkscape appears to crash easily when working with layers.

### Update the version string

Update the version strings (two), one for print and the other for burning. 

Look in the layer view for the two layers with "version" in the layer name. Unhide the layer but leave the layer locked. Open up the nested groups until you find the text string "Version". Press "3" to zoom in on the string. Press "T" to enter text mode and make the change. Press "Esc" to get out of editing the string. Hide the layer again.

### Preparing each layer for use in assembling levels

In the course of work on any given layer, the SVG objects end up becoming ungrouped. This makes for a pain point when dealing with selecting the layers in Inkscape because Inkscape automatically opens up the layer's contents for the (in)convenience of the user.

Walk through each of the design layers, introducing a top-level group that groups everything in that layer. That way, selecting the layer opens up only a single object and not many objects, thus making navigation of the layers more manageable.

### Assembling design layers into combined layers

Walk through each of the combined layers, deleting the top-level group child of each in order to get rid of old work. Using right-click and deleting the group works without having to unlock the combined layer.

For each level:

- select all of the layers for the given level
- duplicate the layers using the keyboard shortcut (this will put all of the duplicates at the top of the list of layers and without the word "copy" at the end of the layer title ... which appears to happen when other duplication methods are used)
- select all of the layer copies found at the top of the list of layers
- group the copy of all layers for the level
- unhide all of the layers in the new group
- drag the new group into the combined layers' layer
- collapse all of the expanded layers to make next manipulation easier

Take the time to review all of the levels' combined layers. More than once! Consider reviewing all of the tickets checked in against the results.

Hide all of the layers.

**IMPORTANT** Ensure the `design-board-baseball-crane.svg` file is saved and a copy committed to git. At this point, any inadvertent changes to the SVG file can be ignored and the committed copy restored for future use.

### Create the PNG and PDF results

PNG used in the [`README.md`](../README.md)
- un-hide the print layers using the combined panel
- export the contents using the "Document" tab (not the "Page" tab) to [`shared/board.png`](../shared/board.png)

PDF files used for play when printing the boards
- un-hide the print layers using the basic panel
- in the Document Properties dialogue, "Resize to content"
- print to [`shared/basic-print-board-baseball-crane.pdf`](../shared/basic-print-board-baseball-crane.pdf) (be careful not to end with ".pdf.pdf")
- hide the basic panel and un-hide the extended panel
- print to [`shared/extended-print-board-baseball-crane.pdf`](../shared/extended-print-board-baseball-crane.pdf) (be careful not to end with ".pdf.pdf")
- undo all actions until page size restored and all layers hidden

### Create the individual level SVG files and burn files

Close the `design-board-baseball-crane.svg` file to prevent it from being disturbed. And if it does get disturbed, one can replace it from the last copy committed to git.

In the [`../build`](../build) directory, delete all of the `objects-*` and `burn-*` files in preparation for recreating them from scratch. If they are not deleted, one might overlook updating one of them.

Follow the instructions in the "Burn files" section in [`../build/README.md`](../build/README.md#burn-files) regarding creating the individual SVG and burn file collages.


