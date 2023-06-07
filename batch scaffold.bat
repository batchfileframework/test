@echo off
:setup
Set InitialErrorLevel=%ErrorLevel%
Set InitialWorkingDirectory=%CD%
Set FolderOfBatchFile=%~dp0
Set Pushed=true & Call :GoToFolderOfBatchFile %FolderOfBatchFile%
REM Set ISCONSOLE
REM Set IsAdmin ?
REM Set ISSILENT
REM enable logging / logging errors example logging with macro if /i "%%A"=="-log" (set "_log=>> %~n0.log")
REM Call ELEVATE ?

REM pretend variable set to true will only echo irreversible commands, rather than execute them
Set pretend=false
REM quiet will supress non-essential outputs
Set quiet=false
REM verbose will output extra comments and status messages
Set verbose=false
REM if logging is set to enabled, console output will be written to files, with timestamps using tee
Set logging=true
REM Set logfile=c:\mylogfile.txt
REM Set errlogfile=c:\myerrlogfile.txt








rem SETUP your variables and commands
REM get into variables ip addresses, subnet, routes, dns server, time server, firewall status, defender status, UAC status
REM list all network  devices into an array
REM list all WMI sensors, temperatures voltage and power
REM list all devices in device manager
REM list all usb devices (usbdevview)
REM list bluetooth devices into list array
REM list displays, resolutions, hertzs, relative position, mode (off, extended, duplicate etc) and orientation
rem list ADB android devices and connect to them
rem check for presence of software
REM request user input
REM logging function, error loggin function, other STD ?
rem file to array function
rem array to file function
rem change path in a list of path+files
rem base64 encode decode
rem hex encode decode
rem basic certutil functions
rem hash functions
rem process is running , kill process functions
rem read config file and understand arguments mysetting=value type


rem check for --help requested in argument
:main

GoTo :ElevateDEMO


GoTo :END





GoTo :END

REM Call :TrueFalseDemo

REM Call :EchoCommand "set"

REM GoTo :RegistryHandlingDEMO

GoTo :END

REM GoTo :AppendToPathDEMO










REM BASIC DEMO
:BASICDEMO


REM list all environement varibale
REM demonstration of the all the operators
rem list order of operation
rem demonstrate all conditionnal operations
rem demontrate chained command && || & etc..
rem demonstrate quoting and escaping
rem demonstrate string manipulation left right mid substitution splitting joining 



GoTo :END

:END
IF "%Pushed%"=="true" set Pushed= & Call :ReturnToInitialFolder
IF "%IsConsole%"=="false" pause
exit /b 1



:: Internal functions


:: Function library

:: Perform self-elevation, passing all arguments through.
:ElevateAndWait
set _ElevateAndWait=-Wait
:Elevate
  if defined args set args=%args:^=^^%
  if defined args set args=%args:<=^<%
  if defined args set args=%args:>=^>%
  if defined args set args=%args:&=^&%
  if defined args set args=%args:|=^|%
  if defined args set "args=%args:"=\"\"%"
  :: Note:  
  ::  * To keep the elevated session open until explicitly exited by the user,
  ::    use /k instead of /c
  powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    " Start-Process %_ElevateAndWait% -Verb RunAs -FilePath cmd -ArgumentList \"/c \"\" cd /d \"\"%CD% \"\" ^&^& \"\"%~f0\"\" %args% \"\" \" "
goto :EOF
REM https://stackoverflow.com/questions/76040676/batch-file-auto-elevation-using-powershell-and-not-mangling-the-arguments-but-pr/76055486?noredirect=1#comment134178642_76055486

:: Test if this session is elevated.
:: `net session` only succeeds and therefore reports exit code 0 
:: in an elevated session.
:IsAdmin
if not "[%1]"=="[]" set %1=false
  net session >NUL 2>&1
  if %ERRORLEVEL% == 0 if not "[%1]"=="[]" set %1=true
  net session >NUL 2>&1
goto :EOF

REM INCOMPLETE FUNCTION
REM HELP
:HELP
echo helpful help here
GoTo :EOF

REM :Banner

REM :Version

REM not tested ?
:: Usage Call :EchoArguments your arguments here
:EchoArguments
if "[%0]" == "[]" GoTo :EchoArgumentsEND
if "[%_index%]" == "[]" set _index=0
echo.
echo %_index%       verbatim      %%0=%0 
echo %_index%       unquoted     %%~0=%~0
echo %_index%          drive    %%~d0=%~d0
echo %_index%           path    %%~p0=%~p0
echo %_index%       filename    %%~n0=%~n0
echo %_index%      extension    %%~x0=%~x0
echo %_index%      full path    %%~f0=%~f0
echo %_index% drive and path   %%~dp0=%~dp0
echo %_index%      full path %%~dpnx0=%~dpnx0
echo %_index%     short path    %%~s0=%~s0
echo %_index%     attributes    %%~a0=%~a0
echo %_index%      file time    %%~t0=%~t0
echo %_index%  path search %%~$PATH:0=%~$PATH:0
shift
set /a _index+=1
GoTo :EchoArguments
:EchoArgumentsEND
set _index=
GoTo :EOF

REM INCOMPLETE
:: Usage Call :EchoArguments your arguments here
:ArgumentsToArray
if "[%Arguments%]"=="[]" set "Arguments=Arguments"
:ArgumentsToArrayMAIN
if "[%0]" == "[]" GoTo :EchoArgumentsEND
if "[%_index%]" == "[]" set _index=0
set "_buffer=%0"
set "Arguments[%_index%].verbatim=%0"
set "Arguments[%_index%]=%~0"
if not "[%~a0]"=="[]" echo %0 has attributes 
if /i not "[%%_buffer:%~d0%=%%]"=="[%0]" echo drive is in variable
REM if /i not "[%_buffer:%~p0%=]"=="[%0]" echo drive is in variable


REM echo.
REM echo %index%       verbatim      %%0=%0 
REM echo %index%       unquoted     %%~0=%~0
REM echo %index%          drive    %%~d0=%~d0
REM echo %index%           path    %%~p0=%~p0
REM echo %index%       filename    %%~n0=%~n0
REM echo %index%      extension    %%~x0=%~x0
REM echo %index%      full path    %%~f0=%~f0
REM echo %index% drive and path   %%~dp0=%~dp0
REM echo %index%      full path %%~dpnx0=%~dpnx0
REM echo %index%     short path    %%~s0=%~s0
REM echo %index%     attributes    %%~a0=%~a0
REM echo %index%      file time    %%~t0=%~t0
REM echo %index%  path search %%~$PATH:0=%~$PATH:0
shift
set /a _index+=1
GoTo :EchoArguments
:ArgumentsToArrayEND
set Arguments=
set _index=
GoTo :EOF


::Usage Call :QUIT 'note this kills the process and does not return to console
:QUIT
title QUITTHISNOW
taskkill /f /fi "WINDOWTITLE eq QUITTHISNOW"
exit /b

:: Usage Call :Sleep 5 ' Sleep time in seconds
:Sleep
timeout /t %~1
GoTo :EOF

:: Usage Call :ClearLocalVariables
:ClearLocalVariables
for /f "tokens=1,2 delims==" %%a in ('set _ 2^>nul') do set %%a=
GoTo :EOF

:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do set %%a=
GoTo :EOF

:GoToFolderOfBatchFile
pushd %1
GoTo :EOF

:ReturnToInitialFolder
popd
GoTo :EOF

::Usage Call :ShowCodepage 
:ShowCodepage
chcp
GoTo :EOF

::Usage Call :GetCodePage ReturnValue
:GetCodePage
for /f "tokens=1,2 delims=:" %%a in ('chcp') do set %1=%%b
call set %1=%%%1:~1%%
GoTo :EOF

::Usage Call :SetCodePage NewCodePage
:SetCodePage
chcp %~1
GoTo :EOF


::Usage Call :True ReturnValue 'Always returns true, both return value and errorlevel
:true 
if not "[%1]"=="[]" set %1=true
exit /b 0
REM Call :True ReturnValue && echo it is always true (errorlevel 0) || echo it is never false (errorlevel not 0)

::Usage Call :false ReturnValue 'Always returns false, both return value and errorlevel
:false 
if not "[%1]"=="[]" set %1=false
exit /b 1
REM Call :false ReturnValue && echo it is never true (errorlevel 0) || echo it is always false (errorlevel not 0)
REM thanks https://www.tutorialspoint.com/batch_script/

:: ------------------------------
:: ----- Array Manipulation -----
:: ------------------------------

::Usage Call :Deconcatenate Delimiter Input Output 'Returns array starting at [0], see .lbound and .ubound
:deconcatenate
set "_delimiter=%~1" & set /a _delimiter.len=0
set "_input=%~2" & set /a _input.len=0
call :len _delimiter _delimiter.len
call :len _input _input.len
set /a _cursor=0 & set /a _token=0 & set "_char=" & set "_buffer="
set /a %3.lbound=%_cursor%
REM if "[%debug%]"=="[true]" echo input [%_input%] len %_input.len% delimiter [%_delimiter%] len %_delimiter.len%
:deconcatenate_input_loop
REM if "[%debug%]"=="[true]" pause
call set _char=%%_input:~%_cursor%,1%%
REM if "[%debug%]"=="[true]" echo char %_char%
set /a _cursor+=1
set /a _cursor2=0 & set "_IsDelimiter=false"  
:deconcatenate_delimiter_loop
call set _charDelimiter=%%_delimiter:~%_cursor2%,1%%
if "[%_char%]"=="[%_charDelimiter%]" set "_IsDelimiter=true"
if not "[%_IsDelimiter%]"=="[true]" set "_buffer=%_buffer%%_char%"
REM if "[%debug%]"=="[true]" echo _charDelimiter [%_charDelimiter%] _IsDelimiter [%_IsDelimiter%] _cursor %_cursor% _cursor2 %_cursor2% _buffer %_buffer%
set /a _cursor2+=1
if %_cursor2% LSS %_delimiter.len% goto :deconcatenate_delimiter_loop
REM if "[%debug%]"=="[true]" if "[%_IsDelimiter%]"=="[true]" echo writing set %~3[%_token%] = %_buffer% 
if "[%_IsDelimiter%]"=="[true]" call set "%~3[%%_token%%]=%_buffer%" & set "_buffer=" & set /a _token+=1 
REM if "[%debug%]"=="[true]" if "[%_IsDelimiter%]"=="[true]" pause
if %_cursor% LSS %_input.len% goto :deconcatenate_input_loop
if %_cursor% EQU %_input.len% call set "%~3[%%_token%%]=%_buffer%" & set "_buffer=" & set /a %3.ubound=%_token%
GoTo :EOF

::Usage Call :Deconcatenate Delimiter Input Output 'Returns array starting at [0], see .lbound and .ubound
:DeconcatenateFast 
Set "_delimiter=%~1"
Set "_input=%~2"
set /a index=0
set /a %3.lbound=%index%
call set _input="%%_input:%_delimiter%=" "%%"
for %%w in (%_input%) do (
	REM echo %%w
	call set "%~3[%%index%%]=%%w"
	set /a "index+=1"
)
set /a "index-=1"
set %3.ubound=%index%
GoTo :EOF

:: Requires :len (maybe support %ReturnEmpty% for special cases ?)
::Usage Call :GetLastElement Delimiter Input Output 'Returns the last element in string based on specified delimiter
:GetLastElement
set "_delimiter=%~1" & set /a _delimiter.len=0
set "_input=%~2" & set /a _input.len=0
call :len _delimiter _delimiter.len
call :len _input _input.len
set /a _cursor=%_input.len%-1 & set "_char=" & set "_buffer="
REM if "[%debug%]"=="[true]" echo input [%_input%] len %_input.len% delimiter [%_delimiter%] len %_delimiter.len%
:GetLastElement_input_loop
REM if "[%debug%]"=="[true]" pause
call set _char=%%_input:~%_cursor%,1%%
REM if "[%debug%]"=="[true]" echo char %_char%
set /a _cursor-=1
set /a _cursor2=0 & set "_IsDelimiter=false"  
:GetLastElement_delimiter_loop
call set _charDelimiter=%%_delimiter:~%_cursor2%,1%%
if "[%_char%]"=="[%_charDelimiter%]" set "_IsDelimiter=true"
if not "[%_IsDelimiter%]"=="[true]" set "_buffer=%_char%%_buffer%"
REM if "[%debug%]"=="[true]" echo _charDelimiter [%_charDelimiter%] _IsDelimiter [%_IsDelimiter%] _cursor %_cursor% _cursor2 %_cursor2% _buffer %_buffer%
set /a _cursor2+=1
if %_cursor2% LSS %_delimiter.len% goto :GetLastElement_delimiter_loop
REM if "[%debug%]"=="[true]" if "[%_IsDelimiter%]"=="[true]" if not "[%_buffer%]"=="[]" echo is a delimiter and buffer not empty %_buffer% 
if "[%_IsDelimiter%]"=="[true]" if not "[%_buffer%]"=="[]" set "%~3=%_buffer%" & GoTo :EOF
if %_cursor% LSS %_input.len% goto :GetLastElement_input_loop
GoTo :EOF

::Usage Call :Deconcatenate Delimiter Input Output 'Returns the last element in string based on specified delimiter
:GetLastElementFast 
Set "_delimiter=%~1"
Set "_input=%~2"
call set _input="%%_input:%_delimiter%=" "%%"
for %%w in (%_input%) do (
	REM echo %%w
	call set "%3=%%~w"
)
GoTo :EOF

::Usage Call :GetNthElement Delimiter Input Output NthCount 'Returns Nth element from string using specified delimiter
:GetNthElement
set "_delimiter=%~1" & set /a _delimiter.len=0
set "_input=%~2" & set /a _input.len=0
call :len _delimiter _delimiter.len
call :len _input _input.len
set /a _cursor=0 & set /a _token=0 & set "_char=" & set "_buffer="
::set /a %3.lbound=%_cursor%
REM if "[%debug%]"=="[true]" echo input [%_input%] len %_input.len% delimiter [%_delimiter%] len %_delimiter.len%
:GetNthElement_input_loop
REM if "[%debug%]"=="[true]" pause
call set _char=%%_input:~%_cursor%,1%%
REM if "[%debug%]"=="[true]" echo char %_char%
set /a _cursor+=1
set /a _cursor2=0 & set "_IsDelimiter=false"  
:GetNthElement_delimiter_loop
call set _charDelimiter=%%_delimiter:~%_cursor2%,1%%
if "[%_char%]"=="[%_charDelimiter%]" set "_IsDelimiter=true"
if not "[%_IsDelimiter%]"=="[true]" set "_buffer=%_buffer%%_char%"
REM if "[%debug%]"=="[true]" echo _charDelimiter [%_charDelimiter%] _IsDelimiter [%_IsDelimiter%] _cursor %_cursor% _cursor2 %_cursor2% _buffer %_buffer%
set /a _cursor2+=1
if %_cursor2% LSS %_delimiter.len% goto :GetNthElement_delimiter_loop
REM if "[%debug%]"=="[true]" if "[%_IsDelimiter%]"=="[true]" echo if %_token% EQU %4 
if "[%_IsDelimiter%]"=="[true]" if %_token% EQU %4 set "%~3=%_buffer%" & GoTo :EOF 
if "[%_IsDelimiter%]"=="[true]" set "_buffer=" && set /a _token+=1 
REM if "[%debug%]"=="[true]" if "[%_IsDelimiter%]"=="[true]" pause
if %_cursor% LSS %_input.len% goto :GetNthElement_input_loop
::if %_cursor% EQU %_input.len% call set "%~3[%%_token%%]=%_buffer%" & set "_buffer=" & set /a %3.ubound=%_token%
if %_token% EQU %4 set "%~3=%_buffer%"
GoTo :EOF

::Usage Call :GetNthElementFast Delimiter Input Output NthCount 'Returns Nth element from string using specified delimiter
:GetNthElementFast 
Set "_delimiter=%~1"
Set "_input=%~2"
set "_buffer="
set /a index=0
call set _input="%%_input:%_delimiter%=" "%%"
setlocal enableDelayedExpansion
for %%w in (%_input%) do (
	REM echo %%w
	call set "_buffer=%%~w"
	if !index! EQU %4 GoTo :GetNthElementFast_ExitFor
	set /a "index+=1"
)
REM clearing buffer, index did not reach count
 set "_buffer="
:GetNthElementFast_ExitFor
endlocal & set "%3=%_buffer%"
GoTo :EOF

::EchoArguments HERE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

:: Usage :GetPreviousElement InputArray SelectedElement
:GetPreviousElement
REM Return element on cursor
REM move cursor forward, if reach ubound, loop back to lbound
GoTo :EOF
:: Usage :GetNextElement InputArray SelectedElement
:GetNextElement
REM Return element on cursor
REM move cursor forward, if reach ubound, loop back to lbound
GoTo :EOF
:: Usage :DeleteElement  optional ElementIndex
:DeleteElement
REM delete element on cursor
REM delete ElementIndex if specified
REM close gap in array
REM update ubound and count
REM (maybe control direction, but for now, hardcode pulling on ubound)
REM If element is out of bounds, do nothing but exit code with error
GoTo :EOF
:: Usage :GetNextElement DeleteElement optional ElementIndex
:AddElement
REM Add new element after ubound, update ubound and count
REM If element index, add to this index and push all values toward ubound+1
REM update ubound and count

:: Set EchoArrayPrefix EchoArraySuffix to insert text before or after
:: Example set EchoArrayPrefix=InputArray[%%index%%]=
:: EchoArray InputArray optional start optional end
:EchoArray
set /a index=0 
set /a limit=2147483647
if not ["%~2"]==[""] set /a index=%~2
if not ["%~3"]==[""] set /a limit=%~3
call set "lbound=%%%~1.lbound%%" 
call set "ubound=%%%~1.ubound%%"
call set "len=%%%~1.len%%"
call set "next=%%%~1.next%%"
call set "previous=%%%~1.previous%%"
if not ["%lbound%"]==[""] call echo %~1.lbound %%%~1.lbound%%
if not ["%ubound%"]==[""] call echo %~1.ubound %%%~1.ubound%%
if not ["%len%"]==[""] call echo %~1.len %%%~1.len%%
if not ["%next%"]==[""] call echo %~1.next %%%~1.next%%
if not ["%previous%"]==[""] call echo %~1.previous %%%~1.previous%%
:EchoArray-internal-loop
if not defined %1[%index%] GoTo :EOF
call echo %EchoArrayPrefix%%%%1[%index%]%%%EchoArraySuffix%
set /a index+=1
if %index% GTR %limit% goto :EOF
GoTo :EchoArray-internal-loop


REM TODO MAKE VERSION THAT OUTPUTS TO ARRAY OR FILE
REM This function takes elements numbers from ElementsArray
REM Then it retrieves those elements from the ReferenceArray (with suffix, if provided)
REM And outputs them to OutputArray
REM Elements are appended to OutputArray starting from OutputArray.ubound
REM Suffixes are defined with _DerefArrayReferenceSuffix, space separated for multiple elements
REM The suffixes will be used on the output array unless overriden by _DerefArrayOutputSuffix
REM The suffix NOSUFFIX has the special meaning of an empty suffix
::Usage Call :DereferenceArrayToArray ElementsArray ReferenceArray OutputArray
:DereferenceArrayToArray
if "[%~1]"=="[]" GoTo :EOF
if "[%~2]"=="[]" GoTo :EOF
if "[%~3]"=="[]" GoTo :EOF
set "_DerefArrayElementsArray=%~1" & set "_DerefArrayReferenceArray=%~2" & set "_DerefArrayOutputArray=%~3"
REM call echo call set /a _DerefArrayElementsArray.ubound=%%%_DerefArrayElementsArray%.ubound%%
call set /a _DerefArrayElementsArray.ubound=%%%_DerefArrayElementsArray%.ubound%%
if not "[%_DerefArrayReferenceSuffix%]"=="[]" Call :Deconcatenate " " "%_DerefArrayReferenceSuffix%" _DerefArrayReferenceSuffix
if not "[%_DerefArrayOutputSuffix%]"=="[]" Call :Deconcatenate " " "%_DerefArrayOutputSuffix%" _DerefArrayOutputSuffix
if "[%_DerefArrayReferenceSuffix.ubound%]"=="[]" set /a _DerefArrayReferenceSuffix.ubound=0
REM Set _DerefArrayOutput's index to OutputArray's .ubound+1, if any, or else set to zero
set _DerefArrayOutput.index=%_DerefArrayOutputArray.ubound%
if not "[%_DerefArrayOutput.index%]"=="[]" set /a _DerefArrayOutput.index+=1
if "[%_DerefArrayOutput.index%]"=="[]" set /a _DerefArrayOutput.index=0
set /a _DerefArrayElements.index=0
:DereferenceArrayToArray-output-loop
set /a _DerefArraySuffix.index=0
:DereferenceArrayToArray-suffix-loop
REM if %_DerefArrayElements.index% LEQ 0 call  echo %_DerefArrayReferenceSuffix[0]% %_DerefArrayReferenceSuffix% %_DerefArraySuffix.index% 
call set "_DerefArrayReferenceSuffix=%%_DerefArrayReferenceSuffix[%_DerefArraySuffix.index%]%%"
call set "_DerefArrayOutputSuffix=%%_DerefArrayOutputSuffix[%_DerefArraySuffix.index%]%%"
if "[%_DerefArrayReferenceSuffix%]"=="[NOSUFFIX]" set _DerefArrayReferenceSuffix=
if "[%_DerefArrayOutputSuffix%]"=="[]" set "_DerefArrayOutputSuffix=%_DerefArrayReferenceSuffix%"
if "[%_DerefArrayOutputSuffix%]"=="[NOSUFFIX]" set _DerefArrayOutputSuffix=
REM if %_DerefArrayElements.index%==0 echo ref-suffix "%_DerefArrayReferenceSuffix%" out-suffix "%_DerefArrayOutputSuffix%"
REM call call echo %%%%%_DerefArrayReferenceArray%[%%%_DerefArrayElementsArray%[%_DerefArrayElements.index%]%%]%_DerefArrayReferenceSuffix%%%%% %_DerefArrayReferenceSuffix%
call call set %_DerefArrayOutputArray%[%_DerefArrayOutput.index%]%_DerefArrayOutputSuffix%=%%%%%_DerefArrayReferenceArray%[%%%_DerefArrayElementsArray%[%_DerefArrayElements.index%]%%]%_DerefArrayReferenceSuffix%%%%%
set %_DerefArrayOutputArray%.ubound=%_DerefArrayOutput.index%
set /a _DerefArraySuffix.index+=1
REM echo _DerefArrayReferenceSuffix.ubound is %_DerefArrayReferenceSuffix.ubound%
REM echo if %_DerefArraySuffix.index% LEQ %_DerefArrayReferenceSuffix.ubound% echo doing another suffix !
REM if %_DerefArraySuffix.index% LEQ %_DerefArrayReferenceSuffix.ubound% echo doing another suffix !
if %_DerefArraySuffix.index% LEQ %_DerefArrayReferenceSuffix.ubound% GoTo :DereferenceArrayToArray-suffix-loop
set /a _DerefArrayOutput.index+=1
set /a _DerefArrayElements.index+=1
if %_DerefArrayElements.index% LEQ %_DerefArrayElementsArray.ubound% GoTo :DereferenceArrayToArray-output-loop
REM Call :ClearVariablesByPrefix _DerefArray
REM set _DerefArray
GoTo :EOF


::Usage Call :CreateTestArray ArrayName Count Suffixes
:: Will create array ArrayName from element 0 to Count, with all listed suffixes
:: Each array value will contain the element number followed by the suffix name
:CreateTestArray
set "_CreateTestArray_ArrayName=%~1"
set /a _CreateTestArray_ArrayCount=%~2
if "[%~3]"=="[]" (
set /a _CreateTestArray_suffix.index=0
set /a _CreateTestArray_suffix.ubound=0
set "_CreateTestArray_suffix[0]=NOSUFFIX"
GoTo :CreateTestArray-arguments-to-suffix-loop-skip
)
set /a _CreateTestArray_suffix.index=0
:CreateTestArray-arguments-to-suffix-loop
set "_CreateTestArray_suffix[%_CreateTestArray_suffix.index%]=%~3"
set _CreateTestArray_suffix.ubound=%_CreateTestArray_suffix.index%
set /a _CreateTestArray_suffix.index+=1
shift
if not "[%~3]"=="[]" GoTo :CreateTestArray-arguments-to-suffix-loop
:CreateTestArray-arguments-to-suffix-loop-skip
set /a _CreateTestArray_ArrayIndex=0
:CreateTestArray-loop-start
set /a _CreateTestArray_suffix.index=0
:CreateTestArray-suffix-loop
set "_CreateTestArray_suffix.current="
call set "_CreateTestArray_suffix.current=%%_CreateTestArray_suffix[%_CreateTestArray_suffix.index%]%%"
if "[%_CreateTestArray_suffix.current%]"=="[NOSUFFIX]" set "_CreateTestArray_suffix.current="
set "_CreateTestArray_suffix.current.content="
if not "[%_CreateTestArray_suffix.current%]"=="[]" set "_CreateTestArray_suffix.current.content=-%_CreateTestArray_suffix.current%"
set %_CreateTestArray_ArrayName%[%_CreateTestArray_ArrayIndex%]%_CreateTestArray_suffix.current%=%_CreateTestArray_ArrayIndex%%_CreateTestArray_suffix.current.content%
set /a _CreateTestArray_suffix.index+=1
if %_CreateTestArray_suffix.index% LEQ %_CreateTestArray_suffix.ubound% Goto :CreateTestArray-suffix-loop
set /a _CreateTestArray_ArrayIndex+=1
if %_CreateTestArray_ArrayIndex% LEQ %_CreateTestArray_ArrayCount% Goto :CreateTestArray-loop-start
set /a %_CreateTestArray_ArrayName%.count=%_CreateTestArray_ArrayIndex%
set /a _CreateTestArray_ArrayIndex-=1
set /a %_CreateTestArray_ArrayName%.lbound=0
set /a %_CreateTestArray_ArrayName%.ubound=%_CreateTestArray_ArrayIndex%
Call :ClearVariablesByPrefix _CreateTestArray
GoTo :EOF


REM DereferenceArrayToArray and CopyMultipleArrayElements are almost identical, should be rewritten as a unique function that does it all

REM TODO MAKE VERSION THAT OUTPUTS TO ARRAY OR FILE
REM This function takes elements numbers from ElementsArray
REM Then it retrieves those elements from the ReferenceArray (with suffix, if provided)
REM And outputs them to OutputArray
REM Elements are appended to OutputArray starting from OutputArray.ubound
REM Suffixes are defined with _DerefArrayReferenceSuffix, space separated for multiple elements
REM The suffixes will be used on the output array unless overriden by _DerefArrayOutputSuffix
REM The suffix NOSUFFIX has the special meaning of an empty suffix
::Usage Call :DereferenceArrayToArray ElementsArray ReferenceArray OutputArray
:DereferenceArrayToArray
if "[%~1]"=="[]" GoTo :EOF
if "[%~2]"=="[]" GoTo :EOF
if "[%~3]"=="[]" GoTo :EOF
set "_DerefArrayElementsArray=%~1" & set "_DerefArrayReferenceArray=%~2" & set "_DerefArrayOutputArray=%~3"
REM call echo call set /a _DerefArrayElementsArray.ubound=%%%_DerefArrayElementsArray%.ubound%%
call set /a _DerefArrayElementsArray.ubound=%%%_DerefArrayElementsArray%.ubound%%
if not "[%_DerefArrayReferenceSuffix%]"=="[]" Call :Deconcatenate " " "%_DerefArrayReferenceSuffix%" _DerefArrayReferenceSuffix
if not "[%_DerefArrayOutputSuffix%]"=="[]" Call :Deconcatenate " " "%_DerefArrayOutputSuffix%" _DerefArrayOutputSuffix
if "[%_DerefArrayReferenceSuffix.ubound%]"=="[]" set /a _DerefArrayReferenceSuffix.ubound=0
REM Set _DerefArrayOutput's index to OutputArray's .ubound+1, if any, or else set to zero
set _DerefArrayOutput.index=%_DerefArrayOutputArray.ubound%
if not "[%_DerefArrayOutput.index%]"=="[]" set /a _DerefArrayOutput.index+=1
if "[%_DerefArrayOutput.index%]"=="[]" set /a _DerefArrayOutput.index=0
set /a _DerefArrayElements.index=0
:DereferenceArrayToArray-output-loop
set /a _DerefArraySuffix.index=0
:DereferenceArrayToArray-suffix-loop
REM if %_DerefArrayElements.index% LEQ 0 call  echo %_DerefArrayReferenceSuffix[0]% %_DerefArrayReferenceSuffix% %_DerefArraySuffix.index% 
call set "_DerefArrayReferenceSuffix=%%_DerefArrayReferenceSuffix[%_DerefArraySuffix.index%]%%"
call set "_DerefArrayOutputSuffix=%%_DerefArrayOutputSuffix[%_DerefArraySuffix.index%]%%"
if "[%_DerefArrayReferenceSuffix%]"=="[NOSUFFIX]" set _DerefArrayReferenceSuffix=
if "[%_DerefArrayOutputSuffix%]"=="[]" set "_DerefArrayOutputSuffix=%_DerefArrayReferenceSuffix%"
if "[%_DerefArrayOutputSuffix%]"=="[NOSUFFIX]" set _DerefArrayOutputSuffix=
REM if %_DerefArrayElements.index%==0 echo ref-suffix "%_DerefArrayReferenceSuffix%" out-suffix "%_DerefArrayOutputSuffix%"
REM call call echo %%%%%_DerefArrayReferenceArray%[%%%_DerefArrayElementsArray%[%_DerefArrayElements.index%]%%]%_DerefArrayReferenceSuffix%%%%% %_DerefArrayReferenceSuffix%
call call set %_DerefArrayOutputArray%[%_DerefArrayOutput.index%]%_DerefArrayOutputSuffix%=%%%%%_DerefArrayReferenceArray%[%%%_DerefArrayElementsArray%[%_DerefArrayElements.index%]%%]%_DerefArrayReferenceSuffix%%%%%
set %_DerefArrayOutputArray%.ubound=%_DerefArrayOutput.index%
set /a _DerefArraySuffix.index+=1
REM echo _DerefArrayReferenceSuffix.ubound is %_DerefArrayReferenceSuffix.ubound%
REM echo if %_DerefArraySuffix.index% LEQ %_DerefArrayReferenceSuffix.ubound% echo doing another suffix !
REM if %_DerefArraySuffix.index% LEQ %_DerefArrayReferenceSuffix.ubound% echo doing another suffix !
if %_DerefArraySuffix.index% LEQ %_DerefArrayReferenceSuffix.ubound% GoTo :DereferenceArrayToArray-suffix-loop
set /a _DerefArrayOutput.index+=1
set /a _DerefArrayElements.index+=1
if %_DerefArrayElements.index% LEQ %_DerefArrayElementsArray.ubound% GoTo :DereferenceArrayToArray-output-loop
REM Call :ClearVariablesByPrefix _DerefArray
REM set _DerefArray
GoTo :EOF

:: NOSUFFIX in ApplicableSuffixes refers to copying the array element without a suffix
:: if ApplicableSuffixes is empty, then all variable inside array element will be copied
::Usage Call :CopyMultipleArrayElements InputArray InputElementList OutputArray ApplicableSuffixes
:CopyMultipleArrayElements 
set "_CopyMultipleArrayElements_InputArray=%~1"
set "_CopyMultipleArrayElements_InputElementList=%~2"
call set /a _CopyMultipleArrayElements_InputElementList.ubound=%_CopyMultipleArrayElements_InputElementList%.ubound
set "_CopyMultipleArrayElements_OutputArray=%~3"
call set _CopyMultipleArrayElements_OutputArray.lbound=%%%_CopyMultipleArrayElements_OutputArray%.lbound%%
call set _CopyMultipleArrayElements_OutputArray.ubound=%%%_CopyMultipleArrayElements_OutputArray%.ubound%%
if "[%_CopyMultipleArrayElements_OutputArray.ubound%]"=="[]" set _CopyMultipleArrayElements_OutputArray.ubound=-1
set "_CopyMultipleArrayElements_ApplicableSuffixes=%~4"
if "[%_CopyMultipleArrayElements_ApplicableSuffixes%]"=="[]" set /a _CopyMultipleArrayElements_ApplicableSuffixes.ubound=0
if not "[%_CopyMultipleArrayElements_ApplicableSuffixes%]"=="[]" echo calling :Deconcatenate " " "%_CopyMultipleArrayElements_ApplicableSuffixes%" _CopyMultipleArrayElements_ApplicableSuffixes
if not "[%_CopyMultipleArrayElements_ApplicableSuffixes%]"=="[]" Call :Deconcatenate " " "%_CopyMultipleArrayElements_ApplicableSuffixes%" _CopyMultipleArrayElements_ApplicableSuffixes
set /a _CopyMultipleArrayElements_InputElementList.index=0
:CopyMultipleArrayElements-loop-InputElementList
set /a _CopyMultipleArrayElements_ApplicableSuffixes.index=0
set /a _CopyMultipleArrayElements_OutputArray.ubound+=1
:CopyMultipleArrayElements-loop-ApplicableSuffixes
call set _CopyMultipleArrayElements_ApplicableSuffixes.current=%%_CopyMultipleArrayElements_ApplicableSuffixes[%_CopyMultipleArrayElements_ApplicableSuffixes.index%]%%
if "[%_CopyMultipleArrayElements_ApplicableSuffixes.current%]"=="[NOSUFFIX]" set "_CopyMultipleArrayElements_ApplicableSuffixes.current="
if "[%_CopyMultipleArrayElements_ApplicableSuffixes%]"=="[]" (
	Call :CopyElementAndSuffix %_CopyMultipleArrayElements_InputArray%[%_CopyMultipleArrayElements_InputElementList.index%] %_CopyMultipleArrayElements_OutputArray%[%_CopyMultipleArrayElements_OutputArray.ubound%]
) else (
	call call set %_CopyMultipleArrayElements_OutputArray%[%_CopyMultipleArrayElements_OutputArray.ubound%]%_CopyMultipleArrayElements_ApplicableSuffixes.current%=%%%%%_CopyMultipleArrayElements_InputArray%[%_CopyMultipleArrayElements_InputElementList.index%]%_CopyMultipleArrayElements_ApplicableSuffixes.current%%%%%
)
set /a _CopyMultipleArrayElements_ApplicableSuffixes.index+=1
if %_CopyMultipleArrayElements_ApplicableSuffixes.index% LEQ %_CopyMultipleArrayElements_ApplicableSuffixes.ubound% GoTo :CopyMultipleArrayElements-loop-ApplicableSuffixes
set /a _CopyMultipleArrayElements_InputElementList.index+=1
if %_CopyMultipleArrayElements_InputElementList.index% LEQ %_CopyMultipleArrayElements_InputElementList.ubound% GoTo :CopyMultipleArrayElements-loop-InputElementList
if "[%_CopyMultipleArrayElements_OutputArray.lbound%]"=="[]" set /a %_CopyMultipleArrayElements_OutputArray%.lbound=0
set /a %_CopyMultipleArrayElements_OutputArray%.ubound=%_CopyMultipleArrayElements_OutputArray.ubound%
set /a %_CopyMultipleArrayElements_OutputArray%.count=%_CopyMultipleArrayElements_OutputArray.ubound%-1
Call :ClearVariablesByPrefix _CopyMultipleArrayElements
GoTo :EOF

::Usage Call :AddArrayElement InputElement OutputArray OutputIndex
:AddArrayElement
Call :ClearVariablesByPrefix _AddArrayElement
set "_AddArrayElement_InputElement=%~1"
set "_AddArrayElement_OutputArray=%~2"
set "_AddArrayElement_OutputIndex=%~3"
call set /a "_AddArrayElement_OutputUbound=%%%_AddArrayElement_OutputArray%.ubound%%"
REM Start loop at OutputArray ubound and then work my way back until OutputIndex
call set /a _AddArrayElement_OutputArray.index=%%%_AddArrayElement_OutputArray%.ubound%%
set /a _AddArrayElement_OutputArray.nextindex=%_AddArrayElement_OutputArray.index% + 1
set /a %_AddArrayElement_OutputArray%.ubound+=1
set /a %_AddArrayElement_OutputArray%.count+=1
if "[%_AddArrayElement_OutputIndex%]"=="[]" set /a _AddArrayElement_OutputIndex=%_AddArrayElement_OutputUbound% + 1
if %_AddArrayElement_OutputIndex% GEQ %_AddArrayElement_OutputUbound% GoTo :AddArrayElement-OutputArray-loop-skip
:AddArrayElement-OutputArray-loop
REM Move value to the next index, for every position in the array until OutputIndex
REM echo moving %_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.index%]=%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.nextindex%]
for /F "tokens=1* delims==" %%a in ('set %_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.index%] 2^>NUL') do (
	call set "_token=%%a"
	REM call :FORIF "[%%_token%%]"=="[%%_token:.PackageFullName=%%]" || call echo "%%_token:%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.index%]=%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.nextindex%]%%=%%b"
	call set "%%_token:%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.index%]=%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.nextindex%]%%=%%b"
)
set /a _AddArrayElement_OutputArray.index-=1
set /a _AddArrayElement_OutputArray.nextindex=%_AddArrayElement_OutputArray.index% + 1
if %_AddArrayElement_OutputArray.index% GEQ %_AddArrayElement_OutputIndex% GoTo :AddArrayElement-OutputArray-loop
:AddArrayElement-OutputArray-loop-skip
REM Clear the destination index of the OutputArray
REM call echo Clearing %_AddArrayElement_OutputArray%[%_AddArrayElement_OutputIndex%] %%%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputIndex%].PackageFullName%%
for /F "tokens=1* delims==" %%a in ('set %_AddArrayElement_OutputArray%[%_AddArrayElement_OutputIndex%] 2^>NUL') do (
	set "%%a="
)
REM Copy InputElement into the destination index of the OutputArray
for /F "tokens=1* delims==" %%a in ('set %_AddArrayElement_InputElement% 2^>NUL') do (
	call set "_token=%%a"
	REM call :FORIF "[%%_token%%]"=="[%%_tokensubst%%]" && echo it was same || echo it was not same
	REM call :FORIF "[%%_token%%]"=="[%%_token:.PackageFullName=%%]" || call echo %%_token%%=%%b
	REM call :FORIF "[%%_token%%]"=="[%%_token:.PackageFullName=%%]" || call echo "%%_token:%_AddArrayElement_InputElement%=%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputIndex%]%%=%%b"
	call set "%%_token:%_AddArrayElement_InputElement%=%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputIndex%]%%=%%b"
)
GoTo :EOF


::Usage Call :CopyElementAndSuffix InputElement OutputElement DontClearOutput
:CopyElementAndSuffix
set "_CopyElementAndSuffix_Input=%~1"
set "_CopyElementAndSuffix_Output=%~2"
set "_CopyElementAndSuffix_Directive=%~3"
if not "[%_CopyElementAndSuffix_Directive%]"=="[DontClearOutput]" (
for /F "tokens=1* delims==" %%a in ('set %_CopyElementAndSuffix_Output% 2^>NUL') do ( set "%%a=" )
)
for /F "tokens=1* delims==" %%a in ('set %_CopyElementAndSuffix_Input% 2^>NUL') do (
	call set "_token=%%a"
	call set "%%_token:%_CopyElementAndSuffix_Input%=%_CopyElementAndSuffix_Output%%%=%%b"
)
GoTo :EOF

::Usage Call :RemoveArrayElement ArrayToRemoveElementFrom ElementNumber
::This function will remove the Nth element from an array, including all suffixes, 
::and then pull back all values to fill in the empty index
:RemoveArrayElement
Call :ClearVariablesByPrefix _RemoveArrayElement
set "_RemoveArrayElement_array=%~1"
set "_RemoveArrayElement_index=%~2"
REM call echo Call :IsNumeric %_RemoveArrayElement_index% _RemoveArrayElement_ElementIsNumeric
Call :IsNumeric %_RemoveArrayElement_index% _RemoveArrayElement_ElementIsNumeric
REM echo _RemoveArrayElement_ElementIsNumeric %_RemoveArrayElement_ElementIsNumeric%
set "_RemoveArrayElement_ElementDeleted=false"
REM This for loop deleted the specified array element
for /F "tokens=1* delims==" %%a in ('set %_RemoveArrayElement_array%[%_RemoveArrayElement_index%] 2^>NUL') do (
    set "_RemoveArrayElement_ElementDeleted=true"
	set "%%a="
)
if not "[%_RemoveArrayElement_ElementIsNumeric%]"=="[true]" GoTo :RemoveArrayElement-end
set /a "_RemoveArrayElement_next_index=%_RemoveArrayElement_index%"
REM If the specified element was numeric, move over the next value to empty index
:RemoveArrayElement-internal-loop
set /a _RemoveArrayElement_next_index+=1
set "_token=" & set "_RemoveArrayElement_ElementCopied=false"
for /F "tokens=1* delims==" %%a in ('set %_RemoveArrayElement_array%[%_RemoveArrayElement_next_index%] 2^>NUL') do (
	set "_RemoveArrayElement_ElementCopied=true"
	call set "_token=%%a"
	call set "%%_token:%_RemoveArrayElement_array%[%_RemoveArrayElement_next_index%]=%_RemoveArrayElement_array%[%_RemoveArrayElement_index%]%%=%%b"
)
REM Repeat for every array element until we find an empty index
if "[%_RemoveArrayElement_ElementCopied%]"=="[true]" set /a "_RemoveArrayElement_index=%_RemoveArrayElement_next_index%" & GoTo :RemoveArrayElement-internal-loop
REM Erase last index which is a duplicate of the second to last one
for /F "tokens=1* delims==" %%a in ('set %_RemoveArrayElement_array%[%_RemoveArrayElement_index%] 2^>NUL') do (
	set "%%a="
)
set /a _RemoveArrayElement_index-=1
set /a "%_RemoveArrayElement_array%.ubound-=1" 2>NUL
set /a "%_RemoveArrayElement_array%.count-=1" 2>NUL
:RemoveArrayElement-end
Call :ClearVariablesByPrefix _RemoveArrayElement
GoTo :EOF

REM _RemoveValuesFromArray_ArrayToRemoveFrom.suffix
::Usage Call :RemoveValuesFromArray ArrayToRemoveFrom DeleteList1 DeleteList2
:: DeleteLists consist of an array with a series of values to delete from ArrayToModify
:RemoveValuesFromArray
REM Call :ClearVariablesByPrefix _RemoveValuesFromArray REM this would wipe out _RemoveValuesFromArray_ArrayToRemoveFrom.suffix
set "_RemoveValuesFromArray_ArrayToRemoveFrom=%~1"
call set /a "_RemoveValuesFromArray_ArrayToRemoveFrom.ubound=%%%_RemoveValuesFromArray_ArrayToRemoveFrom%.ubound%%"
:RemoveValuesFromArray-Next-DeleteList-loop
set "_RemoveValuesFromArray_DeleteList=%~2"
Call :IsNumeric %%%_RemoveValuesFromArray_DeleteList%.ubound%% _RemoveValuesFromArray_DeleteList.IsArray
if not "[%_RemoveValuesFromArray_DeleteList.IsArray%]"=="[true]" (
	set "_RemoveValuesFromArray_DeleteList.value=%~2"
	set /a _RemoveValuesFromArray_DeleteList.ubound=0
	set /a _RemoveValuesFromArray_ArrayToRemoveFrom.index=0
	GoTo :RemoveValuesFromArray-ArrayToRemoveFrom-loop
)
call set /a _RemoveValuesFromArray_DeleteList.ubound=%%%_RemoveValuesFromArray_DeleteList%.ubound%%
set /a _RemoveValuesFromArray_DeleteList.index=0
:RemoveValuesFromArray-DeleteList-loop
call set "_RemoveValuesFromArray_DeleteList.value=%%%_RemoveValuesFromArray_DeleteList%[%_RemoveValuesFromArray_DeleteList.index%]%%"
set /a "_RemoveValuesFromArray_ArrayToRemoveFrom.index=0"
:RemoveValuesFromArray-ArrayToRemoveFrom-loop
call set "_RemoveValuesFromArray_ArrayToRemoveFrom.value=%%%_RemoveValuesFromArray_ArrayToRemoveFrom%[%_RemoveValuesFromArray_ArrayToRemoveFrom.index%]%_RemoveValuesFromArray_ArrayToRemoveFrom.suffix%%%"
if "[%_RemoveValuesFromArray_ArrayToRemoveFrom.value%]"=="[%_RemoveValuesFromArray_DeleteList.value%]" (
	Call :RemoveArrayElement %_RemoveValuesFromArray_ArrayToRemoveFrom% %_RemoveValuesFromArray_ArrayToRemoveFrom.index%
	call set /a "_RemoveValuesFromArray_ArrayToRemoveFrom.ubound=%%%_RemoveValuesFromArray_ArrayToRemoveFrom%.ubound%%"
)
set /a "_RemoveValuesFromArray_ArrayToRemoveFrom.index+=1"
if %_RemoveValuesFromArray_ArrayToRemoveFrom.index% LEQ %_RemoveValuesFromArray_ArrayToRemoveFrom.ubound% GoTo :RemoveValuesFromArray-ArrayToRemoveFrom-loop
set /a _RemoveValuesFromArray_DeleteList.index+=1
if %_RemoveValuesFromArray_DeleteList.index% LEQ %_RemoveValuesFromArray_DeleteList.ubound% GoTo :RemoveValuesFromArray-DeleteList-loop
shift
set "_RemoveValuesFromArray_DeleteList.IsArray="
if not "[%~2]"=="[]" GoTo :RemoveValuesFromArray-Next-DeleteList-loop
Call :ClearVariablesByPrefix _RemoveValuesFromArray
GoTo :EOF


:: Set _CopyValuesFromArray_PartialMatch=true if you want to allow partial matches
:: Set _CopyValuesFromArray_SearchSuffix 'the suffix that will be searched into
:: Maybe support for _CopyValuesFromArray_OutputSuffix=NOSUFFIX ?
::Usage Call :CopyValuesFromArray InputArray OutputArray SearchList1 SearchList2 SearchListN
:CopyValuesFromArray
REM @echo on
set "_CopyValuesFromArray_InputArray=%~1"
call set "_CopyValuesFromArray_InputArray.lbound=%%%~1.lbound%%"
call set "_CopyValuesFromArray_InputArray.ubound=%%%~1.ubound%%"
set "_CopyValuesFromArray_OutputArray=%~2"
call set "_CopyValuesFromArray_OutputArray.lbound=%%%~2.lbound%%"
call set "_CopyValuesFromArray_OutputArray.ubound=%%%~2.ubound%%"
if "[%_CopyValuesFromArray_OutputArray.lbound%]"=="[]" set /a "%_CopyValuesFromArray_OutputArray%.lbound=0"
if "[%_CopyValuesFromArray_OutputArray.ubound%]"=="[]" set /a "%_CopyValuesFromArray_OutputArray%.ubound=-1"
if "[%_CopyValuesFromArray_SearchSuffix%]"=="[]" set "_CopyValuesFromArray_SearchSuffix=NOSUFFIX"
if not "[%_CopyValuesFromArray_SearchSuffix%]"=="[]" Call :Deconcatenate " " "%_CopyValuesFromArray_SearchSuffix%" _CopyValuesFromArray_SearchSuffix
set /a _CopyValuesFromArray_SearchList.lbound=0
set /a _CopyValuesFromArray_SearchList.ubound=-1
:CopyValuesFromArray-InputArray-SearchList-loop
set "_CopyValuesFromArray_NewSearchList=%~3"
call set _CopyValuesFromArray_NewSearchList.lbound=%%%_CopyValuesFromArray_NewSearchList%.lbound%%
call set _CopyValuesFromArray_NewSearchList.ubound=%%%_CopyValuesFromArray_NewSearchList%.ubound%%
call :IsNumeric %_CopyValuesFromArray_NewSearchList.lbound% && set "_CopyValuesFromArray_NewSearchList.lbound="
call :IsNumeric %_CopyValuesFromArray_NewSearchList.ubound% && set "_CopyValuesFromArray_NewSearchList.ubound="
if "[%_CopyValuesFromArray_NewSearchList.ubound%]"=="[]" set /a _CopyValuesFromArray_SearchList.ubound+=1
if "[%_CopyValuesFromArray_NewSearchList.ubound%]"=="[]" (
	set "_CopyValuesFromArray_SearchList[%_CopyValuesFromArray_SearchList.ubound%]=%_CopyValuesFromArray_NewSearchList%"
	GoTo :CopyValuesFromArray-InputArray-SearchList-subloop-skip
)
set _CopyValuesFromArray_NewSearchList.index=%_CopyValuesFromArray_NewSearchList.lbound%
:CopyValuesFromArray-InputArray-SearchList-subloop
set /a _CopyValuesFromArray_SearchList.ubound+=1
call set "_CopyValuesFromArray_SearchList[%_CopyValuesFromArray_SearchList.ubound%]=%%%_CopyValuesFromArray_NewSearchList%[%_CopyValuesFromArray_NewSearchList.index%]%%
set /a _CopyValuesFromArray_NewSearchList.index+=1
if %_CopyValuesFromArray_NewSearchList.index% LEQ %_CopyValuesFromArray_NewSearchList.ubound% GoTo :CopyValuesFromArray-InputArray-SearchList-subloop
:CopyValuesFromArray-InputArray-SearchList-subloop-skip
shift
if not "[%~3]"=="[]" GoTo :CopyValuesFromArray-InputArray-SearchList-loop
REM Main loop starts here
REM set _CopyValuesFromArray
set /a _CopyValuesFromArray_InputArray.index=%_CopyValuesFromArray_InputArray.lbound%
:CopyValuesFromArray-InputArray-loop
set /a _CopyValuesFromArray_SearchList.index=%_CopyValuesFromArray_SearchList.lbound%
:CopyValuesFromArray-InputArray-searchterms-loop
REM call echo searchlist call set "_CopyValuesFromArray_SearchList.current=%%_CopyValuesFromArray_SearchList[%_CopyValuesFromArray_SearchList.index%]%%" _CopyValuesFromArray_SearchList[%_CopyValuesFromArray_SearchList.index%]
call set "_CopyValuesFromArray_SearchList.current=%%_CopyValuesFromArray_SearchList[%_CopyValuesFromArray_SearchList.index%]%%"
set /a _CopyValuesFromArray_SearchSuffix.index=%_CopyValuesFromArray_SearchSuffix.lbound%
:CopyValuesFromArray-InputArray-suffix-loop
REM call echo suffixlist call set "_CopyValuesFromArray_SearchSuffix.current=%%_CopyValuesFromArray_SearchSuffix[%_CopyValuesFromArray_SearchSuffix.index%]%%" _CopyValuesFromArray_SearchSuffix[%_CopyValuesFromArray_SearchSuffix.index%]
call set "_CopyValuesFromArray_SearchSuffix.current=%%_CopyValuesFromArray_SearchSuffix[%_CopyValuesFromArray_SearchSuffix.index%]%%"
if "[%_CopyValuesFromArray_SearchSuffix.current%]"=="[NOSUFFIX]" set "_CopyValuesFromArray_SearchSuffix.current=
call set "_CopyValuesFromArray_InputArray.current=%%%_CopyValuesFromArray_InputArray%[%_CopyValuesFromArray_InputArray.index%]%_CopyValuesFromArray_SearchSuffix.current%%%"
REM echo InputArray %_CopyValuesFromArray_InputArray.index% SearchList %_CopyValuesFromArray_SearchList.index% SearchSuffix %_CopyValuesFromArray_SearchSuffix.index% compare "[%_CopyValuesFromArray_InputArray.current%]"=="[%_CopyValuesFromArray_SearchList.current%]"
if "[%_CopyValuesFromArray_InputArray.current%]"=="[%_CopyValuesFromArray_SearchList.current%]" GoTo :CopyValuesFromArray-InputArray-suffix-loop-matchfound
if not "[%_CopyValuesFromArray_PartialMatch%]"=="[true]" GoTo :CopyValuesFromArray-InputArray-suffix-loop-nomatch
set "_CopyValuesFromArray_PartialMatch.current="
if "[%_CopyValuesFromArray_PartialMatch%]"=="[true]" call set "_CopyValuesFromArray_PartialMatch.current=%%_CopyValuesFromArray_InputArray.current:%_CopyValuesFromArray_SearchList.current%=%%" 
if "[%_CopyValuesFromArray_PartialMatch%]"=="[true]" if not "[%_CopyValuesFromArray_InputArray.current%]"=="[%_CopyValuesFromArray_PartialMatch.current%]" GoTo :CopyValuesFromArray-InputArray-suffix-loop-matchfound
GoTo :CopyValuesFromArray-InputArray-suffix-loop-nomatch
:CopyValuesFromArray-InputArray-suffix-loop-matchfound
REM echo match found
REM echo set /a %_CopyValuesFromArray_OutputArray%.ubound+=1
set /a %_CopyValuesFromArray_OutputArray%.ubound+=1
REM echo *_CopyValuesFromArray_OutputArray*.ubound %_CopyValuesFromArray_OutputArray%.ubound
REM call echo ***_CopyValuesFromArray_OutputArray**.ubound** %%%_CopyValuesFromArray_OutputArray%.ubound%%
REM call echo Call :CopyElementAndSuffix %_CopyValuesFromArray_InputArray%[%_CopyValuesFromArray_InputArray.index%] %_CopyValuesFromArray_OutputArray%[%%%_CopyValuesFromArray_OutputArray%.ubound%%]
Call :CopyElementAndSuffix %_CopyValuesFromArray_InputArray%[%_CopyValuesFromArray_InputArray.index%] %_CopyValuesFromArray_OutputArray%[%%%_CopyValuesFromArray_OutputArray%.ubound%%]
set /a _CopyValuesFromArray_InputArray.index+=1
if %_CopyValuesFromArray_InputArray.index% LEQ %_CopyValuesFromArray_InputArray.ubound% ( GoTo :CopyValuesFromArray-InputArray-loop ) else ( GoTo :CopyValuesFromArray-end)
:CopyValuesFromArray-InputArray-suffix-loop-nomatch

set /a _CopyValuesFromArray_SearchSuffix.index+=1
if %_CopyValuesFromArray_SearchSuffix.index% LEQ %_CopyValuesFromArray_SearchSuffix.ubound% GoTo :CopyValuesFromArray-InputArray-suffix-loop
set /a _CopyValuesFromArray_SearchList.index+=1
if %_CopyValuesFromArray_SearchList.index% LEQ %_CopyValuesFromArray_SearchList.ubound% GoTo :CopyValuesFromArray-InputArray-searchterms-loop
set /a _CopyValuesFromArray_InputArray.index+=1
if %_CopyValuesFromArray_InputArray.index% LEQ %_CopyValuesFromArray_InputArray.ubound% GoTo :CopyValuesFromArray-InputArray-loop
:CopyValuesFromArray-end
Call :ClearVariablesByPrefix _CopyValuesFromArray
GoTo :EOF

REM Todo, this should check if the element exists, if it doesn't find the real ubound with set
::Usage Call :Ubound InputArray UboundOutput ' make this better, search "set" for the real ubound
:Ubound
set %2=%~1.ubound
GoTo :EOF

::Usage Call :Lbound InputArray LboundOutput' make this better, search "set" for the real ubound
:lbound
set %2=%~1.lbound
GoTo :EOF

:: ClearArray InputArray optional start optional end
:ClearArray
set /a index=0 
set /a limit=2147483647
if not ["%~2"]==[""] set /a index=%~2
if not ["%~3"]==[""] set /a limit=%~3
if not ["%~1.lbound"]==[""] set %~1.lbound=
if not ["%~1.ubound"]==[""] set %~1.ubound=
if not ["%~1.count"]==[""] set %~1.count=
if not ["%~1.next"]==[""] set %~1.next=
if not ["%~1.previous"]==[""] set %~1.previous=
:ClearArray-internal-loop
if not defined %~1[%index%] GoTo :ClearArray-end
call set %%%~1[%index%]%=
set /a index+=1
if %index% GTR %limit% goto :ClearArray-end
GoTo :ClearArray-internal-loop
:ClearArray-end
set index=
set limit=
GoTo :EOF


REM not tested
:: EchoArray InputArray optional start optional end
:EchoArrayToFile
set /a index=0 
set /a limit=2147483647
if not ["%~2"]==[""] set /a index=%~2
if not ["%~3"]==[""] set /a limit=%~3
:EchoArrayToFile-internal-loop
if not defined %1[%index%] GoTo :EOF
call echo %%%1[%index%]%% >> %~2
set /a index+=1
if %index% GTR %limit% goto :EOF
GoTo :EchoArray-internal-loop

REM Incomplete/untested
::Usage Call :EchoCommand "your command here" 'optional skipcount "delimiters" "eol"
:EchoCommand
set forskip=
set delimiters=
set foreol=
if not "[%~2]"=="[]" set forskip="skip=%~2"
if not "[%~3]"=="[]" set fordelimiters="delims=%~3"
if not "[%~4]"=="[]" set foreol="eol=%~4"
FOR /F "usebackq tokens=* %forskip%%foreol%%fordelimiters%" %%a IN (`%~1`) DO echo %%a
Goto :EOF

::Usage Call :ReadString "Your string here" 
:ReadString
for /f %i in ("%~1") do echo %%i
GoTo :EOF

::Usage Call :TestFunction 'Will print information about all parameters
:TestFunction
echo tested function first parameter : %1 
GoTo :EOF

:FORIF
REM echo just before forif %*
if %* (exit /b 0) ELSE (exit /b 1)
GoTo :EOF

::Usage Call :PrintTime 'just prints the time
:PrintTime
echo %date% %time%
GoTo :EOF

::Usage Call :ClearScreen
:ClearScreen
cls
GoTo :EOF

::Usage SetTitle MyTitle
:SetTitle 
title %~1
GoTo :EOF

REM TODO
::Usage SetTitle MyTitle
:SetSubTitle 
title %~1
GoTo:EOF

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

::Usage Call :HexPrefixStripper InputHex OutputDecimal ' This just strips leading "0x" if present
:HexPrefixStripper
set "_HexPrefixStripper_buffer=%~1"
set "%~2=%~1"
if "[%_HexPrefixStripper_buffer:~0,2%]"=="[0x]" call set "%~2=%_HexPrefixStripper_buffer:~2%"
set "_HexPrefixStripper_buffer="
GoTo :EOF

:: -----------------------------  
:: ----- File Manipulation -----
:: -----------------------------

REM INCOMPLETE FUNCTION
REM function to check all argument for certain text (TODO)

REM INCOMPLETE FUNCTION
REM file operation DoesFileExist CreateFolder MoveFolder CopyFile CopyRecursive Copy*.EXT DeleteFile CreateFileFromArray

:OwnFile
takeown /skipsl /f %~1
GoTo :EOF

:OwnFolder
takeown /d y /skipsl /r /f %~1
GoTo :EOF

:GrantFile
set TargetUser=%username%
if not ["%~2"]==[""] set TargetUser=%~2
icacls %~1 /grant %TargetUser%:m /t
GoTo :EOF

:GrantFolder
set TargetUser=%username%
if not ["%~2"]==[""] set TargetUser=%~2
icacls %~1 /grant %TargetUser%:m /t
GoTo :EOF

:DeleteFolder
rd /s /q %~1
GoTo :EOF

:DeleteFile
del /f /q %~1
GoTo :EOF

:: Usage Call :CreateFile x:\path\to\file.ext optional variable[X]
:CreateFile 
md %~dp1 2>nul
echo. >%~1
GoTo :EOF

::Alias to CreateFile (also write text ?)
:WriteFile
md %~dp1 2>nul
echo. >%~1
GoTo :EOF

REM INCOMPLETE FUNCTION
::Usage Call :CreateFolder x:\path\to\folder
:CreateFolder
REM do the right thing about trailing "\" 
GoTo :EOF

REM INCOMPLETE FUNCTION
::Usage Call :GetFileAttribute x:\path\to\file Output
:GetFileAttribute
REM Returns all applicable attributes in Output
  REM R   Read-only file attribute.
  REM A   Archive file attribute.
  REM S   System file attribute.
  REM H   Hidden file attribute.
  REM O   Offline attribute.
  REM I   Not content indexed file attribute.
  REM X   No scrub file attribute.
  REM V   Integrity attribute.
  REM P   Pinned attribute.
  REM U   Unpinned attribute.
  REM B   SMR Blob attribute.
GoTo :EOF

REM INCOMPLETE FUNCTION
::Usage Call :GetFolderAttribute x:\path\to\file Output
:GetFolderAttribute
REM do folder have attributes ? See :GetFileAttribute
GoTo :EOF

:: Usage :IsFolderWritable IsFolderWritable
:IsFolderWritable
set tmpfile=%~1.deleteme
set %2=false
(> %tmpfile% echo) 2>NUL && (del %tmpfile% && set %2=true || set %2=true ) || set %2=false
GoTo :EOF
REM Call :IsFolderWritable %USERPROFILE%\ IsFolderWritable && echo yes || echo no
REM Call :IsFolderWritable C:\WINDOWS\SYSTEM32\ IsFolderWritable && echo yes || echo no



::Usage Call :GetFileAttribute x:\path\to\filelist.txt Output[X]
:GetFileAttributeBulk
:GetFolderAttributeBulk
REM takes list of file
REM Returns Output[X].file Output[X].attributes for each file
REM same with folders if they have attributes
GoTo :EOF

:: Usage Call :GetFileSize x:\path\to\file Output
:: Usage Call :GetFileSizeBulk x:\path\to\filelist.txt Output[X].filename Output[X].size
:GetFileSize
:GetFileSizeBulk
:GetFolderSize
:GetFolderSizeBulk
GoTo :EOF

::Usage Call :DoesFileExist Optional Ouput
:DoesFileExist
REM Set output true false if output variable provided 
REM but also set errorlevel and
REM include example like Call :DoesFileExist x:\path\to\file.ext || echo file is found && echo file not found
GoTo :EOF

:: Usage Call :DoesFileExistBulk x:\path\to\filelist.txt Output[x].filename Output[x].exists
:DoesFileExistBulk
REM fill in output array if file is found or not (maybe .filename in assumed in Output[x] ?)
REM set errorlevel properly if at least one file is found
GoTo :EOF

:: Usage Call :Movefile x:\path\to\file.ext x:\path\to\destinationfolder
:MoveFile
REM do the right thing about trailing backslash
:: Usage Call :MovefileBulk x:\path\to\filelist.txt x:\path\to\destinationfolder (Move all file to a folder)
:MoveFileBulk
:: Usage Call :MovefileBulkV2 Input[x] x:\path\to\destinationfolder (Move all file to a folder, but input is an array)
:MoveFileBulkv2
:: Usage Call :MovefileBulkV3 Input[x] Output[x] (Move all file to a folder, but each file has a unique destination ?)
:MoveFileBulkv3
:: Usage Call :MovefileBulkV4 x:\path\to\filelist.txt x:\path\to\filedestinationlist.txt (Move all file to a folder, but each file has a unique destination ?)
:MoveFileBulkv4
:: Usage Call :MovefileBulkV5 x:\path\to\filelist.txt PATH SUBSTITUTION  x:\path\to  y:\htap\to\ (Move all file to a new root folder, preserve original file structure)
:MoveFileBulkv5
GoTo :EOF

::Usage Call :RenameFile x:\path\to\file.ext x:\path\to\newfilename.ext
:RenameFile
REM As previous, Bulk version that take input and output of file lists or arrays ?
GoTo :EOF

:CopyFile
REM like move file, except copying
GoTo :EOF

::Usage Call :MoveFolder x:\path\to\folder y:\path\to\new\folder
:MoveFolder
REM Folder doesn't get renamed ? Does destination include current foldername ? If yes, then it could rename too
REM Bulk variants possible
GoTo :EOF

::Usage Call :RenameFolder x:\path\to\folder x:\path\to\renamedfolder
:RenameFolder
REM Bulk variant possible, rename should not move a folder (but maybe it can anyway ?)
GoTo :EOF

::Usage Call :CopyFolder x:\path\to\folder y:\path\to\new\folder
:CopyFolder
REM do the right thing about trailing backslash 
REM Like Movefolder, how to deal with destination 
REM destination exists, then copy folder to that ? y:\path\to\new\folder\folder ?
REM if does not exist, then it's y:\path\to\new\folder\ ? 
GoTo :EOF

REM INCOMPLETE FUNCTION
::Usage Call :DeleteFile x:\path\to\file.ext
:DeleteFile
REM should it ask for permission ?  if interactive==true
REM should it auto take ownership and grant permissions ?
REM Bulk variant possible
GoTo :EOF

REM DeleteFile subfunction
:DeleteFile
if not exist "%~1" echo File does not exist : %~1 & exit /b 1
if not "%quiet%"=="true" echo Deleting file %~1
del /F /Q "%~1"
if errorlevel 1 echo Error deleting file: %~1 & exit /b 1
exit /b 0


::Usage Call :DeleteFolder x:\path\to\folder
:DeleteFolder
if not exist "%~1" echo Folder does not exist : %~1 & exit /b 1
if not "%quiet%"=="true" echo Deleting folder %~1
rd /s /q %~1
if errorlevel 1 echo Error deleting folder: %~1 & exit /b 1
REM do the right thing about trailing backslash 
REM should it ask for permission ?  if interactive==true
REM should it auto take ownership and grant permissions ?
REM Bulk variant possible
GoTo :EOF

REM INCOMPLETE FUNCTION
::Usage Call :GetFileOwner x:\path\to\file.ext Output 'returns file owner .name .SID  ? 
:GetFileOwner
:GetFolderOwner
::Usage Call :GetFilePermissions x:\path\to\file.ext Output 'returns file permission, for who ?  All .SID=permission ?
:GetFilePermissions
:GetFolderPermissions

REM INCOMPLETE FUNCTION
:TakeFileOwnership
GoTo :EOF
REM INCOMPLETE FUNCTION
:TakeFolderOwnership
GoTo :EOF
REM INCOMPLETE FUNCTION
:TakeFolderOwnershipRecursive
GoTo :EOF
REM INCOMPLETE FUNCTION
:GrantFilePermissions
GoTo :EOF

:GrantFolderPermissionRecursive
GoTo :EOF
REM INCOMPLETE FUNCTION
:ReadFileToArray
REM INCOMPLETE FUNCTION
:FolderContentToArray
REM INCOMPLETE FUNCTION
:FolderContentToFile
REM INCOMPLETE FUNCTION
:FindFile

:FindFolder

:CompressFile

:UncompressFile

:CompressFolder

:UncompressFolder

:EncryptFile

:DecryptFile

:EncryptFolder

:DecryptFolder


::Usage (to console) Call :ListFiles x:\path\to\folder 'Will output to console
::Usage (to array) Call :ListFiles x:\path\to\folder ArrayName 'Will output to ArrayName[X], range ArrayName.lbound to ArrayName.ubound
::Usage (to file) Call :ListFiles x:\path\to\folder Filename.ext 'Will output to a file, must contain a dot, can be relative or absolute path
:ListFiles
set "InputFolder=%~1"
set /a index=0
set SearchPattern=*.*
if not ["%~3"]==[""] set SearchPattern=%~3
if ["%~2"]==[""] GoTo :ListFileToConsole
echo %2 | findstr "\." > nul && set OutputFile=%~dpf2
echo %2 | findstr "\." > nul && GoTo :ListFileToFile
GoTo :ListFileToArray
REM Do the right thing about the trailing backslash (not done)
:ListFileToConsole
echo ListToConsole
for /r "%InputFolder%" %%f in (%SearchPattern%) do ( echo %%f )
GoTo :ListFilesEND
:ListFileToFile 
echo ListToFile %OutputFile%
del %OutputFile%
for /r "%InputFolder%" %%f in (%SearchPattern%) do ( echo %%f >> %OutputFile% )
GoTo :ListFilesEND
:ListFileToArray
echo ListToArray %~2
set /a %~2.lbound=%index%
for /f "tokens=*" %%f in ('dir /b /s /a:-d "%InputFolder%\%SearchPattern%"') do (
	call set "%~2[%%index%%]=%%~f"
	set /a "index+=1"
)
set /a "index-=1"
set /a %~2.ubound=%index%
GoTo :ListFilesEND
:ListFilesEND
GoTo :EOF
REM https://old.reddit.com/r/Batch/comments/12hzftu/trying_to_create_a_subfunction_that_puts_all/jfxubzv/
REM https://stackoverflow.com/a/830566
REM call :ListFiles "%PROGRAMFILES%\Internet Explorer\" 
REM call :ListFiles "%PROGRAMFILES%\Internet Explorer\" OutputArray
REM call :ListFiles "%PROGRAMFILES%\Internet Explorer\" OutputFile.txt

:: -------------------------------
:: ----- String Manipulation -----
:: -------------------------------

REM incomplete
:: Call :InStB input search result
:InStB
set "InputSTR=%1"
set "SearchSTR=%2"
set %3=false
echo input string %InputSTR%
echo search string %SearchSTR%
echo third param %3
call set TestSTR=%%InputSTR:%SearchSTR:~1,-1%=%%
echo test string %InputSTR%
echo test string %TestSTR%
if %TestSTR%==%InputSTR% ( echo if ran payload )
if not %TestSTR%==%InputSTR% ( echo if ran payload )
if not %TestSTR%==%InputSTR% ( set %3=true )
GoTo :EOF
REM Add example if test || && etc..

REM ********* function *****************************
:len <resultVar> <stringVar>
(   
    setlocal EnableDelayedExpansion
    (set^ tmp=!%~1!)
    if defined tmp (
        set "len=1"
        for %%P in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
            if "!tmp:~%%P,1!" NEQ "" ( 
                set /a "len+=%%P"
                set "tmp=!tmp:~%%P!"
            )
        )
    ) ELSE (
        set len=0
    )
)
( 
    endlocal
    set "%~2=%len%"
    exit /b
)
REM https://stackoverflow.com/a/5841587

::Usage Call :DecimalToCharacter ASCII_code Output_character 
:DecimalToCharacter 
cmd /C exit %1
set %2=%=ExitCodeAscii%
GoTo :EOF
REM https://stackoverflow.com/a/37209642
REM https://stackoverflow.com/questions/38000901/loop-through-ascii-codes-in-batch-file

::Usage Call :Replace Input Search Output
:Replace
set ReplaceInput=%~1
set ReplaceSearch=%~2
call set %3=%%ReplaceInput:%ReplaceSearch%=%%
GoTo :EOF

::Usage Call :TrimQuotes %variable% variable
:TrimQuotes
set TrimQuotes=%~1
set %2=%TrimQuotes%
GoTo :EOF

::Usage Call :TrimTrailingBackslash %Input% Output 
:TrimTrailingBackslash
set TrimTrailingBackslashInput=%1
if "%TrimTrailingBackslashInput:~-1%"=="\" ( 
  set %2=%TrimTrailingBackslashInput:~0,-1%
  ) else (
  set %2=%TrimTrailingBackslashInput%
  )
GoTo :EOF


REM Untested
::Usage Call :deasterisk Input Output
:deasterisk
FOR /f "tokens=1* delims=*" %%i IN ("%~1") DO (
   SET _deasterisk=%%j
   IF DEFINED _deasterisk (
      SET _deasterisk=%%i%%j
      GOTO :deasterisk
   ) ELSE (
      SET _deasterisk=%%i
   )
)
set %2=%_deasterisk%
GoTo :EOF
REM https://stackoverflow.com/questions/15441422/replace-character-of-string-in-batch-script



:: ---------------------------------
:: ----- Registry Manipulation -----
:: ---------------------------------

::Usage Call :ListRegKeys RegisteryKey Optional OutputFile
:ListRegKeys
call :TrimTrailingBackslash %~1 ListRegKeysQuery
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "%ListRegKeysQuery%"') do echo %%a "%%c"
GoTo :EOF
REM  https://superuser.com/questions/995591/how-to-get-a-registry-value-and-set-into-a-variable-in-batch

::Usage Call :GetRegistryValue RegistryKey Output
:GetRegistryValue
set %2=
Set _GetRegistryKey=%~1
Call :GetLastElement \ %_GetRegistryKey% _GetRegistryKeyName
Call :TrimQuotes %_GetRegistryKeyName% _GetRegistryKeyName
Call :Replace "%_GetRegistryKey%" "\%_GetRegistryKeyName%" _GetRegistryPath
REM echo %GetRegistryPath%
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "%_GetRegistryPath%"') do if "[%%a]"=="[%_GetRegistryKeyName%]" set %2=%%c
REM for /f "skip=2 tokens=1,2,*" %%a in ('reg query "%GetRegistryPath%"') do set "%2=%%c"
GoTo :EOF

::Usage Call :GetRegistryValue RegistryKey Output
:ShowRegistryValue
echo Listing all user environement variables
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKCU\Environment"') do echo %%a %%c
GoTo :EOF

REM (default to dword if numerical or string if not)
REM TODO  Create ::AddRegistryValue single overloaded function that determines correct datatype
REM Function first argument should be key path AND name, instead of two parameters
REM HKEY_CURRENT_USER\EUDC\666\mytestkey myvalue

::Usage Call :DelRegistryKey KeyPath 
:DelRegistryKey

REG DELETE HKEY_CURRENT_USER\Software\ExampleKey
GoTo :EOF

::Usage Call :DelRegistrySubkey KeyPath Subkey
:DelRegistrySubkey
Set DelKeyPath=%~1
Call :GetLastElement \ %DelKeyPath% DelKeyName
REG DELETE HKEY_CURRENT_USER\Software\ExampleKey /v DelKeyName
GoTo :EOF

::Usage Call :AddRegistryString RegistryKeyPath RegistryKeyName Value 
:AddRegistryString
set _AddRegistryStringKeyPath=%1
Call :GetLastElement \ %_AddRegistryStringKeyPath% _AddRegistryStringKeyPath
Call :TrimQuotes %_AddRegistryStringKeyName% _AddRegistryStringKeyName
call set _AddRegistryStringKeyPath=%%_AddRegistryStringKeyPath:%_AddRegistryStringKeyName%=%%
call :TrimTrailingBackslash %_AddRegistryStringKeyPath% _AddRegistryStringKeyPath
REG ADD "%_AddRegistryStringKeyPath%" /v "%_AddRegistryStringKeyName%" /t REG_SZ /d "%~2" /f
set "_AddRegistryStringKeyName=" & set "_AddRegistryStringKeyPath="
GoTo :EOF

::Usage Call :AddRegistryStringExpand RegistryKeyPath RegistryKeyName Value 
:AddRegistryStringExpand
REG ADD "%~1" /v "%~2" /t REG_EXPAND_SZ /d "%~3" /f
GoTo :EOF

::Usage Call :AddRegistryStringMulti RegistryKeyPath RegistryKeyName Value 
:AddRegistryStringMulti
REG ADD "%~1" /v "%~2" /t REG_MULTI_SZ /d "%~3" /f
GoTo :EOF

::Usage Call :AddRegistryDWORD RegistryKeyPath RegistryKeyName Value 
:AddRegistryDWORD
REG ADD "%~1" /v "%~2" /t REG_DWORD /d "%~3" /f
GoTo :EOF

::Usage Call :AddRegistryQWORD RegistryKeyPath RegistryKeyName Value 
:AddRegistryQWORD
REG ADD "%~1" /v "%~2" /t REG_QWORD /d "%~3" /f
GoTo :EOF

::Usage Call :AddRegistryBinary RegistryKeyPath RegistryKeyName Value 
:AddRegistryBinary
REG ADD "%~1" /v "%~2" /t REG_BINARY /d %data% /f
GoTo :EOF

:: ----------------------------------------------
:: ----- Environement Variable Manipulation -----
:: ----------------------------------------------

:GetDesktopFolderPath
FOR /F "usebackq" %%f IN (`PowerShell -NoProfile -Command "Write-Host([Environment]::GetFolderPath('Desktop'))"`) DO ( SET "%1=%%f" )
GoTo :EOF

REM Add or remove parts of env variables
::Usage Call :AddEnvironementVariable VariableName VariableContent
:AddEnvironementVariable 
setx %~1 %~2
GoTo :EOF

::Usage Call :GetEnvironmentVariable VariableName VariableContent
:GetEnvironmentVariable
setlocal enabledelayedexpansion
set _GetEnvironmentVariable1=%~1
set _GetEnvironmentVariable2=!%_GetEnvironmentVariable1%!
endlocal & set _GetEnvironmentVariable3=%_GetEnvironmentVariable2%
set %2=%_GetEnvironmentVariable3%
GoTo :EOF 

::Usage Call :ListUserEnvironementVariables
:ListUserEnvironementVariables
echo Listing all user environement variables
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKCU\Environment"') do echo %%a %%c
GoTo :EOF

::Usage Call :ListAllSystemEnvironementVariables
:ListSystemEnvironementVariables
echo Listing all system environement variables
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"') do echo %%a %%c
GoTo :EOF

::Usage Call :GetUserEnvironementVariableFromSet VariableName Output
:GetUserEnvironementVariableFromSet
set %2=
for /f "tokens=1,* delims==" %%a in ('set') do if "[%%a]"=="[%~1]" call set %2=%%b
GoTo :EOF

::Usage Call :GetUserEnvironementVariable VariableName Output
:GetUserEnvironementVariable
set %2=
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKCU\Environment"') do if "[%%a]"=="[%~1]" set %2=%%c
GoTo :EOF

::Usage Call :GetSystemEnvironementVariable VariableName Output
:GetSystemEnvironementVariable
set %2=
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"') do if "[%%a]"=="[%~1]" set %2=%%c
GoTo :EOF

::Usage Call :CreateUserEnvironementVariable VariableName VariableValue
:CreateUserEnvironementVariable
setx %~1 %~2
GoTo :EOF

::Usage Call :CreateSystemEnvironementVariable VariableName VariableValue (requires admin privileges)
:CreateSystemEnvironementVariable
setx %~1 %~2 /M
GoTo :EOF

::Usage Call :ShowUserPath
:ShowUserPath
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKCU\Environment"') do if "[%%a]"=="[Path]" echo Current user path variable is : %%c
GoTo :EOF

::Usage Call :ShowSystemPath
:ShowSystemPath
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"') do if "[%%a]"=="[Path]" echo Current system path variable is : %%c
GoTo :EOF

::Usage Call :AddFolderToUserPath x:\path\to\folder
:AddFolderToUserPath
set CurrentUserPath= & set FilteredPath= & set NewPath=
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKCU\Environment"') do if "[%%a]"=="[Path]" set CurrentUserPath=%%c
set NewPath=%~1;
call set FilteredPath=%%CurrentUserPath:%NewPath%=%%
if "%CurrentUserPath%"=="%FilteredPath%" echo Adding : %NewPath% to current user path : %CurrentUserPath%
if "%CurrentUserPath%"=="%FilteredPath%" setx Path "%CurrentUserPath%%NewPath%"
if not "[%silent%]"=="[true]" echo.
if not "[%silent%]"=="[true]" for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKCU\Environment"') do if "[%%a]"=="[Path]" echo Current user path variable is : %%c
GoTo :EOF

::Usage Call :AddFolderToSystemPath x:\path\to\folder (requires admin privileges)
:AddFolderToSystemPath
set CurrentSystemPath= & set FilteredPath= & set NewPath=
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"') do if "[%%a]"=="[Path]" set CurrentSystemPath=%%c
set NewPath=%~1;
call set FilteredPath=%%CurrentSystemPath:%NewPath%=%%
if "%CurrentSystemPath%"=="%FilteredPath%" echo Adding : %NewPath% to current user path : %CurrentSystemPath%
if "%CurrentSystemPath%"=="%FilteredPath%" setx Path "%CurrentSystemPath%%NewPath%" /m
if not "[%silent%]"=="[true]" echo.
if not "[%silent%]"=="[true]" for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"') do if "[%%a]"=="[Path]" echo Current user path variable is : %%c
GoTo :EOF

::Usage Call :RemoveFolderFromUserPath x:\path\to\folder
:RemoveFolderFromUserPath
set CurrentUserPath= & set FilteredPath= & set NewPath=
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKCU\Environment"') do if "[%%a]"=="[Path]" set CurrentUserPath=%%c
set NewPath=%~1;
call set FilteredPath=%%CurrentUserPath:%NewPath%=%%
if not "%CurrentUserPath%"=="%FilteredPath%" echo Removing : %NewPath% from current user path : %CurrentUserPath%
if not "%CurrentUserPath%"=="%FilteredPath%" setx Path "%FilteredPath%"
if not "[%silent%]"=="[true]" echo.
if not "[%silent%]"=="[true]" for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKCU\Environment"') do if "[%%a]"=="[Path]" echo Current user path variable is : %%c
GoTo :EOF

::Usage Call :RemoveFolderFromSystemPath x:\path\to\folder (requires admin privileges)
:RemoveFolderFromSystemPath
set CurrentSystemPath= & set FilteredPath= & set NewPath=
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"') do if "[%%a]"=="[Path]" set CurrentSystemPath=%%c
set NewPath=%~1;
call set FilteredPath=%%CurrentSystemPath:%NewPath%=%%
if not "%CurrentSystemPath%"=="%FilteredPath%" echo Removing : %NewPath% from current system path : %CurrentSystemPath%
if not "%CurrentSystemPath%"=="%FilteredPath%" setx Path "%FilteredPath%" /m
if not "[%silent%]"=="[true]" echo.
if not "[%silent%]"=="[true]" for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"') do if "[%%a]"=="[Path]" echo Current system path variable is : %%c
GoTo :EOF


:: ----------------------------------------------
:: ----- Appx package management            -----
:: ----------------------------------------------

:ShowAppxForceUpdate
Call :ClearVariablesByPrefix AppxPackages
GoTo :EOF

::Usage Call :InstallAppxPackages PackageList
:InstallAppxPackages
REM if not "[%~1]"=="[]" powershell -Command "Add-AppxPackage -Package '%~1'"
echo powershell -Command "Add-AppxPackage -DisableDevelopmentMode -Register '%~1\AppXManifest.xml'"
if not "[%~1]"=="[]" powershell -Command "Add-AppxPackage -DisableDevelopmentMode -Register '%~1\AppXManifest.xml'"
REM call echo %%%~1.ubound%% REM weird \Program Files\WindowsApps\Microsoft.Winget.Source_2023.515.1421.333_neutral__8wekyb3d8bbwe.ubound
call set "_InstallAppxPackages_PackageList_ubound=%%%~1.ubound%%"
if "[%_InstallAppxPackages_PackageList_ubound=%]"=="[]" GoTo :EOF
set /a _InstallAppxPackages_index=0
:InstallAppxPackages-internal-loop
call echo call powershell -Command "Add-AppxPackage -Package '%%%~1[%_InstallAppxPackages_index%]%%'"
call powershell -Command "Add-AppxPackage -Package '%%%~1[%_InstallAppxPackages_index%]%%'"
set /a _InstallAppxPackages_index+=1
if %_InstallAppxPackages_index% LEQ %_InstallAppxPackages_PackageList_ubound% GoTo :InstallAppxPackages-internal-loop
GoTo :EOF

::Usage Call :DeleteAppxPackages PackageList
:DeleteAppxPackages
if not "[%~1]"=="[]" powershell -Command "Remove-AppxPackage -Package '%~1'"
call echo %%%~1.ubound%%
call set "_DeleteAppxPackages_PackageList_ubound=%%%~1.ubound%%"
if "[%_DeleteAppxPackages_PackageList_ubound=%]"="[]" GoTo :EOF
set /a _DeleteAppxPackages_index=0
:DeleteAppxPackages-internal-loop
call echo call powershell -Command "Remove-AppxPackage -Package '%%%~1[%_DeleteAppxPackages_index%]%%'"
call powershell -Command "Remove-AppxPackage -Package '%%%~1[%_DeleteAppxPackages_index%]%%'"
set /a _DeleteAppxPackages_index+=1
if %_DeleteAppxPackages_index% LEQ %_DeleteAppxPackages_PackageList_ubound% GoTo :DeleteAppxPackages-internal-loop
GoTo :EOF

::Usage Call :FindAppxPackages MatchingPackages optional SearchTerms optional only|except optional SearchProperties
:: SearchTerms contains the search terms, can be an array, if it is an array lbound must be 0 and ubound must be set
:: only|except : ("only" is default behaviour) whether to return only matching results or, all results except matching
:: SearchProperties : List of properties to search for SearchTerm, separated by backslash
:: SearchProperties : If not specified, will use FullName property only
:FindAppxPackages
call :IsAdmin || echo This command requires admin privileges
Call :ClearVariablesByPrefix _FindAppxPackages
REM Obtain ubound from output array, if there's one, so we can just append to it
call set "_FindAppxPackages_MatchingPackages.ubound=%%%~1.ubound%%"
REM Obtain individual search term
set "_FindAppxPackages_SearchTerms[0]=%~2"
REM Obtain ubound, if there's a search terms array
REM call echo call set "_FindAppxPackages_SearchTerms.ubound=%%%~2.ubound%%"
call set "_FindAppxPackages_SearchTerms.ubound=%%%~2.ubound%%"
REM echo _FindAppxPackages_SearchTerms %_FindAppxPackages_SearchTerms%
REM In case there's a path in %~2, we check IsNumeric and wipe the value if not
Call :IsNumeric %_FindAppxPackages_SearchTerms.ubound% && set "_FindAppxPackages_SearchTerms.ubound="
REM If there is no search terms array provided, we skip filling local search terms array
REM if "[%_FindAppxPackages_SearchTerms.ubound%]"=="[]" echo Case where there is no SearchTerms array
if "[%_FindAppxPackages_SearchTerms.ubound%]"=="[]" GoTo :FindAppxPackages-fill-in-SearchTerms-skip
REM We are filling local search terms array, starting at 0
set /a "_FindAppxPackages_SearchTerms.index=0"
:FindAppxPackages-fill-in-SearchTerms-loop
REM We have a search terms array provided, copying to local variable and updating local ubound on each loop
REM call echo Case where SearchTerms array exists, running call set "_FindAppxPackages_SearchTerms[%_FindAppxPackages_SearchTerms.index%]=%%%~2[%_FindAppxPackages_SearchTerms.index%]%%"
call set "_FindAppxPackages_SearchTerms[%_FindAppxPackages_SearchTerms.index%]=%%%~2[%_FindAppxPackages_SearchTerms.index%]%%"
REM echo _FindAppxPackages_SearchTerms[0] %_FindAppxPackages_SearchTerms[0]%
set /a "_FindAppxPackages_SearchTerms.index+=1"
if %_FindAppxPackages_SearchTerms.index% LEQ %_FindAppxPackages_SearchTerms.ubound% GoTo :FindAppxPackages-fill-in-SearchTerms-loop
:FindAppxPackages-fill-in-SearchTerms-skip
REM If there's a search terms array, it has overwritten the erroneous "individual search term" 
REM if "[%_FindAppxPackages_SearchTerms.ubound%]"=="[]" if not "[%_FindAppxPackages_SearchTerms[0]%]"=="[]" echo Case where no SearchTerms array, but one SearchTerms exists
REM If no search terms array was provided but there is a search term, then set local search terms array ubound to zero
if "[%_FindAppxPackages_SearchTerms.ubound%]"=="[]" if not "[%_FindAppxPackages_SearchTerms[0]%]"=="[]" set /a "_FindAppxPackages_SearchTerms.ubound=0"
REM if "[%_FindAppxPackages_SearchTerms.ubound%]"=="[]" if "[%~2]"=="[]" echo No search terms, no array, no action needed
REM We are setting the matching behaviour from the third argument, only returning matching result is the default
set "_FindAppxPackages_MatchingBehaviour=only"
if not "[%~3]"=="[]" set "_FindAppxPackages_MatchingBehaviour=%~3"
REM The way this works, there is on main IF for the comparator, and we use MatchingBehaviour as a macro to boolean flip by writing "not" in it
if "[%_FindAppxPackages_MatchingBehaviour%]"=="[only]" ( set "_FindAppxPackages_MatchingBehaviour=not" ) else ( set "_FindAppxPackages_MatchingBehaviour=" )
REM This is a splitting function, it splits the fourth parameter, delimited with backslash into an array
if not "[%~4]"=="[]" ( Call :Deconcatenate \ %~4 _FindAppxPackages_SearchProperties ) else ( set "_FindAppxPackages_SearchProperties[0]=.PackageFullName" & set /a "_FindAppxPackages_SearchProperties.ubound=0")
REM Time to fill the main database of all AppxPackages
REM Fill array AppxPackages if ubound is not set, clearing the ubound is how to for a refresh
if "[%AppxPackages.ubound%]"=="[]" Call :GetAppxPackages
REM We will now loop through each AppxPackage, we will look for all provided Search terms in each of the specified Properties
set /a "_FindAppxPackages.index=0"
:FindAppxPackages-loop-through-AppxPackages
set /a "_FindAppxPackages_SearchProperties.index=0"
:FindAppxPackages-loop-through-SearchProperties
REM echo _FindAppxPackages.index %_FindAppxPackages.index% _FindAppxPackages_SearchProperties.index %_FindAppxPackages_SearchProperties.index%
REM echo AppxPackages[%_FindAppxPackages.index%] _FindAppxPackages_SearchProperties[%_FindAppxPackages_SearchProperties.index%]
REM call echo AppxPackages[%_FindAppxPackages.index%]%%_FindAppxPackages_SearchProperties[%_FindAppxPackages_SearchProperties.index%]%%
REM call call echo call echo %%%%AppxPackages[%_FindAppxPackages.index%]%%_FindAppxPackages_SearchProperties[%_FindAppxPackages_SearchProperties.index%]%%%%%%
REM call call echo call call set "_FindAppxPackages_CurrentSearchProperty=%%%%AppxPackages[%_FindAppxPackages.index%]%%_FindAppxPackages_SearchProperties[%_FindAppxPackages_SearchProperties.index%]%%%%%%"
call call set "_FindAppxPackages_CurrentSearchProperty=%%%%AppxPackages[%_FindAppxPackages.index%]%%_FindAppxPackages_SearchProperties[%_FindAppxPackages_SearchProperties.index%]%%%%%%"
REM echo CURRENT PROPERTY:%_FindAppxPackages_CurrentSearchProperty%
set /a "_FindAppxPackages_SearchTerms.index=0"
:FindAppxPackages-loop-through-SearchTerms
REM call echo call set "_FindAppxPackages_CurrentSearchTerm=%%_FindAppxPackages_SearchTerms[%_FindAppxPackages_SearchTerms.index%]%%"
call set "_FindAppxPackages_CurrentSearchTerm=%%_FindAppxPackages_SearchTerms[%_FindAppxPackages_SearchTerms.index%]%%"
if "[%_FindAppxPackages_CurrentSearchTerm%]"=="[]" GoTo :FindAppxPackages-match-found
REM echo looping through _FindAppxPackages.index=%_FindAppxPackages.index% _FindAppxPackages_SearchProperties.index=%_FindAppxPackages_SearchProperties.index% _FindAppxPackages_SearchTerms.index=%_FindAppxPackages_SearchTerms.index%
REM call echo call echo set "_FindAppxPackages_CurrentSearchPropertyCompare=%_FindAppxPackages_CurrentSearchProperty:%_FindAppxPackages_CurrentSearchTerm%=%"
REM call echo set "_FindAppxPackages_CurrentSearchPropertyCompare=%_FindAppxPackages_CurrentSearchProperty:%_FindAppxPackages_CurrentSearchTerm%=%"
call set "_FindAppxPackages_CurrentSearchPropertyCompare=%%_FindAppxPackages_CurrentSearchProperty:%_FindAppxPackages_CurrentSearchTerm%=%%"
REM echo _FindAppxPackages_CurrentSearchProperty=%_FindAppxPackages_CurrentSearchProperty% 
REM echo _FindAppxPackages_CurrentSearchTerm=%_FindAppxPackages_CurrentSearchTerm% 
REM echo _FindAppxPackages_CurrentSearchPropertyCompare %_FindAppxPackages_CurrentSearchPropertyCompare%
REM echo MAIN COMPARATOR if %_FindAppxPackages_MatchingBehaviour% "[%_FindAppxPackages_CurrentSearchProperty%]"=="[%_FindAppxPackages_CurrentSearchPropertyCompare%]"
REM if %_FindAppxPackages_MatchingBehaviour% "[%_FindAppxPackages_CurrentSearchProperty%]"=="[%_FindAppxPackages_CurrentSearchPropertyCompare%]" ( echo comparator says yes ) else ( echo comparator says no)
if %_FindAppxPackages_MatchingBehaviour% "[%_FindAppxPackages_CurrentSearchProperty%]"=="[%_FindAppxPackages_CurrentSearchPropertyCompare%]" ( GoTo :FindAppxPackages-match-found ) else ( GoTo :FindAppxPackages-no-match-found )
:FindAppxPackages-match-found
if not "[%_FindAppxPackages_MatchingPackages.ubound%]"=="[]" set /a _FindAppxPackages_MatchingPackages.ubound+=1
if "[%_FindAppxPackages_MatchingPackages.ubound%]"=="[]" set /a _FindAppxPackages_MatchingPackages.ubound=0
REM echo MATCH FOUND ADDING %~1[%_FindAppxPackages_MatchingPackages.ubound%]=%_FindAppxPackages.index%
set /a %~1[%_FindAppxPackages_MatchingPackages.ubound%]=%_FindAppxPackages.index%
REM echo we made it here ? 5
GoTo :FindAppxPackages-go-to-next-AppxPackages-index
:FindAppxPackages-no-match-found
set /a "_FindAppxPackages_SearchTerms.index+=1"
if %_FindAppxPackages_SearchTerms.index% LEQ %_FindAppxPackages_SearchTerms.ubound% GoTo :FindAppxPackages-loop-through-SearchTerms
set /a "_FindAppxPackages_SearchProperties.index+=1"
if %_FindAppxPackages_SearchProperties.index% LEQ %_FindAppxPackages_SearchProperties.ubound% GoTo :FindAppxPackages-loop-through-SearchProperties
:FindAppxPackages-go-to-next-AppxPackages-index
REM echo we made it here ? 6
set /a "_FindAppxPackages.index+=1"
REM echo if %_FindAppxPackages.index% LEQ %AppxPackages.ubound% GoTo :FindAppxPackages-loop-through-AppxPackages
if %_FindAppxPackages.index% LEQ %AppxPackages.ubound% GoTo :FindAppxPackages-loop-through-AppxPackages
call set /a %%%~1.ubound=%_FindAppxPackages_MatchingPackages.ubound%
set /a _FindAppxPackages_MatchingPackages.ubound+=1
call set /a %%%~1.count=%_FindAppxPackages_MatchingPackages.ubound%
Call :ClearVariablesByPrefix _FindAppxPackages
GoTo :EOF
REM https://stackoverflow.com/questions/8481558/windows-batch-goto-within-if-block-behaves-very-strangely
REM https://stackoverflow.com/users/1012053/dbenham
REM https://stackoverflow.com/questions/47280217/was-unexpected-at-this-time-generated-from-batch-script-line-if-exist-file/47280406#47280406

::Usage Call :GetAppxPackages
:GetAppxPackages
Call :ClearVariablesByPrefix AppxPackages
set /a "AppxPackages.lbound=0"
set /a "AppxPackages.ubound=0"
set /a "AppxPackages.count=0"
for /f "tokens=1-24 delims=|" %%a in ('powershell -Command "$i = 0; Get-AppxPackage -AllUsers | ForEach-Object { (&{ if ($_.GetHashCode().ToString()) { $_.GetHashCode().ToString() } else { 'NoValue' } }) + '|' + (&{ if ($_.GetType()) { $_.GetType() } else { 'NoValue' } }) + '|' + (&{ if ($_.ToString()) { $_.ToString() } else { 'NoValue' } }) + '|' + (&{ if ($_.Architecture) { $_.Architecture } else { 'NoValue' } }) + '|' + (&{ if ($_.Dependencies) { $_.Dependencies } else { 'NoDependencies' } }) + '|' + (&{ if ($_.InstallLocation) { $_.InstallLocation } else { 'NoValue' } }) + '|' + (&{ if ($_.IsBundle) { $_.IsBundle } else { 'NoValue' } }) + '|' + (&{ if ($_.IsDevelopmentMode) { $_.IsDevelopmentMode } else { 'NoValue' } }) + '|' + (&{ if ($_.IsFramework) { $_.IsFramework } else { 'NoValue' } }) + '|' + (&{ if ($_.IsPartiallyStaged) { $_.IsPartiallyStaged } else { 'NoValue' } }) + '|' + (&{ if ($_.IsResourcePackage) { $_.IsResourcePackage } else { 'NoValue' } }) + '|' + (&{ if ($_.Name) { $_.Name } else { 'NoValue' } }) + '|' + (&{ if ($_.NonRemovable) { $_.NonRemovable } else { 'NoValue' } }) + '|' + (&{ if ($_.PackageFamilyName) { $_.PackageFamilyName } else { 'NoValue' } }) + '|' + (&{ if ($_.PackageFullName) { $_.PackageFullName } else { 'NoValue' } }) + '|' + (&{ if ($_.PackageUserInformation) { $_.PackageUserInformation } else { 'NoValue' } }) + '|' + (&{ if ($_.Publisher) { $_.Publisher } else { 'NoValue' } }) + '|' + (&{ if ($_.PublisherId) { $_.PublisherId } else { 'NoValue' } }) + '|' + (&{ if ($_.ResourceId) { $_.ResourceId } else { 'NoValue' } }) + '|' + (&{ if ($_.SignatureKind) { $_.SignatureKind } else { 'NoValue' } }) + '|' + (&{ if ($_.Status) { $_.Status } else { 'NoValue' } }) + '|' + (&{ if ($_.Version) { $_.Version } else { 'NoValue' } }) + '|' + $i++ }"') do (
set "AppxPackages[%%w].GetHashCode=%%a"
set "AppxPackages[%%w].GetType=%%b"
set "AppxPackages[%%w].ToString=%%c"
set "AppxPackages[%%w].Architecture=%%d"
set "AppxPackages[%%w].Dependencies=%%e"
set "AppxPackages[%%w].InstallLocation=%%f"
set "AppxPackages[%%w].IsBundle=%%g"
set "AppxPackages[%%w].IsDevelopmentMode=%%h"
set "AppxPackages[%%w].IsFramework=%%i"
set "AppxPackages[%%w].IsPartiallyStaged=%%j"
set "AppxPackages[%%w].IsResourcePackage=%%k"
set "AppxPackages[%%w].Name=%%l"
set "AppxPackages[%%w].NonRemovable=%%m"
set "AppxPackages[%%w].PackageFamilyName=%%n"
set "AppxPackages[%%w].PackageFullName=%%o"
set "AppxPackages[%%w].PackageUserInformation=%%p"
set "AppxPackages[%%w].Publisher=%%q"
set "AppxPackages[%%w].PublisherId=%%r"
set "AppxPackages[%%w].ResourceId=%%s"
set "AppxPackages[%%w].SignatureKind=%%t"
set "AppxPackages[%%w].Status=%%u"
set "AppxPackages[%%w].Version=%%v"
set "AppxPackages.ubound=%%w"
)
set /a "AppxPackages.count=%AppxPackages.ubound%+1"
GoTo :EOF


:: DEMO functions

:AppendToPathDEMO

set silent=true

echo User path test
echo.
Call :ShowUserPath
echo.
Call :AddFolderToUserPath x:\path\to\folder
echo.
Call :ShowUserPath
echo.
Call :RemoveFolderFromUserPath x:\path\to\folder
echo.
Call :ShowUserPath
echo.

echo System path test

echo.
Call :ShowSystemPath
echo.
Call :AddFolderToSystemPath x:\path\to\folder
echo.
Call :ShowSystemPath
echo.
Call :RemoveFolderFromSystemPath x:\path\to\folder
echo.
Call :ShowSystemPath

GoTo :END


REM echo Append a folder to a path (not this is case sensitive and doesn't work with PATH)
REM Call :GetUserEnvironementVariable PATH Output
REM echo user env variable PATH is :%Output%
echo Append a folder to a path, but only if it not already present
Call :GetUserEnvironementVariable Path Output
echo user env variable PATH is :%Output%
REM echo Set user variable PATH to %PATH%C:\mytestfolder;
REM Call :CreateUserEnvironementVariable PATH "%PATH%C:\mytestfolder;"
if "%Output%"=="%Output:C:\mytestfolder=%" Call :CreateUserEnvironementVariable PATH "%Output%C:\mytestfolder;"
Call :GetUserEnvironementVariable Path Output
echo user env variable PATH is :%Output%
echo.


GoTo :END

:GetENVVARDEMO
REM GetENN variable DEMO
set output=
Call :GetEnvironmentVariable "myvar" output
echo variable myvar is %output%
REM GetENV variable DEMO END
GoTo :END

:ReplaceDEMO

set myvar=Dou dou dou pouet pouet
echo %myvar%
call :Replace "%myvar%" ou myvar
echo %myvar%

GoTo :EOF

:InSTBDEMO
echo input string does contain search string
set inputstring=This is a #@LKG(G test string
set searchstring=#@LKG(G
Call :InStB "%inputstring%" "%searchstring%" resultbool
echo %resultbool%

echo.

echo running standalone test search string is in
call set MYTestSTR=%%inputstring:%inputstring%=%%

echo input string %inputstring%
echo search string %searchstring%
echo test string %MYTestSTR%

if "%MYTestSTR%"=="%inputstring%" echo if ran payload
if not "%MYTestSTR%"=="%inputstring%" echo not if ran payload
if not "%MYTestSTR%"=="%inputstring%" echo search string was found

echo.

echo input string does not contain search string
set inputstring=This is a #@LK(G test string
set searchstring=#@LKG(G
Call :InStB "%inputstring%" "%searchstring%" resultbool
echo %resultbool%

echo.

echo running standalone test search string is not in
call set MYTestSTR=%%inputstring:%inputstring%=%%

echo input string %inputstring%
echo search string %searchstring%
echo test string %MYTestSTR%

if "%MYTestSTR%"=="%inputstring%" echo if ran payload
if not "%MYTestSTR%"=="%inputstring%" echo not if ran payload
if not "%MYTestSTR%"=="%inputstring%" echo search string was not found

echo.

echo input string does contain search string WITH A SPACE
set inputstring=This is a #@L KG(G test string
set searchstring=#@L KG(G
Call :InStB "%inputstring%" "%searchstring%" resultbool
echo %resultbool%

echo.

echo running standalone test search string WITH A SPACE is in
call set MYTestSTR=%%inputstring:%inputstring%=%%

echo input string %inputstring%
echo search string %searchstring%
echo test string %MYTestSTR%

if "%MYTestSTR%"=="%inputstring%" echo if ran payload
if not "%MYTestSTR%"=="%inputstring%" echo not if ran payload
if not "%MYTestSTR%"=="%inputstring%" echo search string was found

echo.

echo input string does not contain search string WITH A SPACE
set inputstring=This is a #@L K(G test string
set searchstring=#@L KG(G
Call :InStB "%inputstring%" "%searchstring%" resultbool
echo %resultbool%

echo.

echo running standalone test search string WITH A SPACE is not in
call set MYTestSTR=%%inputstring:%inputstring%=%%

echo input string %inputstring%
echo search string %searchstring%
echo test string %MYTestSTR%

if "%MYTestSTR%"=="%inputstring%" echo if ran payload
if not "%MYTestSTR%"=="%inputstring%" echo not if ran payload
if not "%MYTestSTR%"=="%inputstring%" echo search string was found

GoTo :EOF



:ListRegKeysDEMO
REM ListRegKeys DEMO
echo.
echo List all system environement variables
Call :ListSystemEnvironementVariables
echo.
echo List all user environement variables
Call :ListUserEnvironementVariables
echo.
echo List one specific user variable
Call :GetUserEnvironementVariable SESSIONNAME Output
echo env variable SESSIONNAME is :%Output%
echo.
echo List one specific system variable
Call :GetSystemEnvironementVariable PATHEXT Output
echo system env variable PATHEXT is :%Output%
echo.
echo Set user variable mytestvalue1 to TIME
Call :CreateUserEnvironementVariable mytestvalue1 %TIME%
echo.
echo Set system variable mysystemtestvalue1 to TIME
Call :CreateSystemEnvironementVariable mysystemtestvalue1 %TIME%
echo.
echo List one specific user variable
Call :GetUserEnvironementVariable mytestvalue1 Output
echo env variable mytestvalue1 is :%Output%
echo.
echo List one specific system variable
Call :GetSystemEnvironementVariable mysystemtestvalue1 Output
echo system env variable mysystemtestvalue1 is :%Output%
echo.
echo list all keys in HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment
call :ListRegKeys "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
echo.
echo list all keys in HKEY_CURRENT_USER\Control Panel\Colors
call :ListRegKeys "HKEY_CURRENT_USER\Control Panel\Colors" 
REM call :ListRegKeys "HKEY_CURRENT_USER\Control Panel\Colors" testtest
echo.

REM Call :AddRegistryValue "HKEY_CURRENT_USER\Software\Test" "TestDWORD" "12345"
REM Call :AddRegistryValue "HKEY_CURRENT_USER\Software\Test" "TestExpandSZ" "C:\Windows\System32" "REG_EXPAND_SZ"
REM Call :AddRegistryValue "HKEY_CURRENT_USER\Software\Test" "TestMultiSZ" "Value1\0Value2\0Value3" "REG_MULTI_SZ"
REM Call :AddRegistryValue "HKEY_CURRENT_USER\Software\Test" "TestQWORD" "1234567890123" "REG_QWORD"
REM call :AddRegistryString "HKEY_CURRENT_USER\Software\Example" "StringKey" "This is a string value"
REM call :AddRegistryDword "HKEY_CURRENT_USER\Software\Example" "DwordKey" 123456
REM call :AddRegistryBinary "HKEY_CURRENT_USER\Software\Example" "BinaryKey" "0x12,0x34,0x56,0x78"




GoTo :END


:TrueFalseDemo

set ReturnValue=SHOULD NOT RETURN THIS
Call :true ReturnValue
echo After calling :true, ReturnValue is %ReturnValue%

set ReturnValue=SHOULD NOT RETURN THIS
Call :false ReturnValue
echo After calling :false, ReturnValue is %ReturnValue%

set ReturnValue=SHOULD RETURN THIS
Call :true
echo After calling :true, ReturnValue is %ReturnValue%

set ReturnValue=SHOULD RETURN THIS
Call :false 
echo After calling :false without a return variable, ReturnValue is %ReturnValue%

set ReturnValue=
Call :true ReturnValue && echo This funtion returns true || echo This funtion returns false
echo After calling :true, ReturnValue is %ReturnValue%

set ReturnValue=
Call :false ReturnValue && echo This funtion returns true || echo This funtion returns false
echo After calling :false, ReturnValue is %ReturnValue%

set ReturnValue=
Call :true ReturnValue && echo This funtion returns true || echo This funtion returns false
echo After calling :true, ReturnValue is %ReturnValue%

set ReturnValue=
Call :false ReturnValue && echo This funtion returns true || echo This funtion returns false
echo After calling :false, ReturnValue is %ReturnValue%

REM Call :IsFolderWritable %USERPROFILE%\ IsFolderWritable && echo yes || echo no


GoTo :EOF

:ListFileDEMO
REM ListFileDEMO
Call :CreateFile d:\file1.ext
Call :CreateFile d:\file2.ext
Call :CreateFile d:\file3.ext
Call :CreateFile d:\file4.ext
Call :CreateFile d:\file5.ext
Call :CreateFile d:\test1\file1.ext
Call :CreateFile d:\test1\file2.ext
Call :CreateFile d:\test1\file3.ext
Call :CreateFile d:\test1\file4.ext
Call :CreateFile d:\test1\file5.ext

Call :ListFiles "d:\test1\" 
Call :ListFiles "d:\test1\" filelist.text.txt
Call :ListFiles "d:\test1\" FileListArray

echo 0 %FileListArray[0]%
echo 1 %FileListArray[1]%
echo 2 %FileListArray[2]%
echo 3 %FileListArray[3]%
echo 4 %FileListArray[4]%
echo 5 %FileListArray[5]%
echo 6 %FileListArray[6]%
echo lbound %FileListArray.lbound%
echo ubound %FileListArray.ubound%
echo list file contents
type filelist.text.txt
REM ListFileDEMOEND
GoTo :END

:StringSubstitutionDEMO
set firststr=ABC Def ghi KlM NoP
set secondstr=The lazy brown fox
set firstword=abc
set secondword=def
set thirdword=ghi


echo Demonstration of string substitution

echo First string is : %firststr%
echo Second string is : %secondstr%
echo 1st, 2nd ^& 3rd word : %firstword%, %secondword%, %thirdword%

echo.

echo 1 Replace word def from first string with nothing
echo %firststr:def=%

echo.

echo 2 Replace word def from first string with nothing, but using the secondword
call set mynewvar=%%firststr:%secondword%=%%
echo %mynewvar%

echo.

Echo 3 Trunkate string after the word def
set selectstr=%firststr:*def=%
call set mynewvar=%%firststr:%selectstr%=%%
echo %mynewvar%

echo.

Echo 4 Trunkate string after the word def
call set selectstr=%%firststr:*%secondword%=%%
echo result selectstr: %selectstr%
call set mynewvar=%%firststr:%selectstr%=%%
echo result mynewvar: %mynewvar%

echo.

Echo 5 Trunkate string before the word def
call set selectstr=%firststr:def*=%
call set mynewvar=%%firststr:%selectstr%=%%
echo %mynewvar%

echo.

Echo 6 Trunkate string before the word def
call set selectstr=%%firststr:%secondword%*=%%
echo result selectstr: %selectstr%
call set mynewvar=%%firststr:%selectstr%=%%
echo result mynewvar: %mynewvar%

pause
GoTo :EOF 


:VariablesDEMO
echo Entire command line and arguments : %CmdCmdLine%
echo The first argument : %1
echo The first argument unquoted : %~1
echo Drive letter of first argument : %~d1
echo Folder of the first argument : %~p1
echo Drive letter and folder of first argument : %~dp1
echo Filename of the first argument : %~n1
echo Folder and filename of the first argument : %~pn1
echo Extension of the first argument : %~x1
echo File size of the first argument : %~z1
echo Short filename of the first argument : %~sn1
echo Short extension of the first argument : %~sx1
echo Short full path and filename of first argument : %~sf1
echo Drive, folder, filename and extension of first argument : %~dpnx1
echo Full path and filename of first argument : %~f1
echo First matching folder in PATH of first argument : %~$PATH:1
echo Remainder of the arguments : %*
echo.
echo Initial Folder : %InitialFolder% 
echo BatchFileDirectory : %BatchFileDirectory%
echo CurrentFolder : %CD%
echo Pushed directory :  %Pushed%

GoTo :END

:TrimQuotesDEMO
set myvar=myquotedvariable
echo %myvar%
Call :TrimQuotes %myvar% myvar
echo %myvar%
GoTo :EOF

:RegistryHandlingDEMO


Call :AddRegistryString HKEY_CURRENT_USER\EUDC\666\myteststring thisisateststring
Call :AddRegistryString HKEY_CURRENT_USER\EUDC\666\myteststring2 thisisateststring2
Call :AddRegistryString HKEY_CURRENT_USER\EUDC\666\myteststring3 thisisateststring3
Call :AddRegistryString HKEY_CURRENT_USER\EUDC\666\subfolder\subteststring thisisateststring3
Call :AddRegistryString HKEY_CURRENT_USER\EUDC\666\myteststring4 thisisateststring4
REM Call :AddRegistryString HKEY_CURRENT_USER\EUDC\667\myteststring "thisisateststring with a space" 
REM Call :AddRegistryStringExpand HKEY_CURRENT_USER\EUDC\668\myteststring "what is an expand string anyway" 
REM Call :AddRegistryStringMulti HKEY_CURRENT_USER\EUDC\669\myteststring "what is;an multi;string anyway;" 
REM Call :AddRegistryDWORD HKEY_CURRENT_USER\EUDC\670\myteststring "-1" 
REM Call :AddRegistryDWORD HKEY_CURRENT_USER\EUDC\670\myteststring "0" 
REM Call :AddRegistryDWORD HKEY_CURRENT_USER\EUDC\670\myteststring "1" 
REM Call :AddRegistryDWORD HKEY_CURRENT_USER\EUDC\670\myteststring "4294967294" 
REM Call :AddRegistryDWORD HKEY_CURRENT_USER\EUDC\670\myteststring2 "4294967295" 
REM Call :AddRegistryDWORD HKEY_CURRENT_USER\EUDC\670\myteststring3 "4294967296" 
REM Call :AddRegistryQWORD HKEY_CURRENT_USER\EUDC\671\myteststring "-1" 
REM Call :AddRegistryQWORD HKEY_CURRENT_USER\EUDC\671\myteststring2 "0" 
REM Call :AddRegistryQWORD HKEY_CURRENT_USER\EUDC\671\myteststring3 "1" 
REM Call :AddRegistryQWORD HKEY_CURRENT_USER\EUDC\671\myteststring4 "18446744073709551614" 
REM Call :AddRegistryQWORD HKEY_CURRENT_USER\EUDC\671\myteststring5 "18446744073709551615" 
REM Call :AddRegistryQWORD HKEY_CURRENT_USER\EUDC\671\myteststring6 "18446744073709551616" 
echo.


echo list keys at "HKEY_CURRENT_USER\EUDC\666\myteststring" not a keybtw
Call :ListRegKeys "HKEY_CURRENT_USER\EUDC\666\myteststring"
echo.
echo list keys at "HKEY_CURRENT_USER\EUDC\666" 
Call :ListRegKeys "HKEY_CURRENT_USER\EUDC\666"
echo.
echo list keys at "HKEY_CURRENT_USER\EUDC\666\" 
Call :ListRegKeys "HKEY_CURRENT_USER\EUDC\666\"
echo.

echo GetRegistryValue of HKEY_CURRENT_USER\EUDC\666\myteststring
Call :GetRegistryValue "HKEY_CURRENT_USER\EUDC\666\myteststring" Output
echo GetRegistryValue HKEY_CURRENT_USER\EUDC\666\myteststring = %Output%

REM Call :GetRegistryValue "HKEY_CURRENT_USER\EUDC\671\myteststring3" Output
REM echo GetReg HKEY_CURRENT_USER\EUDC\671\myteststring3 = %Output%

GoTo :EOF

:GetSpecialFolderPathDEMO
Call :GetDesktopFolderPath DesktopPath

echo Desktop folder path is %DesktopPath%

pause

GoTo :EOF

:IsNumericDEMO
set "var=your_variable_here"
set "num=0123456789"

echo input variable is : %var%
echo.%var%| findstr /r "[^%num%]" >nul && (
    echo.%var% is a string
) || (
    echo.%var% is a number
)

set "var=0001"
echo input variable is : %var%
echo.%var%| findstr /r "[^%num%]" >nul && (
    echo.%var% is a string
) || (
    echo.%var% is a number
)

set "var=your_variable_here"
echo input variable is : %var%
Call :IsNumeric %var% Output
echo IsNumeric is %output% & set output=

set "var=0001"
echo input variable is : %var%
Call :IsNumeric %var% Output
echo IsNumeric is %output% & set output=

set "var=your_variable_here"
echo input variable is : %var%
Call :IsNumeric %var% && echo it is not numeric || echo it is numeric

set "var=0001"
echo input variable is : %var%
Call :IsNumeric %var% && echo it is not numeric || echo it is numeric

set "var=textand1234"
echo input variable is : %var%
Call :IsNumeric %var% && echo it is not numeric || echo it is numeric

GoTo:EOF

:IsNumeric-DEMOv2
echo isnumeric with a quoted number
call :isnumeric "1" && echo is was not numeric || ( echo it was numeric & echo also you smell )
echo isnumeric with a quoted letter
call :isnumeric "a" && echo is was not numeric || ( echo it was numeric & echo also you smell )
echo isnumeric with a quoted letter and a number 1a then a1
call :isnumeric "1a" && echo is was not numeric || ( echo it was numeric & echo also you smell )
call :isnumeric "a1" && echo is was not numeric || ( echo it was numeric & echo also you smell )
echo isnumeric with a double quote empty
call :isnumeric "" && echo is was not numeric || ( echo it was numeric & echo also you smell )
echo isnumeric with a number
call :isnumeric 1 && echo is was not numeric || ( echo it was numeric & echo also you smell )
echo isnumeric with a letter
call :isnumeric a && echo is was not numeric || ( echo it was numeric & echo also you smell )
echo isnumeric with a letter and a number 1a then a1
call :isnumeric 1a && echo is was not numeric || ( echo it was numeric & echo also you smell )
call :isnumeric a1 && echo is was not numeric || ( echo it was numeric & echo also you smell )
echo isnumeric with no input 
call :isnumeric && echo is was not numeric || ( echo it was numeric & echo also you smell )


echo isnumeric with a quoted number, then double branch test
call :isnumeric "1" && echo is was not numeric || ( echo it was numeric & echo also you smell & call :isnumeric "a" && echo 2it was not numeric || echo 2it was numeric )

echo.
echo double branch configuration
echo .
call :isnumeric "a" && call :isnumeric "1" && echo both were not numeric ( a ^& 1 )
call :isnumeric "1" && call :isnumeric "b" && echo both were not numeric ( 1 ^& b )
call :isnumeric "1" && call :isnumeric "1" && echo both were not numeric ( 1 ^& 1 )
call :isnumeric "a" && call :isnumeric "b" && echo both were not numeric ( a ^& b )
call :isnumeric "a" || call :isnumeric "2" || echo both were numeric ( a ^& 2 )
call :isnumeric "1" || call :isnumeric "b" || echo both were numeric ( 1 ^& b )
call :isnumeric "a" || call :isnumeric "b" || echo both were numeric ( a ^& b )
call :isnumeric "1" || call :isnumeric "2" || echo both were numeric ( 1 ^& 2 )
call :isnumeric "a" && call :isnumeric "b" || echo first not numeric, second was numeric ( a ^& b )
echo below fails because it only runs isnumeric once then skips to pipes (ampersands then pipes always ?)
call :isnumeric "1" && call :isnumeric "2" || echo first not numeric, second was numeric ( 1 ^& 2 )
echo solution ?  Put the second evaluation in parenthesis
call :isnumeric "1" && ( call :isnumeric "2" || echo first not numeric, second was numeric ^( 1 ^& 2 ^) )
echo below fails because it only runs isnumeric once then skips to pipes
call :isnumeric "1" && call :isnumeric "b" || echo first not numeric, second was numeric ( 1 ^& b )
echo solution ? Put the second evaluation in parenthesis
call :isnumeric "1" && (call :isnumeric "b" || echo first not numeric, second was numeric ^( 1 ^& b ^) )
call :isnumeric "a" && call :isnumeric "1" || echo first not numeric, second was numeric ( a ^& 1 )
call :isnumeric "1" || call :isnumeric "2" && echo first was numeric, second not numeric ( 1 ^& 2 )
call :isnumeric "a" || call :isnumeric "b" && echo first was numeric, second not numeric ( a ^& b )
call :isnumeric "a" || call :isnumeric "1" && echo first was numeric, second not numeric ( a ^& 1 )
call :isnumeric "1" || call :isnumeric "a" && echo first was numeric, second not numeric ( 1 ^& a )


echo. 
echo same experiment, but cleaned up 
echo.

call :isnumeric "a" && call :isnumeric "1" && echo both were not numeric ( a ^& 1 )
call :isnumeric "1" && call :isnumeric "b" && echo both were not numeric ( 1 ^& b )
call :isnumeric "1" && call :isnumeric "1" && echo both were not numeric ( 1 ^& 1 )
call :isnumeric "a" && call :isnumeric "b" && echo both were not numeric ( a ^& b )
call :isnumeric "a" || call :isnumeric "2" || echo both were numeric ( a ^& 2 )
call :isnumeric "1" || call :isnumeric "b" || echo both were numeric ( 1 ^& b )
call :isnumeric "a" || call :isnumeric "b" || echo both were numeric ( a ^& b )
call :isnumeric "1" || call :isnumeric "2" || echo both were numeric ( 1 ^& 2 )
call :isnumeric "a" && call :isnumeric "b" || echo first not numeric, second was numeric ( a ^& b )
call :isnumeric "1" && (call :isnumeric "2" || echo first not numeric, second was numeric ^( 1 ^& 2 ^) )
call :isnumeric "1" && (call :isnumeric "b" || echo first not numeric, second was numeric ^( 1 ^& b ^) )
call :isnumeric "a" && call :isnumeric "1" || echo first not numeric, second was numeric ( a ^& 1 )
call :isnumeric "1" || call :isnumeric "2" && echo first was numeric, second not numeric ( 1 ^& 2 )
call :isnumeric "a" || call :isnumeric "b" && echo first was numeric, second not numeric ( a ^& b )
call :isnumeric "a" || call :isnumeric "1" && echo first was numeric, second not numeric ( a ^& 1 )
call :isnumeric "1" || call :isnumeric "a" && echo first was numeric, second not numeric ( 1 ^& a )



GoTo :EOF


:DeleteFileDEMO
REM Set the 'quiet' variable to control output
set quiet=false

REM Call the DeleteFile subfunction with a file path as an argument
call :DeleteFile x:\path\to\file.ext
echo Return code: %errorlevel%

pause
goto :eof

:BatchFileManPages
cmd /?
if /?
for /?
forfiles /?

GoTo :EOF


:CodePageDEMO
Call :GetCodePage InitialCodepage
Call :ShowCodepage 
echo initial codepage %InitialCodepage%

Call :GetCodePage ReturnValue
Call :ShowCodepage 
echo Codepage is %ReturnValue%

Call :SetCodePage 850

Call :GetCodePage ReturnValue
Call :ShowCodepage 
echo Codepage is %ReturnValue%

Call :SetCodePage 437

Call :GetCodePage ReturnValue
Call :ShowCodepage 
echo Codepage is %ReturnValue%

Call :SetCodePage %InitialCodepage%

Call :GetCodePage ReturnValue
Call :ShowCodepage 
echo Codepage is %ReturnValue%

GoTo :EOF


:DereferenceArrayToArrayDEMO

Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestElementArray
Call :ClearVariablesByPrefix TestReferenceArray
Call :ClearVariablesByPrefix TestOutputArray

set /a TestElementArray[0]=4
set /a TestElementArray[1]=2
set /a TestElementArray[2]=1
set /a TestElementArray[3]=7
set /a TestElementArray[4]=8
set /a TestElementArray.ubound=4

set "TestReferenceArray[0]=testvar0"
set "TestReferenceArray[1]=testvar1"
set "TestReferenceArray[2]=testvar2"
set "TestReferenceArray[3]=testvar3"
set "TestReferenceArray[4]=testvar4"
set "TestReferenceArray[5]=testvar5"
set "TestReferenceArray[6]=testvar6"
set "TestReferenceArray[7]=testvar7"
set "TestReferenceArray[8]=testvar8"
set "TestReferenceArray[9]=testvar9"
set "TestReferenceArray[10]=testvar10"
set /a TestReferenceArray.ubound=10

set "TestReferenceArray[0].suffixA=testvar0A"
set "TestReferenceArray[1].suffixA=testvar1A"
set "TestReferenceArray[2].suffixA=testvar2A"
set "TestReferenceArray[3].suffixA=testvar3A"
set "TestReferenceArray[4].suffixA=testvar4A"
set "TestReferenceArray[5].suffixA=testvar5A"
set "TestReferenceArray[6].suffixA=testvar6A"
set "TestReferenceArray[7].suffixA=testvar7A"
set "TestReferenceArray[8].suffixA=testvar8A"
set "TestReferenceArray[9].suffixA=testvar9A"
set "TestReferenceArray[10].suffixA=testvar10A"

set "TestReferenceArray[0].suffixB=testvar0B"
set "TestReferenceArray[1].suffixB=testvar1B"
set "TestReferenceArray[2].suffixB=testvar2B"
set "TestReferenceArray[3].suffixB=testvar3B
set "TestReferenceArray[4].suffixB=testvar4B"
set "TestReferenceArray[5].suffixB=testvar5B"
set "TestReferenceArray[6].suffixB=testvar6B"
set "TestReferenceArray[7].suffixB=testvar7B"
set "TestReferenceArray[8].suffixB=testvar8B"
set "TestReferenceArray[9].suffixB=testvar9B"
set "TestReferenceArray[10].suffixB=testvar10B"

set "TestReferenceArray[0].suffixC=testvar0C"
set "TestReferenceArray[1].suffixC=testvar1C"
set "TestReferenceArray[2].suffixC=testvar2C"
set "TestReferenceArray[3].suffixC=testvar3C
set "TestReferenceArray[4].suffixC=testvar4C"
set "TestReferenceArray[5].suffixC=testvar5C"
set "TestReferenceArray[6].suffixC=testvar6C"
set "TestReferenceArray[7].suffixC=testvar7C"
set "TestReferenceArray[8].suffixC=testvar8C"
set "TestReferenceArray[9].suffixC=testvar9C"
set "TestReferenceArray[10].suffixC=testvar10C"

Call :SetTitle Testing DereferenceArrayToArray

GoTo :DereferenceArrayToArrayDEMO_skip_here
REM :DereferenceArrayToArrayDEMO_skip_here

Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
echo Reference to TestElementArray with no suffixes
REM set TestOutputArray
Call :EchoArray TestOutputArray
echo.

Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
echo Reference to TestElementArray with no suffixes, using NOSUFFIX in ReferenceSuffix only
set "_DerefArrayReferenceSuffix=NOSUFFIX"
set "_DerefArrayOutputSuffix="
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
set TestOutputArray
echo.

Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
echo Reference to TestElementArray with no suffixes, using NOSUFFIX in ReferenceSuffix and OutputSuffix
set "_DerefArrayReferenceSuffix=NOSUFFIX"
set "_DerefArrayOutputSuffix=NOSUFFIX"
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
set TestOutputArray
echo.

Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
echo _DerefArrayReferenceSuffix .suffixA _DerefArrayOutputSuffix empty
set "_DerefArrayReferenceSuffix=.suffixA"
set "_DerefArrayOutputSuffix="
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
set TestOutputArray
echo.

Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
echo _DerefArrayReferenceSuffix .suffixA _DerefArrayOutputSuffix .suffixA
set "_DerefArrayReferenceSuffix=.suffixA"
set "_DerefArrayOutputSuffix=.suffixA"
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
set TestOutputArray
echo.

Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
echo _DerefArrayReferenceSuffix .suffixB _DerefArrayOutputSuffix .suffixB
set "_DerefArrayReferenceSuffix=.suffixB"
set "_DerefArrayOutputSuffix=.suffixB"
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
set TestOutputArray
echo.



Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
echo _DerefArrayReferenceSuffix .suffixC _DerefArrayOutputSuffix .suffixC
set "_DerefArrayReferenceSuffix=.suffixC"
set "_DerefArrayOutputSuffix=.suffixC"
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
set TestOutputArray
echo.

Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
echo _DerefArrayReferenceSuffix .suffixB _DerefArrayOutputSuffix .suffixB
set "_DerefArrayReferenceSuffix=.suffixB"
set "_DerefArrayOutputSuffix=.suffixB"
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
set TestOutputArray
echo.


echo broken, this outputs to suffixC
echo Maybe because that's the old value from the previous test ? I just changed it to suffixB
Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
echo _DerefArrayReferenceSuffix .suffixC _DerefArrayOutputSuffix NOSUFFIX
set "_DerefArrayReferenceSuffix=.suffixC"
set "_DerefArrayOutputSuffix=NOSUFFIX"
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
set TestOutputArray
echo.


Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
echo _DerefArrayReferenceSuffix .suffixA _DerefArrayOutputSuffix .suffixB
set "_DerefArrayReferenceSuffix=.suffixA"
set "_DerefArrayOutputSuffix=.suffixB"
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
set TestOutputArray
echo.

Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
echo _DerefArrayReferenceSuffix .suffixB _DerefArrayOutputSuffix .suffixA
set "_DerefArrayReferenceSuffix=.suffixB"
set "_DerefArrayOutputSuffix=.suffixA"
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
set TestOutputArray
echo.

Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
echo _DerefArrayReferenceSuffix NOSUFFIX _DerefArrayOutputSuffix .suffixA
set "_DerefArrayReferenceSuffix=NOSUFFIX"
set "_DerefArrayOutputSuffix=.suffixA"
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
set TestOutputArray
echo.

Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
echo _DerefArrayReferenceSuffix .suffixC _DerefArrayOutputSuffix .whateves
set "_DerefArrayReferenceSuffix=.suffixC"
set "_DerefArrayOutputSuffix=.whateves"
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
set TestOutputArray
echo.


Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
echo _DerefArrayReferenceSuffix .suffixA .suffixB _DerefArrayOutputSuffix .suffixA .suffixB
set "_DerefArrayReferenceSuffix=.suffixA .suffixB"
set "_DerefArrayOutputSuffix=.suffixA .suffixB"
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
set TestOutputArray
echo.


Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
echo _DerefArrayReferenceSuffix .suffixA .suffixB _DerefArrayOutputSuffix empty
set "_DerefArrayReferenceSuffix=.suffixA .suffixB"
set "_DerefArrayOutputSuffix="
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
set TestOutputArray
echo.


Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
echo _DerefArrayReferenceSuffix NOSUFFIX .suffixB _DerefArrayOutputSuffix .suffixA .suffixC
set "_DerefArrayReferenceSuffix=NOSUFFIX .suffixB"
set "_DerefArrayOutputSuffix=.suffixA .suffixC"
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
set TestOutputArray
echo.

Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
echo _DerefArrayReferenceSuffix NOSUFFIX .suffixA .suffixB .suffixC _DerefArrayOutputSuffix empty
set "_DerefArrayReferenceSuffix=NOSUFFIX .suffixA .suffixB .suffixC"
set "_DerefArrayOutputSuffix="
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
set TestOutputArray
echo.

Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
echo _DerefArrayReferenceSuffix NOSUFFIX .suffixA .suffixB .suffixC _DerefArrayOutputSuffix NOSUFFIX .suffixA .suffixB .suffixC
set "_DerefArrayReferenceSuffix=NOSUFFIX .suffixA .suffixB .suffixC"
set "_DerefArrayOutputSuffix=NOSUFFIX .suffixA .suffixB .suffixC"
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
set TestOutputArray
echo.

echo Broken, suffixB is lost probably overwritten by data from suffixC, 
echo suffixC goes to suffixC instead of NOSUFFIX
Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
echo _DerefArrayReferenceSuffix NOSUFFIX .suffixA .suffixB .suffixC _DerefArrayOutputSuffix .suffixA .suffixB .suffixC NOSUFFIX
set "_DerefArrayReferenceSuffix=NOSUFFIX .suffixA .suffixB .suffixC"
set "_DerefArrayOutputSuffix=.suffixA .suffixB .suffixC NOSUFFIX"
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
set TestOutputArray
echo.

Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
echo _DerefArrayReferenceSuffix NOSUFFIX NOSUFFIX NOSUFFIX NOSUFFIX _DerefArrayOutputSuffix NOSUFFIX .suffixA .suffixB .suffixC
set "_DerefArrayReferenceSuffix=NOSUFFIX NOSUFFIX NOSUFFIX NOSUFFIX"
set "_DerefArrayOutputSuffix=.suffixA .suffixB .suffixC NOSUFFIX"
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
set TestOutputArray
echo.

Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
echo _DerefArrayReferenceSuffix NOSUFFIX .suffixA .suffixA .suffixA _DerefArrayOutputSuffix NOSUFFIX .suffixA .suffixB .suffixC
set "_DerefArrayReferenceSuffix=NOSUFFIX .suffixA .suffixA .suffixA"
set "_DerefArrayOutputSuffix=NOSUFFIX .suffixA .suffixB .suffixC"
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
set TestOutputArray
echo.

REM BROKEN, NOSUFFIX doesn't  get set
Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
echo _DerefArrayReferenceSuffix .suffixA .suffixA .suffixA .suffixA _DerefArrayOutputSuffix NOSUFFIX .suffixA .suffixB .suffixC .suffixD
set "_DerefArrayReferenceSuffix=.suffixA .suffixA .suffixA .suffixA .suffixA"
set "_DerefArrayOutputSuffix=NOSUFFIX .suffixA .suffixB .suffixC .suffixD"
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
set TestOutputArray
echo.

REM BROKEN, NOSUFFIX doesn't  get set
echo no NOSUFFIX in output 
Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
echo _DerefArrayReferenceSuffix .suffixC .suffixC .suffixC .suffixC _DerefArrayOutputSuffix NOSUFFIX .suffixA .suffixB .suffixC .suffixD
set "_DerefArrayReferenceSuffix=.suffixC .suffixC .suffixC .suffixC .suffixC"
set "_DerefArrayOutputSuffix=NOSUFFIX .suffixA .suffixB .suffixC .suffixD"
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
set TestOutputArray
echo.


Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestOutputArray
echo _DerefArrayReferenceSuffix NOSUFFIX NOSUFFIX NOSUFFIX NOSUFFIX NOSUFFIX _DerefArrayOutputSuffix NOSUFFIX .suffixA .suffixB .suffixC .suffixD
set "_DerefArrayReferenceSuffix=NOSUFFIX NOSUFFIX NOSUFFIX NOSUFFIX NOSUFFIX"
set "_DerefArrayOutputSuffix=NOSUFFIX .suffixA .suffixB .suffixC .suffixD"
Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
set TestOutputArray
echo.



Call :ClearVariablesByPrefix TestOutputArray
set TestOutputArray

GoTo :EOF

:HexPrefixStripperDEMO

set InputHex=0x0
Call :HexPrefixStripper %InputHex% OutputDecimal
Call :EchoValue OutputDecimal

set InputHex=0
Call :HexPrefixStripper %InputHex% OutputDecimal
Call :EchoValue OutputDecimal

set InputHex=1
Call :HexPrefixStripper %InputHex% OutputDecimal
Call :EchoValue OutputDecimal

set InputHex=0x1
Call :HexPrefixStripper %InputHex% OutputDecimal
Call :EchoValue OutputDecimal

set InputHex=0x12
Call :HexPrefixStripper %InputHex% OutputDecimal
Call :EchoValue OutputDecimal

goto :end

:SmallestValueInBatchFinderDEMO
set /a testvalue=0
set /a incrementer=-1
:SmallestValueInBatchFinderDEMO-internal-loop
echo %testvalue%
set /a testvalue+=%incrementer%
if %testvalue% LSS -99 set /a incrementer=-10
if %testvalue% LSS -999 set /a incrementer=-100
if %testvalue% LSS -9999 set /a incrementer=-500
if %testvalue% LSS -9999 set /a incrementer=-1000
if %testvalue% LSS -25999 set /a incrementer=-10000
if %testvalue% LSS -259999 set /a incrementer=-100000
if %testvalue% LSS -2599999 set /a incrementer=-1000000
if %testvalue% LSS -25999999 set /a incrementer=-10000000
if %testvalue% LSS -259999999 set /a incrementer=-100000000
if %testvalue% LSS -2066660000 set /a incrementer=-1000000
if %testvalue% LSS -2137186000 set /a incrementer=-100000
if %testvalue% LSS -2147406000 set /a incrementer=-10000
if %testvalue% LSS -2147460000 set /a incrementer=-1000
if %testvalue% LSS -2147482000 set /a incrementer=-100
if %testvalue% LSS -2147483500 set /a incrementer=-1
REM answer is -2147483648
if %testvalue% LSS 0 goto :SmallestValueInBatchFinderDEMO-internal-loop
GoTo :EOF

:BiggestValueInBatchFinderDEMO
set /a testvalue=0
set /a incrementer=1
:BiggestValueInBatchFinderDEMO-internal-loop
echo %testvalue%
set /a testvalue+=%incrementer%
if %testvalue% GTR 99 set /a incrementer=10
if %testvalue% GTR 999 set /a incrementer=100
if %testvalue% GTR 9999 set /a incrementer=500
if %testvalue% GTR 9999 set /a incrementer=1000
if %testvalue% GTR 25999 set /a incrementer=10000
if %testvalue% GTR 259999 set /a incrementer=100000
if %testvalue% GTR 2599999 set /a incrementer=1000000
if %testvalue% GTR 25999999 set /a incrementer=10000000
if %testvalue% GTR 259999999 set /a incrementer=100000000
if %testvalue% GTR 2066660000 set /a incrementer=1000000
if %testvalue% GTR 2137186000 set /a incrementer=100000
if %testvalue% GTR 2147406000 set /a incrementer=10000
if %testvalue% GTR 2147460000 set /a incrementer=1000
if %testvalue% GTR 2147482000 set /a incrementer=100
if %testvalue% GTR 2147483500 set /a incrementer=1
REM answer is 2147483647
if %testvalue% LEQ 100000000000000 goto :BiggestValueInBatchFinderDEMO-internal-loop
GoTo :EOF

:AddGetRegistryDEMO
REM this is the old way, see GetNamedKeyDEMO
REM Requires functions GetNamedKeyLookup, GetRegistryValue, EchoValue, AddRegistryDWORD

Call :GetNamedKeyLookup ThisPCicon[NewStart][CurrentUser]
Call :GetNamedKeyLookup ThisPCicon[NewStart][AllUser]
Call :GetNamedKeyLookup ThisPCicon[ClassicStart][CurrentUser]
Call :GetNamedKeyLookup ThisPCicon[ClassicStart][AllUser]

set _

Call :GetRegistryValue %ThisPCicon[NewStart][CurrentUser].Key% ThisPCicon[NewStart][CurrentUser]
Call :GetRegistryValue %ThisPCicon[NewStart][AllUser].Key% ThisPCicon[NewStart][AllUser]
Call :GetRegistryValue %ThisPCicon[ClassicStart][CurrentUser].Key% ThisPCicon[ClassicStart][CurrentUser]
Call :GetRegistryValue %ThisPCicon[ClassicStart][AllUser].Key% ThisPCicon[ClassicStart][AllUser]


Call :EchoValue ThisPCicon[NewStart][CurrentUser]
Call :EchoValue ThisPCicon[NewStart][AllUser]
Call :EchoValue ThisPCicon[ClassicStart][CurrentUser]
Call :EchoValue ThisPCicon[ClassicStart][AllUser]
echo.

Call :AddRegistryDWORD %ThisPCicon[NewStart][CurrentUser].Key% 1
Call :AddRegistryDWORD %ThisPCicon[NewStart][AllUser].Key% 0
Call :AddRegistryDWORD %ThisPCicon[ClassicStart][CurrentUser].Key% 0
Call :AddRegistryDWORD %ThisPCicon[ClassicStart][AllUser].Key% 0

Call :GetRegistryValue %ThisPCicon[NewStart][CurrentUser].Key% ThisPCicon[NewStart][CurrentUser]
Call :GetRegistryValue %ThisPCicon[NewStart][AllUser].Key% ThisPCicon[NewStart][AllUser]
Call :GetRegistryValue %ThisPCicon[ClassicStart][CurrentUser].Key% ThisPCicon[ClassicStart][CurrentUser]
Call :GetRegistryValue %ThisPCicon[ClassicStart][AllUser].Key% ThisPCicon[ClassicStart][AllUser]

Call :EchoValue ThisPCicon[NewStart][CurrentUser]
Call :EchoValue ThisPCicon[NewStart][AllUser]
Call :EchoValue ThisPCicon[ClassicStart][CurrentUser]
Call :EchoValue ThisPCicon[ClassicStart][AllUser]
echo.

Call :AddRegistryDWORD %ThisPCicon[NewStart][CurrentUser].Key% 0
Call :AddRegistryDWORD %ThisPCicon[NewStart][AllUser].Key% 1
Call :AddRegistryDWORD %ThisPCicon[ClassicStart][CurrentUser].Key% 0
Call :AddRegistryDWORD %ThisPCicon[ClassicStart][AllUser].Key% 0

Call :GetRegistryValue %ThisPCicon[NewStart][CurrentUser].Key% ThisPCicon[NewStart][CurrentUser]
Call :GetRegistryValue %ThisPCicon[NewStart][AllUser].Key% ThisPCicon[NewStart][AllUser]
Call :GetRegistryValue %ThisPCicon[ClassicStart][CurrentUser].Key% ThisPCicon[ClassicStart][CurrentUser]
Call :GetRegistryValue %ThisPCicon[ClassicStart][AllUser].Key% ThisPCicon[ClassicStart][AllUser]

Call :EchoValue ThisPCicon[NewStart][CurrentUser]
Call :EchoValue ThisPCicon[NewStart][AllUser]
Call :EchoValue ThisPCicon[ClassicStart][CurrentUser]
Call :EchoValue ThisPCicon[ClassicStart][AllUser]
echo.

Call :AddRegistryDWORD %ThisPCicon[NewStart][CurrentUser].Key% 0
Call :AddRegistryDWORD %ThisPCicon[NewStart][AllUser].Key% 0
Call :AddRegistryDWORD %ThisPCicon[ClassicStart][CurrentUser].Key% 1
Call :AddRegistryDWORD %ThisPCicon[ClassicStart][AllUser].Key% 0

Call :GetRegistryValue %ThisPCicon[NewStart][CurrentUser].Key% ThisPCicon[NewStart][CurrentUser]
Call :GetRegistryValue %ThisPCicon[NewStart][AllUser].Key% ThisPCicon[NewStart][AllUser]
Call :GetRegistryValue %ThisPCicon[ClassicStart][CurrentUser].Key% ThisPCicon[ClassicStart][CurrentUser]
Call :GetRegistryValue %ThisPCicon[ClassicStart][AllUser].Key% ThisPCicon[ClassicStart][AllUser]

Call :EchoValue ThisPCicon[NewStart][CurrentUser]
Call :EchoValue ThisPCicon[NewStart][AllUser]
Call :EchoValue ThisPCicon[ClassicStart][CurrentUser]
Call :EchoValue ThisPCicon[ClassicStart][AllUser]
echo.

Call :AddRegistryDWORD %ThisPCicon[NewStart][CurrentUser].Key% 0
Call :AddRegistryDWORD %ThisPCicon[NewStart][AllUser].Key% 0
Call :AddRegistryDWORD %ThisPCicon[ClassicStart][CurrentUser].Key% 0
Call :AddRegistryDWORD %ThisPCicon[ClassicStart][AllUser].Key% 1

Call :GetRegistryValue %ThisPCicon[NewStart][CurrentUser].Key% ThisPCicon[NewStart][CurrentUser]
Call :GetRegistryValue %ThisPCicon[NewStart][AllUser].Key% ThisPCicon[NewStart][AllUser]
Call :GetRegistryValue %ThisPCicon[ClassicStart][CurrentUser].Key% ThisPCicon[ClassicStart][CurrentUser]
Call :GetRegistryValue %ThisPCicon[ClassicStart][AllUser].Key% ThisPCicon[ClassicStart][AllUser]

Call :EchoValue ThisPCicon[NewStart][CurrentUser]
Call :EchoValue ThisPCicon[NewStart][AllUser]
Call :EchoValue ThisPCicon[ClassicStart][CurrentUser]
Call :EchoValue ThisPCicon[ClassicStart][AllUser]
echo.

Call :AddRegistryDWORD %ThisPCicon[NewStart][CurrentUser].Key% 0
Call :AddRegistryDWORD %ThisPCicon[NewStart][AllUser].Key% 0
Call :AddRegistryDWORD %ThisPCicon[ClassicStart][CurrentUser].Key% 0
Call :AddRegistryDWORD %ThisPCicon[ClassicStart][AllUser].Key% 0

Call :GetRegistryValue %ThisPCicon[NewStart][CurrentUser].Key% ThisPCicon[NewStart][CurrentUser]
Call :GetRegistryValue %ThisPCicon[NewStart][AllUser].Key% ThisPCicon[NewStart][AllUser]
Call :GetRegistryValue %ThisPCicon[ClassicStart][CurrentUser].Key% ThisPCicon[ClassicStart][CurrentUser]
Call :GetRegistryValue %ThisPCicon[ClassicStart][AllUser].Key% ThisPCicon[ClassicStart][AllUser]

Call :EchoValue ThisPCicon[NewStart][CurrentUser]
Call :EchoValue ThisPCicon[NewStart][AllUser]
Call :EchoValue ThisPCicon[ClassicStart][CurrentUser]
Call :EchoValue ThisPCicon[ClassicStart][AllUser]

pause 

GoTo :EOF

:AddRegistryDWORDValuesTEST
REM just a test to see what DWORD values really look like

Call :AddRegistryDWORD %ThisPCicon[NewStart][CurrentUser].Key% 0
Call :GetRegistryValue %ThisPCicon[NewStart][CurrentUser].Key% ThisPCicon[NewStart][CurrentUser]
Call :EchoValue ThisPCicon[NewStart][CurrentUser]

Call :AddRegistryDWORD %ThisPCicon[NewStart][CurrentUser].Key% 1
Call :GetRegistryValue %ThisPCicon[NewStart][CurrentUser].Key% ThisPCicon[NewStart][CurrentUser]
Call :EchoValue ThisPCicon[NewStart][CurrentUser]

Call :AddRegistryDWORD %ThisPCicon[NewStart][CurrentUser].Key% 2
Call :GetRegistryValue %ThisPCicon[NewStart][CurrentUser].Key% ThisPCicon[NewStart][CurrentUser]
Call :EchoValue ThisPCicon[NewStart][CurrentUser]

Call :AddRegistryDWORD %ThisPCicon[NewStart][CurrentUser].Key% 9
Call :GetRegistryValue %ThisPCicon[NewStart][CurrentUser].Key% ThisPCicon[NewStart][CurrentUser]
Call :EchoValue ThisPCicon[NewStart][CurrentUser]

Call :AddRegistryDWORD %ThisPCicon[NewStart][CurrentUser].Key% 10
Call :GetRegistryValue %ThisPCicon[NewStart][CurrentUser].Key% ThisPCicon[NewStart][CurrentUser]
Call :EchoValue ThisPCicon[NewStart][CurrentUser]

Call :AddRegistryDWORD %ThisPCicon[NewStart][CurrentUser].Key% 11
Call :GetRegistryValue %ThisPCicon[NewStart][CurrentUser].Key% ThisPCicon[NewStart][CurrentUser]
Call :EchoValue ThisPCicon[NewStart][CurrentUser]

Call :AddRegistryDWORD %ThisPCicon[NewStart][CurrentUser].Key% 15
Call :GetRegistryValue %ThisPCicon[NewStart][CurrentUser].Key% ThisPCicon[NewStart][CurrentUser]
Call :EchoValue ThisPCicon[NewStart][CurrentUser]

Call :AddRegistryDWORD %ThisPCicon[NewStart][CurrentUser].Key% 16
Call :GetRegistryValue %ThisPCicon[NewStart][CurrentUser].Key% ThisPCicon[NewStart][CurrentUser]
Call :EchoValue ThisPCicon[NewStart][CurrentUser]

Call :AddRegistryDWORD %ThisPCicon[NewStart][CurrentUser].Key% 50
Call :GetRegistryValue %ThisPCicon[NewStart][CurrentUser].Key% ThisPCicon[NewStart][CurrentUser]
Call :EchoValue ThisPCicon[NewStart][CurrentUser]

Call :AddRegistryDWORD %ThisPCicon[NewStart][CurrentUser].Key% 100
Call :GetRegistryValue %ThisPCicon[NewStart][CurrentUser].Key% ThisPCicon[NewStart][CurrentUser]
Call :EchoValue ThisPCicon[NewStart][CurrentUser]

Call :AddRegistryDWORD %ThisPCicon[NewStart][CurrentUser].Key% 0
Call :GetRegistryValue %ThisPCicon[NewStart][CurrentUser].Key% ThisPCicon[NewStart][CurrentUser]
Call :EchoValue ThisPCicon[NewStart][CurrentUser]

GoTo :EOF

:GetNamedKeyDEMO

REM Call :ClearVariablesByPrefix ThisPCicon[NewStart][CurrentUser]
REM Call :ClearVariablesByPrefix ThisPCicon[NewStart][AllUser]
REM Call :ClearVariablesByPrefix ThisPCicon[ClassicStart][CurrentUser]
REM Call :ClearVariablesByPrefix ThisPCicon[NewStart][CurrentUser]

set myval[0]=ThisPCicon[NewStart][CurrentUser]
set myval[1]=ThisPCicon[NewStart][AllUser]
set myval[2]=ThisPCicon[ClassicStart][CurrentUser]
set myval[3]=ThisPCicon[ClassicStart][AllUser]

Call :GetNamedKey ThisPCicon[NewStart][CurrentUser] OutputVar2
echo OutputVar2 %OutputVar2%

for /l %%a in (0,1,3) do Call :ClearVariablesByPrefix %%myval[%%a]%% 

REM for /l %%a in (0,1,3) do (
  REM Call :GetNamedKey %%myval[%%a]%% 
  REM call echo %%myval[%%a]%%'s Named Value is = %%%myval[%%a]%%.CurrentNamedValue%
REM )

set /a index=0
:GetNamedKeyDEMO-internal-loop
  REM call echo Call :GetNamedKey %%myval[%index%]%% OutputVar
  echo.
  Call :GetNamedKey %%myval[%index%]%% OutputVar
  call echo %%myval[%index%]%%'s Named Value is = %OutputVar% 
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%myval[%%%index%%%]%%.CurrentNamedValue%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%myval[%%%index%%%]%%%.CurrentNamedValue%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%myval[%%%index%%%]%%%%.CurrentNamedValue%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%myval[%%%index%%%]%%%%%.CurrentNamedValue%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%%%index%%%]%%%%%%.CurrentNamedValue%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%myval[%%%index%%%]%%%%%%%.CurrentNamedValue%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%myval[%%%index%%%]%%%%%%%%.CurrentNamedValue%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%%myval[%%%index%%%]%%%%%%%%%.CurrentNamedValue%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%%%myval[%%%index%%%]%%%%%%%%%%.CurrentNamedValue%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%%%%myval[%%%index%%%]%%%%%%%%%%%.CurrentNamedValue%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%%%%%myval[%%%index%%%]%%%%%%%%%%%%.CurrentNamedValue%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%myval[%%%index%%%]%.CurrentNamedValue%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%myval[%%%index%%%]%%.CurrentNamedValue%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%myval[%%%index%%%]%%%.CurrentNamedValue%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%myval[%%%index%%%]%%%%.CurrentNamedValue%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%%%index%%%]%%%%%.CurrentNamedValue%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%myval[%%%index%%%]%%%%%%.CurrentNamedValue%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%myval[%%%index%%%]%%%%%%%.CurrentNamedValue%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%%myval[%%%index%%%]%%%%%%%%.CurrentNamedValue%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%%%myval[%%%index%%%]%%%%%%%%%.CurrentNamedValue%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%%%%myval[%%%index%%%]%%%%%%%%%%.CurrentNamedValue%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%%%%%myval[%%%index%%%]%%%%%%%%%%%.CurrentNamedValue%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%myval[%%%index%%%].CurrentNamedValue%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%myval[%%%index%%%]%.CurrentNamedValue%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%myval[%%%index%%%]%%.CurrentNamedValue%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%myval[%%%index%%%]%%%.CurrentNamedValue%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%%%index%%%]%%%%.CurrentNamedValue%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%myval[%%%index%%%]%%%%%.CurrentNamedValue%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%myval[%%%index%%%]%%%%%%.CurrentNamedValue%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%%myval[%%%index%%%]%%%%%%%.CurrentNamedValue%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%%%myval[%%%index%%%]%%%%%%%%.CurrentNamedValue%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%%%%myval[%%%index%%%]%%%%%%%%%.CurrentNamedValue%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%%%%%myval[%%%index%%%]%%%%%%%%%%.CurrentNamedValue%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%myval[%%%index%%%].CurrentNamedValue%%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%myval[%%%index%%%].CurrentNamedValue%%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%myval[%%%index%%%]%.CurrentNamedValue%%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%myval[%%%index%%%]%%.CurrentNamedValue%%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%%%index%%%]%%%.CurrentNamedValue%%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%myval[%%%index%%%]%%%%.CurrentNamedValue%%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%myval[%%%index%%%]%%%%%.CurrentNamedValue%%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%%myval[%%%index%%%]%%%%%%.CurrentNamedValue%%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%%%myval[%%%index%%%]%%%%%%%.CurrentNamedValue%%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%%%%myval[%%%index%%%]%%%%%%%%.CurrentNamedValue%%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%%%%%myval[%%%index%%%]%%%%%%%%%.CurrentNamedValue%%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = myval[%index%].CurrentNamedValue
  REM call echo + %%myval[%index%]%%'s Named Value is = %myval[%index%]%.CurrentNamedValue
  REM call echo + %%myval[%index%]%%'s Named Value is = %myval[%%index%%]%.CurrentNamedValue
  REM call echo + %%myval[%index%]%%'s Named Value is = %%myval[%%index%%]%%.CurrentNamedValue
  REM call echo + %%myval[%index%]%%'s Named Value is = %%myval[%index%]%%.CurrentNamedValue
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%myval[%index%]%%.CurrentNamedValue%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%myval[%index%]%%.CurrentNamedValue%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%myval[%index%]%%.CurrentNamedValue%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%myval[%index%]%%.CurrentNamedValue%%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%index%]%%.CurrentNamedValue%%%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%myval[%index%]%%.CurrentNamedValue%%%%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%myval[%index%]%%.CurrentNamedValue%%%%%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%%myval[%index%]%%.CurrentNamedValue%%%%%%%%
  REM call call echo + %%myval[%index%]%%'s Named Value is = myval[%index%].CurrentNamedValue
  REM call call echo + %%myval[%index%]%%'s Named Value is = %myval[%index%]%.CurrentNamedValue
  REM call call echo + %%myval[%index%]%%'s Named Value is = %myval[%%index%%]%.CurrentNamedValue
  REM call call echo + %%myval[%index%]%%'s Named Value is = %%myval[%%index%%]%%.CurrentNamedValue
  REM call call echo + %%myval[%index%]%%'s Named Value is = %%myval[%index%]%%.CurrentNamedValue
  REM call call echo + %%myval[%index%]%%'s Named Value is = %%%myval[%index%]%%.CurrentNamedValue%
  REM call call echo + %%myval[%index%]%%'s Named Value is = %%%%myval[%index%]%%.CurrentNamedValue%%
  REM call call echo + %%myval[%index%]%%'s Named Value is = %%%%%myval[%index%]%%.CurrentNamedValue%%%
  REM call call echo +1 %%myval[%index%]%%'s Named Value is = %%%%%%myval[%index%]%%.CurrentNamedValue%%%%
  REM call call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%index%]%%.CurrentNamedValue%%%%%
  REM call call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%myval[%index%]%%.CurrentNamedValue%%%%%%
  REM call call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%myval[%index%]%%.CurrentNamedValue%%%%%%%
  REM call call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%%%myval[%index%]%%.CurrentNamedValue%%%%%%%%
   REM echo 0 %%myval[%index%]%%'s Named Value is = %%myval[%index%]%%.CurrentNamedValue
   REM echo 0 %%myval[%index%]%%'s Named Value is = %%%myval[%index%]%%.CurrentNamedValue%
   REM echo 0 %%myval[%index%]%%'s Named Value is = %%%%myval[%index%]%%.CurrentNamedValue%%
   REM echo 0 %%myval[%index%]%%'s Named Value is = %%%%%myval[%index%]%%.CurrentNamedValue%%%
   REM echo 0 %%myval[%index%]%%'s Named Value is = %%%%%%myval[%index%]%%.CurrentNamedValue%%%%
   REM echo 0 %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%index%]%%.CurrentNamedValue%%%%%
   REM echo 0 %%myval[%index%]%%'s Named Value is = %%%%%%%%myval[%index%]%%.CurrentNamedValue%%%%%%
   REM echo - %%myval[%index%]%%'s Named Value is = %%myval[%%index%%]%%.CurrentNamedValue
   REM echo - %%myval[%index%]%%'s Named Value is = %%%myval[%%index%%]%%.CurrentNamedValue%
   REM echo - %%myval[%index%]%%'s Named Value is = %%%%myval[%%index%%]%%.CurrentNamedValue%%
   REM echo - %%myval[%index%]%%'s Named Value is = %%%%%myval[%%index%%]%%.CurrentNamedValue%%%
   REM echo - %%myval[%index%]%%'s Named Value is = %%%%%%myval[%%index%%]%%.CurrentNamedValue%%%%
   REM echo - %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%%index%%]%%.CurrentNamedValue%%%%%
   REM echo - %%myval[%index%]%%'s Named Value is = %%%%%%%%myval[%%index%%]%%.CurrentNamedValue%%%%%%
   REM echo + %%myval[%index%]%%'s Named Value is = %%myval[%%%index%%%]%%.CurrentNamedValue
   REM echo + %%myval[%index%]%%'s Named Value is = %%%myval[%%%index%%%]%%.CurrentNamedValue%
   REM echo + %%myval[%index%]%%'s Named Value is = %%%%myval[%%%index%%%]%%.CurrentNamedValue%%
   REM echo + %%myval[%index%]%%'s Named Value is = %%%%%myval[%%%index%%%]%%.CurrentNamedValue%%%
   REM echo + %%myval[%index%]%%'s Named Value is = %%%%%%myval[%%%index%%%]%%.CurrentNamedValue%%%%
   REM echo + %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%%%index%%%]%%.CurrentNamedValue%%%%%
   REM echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%myval[%%%index%%%]%%.CurrentNamedValue%%%%%%
  REM echo 1 %%myval[%index%]%%'s Named Value is = myval[%index%].CurrentNamedValue
  REM echo 2 %%myval[%index%]%%'s Named Value is = %myval[%index%].CurrentNamedValue%
  REM echo 3 %%myval[%index%]%%'s Named Value is = %%myval[%index%].CurrentNamedValue%%
  REM echo 4 %%myval[%index%]%%'s Named Value is = %%%myval[%index%].CurrentNamedValue%%%
  REM echo 5 %%myval[%index%]%%'s Named Value is = %%%%myval[%index%].CurrentNamedValue%%%%
  REM echo 6 %%myval[%index%]%%'s Named Value is = %%%%%myval[%index%].CurrentNamedValue%%%%%
  REM echo 7 %%myval[%index%]%%'s Named Value is = %%%%%%myval[%index%].CurrentNamedValue%%%%%%
  REM echo 8 %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%index%].CurrentNamedValue%%%%%%%
  REM echo 9 %%myval[%index%]%%'s Named Value is = myval[%%index%%].CurrentNamedValue
  REM echo 0 %%myval[%index%]%%'s Named Value is = %myval[%%index%%].CurrentNamedValue%
  REM echo 1 %%myval[%index%]%%'s Named Value is = %%myval[%%index%%].CurrentNamedValue%%
  REM echo 2 %%myval[%index%]%%'s Named Value is = %%%myval[%%index%%].CurrentNamedValue%%%
  REM echo 3 %%myval[%index%]%%'s Named Value is = %%%%myval[%%index%%].CurrentNamedValue%%%%
  REM echo 4 %%myval[%index%]%%'s Named Value is = %%%%%myval[%%index%%].CurrentNamedValue%%%%%
  REM echo 5 %%myval[%index%]%%'s Named Value is = %%%%%%myval[%%index%%].CurrentNamedValue%%%%%%
  REM echo 6 %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%%index%%].CurrentNamedValue%%%%%%%
  REM echo 7 %%myval[%index%]%%'s Named Value is = myval[%%%index%%%].CurrentNamedValue
  REM echo 8 %%myval[%index%]%%'s Named Value is = %myval[%%%index%%%].CurrentNamedValue%
  REM echo 9 %%myval[%index%]%%'s Named Value is = %%myval[%%%index%%%].CurrentNamedValue%%
  REM echo 0 %%myval[%index%]%%'s Named Value is = %%%myval[%%%index%%%].CurrentNamedValue%%%
  REM echo 1 %%myval[%index%]%%'s Named Value is = %%%%myval[%%%index%%%].CurrentNamedValue%%%%
  REM echo 2 %%myval[%index%]%%'s Named Value is = %%%%%myval[%%%index%%%].CurrentNamedValue%%%%%
  REM echo 3 %%myval[%index%]%%'s Named Value is = %%%%%%myval[%%%index%%%].CurrentNamedValue%%%%%%
  REM echo 4 %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%%%index%%%].CurrentNamedValue%%%%%%%
  REM call echo 0 %%myval[%index%]%%'s Named Value is = %%myval[%index%]%%.CurrentNamedValue
  REM call echo 0 %%myval[%index%]%%'s Named Value is = %%%myval[%index%]%%.CurrentNamedValue%
  REM call echo 0 %%myval[%index%]%%'s Named Value is = %%%%myval[%index%]%%.CurrentNamedValue%%
  REM call echo 0 %%myval[%index%]%%'s Named Value is = %%%%%myval[%index%]%%.CurrentNamedValue%%%
  REM call echo 0 %%myval[%index%]%%'s Named Value is = %%%%%%myval[%index%]%%.CurrentNamedValue%%%%
  REM call echo 0 %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%index%]%%.CurrentNamedValue%%%%%
  REM call echo 0 %%myval[%index%]%%'s Named Value is = %%%%%%%%myval[%index%]%%.CurrentNamedValue%%%%%%
  REM call echo - %%myval[%index%]%%'s Named Value is = %%myval[%%index%%]%%.CurrentNamedValue
  REM call echo - %%myval[%index%]%%'s Named Value is = %%%myval[%%index%%]%%.CurrentNamedValue%
  REM call echo - %%myval[%index%]%%'s Named Value is = %%%%myval[%%index%%]%%.CurrentNamedValue%%
  REM call echo - %%myval[%index%]%%'s Named Value is = %%%%%myval[%%index%%]%%.CurrentNamedValue%%%
  REM call echo - %%myval[%index%]%%'s Named Value is = %%%%%%myval[%%index%%]%%.CurrentNamedValue%%%%
  REM call echo - %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%%index%%]%%.CurrentNamedValue%%%%%
  REM call echo - %%myval[%index%]%%'s Named Value is = %%%%%%%%myval[%%index%%]%%.CurrentNamedValue%%%%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%myval[%%%index%%%]%%.CurrentNamedValue
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%myval[%%%index%%%]%%.CurrentNamedValue%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%myval[%%%index%%%]%%.CurrentNamedValue%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%myval[%%%index%%%]%%.CurrentNamedValue%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%myval[%%%index%%%]%%.CurrentNamedValue%%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%%%index%%%]%%.CurrentNamedValue%%%%%
  REM call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%myval[%%%index%%%]%%.CurrentNamedValue%%%%%%
  REM call echo 1 %%myval[%index%]%%'s Named Value is = myval[%index%].CurrentNamedValue
  REM call echo 2 %%myval[%index%]%%'s Named Value is = %myval[%index%].CurrentNamedValue%
  REM call echo 3 %%myval[%index%]%%'s Named Value is = %%myval[%index%].CurrentNamedValue%%
  REM call echo 4 %%myval[%index%]%%'s Named Value is = %%%myval[%index%].CurrentNamedValue%%%
  REM call echo 5 %%myval[%index%]%%'s Named Value is = %%%%myval[%index%].CurrentNamedValue%%%%
  REM call echo 6 %%myval[%index%]%%'s Named Value is = %%%%%myval[%index%].CurrentNamedValue%%%%%
  REM call echo 7 %%myval[%index%]%%'s Named Value is = %%%%%%myval[%index%].CurrentNamedValue%%%%%%
  REM call echo 8 %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%index%].CurrentNamedValue%%%%%%%
  REM call echo 9 %%myval[%index%]%%'s Named Value is = myval[%%index%%].CurrentNamedValue
  REM call echo 0 %%myval[%index%]%%'s Named Value is = %myval[%%index%%].CurrentNamedValue%
  REM call echo 1 %%myval[%index%]%%'s Named Value is = %%myval[%%index%%].CurrentNamedValue%%
  REM call echo 2 %%myval[%index%]%%'s Named Value is = %%%myval[%%index%%].CurrentNamedValue%%%
  REM call echo 3 %%myval[%index%]%%'s Named Value is = %%%%myval[%%index%%].CurrentNamedValue%%%%
  REM call echo 4 %%myval[%index%]%%'s Named Value is = %%%%%myval[%%index%%].CurrentNamedValue%%%%%
  REM call echo 5 %%myval[%index%]%%'s Named Value is = %%%%%%myval[%%index%%].CurrentNamedValue%%%%%%
  REM call echo 6 %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%%index%%].CurrentNamedValue%%%%%%%
  REM call echo 7 %%myval[%index%]%%'s Named Value is = myval[%%%index%%%].CurrentNamedValue
  REM call echo 8 %%myval[%index%]%%'s Named Value is = %myval[%%%index%%%].CurrentNamedValue%
  REM call echo 9 %%myval[%index%]%%'s Named Value is = %%myval[%%%index%%%].CurrentNamedValue%%
  REM call echo 0 %%myval[%index%]%%'s Named Value is = %%%myval[%%%index%%%].CurrentNamedValue%%%
  REM call echo 1 %%myval[%index%]%%'s Named Value is = %%%%myval[%%%index%%%].CurrentNamedValue%%%%
  REM call echo 2 %%myval[%index%]%%'s Named Value is = %%%%%myval[%%%index%%%].CurrentNamedValue%%%%%
  REM call echo 3 %%myval[%index%]%%'s Named Value is = %%%%%%myval[%%%index%%%].CurrentNamedValue%%%%%%
  REM call echo 4 %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%%%index%%%].CurrentNamedValue%%%%%%%
  REM call echo 0 %%myval[%index%]%%'s Named Value is = %%myval[%index%]%%.CurrentNamedValue
  REM call echo 0 %%myval[%index%]%%'s Named Value is = %%%myval[%index%]%%.CurrentNamedValue%
  REM call echo 0 %%myval[%index%]%%'s Named Value is = %%%%myval[%index%]%%.CurrentNamedValue%%
  REM call echo 0 %%myval[%index%]%%'s Named Value is = %%%%%myval[%index%]%%.CurrentNamedValue%%%
  REM call echo 0 %%myval[%index%]%%'s Named Value is = %%%%%%myval[%index%]%%.CurrentNamedValue%%%%
  REM call echo 0 %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%index%]%%.CurrentNamedValue%%%%%
  REM call echo 0 %%myval[%index%]%%'s Named Value is = %%%%%%%%myval[%index%]%%.CurrentNamedValue%%%%%%
  REM call call echo - %%myval[%index%]%%'s Named Value is = %%myval[%%index%%]%%.CurrentNamedValue
  REM call call echo - %%myval[%index%]%%'s Named Value is = %%%myval[%%index%%]%%.CurrentNamedValue%
  REM call call echo - %%myval[%index%]%%'s Named Value is = %%%%myval[%%index%%]%%.CurrentNamedValue%%
  REM call call echo - %%myval[%index%]%%'s Named Value is = %%%%%myval[%%index%%]%%.CurrentNamedValue%%%
  REM call call echo - %%myval[%index%]%%'s Named Value is = %%%%%%myval[%%index%%]%%.CurrentNamedValue%%%%
  REM call call echo - %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%%index%%]%%.CurrentNamedValue%%%%%
  REM call call echo - %%myval[%index%]%%'s Named Value is = %%%%%%%%myval[%%index%%]%%.CurrentNamedValue%%%%%%
  REM call call echo + %%myval[%index%]%%'s Named Value is = %%myval[%%%index%%%]%%.CurrentNamedValue
  REM call call echo + %%myval[%index%]%%'s Named Value is = %%%%myval[%%%index%%%]%%.CurrentNamedValue%%
  REM call call echo + %%myval[%index%]%%'s Named Value is = %%%%%myval[%%%index%%%]%%.CurrentNamedValue%%%
  REM call call echo + %%myval[%index%]%%'s Named Value is = %%%%%%myval[%%%index%%%]%%.CurrentNamedValue%%%%
  REM call call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%%%index%%%]%%.CurrentNamedValue%%%%%
  REM call call echo + %%myval[%index%]%%'s Named Value is = %%%%%%%%myval[%%%index%%%]%%.CurrentNamedValue%%%%%%
  REM call call echo 1 %%myval[%index%]%%'s Named Value is = myval[%index%].CurrentNamedValue
  REM call call echo 2 %%myval[%index%]%%'s Named Value is = %myval[%index%].CurrentNamedValue%
  REM call call echo 3 %%myval[%index%]%%'s Named Value is = %%myval[%index%].CurrentNamedValue%%
  REM call call echo 4 %%myval[%index%]%%'s Named Value is = %%%myval[%index%].CurrentNamedValue%%%
  REM call call echo 5 %%myval[%index%]%%'s Named Value is = %%%%myval[%index%].CurrentNamedValue%%%%
  REM call call echo 6 %%myval[%index%]%%'s Named Value is = %%%%%myval[%index%].CurrentNamedValue%%%%%
  REM call call echo 7 %%myval[%index%]%%'s Named Value is = %%%%%%myval[%index%].CurrentNamedValue%%%%%%
  REM call call echo 8 %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%index%].CurrentNamedValue%%%%%%%
  REM call call echo 9 %%myval[%index%]%%'s Named Value is = myval[%%index%%].CurrentNamedValue
  REM call call echo 0 %%myval[%index%]%%'s Named Value is = %myval[%%index%%].CurrentNamedValue%
  REM call call echo 1 %%myval[%index%]%%'s Named Value is = %%myval[%%index%%].CurrentNamedValue%%
  REM call call echo 2 %%myval[%index%]%%'s Named Value is = %%%myval[%%index%%].CurrentNamedValue%%%
  REM call call echo 3 %%myval[%index%]%%'s Named Value is = %%%%myval[%%index%%].CurrentNamedValue%%%%
  REM call call echo 4 %%myval[%index%]%%'s Named Value is = %%%%%myval[%%index%%].CurrentNamedValue%%%%%
  REM call call echo 5 %%myval[%index%]%%'s Named Value is = %%%%%%myval[%%index%%].CurrentNamedValue%%%%%%
  REM call call echo 6 %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%%index%%].CurrentNamedValue%%%%%%%
  REM call call echo 7 %%myval[%index%]%%'s Named Value is = myval[%%%index%%%].CurrentNamedValue
  REM call call echo 8 %%myval[%index%]%%'s Named Value is = %myval[%%%index%%%].CurrentNamedValue%
  REM call call echo 9 %%myval[%index%]%%'s Named Value is = %%myval[%%%index%%%].CurrentNamedValue%%
  REM call call echo 0 %%myval[%index%]%%'s Named Value is = %%%myval[%%%index%%%].CurrentNamedValue%%%
  REM call call echo 1 %%myval[%index%]%%'s Named Value is = %%%%myval[%%%index%%%].CurrentNamedValue%%%%
  REM call call echo 2 %%myval[%index%]%%'s Named Value is = %%%%%myval[%%%index%%%].CurrentNamedValue%%%%%
  REM call call echo 3 %%myval[%index%]%%'s Named Value is = %%%%%%myval[%%%index%%%].CurrentNamedValue%%%%%%
  REM call call echo 4 %%myval[%index%]%%'s Named Value is = %%%%%%%myval[%%%index%%%].CurrentNamedValue%%%%%%%
  set /a index+=1
if %index% LEQ 3 GoTo :GetNamedKeyDEMO-internal-loop

echo ThisPCicon[NewStart][CurrentUser] %ThisPCicon[NewStart][CurrentUser].CurrentNamedValue%
echo ThisPCicon[NewStart][AllUser] %ThisPCicon[NewStart][AllUser].CurrentNamedValue%
echo ThisPCicon[ClassicStart][CurrentUser] %ThisPCicon[ClassicStart][CurrentUser].CurrentNamedValue%
echo ThisPCicon[ClassicStart][AllUser] %ThisPCicon[ClassicStart][AllUser].CurrentNamedValue%

REM Call :GetNamedKey ThisPCicon[NewStart][CurrentUser] OutputVar
REM echo ThisPCicon[NewStart][CurrentUser] Named Value %OutputVar%
REM Call :GetNamedKey ThisPCicon[NewStart][AllUser]
REM Call :GetNamedKey ThisPCicon[ClassicStart][CurrentUser]
REM Call :GetNamedKey ThisPCicon[ClassicStart][AllUser]

GoTo :EOF


:CopyValuesFromArray-DEMO
Call :ClearVariablesByPrefix _CopyValuesFromArray
Call :ClearVariablesByPrefix mytestarray
Call :ClearVariablesByPrefix mytestoutputarray
Call :CreateTestArray mytestarray 4 NOSUFFIX .suffixA .suffixB .suffixC

REM echo.
REM echo Inserted new element 2 (998) and 3 (999)
set "NewElement=999"
set "NewElement.suffixA=999A"
set "NewElement.suffixB=999B"
set "NewElement.suffixC=999C"
Call :AddArrayElement NewElement mytestarray 2
set "NewElement=998"
set "NewElement.suffixA=998A"
set "NewElement.suffixB=998B"
set "NewElement.suffixC=998C"
Call :AddArrayElement NewElement mytestarray 2
REM set mytestarray
Call :ClearVariablesByPrefix NewElement

REM GoTo :CopyValuesFromArray-DEMO-skip

echo.
echo Contents of mytestarray
echo.
set mytestarray

REM GoTo :CopyValuesFromArray-DEMO-skip

echo.
echo Searching "NOSUFFIX"  for all the search terms, there are no matches 
echo.
REM set "_CopyValuesFromArray_SearchSuffix=NOSUFFIX"
REM set "_CopyValuesFromArray_OutputSuffix=NOSUFFIX .suffixA .suffixB"
echo Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3
Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3
echo.
echo Contents of mytestoutputarray
echo.
set mytestoutputarray
Call :ClearVariablesByPrefix mytestoutputarray
Call :ClearVariablesByPrefix _CopyValuesFromArray


REM :CopyValuesFromArray-DEMO-skip
REM GoTo :EOF

echo.
echo Searching "NOSUFFIX" for all the search terms, now including 3-.suffixB, but no match
echo because we are only checking in the suffix "NOSUFFIX", in other words mytestarray[x] straight
echo.
REM set "_CopyValuesFromArray_SearchSuffix=NOSUFFIX"
REM set "_CopyValuesFromArray_OutputSuffix=NOSUFFIX .suffixA .suffixB"
echo Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 3-.suffixB
Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 3-.suffixB
echo.
echo Contents of mytestoutputarray
echo.
set mytestoutputarray
Call :ClearVariablesByPrefix mytestoutputarray
Call :ClearVariablesByPrefix _CopyValuesFromArray


REM :CopyValuesFromArray-DEMO-skip
REM GoTo :EOF

echo.
echo Searching in ".suffixB" for all the search terms, now including 3-.suffixB, 
echo there is a match of element 3
echo.
set "_CopyValuesFromArray_SearchSuffix=.suffixB"
REM set "_CopyValuesFromArray_OutputSuffix=NOSUFFIX .suffixA .suffixB"
echo Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 3-.suffixB
Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 3-.suffixB
echo.
echo Contents of mytestoutputarray
echo.
set mytestoutputarray
Call :ClearVariablesByPrefix mytestoutputarray
Call :ClearVariablesByPrefix _CopyValuesFromArray

REM :CopyValuesFromArray-DEMO-skip
REM GoTo :EOF

echo.
echo Searching in ".suffixB" for all the search terms, none of the search terms match
echo also, the searchterm word2 is now an array filled with search terms
echo none of these searchterms have a match in the array, there are no results
echo.
set "word2[3]=bla"
set "word2[4]=bli"
set "word2[5]=blo"
set "word2[6]=blou"
set /a word2.lbound=3
set /a word2.ubound=6
set "_CopyValuesFromArray_SearchSuffix=.suffixB"
REM set "_CopyValuesFromArray_OutputSuffix=NOSUFFIX .suffixA .suffixB"
echo Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 
Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 
echo.
echo Contents of mytestoutputarray
echo.
set mytestoutputarray
Call :ClearVariablesByPrefix mytestoutputarray
Call :ClearVariablesByPrefix _CopyValuesFromArray
Call :ClearVariablesByPrefix word2


REM :CopyValuesFromArray-DEMO-skip
REM GoTo :EOF


echo.
echo Searching in ".suffixB" for all the search terms, none of the search terms match
echo also, the searchterm word2 is now an array filled with search terms
echo one of the search terms in array "word2" is a match to element 3 "3-.suffixB"
echo.
set "word2[3]=bla"
set "word2[4]=bli"
set "word2[5]=blo"
set "word2[6]=3-.suffixB"
set "word2[7]=blou"
set /a word2.lbound=3
set /a word2.ubound=7
set "_CopyValuesFromArray_SearchSuffix=.suffixB"
REM set "_CopyValuesFromArray_OutputSuffix=NOSUFFIX .suffixA .suffixB"
echo Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 
Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 
echo.
echo Contents of mytestoutputarray
echo.
set mytestoutputarray
Call :ClearVariablesByPrefix mytestoutputarray
Call :ClearVariablesByPrefix _CopyValuesFromArray
Call :ClearVariablesByPrefix word2


REM :CopyValuesFromArray-DEMO-skip
REM GoTo :EOF


echo.
echo Searching in ".suffixA" for all the search terms, none of the search terms match
echo also, the searchterm word2 is now an array filled with search terms
echo none of the search terms match in .suffixA there are no results
echo.
set "word2[3]=bla"
set "word2[4]=bli"
set "word2[5]=blo"
set "word2[6]=3-.suffixB"
set "word2[7]=blou"
set /a word2.lbound=3
set /a word2.ubound=7
set "_CopyValuesFromArray_SearchSuffix=.suffixA"
REM set "_CopyValuesFromArray_OutputSuffix=NOSUFFIX .suffixA .suffixB"
echo Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 
Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 
echo.
echo Contents of mytestoutputarray
echo.
set mytestoutputarray
Call :ClearVariablesByPrefix mytestoutputarray
Call :ClearVariablesByPrefix _CopyValuesFromArray
Call :ClearVariablesByPrefix word2



REM :CopyValuesFromArray-DEMO-skip
REM GoTo :EOF


echo.
echo Searching in ".suffixA" and in ".suffixB" for all the search terms, 
echo also, the searchterm word2 is now an array filled with search terms
echo There are two matches, 3rd element in suffixB and 4th element in suffixA
echo one of the match is from the word2 array, the order is a direct search word
echo.
set "word2[3]=bla"
set "word2[4]=bli"
set "word2[5]=blo"
set "word2[6]=FFFFF"
set "word2[7]=blou"
set "word2[8]=ble"
set "word2[9]=4-.suffixA"
set /a word2.lbound=3
set /a word2.ubound=9
set "_CopyValuesFromArray_SearchSuffix=.suffixA .suffixB"
REM set "_CopyValuesFromArray_OutputSuffix=NOSUFFIX .suffixA .suffixB"
echo Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 
Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 3-.suffixB
echo.
echo Contents of mytestoutputarray
echo.
set mytestoutputarray
Call :ClearVariablesByPrefix mytestoutputarray
Call :ClearVariablesByPrefix _CopyValuesFromArray
Call :ClearVariablesByPrefix word2


REM :CopyValuesFromArray-DEMO-skip
REM GoTo :EOF


echo.
echo Searching in ".suffixA" and in ".suffixB" for all the search terms, 
echo also, the searchterm word2 is now an array filled with search terms
echo There are two matches, 3rd element in suffixB and 4th element in suffixA
echo one of the match is from the word2 array, the order is a direct search word
echo also partial matching is enabled and the search term 998 is added to the list
echo in total this matches element 2 4 and 5
echo.
set "word2[3]=bla"
set "word2[4]=bli"
set "word2[5]=blo"
set "word2[6]=FFFFF"
set "word2[7]=blou"
set "word2[8]=998"
set "word2[9]=ble"
set "word2[10]=4-.suffixA"
set /a word2.lbound=3
set /a word2.ubound=10
set "_CopyValuesFromArray_PartialMatch=true"
set "_CopyValuesFromArray_SearchSuffix=.suffixA .suffixB"
REM set "_CopyValuesFromArray_OutputSuffix=NOSUFFIX .suffixA .suffixB"
echo Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 
Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 3-.suffixB
echo.
echo Contents of mytestoutputarray
echo.
set mytestoutputarray
Call :ClearVariablesByPrefix mytestoutputarray
Call :ClearVariablesByPrefix _CopyValuesFromArray
Call :ClearVariablesByPrefix word2


REM :CopyValuesFromArray-DEMO-skip
REM GoTo :EOF

echo.
echo Searching in ".suffixA" and in ".suffixB" for all the search terms, 
echo also, the searchterm word2 is now an array filled with search terms
echo There are two matches, 3rd element in suffixB and 4th element in suffixA
echo one of the match is from the word2 array, the order is a direct search word
echo also partial matching is enabled and the search term 99 is added to the list
echo in total this matches element 2 3 4 and 5
echo.
set "word2[3]=bla"
set "word2[4]=bli"
set "word2[5]=blo"
set "word2[6]=FFFFF"
set "word2[7]=blou"
set "word2[8]=AAAA"
set "word2[9]=ble"
set "word2[10]=4-.suffixA"
set /a word2.lbound=3
set /a word2.ubound=10
set "_CopyValuesFromArray_PartialMatch=true"
set "_CopyValuesFromArray_SearchSuffix=.suffixA .suffixB"
REM set "_CopyValuesFromArray_OutputSuffix=NOSUFFIX .suffixA .suffixB"
echo Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 
Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 3-.suffixB 99
echo.
echo Contents of mytestoutputarray
echo.
set mytestoutputarray
Call :ClearVariablesByPrefix mytestoutputarray
Call :ClearVariablesByPrefix _CopyValuesFromArray
Call :ClearVariablesByPrefix word2


REM :CopyValuesFromArray-DEMO-skip
REM GoTo :EOF


GoTo :EOF

:ArrayManipulation-DEMO

Call :ClearVariablesByPrefix mytestarray
Call :ClearVariablesByPrefix NewElement

Call :CreateTestArray mytestarray 4 NOSUFFIX .suffixA .suffixB .suffixC
echo. 
echo created a test array with 3 suffixes
set mytestarray

echo.
echo Inserted new element 2 (98) and 3 (99)
set "NewElement=99"
set "NewElement.suffixA=99A"
set "NewElement.suffixB=99B"
set "NewElement.suffixC=99C"
Call :AddArrayElement NewElement mytestarray 2
set "NewElement=98"
set "NewElement.suffixA=98A"
set "NewElement.suffixB=98B"
set "NewElement.suffixC=98C"
Call :AddArrayElement NewElement mytestarray 2
set mytestarray
Call :ClearVariablesByPrefix NewElement

echo.
echo This overwrote element 1 (and we created a backup in backup.mytestarray[1])
set "NewElement.bla=bla"
set "NewElement.bli=bli"
set "NewElement.blo=blo"
Call :CopyElementAndSuffix mytestarray[1] backup.mytestarray[1]
Call :CopyElementAndSuffix NewElement mytestarray[1]
set mytestarray
Call :ClearVariablesByPrefix NewElement

echo.
echo Restored from backup 
Call :CopyElementAndSuffix backup.mytestarray[1] mytestarray[1]
set mytestarray

echo. 
echo Deleted element mytestarray[1], leaving the index in the array empty
Call :ClearVariablesByPrefix mytestarray[1]
set mytestarray

echo.
echo Restored from backup and deleted the backup
Call :CopyElementAndSuffix backup.mytestarray[1] mytestarray[1]
Call :ClearVariablesByPrefix backup.mytestarray[1]
set mytestarray

echo.
echo Deleted element 1 from array, but closed the gap in the array and updated .ubound
echo also saved a backup of the entire array here for future use
Call :CopyElementAndSuffix mytestarray backup.mytestarray
Call :RemoveArrayElement mytestarray 1
set mytestarray

echo.
echo Deleted array index containing the text "98B" but only if it's in suffixA, which it isn't
echo so nothing gets deleted
set "_RemoveValuesFromArray_ArrayToRemoveFrom.suffix=.suffixA"
Call :RemoveValuesFromArray mytestarray 98B
set mytestarray


echo.
echo Deleted array index containing the text "98B" in suffixB, result is element [1] is deleted
set "_RemoveValuesFromArray_ArrayToRemoveFrom.suffix=.suffixB"
Call :RemoveValuesFromArray mytestarray 98B
set mytestarray

echo.
echo Delete the texts 2-.suffixA 3-.suffixB 4-.suffixC from .suffixB
echo this deletes only array element at index 3
set "_RemoveValuesFromArray_ArrayToRemoveFrom.suffix=.suffixB"
Call :RemoveValuesFromArray mytestarray 2-.suffixA 3-.suffixB 4-.suffixC
set mytestarray

echo.
echo restored the array from previous backup
Call :ClearVariablesByPrefix mytestarray
Call :CopyElementAndSuffix backup.mytestarray mytestarray
set mytestarray

echo.
echo As before 
echo Delete the texts 2-.suffixA 3-.suffixB 4-.suffixC from .suffixB
echo this deletes only array element at index 5 
echo however in this example, the list of of texts to delete was stored in an array
set mydeletelist[0]=2-.suffixA
set mydeletelist[1]=3-.suffixB
set mydeletelist[2]=4-.suffixC
set mydeletelist.ubound=2
set "_RemoveValuesFromArray_ArrayToRemoveFrom.suffix=.suffixB"
Call :RemoveValuesFromArray mytestarray mydeletelist 
set mytestarray

echo.
echo restored the array from previous backup
Call :ClearVariablesByPrefix mytestarray
Call :CopyElementAndSuffix backup.mytestarray mytestarray
set mytestarray


echo.
echo Copying entire array elements 3,2 and 5 from mytestarray to mynewtestarray, then showing contents of mynewtestarray
Call :ClearVariablesByPrefix mynewtestarray
set myelementlist[0]=3
set myelementlist[1]=2
set myelementlist[2]=5
set myelementlist.ubound=2
Call :CopyMultipleArrayElements mytestarray myelementlist mynewtestarray
set mynewtestarray
Call :ClearVariablesByPrefix myelementlist
Call :ClearVariablesByPrefix mynewtestarray

echo.
echo Copying array elements 3,2 and 5 from mytestarray to mynewtestarray, then showing contents of mynewtestarray
echo however this time we only copy NOSUFFIX and .suffixC
Call :ClearVariablesByPrefix mynewtestarray
set myelementlist[0]=3
set myelementlist[1]=2
set myelementlist[2]=5
set myelementlist.ubound=2
Call :CopyMultipleArrayElements mytestarray myelementlist mynewtestarray "NOSUFFIX .suffixC"
set mynewtestarray
Call :ClearVariablesByPrefix myelementlist
Call :ClearVariablesByPrefix mynewtestarray

echo. 
echo Copying array elements from mytestarray to mynewtestarray
echo as previous test, elements 3,2 and 5 from mytestarray are copied
echo but this time we take "suffixless value" and .suffixC and we're putting them in .suffixB and NOSUFFIX
set "_DerefArrayReferenceSuffix=NOSUFFIX .suffixC"
set "_DerefArrayOutputSuffix=.suffixB NOSUFFIX"
set myelementlist[0]=3
set myelementlist[1]=2
set myelementlist[2]=5
set myelementlist.ubound=2
Call :DereferenceArrayToArray myelementlist mytestarray mynewtestarray
set mynewtestarray
Call :ClearVariablesByPrefix myelementlist
Call :ClearVariablesByPrefix mynewtestarray

Goto :EOF

:CreateTestArray-DEMO

Call :ClearVariablesByPrefix mytestarray
Call :CreateTestArray mytestarray 600 NOSUFFIX .bla .bli .test .ing .the .limits .of this function .maybe .there's .none ?
set mytestarray
Goto :EOF

:RemoveArrayElement-DEMO
Call :GetAppxPackages
echo appxubound = %AppxPackages.ubound%
echo 4 %AppxPackages[4].PackageFullName%
echo 5 %AppxPackages[5].PackageFullName%
echo 6 %AppxPackages[6].PackageFullName%
echo 100 %AppxPackages[100].PackageFullName%
echo 101 %AppxPackages[101].PackageFullName%
echo 102 %AppxPackages[102].PackageFullName%
set AppxPackages[5]
Call :RemoveArrayElement AppxPackages 5
set AppxPackages[5]
echo 4 %AppxPackages[4].PackageFullName%
echo 5 %AppxPackages[5].PackageFullName%
echo 6 %AppxPackages[6].PackageFullName%
echo 100 %AppxPackages[100].PackageFullName%
echo 101 %AppxPackages[101].PackageFullName%
echo 102 %AppxPackages[102].PackageFullName%
echo appxubound = %AppxPackages.ubound%
Goto :EOF

:AddArrayElement-DEMO

Call :ClearVariablesByPrefix AppxPackages

Call :GetAppxPackages

echo appxubound = %AppxPackages.ubound%
echo 1 %AppxPackages[1].PackageFullName%
echo 2 %AppxPackages[2].PackageFullName%
echo 3 %AppxPackages[3].PackageFullName%
echo 4 %AppxPackages[4].PackageFullName%
echo 5 %AppxPackages[5].PackageFullName%
echo 6 %AppxPackages[6].PackageFullName%
echo 7 %AppxPackages[7].PackageFullName%
echo 8 %AppxPackages[8].PackageFullName%
echo 9 %AppxPackages[9].PackageFullName%
echo 10 %AppxPackages[10].PackageFullName%
echo 11 %AppxPackages[11].PackageFullName%
echo 12 %AppxPackages[12].PackageFullName%
echo 13 %AppxPackages[13].PackageFullName%
echo 99 %AppxPackages[99].PackageFullName%
echo 100 %AppxPackages[100].PackageFullName%
echo 101 %AppxPackages[101].PackageFullName%
echo 102 %AppxPackages[102].PackageFullName%
echo 103 %AppxPackages[103].PackageFullName%
echo 104 %AppxPackages[104].PackageFullName%
echo 105 %AppxPackages[105].PackageFullName%
echo 106 %AppxPackages[106].PackageFullName%
Call :AddArrayElement AppxPackages[4] AppxPackages 102
Call :AddArrayElement AppxPackages[5] AppxPackages 103
Call :AddArrayElement AppxPackages[6] AppxPackages 104
REM Call :AddArrayElement AppxPackages[7] AppxPackages 100
echo appxubound = %AppxPackages.ubound%
echo 1 %AppxPackages[1].PackageFullName%
echo 2 %AppxPackages[2].PackageFullName%
echo 3 %AppxPackages[3].PackageFullName%
echo 4 %AppxPackages[4].PackageFullName%
echo 5 %AppxPackages[5].PackageFullName%
echo 6 %AppxPackages[6].PackageFullName%
echo 7 %AppxPackages[7].PackageFullName%
echo 8 %AppxPackages[8].PackageFullName%
echo 9 %AppxPackages[9].PackageFullName%
echo 10 %AppxPackages[10].PackageFullName%
echo 11 %AppxPackages[11].PackageFullName%
echo 12 %AppxPackages[12].PackageFullName%
echo 13 %AppxPackages[13].PackageFullName%
echo 99 %AppxPackages[99].PackageFullName%
echo 100 %AppxPackages[100].PackageFullName%
echo 101 %AppxPackages[101].PackageFullName%
echo 102 %AppxPackages[102].PackageFullName%
echo 103 %AppxPackages[103].PackageFullName%
echo 104 %AppxPackages[104].PackageFullName%
echo 105 %AppxPackages[105].PackageFullName%
echo 106 %AppxPackages[106].PackageFullName%
Goto :EOF

:RemoveValuesFromArray-DEMO

Call :ClearVariablesByPrefix AppxPackages
Call :ClearVariablesByPrefix myDeleteList
Call :ClearVariablesByPrefix _RemoveValuesFromArray

Call :GetAppxPackages

echo appxubound = %AppxPackages.ubound%
echo 4 %AppxPackages[4].PackageFullName%
echo 5 %AppxPackages[5].PackageFullName%
echo 6 %AppxPackages[6].PackageFullName%
echo 100 %AppxPackages[100].PackageFullName%
echo 101 %AppxPackages[101].PackageFullName%
echo 102 %AppxPackages[102].PackageFullName%
set AppxPackages[5]

REM set "_RemoveValuesFromArray_ArrayToRemoveFrom.suffix=.PackageFullName"
REM Call :RemoveValuesFromArray AppxPackages "Microsoft.AccountsControl_10.0.19041.1023_neutral__cw5n1h2txyewy" "Microsoft.AsyncTextService_10.0.19041.1023_neutral__8wekyb3d8bbwe" "Microsoft.BioEnrollment_10.0.19041.1023_neutral__cw5n1h2txyewy"


set "myDeleteList1[0]=Microsoft.AccountsControl_10.0.19041.1023_neutral__cw5n1h2txyewy"
set "myDeleteList1[1]=Microsoft.AsyncTextService_10.0.19041.1023_neutral__8wekyb3d8bbwe"
set "myDeleteList1[2]=Microsoft.BioEnrollment_10.0.19041.1023_neutral__cw5n1h2txyewy"
set "myDeleteList1[3]=Microsoft.CredDialogHost_10.0.19041.1023_neutral__cw5n1h2txyewy"
set "myDeleteList1[4]=Microsoft.ECApp_10.0.19041.1023_neutral__8wekyb3d8bbwe"
set "myDeleteList1[5]=Microsoft.AAD.BrokerPlugin_1000.19041.1023.0_neutral_neutral_cw5n1h2txyewy"
set /a myDeleteList1.ubound=5

REM set "_RemoveValuesFromArray_ArrayToRemoveFrom.suffix=.PackageFullName"
REM Call :RemoveValuesFromArray AppxPackages myDeleteList1

set "myDeleteList2[0]=Microsoft.Windows.CallingShellApp_1000.19041.1023.0_neutral_neutral_cw5n1h2txyewy"
set "myDeleteList2[1]=Microsoft.Windows.CapturePicker_10.0.19041.1023_neutral__cw5n1h2txyewy"
set "myDeleteList2[2]=Microsoft.Windows.CloudExperienceHost_10.0.19041.1266_neutral_neutral_cw5n1h2txyewy"
set "myDeleteList2[3]=Microsoft.Windows.ContentDeliveryManager_10.0.19041.1023_neutral_neutral_cw5n1h2txyewy"
set "myDeleteList2[4]=Microsoft.Windows.NarratorQuickStart_10.0.19041.1023_neutral_neutral_8wekyb3d8bbwe"
set "myDeleteList2[5]=Microsoft.Windows.OOBENetworkCaptivePortal_10.0.19041.1023_neutral__cw5n1h2txyewy"
set /a myDeleteList2.ubound=5

set "_RemoveValuesFromArray_ArrayToRemoveFrom.suffix=.PackageFullName"
Call :RemoveValuesFromArray AppxPackages myDeleteList1 myDeleteList2 "MicrosoftWindows.UndockedDevKit_10.0.19041.1023_neutral_neutral_cw5n1h2txyewy"

set AppxPackages[5]
echo 4 %AppxPackages[4].PackageFullName%
echo 5 %AppxPackages[5].PackageFullName%
echo 6 %AppxPackages[6].PackageFullName%
echo 100 %AppxPackages[100].PackageFullName%
echo 101 %AppxPackages[101].PackageFullName%
echo 102 %AppxPackages[102].PackageFullName%
echo appxubound = %AppxPackages.ubound%
Goto :EOF

:ShowAppxPackageInfoDEMOv3

Call :ClearVariablesByPrefix MatchingPackages
Call :ClearVariablesByPrefix AppxPackages
Call :ClearVariablesByPrefix _EchoArrayElementFromList

REM goto :ShowAppxPackageInfoDEMOv3-skip-here

::Usage Call :FindAppxPackages MatchingPackages optional SearchTerms optional only|except optional SearchProperties
echo.
Call :SetTitle Find full package name for map application
Call :FindAppxPackages MatchingPackages map
Call :EchoArrayElementFromList MatchingPackages AppxPackages .PackageFullName 
Call :ClearVariablesByPrefix MatchingPackages
pause

echo. 
Call :SetTitle Find full package name for map,zune and xbox related applications
set "SearchTerms[0]=map"
set "SearchTerms[1]=zune"
set "SearchTerms[2]=box"
set /a "SearchTerms.ubound=2"
Call :FindAppxPackages MatchingPackages SearchTerms
Call :EchoArrayElementFromList MatchingPackages AppxPackages .PackageFullName 
Call :ClearVariablesByPrefix MatchingPackages
Call :ClearVariablesByPrefix SearchTerms
pause

echo.
Call :SetTitle Find full package name for all installed applications
Call :FindAppxPackages MatchingPackages Installed only .PackageUserInformation
Call :EchoArrayElementFromList MatchingPackages AppxPackages .PackageFullName 
Call :ClearVariablesByPrefix MatchingPackages
pause

echo. 
Call :SetTitle Find Name and userinfo for all not installed applications
Call :FindAppxPackages MatchingPackages Installed except .PackageUserInformation
Call :EchoArrayElementFromList MatchingPackages AppxPackages .Name .PackageUserInformation
Call :ClearVariablesByPrefix MatchingPackages
pause

echo. 
Call :SetTitle Find Name and userinfo for all not staged applications
Call :FindAppxPackages MatchingPackages Staged except .PackageUserInformation
Call :EchoArrayElementFromList MatchingPackages AppxPackages .Name .PackageUserInformation
Call :ClearVariablesByPrefix MatchingPackages
pause

echo. 
Call :SetTitle Find full package name for all applications that are not installed
Call :FindAppxPackages MatchingPackages Installed except .PackageUserInformation
Call :EchoArrayElementFromList MatchingPackages AppxPackages .PackageFullName 
Call :ClearVariablesByPrefix MatchingPackages
pause

echo.
Call :SetTitle Find full package name for all applications located in C:\Windows\SystemApps\
Call :FindAppxPackages MatchingPackages "C:\Windows\SystemApps\" only .InstallLocation
Call :EchoArrayElementFromList MatchingPackages AppxPackages .PackageFullName 
Call :ClearVariablesByPrefix MatchingPackages
pause



REM echo.
REM Call :SetTitle List InstallLocation for all packages
REM Call :FindAppxPackages MatchingPackages 
REM Call :EchoArrayElementFromList MatchingPackages AppxPackages .InstallLocation 
REM Call :ClearVariablesByPrefix MatchingPackages
REM pause

REM :ShowAppxPackageInfoDEMOv3-skip-here

REM function RemoveValuesFromArray not yet coded
echo.
Call :SetTitle Find full package name for all applications located  outside of C:\Windows\SystemApps\ or C:\Program Files\WindowsApps\
REM Call :FindAppxPackages AllPackages
REM Call :FindAppxPackages MatchingPackages "C:\Windows\SystemApps\" only .InstallLocation
REM Call :FindAppxPackages MatchingPackages2 "C:\Program Files\WindowsApps\" only .InstallLocation
REM echo show install location for first list C:\Windows\SystemApps\
REM Call :EchoArrayElementFromList MatchingPackages AppxPackages .InstallLocation 
REM echo show install location for second list C:\Program Files\WindowsApps\
REM Call :EchoArrayElementFromList MatchingPackages2 AppxPackages .InstallLocation 
REM pause
REM echo showing MatchingPackages
REM set MatchingPackages
REM echo removing element 3 from MatchingPackages



REM Call :RemoveArrayElement MatchingPackages 5
REM echo showing MatchingPackages
REM set MatchingPackages
pause

REM echo set AllPackages
REM pause
REM set AllPackages
REM echo set MatchingPackages
REM pause
REM set MatchingPackages
REM echo set MatchingPackages2
REM pause 
REM set MatchingPackages2
REM pause
Call :RemoveValuesFromArray AllPackages MatchingPackages MatchingPackages2
Call :EchoArrayElementFromList AllPackages AppxPackages .PackageFullName 
Call :ClearVariablesByPrefix MatchingPackages
Call :ClearVariablesByPrefix MatchingPackages2
Call :ClearVariablesByPrefix AllPackages
pause

echo. 
Call :SetTitle Find FullPackName AND location for all applications located inside C:\Windows\SystemApps\
Call :FindAppxPackages MatchingPackages "C:\Windows\SystemApps\" only .InstallLocation
Call :EchoArrayElementFromList MatchingPackages AppxPackages .PackageFullName .InstallLocation
Call :ClearVariablesByPrefix MatchingPackages
pause

echo. 
Call :SetTitle Find FullPackName AND location for all applications located outside C:\Windows\SystemApps\
Call :FindAppxPackages MatchingPackages "C:\Windows\SystemApps\" except .InstallLocation
Call :EchoArrayElementFromList MatchingPackages AppxPackages .PackageFullName .InstallLocation
Call :ClearVariablesByPrefix MatchingPackages
pause

echo.
Call :SetTitle Find full package name for all non-removable applications
Call :FindAppxPackages MatchingPackages Installed True .NonRemovable
Call :EchoArrayElementFromList MatchingPackages AppxPackages .PackageFullName 
Call :ClearVariablesByPrefix MatchingPackages
pause

echo.
Call :SetTitle Find Name,location,version,arch,hash for map,zune and xbox 
set "SearchTerms[0]=map"
set "SearchTerms[1]=zune"
set "SearchTerms[2]=xbox"
set /a "SearchTerms.ubound=2"
Call :FindAppxPackages MatchingPackages SearchTerms
Call :EchoArrayElementFromList MatchingPackages AppxPackages .Name .InstallLocation .version .architecture .gethashcode
Call :ClearVariablesByPrefix MatchingPackages
Call :ClearVariablesByPrefix SearchTerms
pause

echo.
Call :SetTitle Find Name,PackageUserInformation for map,zune and xbox 
set "SearchTerms[0]=map"
set "SearchTerms[1]=zune"
set "SearchTerms[2]=xbox"
set /a "SearchTerms.ubound=2"
Call :FindAppxPackages MatchingPackages SearchTerms
Call :EchoArrayElementFromList MatchingPackages AppxPackages .Name .PackageUserInformation 
Call :ClearVariablesByPrefix MatchingPackages
Call :ClearVariablesByPrefix SearchTerms
pause

echo.
Call :SetTitle Find Name and dependencies for all apps with dependencies
Call :FindAppxPackages MatchingPackages NoDependencies except .Dependencies
Call :EchoArrayElementFromList MatchingPackages AppxPackages .Name .Dependencies
Call :ClearVariablesByPrefix MatchingPackages
pause

echo.
Call :SetTitle Find name for all apps not by publisher 8wekyb3d8bbwe (microsoft)
Call :FindAppxPackages MatchingPackages 8wekyb3d8bbwe except .PublisherId
Call :EchoArrayElementFromList MatchingPackages AppxPackages .Name .PublisherId .InstallLocation
Call :ClearVariablesByPrefix MatchingPackages
pause

echo. BROKEN PROBABLY BECAUSE 0 RESULTS = CRASH
Call :SetTitle Find name for all apps not by publisher microsoft
Call :FindAppxPackages MatchingPackages Microsoft except .Publisher
Call :EchoArrayElementFromList MatchingPackages AppxPackages .Name .Publisher .InstallLocation
Call :ClearVariablesByPrefix MatchingPackages
pause
REM Missing operand.
REM Missing operand.
REM ECHO is off.
REM ECHO is off.
REM ECHO is off.
REM The syntax of the command is incorrect.

echo.
Call :SetTitle Find name for all partially staged applications
Call :FindAppxPackages MatchingPackages NoValue except .IsPartiallyStaged
Call :EchoArrayElementFromList MatchingPackages AppxPackages .Name .InstallLocation
Call :ClearVariablesByPrefix MatchingPackages
pause

echo.
Call :SetTitle Find name and version for all apps not version 10.0.19041.1023
Call :FindAppxPackages MatchingPackages 10.0.19041.1023 except .Version
Call :EchoArrayElementFromList MatchingPackages AppxPackages .Name .Version
Call :ClearVariablesByPrefix MatchingPackages
pause

echo.
Call :SetTitle Find name and version for all apps part of a bundle
Call :FindAppxPackages MatchingPackages NoValue except .IsBundle
Call :EchoArrayElementFromList MatchingPackages AppxPackages .Name .Publisher .Version .IsBundle
Call :ClearVariablesByPrefix MatchingPackages
pause

echo.
Call :SetTitle List all packages by FullPackageName
Call :FindAppxPackages MatchingPackages 
Call :EchoArrayElementFromList MatchingPackages AppxPackages .PackageFullName
Call :ClearVariablesByPrefix MatchingPackages
pause

echo.
Call :SetTitle List all packages without a store signature
Call :FindAppxPackages MatchingPackages Store except .SignatureKind
Call :EchoArrayElementFromList MatchingPackages AppxPackages .PackageFullName .SignatureKind
Call :ClearVariablesByPrefix MatchingPackages
pause

echo.
Call :SetTitle List all packages in development mode
Call :FindAppxPackages MatchingPackages NoValue except .IsDevelopmentMode
Call :EchoArrayElementFromList MatchingPackages AppxPackages .PackageFullName .IsDevelopmentMode
Call :ClearVariablesByPrefix MatchingPackages
pause


GoTo :EOF

REM Superseeded by :ShowAppxPackageInfoDEMOv3
REM :ShowAppxPackageInfoDEMOv2

REM Call :ClearVariablesByPrefix myoutput
REM Call :ClearVariablesByPrefix _EchoArrayElementFromList

REM argument parser dev
REM echo.
REM Call :SetTitle "FindAppxPackages no arguments test # Call :FindAppxPackages myoutput"
REM Call :FindAppxPackages myoutput
REM echo.
REM set myoutput
REM echo.
REM set "_EchoArrayElementFromListPrefix=%%%%_EchoArrayElementFromList_SuffixList[%%_EchoArrayElementFromList_SuffixList.index%%]%%%%="
REM Call :EchoArrayElementFromList myoutput AppxPackages .PackageFullName 
REM echo.
REM pause
REM Call :ClearVariablesByPrefix myoutput

REM echo.
REM Call :SetTitle "FindAppxPackages one search term # Call :FindAppxPackages myoutput maps"
REM Call :FindAppxPackages myoutput maps
REM echo.
REM set myoutput
REM echo.
REM Call :EchoArrayElementFromList myoutput AppxPackages .PackageFullName
REM echo.
REM pause
REM Call :ClearVariablesByPrefix myoutput

REM echo.
REM Call :SetTitle "FindAppxPackages one search term in array form # testsearch[0]=maps Call :FindAppxPackages myoutput testsearch"
REM set "testsearch[0]=maps"
REM set /a "testsearch.ubound=0"
REM Call :FindAppxPackages myoutput testsearch
REM echo.
REM set myoutput
REM echo.
REM Call :EchoArrayElementFromList myoutput AppxPackages .PackageFullName
REM echo.
REM pause
REM Call :ClearVariablesByPrefix myoutput

REM echo.
REM Call :SetTitle FindAppxPackages three search term in array form # maps Zune box Photo
REM set "testsearch[0]=maps"
REM set "testsearch[1]=Zune"
REM set "testsearch[2]=box"
REM set "testsearch[3]=Photo"
REM set "testsearch.ubound=3"
REM Call :FindAppxPackages myoutput testsearch
REM echo.
REM set myoutput
REM echo.
REM Call :EchoArrayElementFromList myoutput AppxPackages .PackageFullName
REM echo.
REM pause
REM Call :ClearVariablesByPrefix myoutput

REM echo.
REM Call :SetTitle FindAppxPackages one search term, onlymatch # Call :FindAppxPackages myoutput maps only
REM Call :FindAppxPackages myoutput maps only
REM echo.
REM set myoutput
REM echo.
REM Call :EchoArrayElementFromList myoutput AppxPackages .PackageFullName
REM echo.
REM pause
REM Call :ClearVariablesByPrefix myoutput

REM echo.
REM Call :SetTitle FindAppxPackages one search term, exceptmatch # Call :FindAppxPackages myoutput maps except
REM Call :FindAppxPackages myoutput maps except
REM echo.
REM set myoutput
REM echo.
REM Call :EchoArrayElementFromList myoutput AppxPackages .PackageFullName
REM echo.
REM pause
REM Call :ClearVariablesByPrefix myoutput

REM echo.
REM Call :SetTitle FindAppxPackages one search term, exceptmatch and one searchproperties defined # Call :FindAppxPackages myoutput maps except PackageFullName
REM Call :FindAppxPackages myoutput maps except PackageFullName
REM echo.
REM set myoutput
REM echo.
REM Call :EchoArrayElementFromList myoutput AppxPackages .PackageFullName
REM echo.
REM pause
REM Call :ClearVariablesByPrefix myoutput

REM echo.
REM Call :SetTitle FindAppxPackages one search term, exceptmatch and two searchproperties defined # Call :FindAppxPackages myoutput maps except InstallLocation\PackageFullName
REM Call :FindAppxPackages myoutput maps except InstallLocation\PackageFullName
REM echo.
REM set myoutput
REM echo.
REM Call :EchoArrayElementFromList myoutput AppxPackages .PackageFullName
REM echo.
REM pause
REM Call :ClearVariablesByPrefix myoutput

REM echo.
REM Call :SetTitle FindAppxPackages one search term, exceptmatch and two searchproperties defined # Call :FindAppxPackages myoutput maps except InstallLocation\PackageFullName\IsFramework
REM Call :FindAppxPackages myoutput maps except InstallLocation\PackageFullName\IsFramework
REM echo.
REM set myoutput
REM echo.
REM Call :EchoArrayElementFromList myoutput AppxPackages .PackageFullName
REM echo.
REM pause
REM Call :ClearVariablesByPrefix myoutput

REM argument parser works


GoTo :EOF

:DeleteAppxPackagesDEMO

echo.
call :ShowAppxPackageInfoFull maps
goto :eof
Call :GetAppxPackageFullName maps MapsFullName
echo Maps app fullname is :%MapsFullName%
Call :GetAppxPackageInstallLocation %MapsFullName% MapsInstallLocation
echo Maps install location is :%MapsInstallLocation%
Call :InstallAppxPackages "%MapsInstallLocation%"
Call :ShowAppxForceUpdate
call :ShowAppxPackageInfoFull maps
REM Call :DeleteAppxPackages Microsoft.WindowsMaps_5.1906.1972.0_x64__8wekyb3d8bbwe
Call :ShowAppxForceUpdate
call :ShowAppxPackageInfoFull maps
GoTo :EOF

REM ShowAppxPackageInfo superseeded by ? FindAppxPackages plus EchoArrayElementFromList
REM :ShowAppxPackageInfoDEMO
REM Call :ClearVariablesByPrefix AppxPackages
REM call :ShowAppxPackageInfoFull 
REM call :ShowAppxPackageInfoTerse 
REM call :ShowAppxPackageInfoFull une
REM call :ShowAppxPackageInfo Zune
REM call :ShowAppxPackageInfoFull Zune
REM call :ShowAppxPackageInfoFull installed PackageUserInformation exclude
REM call :ShowAppxPackageInfoFull staged PackageUserInformation exclude

REM GoTo :EOF

:GetAppxPackagesDEMO

call :GetAppxPackages

GoTo :EOF


:GetNamedKeyDEMOv2

REM Call :ClearVariablesByPrefix ThisPCicon[NewStart][CurrentUser]
REM Call :ClearVariablesByPrefix ThisPCicon[NewStart][AllUser]
REM Call :ClearVariablesByPrefix ThisPCicon[ClassicStart][CurrentUser]
REM Call :ClearVariablesByPrefix ThisPCicon[NewStart][CurrentUser]

for /l %%a in (0,1,57) do Call :ClearVariablesByPrefix %%myval[%%a]%% 

set myval[0]=ThisPCicon[NewStart][CurrentUser]
set myval[1]=ThisPCicon[NewStart][AllUser]
set myval[2]=ThisPCicon[ClassicStart][CurrentUser]
set myval[3]=ThisPCicon[ClassicStart][AllUser]
set myval[4]=LockScreen
set myval[5]=NoLockScreenCamera
set myval[6]=BackgroundColor
set myval[7]=AccentColor
set myval[8]=LockScreenImage
set myval[9]=LockScreenOverlaysDisabled
set myval[10]=ForceStartBackground
set myval[11]=NoChangingLockScreen
set myval[12]=NoChangingStartMenuBackground
set myval[13]=NoLockScreenSlideshow
set myval[14]=TurnOffAutomaticTextLearning
set myval[15]=TurnOffAutomaticInkLearning
set myval[16]=AllowOnlineSpeechRecognition
set myval[17]=BlockCleanupOfUnusedLangPacks
set myval[18]=ForceSelectedUILanguage
set myval[19]=RestrictLanguagePackAndFeatureInstall
set myval[20]=RestrictUILanguageForAllUsers
set myval[21]=User'sFilesIcon[NewStart][CurrentUser]
set myval[22]=User'sFilesIcon[NewStart][AllUser]
set myval[23]=User'sFilesIcon[ClassicStart][CurrentUser]
set myval[24]=User'sFilesIcon[ClassicStart][AllUser]
set myval[25]=AllowInsecureGuestAuth
set myval[26]=HideFileExt
set myval[27]=AllowOnlineTips
set myval[28]=SettingsPageVisibility
set myval[29]=UserSettingsPageVisibility
set myval[30]=UseDefaultTile
set myval[31]=AllowPrelaunch
set myval[32]=IntelShowTrayIcon
set myval[33]=IntelHotKeysEnable
set myval[34]=DevicePasswordLessBuildVersion
set myval[35]=DefaultUserName
set myval[36]=DefaultPassword
set myval[37]=AutoAdminLogon
set myval[38]=AppsUseLightTheme
set myval[39]=SystemUsesLightTheme
set myval[40]=ShowCortanaButton
set myval[41]=SearchboxTaskbarMode
set myval[42]=ShowTaskViewButton
set myval[43]=WallPaper
set myval[44]=Background
set myval[45]=RealtekShowTrayIcon
set myval[46]=EnableAutoTray
set myval[47]=AllowTelemetry
set myval[48]=NoAutoUpdate
set myval[49]=HideSCAMeetNow[CurrentUser]
set myval[50]=HideSCAMeetNow[AllUser]
set /a myval.lbound=50
set /a myval.ubound=50
set /a myval.count=51


Call :EchoArray myval

Call :AddArrayElement mytestvalue1 mytestvalue2 mytestvalue3 mytestvalue4 mytestvalue5 myval

echo. 
Call :EchoArray myval

set /a myval.ubound=50
set _AddArrayElementSuffix=.subvalue
Call :AddArrayElement mytestvalue1 mytestvalue2 mytestvalue3 mytestvalue4 mytestvalue5 myval

GoTo :EOF

for /l %%a in (0,1,50) do Call :ClearVariablesByPrefix %%myval[%%a]%% 

set /a index=0
:GetNamedKeyDEMOv2-internal-loop
  
  echo.
  REM Call :DisplayNamedKey %%myval[%index%]%%
  
  Call :GetNamedKey %%myval[%index%]%% OutputVar
  call echo %%myval[%index%]%%'s Named Value is = %OutputVar% 
  call call echo %%myval[%index%]%%'s Named Value is = %%%%%%myval[%index%]%%.CurrentNamedValue%%%%
  
  
  set /a index+=1
if %index% LEQ 50 GoTo :GetNamedKeyDEMOv2-internal-loop

REM echo ThisPCicon[NewStart][CurrentUser] %ThisPCicon[NewStart][CurrentUser].CurrentNamedValue%
REM echo ThisPCicon[NewStart][AllUser] %ThisPCicon[NewStart][AllUser].CurrentNamedValue%
REM echo ThisPCicon[ClassicStart][CurrentUser] %ThisPCicon[ClassicStart][CurrentUser].CurrentNamedValue%
REM echo ThisPCicon[ClassicStart][AllUser] %ThisPCicon[ClassicStart][AllUser].CurrentNamedValue%
  
GoTo :EOF

:ElevateDEMO

REM example arguments for testing
REM parameter1 parameter2 parameter3 value1=true -command "c:\path\ and file.ext" "<>^\/\\^^^^/&^&&|"

:: If not already running elevated, self-elevate and exit.
:: Note: A helper variable must be used to capture %*,
::       because passing %* to a subroutine doubles ^ chars.
call :IsAdmin || set args=%* && (call :Elevate & exit /b)

:: Getting here means this is (now) an elevated session.

::Print the arguments received.
echo Now running elevated; arguments received:
echo.  %*
pause

GoTo :EOF

:EchoArgumentsDEMO
REM Call :EchoArguments your c:\users\desktop.ini C:\users c:\users\ c:\windows c:\windows\ c:\windows\write.exe "test" -hello  file.ext "file2.ext"

set myvar1=bla blo ble blou
set myvar2=blo
set result=
call :instb %myvar1% %myvar2% result
echo %result%

REM Call :ArgumentsToArray your c:\users\desktop.ini C:\users c:\users\ c:\windows c:\windows\ c:\windows\write.exe "test" -hello  file.ext "file2.ext"
REM Call :EchoArray Arguments
REM Call :ClearArray Arguments

::  Part of argument parser

REM evaluate each command line argument and take action for each
REM place each command line argument in an array

::usage call command parameters parameters parameters 'terse explanation
:: EXAMPLE USAGE Call :command bla bla ' What this does
:: ANOTHER EXAMPLE USAGE Call :command bla bla ' What this does

REM Parse arguments
REM set variables from arguments like debug=true
REM Place consecutive lists of files into arrays
REM Find if any help flag in argument --help -h -? /? /h
REM command like --pretend --ask to simulate irreversible commands like del
REM argument aliases
REM Arguments into array
REM Arguments like action setting=value multisetting=value1,value2,value3
REM Arguments action /action -action --action
REM arguments --action "my value 1","my value 2","my value 3"
REM arguments --action -a /a 
REM arguments +setting -setting 
REM argument array of consecutive file or folder paths "c:\path\to\file.ext" "c:\path\to\file2.ext" "c:\path\to\file3.ext" 
REM arguments[X]
REM arguments[X].prefix
REM arguments[X].text
REM arguments[X].values
REM arguments[X].count
REM arguments[X].type = command action setting multivalue filelist short combined short boolean positional alias optional list config
REM arguments[X].cursor
REM arguments[X].previous
REM arguments[X].next
REM arguments.cursor
REM arguments.previous
REM arguments.next
REM arguments.count
REM Is argument a file or folder
REM Is argument a valid path
REM Is argument an existing file or folder
REM test 
REM test /a
REM test /abc
REM test -a
REM test -abc
REM test command
REM test command value
REM test --command value
REM test --bool --no-bool
REM test --bool --no-bool positional1 positional2 postitionalLAST
REM test setting=value
REM test --options opt1=1,opt2=2,opt3=3
REM test --options opt1:1,opt2:2,opt3:3
REM test --help -h -? /? /h

GoTo :EOF


:: Demo in Progress Functions

:: Work in Progress Functions

:: Comments and ideas