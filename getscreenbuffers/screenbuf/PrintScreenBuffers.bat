@echo off 
:setup
:main
Call :PrintScreenBuffer-DEMO
GoTo :EOF

:PrintActiveScreenBuffer
Call :GetScreenBuffers
Call :PrintScreenBuffer console.screenbuffers.active
GoTo :EOF

:PrintAllScreenBuffer-DEMO
Call :GetScreenBuffers
for /l %%a in (0,1,%console.screenbuffers.ubound%) do Call :PrintScreenBuffer console.screenbuffers[%%a]
GoTo :EOF


:GetScreenBuffers
for /f "tokens=*" %%a in ('getscreenbuffers.exe') do set %%a
GoTo :EOF

:PrintScreenBuffer

setlocal enabledelayedexpansion
echo +-----------------------------------------------------------------------------------+
echo ^| Information for %~1                                          ^|
echo +-----------------------------------------------------------------------------------+
echo ^| Handle                   : !%~1.handle!                                                     ^|
echo ^| Size (W x H)             : !%~1.size.width! x !%~1.size.height!                                             ^|
echo ^| Cursor (X x Y)           : !%~1.cursor.x! x !%~1.cursor.y!                                               ^|
echo ^| Window (L x T x R x B)   : !%~1.window.left! x !%~1.window.top! x !%~1.window.right! x !%~1.window.bottom!                                  ^|
echo ^| Window Width             : !%~1.window.width!                                                    ^|
echo ^| Window Height            : !%~1.window.height!                                                     ^|
echo ^| Maximum Window (W x H)   : !%~1.window.maxwidth! x !%~1.window.maxheight!                                               ^|
echo ^| Foreground (R G B I)     : !%~1.attributes.foreground.red! !%~1.attributes.foreground.green! !%~1.attributes.foreground.blue! !%~1.attributes.foreground.intensity!                                                ^|
echo ^| Background (R G B I)     : !%~1.attributes.background.red! !%~1.attributes.background.green! !%~1.attributes.background.blue! !%~1.attributes.background.intensity!                                                ^|
echo ^| Attributes               : Leading Byte - !%~1.attributes.leadingbyte!, Trailing Byte - !%~1.attributes.trailingbyte!                    ^|
echo ^| Grid Horizontal          : !%~1.attributes.grid.horizontal!                                                      ^|
echo ^| Grid Vertical (Low/High) : !%~1.attributes.grid.vertical.lowend!/!%~1.attributes.grid.vertical.highend!                                                    ^|
echo ^| Reverse                  : !%~1.attributes.reverse!                                                      ^|
echo ^| Underscore               : !%~1.attributes.underscore!                                                      ^|
echo +-----------------------------------------------------------------------------------+
endlocal
if "[%~2]" NEQ "[]" shift & GoTo :PrintScreenBuffer
exit /b