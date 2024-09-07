DP0=$( cd "$(dirname "$0")" ; pwd -P )

pushd "$DP0/../burn" >/dev/null

inkscape "../design/scorecard-design-crane.svg" --batch-process --actions-file="../build/scorecard-board-baseball-crane.svg.txt"

if [ -f png/scorecard-board-baseball-crane.png ]
then
cp png/scorecard-board-baseball-crane.png ../shared/scorecard-board-baseball-crane.png
fi 

popd >/dev/null
