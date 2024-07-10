DP0=$( cd "$(dirname "$0")" ; pwd -P )

pushd "$DP0/../burn" >/dev/null

inkscape "../design/scorecard-design-crane.svg" --actions-file="../build/scorecard-board-baseball-crane.svg.txt"

popd >/dev/null
