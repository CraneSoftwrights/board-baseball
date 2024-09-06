DP0=$( cd "$(dirname "$0")" ; pwd -P )
pushd "$DP0/../burn" >/dev/null

ss=stylesheet-not-found-designSVG2burnFiles.xsl
if [ -f ../../designSVG2burnFiles/designSVG2burnFiles.xsl ]; then ss=../../designSVG2burnFiles/designSVG2burnFiles.xsl ; fi
if [ -f ../utilities/designSVG2burnFiles/designSVG2burnFiles.xsl ]; then ss=../utilities/designSVG2burnFiles/designSVG2burnFiles.xsl ; fi

java -jar ../utilities/saxon9he/saxon9he.jar -s:../design/design-board-baseball-crane.svg -xsl:$ss -o:svg2svgpdfpng.sh path2svg=svg/ path2png=png/ path2pdf=pdf/ name-suffix=-board-baseball-crane minimum-stroke-width=.003in cut-colour=ff00ff
errorReturn=$?
if [ $errorReturn -ne 0 ]; then exit $errorReturn ; fi
if [ -f svg2svgpdfpng.sh ]; then sh svg2svgpdfpng.sh ; fi
popd >/dev/null
