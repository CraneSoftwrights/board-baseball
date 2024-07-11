rem @echo off
pushd "%~dp0\..\burn"
java -jar ../utilities/saxon9he/saxon9he.jar -s:../design/design-board-baseball-crane.svg -xsl:../build/design2burn.xsl -o:svg2svgpdfpng.bat path2svg=svg/ path2png=png/ path2pdf=pdf/ name-suffix=-board-baseball-crane
set errorReturn=%ERRORLEVEL%
if %errorReturn% neq 0 exit /b %errorReturn%
if exist svg2svgpdfpng.bat call svg2svgpdfpng.bat
popd
