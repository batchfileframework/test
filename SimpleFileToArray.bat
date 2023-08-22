@echo off

Call :GetFunctionExits-DEMO
REM call :GetEndOfFunction-DEMO
REM call :GetLabels-DEMO
REM call :GetEmptyLines-DEMO
REM call :GetIndexArray-simple-DEMO
REM Call :GetIndexArray-DEMO
GoTo :EOF

:GetFunctionExits-DEMO

Call :GetFunctionExits ListEOfFunctionsExits batchsample.bat

Call :EchoArray ListEndOfFunctions

GoTo :EOF

:GetEndOfFunction-DEMO

Call :GetEndOfFunction ListEndOfFunctions batchsample.bat
Call :EchoArray ListEndOfFunctions
Call :EchoArray ListEndOfFunctions .name
set ListEndOfFunctions

Call :ClearVariablesByPrefix ListEndOfFunctions


GoTo :EOF

:GetLabels-DEMO

Call :GetLabels ListOfLabels batchsample.bat
echo.& echo Print all line numbers with a label
Call :EchoArray ListOfLabels 
echo.& echo Print all label names
Call :EchoArray ListOfLabels .name
echo.& echo showing actual values
set ListOfLabels

Call :ClearVariablesByPrefix ListOfLabels

GoTo :EOF

:GetEmptyLines-DEMO

Call :GetEmptyLines ListOfEmptyLines batchsample.bat
echo.& echo List empty lines
Call :EchoArray ListOfEmptyLines 
echo.& echo List empty lines, show echoarray to show line numbers (printed number of lines)
Call :EchoArray ListOfEmptyLines  LINENUMBERS
echo.& echo List empty lines, show echoarray to show name of printed variable
Call :EchoArray ListOfEmptyLines SHOWVARNAME
echo.& echo List empty lines, show echoarray to show name of printed variable and printed number of lines
Call :EchoArray ListOfEmptyLines SHOWVARNAME LINENUMBERS
echo.& echo List empty lines, show echoarray to print values in vertical direction (omit linefeed)
Call :EchoArray ListOfEmptyLines  VERTICALMODE
echo.&echo.& echo List empty lines, show echoarray to print values in vertical direction (omit linefeed) and include number of lines
Call :EchoArray ListOfEmptyLines  VERTICALMODE LINENUMBERS
echo.&echo.& echo List empty lines, show echoarray to print ' all dressed mode" 
Call :EchoArray ListOfEmptyLines  VERTICALMODE SHOWVARNAME LINENUMBERS
Call :ClearVariablesByPrefix ListOfEmptyLines

echo.& echo repeat previous exercise but with range "1-3" "20,30-33,30" "99" "3-1" mytestindexarray

set mytestindexarray[3]=5
set mytestindexarray[4]=6
set mytestindexarray[5]=5
set mytestindexarray.lbound=3
set mytestindexarray.ubound=5

Call :GetEmptyLines ListOfEmptyLines batchsample.bat
echo.& echo List empty lines with range limit ("1-3" "20,30-33,30" "99" "3-1" mytestindexarray)
Call :EchoArray ListOfEmptyLines "1-3" "20,30-33,30" "99" "3-1" mytestindexarray
echo.& echo List empty lines, show echoarray to show line numbers (printed number of lines) with range limit ("1-3" "20,30-33,30" "99" "3-1" mytestindexarray)
Call :EchoArray ListOfEmptyLines  LINENUMBERS "1-3" "20,30-33,30" "99" "3-1" mytestindexarray
echo.& echo List empty lines, show echoarray to show name of printed variable with range limit ("1-3" "20,30-33,30" "99" "3-1" mytestindexarray)
Call :EchoArray ListOfEmptyLines SHOWVARNAME "1-3" "20,30-33,30" "99" "3-1" mytestindexarray
echo.& echo List empty lines, show echoarray to show name of printed variable and printed number of lines with range limit ("1-3" "20,30-33,30" "99" "3-1" mytestindexarray)
Call :EchoArray ListOfEmptyLines SHOWVARNAME LINENUMBERS "1-3" "20,30-33,30" "99" "3-1" mytestindexarray
echo.& echo List empty lines, show echoarray to print values in vertical direction (omit linefeed) with range limit ("1-3" "20,30-33,30" "99" "3-1" mytestindexarray)
Call :EchoArray ListOfEmptyLines  VERTICALMODE "1-3" "20,30-33,30" "99" "3-1" mytestindexarray
echo.&echo.& echo List empty lines, show echoarray to print values in vertical direction (omit linefeed) and include number of lines with range limit ("1-3" "20,30-33,30" "99" "3-1" mytestindexarray)
Call :EchoArray ListOfEmptyLines  VERTICALMODE LINENUMBERS "1-3" "20,30-33,30" "99" "3-1" mytestindexarray
echo.&echo.& echo List empty lines, show echoarray to print ' all dressed mode"  with range limit ("1-3" "20,30-33,30" "99" "3-1" mytestindexarray)
Call :EchoArray ListOfEmptyLines  VERTICALMODE SHOWVARNAME LINENUMBERS "1-3" "20,30-33,30" "99" "3-1" mytestindexarray
Call :ClearVariablesByPrefix ListOfEmptyLines

GoTo :EOF


:GetIndexArray-simple-DEMO

echo.&echo test1
Call :GetIndexArray __GIADEMO_IndexArray "12"
Call :EchoArray __GIADEMO_IndexArray & Call :ClearVariablesByPrefix __GIADEMO

echo.&echo test2
Call :GetIndexArray __GIADEMO_IndexArray "12-18"
Call :EchoArray __GIADEMO_IndexArray & Call :ClearVariablesByPrefix __GIADEMO

echo.&echo test3
Call :GetIndexArray __GIADEMO_IndexArray "18-12"
Call :EchoArray __GIADEMO_IndexArray & Call :ClearVariablesByPrefix __GIADEMO

echo.&echo test4
Call :GetIndexArray __GIADEMO_IndexArray "6,18-12,7"
Call :EchoArray __GIADEMO_IndexArray & Call :ClearVariablesByPrefix __GIADEMO

echo.&echo test5
Call :GetIndexArray __GIADEMO_IndexArray "6,5-8,7"
Call :EchoArray __GIADEMO_IndexArray & Call :ClearVariablesByPrefix __GIADEMO

echo.&echo test6
Call :GetIndexArray __GIADEMO_IndexArray "6,7,8,9" "1,2,3,4" "99,98-94,93" "123098,124187,12098124"
Call :EchoArray __GIADEMO_IndexArray & Call :ClearVariablesByPrefix __GIADEMO


echo.&echo test7
set __GIADEMO[0]=6,7
set __GIADEMO[1]=8
set __GIADEMO[2]=9-11
set __GIADEMO[3]=12498,12875,2,1-0
set __GIADEMO.ubound=3

Call :GetIndexArray __GIADEMO_IndexArray "6,7,8,9" __GIADEMO "1,2,3,4"
Call :EchoArray __GIADEMO_IndexArray  & Call :ClearVariablesByPrefix __GIADEMO

echo.&echo test8
Call :GetIndexArray __GIADEMO_IndexArray "1,2,3"
Call :GetIndexArray __GIADEMO_IndexArray "4-6" "7"
Call :GetIndexArray __GIADEMO_IndexArray "8" "9-10" "00,11-14-15-15-15-15-20,39" "40"
Call :EchoArray __GIADEMO_IndexArray  & Call :ClearVariablesByPrefix __GIADEMO

GoTo :EOF

:GetIndexArray-DEMO

Call :ClearVariablesByPrefix  _GIA __GIADEMO
GoTo :GetIndexArray-DEMO-skip
echo.
set "__GIADEMO_range1="
set "__GIADEMO_range2="
set "__GIADEMO_range3="
set "__GIADEMO_range4="
echo GetIndexArray testing ranges "%__GIADEMO_range1%" "%__GIADEMO_range2%" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
Call :GetIndexArray __GIADEMO_IndexArray "%__GIADEMO_range1%" "%__GIADEMO_range2%" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
REM set __GIADEMO_IndexArray 2>nul
Call :EchoArray __GIADEMO_IndexArray
Call :ClearVariablesByPrefix __GIADEMO

:GetIndexArray-DEMO-skip

echo.
set "__GIADEMO_range1=12"
set "__GIADEMO_range2="
set "__GIADEMO_range3="
set "__GIADEMO_range4="
echo GetIndexArray testing ranges "%__GIADEMO_range1%" "%__GIADEMO_range2%" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
Call :GetIndexArray __GIADEMO_IndexArray "%__GIADEMO_range1%" "%__GIADEMO_range2%" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
REM set __GIADEMO_IndexArray 2>nul
Call :EchoArray __GIADEMO_IndexArray
Call :ClearVariablesByPrefix __GIADEMO

echo.
set "__GIADEMO_range1=12,28"
set "__GIADEMO_range2="
set "__GIADEMO_range3="
set "__GIADEMO_range4="
echo GetIndexArray testing ranges "%__GIADEMO_range1%" "%__GIADEMO_range2%" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
Call :GetIndexArray __GIADEMO_IndexArray "%__GIADEMO_range1%" "%__GIADEMO_range2%" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
REM set __GIADEMO_IndexArray 2>nul
Call :EchoArray __GIADEMO_IndexArray
Call :ClearVariablesByPrefix __GIADEMO

echo.
set "__GIADEMO_range1=12,28"
set "__GIADEMO_range2=32"
set "__GIADEMO_range3="
set "__GIADEMO_range4="
echo GetIndexArray testing ranges "%__GIADEMO_range1%" "%__GIADEMO_range2%" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
Call :GetIndexArray __GIADEMO_IndexArray "%__GIADEMO_range1%" "%__GIADEMO_range2%" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
REM set __GIADEMO_IndexArray 2>nul
Call :EchoArray __GIADEMO_IndexArray
Call :ClearVariablesByPrefix __GIADEMO

echo.
set "__GIADEMO_range1=12-18"
set "__GIADEMO_range2="
set "__GIADEMO_range3="
set "__GIADEMO_range4="
echo GetIndexArray testing ranges "%__GIADEMO_range1%" "%__GIADEMO_range2%" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
Call :GetIndexArray __GIADEMO_IndexArray "%__GIADEMO_range1%" "%__GIADEMO_range2%" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
REM set __GIADEMO_IndexArray 2>nul
Call :EchoArray __GIADEMO_IndexArray
Call :ClearVariablesByPrefix __GIADEMO

echo.
set "__GIADEMO_range1=12-18"
set "__GIADEMO_range2[7]=68"
set "__GIADEMO_range2[8]=69"
set "__GIADEMO_range2[9]=71"
set "__GIADEMO_range2.lbound=7"
set "__GIADEMO_range2.ubound=9"
set "__GIADEMO_range3="
set "__GIADEMO_range4="
echo GetIndexArray testing ranges "%__GIADEMO_range1%" "__GIADEMO_range2" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
Call :GetIndexArray __GIADEMO_IndexArray "%__GIADEMO_range1%" "__GIADEMO_range2" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
REM set __GIADEMO_IndexArray 2>nul
Call :EchoArray __GIADEMO_IndexArray
Call :ClearVariablesByPrefix __GIADEMO

echo.
set "__GIADEMO_range1=12-18"
set "__GIADEMO_range2[7]=68"
set "__GIADEMO_range2[8]=69"
set "__GIADEMO_range2[9]=71"
set "__GIADEMO_range2.lbound=7"
set "__GIADEMO_range2.ubound=9"
set "__GIADEMO_range3=100-105-99,299"
set "__GIADEMO_range4="
echo GetIndexArray testing ranges "%__GIADEMO_range1%" "__GIADEMO_range2" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
Call :GetIndexArray __GIADEMO_IndexArray "%__GIADEMO_range1%" "__GIADEMO_range2" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
REM set __GIADEMO_IndexArray 2>nul
Call :EchoArray __GIADEMO_IndexArray
Call :ClearVariablesByPrefix __GIADEMO

echo.
set "__GIADEMO_range1=12-18"
set "__GIADEMO_range2[7]=68"
set "__GIADEMO_range2[8]=69"
set "__GIADEMO_range2[9]=71"
set "__GIADEMO_range2.lbound=7"
set "__GIADEMO_range2.ubound=9"
set "__GIADEMO_range3=100-105-105-105-99,299"
set "__GIADEMO_range4[0]=1"
set "__GIADEMO_range4[1]=3"
set "__GIADEMO_range4[2]=5-7"
set "__GIADEMO_range4[3]=11,13-15,8,7,6"
set "__GIADEMO_range4.ubound=3"
echo GetIndexArray testing ranges "%__GIADEMO_range1%" "__GIADEMO_range2" "%__GIADEMO_range3%" "__GIADEMO_range4" 
Call :GetIndexArray __GIADEMO_IndexArray "%__GIADEMO_range1%" "__GIADEMO_range2" "%__GIADEMO_range3%" "__GIADEMO_range4" 
REM set __GIADEMO_IndexArray 2>nul
Call :EchoArray __GIADEMO_IndexArray

echo. 
echo mirroring previous results through :GetIndexArray a second time
Call :GetIndexArray __GIADEMO_MirrorArray __GIADEMO_IndexArray
Call :EchoArray __GIADEMO_MirrorArray

echo.
echo Trying EchoArray IndexList Feature
Call :EchoArray __GIADEMO_MirrorArray "25-28,36-35,29,34,30,0-1,31,2,32,3,33,4-6,7-9,23-16,10-15,24"
REM set __GIADEMO_MirrorArray
Call :ClearVariablesByPrefix __GIADEMO

GoTo :EOF

:SimpleFileToArray-DEMO
Call :ClearVariablesByPrefix _FTA LinesArray
echo start SimpleFileToArray %time%
Call :SimpleFileToArray LinesArray batchsample.bat
echo end SimpleFileToArray %time%
GoTo :EOF


REM :SimpleFileToArray OutputArray list of rows (2,3,6,34-59,4, start-5, start-end, 37-end) Filename
REM :SimpleFileToArray OutputArray array containing list of rows  Filename

REM :ArrayToFile OutputFile list of rows (variable or array)

::Usage Call :SimpleFileToArray OutputArray Filename
:SimpleFileToArray
set /a "%~1.lbound=%%f"
for /f delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr.exe /N "^" "%~2"') do ( 
	for /f "tokens=1,2* delims=:" %%f in ("%%a") do set /a "%~1.ubound=%%f" & set %~1[%%f]=%%a
	)
set /a "_SFTA_index=1"
call set /a "_SFTA_ubound=%%%~1.ubound%%"
:SimpleFileToArray-loop
setlocal enabledelayedexpansion
set _SFTA_localscope=true
set %~1[%_SFTA_index%]=!%~1[%_SFTA_index%]:*:=!
for /f "delims=" %%a in ('set %~1[%_SFTA_index%] 2^>nul') do (
		endlocal
		set %%a
	)
if defined _SFTA_localscope endlocal & set %~1[%_SFTA_index%]=
set /a "_SFTA_index+=1"
if %_SFTA_index% LEQ %_SFTA_ubound% GoTo :SimpleFileToArray-loop
GoTo :EOF

::Usage Call :SimpleArrayToFile 
:SimpleArrayToFile
call set "_SATF_lbound=%%
find input array lbound
from lbound to ubound 
echo array element to output file
GoTo :EOF

REM finished ?
::Usage Call :GetIndexArray OutputIndexArray ListOfIndex1 ListOfIndex2 ... ListOfIndexN
::Lists of index are appended to the OutputIndexArray, Lists of index can contain
::single elements "18" 
::comma or space separated elements "10,14,23" "10 14 23"
::single ranges "2-9"
::multiple ranges "45-47,48-94" "45-47 48-94"
::ranges can be in descending order "33-66 66-33"
::ranges can includes more than two end stops "33-67-66-99" 
::or a mix of all the above
::not implemented keywords like start middle quarter third twothird threequarter  "start-45,middle-end,third-twothird,start-end,1-end"
::not implemented percentages 10% 20% 33% 100%  "10%-20%,0%-100%,start-100%"
::not implemented features would require knowing the starting and ending index of the reference array
:GetIndexArray
set "_GetIndexArray_prefix=_GIA"
set "_GIA_output=%~1"
if "[%_GIA_output%]" EQU "[]" GoTo :EOF
if "[%_GIA_output%]" NEQ "[%_GIA_output:[]=%]" set "_GIA_output_suffix=%_GIA_output:*]=%" & set "_GIA_output=%_GIA_output:*[=%"
call set "_GIA_output_lbound=%%%~1.lbound%%"
call set "_GIA_output_ubound=%%%~1.ubound%%"
if "[%_GIA_output_lbound%]" EQU "[]" set /a "_GIA_output_lbound=0"
if "[%_GIA_output_ubound%]" EQU "[]" set /a "_GIA_output_ubound=%_GIA_output_lbound%-1"
shift
:GetIndexArray-arguments
if "[%~1]" EQU "[]" GoTo :EOF
Call :ClearVariablesByPrefix _GIA_current_list
set "_GIA_current_list=%~1"
set /a "_GIA_current_list_index=0"
for /f %%a in ('set %_GIA_current_list%[ 2^>nul') do GoTo :GetIndexArray-isarray-arguments
for %%a in (%_GIA_current_list:,= %) do ( call set "_GIA_current_list[%%_GIA_current_list_index%%]=%%a" & call set /a "_GIA_current_list_index+=1" )
set /a "_GIA_current_list_ubound=%_GIA_current_list_index%-1" & set /a "_GIA_current_list_index=0"
REM set _GIA_current_list
GoTo :GetIndexArray-loop
:GetIndexArray-isarray-arguments
call set /a "_GIA_current_list_array_index=%%%_GIA_current_list%.lbound%%" 2>nul
if not defined _GIA_current_list_array_index set /a "_GIA_current_list_array_index=0"
call set /a "_GIA_current_list_array_ubound=%%%_GIA_current_list%.ubound%%" 2>nul
:GetIndexArray-isarray-arguments-loop
call set _GIA_current_list_array_element=%%%_GIA_current_list%[%_GIA_current_list_array_index%]%%
for %%a in (%_GIA_current_list_array_element:,= %) do call set "_GIA_current_list[%%_GIA_current_list_index%%]=%%a" & call set /a "_GIA_current_list_index+=1"
set /a "_GIA_current_list_array_index+=1"
if %_GIA_current_list_array_index% LEQ %_GIA_current_list_array_ubound% GoTo :GetIndexArray-isarray-arguments-loop
set /a "_GIA_current_list_ubound=%_GIA_current_list_index%-1" & set /a "_GIA_current_list_index=0"
:GetIndexArray-loop
REM set _GIA_current_list
call set "_GIA_current_list_element=%%_GIA_current_list[%_GIA_current_list_index%]%%
if "[%_GIA_current_list_element%]" EQU "[%_GIA_current_list_element:-=%]" GoTo :GetIndexArray-range-skip
set /a "_GIA_current_list_element_index=0"
REM echo for %%a in (%_GIA_current_list_element:-= %)
for %%a in (%_GIA_current_list_element:-= %) do ( call set "_GIA_current_list_element[%%_GIA_current_list_element_index%%]=%%a" & call set /a "_GIA_current_list_element_index+=1" )
REM set _GIA_current_list_element
set /a "_GIA_current_list_element_ubound=%_GIA_current_list_element_index%-1" & set /a "_GIA_current_list_element_index=0"
call set /a "_GIA_current_list_element_start=%%_GIA_current_list_element[%_GIA_current_list_element_index%]%%
:GetIndexArray-range-loop
call set /a "_GIA_current_list_element_end=%%_GIA_current_list_element[%_GIA_current_list_element_index%]%%
if %_GIA_current_list_element_start% EQU %_GIA_current_list_element_end% ( call set /a "_GIA_output_ubound+=1" & call set "%_GIA_output%[%%_GIA_output_ubound%%]=%_GIA_current_list_element_start%" & GoTo :GetIndexArray-range-next)
REM if %_GIA_current_list_element_start% EQU %_GIA_current_list_element_end% echo TEST II %_GIA_current_list_element_start% II& GoTo :GetIndexArray-range-next
if %_GIA_current_list_element_start% GTR %_GIA_current_list_element_end% ( set "_GIA_current_list_element_direction=-" ) else ( set "_GIA_current_list_element_direction=+" )
set /a "_GIA_current_list_element_start%_GIA_current_list_element_direction%=1"
REM for /l %%a in (%_GIA_current_list_element_start%,%_GIA_current_list_element_direction%1,%_GIA_current_list_element_end%) do ( echo TEST II %%a II )
for /l %%a in (%_GIA_current_list_element_start%,%_GIA_current_list_element_direction%1,%_GIA_current_list_element_end%) do ( call set /a "_GIA_output_ubound+=1" & call set "%_GIA_output%[%%_GIA_output_ubound%%]=%%a" )
:GetIndexArray-range-next
set /a "_GIA_current_list_element_start=%_GIA_current_list_element_end%"
set /a "_GIA_current_list_element_index+=1"
if %_GIA_current_list_element_index% LEQ %_GIA_current_list_element_ubound% GoTo :GetIndexArray-range-loop
:GetIndexArray-range-skip
REM if "[%_GIA_current_list_element%]" EQU "[%_GIA_current_list_element:-=%]" echo TEST JJ %_GIA_current_list_element% JJ
if "[%_GIA_current_list_element%]" EQU "[%_GIA_current_list_element:-=%]" ( call set /a "_GIA_output_ubound+=1" & call set "%_GIA_output%[%%_GIA_output_ubound%%]=%_GIA_current_list_element%" )
:GetIndexArray-loop-end
Call :ClearVariablesByPrefix _GIA_current_list_element
set /a "_GIA_current_list_index+=1"
if %_GIA_current_list_index% LEQ %_GIA_current_list_ubound% GoTo :GetIndexArray-loop
shift 
if "[%~1]" NEQ "[]" GoTo :GetIndexArray-arguments
set /a "%_GIA_output%.ubound=%_GIA_output_ubound%"
Call :ClearVariablesByPrefix %_GetIndexArray_prefix% _GetIndexArray
GoTo :EOF

REM functional
REM add echo array "verticalmode" (no LF between array elements)
::Usage Call :EchoArray InputArray optional LINENUMBERS optional SHOWVARNAME optional .Suffix optional IndexRange
:EchoArray
set "_EchoArray_input=%~1"
call set /a "_EchoArray_lbound=%%%~1.lbound" 2>nul
if "[%_EchoArray_lbound%]" EQU "[]" set /a "_EchoArray_lbound=0"
call set /a "_EchoArray_ubound=%%%~1.ubound"
set /a "_EchoArray_index=%_EchoArray_lbound%"
shift
:EchoArray-arguments
set "_EchoArray_buffer=%~1"
if not defined _EchoArray_buffer GoTo :EchoArray-arguments-end
if "[%_EchoArray_buffer:~,1%]" EQU "[.]" ( set "_EchoArray_suffix=%_EchoArray_buffer%" & shift & GoTo :EchoArray-arguments )
if "[%_EchoArray_buffer%]" EQU "[LINENUMBERS]" ( set "_EchoArray_showlinenumbers=true" & shift & GoTo :EchoArray-arguments )
if "[%_EchoArray_buffer%]" EQU "[SHOWVARNAME]" ( set "_EchoArray_showvariablename=true" & shift & GoTo :EchoArray-arguments )
if "[%_EchoArray_buffer%]" EQU "[VERTICALMODE]" ( set "_EchoArray_verticalmode=true" & shift & GoTo :EchoArray-arguments )
if "[%~1]" NEQ "[]" if not defined _EchoArray_IndexList.lbound set /a "_EchoArray_IndexList.lbound=1"
REM if "[%~1]" NEQ "[]" echo about to call GetIndexArray on %~1
if "[%~1]" NEQ "[]" ( Call :GetIndexArray _EchoArray_IndexList "%~1" & shift & GoTo :EchoArray-arguments )
:EchoArray-arguments-end
REM if defined _EchoArray_IndexList.ubound set _EchoArray_IndexList
if defined _EchoArray_IndexList.ubound set /a "_EchoArray_ubound=%_EchoArray_IndexList.ubound%"
setlocal enabledelayedexpansion
:EchoArray-loop
REM if defined _EchoArray_IndexList.ubound echo it is defined    echo %_EchoArray_IndexList.ubound%  %_EchoArray_ubound%   _EchoArray_index %_EchoArray_index%  
REM if defined _EchoArray_IndexList.ubound if not defined _EchoArray_IndexList.ubound ( set "_EchoArray_index_actual=%_EchoArray_index%" ) else ( set "_EchoArray_index_actual=!_EchoArray_IndexList[%_EchoArray_index%]!" & if "%_EchoArray_index%" GTR "%_EchoArray_IndexList.ubound%" ( GoTo :EchoArray-loop-end ) )
if not defined _EchoArray_IndexList.ubound ( set "_EchoArray_index_actual=%_EchoArray_index%" ) else ( set "_EchoArray_index_actual=!_EchoArray_IndexList[%_EchoArray_index%]!" )
REM if defined _EchoArray_IndexList.ubound echo im HERE
if defined _EchoArray_showlinenumbers set _EchoArray_prefix=%_EchoArray_index%:
if defined _EchoArray_showvariablename set _EchoArray_prefix=%_EchoArray_input%[%_EchoArray_index_actual%]:
if defined _EchoArray_showvariablename if defined _EchoArray_showlinenumbers set _EchoArray_prefix=%_EchoArray_index%:%_EchoArray_input%[%_EchoArray_index_actual%]:
REM if defined _EchoArray_IndexList.ubound echo it is defined  before verti %_EchoArray_index% echo %_EchoArray_IndexList.ubound%  %_EchoArray_ubound%      
if not defined _EchoArray_verticalmode GoTo :EchoArray-normalmode-loop-next
<nul set /p =%_EchoArray_prefix%!%_EchoArray_input%[%_EchoArray_index_actual%]%_EchoArray_suffix%! 
GoTo :EchoArray-loop-next
:EchoArray-normalmode-loop-next
echo(%_EchoArray_prefix%!%_EchoArray_input%[%_EchoArray_index_actual%]%_EchoArray_suffix%!
:EchoArray-loop-next
set /a "_EchoArray_index+=1"
REM echo if %_EchoArray_index% LEQ %_EchoArray_ubound% GoTo :EchoArray-loop
if %_EchoArray_index% LEQ %_EchoArray_ubound% GoTo :EchoArray-loop
:EchoArray-loop-end
endlocal
Call :ClearVariablesByPrefix _EchoArray
GoTo :EOF

::Usage Call :GetEmptyLines OutputArray Filename
:GetEmptyLines
for /f delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N "^$" "%~2" ^| findstr /N "^"') do ( 
	for /f "tokens=1,2* delims=:" %%f in ("%%a") do set /a "%~1.ubound=%%f" & set %~1[%%f]=%%g
	for /f "tokens=1,2* delims=:" %%f in ("%%a") do set %~1.rows[%%g].type=EmptyLine
	)
set /a "%~1.lbound=1
GoTo :EOF

::Usage Call :GetLabels OutputArray Filename
:GetLabels
for /f delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N "^:[^:]" "%~2" ^| findstr /N "^"') do ( 
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do set /a "%~1.ubound=%%f" & set %~1[%%f]=%%g
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %~1[%%f].name=%%~z
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %~1[%%~z]=%%g
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %~1[%%g]=%%~z
	)
set /a "%~1.lbound=1

GoTo :EOF

::Usage Call :GetEndOfFunction OutputArray Filename
:GetEndOfFunction
for /f delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N /I /C:":EndOf_" "%~2" ^| findstr /N "^"') do ( 
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do set /a "%~1.ubound=%%f" & set %~1[%%f]=%%g
	for /f "tokens=1,2,* delims=:" %%f in ("%%a") do set %~1[%%f].text=%%h
	for /f "tokens=1,2,* delims=:" %%f in ("%%a") do set %~1[%%g]=%%h
	for /f "tokens=1,2,* delims=:" %%f in ("%%a") do set %~1[%%g].type=EndOf_Function
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=*" %%z in ("%%h") do set %~1[%%f].name=%%~z
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %~1[%%~z]=%%g
	for /f "tokens=2 delims=:" %%b in ("%%a") do for /f "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24 delims=:" %%c in ("%%a") do for %%A in (%%c %%d %%e %%f %%g %%h %%i %%j %%k %%l %%m %%n %%o %%p %%q %%r %%s %%t %%u %%v %%w %%x %%y %%z) do (
											set _GetEndOfFunction_buffer=%%A
											setlocal enabledelayedexpansion
											if "[!_GetEndOfFunction_buffer:~,6!]" EQU "[EndOf_]" set _GetEndOfFunction_buffer2=!_GetEndOfFunction_buffer!
											for %%Z in (!_GetEndOfFunction_buffer2!) do endlocal & set %~1[%%~Z]=%%b
											endlocal 
											)
	)
	set /a "%~1.lbound=1
GoTo :EOF



::Usage Call :GetFunctionExits OutputArray Filename
:GetFunctionExits
for /f delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N /I /C:"goto :EOF" /C:"exit /B" "%~2" ^| findstr /N "^"') do ( 
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do set /a "%~1.ubound=%%f" & set %~1[%%f]=%%g
	)
REM findstr /R /C:"exit /b" /C:"goto :eof" filename.txt
REM findstr /N /I /C:"goto :EOF" /C:"exit /B" test.txt
GoTo :EOF

:GetFunctionsFromLabels OutputFunctionsArray InputLabels
remove from exclusion list
GoTo :EOF

:GetBatchFileStructure BatchFileStructureArray EmptyLinesArray (LabelsArray or FunctionArray) (EndOfFunctionArray or ExitArray)
GoTo :EOF


the difference between a label is a function is that a function is a label with a corresponding "EndOfFunction"  label, is not a lifecycle label name (main,setup,setmacro,exit etc..) is not an internal label (ends with -loop -skip -argument etc..)
BFS[element]=linenumber
BFS[element].type=EmptyLine/Label/Function/EndOfFunction/FunctionExit
BFS[element].emptyline=true
BFS[element].label=functionname
BFS[element].function=functionname
BFS[element].endoffunction=functionname(s)
BFS[element].functionexit=Exit line



:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
if "[%~1]" NEQ "[]" for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :ClearVariablesByPrefix
GoTo :EOF






REM removed from AddEscapeCharacters.bat

:GetFunctionDefinition-DEMO

if "[%outputlabelarray.ubound%]" EQU "[]" Call :FindAllLabels-DEMO

echo GetFunctionDefinition %time%
Call :GetFunctionDefinition OutputArray OutputLabelArray OutputEmptylineArray OutputEndOf_Array "loop loop2 end skip cleanup argument params" 
echo GetFunctionDefinition %time%


GoTo :EOF

::Usage Call :GetFunctionDefinition OutputArray LabelsArray EmptyLinesArray EndOf_Array optional ExclusionList
:GetFunctionDefinition
set "_GetFunctionDefinition_prefix=_GFD"
REM loopthrough labels
REM copy only labels that don' t match the exclusion list
REM for each label find the EndOf_ line
REM for each label, find first empty row before label line number
REM for each label, find first empty row after label line number
if "[%~5]" EQU "[]" ( set "_GFD_label_exclusion=loop loop2 end skip cleanup argument params" ) else set ( "_GFD_label_exclusion=%~5" )
set "_GFD_output=%~1"
call set "_GFD_output_ubound=%%%~1.ubound%%"
if "[%_GFD_output_ubound%]" EQU "[]" set "_GFD_output_ubound=-1"
set "_GFD_labels=%~2"
call set "_GFD_labels_ubound=%%%~2.ubound%%"
set /a "_GFD_labels_index=0"
set "_GFD_empty=%~3"
call set "_GFD_empty_ubound=%%%~3.ubound%%"
echo setting  _GFD_EndOf, it should eb OutputEndOf_Array
set "_GFD_EndOf=%~4"
echo _GFD_EndOf is %_GFD_EndOf%
call set "_GFD_EndOf_ubound=%%%~4.ubound%%"
:GetFunctionDefinition-loop
set "_GFD_EnfOfFunctionLine=" & set "_GFD_EmptyBeforeLine=" & set "_GFD_AfterBeforeLine="
echo calling GetFunctionDefinition_IsLabelAfunction
Call :GetFunctionDefinition_IsLabelAfunction %%%_GFD_labels%[%_GFD_labels_index%].labelname%% "%_GFD_label_exclusion%" || GoTo :GetFunctionDefinition-loop-skip
echo calling GetFunctionDefinition_FindEndOfFunctionLineNumber _GFD_EndOf %_GFD_EndOf%
Call :GetFunctionDefinition_FindEndOfFunctionLineNumber %%%_GFD_labels%[%_GFD_labels_index%].labelname%% %_GFD_EndOf% _GFD_EnfOfFunctionLine
if "[%_GFD_EnfOfFunctionLine%]" EQU "[]" GoTo :GetFunctionDefinition-loop-skip
REM if "[%_GFD_EnfOfFunctionLine%]" EQU "[]" Call :GetFunctionDefinition_FindUnmarkedFunctionEndLineNumber
echo calling GetFunctionDefinition_FindEmptyRowBeforeLineNumber
Call :GetFunctionDefinition_FindEmptyRowBeforeLineNumber %%%_GFD_labels%[%_GFD_labels_index%]%% %_GFD_empty% _GFD_EmptyBeforeLine
echo calling GetFunctionDefinition_FindEmptyRowAfterLineNumber
Call :GetFunctionDefinition_FindEmptyRowAfterLineNumber %_GFD_EnfOfFunctionLine% %_GFD_empty% _GFD_AfterBeforeLine
rem output %%%_GFD_labels%[%_GFD_labels_index%].labelname%% _GFD_EmptyBeforeLine _GFD_AfterBeforeLine _GFD_EnfOfFunctionLine
set /a "_GFD_output_ubound+=1"
call output %_GFD_EmptyBeforeLine% %%%_GFD_labels%[%_GFD_labels_index%].labelname%% %_GFD_EnfOfFunctionLine%  %_GFD_AfterBeforeLine% 
call set %_GFD_output%[%_GFD_output_ubound%].name=%%%_GFD_labels%[%_GFD_labels_index%].labelname%%
call set %_GFD_output%[%_GFD_output_ubound%].functionstart=%%%_GFD_labels%[%_GFD_labels_index%]%%
set %_GFD_output%[%_GFD_output_ubound%].functionend=%_GFD_EnfOfFunctionLine%
set %_GFD_output%[%_GFD_output_ubound%].commentstart=%_GFD_EmptyBeforeLine%
set %_GFD_output%[%_GFD_output_ubound%].commentend=%_GFD_AfterBeforeLine%
:GetFunctionDefinition-loop-skip
set /a "_GFD_labels_index+=1"
if %_GFD_labels_index% LEQ %_GFD_labels_ubound% GoTo :GetFunctionDefinition-loop
GoTo :EOF


::Usage Call :GetFunctionDefinition_IsLabelAfunction LabelName optional ExclusionList
:GetFunctionDefinition_IsLabelAfunction
set "_GetFunctionDefinition_label_with_space=%~1" & set "_GetFunctionDefinition_exclusion_list=%~2"
set "_GetFunctionDefinition_label_with_space=%_GetFunctionDefinition_label_with_space:-= %
if "[%_GetFunctionDefinition_exclusion_list%]" EQU "[]" set "_GetFunctionDefinition_exclusion_list=loop loop2 skip end cleanup argument params"
REM for %%a in (%_GetFunctionDefinition_exclusion_list%) do ( for %%c in (%_GetFunctionDefinition_label_with_space%) do ( if "[%%a]" EQU "[%%c]" echo matching %%a and %%c ) )
for %%a in (%_GetFunctionDefinition_exclusion_list%) do ( for %%c in (%_GetFunctionDefinition_label_with_space%) do ( if "[%%a]" EQU "[%%c]" exit /b 1 ) )
exit /b 0
GoTo :EOF

::Usage Call :GetFunctionDefinition_FindEmptyRowBeforeLineNumber LabelLineNumber EmptyLinesArray OutputLineNumber
:GetFunctionDefinition_FindEmptyRowBeforeLineNumber
set /a "_GFD_empty_index=0"
set "_GFD_empty=%~2"
call set "_GFD_empty_ubound=%%%~3.ubound%%"
set /a "_GFD_functionline=%~1"
set "_GFD_currentline="
set "_GFD_lastline="
:GetFunctionDefinition_FindEmptyRowBeforeLineNumber-loop
call set _GFD_currentline=%%%_GFD_empty%[%_GFD_empty_index%]%%
if %_GFD_currentline% LSS %_GFD_functionline% set "_GFD_lastline=%_GFD_currentline%"
if %_GFD_currentline% GEQ %_GFD_functionline% GoTo :GetFunctionDefinition_FindEmptyRowBeforeLineNumber-end
set /a "_GFD_empty_index+=1"
if %_GFD_empty_index% LEQ %_GFD_empty_ubound% GoTo :GetFunctionDefinition_FindEmptyRowBeforeLineNumber-loop
:GetFunctionDefinition_FindEmptyRowBeforeLineNumber-end
set /a "%~3=%_GFD_lastline%"
GoTo :EOF

::Usage Call :GetFunctionDefinition_FindEmptyRowAfterLineNumber LabelLineNumber EmptyLinesArray OutputLineNumber
:GetFunctionDefinition_FindEmptyRowAfterLineNumber
set /a "_GFD_Empty_index=0"
set "_GFD_Empty=%~2"
call set "_GFD_Empty_ubound=%%%~3.ubound%%"
set /a "_GFD_FunctionLine=%~1"
set "_GFD_CurrentLine="
set "_GFD_LastLine="
:GetFunctionDefinition_FindEmptyRowAfterLineNumber-loop
call set _GFD_currentline=%%%_GFD_Empty%[%_GFD_Empty_index%]%%
if %_GFD_CurrentLine% GEQ %_GFD_FunctionLine% ( set "_GFD_LastLine=%_GFD_CurrentLine%" & GoTo :GetFunctionDefinition_FindEmptyRowAfterLineNumber-end )
set /a "_GFD_Empty_index+=1"
if %_GFD_Empty_index% LEQ %_GFD_LastLine% GoTo :GetFunctionDefinition_FindEmptyRowAfterLineNumber-loop
:GetFunctionDefinition_FindEmptyRowAfterLineNumber-end
set /a "%~3=%_GFD_LastLine%"
GoTo :EOF

::Usage Call :GetFunctionDefinition_FindEndOfFunctionLineNumber FunctionName EndOfFunctionLinesArray OutputLineNumber
:GetFunctionDefinition_FindEndOfFunctionLineNumber
set "_GFD_Endof_currentname=" & set "_GFD_Endof_current_substitutions=" & set "_GFD_function_name="
set "_GFD_function_name=:EndOf_%~1"
set /a "_GFD_Endof_index=0"
set "_GFD_Endof_array=%~2"
echo "_GFD_Endof_ubound=%%%~2.ubound%%"
call echo "_GFD_Endof_ubound=%%%~2.ubound%%"
call set "_GFD_Endof_ubound=%%%~2.ubound%%"
set "_GFD_Endof_line="
:GetFunctionDefinition_FindEndOfFunctionLineNumber-loop
echo call set "_GFD_Endof_currentname=%%%_GFD_Endof_array%[%_GFD_Endof_index%].EndOf_name%%
call echo call set "_GFD_Endof_currentname=%%%_GFD_Endof_array%[%_GFD_Endof_index%].EndOf_name%%
call set "_GFD_Endof_currentname=%%%_GFD_Endof_array%[%_GFD_Endof_index%].EndOf_name%%
call set "_GFD_Endof_current_substitutions=%%_GFD_Endof_currentname:%_GFD_function_name%=%%
echo _GFD_Endof_currentname %_GFD_Endof_currentname% 11 %_GFD_Endof_array%[%_GFD_Endof_index%].EndOf_name 22 _GFD_function_name %_GFD_function_name%
if "[%_GFD_Endof_currentname%]" NEQ "[%_GFD_Endof_current_substitutions%]" ( call set /a "_GFD_Endof_line=%%%_GFD_Endof_array%[%_GFD_Endof_index%]%%" & GoTo :GetFunctionDefinition_FindEndOfFunctionLineNumber-end )
echo helo
set /a "_GFD_Endof_index+=1"
echo lohe  if %_GFD_Endof_index% LEQ %_GFD_Endof_ubound% 
if %_GFD_Endof_index% LEQ %_GFD_Endof_ubound% GoTo :GetFunctionDefinition_FindEndOfFunctionLineNumber-loop
echo lohe2
:GetFunctionDefinition_FindEndOfFunctionLineNumber-end
if defined _GFD_Endof_line set /a "%~3=%_GFD_Endof_line%"
GoTo :EOF


:FindAllLabels-DEMO
Call :ClearVariablesByPrefix  _FAERFA OutputEndOf_Array
REM goto :FindAllLabels-DEMO-skip
Call :ClearVariablesByPrefix FileLines OutputLabelArray  OutputEmptylineArray _FALFFLA _FAERFA
echo ClearVariablesByPrefix %time%
Call :FileToArray FileLines "batchsample.bat"
echo FileToArray %time%
REM Call :TrimBeforeCharArray ":" FileLines
REM echo TrimBeforeCharArray %time%

Call :FindAllLabelsFromFileLineArray FileLines OutputLabelArray
echo FindAllLabelsFromFileLineArray %time%

Call :FindAllEmptyRowsFromArray FileLines OutputEmptylineArray
echo FindAllEmptyRowsFromArray %time%
:FindAllLabels-DEMO-skip
Call :FindAllEndOf_rowsFromArray FileLines OutputEndOf_Array
echo FindAllEndOf_rowsFromArray %time%


REM Call :ClearVariablesByPrefix FileLines
REM echo ClearVariablesByPrefix %time%
GoTo :EOF


::Usage Call :FindAllEndOf_rowsFromArray FileLineArray OutputEmptylineArray
:FindAllEndOf_rowsFromArray
set "_FindAllEndOf_rowsFromArray_prefix=_FAEORFA"
set "_FAEORFA_Lines=%~1"
call set /a "_FAEORFA_ubound=%%%_FAEORFA_Lines%.ubound%%"
call set /a "_FAEORFA_index=%%%_FAEORFA_Lines%.lbound%%"
set "_FAEORFA_Output=%~2"
call set /a "_FAEORFA_output_lbound=%%%_FAEORFA_Output%.lbound%%" 2>nul
call set /a "_FAEORFA_output_ubound=%%%_FAEORFA_Output%.ubound%%" 2>nul
if not defined _FAEORFA_output_lbound set /a "_FAEORFA_output_lbound=0"
if not defined _FAEORFA_output_ubound set /a "_FAEORFA_output_ubound=-1"
:FindAllEndOf_rowsFromArray-loop
Call :IsEndOfFunction _FAEORFA_IsEndOf_ %_FAEORFA_Lines%[%_FAEORFA_index%]
if "[%_FAEORFA_IsEndOf_%]" EQU "[true]" set /a "_FAEORFA_output_ubound+=1" 
if "[%_FAEORFA_IsEndOf_%]" EQU "[true]" (
	set "%_FAEORFA_Output%[%_FAEORFA_output_ubound%]=%_FAEORFA_index%"
	Call :GetEndOfFunction %_FAEORFA_Output%[%_FAEORFA_output_ubound%].EndOf_name %_FAEORFA_Lines%[%_FAEORFA_index%]
	)
set /a "_FAEORFA_index+=1"
if %_FAEORFA_index% LEQ %_FAEORFA_ubound% GoTo :FindAllEndOf_rowsFromArray-loop
set /a "%_FAEORFA_Output%.lbound=%_FAEORFA_output_lbound%"
set /a "%_FAEORFA_Output%.ubound=%_FAEORFA_output_ubound%"
Call :ClearVariablesByPrefix %_FindAllENDFUNCrowsFromArray_prefix% _FindAllEndOf_rowsFromArray
GoTo :EOF

::Usage Call :FindAllEmptyRowsFromArray FileLineArray OutputEmptylineArray
:FindAllEmptyRowsFromArray
set "_FindAllEmptyRowsFromArray_prefix=_FAERFA"
set "_FAERFA_Lines=%~1"
call set /a "_FAERFA_ubound=%%%_FAERFA_Lines%.ubound%%"
call set /a "_FAERFA_index=%%%_FAERFA_Lines%.lbound%%"
set "_FAERFA_Output=%~2"
call set /a "_FAERFA_output_lbound=%%%_FAERFA_Output%.lbound%%" 2>nul
call set /a "_FAERFA_output_ubound=%%%_FAERFA_Output%.ubound%%" 2>nul
if not defined _FAERFA_output_lbound set /a "_FAERFA_output_lbound=0"
if not defined _FAERFA_output_ubound set /a "_FAERFA_output_ubound=-1"
set _FAERFA
:FindAllEmptyRowsFromArray-loop
if not defined %_FAERFA_Lines%[%_FAERFA_index%] set /a "_FAERFA_output_ubound+=1" 
if not defined %_FAERFA_Lines%[%_FAERFA_index%] set "%_FAERFA_Output%[%_FAERFA_output_ubound%]=%_FAERFA_index%"
set /a "_FAERFA_index+=1"
if %_FAERFA_index% LEQ %_FAERFA_ubound% GoTo :FindAllEmptyRowsFromArray-loop
Call :ClearVariablesByPrefix %_FindAllEmptyRowsFromArray_prefix% _FindAllEmptyRowsFromArray
GoTo :EOF

::Usage Call :FindAllLabelsFromFileLineArray FileLineArray OutputLabelArray
:FindAllLabelsFromFileLineArray
set "_FindAllLabelsFromFileLineArray_prefix=_FALFFLA"
set "_FALFFLA_Lines=%~1"
call set /a "_FALFFLA_ubound=%%%_FALFFLA_Lines%.ubound%%"
call set /a "_FALFFLA_index=%%%_FALFFLA_Lines%.lbound%%"
set "_FALFFLA_Output=%~2"
call set /a "_FALFFLA_output_lbound=%%%_FALFFLA_Output%.lbound%%" 2>nul
call set /a "_FALFFLA_output_ubound=%%%_FALFFLA_Output%.ubound%%" 2>nul
if not defined _FALFFLA_output_lbound set /a "_FALFFLA_output_lbound=0"
if not defined _FALFFLA_output_ubound set /a "_FALFFLA_output_ubound=-1"
:FindAllLabelsFromFileLineArray-loop
REM if %_FALFFLA_index%==2 echo %_FALFFLA_Lines%[%_FALFFLA_index%]
REM if %_FALFFLA_index%==2 call echo %%%_FALFFLA_Lines%[%_FALFFLA_index%]%%
REM Call :TrimBeforeChar %_FALFFLA_Lines%[%_FALFFLA_index%] : %_FALFFLA_Lines%[%_FALFFLA_index%]
Call :IsLabel _FALFFLA_IsLabel %_FALFFLA_Lines%[%_FALFFLA_index%]
if "[%_FALFFLA_IsLabel%]" EQU "[true]" set /a "_FALFFLA_output_ubound+=1" 
if "[%_FALFFLA_IsLabel%]" EQU "[true]" (
	set "%_FALFFLA_Output%[%_FALFFLA_output_ubound%]=%_FALFFLA_index%"
	Call :GetLabel %_FALFFLA_Output%[%_FALFFLA_output_ubound%].labelname %_FALFFLA_Lines%[%_FALFFLA_index%]
	)
REM if "[%_FALFFLA_IsLabel%]" EQU "[true]" call echo %%%_FALFFLA_Output%[%_FALFFLA_output_ubound%].labelname%%
REM echo falffla %_FALFFLA_index%
set /a "_FALFFLA_index+=1"
REM if %_FALFFLA_index% GTR 500 GoTo :FindAllLabelsFromFileLineArray-skip
if %_FALFFLA_index% LEQ %_FALFFLA_ubound% GoTo :FindAllLabelsFromFileLineArray-loop
REM :FindAllLabelsFromFileLineArray-skip
set /a "%_FALFFLA_Output%.lbound=%_FALFFLA_output_lbound%"
set /a "%_FALFFLA_Output%.ubound=%_FALFFLA_output_ubound%"
Call :ClearVariablesByPrefix %_FindAllLabelsFromFileLineArray_prefix% _FindAllLabelsFromFileLineArray
GoTo :EOF
