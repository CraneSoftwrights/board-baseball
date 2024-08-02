echo "%~dp0"
pushd "%~dp0"

call build\deleteburn.bat
set errorReturn=%ERRORLEVEL%
if %errorReturn% neq 0 exit /b %errorReturn%

call build\scorecard2burn.bat
set errorReturn=%ERRORLEVEL%
if %errorReturn% neq 0 exit /b %errorReturn%

call build\design2burn.bat
set errorReturn=%ERRORLEVEL%
if %errorReturn% neq 0 exit /b %errorReturn%

copy burn\png\PBF-print-combo-board-baseball-crane.png shared\combo-board-baseball-crane.png 
copy burn\png\PBF-print-basic-board-baseball-crane.png shared\basic-board-baseball-crane.png 
copy burn\png\PBF-print-extended-board-baseball-crane.png shared\extended-board-baseball-crane.png 
copy burn\png\PBB-print-board-baseball-crane.png shared\back-board-baseball-crane.png 
copy burn\png\scorecard-board-baseball-crane.png shared\scorecard-board-baseball-crane.png 

popd
