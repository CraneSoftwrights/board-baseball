if [ -f burn/svg2pdf.sh ]; then rm burn/svg2pdf.sh ; fi
cd burn
java -jar ../utilities/saxon9he/saxon9he.jar -s:../design/design-board-baseball-crane.svg -xsl:../build/design2burn.xsl -o:svg2pdf.sh path2svg=svg/ path2png=png/ path2pdf=pdf/ name-suffix=-board-baseball-crane script=burn/svg2pdf.sh
errorReturn=$?
if [ $errorReturn -ne 0 ]; then exit $errorReturn ; fi
#if [ -f svg2pdf.sh ]; then sh svg2pdf.sh ; fi
