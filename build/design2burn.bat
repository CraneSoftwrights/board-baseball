if exist burn\svg2pdf.bat del burn\svg2pdf.bat
cd burn
java -jar ../utilities/saxon9he/saxon9he.jar -s:../design/design-board-baseball-crane.svg -xsl:../build/design2burn.xsl -o:svg2pdf.bat path2svg=svg/ path2png=png/ path2pdf=pdf/ name-suffix=-board-baseball-crane script=burn/svg2pdf.bat
set errorReturn=%ERRORLEVEL%
if %errorReturn% neq 0 exit /b %errorReturn%
if exist svg2pdf.bat call svg2pdf.bat
