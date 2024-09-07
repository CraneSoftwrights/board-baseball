rem @echo off
pushd "%~dp0\..\burn"

set ss=stylesheet-not-found-designSVG2burnFiles.xsl
if exist ../../designSVG2burnFiles/designSVG2burnFiles.xsl ] set ss=../../designSVG2burnFiles/designSVG2burnFiles.xsl
if exist ../utilities/designSVG2burnFiles/designSVG2burnFiles.xsl ] set ss=../utilities/designSVG2burnFiles/designSVG2burnFiles.xsl

java -jar ../utilities/saxon9he/saxon9he.jar -s:../design/design-board-baseball-crane.svg -xsl:%ss% -o:svg2svgpdfpng.bat path2svg=svg/ path2png=png/ path2pdf=pdf/ name-suffix=-board-baseball-crane minimum-stroke-width=.003in minimum-stroke-width=.003in cut-colour=ff00ff cut-width=.001in
set errorReturn=%ERRORLEVEL%
if %errorReturn% neq 0 exit /b %errorReturn%
if exist svg2svgpdfpng.bat call svg2svgpdfpng.bat
popd
