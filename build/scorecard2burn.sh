DP0=$( cd "$(dirname "$0")" ; pwd -P )

pushd "$DP0/../burn" >/dev/null

inkscape "../design/scorecard-design-crane.svg" --actions-file="../build/scorecard-board-baseball-crane.svg.txt"

if [ -f ../burn/png/scorecard-design-crane.png ]
then
cp ../burn/png/scorecard-design-crane.png ../shared/scorecard-design-crane.png
fi 

popd >/dev/null
