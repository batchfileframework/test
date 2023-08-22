@echo off

REM echo.
REM for /f "tokens=1,2,3,4,* skip=3 delims=: " %%a in ('powercfg /list') do ( 
	REM if "[%%a %%b %%c]" EQU "[Power Scheme GUID]" (
		REM for /f "tokens=1,* delims=()" %%f in ("%%e") do (
			REM if "[%%g]" EQU "[ *]" ( set "_powercfglist_default=defaultscheme" ) else ( set "_powercfglist_default=" )
			REM setlocal enabledelayedexpansion
				REM echo Power Scheme Name : %%f GUID : %%d !_powercfglist_default!
				REM if "[!powercfg.scheme.ubound!]" EQU "[]" ( set /a "powercfg.scheme.ubound=0" ) else ( set /a "powercfg.scheme.ubound+=1" )
				REM set "powercfg.scheme[!powercfg.scheme.ubound!].guid=%%f"
				REM set "powercfg.scheme[!powercfg.scheme.ubound!].name=%%d"
				REM if "[%!_powercfglist_default!%]" EQU "defaultscheme" ( set "powercfg.scheme.default.guid=%%f" & set "powercfg.scheme.default.name=%%d" )
			REM endlocal & set /a "powercfg.scheme.ubound=%powercfg.scheme.ubound%" & set "powercfg.scheme.default.guid=%powercfg.scheme.default.guid%" & set "powercfg.scheme.default.name=%powercfg.scheme.default.name%" & set "powercfg.scheme[%powercfg.scheme.ubound%].guid=%%f"
				REM set "powercfg.scheme[!powercfg.scheme.ubound!].name=%%d"
			REM )
		REM )
	REM )
	

REM Call :ClearVariablesByPrefix powercfg
REM set powercfg
cls

Call :ClearVariablesByPrefix _
Call :ClearVariablesByPrefix _powercfg_demo

REM Call :GetPowercfgSchemes
REM Call :GetPowerSchemeContents
REM Call :GetPowerSettings

Goto :skipsection

echo List all power schemes by name
Call :ListPowerSchemes 
echo.

echo List all power schemes into an array, then display this array
Call :ListPowerSchemes _powercfg_demo_array
set _powercfg_demo_array
Call :ClearVariablesByPrefix _powercfg_demo_array
echo.

echo List all power scheme subgroups in each power scheme
Call :ListAllPowerSubgroups
echo.

echo List all power scheme subgroups into an array, then display this array
Call :ListAllPowerSubgroups _powercfg_demo_array
set _powercfg_demo_array
Call :ClearVariablesByPrefix _powercfg_demo_array
echo.

echo List all the power scheme subgroups, of just power scheme [0], without the prefix
Call :ListPowerSubgroups NOPREFIX 0
echo.

echo List all the power scheme subgroups, of just power scheme [0], without the prefix, into an array and then display it
Call :ListPowerSubgroups NOPREFIX 0 _powercfg_demo_array
set _powercfg_demo_array
Call :ClearVariablesByPrefix _powercfg_demo_array
echo.

REM Call :GetPowerSchemeIndex Powerscheme(name or guid) optional OutputIndex
REM echo Testing GetPowerSchemeIndex
REM echo Call GetPowerSchemeIndex with only powerscheme name and checking errorlevel after
REM Call :GetPowerSchemeIndex Balanced
REM echo Balanced errorlevel %errorlevel%
REM Call :GetPowerSchemeIndex "High performance"
REM echo High performance errorlevel %errorlevel%
REM Call :GetPowerSchemeIndex "Power saver"
REM echo Power saver errorlevel %errorlevel%
REM echo.
REM echo Call GetPowerSchemeIndex with only powerscheme guid and checking errorlevel after
REM Call :GetPowerSchemeIndex 381b4222-f694-41f0-9685-ff5bb260df2e
REM echo Balanced errorlevel %errorlevel%
REM Call :GetPowerSchemeIndex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
REM echo High performance errorlevel %errorlevel%
REM Call :GetPowerSchemeIndex a1841308-3541-4fab-bc81-f71556f20b4a
REM echo Power saver errorlevel %errorlevel%
REM echo.
REM echo Call GetPowerSchemeIndex with only powerscheme index and checking errorlevel after
REM Call :GetPowerSchemeIndex 0
REM echo Balanced errorlevel %errorlevel%
REM Call :GetPowerSchemeIndex 1
REM echo High performance errorlevel %errorlevel%
REM Call :GetPowerSchemeIndex 2
REM echo Power saver errorlevel %errorlevel%
REM echo.
REM echo Call GetPowerSchemeIndex with powerscheme name and outputvariable and checking errorlevel after
REM Call :GetPowerSchemeIndex Balanced myoutputvariable
REM echo Balanced errorlevel %errorlevel% %myoutputvariable%
REM Call :GetPowerSchemeIndex "High performance" myoutputvariable
REM echo High performance errorlevel %errorlevel% %myoutputvariable%
REM Call :GetPowerSchemeIndex "Power saver" myoutputvariable
REM echo Power saver errorlevel %errorlevel% %myoutputvariable%
REM echo.
REM echo Call GetPowerSchemeIndex with powerscheme guid and checking errorlevel after
REM Call :GetPowerSchemeIndex 381b4222-f694-41f0-9685-ff5bb260df2e myoutputvariable
REM echo Balanced errorlevel %errorlevel% %myoutputvariable%
REM Call :GetPowerSchemeIndex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c myoutputvariable
REM echo High performance errorlevel %errorlevel% %myoutputvariable%
REM Call :GetPowerSchemeIndex a1841308-3541-4fab-bc81-f71556f20b4a myoutputvariable
REM echo Power saver errorlevel %errorlevel% %myoutputvariable%
REM echo.
REM echo Call GetPowerSchemeIndex with powerscheme index and checking errorlevel after
REM Call :GetPowerSchemeIndex 0 myoutputvariable
REM echo Balanced errorlevel %errorlevel% %myoutputvariable%
REM Call :GetPowerSchemeIndex 1 myoutputvariable
REM echo High performance errorlevel %errorlevel% %myoutputvariable%
REM Call :GetPowerSchemeIndex 2 myoutputvariable
REM echo Power saver errorlevel %errorlevel% %myoutputvariable%
REM echo.

REM echo Testing GetPowerSubgroupIndex
REM echo Call GetPowerSubgroupIndex with only powerscheme name, subgroup name and checking errorlevel after
REM Call :GetPowerSubgroupIndex Balanced "Hard disk"
REM echo Balanced errorlevel %errorlevel%
REM Call :GetPowerSubgroupIndex "High performance" "Internet Explorer"
REM echo High performance errorlevel %errorlevel%
REM Call :GetPowerSubgroupIndex "Power saver" "Desktop background settings"
REM echo Power saver errorlevel %errorlevel%
REM echo.
REM echo Call GetPowerSubgroupIndex with only powerscheme guid, subgroup guid and checking errorlevel after
REM Call :GetPowerSubgroupIndex 381b4222-f694-41f0-9685-ff5bb260df2e 0012ee47-9041-4b5d-9b77-535fba8b1442
REM echo Balanced errorlevel %errorlevel%
REM Call :GetPowerSubgroupIndex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 02f815b5-a5cf-4c84-bf20-649d1f75d3d8
REM echo High performance errorlevel %errorlevel%
REM Call :GetPowerSubgroupIndex a1841308-3541-4fab-bc81-f71556f20b4a 0d7dbae2-4294-402a-ba8e-26777e8488cd
REM echo Power saver errorlevel %errorlevel%
REM echo.
REM echo Call GetPowerSubgroupIndex with only powerscheme index, subgroup index and checking errorlevel after
REM Call :GetPowerSubgroupIndex 0 0
REM echo Balanced errorlevel %errorlevel%
REM Call :GetPowerSubgroupIndex 1 1
REM echo High performance errorlevel %errorlevel%
REM Call :GetPowerSubgroupIndex 2 2
REM echo Power saver errorlevel %errorlevel%
REM echo.
REM echo Call GetPowerSubgroupIndex with powerscheme name, subgroup name and outputvariable and checking errorlevel after
REM Call :GetPowerSubgroupIndex Balanced "Hard disk" myoutputvariable
REM echo Balanced errorlevel %errorlevel% %myoutputvariable%
REM Call :GetPowerSubgroupIndex "High performance" "Internet Explorer" myoutputvariable
REM echo High performance errorlevel %errorlevel% %myoutputvariable%
REM Call :GetPowerSubgroupIndex "Power saver" "Desktop background settings" myoutputvariable
REM echo Power saver errorlevel %errorlevel% %myoutputvariable%
REM echo.
REM echo Call GetPowerSubgroupIndex with powerscheme guid, subgroup guid and checking errorlevel after
REM Call :GetPowerSubgroupIndex 381b4222-f694-41f0-9685-ff5bb260df2e 0012ee47-9041-4b5d-9b77-535fba8b1442 myoutputvariable
REM echo Balanced errorlevel %errorlevel% %myoutputvariable%
REM Call :GetPowerSubgroupIndex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 02f815b5-a5cf-4c84-bf20-649d1f75d3d8 myoutputvariable
REM echo High performance errorlevel %errorlevel% %myoutputvariable%
REM Call :GetPowerSubgroupIndex a1841308-3541-4fab-bc81-f71556f20b4a 0d7dbae2-4294-402a-ba8e-26777e8488cd myoutputvariable
REM echo Power saver errorlevel %errorlevel% %myoutputvariable%
REM echo.
REM echo Call GetPowerSubgroupIndex with powerscheme index, subgroup index and checking errorlevel after
REM Call :GetPowerSubgroupIndex 0 0 myoutputvariable
REM echo Balanced errorlevel %errorlevel% %myoutputvariable%
REM Call :GetPowerSubgroupIndex 1 1 myoutputvariable
REM echo High performance errorlevel %errorlevel% %myoutputvariable%
REM Call :GetPowerSubgroupIndex 2 2 myoutputvariable
REM echo Power saver errorlevel %errorlevel% %myoutputvariable%
REM echo.

REM echo Testing GetPowerSettingIndex
REM echo Call GetPowerSettingIndex with only powerscheme name, subgroup name, setting name and checking errorlevel after
REM Call :GetPowerSettingIndex Balanced "Hard disk" "Turn off hard disk after"
REM echo Balanced errorlevel %errorlevel%
REM Call :GetPowerSettingIndex "High performance" "Sleep" "Allow hybrid sleep"
REM echo High performance errorlevel %errorlevel%
REM Call :GetPowerSettingIndex "Power saver" "Processor power management" "Maximum processor state"
REM echo Power saver errorlevel %errorlevel%
REM echo.
REM echo Call GetPowerSettingIndex with only powerscheme guid, subgroup guid, setting guid and checking errorlevel after
REM Call :GetPowerSettingIndex 381b4222-f694-41f0-9685-ff5bb260df2e 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e
REM echo Balanced errorlevel %errorlevel%
REM Call :GetPowerSettingIndex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e
REM echo High performance errorlevel %errorlevel%
REM Call :GetPowerSettingIndex a1841308-3541-4fab-bc81-f71556f20b4a 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec
REM echo Power saver errorlevel %errorlevel%
REM echo.
REM echo Call GetPowerSettingIndex with only powerscheme index, subgroup index, setting index and checking errorlevel after
REM Call :GetPowerSettingIndex 0 0 0
REM echo Balanced errorlevel %errorlevel%
REM Call :GetPowerSettingIndex 1 1 1
REM echo High performance errorlevel %errorlevel%
REM Call :GetPowerSettingIndex 2 2 2
REM echo Power saver errorlevel %errorlevel%
REM echo.
REM echo Call GetPowerSettingIndex with powerscheme name, subgroup name, setting name and outputvariable and checking errorlevel after
REM Call :GetPowerSettingIndex Balanced "Hard disk" "Turn off hard disk after" myoutputvariable
REM echo Balanced errorlevel %errorlevel% %myoutputvariable%
REM Call :GetPowerSettingIndex "High performance" "Sleep" "Allow hybrid sleep" myoutputvariable
REM echo High performance errorlevel %errorlevel% %myoutputvariable%
REM Call :GetPowerSettingIndex "Power saver" "Processor power management" "Maximum processor state" myoutputvariable
REM echo Power saver errorlevel %errorlevel% %myoutputvariable%
REM echo.
REM echo Call GetPowerSettingIndex with powerscheme guid, subgroup guid, setting guid and checking errorlevel after
REM Call :GetPowerSettingIndex 381b4222-f694-41f0-9685-ff5bb260df2e 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e myoutputvariable
REM echo Balanced errorlevel %errorlevel% %myoutputvariable%
REM Call :GetPowerSettingIndex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e myoutputvariable
REM echo High performance errorlevel %errorlevel% %myoutputvariable%
REM Call :GetPowerSettingIndex a1841308-3541-4fab-bc81-f71556f20b4a 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec myoutputvariable
REM echo Power saver errorlevel %errorlevel% %myoutputvariable%
REM echo.
REM echo Call GetPowerSettingIndex with powerscheme index, subgroup index, setting index and checking errorlevel after
REM Call :GetPowerSettingIndex 0 0 0 myoutputvariable
REM echo Balanced errorlevel %errorlevel% %myoutputvariable%
REM Call :GetPowerSettingIndex 1 1 1 myoutputvariable
REM echo High performance errorlevel %errorlevel% %myoutputvariable%
REM Call :GetPowerSettingIndex 2 2 2 myoutputvariable
REM echo Power saver errorlevel %errorlevel% %myoutputvariable%
REM echo.




echo.
echo List all power settings in all subgroups in all power schemes
Call :ListPowerSettingsInAllSchemes 

echo.
echo List the subgroups only using Call ListPowerSettingsInAllSubgroups 
Call :ListPowerSettingsInAllSubgroups 0



echo.
echo List the subgroups only using Call ListPowerSettingsInAllSubgroups, but without the power scheme prefix
Call :ListPowerSettingsInAllSubgroups NOPREFIX 0

:skipsection

REM Call :StringRepeat-DEMO
REM Call :GetConsoleDimensions-DEMO
REM Call :SetConsoleDimensions-DEMO
REM Call :SquareRoot-DEMO
Call :GetCirclePoint-DEMO
GoTo :EOF 

echo.
echo Creating the available SleepStates array
Call :GetSleepStates

echo.
echo Showing Supported sleep states
Call :GetSupportedSleepStates

echo.
echo Showing unsupported sleep states
Call :GetUnsupportedSleepStates

echo.
echo Showing unsupported sleep states with reason 
Call :GetUnsupportedSleepStatesWithReason



GoTO :EOF


::Usage Call :CommandToArray OutputArray CommandString
:CommandToArray (function description) {function description} [function description] <function description> 
set "_CommandToArray_prefix=_CTA"
set "_CTA_Output=%~1"
call set "_CTA_Output_ubound=%%%~1.ubound%%"
if "[%_CTA_Output_ubound%]"=="[]" ( set "_CTA_Output_ubound=0" ) else ( set /a "_CTA_Output_ubound+=1" ) 
set /a "_CTA_initial_ubound=%_CTA_Output_ubound%"
shift
:CommandToArray-arguments
if "[%~1]" EQU "[skip]" ( set "_CTA_skip=skip=%~2 " & shift & shift & GoTo :CommandToArray-arguments )
if "[%~1]" EQU "[eol]" ( set "_CTA_eol=eol=%~2 " & shift & shift & GoTo :CommandToArray-arguments )
if "[%~1]" EQU "[tokens]" ( set "_CTA_tokens=tokens=%~2 " & shift & shift & GoTo :CommandToArray-arguments )
if "[%~1]" EQU "[delims]" ( set "_CTA_delimiters=delims=%~2" & shift & shift & GoTo :CommandToArray-arguments )
if "[%~1]" EQU "[usebackquote]" ( set "_CTA_backquote=usebackq " & shift & GoTo :CommandToArray-arguments )
if "[%_CTA_tokens%]" EQU "[]" set "_CTA_tokens=tokens=*"
setlocal enabledelayedexpansion
set _CTA_localscope=true
for /f "%_CTA_backquote%%_CTA_skip%%_CTA_eol%%_CTA_tokens%%_CTA_delimiters%" %%a in (%~1) do ( set "%_CTA_Output%[!_CTA_Output_ubound!]=%%a" & set /a "_CTA_Output_ubound+=1" )
if "[%_CTA_initial_ubound%]" NEQ "[%_CTA_Output_ubound%]" set /a "%_CTA_Output%.ubound=!_CTA_Output_ubound!-1"
for /F "delims=" %%a in ('set %_CTA_Output% 2^>nul') do ( endlocal & set "%%a" )
if defined _CTA_localscope endlocal
Call :ClearVariablesByPrefix %_CommandToArray_prefix% _CommandToArray
GoTo :EOF

:HexToDecimal-DEMO
set /a "_HexToDecimal_demo_limit=255"
set /a "_HexToDecimal_demo_index=0"
:HexToDecimal-DEMO-loop
set /a "_HexToDecimal_demo_original=%_HexToDecimal_demo_index%"
Call :DecimalToHex _HexToDecimal_demo_dec2hex _HexToDecimal_demo_original
Call :HexToDecimal _HexToDecimal_demo_hex2dec _HexToDecimal_demo_dec2hex
echo original %_HexToDecimal_demo_original% dec2hex %_HexToDecimal_demo_dec2hex% hex2dec %_HexToDecimal_demo_hex2dec%
set /a "_HexToDecimal_demo_index+=1"
if %_HexToDecimal_demo_index% LEQ %_HexToDecimal_demo_limit% GoTo :HexToDecimal-DEMO-loop
GoTo :EOF

::Usage Call :HexToDecimal OutputVariable Input
:HexToDecimal
set "_HexToDecimal_output=%~1"
set "_HexToDecimal_input=%~2"
if defined %~2 ( call set "_HexToDecimal_input=%%%~2%%" ) 
if "[%_HexToDecimal_input:~0,2%]" NEQ "[0x]" set "_HexToDecimal_input=0x%_HexToDecimal_input%"
set /a "%~1=%_HexToDecimal_input%"
GoTo :EOF

::Usage Call :DecimalToHex OutputVariable Input
:DecimalToHex
set "_DecimalToHex_output=%~1"
set "_DecimalToHex_input=%~2"
if defined %~2 ( call set "_DecimalToHex_input=%%%~2%%" ) 
cmd /C exit %_DecimalToHex_input%
set "%~1=%=ExitCode%"
GoTo :EOF

::Usage Call :rtrim OutputVariable Input
:rtrim
setlocal enabledelayedexpansion
set "TAB=	"
set "_rtrim_output=%~1"
set "_rtrim_input=%~2"
if defined %~2 ( set "_rtrim_input=!%~2!" ) 
set /a "_rtrim_index=1"
:rtrim-loop
set "_rtrim_char=!_rtrim_input:~-%_rtrim_index%,1!"
if "[!_rtrim_char!]" EQU "[%TAB%]" ( set /a "_rtrim_index+=1" & GoTo :rtrim-loop )
if "[!_rtrim_char!]" EQU "[ ]" ( set /a "_rtrim_index+=1" & GoTo :rtrim-loop )
set /a "_rtrim_index-=1"
set _rtrim_intermediate=!_rtrim_input:~,-%_rtrim_index%!
endlocal & set %_rtrim_output%=%_rtrim_intermediate%
GoTo :EOF

::Usage Call :lenByRef OutputResult %VariableName%
rem doesn't work ?
:lenByVal
setlocal enabledelayedexpansion
set _len=%~2
GoTo :len
::Usage Call :len OutputResult VariableName
:: 5% slower for 100 strings, maximum lenght = 8174 (will break at 8175) WRONG
:len
(   
    setlocal EnableDelayedExpansion
    (set^ _ln=!%~2!)
    if defined _ln (
        set "len=1"
        for %%P in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
            if "!_ln:~%%P,1!" NEQ "" ( 
                set /a "len+=%%P"
                set "_ln=!_ln:~%%P!"
            )
        )
    ) ELSE (
        set len=0
    )
)
( 
    endlocal
    set "%~1=%len%"
    exit /b %len%
)
rem find stackoverflow link for this
rem return value should equal len
rem lenbyval should work

:: Input can be byval or byref
:: will return && "success" if not numeric and || "fail" if numeric
::Usage Call :IsNumeric Input optional Output
:IsNumeric
if "[%~1]"=="[]" exit /b 0
if defined %~1 ( call set "_IsNumeric_input=%%%~1%%" ) else ( set "_IsNumeric_input=%~1" )
set "IsNumericInternal=0123456789"
echo.%_IsNumeric_input%| findstr /r "[^%IsNumericInternal%]" >nul && (
    if not "[%2]"=="[]" set %2=false
) || (
    if not "[%2]"=="[]" set %2=true
)
GoTo :EOF
REM Call :IsNumeric "%var%" && echo it is not numeric || echo it is numeric
REM echo isnumeric with a number
REM call :isnumeric "1" && echo is was not numeric || ( echo it was numeric & echo also you smell )
REM echo isnumeric with a letter
REM call :isnumeric "a" && echo is was not numeric || ( echo it was numeric & echo also you smell )
REM echo isnumeric with a double quote empty
REM call :isnumeric "" && echo is was not numeric || ( echo it was numeric & echo also you smell )
REM echo isnumeric with no input 
REM call :isnumeric && echo is was not numeric || ( echo it was numeric & echo also you smell )
::IsNumeric-END

:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
if "[%~1]" NEQ "[]" for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :ClearVariablesByPrefix
GoTo :EOF

::Usage Call :LoopThroughArray ArrayName optional lbound=x optional ubound=x "command 1" 
:LoopThroughArray
set "_LoopThroughArray_prefix=_LTA"
set "_LTA_InputArray=%~1"
set "_LTA_command_count=0"
shift 
:LoopThroughArray-arguments
if "[%~1]" EQU "[lbound]" ( set "_LTA_lbound=%~2" & shift & shift & GoTo :LoopThroughArray-arguments )
if "[%~1]" EQU "[ubound]" ( set "_LTA_ubound=%~2" & shift & shift & GoTo :LoopThroughArray-arguments )
set _LTA_command[%_LTA_command_count%]=%~1
if "[%~2]" NEQ "[]" ( set /a "_LTA_command_count+=1" & shift & GoTo :LoopThroughArray-arguments )
if "[%_LTA_lbound%]" EQU "[]" call set _LTA_lbound=%%%_LTA_InputArray%.lbound%%
if "[%_LTA_lbound%]" EQU "[]" set "_LTA_lbound=0"
if "[%_LTA_ubound%]" EQU "[]" call set _LTA_ubound=%%%_LTA_InputArray%.ubound%%
set /a "_LTA_index=%_LTA_lbound%"
set _LTA
:LoopThroughArray-loop
%_LTA_command[0]%
%_LTA_command[1]%
%_LTA_command[2]%
%_LTA_command[3]%
%_LTA_command[4]%
%_LTA_command[5]%
%_LTA_command[6]%
%_LTA_command[7]%
%_LTA_command[8]%
%_LTA_command[9]%
%_LTA_command[10]%
%_LTA_command[11]%
%_LTA_command[12]%
%_LTA_command[13]%
%_LTA_command[14]%
%_LTA_command[15]%
set /a "_LTA_index+=1"
if %_LTA_index% LEQ %_LTA_ubound% GoTo :LoopThroughArray-loop
Call :ClearVariablesByPrefix %_LoopThroughArray_prefix% _LoopThroughArray
GoTo :EOF

:SampleLoopStructure
set SampleLoopStructure_array=myarray
set SampleLoopStructure_index=0
set SampleLoopStructure_index=%myarray.lbound%
call SampleLoopStructure_index=%%%SampleLoopStructure_array%.lbound%%
set SampleLoopStructure_ubound=%myarray.ubound%
call set SampleLoopStructure_ubound=%%%SampleLoopStructure_array%.ubound%%
:SampleLoopStructure-loop
do commands here
do commands here
call echo %%%SampleLoopStructure_array%[%SampleLoopStructure_index%]%%
setlocal enabledelayedexpansion
echo !%SampleLoopStructure_array%[%SampleLoopStructure_index%]!
endlocal
do commands here
do commands here
set /a "SampleLoopStructure_index+=1"
if %SampleLoopStructure_index% LEQ %SampleLoopStructure_ubound% GoTo :SampleLoopStructure-loop

REM Minimalist structure
REM set SampleLoopStructure_index=0
REM :SampleLoopStructure-loop
REM 
REM set /a "SampleLoopStructure_index+=1"
REM if %SampleLoopStructure_index% LEQ %SampleLoopStructure_ubound% GoTo :SampleLoopStructure-loop

GoTo :EOF
:SampleLoopStructure-loop


::Usage Call :GetPowercfgSchemes
:GetPowercfgSchemes
set "_GetPowercfgSchemes.lbound=0"
Call :CommandToArray _GetPowercfgSchemes skip=3 "'powercfg /list'"
Call :ClearVariablesByPrefix powercfg.schemes
set _GetPowercfgSchemes_index=0
:GetPowercfgSchemes-loop
setlocal enabledelayedexpansion
set _GetPowercfgSchemes_next_string=!_GetPowercfgSchemes[%_GetPowercfgSchemes_index%]!
endlocal & set _GetPowercfgSchemes_next_string=%_GetPowercfgSchemes_next_string%
set "_GetPowercfgSchemes_guid="
set "_GetPowercfgSchemes_name="
set "_GetPowercfgSchemes_default="
for /f "tokens=1,2,3,4,* delims=: " %%a in ("%_GetPowercfgSchemes_next_string%") do ( 
	if "[%%a %%b %%c]" EQU "[Power Scheme GUID]" (
			for /f "tokens=1,* delims=()" %%f in ("%%e") do (
				set "_GetPowercfgSchemes_guid=%%d"
				set "_GetPowercfgSchemes_name=%%f"
				set "_GetPowercfgSchemes_default=%%g"
			)
		)
	)
if "[%_GetPowercfgSchemes_guid%]" NEQ "[]" ( if "[%powercfg.schemes.ubound%]" EQU "[]" ( set /a "powercfg.schemes.ubound=0" ) else ( set /a "powercfg.schemes.ubound+=1" ) )
if "[%_GetPowercfgSchemes_guid%]" NEQ "[]" (
	set "powercfg.schemes[%powercfg.schemes.ubound%].guid=%_GetPowercfgSchemes_guid%"
	set "powercfg.schemes[%powercfg.schemes.ubound%].name=%_GetPowercfgSchemes_name%"
	set "powercfg.schemes[%_GetPowercfgSchemes_guid%]=%_GetPowercfgSchemes_name%"
	set "powercfg.schemes[%_GetPowercfgSchemes_guid%].index=%powercfg.schemes.ubound%"
	set "powercfg.schemes[%_GetPowercfgSchemes_name%]=%_GetPowercfgSchemes_guid%"
	set "powercfg.schemes[%_GetPowercfgSchemes_name%].index=%powercfg.schemes.ubound%"
	if "[%_GetPowercfgSchemes_default%]" NEQ "[]" ( set "powercfg.schemes.default.guid=%_GetPowercfgSchemes_guid%" & set "powercfg.schemes.default.name=%_GetPowercfgSchemes_name%" & set "powercfg.schemes.default.index=%powercfg.schemes.ubound%" )
	)
set /a "_GetPowercfgSchemes_index+=1"
if %_GetPowercfgSchemes_index% LEQ %_GetPowercfgSchemes.ubound% GoTo :GetPowercfgSchemes-loop
Call :ClearVariablesByPrefix _GetPowercfgSchemes
GoTo :EOF

::Usage Call :GetPowerSchemeContents
:GetPowerSchemeContents
set "_GetPowerSchemeContents_prefix=_GPSC"
if "[%powercfg.schemes.ubound%]" EQU "[]" Call :GetPowercfgSchemes
set /a "_GPSC_index=0"
:GetPowerSchemeContents-loop
Call :CommandToArray powercfg.schemes[%_GPSC_index%].contents "'powercfg query %%powercfg.schemes[%_GPSC_index%].guid%%'"
set /a "_GPSC_index+=1"
if %_GPSC_index% LEQ %powercfg.schemes.ubound% GoTo :GetPowerSchemeContents-loop
Call :ClearVariablesByPrefix %_GetPowerSchemeContents_prefix% _GetPowerSchemeContents
GoTo :EOF

::Usage Call :GetPowerSettings
:GetPowerSettings
set "_GetPowerSettings_prefix=_GPS"
if not defined powercfg.schemes[0].contents.ubound Call :GetPowerSchemeContents
set /a "_GPS_index=0"
:GetPowerSettings-loop
set /a "_GPS_contents_index=0"
set /a "_GPS_subgroup_ubound=-1"
set /a "_GPS_settings_ubound=-1"
set /a "_GPS_settings_index_ubound=-1"
set "_GPS_guid_level="
set "_GPS_scheme_guid="
set "_GPS_scheme_name="
set "_GPS_subgroup_guid="
set "_GPS_subgroup_name="
set "_GPS_setting_guid="
set "_GPS_setting_name="
set "_GPS_setting_index="
call set /a "_GPS_contents_ubound=%%powercfg.schemes[%_GPS_index%].contents.ubound%%"
:GetPowerSettings-contents-loop
call set "_GPS_contents_current=%%powercfg.schemes[%_GPS_index%].contents[%_GPS_contents_index%]%%"
for /f "tokens=1,2,3,4,5,* delims=: " %%a in ("%_GPS_contents_current%") do ( 
	if "[%%a %%b]" EQU "[GUID Alias]" ( set "_GPS_contents_current_type=GUID Alias" & set "_GPS_contents_current_value=%%c%%d%%e%%f" & GoTo :GetPowerSettings-contents-loop-for-skip )
	if "[%%a %%b %%c]" EQU "[Power Scheme GUID]" ( set "_GPS_contents_current_type=Power Scheme GUID" & set "_GPS_contents_current_value=%%d" & GoTo :GetPowerSettings-contents-loop-for-skip )
	if "[%%a %%b]" EQU "[Subgroup GUID]" ( set "_GPS_contents_current_type=Subgroup GUID" & set "_GPS_contents_current_value=%%c%%d%%e%%f" & GoTo :GetPowerSettings-contents-loop-for-skip )
	if "[%%a %%b %%c]" EQU "[Power Setting GUID]" ( set "_GPS_contents_current_type=Power Setting GUID" & set "_GPS_contents_current_value=%%d%%e%%f" & GoTo :GetPowerSettings-contents-loop-for-skip )
	if "[%%a %%b %%c %%d %%e]" EQU "[Current AC Power Setting Index]" ( set "_GPS_contents_current_type=Current AC Power Setting Index" & set "_GPS_contents_current_value=%%f" & GoTo :GetPowerSettings-contents-loop-for-skip )
	if "[%%a %%b %%c %%d %%e]" EQU "[Current DC Power Setting Index]" ( set "_GPS_contents_current_type=Current DC Power Setting Index" & set "_GPS_contents_current_value=%%f" & GoTo :GetPowerSettings-contents-loop-for-skip )
	if "[%%a %%b %%c]" EQU "[Possible Setting Index]" ( set "_GPS_contents_current_type=Possible Setting Index" & set "_GPS_contents_current_value=%%d%%e%%f" & GoTo :GetPowerSettings-contents-loop-for-skip )
	if "[%%a %%b %%c %%d]" EQU "[Possible Setting Friendly Name]" ( set "_GPS_contents_current_type=Possible Setting Friendly Name" & set "_GPS_contents_current_value=%%e%%f" & GoTo :GetPowerSettings-contents-loop-for-skip )
	if "[%%a %%b %%c]" EQU "[Minimum Possible Setting]" ( set "_GPS_contents_current_type=Minimum Possible Setting" & set "_GPS_contents_current_value=%%d%%e%%f" & GoTo :GetPowerSettings-contents-loop-for-skip )
	if "[%%a %%b %%c]" EQU "[Maximum Possible Setting]" ( set "_GPS_contents_current_type=Maximum Possible Setting" & set "_GPS_contents_current_value=%%d%%e%%f" & GoTo :GetPowerSettings-contents-loop-for-skip )
	if "[%%a %%b %%c]" EQU "[Possible Settings increment]" ( set "_GPS_contents_current_type=Possible Settings increment" & set "_GPS_contents_current_value=%%d%%e%%f" & GoTo :GetPowerSettings-contents-loop-for-skip )
	if "[%%a %%b %%c]" EQU "[Possible Settings units]" ( set "_GPS_contents_current_type=Possible Settings units" & set "_GPS_contents_current_value=%%d%%e%%f" & GoTo :GetPowerSettings-contents-loop-for-skip )
	echo Unrecognized text from powercfg query "%_GPS_contents_current%" a%%a b%%b c%%c d%%d e%%e f%%f g%%g h%%h
	)
:GetPowerSettings-contents-loop-for-skip
if "[%_GPS_contents_current_type%]" EQU "[Power Scheme GUID]" (
	set "_GPS_guid_level=Power Scheme GUID"
	set "_GPS_subgroup_guid="
	set "_GPS_subgroup_name="
	set "_GPS_setting_guid="
	set "_GPS_setting_name="
	set /a "_GPS_subgroup_ubound=-1"
	set /a "_GPS_settings_ubound=-1"
	for /f "tokens=1,2,* delims=()" %%f in ("%_GPS_contents_current:~19%") do ( 
		set "_GPS_scheme_guid=%%f"
		set "_GPS_scheme_name=%%g"
		)
	Call :rtrim _GPS_scheme_guid _GPS_scheme_guid
	)
if "[%_GPS_contents_current_type%]" EQU "[Power Scheme GUID]" (
	setlocal enabledelayedexpansion
		if "[!powercfg.schemes[%_GPS_index%].guid!]" NEQ "[%_GPS_scheme_guid%]" echo Power Scheme in powercfg.schemes[%_GPS_index%].guid does not equal this power scheme
		if "[!powercfg.schemes[%_GPS_index%].name!]" NEQ "[%_GPS_scheme_name%]" echo Power Scheme in powercfg.schemes[%_GPS_index%].name does not equal this power scheme 
		if "[!powercfg.schemes[%_GPS_scheme_guid%]!]" NEQ "[%_GPS_scheme_name%]" echo Power Scheme in powercfg.schemes[%_GPS_scheme_guid%] does not equal this power scheme
		if "[!powercfg.schemes[%_GPS_scheme_name%]!]" NEQ "[%_GPS_scheme_guid%]" echo Power Scheme in powercfg.schemes[%_GPS_scheme_name%] does not equal this power scheme
	endlocal
	)
if "[%_GPS_contents_current_type%]" EQU "[Subgroup GUID]" (
	set "_GPS_guid_level=Subgroup GUID"
	set "_GPS_setting_guid="
	set "_GPS_setting_name="
	set /a "_GPS_subgroup_ubound+=1"
	set /a "_GPS_settings_ubound=-1"
	for /f "tokens=1,2,* delims=()" %%f in ("%_GPS_contents_current:~15%") do ( 
		set "_GPS_subgroup_guid=%%f"
		set "_GPS_subgroup_name=%%g"
		)
	)
if "[%_GPS_contents_current_type%]" EQU "[Subgroup GUID]" (
	for /f "tokens=1,* delims= " %%f in ("%_GPS_subgroup_guid%") do ( 
		set "_GPS_subgroup_guid=%%f"
		)
	)
if "[%_GPS_contents_current_type%]" EQU "[Subgroup GUID]" (
	set /a "powercfg.schemes[%_GPS_index%].subgroup.ubound=%_GPS_subgroup_ubound%"
	set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_ubound%].name=%_GPS_subgroup_name%"
	set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_ubound%].guid=%_GPS_subgroup_guid%"
	set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_guid%]=%_GPS_subgroup_name%"
	set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_name%]=%_GPS_subgroup_guid%"
	)
if "[%_GPS_contents_current_type%]" EQU "[Power Setting GUID]" (
	set "_GPS_guid_level=Power Setting GUID"
	set "_GPS_setting_index="
	set /a "_GPS_settings_ubound+=1"
	set /a "_GPS_settings_index_ubound=-1"
	for /f "tokens=1,2,* delims=()" %%f in ("%_GPS_contents_current:~20%") do ( 
		set "_GPS_setting_guid=%%f"
		set "_GPS_setting_name=%%g"
		)
	)
if "[%_GPS_contents_current_type%]" EQU "[Power Setting GUID]" (
	for /f "tokens=1,* delims= " %%f in ("%_GPS_setting_guid%") do ( 
		set "_GPS_setting_guid=%%f"
		)
	)
if "[%_GPS_contents_current_type%]" EQU "[Power Setting GUID]" (
	set /a "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_ubound%].setting.ubound=%_GPS_settings_ubound%"
	set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_ubound%].setting[%_GPS_settings_ubound%].name=%_GPS_setting_name%"
	set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_ubound%].setting[%_GPS_settings_ubound%].guid=%_GPS_setting_guid%"
	set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_ubound%].setting[%_GPS_setting_guid%]=%_GPS_setting_name%"
	set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_ubound%].setting[%_GPS_setting_name%]=%_GPS_setting_guid%"
	)

if "[%_GPS_contents_current_type%]" EQU "[GUID Alias]" (
	if "[%_GPS_guid_level%]" EQU "[Power Scheme GUID]" (
		set "powercfg.schemes[%_GPS_index%].alias=%_GPS_contents_current:~12%"
		set "powercfg.schemes.alias[%_GPS_contents_current:~12%]=%_GPS_scheme_guid%"
		set "powercfg.schemes.alias[%_GPS_contents_current:~12%].index=%_GPS_index%"
		set "powercfg.schemes.alias[%_GPS_contents_current:~12%].name=%_GPS_scheme_name%"
		)
	if "[%_GPS_guid_level%]" EQU "[Subgroup GUID]" (
		set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_ubound%].alias=%_GPS_contents_current:~12%"
		set "powercfg.schemes[%_GPS_index%].subgroup.alias[%_GPS_contents_current:~12%]=%_GPS_subgroup_guid%"
		set "powercfg.schemes[%_GPS_index%].subgroup.alias[%_GPS_contents_current:~12%].index=%_GPS_subgroup_ubound%"
		set "powercfg.schemes[%_GPS_index%].subgroup.alias[%_GPS_contents_current:~12%].name=%_GPS_subgroup_name%"
		)
	if "[%_GPS_guid_level%]" EQU "[Power Setting GUID]" (
		set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_ubound%].setting[%_GPS_settings_ubound%].alias=%_GPS_contents_current:~12%"
		set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_ubound%].setting.alias[%_GPS_contents_current:~12%]=%_GPS_setting_guid%"
		set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_ubound%].setting.alias[%_GPS_contents_current:~12%].index=%_GPS_settings_ubound%"
		set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_ubound%].setting.alias[%_GPS_contents_current:~12%].name=%_GPS_setting_name%"
		)
	)
	
if "[%_GPS_contents_current_type%]" EQU "[Current AC Power Setting Index]" set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_ubound%].setting[%_GPS_settings_ubound%].acvalue=%_GPS_contents_current_value:~36%"
if "[%_GPS_contents_current_type%]" EQU "[Current DC Power Setting Index]" set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_ubound%].setting[%_GPS_settings_ubound%].dcvalue=%_GPS_contents_current_value:~36%"
if "[%_GPS_contents_current_type%]" EQU "[Possible Setting Index]" set /a "_GPS_settings_index_ubound+=1"
if "[%_GPS_contents_current_type%]" EQU "[Possible Setting Index]" set "_GPS_setting_index=%_GPS_contents_current:~24%" & set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_ubound%].setting[%_GPS_settings_ubound%].validvalues[%_GPS_settings_index_ubound%]=%_GPS_contents_current:~24%
if "[%_GPS_contents_current_type%]" EQU "[Possible Setting Friendly Name]"	(
																			set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_ubound%].setting[%_GPS_settings_ubound%].validvalues[%_GPS_settings_index_ubound%].index=%_GPS_setting_index%"
																			set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_ubound%].setting[%_GPS_settings_ubound%].validvalues[%_GPS_settings_index_ubound%].name=%_GPS_contents_current:~32%"
																			set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_ubound%].setting[%_GPS_settings_ubound%].validvalues[%_GPS_setting_index%]=%_GPS_contents_current:~32%"
																			set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_ubound%].setting[%_GPS_settings_ubound%].validvalues[%_GPS_contents_current:~32%]=%_GPS_setting_index%"
																			)
if "[%_GPS_contents_current_type%]" EQU "[Minimum Possible Setting]" set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_ubound%].setting[%_GPS_settings_ubound%].min=%_GPS_contents_current_value%"
if "[%_GPS_contents_current_type%]" EQU "[Maximum Possible Setting]" set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_ubound%].setting[%_GPS_settings_ubound%].max=%_GPS_contents_current_value%"
if "[%_GPS_contents_current_type%]" EQU "[Possible Settings increment]" set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_ubound%].setting[%_GPS_settings_ubound%].increment=%_GPS_contents_current:~29%"
if "[%_GPS_contents_current_type%]" EQU "[Possible Settings units]" set "powercfg.schemes[%_GPS_index%].subgroup[%_GPS_subgroup_ubound%].setting[%_GPS_settings_ubound%].units=%_GPS_contents_current:~25%"

set /a "_GPS_contents_index+=1"
if %_GPS_contents_index% LEQ %_GPS_contents_ubound% GoTo :GetPowerSettings-contents-loop
set /a "_GPS_index+=1"
if %_GPS_index% LEQ %powercfg.schemes.ubound% GoTo :GetPowerSettings-loop

set /a "_GPS_index=0"
:GetPowerSettings-loop-cleanup
Call :ClearVariablesByPrefix powercfg.schemes[%_GPS_index%].contents
set /a "_GPS_index+=1"
if %_GPS_index% LEQ %powercfg.schemes.ubound% GoTo :GetPowerSettings-loop-cleanup

Call :ClearVariablesByPrefix %_GetPowerSettings_prefix% _GetPowerSettings
GoTo :EOF


REM List schemes into array
 
REM list all subgroups in a scheme

REM list all settings in a subgroup

REM list all settings in a scheme

REM list all settings  and value for each scheme

REM for each setting with units show percentage

:: If no output array is specified, the list will be echoed to the console
::Usage Call :ListPowerSchemes optional OutputArray
:ListPowerSchemes
if not defined powercfg.schemes.ubound Call :GetPowerSettings
if "[%~1]" NEQ "[]" call set /a "_ListPowerSchemes_output_ubound=%%%~1.ubound%%" 2>nul
if "[%~1]" NEQ "[]" if "[%_ListPowerSchemes_output_ubound%]" EQU "[]" ( set /a "_ListPowerSchemes_output_ubound=0" ) else ( set /a "_ListPowerSchemes_output_ubound+=1" )
set /a "_ListPowerSchemes_index=0"
:ListPowerSchemes-loop
if "[%~1]" EQU "[]" ( call echo %%powercfg.schemes[%_ListPowerSchemes_index%].name%% ) else ( call set "%~1[%_ListPowerSchemes_output_ubound%]=%%powercfg.schemes[%_ListPowerSchemes_index%].name%%" & set "%~1.ubound=%_ListPowerSchemes_output_ubound%" & set /a "_ListPowerSchemes_output_ubound+=1" )
set /a "_ListPowerSchemes_index+=1"
if %_ListPowerSchemes_index% LEQ %powercfg.schemes.ubound% GoTo :ListPowerSchemes-loop
Call :ClearVariablesByPrefix _ListPowerSchemes
GoTo :EOF

::Usage Call :ListPowerSubgroupsoptional NOPREFIX PowerScheme(index, name or guid) optional OutputArray
:ListPowerSubgroups
if "[%~1]" EQU "[NOPREFIX]" ( set "_ListPowerSubgroups_noprefix=true" & shift )
if not defined powercfg.schemes.ubound Call :GetPowerSettings
if "[%~2]" NEQ "[]" call set /a "_ListPowerSubgroups_output_ubound=%%%~2.ubound%%" 2>nul
if "[%~2]" NEQ "[]" if "[%_ListPowerSubgroups_output_ubound%]" EQU "[]" ( set /a "_ListPowerSubgroups_output_ubound=0" ) else ( set /a "_ListPowerSubgroups_output_ubound+=1" )
Call :GetPowerSchemeIndex "%~1" _ListPowerSubgroups_schemes_index 
call set /a "_ListPowerSubgroups_ubound=%%powercfg.schemes[%_ListPowerSubgroups_schemes_index%].subgroup.ubound%%"
call set "_ListPowerSubgroups_scheme_name=%%powercfg.schemes[%_ListPowerSubgroups_schemes_index%].name%%."
if "[%_ListPowerSubgroups_noprefix%]" EQU "[true]" set "_ListPowerSubgroups_scheme_name="
set /a "_ListPowerSubgroups_index=0"
:ListPowerSubgroups-loop
if "[%~2]" EQU "[]" ( call echo %_ListPowerSubgroups_scheme_name%%%powercfg.schemes[%_ListPowerSubgroups_schemes_index%].subgroup[%_ListPowerSubgroups_index%].name%% ) else ( call set "%~2[%_ListPowerSubgroups_output_ubound%]=%_ListPowerSubgroups_scheme_name%%%powercfg.schemes[%_ListPowerSubgroups_schemes_index%].subgroup[%_ListPowerSubgroups_index%].name%%" & set "%~2.ubound=%_ListPowerSubgroups_output_ubound%" & set /a "_ListPowerSubgroups_output_ubound+=1" )
set /a "_ListPowerSubgroups_index+=1"
if %_ListPowerSubgroups_index% LEQ %_ListPowerSubgroups_ubound% GoTo :ListPowerSubgroups-loop
Call :ClearVariablesByPrefix _ListPowerSubgroups
GoTo :EOF

::Usage Call :ListPowerSettings optional NOPREFIX PowerScheme(index, name or guid) PowerSubgroup(index, name or guid) optional OutputArray
:ListPowerSettings
if "[%~1]" EQU "[NOPREFIX]" ( set "_ListPowerSettings_noprefix=true" & shift )
if not defined powercfg.schemes.ubound Call :GetPowerSettings
if "[%~3]" NEQ "[]" call set /a "_ListPowerSettings_output_ubound=%%%~3.ubound%%" 2>nul
if "[%~3]" NEQ "[]" if "[%_ListPowerSettings_output_ubound%]" EQU "[]" ( set /a "_ListPowerSettings_output_ubound=0" ) else ( set /a "_ListPowerSettings_output_ubound+=1" )
Call :GetPowerSchemeIndex "%~1" _ListPowerSettings_schemes_index 
Call :GetPowerSubgroupIndex "%~1" "%~2" _ListPowerSettings_subgroup_index 
call set /a "_ListPowerSettings_ubound=%%powercfg.schemes[%_ListPowerSettings_schemes_index%].subgroup[%_ListPowerSettings_subgroup_index%].setting.ubound%%"
call set "_ListPowerSettings_scheme_name=%%powercfg.schemes[%_ListPowerSettings_schemes_index%].name%%.%%powercfg.schemes[%_ListPowerSettings_schemes_index%].subgroup[%_ListPowerSettings_subgroup_index%].name%%."
if "[%_ListPowerSettings_noprefix%]" EQU "[true]" set "_ListPowerSettings_scheme_name="
set /a "_ListPowerSettings_index=0"
:ListPowerSettings-loop
if "[%~3]" EQU "[]" ( call echo %_ListPowerSettings_scheme_name%%%powercfg.schemes[%_ListPowerSettings_schemes_index%].subgroup[%_ListPowerSettings_subgroup_index%].setting[%_ListPowerSettings_index%].name%% ) else ( call set "%~3[%_ListPowerSettings_output_ubound%]=%_ListPowerSettings_scheme_name%%%powercfg.schemes[%_ListPowerSettings_schemes_index%].subgroup[%_ListPowerSettings_index%].name%%" & set "%~3.ubound=%_ListPowerSettings_output_ubound%" & set /a "_ListPowerSettings_output_ubound+=1" )
set /a "_ListPowerSettings_index+=1"
if %_ListPowerSettings_index% LEQ %_ListPowerSettings_ubound% GoTo :ListPowerSettings-loop
Call :ClearVariablesByPrefix _ListPowerSettings
GoTo :EOF

::Usage Call :ListPowerSettingsInAllSubgroups PowerScheme(index, name or guid) optional OutputArray
:ListPowerSettingsInAllSubgroups
if "[%~1]" EQU "[NOPREFIX]" ( set "__ListPowerSettingsInAllSubgroups_noprefix=NOPREFIX" & shift )
Call :ListPowerSubgroups NOPREFIX "%~1" __ListPowerSettingsInAllSubgroups_subgroups
set /a "__ListPowerSettingsInAllSubgroups_ubound=%__ListPowerSettingsInAllSubgroups_subgroups.ubound%"
set /a "__ListPowerSettingsInAllSubgroups_index=0"
:ListPowerSettingsInAllSubgroups-loop
Call :ListPowerSettings %__ListPowerSettingsInAllSubgroups_noprefix% "%~1" "%%__ListPowerSettingsInAllSubgroups_subgroups[%__ListPowerSettingsInAllSubgroups_index%]%%" "%~2"
set /a "__ListPowerSettingsInAllSubgroups_index+=1"
if %__ListPowerSettingsInAllSubgroups_index% LEQ %__ListPowerSettingsInAllSubgroups_ubound% GoTo :ListPowerSettingsInAllSubgroups-loop
Call :ClearVariablesByPrefix __ListPowerSettingsInAllSubgroups
GoTo :EOF

::Usage Call :ListPowerSettingsInAllSchemes optional OutputArray
:ListPowerSettingsInAllSchemes
if "[%~1]" EQU "[NOPREFIX]" ( set "__ListPowerSettingsInAllSchemes_noprefix=NOPREFIX" & shift )
Call :ListPowerSchemes __ListPowerSettingsInAllSchemes_schemes
set /a "__ListPowerSettingsInAllSchemes_ubound=%__ListPowerSettingsInAllSchemes_schemes.ubound%"
set /a "__ListPowerSettingsInAllSchemes_index=0"
:ListPowerSettingsInAllSchemes-loop
Call :ListPowerSettingsInAllSubgroups %__ListPowerSettingsInAllSchemes_noprefix% "%%__ListPowerSettingsInAllSchemes_schemes[%__ListPowerSettingsInAllSchemes_index%]%%" "%~1"
set /a "__ListPowerSettingsInAllSchemes_index+=1"
if %__ListPowerSettingsInAllSchemes_index% LEQ %__ListPowerSettingsInAllSchemes_ubound% GoTo :ListPowerSettingsInAllSchemes-loop
Call :ClearVariablesByPrefix __ListPowerSettingsInAllSchemes
GoTo :EOF

:: If no output array is specified, the list will be echoed to the console
::Usage Call :ListAllPowerSubgroups optional OutputArray
:ListAllPowerSubgroups
if not defined powercfg.schemes.ubound Call :GetPowerSettings
if "[%~1]" NEQ "[]" call set /a "_ListAllPowerSubgroups_output_ubound=%%%~1.ubound%%" 2>nul
if "[%~1]" NEQ "[]" if "[%_ListAllPowerSubgroups_output_ubound%]" EQU "[]" ( set /a "_ListAllPowerSubgroups_output_ubound=0" ) else ( set /a "_ListAllPowerSubgroups_output_ubound+=1" )
set /a "_ListAllPowerSubgroups_schemes_index=0"
:ListAllPowerSubgroups-loop-schemes
call set "_ListAllPowerSubgroups_scheme_name=%%powercfg.schemes[%_ListAllPowerSubgroups_schemes_index%].name%%"
Call :ListPowerSubgroups "%_ListAllPowerSubgroups_scheme_name%" %~1
set /a "_ListAllPowerSubgroups_schemes_index+=1"
if %_ListAllPowerSubgroups_schemes_index% LEQ %powercfg.schemes.ubound% GoTo :ListAllPowerSubgroups-loop-schemes
Call :ClearVariablesByPrefix _ListAllPowerSubgroups
GoTo :EOF

::Usage Call :GetPowerSchemeIndex Powerscheme(index, name or guid) optional OutputIndex
::Returns powerscheme index
:GetPowerSchemeIndex
if not defined powercfg.schemes.ubound Call :GetPowerSettings
set "_GetPowerSchemeIndex_search=%~1"
Call :IsNumeric _GetPowerSchemeIndex_search || if "[%~2]" NEQ "[]" ( set "%~2=%_GetPowerSchemeIndex_search%" & Call :ClearVariablesByPrefix _GetPowerSchemeIndex & exit /b %_GetPowerSchemeIndex_search% ) else ( Call :ClearVariablesByPrefix _GetPowerSchemeIndex & exit /b %_GetPowerSchemeIndex_search% )
set /a "_GetPowerSchemeIndex_index=0"
:GetPowerSchemeIndex-loop
call set "_GetPowerSchemeIndex_current_guid=%%powercfg.schemes[%_GetPowerSchemeIndex_index%].guid%%"
call set "_GetPowerSchemeIndex_current_name=%%powercfg.schemes[%_GetPowerSchemeIndex_index%].name%%"
if "[%_GetPowerSchemeIndex_search%]" EQU "[%_GetPowerSchemeIndex_current_guid%]" set "_GetPowerSchemeIndex_match_found=true" & GoTo :GetPowerSchemeIndex-loop-end
if "[%_GetPowerSchemeIndex_search%]" EQU "[%_GetPowerSchemeIndex_current_name%]" set "_GetPowerSchemeIndex_match_found=true" & GoTo :GetPowerSchemeIndex-loop-end
set /a "_GetPowerSchemeIndex_index+=1"
if %_GetPowerSchemeIndex_index% LEQ %powercfg.schemes.ubound% GoTo :GetPowerSchemeIndex-loop
:GetPowerSchemeIndex-loop-end
if "[%_GetPowerSchemeIndex_match_found%]" EQU "[true]" if "[%~2]" NEQ "[]" set "%~2=%_GetPowerSchemeIndex_index%"
if "[%_GetPowerSchemeIndex_match_found%]" EQU "[true]" Call :ClearVariablesByPrefix _GetPowerSchemeIndex & exit /b %_GetPowerSchemeIndex_index%
Call :ClearVariablesByPrefix _GetPowerSchemeIndex
exit /b -1


::Usage Call :GetPowerSubgroupIndex Powerscheme(index, name or guid) PowerSubgroup(index, name or guid)  optional OutputIndex
::Returns power subgroup index
:GetPowerSubgroupIndex
Call :GetPowerSchemeIndex "%~1" _GetPowerSubgroupIndex_scheme_index
set "_GetPowerSubgroupIndex_search=%~2"
Call :IsNumeric _GetPowerSubgroupIndex_search || if "[%~3]" NEQ "[]" ( set "%~3=%_GetPowerSubgroupIndex_search%" & Call :ClearVariablesByPrefix _GetPowerSubgroupIndex & exit /b %_GetPowerSubgroupIndex_search% ) else ( Call :ClearVariablesByPrefix _GetPowerSubgroupIndex & exit /b %_GetPowerSubgroupIndex_search% )
set /a "_GetPowerSubgroupIndex_index=0"
call set /a "_GetPowerSubgroupIndex_ubound=%%powercfg.schemes[%_GetPowerSubgroupIndex_scheme_index%].subgroup.ubound%%"
:GetPowerSubgroupIndex-loop
call set "_GetPowerSubgroupIndex_current_guid=%%powercfg.schemes[%_GetPowerSubgroupIndex_scheme_index%].subgroup[%_GetPowerSubgroupIndex_index%].guid%%"
call set "_GetPowerSubgroupIndex_current_name=%%powercfg.schemes[%_GetPowerSubgroupIndex_scheme_index%].subgroup[%_GetPowerSubgroupIndex_index%].name%%"
if "[%_GetPowerSubgroupIndex_search%]" EQU "[%_GetPowerSubgroupIndex_current_guid%]" set "_GetPowerSubgroupIndex_match_found=true" & GoTo :GetPowerSubgroupIndex-loop-end
if "[%_GetPowerSubgroupIndex_search%]" EQU "[%_GetPowerSubgroupIndex_current_name%]" set "_GetPowerSubgroupIndex_match_found=true" & GoTo :GetPowerSubgroupIndex-loop-end
set /a "_GetPowerSubgroupIndex_index+=1"
if %_GetPowerSubgroupIndex_index% LEQ %_GetPowerSubgroupIndex_ubound% GoTo :GetPowerSubgroupIndex-loop
:GetPowerSubgroupIndex-loop-end
if "[%_GetPowerSubgroupIndex_match_found%]" EQU "[true]" if "[%~3]" NEQ "[]" set "%~3=%_GetPowerSubgroupIndex_index%"
if "[%_GetPowerSubgroupIndex_match_found%]" EQU "[true]" Call :ClearVariablesByPrefix _GetPowerSubgroupIndex & exit /b %_GetPowerSubgroupIndex_index%
Call :ClearVariablesByPrefix _GetPowerSubgroupIndex
exit /b -1

::Usage Call :GetPowerSubgroupIndex Powerscheme(index, name or guid) PowerSubgroup(index, name or guid) PowerSetting(index, name or guid) optional OutputIndex
::Returns power setting index
:GetPowerSettingIndex
Call :GetPowerSchemeIndex "%~1" _GetPowerSettingIndex_scheme_index
Call :GetPowerSubgroupIndex "%_GetPowerSettingIndex_scheme_index%" "%~2" _GetPowerSettingIndex_subgroup_index
set "_GetPowerSettingIndex_search=%~3"
Call :IsNumeric _GetPowerSettingIndex_search || if "[%~4]" NEQ "[]" ( set "%~4=%_GetPowerSettingIndex_search%" & Call :ClearVariablesByPrefix _GetPowerSettingIndex & exit /b %_GetPowerSettingIndex_search% ) else ( Call :ClearVariablesByPrefix _GetPowerSettingIndex & exit /b %_GetPowerSettingIndex_search% )
set /a "_GetPowerSettingIndex_index=0"
call set /a "_GetPowerSettingIndex_ubound=%%powercfg.schemes[%_GetPowerSettingIndex_scheme_index%].subgroup[%_GetPowerSettingIndex_subgroup_index%].setting.ubound%%"
:GetPowerSettingIndex-loop
call set "_GetPowerSettingIndex_current_guid=%%powercfg.schemes[%_GetPowerSettingIndex_scheme_index%].subgroup[%_GetPowerSettingIndex_subgroup_index%].setting[%_GetPowerSettingIndex_index%].guid%%"
call set "_GetPowerSettingIndex_current_name=%%powercfg.schemes[%_GetPowerSettingIndex_scheme_index%].subgroup[%_GetPowerSettingIndex_subgroup_index%].setting[%_GetPowerSettingIndex_index%].name%%"
if "[%_GetPowerSettingIndex_search%]" EQU "[%_GetPowerSettingIndex_current_guid%]" set "_GetPowerSettingIndex_match_found=true" & GoTo :GetPowerSettingIndex-loop-end
if "[%_GetPowerSettingIndex_search%]" EQU "[%_GetPowerSettingIndex_current_name%]" set "_GetPowerSettingIndex_match_found=true" & GoTo :GetPowerSettingIndex-loop-end
set /a "_GetPowerSettingIndex_index+=1"
if %_GetPowerSettingIndex_index% LEQ %_GetPowerSettingIndex_ubound% GoTo :GetPowerSettingIndex-loop
:GetPowerSettingIndex-loop-end
if "[%_GetPowerSettingIndex_match_found%]" EQU "[true]" if "[%~4]" NEQ "[]" set "%~4=%_GetPowerSettingIndex_index%"
if "[%_GetPowerSettingIndex_match_found%]" EQU "[true]" Call :ClearVariablesByPrefix _GetPowerSettingIndex & exit /b %_GetPowerSettingIndex_index%
Call :ClearVariablesByPrefix _GetPowerSettingIndex
exit /b -1

::Usage Call :GetPowerSchemeGuid OutputGuid InputPowerSchemeName
:GetPowerSchemeGuid
Call :GetPowerSchemeIndex "%~2" _GetPowerSchemeGuid_index
call set "%~1=%%powercfg[%_GetPowerSchemeGuid_index%].guid%%
GoTo :EOF

::Usage Call :GetPowerSchemeName OutputName InputPowerSchemeGuid
:GetPowerSchemeName
Call :GetPowerSchemeIndex "%~2" _GetPowerSchemeName_index
call set "%~1=%%powercfg[%_GetPowerSchemeName_index%].name%%
GoTo :EOF

::Usage Call :GetPowerSubgroupGuid OutputGuid InputPowerSubgroupName
:GetPowerSubgroupGuid
Call :GetPowerSubgroupIndex "%~2" _GetPowerSubgroupGuid_index
call set "%~1=%%powercfg[%_GetPowerSubgroupGuid_index%].guid%%
GoTo :EOF

::Usage Call :GetPowerSubgroupName OutputName InputPowerSubgroupGuid
:GetPowerSubgroupName
Call :GetPowerSubgroupIndex "%~2" _GetPowerSubgroupName_index
call set "%~1=%%powercfg[%_GetPowerSubgroupName_index%].name%%
GoTo :EOF

::Usage Call :GetPowerSettingGuid OutputGuid InputPowerSettingName
:GetPowerSettingIndex
Call :GetPowerSchemeIndex "%~2" _GetPowerSettingGuid_index
call set "%~1=%%powercfg[%_GetPowerSettingGuid_index%].guid%%
GoTo :EOF

::Usage Call :GetPowerSettingName OutputName InputPowerSettingGuid
:GetPowerSettingIndex
Call :GetPowerSchemeIndex "%~2" _GetPowerSettingName_index
call set "%~1=%%powercfg[%_GetPowerSettingName_index%].guid%%
GoTo :EOF



::Usage Call :GetDefaultSchemeName OutputIndex OutputGuid OutputName 
:GetDefaultSchemeName
if "[%~1]" NEQ "[]" set "%~1=%powercfg.schemes.default.index%"
if "[%~2]" NEQ "[]" set "%~2=%powercfg.schemes.default.guid%"
if "[%~3]" NEQ "[]" set "%~3=%powercfg.schemes.default.name%"
exit /b %powercfg.schemes.default.index%


::Usage Call :GetPowerID [schemename.[subgroupname.[settingname]
::Default scheme will be returned if not specified
:GetPowerID
REM if two dots, run getscheme, run getsubgroup, run getsetting
REM if one dot run getsubgroup, run getsetting
REM if no dots run get setting, FIND subgroup, return default scheme
REM what about scheme only, subgroup only, scheme.subgroup
REM what about alias and other powercfg things with guid ?
GoTo :EOF

::Usage Call :GetSettingACValue OutputValue 
:GetSettingACValue balanced.Hard disk.whatever output
:GetSettingDCValue
:GetSettingACValuePercentage
:GetSettingACValuePercentage
:GetSettingMin
:GetSettingMax
:GetSettingFriendlyName
:GetSettingIndexFromFriendlyName
:GetSettingIncrement
:GetSettingUnit


:SetSettingACValue powercfg /CHANGE
:SetSettingDCValue
:IncrementSettingACValue
:DecrementSettingACValue
:IncrementSettingDCValue
:DecrementSettingDCValue

:ShowAllPowercfgSettings
:GetFullPowercfgReport
REM get hibernate config status ???
REM get fast startup status ???
/AVAILABLESLEEPSTATES
list all available and unavailable sleep states


powercfg /DEVICEQUERY wake_from_S1_supported    Return all devices that support waking the system from a light sleep state.                              
powercfg /DEVICEQUERY wake_from_S2_supported    Return all devices that support waking the system from a deeper sleep state.
powercfg /DEVICEQUERY wake_from_S3_supported    Return all devices that support waking the system from the deepest sleep state.
powercfg /DEVICEQUERY wake_from_any             Return all devices that support waking the system from any sleep state.
powercfg /DEVICEQUERY S1_supported              List devices supporting light sleep.
powercfg /DEVICEQUERY S2_supported              List devices supporting deeper sleep.
powercfg /DEVICEQUERY S3_supported              List devices supporting deepest sleep.
powercfg /DEVICEQUERY S4_supported              List devices supporting hibernation.
powercfg /DEVICEQUERY wake_programmable         List devices that are user-configurable to wake the system from a sleep state.
powercfg /DEVICEQUERY wake_armed                List devices that are currently configured to wake the system from any sleep state.
powercfg /DEVICEQUERY all_devices               Return all devices present in the system

show all devices and the sleep states they support
show which devices can and can't wake the computer
/LASTWAKE
/WAKETIMERS
powercfg /REQUESTS
/ENERGY energy-report.html
/BATTERYREPORT requier battery
/SRUMUTIL requier hardware
/SYSTEMSLEEPDIAGNOSTICS system-sleep-diagnostics.html
/SLEEPSTUDY meme que /SYSTEMPOWERREPORT powercfg /SYSTEMPOWERREPORT -> sleepstudy-report.html
/POWERTHROTTLING list
/AVAILABLESLEEPSTATES
powercfg /DEVICEQUERY all_devices
powercfg /DEVICEQUERY S1_supported
powercfg /DEVICEQUERY S2_supported
powercfg /DEVICEQUERY S3_supported
powercfg /DEVICEQUERY S4_supported
powercfg /DEVICEQUERY wake_from_any
powercfg /DEVICEQUERY wake_from_S1_supported
powercfg /DEVICEQUERY wake_from_S2_supported
powercfg /DEVICEQUERY wake_from_S3_supported
powercfg /DEVICEQUERY wake_programmable
powercfg /DEVICEQUERY wake_armed

REM get all security descriptors
:SetHighPerformanceScheme
:SetBalancedScheme
:SetPowerSaverScheme
::Usage Call :GetSecurityDescriptor InputGuid optional SecurityDescriptor
:GetSecurityDescriptor 

:DisableHibernation
:EnableHibernation
:SetHibernationFileToReduced
:SetHibernationFileToFull
:SetHibernationFilePercentage
:DisableFastStartup
:EnableFastStartup

:ShowWhatIsPreventingSleep
:OverrideWhatIsPreventingSleep

::Usage Call :EnablePowerThrottling PathToExe
::Usage Call :EnablePowerThrottling PackageName
:EnablePowerThrottling
:DisablePowerThrottling
:ShowPowerThrottling

:EnableWakeByDevice
:DisableWakeByDevice
:OverridePowerRequest

:GetDevicePowerProperties

:GetWakeProgrammableDevices
:GetAllDevices
:GetS1CapableDevices
:GetS2CapableDevices
:GetS3CapableDevices
:GetS4CapableDevices
:GetS1WakeDevices
:GetS2WakeDevices
:GetS3WakeDevices
:GetAnyWakeDevices
:GetWakeArmedDevices
:GetWakeUnarmedDevices


::Usage Call :GetSleepStates
:GetSleepStates
set "_GetPowerSettings_prefix=_GSS"
Call :ClearVariablesByPrefix powercfg.sleepstates.contents
Call :CommandToArray powercfg.sleepstates.contents "'powercfg /availablesleepstates'"
set /a "_GSS_contents_index=0"
set /a "_GSS_sleepstate_index=-1"
set /a "_GSS_supported_sleepstate_index=-1"
set /a "_GSS_unsupported_sleepstate_index=-1"
set "_GSS_mode="
set "_GSS_state="
set "_GSS_message="
:GetSleepStates-loop
call set /a "_GSS_contents_ubound=%%powercfg.sleepstates.contents.ubound%%"
:GetSleepStates-contents-loop
call set "_GSS_contents_current=%%powercfg.sleepstates.contents[%_GSS_contents_index%]%%"
set "_GSS_message="
if "[%_GSS_mode%]" EQU "[Supported states]" set "_GSS_state="
for /f "tokens=* delims=: " %%a in ("%_GSS_contents_current%") do ( 
	if "[%%a]" EQU "[The following sleep states are available on this system:]" set "_GSS_mode=Supported states" & set "_GSS_state=" & GoTo :GetSleepStates-contents-loop-for-skip
	if "[%%a]" EQU "[The following sleep states are not available on this system:]" set "_GSS_mode=Unsupported states" & set "_GSS_state=" & GoTo :GetSleepStates-contents-loop-for-skip
	if "[%%a]" EQU "[Standby (S0 Low Power Idle)]" set "_GSS_state=Standby (S0 Low Power Idle)" & GoTo :GetSleepStates-contents-loop-for-skip
	if "[%%a]" EQU "[Standby (S1)]" set "_GSS_state=Standby (S1)" & GoTo :GetSleepStates-contents-loop-for-skip
	if "[%%a]" EQU "[Standby (S2)]" set "_GSS_state=Standby (S2)" & GoTo :GetSleepStates-contents-loop-for-skip
	if "[%%a]" EQU "[Standby (S3)]" set "_GSS_state=Standby (S3)" & GoTo :GetSleepStates-contents-loop-for-skip
	if "[%%a]" EQU "[Hibernate]" set "_GSS_state=Hibernate" & GoTo :GetSleepStates-contents-loop-for-skip
	if "[%%a]" EQU "[Hybrid Sleep]" set "_GSS_state=Hybrid Sleep" & GoTo :GetSleepStates-contents-loop-for-skip
	if "[%%a]" EQU "[Fast Startup]" set "_GSS_state=Fast Startup" & GoTo :GetSleepStates-contents-loop-for-skip
	set "_GSS_message=%%a"
	)
:GetSleepStates-contents-loop-for-skip
REM echo 1 %_GSS_mode% 2 %_GSS_state% 3 %_GSS_message% %_GSS_sleepstate_index% %_GSS_supported_sleepstate_index% %_GSS_unsupported_sleepstate_index%
if "[%_GSS_mode%]" EQU "[Supported states]" (
	if "[%_GSS_state%]" NEQ "[]" set /a "_GSS_sleepstate_index+=1"
	if "[%_GSS_state%]" NEQ "[]" set /a "_GSS_supported_sleepstate_index+=1"
)
if "[%_GSS_mode%]" EQU "[Supported states]" (
	if "[%_GSS_state%]" NEQ "[]" set "powercfg.sleepstates[%_GSS_sleepstate_index%].supported=true"
	if "[%_GSS_state%]" NEQ "[]" set "powercfg.sleepstates[%_GSS_sleepstate_index%]=%_GSS_state%"
	if "[%_GSS_state%]" NEQ "[]" set "powercfg.sleepstates.ubound=%_GSS_sleepstate_index%"
	if "[%_GSS_state%]" NEQ "[]" set "powercfg.sleepstates.supported[%_GSS_supported_sleepstate_index%]=%_GSS_state%"
	if "[%_GSS_state%]" NEQ "[]" set "powercfg.sleepstates.supported.ubound=%_GSS_supported_sleepstate_index%"
	if "[%_GSS_state%]" NEQ "[]" set "powercfg.sleepstates[%_GSS_state%].supported=true"
)
if "[%_GSS_mode%]" EQU "[Unsupported states]" (
	if "[%_GSS_state%]" NEQ "[]" if "[%_GSS_message%]" NEQ "[]" set /a "_GSS_sleepstate_index+=1"
	if "[%_GSS_state%]" NEQ "[]" if "[%_GSS_message%]" NEQ "[]" set /a "_GSS_unsupported_sleepstate_index+=1"
	
)
REM if "[%_GSS_mode%]" EQU "[Unsupported states]" if "[%_GSS_message%]" NEQ "[]" ( echo su %_GSS_sleepstate_index% un %_GSS_unsupported_sleepstate_index% )
if "[%_GSS_mode%]" EQU "[Unsupported states]" (
	if "[%_GSS_state%]" NEQ "[]" if "[%_GSS_message%]" NEQ "[]" set "powercfg.sleepstates[%_GSS_sleepstate_index%].unsupported=true"
	if "[%_GSS_state%]" NEQ "[]" if "[%_GSS_message%]" NEQ "[]" set "powercfg.sleepstates[%_GSS_sleepstate_index%]=%_GSS_state%"
	if "[%_GSS_state%]" NEQ "[]" if "[%_GSS_message%]" NEQ "[]" set "powercfg.sleepstates[%_GSS_sleepstate_index%].message=%_GSS_message%"
	if "[%_GSS_state%]" NEQ "[]" if "[%_GSS_message%]" NEQ "[]" set "powercfg.sleepstates.ubound=%_GSS_sleepstate_index%"
	if "[%_GSS_state%]" NEQ "[]" if "[%_GSS_message%]" NEQ "[]" set "powercfg.sleepstates.unsupported[%_GSS_unsupported_sleepstate_index%]=%_GSS_state%"
	if "[%_GSS_state%]" NEQ "[]" if "[%_GSS_message%]" NEQ "[]" set "powercfg.sleepstates.unsupported[%_GSS_unsupported_sleepstate_index%].message=%_GSS_message%"
	if "[%_GSS_state%]" NEQ "[]" if "[%_GSS_message%]" NEQ "[]" set "powercfg.sleepstates.unsupported.ubound=%_GSS_unsupported_sleepstate_index%"
	if "[%_GSS_state%]" NEQ "[]" if "[%_GSS_message%]" NEQ "[]" set "powercfg.sleepstates[%_GSS_state%].unsupported=true"
	if "[%_GSS_state%]" NEQ "[]" if "[%_GSS_message%]" NEQ "[]" set "powercfg.sleepstates[%_GSS_state%]=%_GSS_message%"
)
set /a "_GSS_contents_index+=1"
if %_GSS_contents_index% LEQ %_GSS_contents_ubound% GoTo :GetSleepStates-contents-loop
Call :ClearVariablesByPrefix %_GetPowerSettings_prefix% _GetPowerSettings powercfg.sleepstates.contents
GoTo :EOF

::Usage Call :GetSupportedSleepStates optional OutputArray
:GetSupportedSleepStates
if not defined powercfg.sleepstates.ubound Call :GetSleepStates
set /a "_GetSupportedSleepStates_index=0"
set /a "_GetSupportedSleepStates_ubound=%powercfg.sleepstates.supported.ubound%"
:GetSupportedSleepStates-loop
if "[%~1]" EQU "[]" ( call echo %%powercfg.sleepstates.supported[%_GetSupportedSleepStates_index%]%% ) else ( call set "%~1[%_GetSupportedSleepStates_index%]=%%powercfg.sleepstates.supported[%_GetSupportedSleepStates_index%]%%" & set "%~1.ubound=%_GetSupportedSleepStates_index%") 
set /a "_GetSupportedSleepStates_index+=1"
if %_GetSupportedSleepStates_index% LEQ %_GetSupportedSleepStates_ubound% GoTo :GetSupportedSleepStates-loop
Call :ClearVariablesByPrefix _GetSupportedSleepStates
GoTo :EOF

::Usage Call :GetUnsupportedSleepStates optional OutputArray
:GetUnsupportedSleepStates
if not defined powercfg.sleepstates.ubound Call :GetSleepStates
set /a "_GetUnsupportedSleepStates_index=0"
set /a "_GetUnsupportedSleepStates_ubound=%powercfg.sleepstates.unsupported.ubound%"
:GetUnsupportedSleepStates-loop
if "[%~1]" EQU "[]" ( call echo %%powercfg.sleepstates.unsupported[%_GetUnsupportedSleepStates_index%]%% ) else ( call set "%~1[%_GetUnsupportedSleepStates_index%]=%%powercfg.sleepstates.unsupported[%_GetUnsupportedSleepStates_index%]%%" & set "%~1.ubound=%_GetUnsupportedSleepStates_index%") 
set /a "_GetUnsupportedSleepStates_index+=1"
if %_GetUnsupportedSleepStates_index% LEQ %_GetUnsupportedSleepStates_ubound% GoTo :GetUnsupportedSleepStates-loop
Call :ClearVariablesByPrefix _GetUnsupportedSleepStates
GoTo :EOF

::Usage Call :GetUnsupportedSleepStatesWithReason optional OutputArray
:GetUnsupportedSleepStatesWithReason
if not defined powercfg.sleepstates.ubound Call :GetSleepStates
set /a "_GetUnsupportedSleepStatesWithReason_index=0"
set /a "_GetUnsupportedSleepStatesWithReason_ubound=%powercfg.sleepstates.unsupported.ubound%"
:GetUnsupportedSleepStatesWithReason-loop
if "[%~1]" EQU "[]" ( call echo %%powercfg.sleepstates.unsupported[%_GetUnsupportedSleepStatesWithReason_index%]%% : %%powercfg.sleepstates.unsupported[%_GetUnsupportedSleepStatesWithReason_index%].message%%  ) else ( call set "%~1[%_GetUnsupportedSleepStatesWithReason_index%]=%%powercfg.sleepstates.unsupported[%_GetUnsupportedSleepStatesWithReason_index%]%% : %%powercfg.sleepstates.unsupported[%_GetUnsupportedSleepStatesWithReason_index%].message%%" & set "%~1.ubound=%_GetUnsupportedSleepStatesWithReason_index%") 
set /a "_GetUnsupportedSleepStatesWithReason_index+=1"
if %_GetUnsupportedSleepStatesWithReason_index% LEQ %_GetUnsupportedSleepStatesWithReason_ubound% GoTo :GetUnsupportedSleepStatesWithReason-loop
Call :ClearVariablesByPrefix _GetUnsupportedSleepStatesWithReason
GoTo :EOF

::Usage Call :SetMonitorTimeout optional AC-timeout-minutes optional DC-timeout-minutes
:SetMonitorTimeout
if "[%~1]" NEQ "[]" powercfg /change monitor-timeout-ac %~1
if "[%~2]" NEQ "[]" powercfg /change monitor-timeout-ac %~2
GoTo :EOF

::Usage Call :SetDiskTimeout optional AC-timeout-minutes optional DC-timeout-minutes
:SetDiskTimeout
if "[%~1]" NEQ "[]" powercfg /change disk-timeout-ac %~1
if "[%~2]" NEQ "[]" powercfg /change disk-timeout-ac %~2
GoTo :EOF
::Usage Call :SetStandbyTimeout optional AC-timeout-minutes optional DC-timeout-minutes
:SetStandbyTimeout
if "[%~1]" NEQ "[]" powercfg /change standby-timeout-ac %~1
if "[%~2]" NEQ "[]" powercfg /change standby-timeout-ac %~2
GoTo :EOF
::Usage Call :SetHibernateTimeout optional AC-timeout-minutes optional DC-timeout-minutes
:SetHibernateTimeout
if "[%~1]" NEQ "[]" powercfg /change hibernate-timeout-ac %~1
if "[%~2]" NEQ "[]" powercfg /change hibernate-timeout-ac %~2
GoTo :EOF

::Usage Call :GetPowerSchemeElements ElementString PowerSetting PowerSubgroup PowerScheme
:GetPowerSchemeElements 
for /f "tokens=1,2,3* delims=." %%a in ("%~1") ( echo a%%a b%%b c%%c d%%d)
GoTo :EOF

::Usage Call :GetPowerSchemeValues Powerscheme(index, name or guid) OutputArray
:GetPowerSchemeValues
set "_GetPowerSchemeValues_prefix=_GPSV"
Call :ReadInputArgument _GPSV_scheme_input "%~1"
Call :GetPowerSchemeIndex "%_GPSV_scheme_input%" _GPSV_scheme_index
Call :ListPowerSettingsInAllSubgroups %_GPSV_scheme_index% _GPSV_settings
set /a "_GPSV_scheme_subgroups_index=0"
set /a "_GPSV_scheme_subgroups_ubound=%_GPSV_scheme_subgroups.ubound%"
:GetPowerSchemeValues-subgroup-loop
Call :ListPowerSubgroups NOPREFIX _GPSV_scheme_index _GPSV_scheme_subgroups



Call :ClearVariablesByPrefix 
set /a "_GPSV_scheme_subgroups_index+=1"
if %_GPSV_scheme_subgroups_index% LEQ %_GPSV_scheme_subgroups_ubound% GoTo :GGetPowerSchemeValues-subgroup-loop
Call :ClearVariablesByPrefix %_GetPowerSchemeValues_prefix% _GetPowerSchemeValues
GoTo :EOF

::Usage Call :ReadInputArgument OutputVariable Input
:ReadInputArgument
if defined %~2 call set %~1=%%%~2%%
if not defined %~2 set %~1=%~2
GoTo :EOF


:MakeStringLenght-DEMO

set mystring[0]=Mary had a little lamb. 
set mystring[1]=Mary had a little lamb. 1
set mystring[2]=Mary had a little lamb. 12
set mystring[3]=Mary had a little lamb. 123
set mystring[4]=Mary had a little lamb. 1234
set mystring[5]=Mary had a little lamb. 12345
set mystring[6]=Mary had a little lamb. 123456
set mystring[7]=Mary had a little lamb. 1234567
set mystring[8]=Mary had a little lamb. 12345678
set mystring[9]=Mary had a little lamb. 123456789

echo.
echo Output mystring array AS IS
set /a "_MakeStringLenght_DEMO_index=0"
set /a "_MakeStringLenght_DEMO_ubound=9
:MakeStringLenght-DEMO-loop
call set _MakeStringLenght_DEMO_output=%%mystring[%_MakeStringLenght_DEMO_index%]%%
echo output:%_MakeStringLenght_DEMO_output%:
set /a "_MakeStringLenght_DEMO_index+=1"
if %_MakeStringLenght_DEMO_index% LEQ %_MakeStringLenght_DEMO_ubound% GoTo :MakeStringLenght-DEMO-loop

echo.
echo Output mystring array MakeStringLenght=20
set /a "_MakeStringLenght_DEMO_index=0"
set /a "_MakeStringLenght_DEMO_ubound=9
:MakeStringLenght-DEMO-loop
Call :MakeStringLenght _MakeStringLenght_DEMO_output 20 mystring[%_MakeStringLenght_DEMO_index%]
echo output:%_MakeStringLenght_DEMO_output%:
set /a "_MakeStringLenght_DEMO_index+=1"
if %_MakeStringLenght_DEMO_index% LEQ %_MakeStringLenght_DEMO_ubound% GoTo :MakeStringLenght-DEMO-loop

echo.
echo Output mystring array MakeStringLenght=30
set /a "_MakeStringLenght_DEMO_index=0"
set /a "_MakeStringLenght_DEMO_ubound=9
:MakeStringLenght-DEMO-loop
Call :MakeStringLenght _MakeStringLenght_DEMO_output 30 mystring[%_MakeStringLenght_DEMO_index%]
echo output:%_MakeStringLenght_DEMO_output%:
set /a "_MakeStringLenght_DEMO_index+=1"
if %_MakeStringLenght_DEMO_index% LEQ %_MakeStringLenght_DEMO_ubound% GoTo :MakeStringLenght-DEMO-loop

echo.
echo Output mystring array RIGHTALIGNED MakeStringLenght=33
set /a "_MakeStringLenght_DEMO_index=0"
set /a "_MakeStringLenght_DEMO_ubound=9
:MakeStringLenght-DEMO-loop
Call :MakeStringLenght RIGHTALIGNED _MakeStringLenght_DEMO_output 33 mystring[%_MakeStringLenght_DEMO_index%]
echo output:%_MakeStringLenght_DEMO_output%:
set /a "_MakeStringLenght_DEMO_index+=1"
if %_MakeStringLenght_DEMO_index% LEQ %_MakeStringLenght_DEMO_ubound% GoTo :MakeStringLenght-DEMO-loop

GoTo :EOF


::Usage Call :MakeStringLenght optional RIGHTALIGNED OutputString MaxLenght Input
:MakeStringLenght
if "[%~1]" EQU "[RIGHTALIGNED]" ( set "_MakeStringLenght_rightaligned=true" & shift )
set "_MakeStringLenght_output=%~2"
set "_MakeStringLenght_max_lenght=%~2"
Call :ReadInputArgument _MakeStringLenght_input "%~3"
Call :len _MakeStringLenght_input_len _MakeStringLenght_input

if "[%_MakeStringLenght_max_lenght%]" EQU "[%_MakeStringLenght_input_len%]" set %_MakeStringLenght_output%=%_MakeStringLenght_input%
if "[%_MakeStringLenght_max_lenght%]" EQU "[%_MakeStringLenght_input_len%]" exit /b 0
if "[%_MakeStringLenght_max_lenght%]" GTR "[%_MakeStringLenght_input_len%]" set %_MakeStringLenght_output%=%_MakeStringLenght_input%

if "[%_MakeStringLenght_max_lenght%]" LSS "[%_MakeStringLenght_input_len%]"

len input
if len equal maxlenght send input to output
if len less than maxlenght, add spaces to end of variable until maxlenght, if right aligned, assign spaces to beginning
if greater than maxlenght, trunkate string to from beginning to maxlenght if not right aligned, from -maxlenght to end if rightaligned

GoTo :EOF

:GetConsoleDimensions-DEMO

Call :GetConsoleWidth __GetConsoleDimensions
echo console width is %__GetConsoleDimensions%
echo console width (from errorlevel) is %errorlevel%

set "__GetConsoleDimensions="
Call :GetConsoleWidth 
echo console width (from errorlevel) is %errorlevel%

echo.
Call :GetConsoleHeight __GetConsoleDimensions
echo console Height is %__GetConsoleDimensions%
echo console Height (from errorlevel) is %errorlevel%

set "__GetConsoleDimensions="
Call :GetConsoleHeight 
echo console Height (from errorlevel) is %errorlevel%

echo.
echo get console dimensions (real and buffer)
Call :GetConsoleBufferDimensions __GetConsoleDimensionsWidthOutput __GetConsoleDimensionsHeightOutput
echo console width %__GetConsoleDimensionsWidthOutput% height %__GetConsoleDimensionsHeightOutput%
Call :GetConsoleDimensions __GetConsoleDimensionsWidthOutput __GetConsoleDimensionsHeightOutput
echo console width %__GetConsoleDimensionsWidthOutput% height %__GetConsoleDimensionsHeightOutput%

echo.
echo Get the rest of the console properties
Call :GetCodePage __GetConsoleDimensions
echo console CodePage is %__GetConsoleDimensions%
echo console CodePage (from errorlevel) is %errorlevel%
Call :GetKeyboardDelay __GetConsoleDimensions
echo console KeyboardDelay is %__GetConsoleDimensions%
echo console KeyboardDelay (from errorlevel) is %errorlevel%
Call :GetKeyboardRate __GetConsoleDimensions
echo console KeyboardRate is %__GetConsoleDimensions%
echo console KeyboardRate (from errorlevel) is %errorlevel%
Call :GetConsoleBufferWidth __GetConsoleDimensions
echo console BufferWidth is %__GetConsoleDimensions%
echo console BufferWidth (from errorlevel) is %errorlevel%
Call :GetConsoleBufferHeight __GetConsoleDimensions
echo console BufferHeight is %__GetConsoleDimensions%
echo console BufferHeight (from errorlevel) is %errorlevel%

echo.
echo populating console. object
Call :GetConsoleProperties

set console.

echo.
GoTo :EOF

:SetConsoleDimensions-DEMO
set "_SetConsoleDimensions_index=1"
set "_SetConsoleDimensions_ubound=100"
:SetConsoleDimensions-DEMO-loop
Call :SetConsoleDimensions %_SetConsoleDimensions_index% %_SetConsoleDimensions_index%
echo w%_SetConsoleDimensions_index%h%_SetConsoleDimensions_index%e%errorlevel%
echo val%lastvalid%
echo inval%lastinvalid%
if %errorlevel%==0 set lastvalid=w%_SetConsoleDimensions_index%h%_SetConsoleDimensions_index%
if %errorlevel%==-1 set lastinvalid=w%_SetConsoleDimensions_index%h%_SetConsoleDimensions_index%
set /a "_SetConsoleDimensions_index+=1"
if %_SetConsoleDimensions_index% LEQ %_SetConsoleDimensions_ubound% GoTo :SetConsoleDimensions-DEMO-loop

timeout /t 5

set "_SetConsoleDimensions_index=100"
set "_SetConsoleDimensions_ubound=1"
:SetConsoleDimensions-DEMO-loop-2
Call :SetConsoleDimensions %_SetConsoleDimensions_index% %_SetConsoleDimensions_index%
echo w%_SetConsoleDimensions_index%h%_SetConsoleDimensions_index%e%errorlevel%
echo val%lastvalid%
echo inval%lastinvalid%
if %errorlevel%==0 set lastvalid=w%_SetConsoleDimensions_index%h%_SetConsoleDimensions_index%
if %errorlevel%==-1 set lastinvalid=w%_SetConsoleDimensions_index%h%_SetConsoleDimensions_index%
set /a "_SetConsoleDimensions_index-=1"
if %_SetConsoleDimensions_index% GEQ %_SetConsoleDimensions_ubound% GoTo :SetConsoleDimensions-DEMO-loop-2


timeout /t 2
Call :SetConsoleDimensions 15 15
echo w15h15
timeout /t 2
Call :SetConsoleDimensions 15 20
echo w15h20
timeout /t 2
Call :SetConsoleDimensions 50 15
echo w50h15
timeout /t 2
Call :SetConsoleDimensions 50 30 
echo w50h30
timeout /t 2
Call :SetConsoleDimensions 100 20
echo w100h20
timeout /t 2
Call :SetConsoleDimensions 130 50
echo w130h50


set "_SetConsoleDimensions_index=0"
set "_SetConsoleDimensions_ubound=50"
:SetConsoleDimensions-DEMO-loop-2
Call :SetConsoleDimensions %_SetConsoleDimensions_index% %_SetConsoleDimensions_index%
echo w%_SetConsoleDimensions_index%h%_SetConsoleDimensions_index%e%errorlevel%
echo val%lastvalid%
echo inval%lastinvalid%
if %errorlevel%==0 set lastvalid=w%_SetConsoleDimensions_index%h%_SetConsoleDimensions_index%
if %errorlevel%==-1 set lastinvalid=w%_SetConsoleDimensions_index%h%_SetConsoleDimensions_index%


set /a "_SetConsoleDimensions_index-=1"
if %_SetConsoleDimensions_index% GEQ %_SetConsoleDimensions_ubound% GoTo :SetConsoleDimensions-DEMO-loop-2


GoTo :EOF

::Usage Call :GetConsoleWidth optional OutputVariable
::Also returns width via return value
 :GetConsoleWidth
=for /f "tokens=1,* delims=:" %%b in ('powershell -Command "& { $Host.UI.RawUI.WindowSize.Width }"') do (
	set /a "_GetConsoleWidth_width=%%b"
)
if "[%~1]" NEQ "[]" set "%~1=%_GetConsoleWidth_width%"
set "_GetConsoleWidth_width=" & exit /b %_GetConsoleWidth_width%

::Usage Call :GetConsoleHeight optional OutputVariable
::Also returns height via return value
:GetConsoleHeight
for /f "tokens=1,* delims=:" %%b in ('powershell -Command "& { $Host.UI.RawUI.WindowSize.Height }"') do (
	set /a "_GetConsoleHeight_height=%%b"
)
if "[%~1]" NEQ "[]" set "%~1=%_GetConsoleHeight_height%"
set "_GetConsoleHeight_height=" & exit /b %_GetConsoleHeight_height%

::Usage Call :GetConsoleBufferWidth optional OutputVariable
::Also returns width via return value
:GetConsoleBufferWidth
for /f "tokens=1,* delims=:" %%b in ('mode con') do (
	if "[%%b]" EQU "[    Columns]" set /a "_GetConsoleBufferWidth_width=%%c"
)
if "[%~1]" NEQ "[]" set "%~1=%_GetConsoleBufferWidth_width%"
set "_GetConsoleBufferWidth_width=" & exit /b %_GetConsoleBufferWidth_width%

::Usage Call :GetConsoleBufferHeight optional OutputVariable
::Also returns height via return value
:GetConsoleBufferHeight
for /f "tokens=1,* delims=:" %%b in ('mode con') do (
	if "[%%b]" EQU "[    Lines]" set /a "_GetConsoleBufferHeight_height=%%c"
)
if "[%~1]" NEQ "[]" set "%~1=%_GetConsoleBufferHeight_height%"
set "_GetConsoleBufferHeight_height=" & exit /b %_GetConsoleBufferHeight_height%

::Usage Call :GetConsoleDimensions WidthOutput HeightOutput
:GetConsoleDimensions
for /f "tokens=1,* delims=:" %%b in ('powershell -Command "& { $Host.UI.RawUI.WindowSize.Width }"') do (
	set /a "_GetConsoleDimensions_width=%%b"
)
for /f "tokens=1,* delims=:" %%b in ('powershell -Command "& { $Host.UI.RawUI.WindowSize.Height }"') do (
	set /a "_GetConsoleDimensions_height=%%b"
)
set "%~1=%_GetConsoleDimensions_width%"
set "%~2=%_GetConsoleDimensions_height%"
set "_GetConsoleDimensions_width=" & set "_GetConsoleDimensions_height="
GoTo :EOF

::Usage Call :GetConsoleBufferDimensions WidthOutput HeightOutput
:GetConsoleBufferDimensions
for /f "tokens=1,* delims=:" %%b in ('mode con') do (
	if "[%%b]" EQU "[    Columns]" set /a "_GetConsoleBufferDimensions_width=%%c"
	if "[%%b]" EQU "[    Lines]" set /a "_GetConsoleBufferDimensions_height=%%c"
)
set "%~1=%_GetConsoleBufferDimensions_width%"
set "%~2=%_GetConsoleBufferDimensions_height%"
set "_GetConsoleBufferDimensions_width=" & set "_GetConsoleBufferDimensions_height="
GoTo :EOF

::Usage Call :GetCodePage optional OutputVariable
::Also returns code page via return value
:GetCodePage
for /f "tokens=1,* delims=:" %%b in ('mode con') do (
	if "[%%b]" EQU "[    Code page]" set /a "_GetCodePage_page=%%c"
)
if "[%~1]" NEQ "[]" set "%~1=%_GetCodePage_page%"
set "_GetCodePage_page=" & exit /b %_GetCodePage_page%

::Usage Call :GetKeyboardDelay optional OutputVariable
::Also returns keyboard delay via return value
:GetKeyboardDelay
for /f "tokens=1,* delims=:" %%b in ('mode con') do (
	if "[%%b]" EQU "[    Keyboard delay]" set /a "_GetKeyboardDelay_delay=%%c"
)
if "[%~1]" NEQ "[]" set "%~1=%_GetKeyboardDelay_delay%"
set "_GetKeyboardDelay_delay=" & exit /b %_GetKeyboardDelay_delay%

::Usage Call :GetKeyboardRate optional OutputVariable
::Also returns keyboard rate via return value
:GetKeyboardRate
for /f "tokens=1,* delims=:" %%b in ('mode con') do (
	if "[%%b]" EQU "[    Keyboard rate]" set /a "_GetKeyboardRate_rate=%%c"
)
if "[%~1]" NEQ "[]" set "%~1=%_GetKeyboardRate_rate%"
set "_GetKeyboardRate_rate=" & exit /b %_GetKeyboardRate_rate%

::Usage Call :GetConsoleDimensions
:GetConsoleProperties
for /f "tokens=1,* delims=:" %%b in ('mode con') do (
	if "[%%b]" EQU "[    Columns]" set /a "_GetConsoleProperties_bufferwidth=%%c"
	if "[%%b]" EQU "[    Lines]" set /a "_GetConsoleProperties_bufferheight=%%c"
	if "[%%b]" EQU "[    Code page]" set /a "_GetConsoleProperties_codepage=%%c"
	if "[%%b]" EQU "[    Keyboard delay]" set /a "_GetConsoleProperties_delay=%%c"
	if "[%%b]" EQU "[    Keyboard rate]" set /a "_GetConsoleProperties_rate=%%c"
)
for /f "tokens=1,* delims=:" %%b in ('powershell -Command "& { $Host.UI.RawUI.WindowSize.Width }"') do (
	set /a "_GetConsoleProperties_width=%%b"
)
for /f "tokens=1,* delims=:" %%b in ('powershell -Command "& { $Host.UI.RawUI.WindowSize.Height }"') do (
	set /a "_GetConsoleProperties_height=%%b"
)
set /a "console.width=%_GetConsoleProperties_width%"
set /a "console.height=%_GetConsoleProperties_height%"
set /a "console.buffer.width=%_GetConsoleProperties_bufferwidth%"
set /a "console.buffer.height=%_GetConsoleProperties_bufferheight%"
set /a "console.codepage=%_GetConsoleProperties_codepage%"
set /a "console.delay=%_GetConsoleProperties_delay%"
set /a "console.rate=%_GetConsoleProperties_rate%"
Call :ClearVariablesByPrefix _GetConsoleProperties
GoTo :EOF

::Usage Call :SetConsoleDimensions width height
:SetConsoleDimensions
mode con cols=%~1 lines=%~2
GoTo :EOF

:StringRepeat-DEMO

echo.
set "__StringRepeat_demo=
echo StringRepeat character A 5 times 
Call :StringRepeat __StringRepeat_demo 5 A
echo output value :%__StringRepeat_demo%

echo.
set "__StringRepeat_demo=
echo StringRepeat string AbC 5 times
Call :StringRepeat __StringRepeat_demo 5 AbC
echo output value :%__StringRepeat_demo%

echo.
set "__StringRepeat_demo=
echo StringRepeat string Hel lo 5 times
Call :StringRepeat __StringRepeat_demo 5 "Hel lo"
echo output value :%__StringRepeat_demo%

echo.
set "__StringRepeat_demo=
echo StringRepeat character A 5 times (input passed as variable)
set " __StringRepeat_demo_input=A"
Call :StringRepeat __StringRepeat_demo 5 __StringRepeat_demo_input
echo output value :%__StringRepeat_demo%

echo.
set "__StringRepeat_demo=
echo StringRepeat string AbC 5 times (input passed as variable)
set " __StringRepeat_demo_input=AbC"
Call :StringRepeat __StringRepeat_demo 5 __StringRepeat_demo_input
echo output value :%__StringRepeat_demo%

echo.
set "__StringRepeat_demo=
echo StringRepeat string Hel lo 5 times (input passed as variable)
set " __StringRepeat_demo_input=Hel lo"
Call :StringRepeat __StringRepeat_demo 5 __StringRepeat_demo_input
echo output value :%__StringRepeat_demo%

GoTo :EOF
:EndOf_StringRepeat-DEMO

::Usage Call :StringRepeat OutputVariable Count Input
:StringRepeat
set "_StringRepeat_output=%~1"
set "_StringRepeat_count=%~2"
set _StringRepeat_input=%~3
if defined %~3 call set _StringRepeat_input=%%%~3%%
set /a "_StringRepeat_index=0"
:StringRepeat-loop
set "_StringRepeat_internal=%_StringRepeat_internal%%_StringRepeat_input%"
set /a "_StringRepeat_index+=1"
if %_StringRepeat_index% LSS %_StringRepeat_count% GoTo :StringRepeat-loop
set "%_StringRepeat_output%=%_StringRepeat_internal%"
Call :ClearVariablesByPrefix _StringRepeat
GoTo :EOF
:EndOf_StringRepeat

::Usage Call :SquareRoot Input optional OutputVariable
:: https://stackoverflow.com/questions/52977314/how-to-do-square-root-with-windows-command-processor-using-a-batch-file (brute force yeah !)
:sqrt
:SquareRoot
set /a "_SquareRoot_Input=%~1"
set /a "_SquareRoot_Index=0"
:SquareRoot-loop
set /a "_SquareRoot_square=%_SquareRoot_Index%*%_SquareRoot_Index%"
set /a "_SquareRoot_Index+=1"
if %_SquareRoot_square% LSS %_SquareRoot_Input% GoTo :SquareRoot-loop
set /a "_SquareRoot_Index-=1"
if "[%~2]" NEQ "[]" set /a %~2=%_SquareRoot_Index%
Call :ClearVariablesByPrefix _SquareRoot & exit /b %_SquareRoot_Index%
:EndOf_sqrt :EndOf_SquareRoot

:SquareRoot-DEMO
set /a "__SquareRoot_DEMO_index=0" 
set /a "__SquareRoot_DEMO_ubound=100" 
:SquareRoot-DEMO-loop
Call :SquareRoot %__SquareRoot_DEMO_index% __SquareRoot_DEMO_result
echo input %__SquareRoot_DEMO_index% sqrt %__SquareRoot_DEMO_result%
set /a "__SquareRoot_DEMO_index+=1" 
if %__SquareRoot_DEMO_index% LEQ %__SquareRoot_DEMO_ubound% GoTo :SquareRoot-DEMO-loop

echo testing errorlevel output

set /a "__SquareRoot_DEMO_index=0" 
set /a "__SquareRoot_DEMO_ubound=100" 
:SquareRoot-DEMO-loop-1
Call :SquareRoot %__SquareRoot_DEMO_index%
echo input %__SquareRoot_DEMO_index% sqrt %errorlevel%
set /a "__SquareRoot_DEMO_index+=1" 
if %__SquareRoot_DEMO_index% LEQ %__SquareRoot_DEMO_ubound% GoTo :SquareRoot-DEMO-loop-1

GoTo :EOF


::Usage Call :GetCirclePoint Xvalue Radius optional Output
:GetCirclePoint
set /a "_GetCirclePoint_Xvalue=%~1"
set /a "_GetCirclePoint_radius=%~2"
set /a "_GetCirclePoint_Xvalue_square=%_GetCirclePoint_Xvalue%*%_GetCirclePoint_Xvalue%"
set /a "_GetCirclePoint_radius_square=%_GetCirclePoint_radius%*%_GetCirclePoint_radius%"
set /a "_GetCirclePoint_hypothenuse_square=%_GetCirclePoint_radius_square%-%_GetCirclePoint_Xvalue_square%"
Call :SquareRoot %_GetCirclePoint_hypothenuse_square% _GetCirclePoint_hypothenuse
if "[%~3]" NEQ "[]" set /a "%~3=%_GetCirclePoint_hypothenuse%"
exit /b %_GetCirclePoint_hypothenuse%

:GetCirclePoint-DEMO
set /a "__GetCirclePoint_DEMO_index=0"
set /a "__GetCirclePoint_DEMO_radius=10"
:GetCirclePoint-DEMO-loop
Call :GetCirclePoint %__GetCirclePoint_DEMO_index% %__GetCirclePoint_DEMO_radius% __GetCirclePoint_DEMO_point
set /a "__GetCirclePoint_DEMO_space=%__GetCirclePoint_DEMO_point%-1"
Call :StringRepeat __GetCirclePoint_DEMO_space %__GetCirclePoint_DEMO_space% " "
set "__GetCirclePoint_DEMO_point=%__GetCirclePoint_DEMO_space%O"
set "__GetCirclePoint[%__GetCirclePoint_DEMO_index%]=%__GetCirclePoint_DEMO_point%"
set /a "__GetCirclePoint_DEMO_index+=1"
if %__GetCirclePoint_DEMO_index% LEQ %__GetCirclePoint_DEMO_radius% GoTo :GetCirclePoint-DEMO-loop

set /a "__GetCirclePoint_DEMO_index=0"
set /a "__GetCirclePoint_DEMO_radius=10"
:GetCirclePoint-DEMO-loop-1
call echo %%__GetCirclePoint[%__GetCirclePoint_DEMO_index%]%%
set /a "__GetCirclePoint_DEMO_index+=1"
if %__GetCirclePoint_DEMO_index% LEQ %__GetCirclePoint_DEMO_radius% GoTo :GetCirclePoint-DEMO-loop-1
GoTo :EOF