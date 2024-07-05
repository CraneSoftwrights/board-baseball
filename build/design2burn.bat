pushd burn
if exist svg2pdf.bat del svg2svgpdfpng.bat
if exist svg\*.svg del svg\*.svg
if exist svg\*.svg.txt del svg\*.svg.txt
if exist png\*.png del png\*.png
if exist pdf\*.pdf del pdf\*.pdf
java -jar ../utilities/saxon9he/saxon9he.jar -s:../design/design-board-baseball-crane.svg -xsl:../build/design2burn.xsl -o:svg2svgpdfpng.bat path2svg=svg/ path2png=png/ path2pdf=pdf/ name-suffix=-board-baseball-crane
set errorReturn=%ERRORLEVEL%
if %errorReturn% neq 0 exit /b %errorReturn%
if exist svg2svgpdfpng.bat call svg2svgpdfpng.bat
popd