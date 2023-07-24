# Build resources directory

These are the resources used to build a 3-dimensional box using a laser printer to cut multiple layers according to a PDF file for each layer.

<img alt="" src="../shared/box1.jpg" height="300"/> <img alt="" src="../shared/box2.jpg" height="300"/> 

There are five layers of 3/16" or 5mm material that are laminated together to create a box, and one chooses between the available fifth and sixth layers as the back of the box. The sixth layer is the same as the fifth layer but without any visible decoration.

The test layer is positioned such that it can overlay layer 2. After burning the test layer, one can burn a layer 2 on the same piece of material. Thus, one could do a first test burn, adjust the settings and orient the surface positioning a different layer 2 at the home position and do a second test burn with the new parameters. Then layer 2 burns can overlay the test burns.

These are the files used to burn in a laser cutter:

9"x12": [<img alt="" src="../shared/1-collage.png" height="60"/>](burn-1-9x12-collage-board-baseball-crane.pdf), [<img alt="" src="../shared/2-collage.png" height="60"/>](burn-2-9x12-collage-board-baseball-crane.pdf), [<img alt="" src="../shared/3-collage.png" height="60"/>](burn-3-9x12-collage-board-baseball-crane.pdf), [<img alt="" src="../shared/4-collage.png" height="60"/>](burn-4-9x12-collage-board-baseball-crane.pdf), [<img alt="" src="../shared/5-collage.png" height="60"/>](burn-5-9x12-collage-board-baseball-crane.pdf), [<img alt="" src="../shared/6-collage.png" height="60"/>](burn-6-9x12-collage-board-baseball-crane.pdf), and [<img alt="" src="../shared/T-collage.png" height="60"/>](burn-T-9x12-collage-board-baseball-crane.pdf) 

These are collages of layer images arranged tête-à-tête as follows:

18"x24": [<img alt="" src="../shared/1345-collage.png" height="120"/>](burn-1345-18x24-collage-board-baseball-crane.pdf), [<img alt="" src="../shared/2222-collage.png" height="120"/>](burn-2222-18x24-collage-board-baseball-crane.pdf) and [<img alt="" src="../shared/1346-collage.png" height="120"/>](burn-1346-18x24-collage-board-baseball-crane.pdf)  
9"x24": [<img alt="" src="../shared/13-collage.png" height="60"/>](burn-13-9x24-collage-board-baseball-crane.pdf), [<img alt="" src="../shared/45-collage.png" height="60"/>](burn-45-9x24-collage-board-baseball-crane.pdf), [<img alt="" src="../shared/22-collage.png" height="60"/>](burn-22-9x24-collage-board-baseball-crane.pdf), and [<img alt="" src="../shared/46-collage.png" height="60"/>](burn-46-9x24-collage-board-baseball-crane.pdf)

Layers from the design files are copied into the individual objects files for organization purposes:

- copy the large design file into the target objects file
- delete all of the layers not belonging in the new file, leaving only the one
- rotate the top-most layer clockwise 90 degrees
- use document properties and change the page size to the content

[`objects-1-9x12-collage-board-baseball-crane.svg`](objects-1-9x12-collage-board-baseball-crane.svg)  
[`objects-2-9x12-collage-board-baseball-crane.svg`](objects-2-9x12-collage-board-baseball-crane.svg)  
[`objects-3-9x12-collage-board-baseball-crane.svg`](objects-3-9x12-collage-board-baseball-crane.svg)  
[`objects-4-9x12-collage-board-baseball-crane.svg`](objects-4-9x12-collage-board-baseball-crane.svg)  
[`objects-5-9x12-collage-board-baseball-crane.svg`](objects-5-9x12-collage-board-baseball-crane.svg)  
[`objects-6-9x12-collage-board-baseball-crane.svg`](objects-6-9x12-collage-board-baseball-crane.svg)  
[`objects-T-9x12-collage-board-baseball-crane.svg`](objects-T-9x12-collage-board-baseball-crane.svg)  

The "objects" individual files then are copied to the "burn" individual files, replacing entirely the old "burn" individual files:

[`burn-1-9x12-collage-board-baseball-crane.svg`](burn-1-9x12-collage-board-baseball-crane.svg)  
[`burn-2-9x12-collage-board-baseball-crane.svg`](burn-2-9x12-collage-board-baseball-crane.svg)  
[`burn-3-9x12-collage-board-baseball-crane.svg`](burn-3-9x12-collage-board-baseball-crane.svg)  
[`burn-4-9x12-collage-board-baseball-crane.svg`](burn-4-9x12-collage-board-baseball-crane.svg)  
[`burn-5-9x12-collage-board-baseball-crane.svg`](burn-5-9x12-collage-board-baseball-crane.svg)  
[`burn-6-9x12-collage-board-baseball-crane.svg`](burn-6-9x12-collage-board-baseball-crane.svg)  
[`burn-T-9x12-collage-board-baseball-crane.svg`](burn-T-9x12-collage-board-baseball-crane.svg)  

The "burn" collage files then have the following modifications made before saving them as complete:

- all objects are selected using the top-most and the menu item "Path/Object to Path" is used to convert the fonts to paths
- all objects below the top-most layer are ungrouped until there are no more groups below the top-most layer
- a single magenta cut line is selected using right-click/Select Same.../Stroke color which selects every cut line in the entire collage
- the stroke width of all lines is changed with a single entry of .001in in the Fill and Stroke dialogue

Layers from the individual burn files are copied into the collage burn files:

[`burn-1345-18x24-collage-board-baseball-crane.svg`](burn-1345-18x24-collage-board-baseball-crane.svg)  
[`burn-1346-18x24-collage-board-baseball-crane.svg`](burn-1346-18x24-collage-board-baseball-crane.svg)  
[`burn-2222-18x24-collage-board-baseball-crane.svg`](burn-2222-18x24-collage-board-baseball-crane.svg)  
[`burn-13-9x24-collage-board-baseball-crane.svg`](burn-13-9x24-collage-board-baseball-crane.svg)  
[`burn-45-9x24-collage-board-baseball-crane.svg`](burn-45-9x24-collage-board-baseball-crane.svg)  
[`burn-46-9x24-collage-board-baseball-crane.svg`](burn-46-9x24-collage-board-baseball-crane.svg)  
[`burn-22-9x24-collage-board-baseball-crane.svg`](burn-22-9x24-collage-board-baseball-crane.svg)  

The PDF files created from the "burn" collage files are what are sent to the appropriate laser; note that the printing of the SVG may unexpectedly rotate the image 180 degrees, needing tweaking in the PDF files:

[`burn-1345-18x24-collage-board-baseball-crane.pdf`](burn-1345-18x24-collage-board-baseball-crane.pdf)  
[`burn-1346-18x24-collage-board-baseball-crane.pdf`](burn-1346-18x24-collage-board-baseball-crane.pdf)  
[`burn-2222-18x24-collage-board-baseball-crane.pdf`](burn-2222-18x24-collage-board-baseball-crane.pdf)  
[`burn-13-9x24-collage-board-baseball-crane.pdf`](burn-13-9x24-collage-board-baseball-crane.pdf)  
[`burn-45-9x24-collage-board-baseball-crane.pdf`](burn-45-9x24-collage-board-baseball-crane.pdf)  
[`burn-46-9x24-collage-board-baseball-crane.pdf`](burn-46-9x24-collage-board-baseball-crane.pdf)  
[`burn-22-9x24-collage-board-baseball-crane.pdf`](burn-22-9x24-collage-board-baseball-crane.pdf)  
[`burn-1-9x12-collage-board-baseball-crane.pdf`](burn-1-9x12-collage-board-baseball-crane.pdf)  
[`burn-2-9x12-collage-board-baseball-crane.pdf`](burn-2-9x24-collage-board-baseball-crane.pdf)  
[`burn-3-9x12-collage-board-baseball-crane.pdf`](burn-3-9x12-collage-board-baseball-crane.pdf)  
[`burn-4-9x12-collage-board-baseball-crane.pdf`](burn-4-9x12-collage-board-baseball-crane.pdf)  
[`burn-5-9x12-collage-board-baseball-crane.pdf`](burn-5-9x12-collage-board-baseball-crane.pdf)  
[`burn-6-9x12-collage-board-baseball-crane.pdf`](burn-6-9x12-collage-board-baseball-crane.pdf)  
[`burn-T-9x12-collage-board-baseball-crane.pdf`](burn-T-9x12-collage-board-baseball-crane.pdf)  

Below are some photographs of the burning, assembly, and construction processes:

*(to be added)*
