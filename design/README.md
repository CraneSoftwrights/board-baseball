# Design resources

Here are the SVG design files. Following the release instructions below, layers of SVG from these files are copied into the collage files in the [`../build`](../build#readme) directory as objects to be manipulated there for burning. The design files always retain their contents as objects.

## Fonts

These design files use the "Noto Serif" and "Noto Sans" available for free from the [`https://fonts.google.com/noto`](https://fonts.google.com/noto) site. The compressed and extra-compressed font variants are used predominantly.

## Release notes

These are the steps undertaken to make a final release. They are documented to help the developers remember to do everything, since there are many steps that need to be followed.

### SVG layers for the physical levels

The [Inkscape](https://inkscape.org) application helps to manage layers of content. The layer menu reveals:
- 18 layers of burn detail content, organized semantically regarding content and use
- 8 layers of burn summary content, organized as one for each physical level
- 2 layers of scratch-pad work areas, unorganized

The format of the way a detail layer is labeled is: `L#:B#-#` representing:
- `L`1-`B`{total layers of burns for the level}
   - main objects layer for the given level
- `L`{level of the physical board}:`B`{index layer of burns for the level}
   - supplemental layer for the level
   - layer 2 has the outside cuts and the alignment holes
   - layer 3 has the peg holes

The summary layers are labeled as "front", "middle", "back", and "test", followed by the level number. Note there are multiple back layers and only one of them is used in a given assembly. Level 6 is blank, while other back layers are decorated in some way (e.g. level 7 is a simple surrounding band).

### Preparing each layer for use in assembling levels

In the course of work on any given layer, the SVG objects end up becoming ungrouped. This makes for a pain point when dealing with selecting the layers in Inkscape because Inkscape automatically opens up the layer's contents for the (in)convenience of the user.

Walk through each of the layers, introducing a top-level group that groups everything in that layer. That way, selecting the layer opens up only a single object and not many objects, thus making navigation of the layers more manageable.

### Assembling levels into combined layers

Update the version strings (two), one for print and the other for burning.

Remove any existing top-level group for the combined layers for each of the levels

For each level:

- select all of the layers for the given level
- duplicate the layers using the keyboard shortcut (this will put all of the duplicates at the top of the list of layers and without the word "copy" at the end of the layer title ... which happens when other duplication methods are used)
- select all of the layer copies found at the top and group them
- unhide all of the layers in the new group
- drag the new group into the combined layers layer
- collapse all of the expanded layers to make next manipulatoin easier

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
- print to [`shared/basic-print-board-baseball-crane.pdf`](../shared/basic-print-board-baseball-crane.pdf)
- hide the basic panel and un-hide the extended panel
- print to [`shared/extended-print-board-baseball-crane.pdf`](../shared/extended-print-board-baseball-crane.pdf)
- undo all actions until page size restored and all layers hidden

### Create the individual level SVG files and burn files

Close the `design-board-baseball-crane.svg` file to prevent it from being disturbed. And if it does get disturbed, one can replace it from the last copy committed to git.

In the [`../build`](../build) directory, delete all of the `objects-*` and `burn-*` files in preparation for recreating them from scratch. If they are not deleted, one might overlook updating one of them.

Follow the instructions in [`../build/README.md`](../build/README.md) regarding creating the individual SVG and burn file collages.


