pushd "%~dp0\..\burn"
if exist svg2svgpdfpng.bat del svg2svgpdfpng.bat
if exist svg2svgpdfpng.sh  del svg2svgpdfpng.sh
if exist svg\*.svg del svg\*.svg
if exist svg\*.svg.txt del svg\*.svg.txt
if exist png\*.png del png\*.png
if exist pdf\*.pdf del pdf\*.pdf
popd
