pushd "%~dp0\..\burn"

inkscape "..\design/scorecard-design-crane.svg" --batch-process --actions-file="..\build/scorecard-board-baseball-crane.svg.txt"

popd