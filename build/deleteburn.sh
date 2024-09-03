DP0=$( cd "$(dirname "$0")" ; pwd -P )

pushd "$DP0/../burn" >/dev/null
if [ -f svg2svgpdfpng.bat ]; then rm svg2svgpdfpng.bat ; fi
if [ -f svg2svgpdfpng.sh  ]; then rm svg2svgpdfpng.sh  ; fi
if [ -d svg               ]; then rm -r svg            ; fi
if [ -d pdf               ]; then rm -r pdf            ; fi
if [ -d png               ]; then rm -r png            ; fi
mkdir svg
mkdir pdf
mkdir png
popd >/dev/null