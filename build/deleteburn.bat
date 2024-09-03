pushd "%~dp0\..\burn"
if exist svg2svgpdfpng.bat del svg2svgpdfpng.bat
if exist svg2svgpdfpng.sh  del svg2svgpdfpng.sh
if exist svg\nul rmdir /s /q svg
if exist pdf\nul rmdir /s /q pdf
if exist png\nul rmdir /s /q png
mkdir svg
mkdir pdf
mkdir png
popd
