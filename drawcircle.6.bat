@echo off
setlocal enabledelayedexpansion

REM Function to draw an ASCII circle with the "O" character.
REM Usage: call :DrawASCIICircle <radius>

:DrawASCIICircle
set "radius=%~1"
set "centerX=30"  REM Change this value to set the X-coordinate of the center of the circle
set "centerY=10"  REM Change this value to set the Y-coordinate of the center of the circle

REM Clear the screen
cls

REM Draw the circle point by point
set /a "diameter=radius * 2"
for /L %%i in (0, 5, 180) do (
    set /a "angle=%%i"

    REM Calculate the coordinates using integer arithmetic
    set /a "x=centerX + radius * 1000 * %%i / 180000"
    set /a "y=centerY + radius * 1000 - (radius * 1000 * %%i / 180000) + (radius * 1000 %% 180000 > 89999 ? 1000 : 0)"

    REM Draw the point
    call :DrawPoint !x! !y!
)

exit /b

:DrawPoint
REM Draw a single point at the given coordinates
setlocal
set /a "x=%~1"
set /a "y=%~2"

REM Check if the point is within the drawing area (0 to 80 in X and 0 to 25 in Y for a standard command prompt window)
if %x% geq 0 if %x% leq 80 if %y% geq 0 if %y% leq 25 (
    REM Move the cursor to the given coordinates and print the "O" character
    <nul set /p "=O"
    exit /b
)
endlocal
exit /b