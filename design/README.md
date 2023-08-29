# Design resources

This is information regarding the SVG design files, what is needed for them, how they are expected to be used, and how to prepare them for creating the [`../burn`](../burn/README.md) directory files and release through the tools found in the [`../build`](../build/README.md).

## 1. Development reminders

### 1.1 Initiating new SVG work after releasing to QA for testing

The process of a release creates a number of burn and print files in the [`../burn`](../burn) directory that reflect the content of the SVG file.

Thus, as soon as the SVG file is touched, the burn files no longer are guaranteed to reflect what is in the SVG.

When starting new work after a snapshot has been moved to QA for testing, be sure to delete all files except the `README.md` file in the [`../burn` directory](../burn). This way anyone visiting the site will find files only in the QA branch and main branch.

Also, the version number in the SVG file needs to be changed early in two different layers (one for print and one for burn) so there is no confusion regarding the SVG file not reflecting the published files.

### 1.2 SVG layers for the physical levels

The [Inkscape](https://inkscape.org) application helps to manage layers of content. The "Layers and Objects" panel reveals:
- layers of print and burn detail content, organized semantically regarding content and use
- singleton layers used in their own context
- empty layers representing content levels
  - the title of the combined level dictates the combination of other layers
  - see discussion below regarding assembling design and content layers
- layers of scratch-pad work

The typical format of the way a detail layer is labeled is: `L#:B#` representing:
- `L#`{level of the physical board}`:B#`{burn index for the level}
   - supplemental layer for the level
   - layer 1 has the main objects layer for the given level
   - layer 2 has the outside cuts and the alignment holes
   - layer 3 has the peg holes

The actual components of the label before and after are arbitrary and can be in any format. As described below regarding assembly, labels are collected by the label prefix; the label suffix is used only for distinction.

## 2. Fonts

These design files use the "Noto Serif" and "Noto Sans" available for free from the [`https://fonts.google.com/noto`](https://fonts.google.com/noto) site. The compressed and extra-compressed font variants are used predominantly.

As part of the production process, all text in the review copy of the design file is converted to paths and so there is no need for the PDF reading tool attached to the cutting machine to have these fonts pre-loaded.

## 3. Cuts

It is assumed that in the PDF file sent to the laser cutter, a stroke with a stroke width of .001in is a "cut" instruction to device. Otherwise, the surface of the material is etched. No consideration for colour is made in the etching.

For design management purposes, all SVG strokes with magenta #ff00ffff stroke paint, regardless of stroke width, are interpreted in the production process as needing to be converted to have a stroke width of .001in. During design these strokes are drawn with a stroke width of 1.5mm assuming that to be the (generous) width of the laser kerf. 

## 4. Release notes

These are the steps undertaken to make a final release suitable for checking into QA for testing. They are documented to help the developers remember to do everything, since there are many steps that need to be followed.

Remember to save frequently as Inkscape appears to crash easily when working with layers.

### 4.1 Update the version string

Update the version strings (two), one for print and the other for burning. 

Look in the "Layers and Objects" panel for the two layers with "version" in the layer name. Un-hide the layer but leave the layer locked. Open up the nested groups until you find the text string "Version". Select it and press "3" to zoom in on the string. Press "T" to enter text mode and make the change. Press "Esc" to get out of editing the string. Hide the layer again.

### 4.2 Preparing each layer for use in assembling levels

In the course of work on any given layer, the SVG objects end up becoming ungrouped. This makes for a pain point when dealing with selecting the layers in Inkscape because Inkscape automatically opens up the layer's contents for the (in)convenience of the user.

Walk through each of the design layers, introducing a top-level group that groups everything in that layer. That way, selecting the layer opens up only a single object and not many objects, thus making navigation of the layers more manageable.

### 4.3 Assembling design layers into combined levels

Assembling design layers into combined levels is accomplished by naming conventions used in the layer titles in the SVG. These combining layers should be empty because they are replaced in their entirety during the production process.

Individual design layers include labels as described above for levels but can be any pattern of `{label}:{distinction}`.

A combined layer's title directs the assembly of all of the layers in the order needed. The beginning of the title is the assembly name, followed by an equal sign "=" (separated with spaces), followed by as many `{label}:*` indications, in order and separated by spaces, of the collections of SVG layers to assemble. Consider this example:

- `L1-crop-9x12 = CropMarks9x12:* Crop9x12:* L1:*`
  - pull in three sets of SVG layers, in order, into a single assembly

In turn, collages also are empty layers that use the same conventions in the layer title to pull in assemblies:

- `13-9x24-collage = Tiling-9x24:* + L1-crop-9x12:* + L3-crop-9x12:*`

The actual assembly is accomplished in the production steps by XSLT stylesheets that read the design SVG XML and output a review SVG XML of all assemblies. This process is very quick and so it makes sense to use it to create the assemblies for review.

The review SVG file is then burst into individual SVG files, one for each collage and print assembly. The collage and print SVG files need some manual intervention before converting the SVG files to PDF using the synthesized batch script. The resulting PDF files need some manual intervention to orient them as desired for the laser cutter, as well as a one-last-time review of their accuracy before use.

## 5. Create the individual level SVG files and burn files

Close the `design-board-baseball-crane.svg` file to prevent it from being disturbed. And if it does get disturbed, one can replace it from the last copy committed to git.

Follow the instructions in the "Burn files" section in [`../build/README.md`](../build/README.md#burn-files) regarding creating the individual SVG and burn file collages.


