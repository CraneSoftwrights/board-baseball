DP0=$( cd "$(dirname "$0")" ; pwd -P )

pushd "$DP0" >/dev/null

sh build/deleteburn.sh
errorReturn=$?
if [ $errorReturn -ne 0 ]; then exit $errorReturn ; fi

sh build/scorecard2burn.sh
errorReturn=$?
if [ $errorReturn -ne 0 ]; then exit $errorReturn ; fi

# The error output is filtered for Inkscape warnings that appear innocuous
sh build/design2burn.sh 2>&1 | grep -v org.inkscape | grep -v "^\s*$"
errorReturn=$?
if [ $errorReturn -ne 0 ]; then exit $errorReturn ; fi

cp burn/png/SBF-print-combo-board-baseball-crane.png shared/combo-board-baseball-crane.png 
cp burn/png/SBF-print-basic-board-baseball-crane.png shared/basic-board-baseball-crane.png 
cp burn/png/SBF-print-extended-board-baseball-crane.png shared/extended-board-baseball-crane.png 
cp burn/png/SBB-print-board-baseball-crane.png shared/back-board-baseball-crane.png 
cp burn/png/scorecard-board-baseball-crane.png shared/scorecard-board-baseball-crane.png 

popd >/dev/null
