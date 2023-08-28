# Design resources

This is information regarding the SVG design files, what is needed for them, how they are expected to be used, and how to tidy them up in preparation for creating the [`../build`](../build/README.md) directory files and release.

## 1. Development reminders

### 1.1 Initiating new SVG work after releasing to QA for testing

The process of a release creates a number of build files in the [`../build`](../build) directory that reflect the content of the SVG file.

Thus, as soon as the SVG file is touched, the build files no longer are guaranteed to reflect what is in the SVG.

When starting new work after a snapshot has been moved to QA for testing, be sure to keep the `cut-*.*` files in the [`../build`](../build directory) and delete all of the `objects-*.*` and `burn-*.*` files. This way anyone visiting the site will find files only in the QA branch.

Also, the version number in the SVG file needs to be changed early in two different layers (one for print and one for burn) so there is no confusion regarding the SVG file not reflecting the published files.

### 1.2 SVG layers for the physical levels

The [Inkscape](https://inkscape.org) application helps to manage layers of content. The layer menu reveals:
- layers of print and burn detail content, organized semantically regarding content and use
- layers of combined content for burning and cutting, organized as one for each physical level
  - the title of the combined level includes the number of burn layers to be combined
- singleton layers used in their own context
- layers of scratch-pad work

The format of the way a detail layer is labeled is: `L#:B#` representing:
- `L#`{level of the physical board}`:B#`{burn index for the level}
   - supplemental layer for the level
   - layer 1 has the main objects layer for the given level
   - layer 2 has the outside cuts and the alignment holes
   - layer 3 has the peg holes

Note there are multiple back layers and only one of them is used in a given assembly. Level 6 is blank, while other back layers are decorated in some way (e.g. level 7 is a simple surrounding band).

## 2. Fonts

These design files use the "Noto Serif" and "Noto Sans" available for free from the [`https://fonts.google.com/noto`](https://fonts.google.com/noto) site. The compressed and extra-compressed font variants are used predominantly.

## 3. Release notes

These are the steps undertaken to make a final release suitable for checking into QA for testing. They are documented to help the developers remember to do everything, since there are many steps that need to be followed.

Remember to save frequently as Inkscape appears to crash easily when working with layers.

### 3.1 Update the version string

Update the version strings (two), one for print and the other for burning. 

Look in the layer view for the two layers with "version" in the layer name. Unhide the layer but leave the layer locked. Open up the nested groups until you find the text string "Version". Press "3" to zoom in on the string. Press "T" to enter text mode and make the change. Press "Esc" to get out of editing the string. Hide the layer again.

### 3.2 Preparing each layer for use in assembling levels

In the course of work on any given layer, the SVG objects end up becoming ungrouped. This makes for a pain point when dealing with selecting the layers in Inkscape because Inkscape automatically opens up the layer's contents for the (in)convenience of the user.

Walk through each of the design layers, introducing a top-level group that groups everything in that layer. That way, selecting the layer opens up only a single object and not many objects, thus making navigation of the layers more manageable.

### 3.3 Assembling design layers into combined levels

Assembling design layers into combined levels is accomplished by naming conventions used in the layer titles in the SVG.

Individual design layers include labels as described above for levels but can be any pattern of `{label}:{distinction}`.

Combined layers are empty layers whose title directs the assembly of all of the layers in the order needed. The beginning of the title is the assembly name, followed by an equal sign "=" (separated with spaces), followed by as many `{label}:*` indications, in order, of the collections of SVG layers to assemble. Consider this example:

- `L1-crop-9x12 = CropMarks9x12:* Crop9x12:* L1:*`
  - pull in three sets of SVG layers, in order, into a single assembly

In turn, collages use the same conventions to pull in assemblies:

- `13-9x24-collage = Tiling-9x24:* + L1-crop-9x12:* + L3-crop-9x12:*`

The actual assembly is accomplished in the build steps by XSLT stylesheets that read the SVG XML and output a review of all assemblies. This process is very quick and so it makes sense to use it to create the assemblies for review.

The review file is then burst into individual SVG files for each assembly. 

## 4. Create the individual level SVG files and burn files

Close the `design-board-baseball-crane.svg` file to prevent it from being disturbed. And if it does get disturbed, one can replace it from the last copy committed to git.

Follow the instructions in the "Burn files" section in [`../build/README.md`](../build/README.md#burn-files) regarding creating the individual SVG and burn file collages.


