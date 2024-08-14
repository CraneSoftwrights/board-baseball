DP0=$( cd "$(dirname "$0")" ; pwd -P )
pushd "$DP0/../burn" >/dev/null
java -jar ../utilities/saxon9he/saxon9he.jar -s:../design/design-board-baseball-crane.svg -xsl:../utilities/designSVG2burnPDF/designSVG2burnPDF.xsl -o:svg2svgpdfpng.sh path2svg=svg/ path2png=png/ path2pdf=pdf/ name-suffix=-board-baseball-crane 
errorReturn=$?
if [ $errorReturn -ne 0 ]; then exit $errorReturn ; fi
if [ -f svg2svgpdfpng.sh ]; then sh svg2svgpdfpng.sh ; fi
popd >/dev/null
