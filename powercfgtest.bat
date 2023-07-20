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

Call :ClearVariablesByPrefix _powercfg_demo

REM Call :GetPowercfgSchemes
REM Call :GetPowerSchemeContents
REM Call :GetPowerSettings

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


GoTO :EOF


::Usage Call :CommandToArray OutputArray CommandString
:CommandToArray
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

::Usage Call :IsNumeric "%Value%" optional Output
:IsNumeric
if "[%~1]"=="[]" exit /b 0
set "IsNumericInternal=0123456789"
echo.%~1| findstr /r "[^%IsNumericInternal%]" >nul && (
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
	if "[%_GetPowercfgSchemes_default%]" NEQ "[]" ( set "powercfg.schemes.default.guid=%_GetPowercfgSchemes_guid%" & set "powercfg.schemes.default.name=%_GetPowercfgSchemes_name%" )
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

REM set /a "_GPS_index=0"
REM :GetPowerSettings-loop-cleanup
REM Call :ClearVariablesByPrefix powercfg.schemes[%_GPS_index%].contents
REM set /a "_GPS_index+=1"
REM if %_GPS_index% LEQ %powercfg.schemes.ubound% GoTo :GetPowerSettings-loop-cleanup

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
if not defined powercfg.schemes[0].subgroup.ubound Call :GetPowerSettings
if "[%~1]" NEQ "[]" call set /a "_ListPowerSchemes_output_ubound=%%%~1.ubound%%" 2>nul
if "[%~1]" NEQ "[]" if "[%_ListPowerSchemes_output_ubound%]" EQU "[]" ( set /a "_ListPowerSchemes_output_ubound=0" ) else ( set /a "_ListPowerSchemes_output_ubound+=1" )
set /a "_ListPowerSchemes_index=0"
:ListPowerSchemes-loop
if "[%~1]" EQU "[]" ( call echo %%powercfg.schemes[%_ListPowerSchemes_index%].name%% ) else ( call set "%~1[%_ListPowerSchemes_output_ubound%]=%%powercfg.schemes[%_ListPowerSchemes_index%].name%%" & set "%~1.ubound=%_ListPowerSchemes_output_ubound%" & set /a "_ListPowerSchemes_output_ubound+=1" )
set /a "_ListPowerSchemes_index+=1"
if %_ListPowerSchemes_index% LEQ %powercfg.schemes.ubound% GoTo :ListPowerSchemes-loop
Call :ClearVariablesByPrefix _ListPowerSchemes
GoTo :EOF

:: If no output array is specified, the list will be echoed to the console
::Usage Call :ListAllPowerSubgroups optional OutputArray
:ListAllPowerSubgroups
if not defined powercfg.schemes[0].subgroup.ubound Call :GetPowerSettings
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


::Usage Call :ListPowerSubgroups Powerscheme(name or guid) optional OutputArray
:ListPowerSubgroups
if "[%~1]" EQU "[NOPREFIX]" ( set "_ListPowerSubgroups_noprefix=true" & shift )
if not defined powercfg.schemes[0].subgroup.ubound Call :GetPowerSettings
if "[%~2]" NEQ "[]" call set /a "_ListPowerSubgroups_output_ubound=%%%~2.ubound%%" 2>nul
if "[%~2]" NEQ "[]" if "[%_ListPowerSubgroups_output_ubound%]" EQU "[]" ( set /a "_ListPowerSubgroups_output_ubound=0" ) else ( set /a "_ListPowerSubgroups_output_ubound+=1" )
Call :IsNumeric "%~1" _ListPowerSubgroups_wasnumeric
if "[%_ListPowerSubgroups_wasnumeric%]" NEQ "[true]" Call :FindPowerScheme "%~1" _ListPowerSubgroups_schemes_index 
if "[%_ListPowerSubgroups_wasnumeric%]" EQU "[true]" set /a "_ListPowerSubgroups_schemes_index=%~1"
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



::Usage Call :FindPowerScheme Powerscheme(name or guid) optional OutputIndex
::Returns powerscheme index
:FindPowerScheme
if not defined powercfg.schemes[0].subgroup.ubound Call :GetPowerSettings
set "_FindPowerScheme_search=%~1"
set /a "_FindPowerScheme_index=0"
:FindPowerScheme-loop
call set "_FindPowerScheme_current_guid=%%powercfg.schemes[%_FindPowerScheme_index%].guid%%"
call set "_FindPowerScheme_current_name=%%powercfg.schemes[%_FindPowerScheme_index%].name%%"
if "[%_FindPowerScheme_search%]" EQU "[%_FindPowerScheme_current_guid%]" set "_FindPowerScheme_match_found=true" & GoTo :FindPowerScheme-loop-end
if "[%_FindPowerScheme_search%]" EQU "[%_FindPowerScheme_current_name%]" set "_FindPowerScheme_match_found=true" & GoTo :FindPowerScheme-loop-end
set /a "_FindPowerScheme_index+=1"
if %_FindPowerScheme_index% LEQ %powercfg.schemes.ubound% GoTo :FindPowerScheme-loop
:FindPowerScheme-loop-end
if "[%_FindPowerScheme_match_found%]" EQU "[true]" if "[%~2]" NEQ "[]" set "%~2=%_FindPowerScheme_index%"
if "[%_FindPowerScheme_match_found%]" EQU "[true]" Call :ClearVariablesByPrefix _FindPowerScheme & exit /b %_FindPowerScheme_index%
Call :ClearVariablesByPrefix _FindPowerScheme
exit /b -1


:ListPowerSettings
:GetDefaultSchemeName

:FindSubgroup

:GetSettingACValue balanced.Hard disk.whatever output
:GetSettingDCValue
