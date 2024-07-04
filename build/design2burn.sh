cd burn
if [ -f svg2svgpdfpng.sh ]; then rm svg2svgpdfpng.sh ; fi
find svg -name \*.svg -exec rm {} \;
find svg -name \*.svg.txt -exec rm {} \;
find png -name \*.png -exec rm {} \;
find pdf -name \*.pdf -exec rm {} \;
java -jar ../utilities/saxon9he/saxon9he.jar -s:../design/design-board-baseball-crane.svg -xsl:../build/design2burn.xsl -o:svg2svgpdfpng.sh path2svg=svg/ path2png=png/ path2pdf=pdf/ name-suffix=-board-baseball-crane
errorReturn=$?
if [ $errorReturn -ne 0 ]; then exit $errorReturn ; fi
if [ -f svg2svgpdfpng.sh ]; then sh svg2svgpdfpng.sh ; fi
