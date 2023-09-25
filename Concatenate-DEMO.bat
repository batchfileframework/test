@echo off
:setup
:main
REM Call :GetConsoleAndPrintTitle-quick-DEMO
REM Call :GetConsoleAndPrintTitle-DEMO
REM Call :PrintWindowClientRectFromHWND-DEMO
REM call :PrintWindowRectangleFromHWND-DEMO
REM Call :IfInStr-DEMO
REM Call :SetEllipseWindow-DEMO
call :Concatenate-mini-DEMO
Call :Concatenate-DEMO

GoTo :EOF

:Concatenate-mini-DEMO

echo -------------------------------
Call :Concatenate "abc" "def" "ghi" _myConcatenated-Mini-1

echo.&echo.&echo result for Call :Concatenate "abc" "def" "ghi" _myConcatenated-Mini-1
echo Demonstrate concatenate of 3 strings by value, default separator of " " is used
echo.&echo %_myConcatenated-Mini-1%

echo -------------------------------

set myvar=jkl
set myothervar=mno
set myotherothervar=pqr

Call :Concatenate myvar myothervar myotherothervar _myConcatenated-Mini-2

echo.&echo.&echo result for Call :Concatenate myvar myothervar myotherothervar _myConcatenated-Mini-2
echo Demonstrate concatenate of 3 strings by reference, default separator of " " is used
echo.&echo %_myConcatenated-Mini-2%


echo -------------------------------

set myarray[0]=stu
set myarray[1]=vwx
set myarray[2]=yzA
set /a "myarray.ubound=2"

Call :Concatenate myarray _myConcatenated-Mini-3

echo.&echo.&echo result for Call :Concatenate myarray _myConcatenated-Mini-3
echo Demonstrate concatenate of 3 strings in an array
echo.&echo %_myConcatenated-Mini-3%

echo -------------------------------

Call :Concatenate "abc" "def" "ghi" myvar myothervar myotherothervar myarray _myConcatenated-Mini-4

echo.&echo.&echo result for Call :Concatenate "abc" "def" "ghi" myvar myothervar myotherothervar myarray _myConcatenated-Mini-4
echo Demonstrate concatenate with all 3 previous methods combined
echo.&echo %_myConcatenated-Mini-4%

echo -------------------------------

Call :Concatenate SEPARATOR 1 "abc" "def" "ghi" myvar myothervar myotherothervar myarray _myConcatenated-Mini-5

echo.&echo.&echo result for Call :Concatenate SEPARATOR 1 "abc" "def" "ghi" myvar myothervar myotherothervar myarray _myConcatenated-Mini-5
echo Demonstrate same as previous, but a separator is specified to "1"
echo.&echo %_myConcatenated-Mini-5%

echo -------------------------------
Call :Concatenate "abc" "def" "ghi" myvar SEPARATOR 1 myothervar myotherothervar myarray _myConcatenated-Mini-6

echo.&echo.&echo result for Call :Concatenate "abc" "def" "ghi" myvar SEPARATOR 1 myothervar myotherothervar myarray _myConcatenated-Mini-6
echo Demonstrate same as previous, but a separator is specified to "1" starting from myothervar/vwx only
echo.&echo %_myConcatenated-Mini-6%

echo -------------------------------
Call :Concatenate "abc" SEPARATOR 1 "def" "ghi" myvar SEPARATOR 2 myothervar myotherothervar SEPARATOR " " myarray _myConcatenated-Mini-7

echo.&echo.&echo result for Call :Concatenate "abc" SEPARATOR 1 "def" "ghi" myvar SEPARATOR 2 myothervar myotherothervar SEPARATOR " " myarray _myConcatenated-Mini-7
echo Demonstrate same as previous, but multiple separators are used
echo.&echo %_myConcatenated-Mini-7%

echo -------------------------------


GoTo :EOF

:Concatenate-DEMO

Call :ClearVariablesByPrefix %_Concatenate_prefix% _Concatenate

set "debug="

set myarray[0]=Mary had a little lamb,
set myarray[1]=Its fleece was white as snow, yeah.
set myarray[2]=Everywhere the child went,
set myarray[3]=The little lamb was sure to go, yeah.
set /a "myarray.lbound=0"
set /a "myarray.ubound=3"

set "myarray2[-1]= "
set myarray2[0]=He followed her to school one day,
set myarray2[1]=And broke the teacher's rule.
set myarray2[2]=What a time did they have,
set myarray2[3]=That day at school.
set /a "myarray2.lbound=-1"
set /a "myarray2.ubound=3"

set "myarray3[-1]= "
set myarray3[0]=Tisket, tasket,
set myarray3[1]=A green and yellow basket.
set myarray3[2]=Sent a letter to my baby,
set myarray3[3]=On my way I passed it.
set /a "myarray3.lbound=-1"
set /a "myarray3.ubound=3"

echo -------------------------------
Call :Concatenate myarray myarray2 myarray3 _myConcatenatedString1

echo.&echo.&echo result for Call :Concatenate myarray myarray2 myarray3 _myConcatenatedString1
echo Demonstrate concatenate of all elements within 3 array, default separator of " " will be used
echo.&echo %_myConcatenatedString1%

echo -------------------------------
Call :Concatenate SEPARATOR X myarray myarray2 myarray3 _myConcatenatedString2

echo.&echo.&echo result for Call :Concatenate SEPARATOR X myarray myarray2 myarray3 _myConcatenatedString2
echo demonstrate concatenation, same as previous but a custom separator is specified
echo.&echo %_myConcatenatedString2%

echo -------------------------------
Call :Concatenate SEPARATOR X myarray SEPARATOR Y myarray2 SEPARATOR Z myarray3 _myConcatenatedString3

echo.&echo.&echo result for Call :Concatenate SEPARATOR X myarray SEPARATOR Y myarray2 SEPARATOR Z myarray3 _myConcatenatedString3
echo demonstrate concatenation, same as previous but a custom separator is specified on each new array
echo.&echo %_myConcatenatedString3%

echo -------------------------------
Call :Concatenate "Mary had a little lamb," "Its fleece was white as snow, yeah." "Everywhere the child went," "The little lamb was sure to go, yeah." _myConcatenatedString4

echo.&echo.&echo result for Call :Concatenate "Mary had a little lamb," "Its fleece was white as snow, yeah." "Everywhere the child went," "The little lamb was sure to go, yeah." _myConcatenatedString4
echo demonstrate concatenation of plain arguments by value instead of arrays by reference
echo.&echo %_myConcatenatedString4%

echo -------------------------------
Call :Concatenate "Mary had a little lamb," "Its fleece was white as snow, yeah." "Everywhere the child went," "The little lamb was sure to go, yeah." myarray2 myarray3 _myConcatenatedString5

echo.&echo.&echo result for Call :Concatenate "Mary had a little lamb," "Its fleece was white as snow, yeah." "Everywhere the child went," "The little lamb was sure to go, yeah." myarray2 myarray3 _myConcatenatedString5
echo demonstrate concatenation of plain argument by value but then also including two array elements by reference
echo.&echo %_myConcatenatedString5%

set myseparator=123
set "myvalue=Its fleece was white as snow, yeah."
set "myothervalue=The little lamb was sure to go, yeah."

echo -------------------------------
Call :Concatenate "Mary had a little lamb," myvalue "Everywhere the child went," myothervalue myarray2 SEPARATOR myseparator myarray3 _myConcatenatedString6

echo.&echo.&echo result for Call :Concatenate "Mary had a little lamb," myvalue "Everywhere the child went," myothervalue myarray2 SEPARATOR myseparator myarray3 _myConcatenatedString6
echo demonstrate concatenation of plain argument by value but then also including two array elements by reference
echo however this time, the second and fourth elements are provided by non-array reference, and a separator is specified by reference for myarray3 
echo.&echo %_myConcatenatedString6%



rem Two empty lines above are essential
set newline=^


rem Two empty lines above are essential

set debug=true
echo.&echo.&echo.

Call :Concatenate-debug SEPARATOR newline myarray myarray2 myarray3 TheOutput

echo.&echo.&echo result for Call :Concatenate SEPARATOR newline myarray myarray2 myarray3 TheOutput
echo.&echo %TheOutput%

set TheOutput

REM setlocal enabledelayedexpansion
REM echo.&echo.!_myConcatenatedString!
REM endlocal

REM echo.&echo set _Concatenate_buffer&echo.
REM set _Concatenate_buffer
REM echo.&echo set _myConcatenatedString&echo.
REM set _myConcatenatedString

GoTo :EOF

::Usage Call :Concatenate optional (SEPARATOR "X") InputArray1 InputArray2 InputArrayN OutputValue
:Concatenate
if "[%~1]" EQU "[SEPARATOR]" ( set "_Concatenate_separator=%~2" & shift & shift & GoTo :Concatenate )
set "_Concatenate_prefix=_CA"
if defined %1.ubound ( set "_Concatenate_input=%~1" ) else ( set "_Concatenate_input=Concatenate_placeholder" )
if defined %1.lbound call set /a _Concatenate_lbound=%%%~1.lbound%%
if defined %1.ubound call set /a _Concatenate_ubound=%%%~1.ubound%%
if not defined %1.lbound set /a "_Concatenate_lbound=0"
if not defined %1.ubound set /a "_Concatenate_ubound=0"
set /a "_Concatenate_index=%_Concatenate_lbound%"
setlocal enabledelayedexpansion
if not defined %1.lbound if not defined %1.ubound if not defined %_Concatenate_input%[%_Concatenate_index%] if defined %1 set %_Concatenate_input%[%_Concatenate_index%]=!%1!
if not defined %1.lbound if not defined %1.ubound if not defined %_Concatenate_input%[%_Concatenate_index%] set "%_Concatenate_input%[%_Concatenate_index%]=%~1"
if defined !_Concatenate_separator! ( set _Concatenate_separator=!%_Concatenate_separator%! )
if not defined _Concatenate_separator set "_Concatenate_separator= "
:Concatenate-loop
set _Concatenate_buffer=!_Concatenate_buffer!!%_Concatenate_input%[%_Concatenate_index%]!!_Concatenate_separator!
set /a "_Concatenate_index+=1"
if %_Concatenate_index% LEQ %_Concatenate_ubound% GoTo :Concatenate-loop
for /f "tokens=* delims=" %%a in ('echo.!_Concatenate_buffer!') do (
																endlocal
																set _Concatenate_buffer=%%a
																)
if "[%~3]" NEQ "[]" ( shift & GoTo :Concatenate ) 
setlocal enabledelayedexpansion
for /f "tokens=* delims==" %%a in ('echo.!_Concatenate_buffer!') do (
																endlocal
																set %~2=%%a
																)
Call :ClearVariablesByPrefix %_Concatenate_prefix% _Concatenate
GoTo :EOF


::Usage Call :Concatenate optional (SEPARATOR "X") InputArray1 InputArray2 InputArrayN OutputValue
:Concatenate-debug
if "[%~1]" EQU "[SEPARATOR]" ( set "_Concatenate_separator=%~2" & shift & shift & GoTo :Concatenate-debug )
set "_Concatenate_prefix=_CA"
if defined %1.ubound ( set "_Concatenate_input=%~1" ) else ( set "_Concatenate_input=Concatenate_placeholder" )
if defined %1.lbound call set /a _Concatenate_lbound=%%%~1.lbound%%
if defined %1.ubound call set /a _Concatenate_ubound=%%%~1.ubound%%
if not defined %1.lbound set /a "_Concatenate_lbound=0"
if not defined %1.ubound set /a "_Concatenate_ubound=0"
set /a "_Concatenate_index=%_Concatenate_lbound%"
setlocal enabledelayedexpansion
if not defined %1.lbound if not defined %1.ubound if not defined %_Concatenate_input%[%_Concatenate_index%] if defined %1 set %_Concatenate_input%[%_Concatenate_index%]=!%1!
if not defined %1.lbound if not defined %1.ubound if not defined %_Concatenate_input%[%_Concatenate_index%] set "%_Concatenate_input%[%_Concatenate_index%]=%~1"
if defined !_Concatenate_separator! ( set _Concatenate_separator=!%_Concatenate_separator%! )
if not defined _Concatenate_separator set "_Concatenate_separator= "
:Concatenate-debug-loop
set _Concatenate_buffer=!_Concatenate_buffer!!%_Concatenate_input%[%_Concatenate_index%]!!_Concatenate_separator!
set /a "_Concatenate_index+=1"
if %_Concatenate_index% LEQ %_Concatenate_ubound% GoTo :Concatenate-debug-loop
REM ----------DEBUG----------
if "[%debug%]" NEQ "[true]" for /f "tokens=* delims=" %%a in ('echo.!_Concatenate_buffer!') do (
																endlocal
																REM ----------DEBUG----------
																if "[%debug%]" EQU "[true]" echo This never runs 1 a%%aa
																REM ----------DEBUG----------
																set _Concatenate_buffer=%%a
																)
REM ----------DEBUG----------
if "[%~3]" NEQ "[]" ( shift & GoTo :Concatenate-debug ) 

REM ----------DEBUG----------
if "[%debug%]" EQU "[true]" ( echo so close to working&echo. )
if "[%debug%]" EQU "[true]" echo !_Concatenate_buffer!
if "[%debug%]" EQU "[true]" ( echo.&echo but I can't get the text out of setlocal :^( )
REM ----------DEBUG----------

setlocal enabledelayedexpansion
REM ----------DEBUG----------
if "[%debug%]" NEQ "[true]" for /f "tokens=* delims==" %%a in ('echo.!_Concatenate_buffer!') do (
																endlocal
																REM ----------DEBUG----------
																if "[%debug%]" EQU "[true]"  echo This never runs 2 a%%aa
																REM ----------DEBUG----------
																set %~2=%%a
																)
REM ----------DEBUG----------
if "[%debug%]" EQU "[true]" echo set %~2=_Concatenate_buffer
REM if "[%debug%]" EQU "[true]" set %~2=!_Concatenate_buffer!
set %~2=!_Concatenate_buffer!
REM ----------DEBUG----------
if "[%debug%]" NEQ "[true]" Call :ClearVariablesByPrefix %_Concatenate_prefix% _Concatenate
REM ----------DEBUG----------
GoTo :EOF

:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
if "[%~1]" NEQ "[]" for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :ClearVariablesByPrefix
GoTo :EOF
