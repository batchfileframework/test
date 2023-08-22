@echo off
call :GetEndOfFunction-DEMO
REM call :GetLabels-DEMO
REM call :GetEmptyLines-DEMO
REM call :GetIndexArray-simple-DEMO
REM Call :GetIndexArray-DEMO
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