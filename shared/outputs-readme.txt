These are the outputs generated for Crane's Board Baseball game, maintained 
publicly in https://github.com/CraneSoftwrights/board-baseball

The PDF files are suitable for a laser cutter where cut directives are
lines with the width .001in. For distinction, these lines are magenta
coloured. All other lines are simply burned on the wood surface.

Directories in this ZIP:

 burn/ - a set of finalized SVG, PDF, and PNG files of the game surfaces
         including print, single-board, double-board, and six-layer builds

 cuts/ - a set of pre-packaged cut files used to create smaller wooden blanks
         from larger wooden blanks

One SVG file in particular is a summary of all of the burn files, useful 
in Inkscape to review the individual layers:

  burn/svg/review-all-burns-board-baseball-crane.svg 

Surface naming conventions are as follows:

 - PBF and PBB - print board front and back for printing on paper
 - SBF and SBB - single board front and back for burning one layer of material
 - DBF and DBB - double board front and back for burning two layers of material
 - L1 through L7 - for burning six layers of material

Assembly naming conventions are as follows:

 - "-crop-"  - after full-size boards are joined they must be cropped to size
 - "-cut-"   - the laser cutter cuts the boards to size before they are joined
 - "-frame-" - no edge cutting is done, the raw materials are burned as they
               sit in a frame that contains them centred in 9"x12"
             - in the burn/cuts directory are two available frames:
               - frame-8x10-in-9x12.pdf    - for acrylic blanks (or isometric)
               - frame-200x248-in-9x12.pdf - for blanks the same shape as
                                             the "-cut-" assemblies
 
Dimension conventions are as follows:

 - 8x10 - inches
 - 9x12 - inches
 - 200x248 - millimetres


