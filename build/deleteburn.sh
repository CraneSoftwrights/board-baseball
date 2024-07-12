DP0=$( cd "$(dirname "$0")" ; pwd -P )

pushd "$DP0/../burn" >/dev/null
if [ -f svg2svgpdfpng.bat ]; then rm svg2svgpdfpng.bat ; fi
if [ -f svg2svgpdfpng.sh  ]; then rm svg2svgpdfpng.sh  ; fi
find svg -name \*.svg -exec rm {} \;
find svg -name \*.svg.txt -exec rm {} \;
find png -name \*.png -exec rm {} \;
find pdf -name \*.pdf -exec rm {} \;
popd >/dev/null