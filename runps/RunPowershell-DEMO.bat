@echo off 
:setup
:main

Call :RunPowershell-DEMO

GoTo :EOF

run powershell  from value, byref variable, byref array
run powershell from file
run powershell from temp file ?
run powershell and wait
run powershell and continue
run powershell in separate process and wait
run powershell in separate process and continue
run powershell in separate process as admin and wait
run powershell in separate process as admin and continue

run powershell and print output to console
run powershell and return single value (first value)
run powershell and return single value (last value)
run powershell and return single value (value matching text)
run powershell and return array of the full output

what is the difference between powershell and powershell -command ?

If the value of Command is a script block, the script block must be enclosed
    in braces ({})


demo scripts

just print text

just print text via a function

print text containing a variable and using doublequotes

print text including a variable and using parenthesis

print to a file

use an API

in all cases, it should be possible to pass invokable instructions via environement variables (powershell iex)


:RunPowershell-DEMO

goto :skip

echo.&echo Print text with plain string 
Call :RunPowershell 'Printing text using plain string : This test worked correctly';

echo.&echo Print text with write-host cmdlet
Call :RunPowershell write-host 'Printing text using write-host : This test worked correctly';

REM echo.&echo Print text using variable and then a string, first version does not work, 
REM Call :RunPowershell $myvar = 'This test worked correctly'; "Printing text using a variable : $myvar";
:skip
echo.&echo Print text using variable and then a string, second version has escaped the doublequotes
Call :RunPowershell $myvar = 'This test worked correctly'; \"Printing text using a variable : $myvar\";

echo.&echo Print text using a called function
Call :RunPowershell function myprint { write-host 'Printing text using a called function : This test worked correctly'; } myprint; 

REM echo.&echo Print text using a function which receives text as an argument, first version does not work
REM Call :RunPowershell function myprint { param ( [string]$myinput ) write-host "Printing text using a function argument :$myinput"; } myprint ("This test worked correctly"); 

echo.&echo Print text using a function which receives text as an argument, second version works if doublequotes are escaped
Call :RunPowershell function myprint { param ( [string]$myinput ) write-host \"Printing text using a function argument :$myinput\"; } myprint (\"This test worked correctly\"); 

echo.&echo Print text using win32, accessed with the add-type cmdlet, again the doublequotes needed to be escaped
REM Call :RunPowershell $consoleApi = Add-Type -Name "ConsoleApi" -Namespace Win32 -PassThru -MemberDefinition '[DllImport("kernel32.dll", SetLastError = true)] public static extern IntPtr GetStdHandle(int nStdHandle);[DllImport("kernel32.dll", CharSet = CharSet.Auto, SetLastError = true)]public static extern bool WriteConsole(IntPtr hConsoleOutput, string lpBuffer, uint nNumberOfCharsToWrite, out uint lpNumberOfCharsWritten, IntPtr lpReserved);'; $STD_OUTPUT_HANDLE = -11; $textToWrite = 'Printing text using the win32 api WriteConsole and the add-type cmdlet : This test worked correctly'; $handle = $consoleApi::GetStdHandle($STD_OUTPUT_HANDLE);$charsWritten = $null; if (-not $consoleApi::WriteConsole($handle, $textToWrite, $textToWrite.Length, [ref]$charsWritten, [IntPtr]::Zero)) { Write-Warning 'Failed to write to console!'; exit 2; }
Call :RunPowershell $consoleApi = Add-Type -Name "ConsoleApi" -Namespace Win32 -PassThru -MemberDefinition '[DllImport(\"kernel32.dll\", SetLastError = true)] public static extern IntPtr GetStdHandle(int nStdHandle);[DllImport(\"kernel32.dll\", CharSet = CharSet.Auto, SetLastError = true)]public static extern bool WriteConsole(IntPtr hConsoleOutput, string lpBuffer, uint nNumberOfCharsToWrite, out uint lpNumberOfCharsWritten, IntPtr lpReserved);'; $STD_OUTPUT_HANDLE = -11; $textToWrite = 'Printing text using the win32 api WriteConsole and the add-type cmdlet : This test worked correctly'; $handle = $consoleApi::GetStdHandle($STD_OUTPUT_HANDLE);$charsWritten = $null; if (-not $consoleApi::WriteConsole($handle, $textToWrite, $textToWrite.Length, [ref]$charsWritten, [IntPtr]::Zero)) { Write-Warning 'Failed to write to console!'; exit 2; }

echo.&echo.&echo Print text, using add-type, placing a function in a class and calling this function
Call :RunPowershell Add-Type  -TypeDefinition 'using System;namespace MyLibrary{public class Printer{public void PrintTest(){Console.WriteLine(\"Function in assembly that prints: This test worked correctly\");}}}'; $printer = New-Object MyLibrary.Printer; $printer.PrintTest();

echo.&echo Print text, same as previous, but place the "type" in a DLL, then load this DLL
Call :RunPowershell Add-Type  -OutputAssembly '.\MyLibrary.dll' -TypeDefinition 'using System;namespace MyLibrary{public class Printer{public void PrintTest(){Console.WriteLine(\"Function in assembly in a DLL that prints: This test worked correctly\");}}}'; Add-Type -Path '.\MyLibrary.dll'; $printer = New-Object MyLibrary.Printer; $printer.PrintTest();

REM del MyLibrary.dll 2>NUL
REM echo.&echo MyLibrary.dll has been deleted, checking (should report File not found)
REM dir MyLibrary.dll

echo.&echo Print text, same as previous, but in two steps, to make sure the DLL really works, (MyLibrary.dll was deleted)
Call :RunPowershell Add-Type -OutputAssembly '.\MyLibrary.dll' -TypeDefinition 'using System;namespace MyLibrary{public class Printer{public void PrintTest(){Console.WriteLine(\"Function in assembly in a DLL that prints: This test worked correctly\");}}}';
REM echo.&echo Does MyLibrary.dll exist ? 
REM dir MyLibrary.dll
echo.&echo Printing the text, by importing the DLL previously created 
Call :RunPowershell Add-Type -Path '.\MyLibrary.dll'; $printer = New-Object MyLibrary.Printer; $printer.PrintTest();

echo.&echo Print text using the Win32 API WriteConsole, but in a DLL. First step creates the DLL, second steps uses it
del MyLibrary2.dll 2>NUL
call :runpowershell $consoleApi = Add-Type -OutputAssembly '.\MyLibrary2.dll' -Name "ConsoleApi" -Namespace Win32 -PassThru -MemberDefinition '[DllImport(\"kernel32.dll\", SetLastError = true)] public static extern IntPtr GetStdHandle(int nStdHandle);[DllImport(\"kernel32.dll\", CharSet = CharSet.Auto, SetLastError = true)]public static extern bool WriteConsole(IntPtr hConsoleOutput, string lpBuffer, uint nNumberOfCharsToWrite, out uint lpNumberOfCharsWritten, IntPtr lpReserved);';
call :runpowershell $consoleApi = Add-Type -PassThru  -Path '.\MyLibrary2.dll'; $STD_OUTPUT_HANDLE = -11; $textToWrite = 'Printing text using the win32 api WriteConsole and the add-type cmdlet : This test worked correctly'; $handle = $consoleApi::GetStdHandle($STD_OUTPUT_HANDLE);$charsWritten = $null; if (-not $consoleApi::WriteConsole($handle, $textToWrite, $textToWrite.Length, [ref]$charsWritten, [IntPtr]::Zero)) { Write-Warning 'Failed to write to console!'; exit 2; }

echo.&echo Print text using the Win32 API WriteConsole, in a type (instead of using -passthru), in a DLL. First step creates the DLL, second steps uses it
del MyLibrary2.dll 2>NUL
call :runpowershell Add-Type -OutputAssembly '.\MyLibrary2.dll' -Name "ConsoleApi" -Namespace Win32 -PassThru -MemberDefinition '[DllImport(\"kernel32.dll\", SetLastError = true)] public static extern IntPtr GetStdHandle(int nStdHandle);[DllImport(\"kernel32.dll\", CharSet = CharSet.Auto, SetLastError = true)]public static extern bool WriteConsole(IntPtr hConsoleOutput, string lpBuffer, uint nNumberOfCharsToWrite, out uint lpNumberOfCharsWritten, IntPtr lpReserved);';  ^| out-null
call :runpowershell Add-Type -Path '.\MyLibrary2.dll' ; $STD_OUTPUT_HANDLE = -11; $textToWrite = 'Printing text using the win32 api WriteConsole and the add-type cmdlet : This test worked correctly'; $handle = [Win32.consoleApi]::GetStdHandle($STD_OUTPUT_HANDLE);$charsWritten = $null; if (-not [Win32.consoleApi]::WriteConsole($handle, $textToWrite, $textToWrite.Length, [ref]$charsWritten, [IntPtr]::Zero)) { Write-Warning 'Failed to write to console!'; exit 2; }


GoTo :EOF

::Usage Call :ArgumentToArray %*
::Implied argument _ArgumentToArray_output=OutputArrayName
::Will return to _ArgumentToArray[]
:ArgumentToArray
exit /b _ArgumentToArray.ubound

::Usage Call :RemoveArguments %* 
::Implied argument _RemoveArguments_RemoveCount=# of arguments to remove
::Implied argument _RemoveArguments_output=OutputVariable
:RemoveArguments %*
GoTo :EOF

::Usage Call :GetRemainingArguments %*
::Implied argument X
::Return everything after Xth argument
:GetRemainingArguments

::Usage Call :GetDefinedArguments %*
::Return string of the defined arguments (byref variables)
:GetDefinedArguments %*


::Usage Call :RunPowershell optional DETACH "Write-host 'hello'"	
::      Call :RunPowershell byref variable
::      Call :RunPowershell byref array
REM :RunPowershellFast
REM :RunPowershell
REM echo starting, command line:%*
powershell %*
REM echo ending
GoTo :EOF

REM :RunPowershell

create setlocal
check each argument for being defined
return number of defined argument
return string of defined argument
return len of string of defined arguments
concatenate only the defined arguments

------------------

in setlocal
go through each argument and check if they are defined
on the first not defined argument
create a string of all the defined argument 
get lenght of that string
substract the last defined element
 take the full argument %*
 search subscript of the last defined element, starting at the length of the 

------------------


:RunPowershell
Call :Concatenate _RunPowershell %* 
setlocal enabledelayedexpansion
set _RunPowershell
REM powershell !_RunPowershell!
endlocal 
GoTo :EOF

check every argument for being defined as var or array, then concatenate all of them 


:RunPowershellDetached
:RunPowershellDetachedAsAdmin


::Usage Call :Concatenate OutputValue optional (SEPARATOR "X") InputArray1 InputArray2 InputArrayN 
:Concatenate
if not defined _Concatenate_localscope ( setlocal enabledelayedexpansion & set "_Concatenate_localscope=true" )
if not defined _Concatenate_output ( set "_Concatenate_output=%~1" & shift & GoTo :Concatenate )
if "[%~1]" EQU "[SEPARATOR]" ( set "_Concatenate_separator=%~2" & shift & shift & GoTo :Concatenate )
set "_Concatenate_prefix=_CA"
if defined %1.ubound ( set "_Concatenate_input=%~1" ) else ( set "_Concatenate_input=_Concatenate_placeholder" & set "_Concatenate_placeholder[0]=" )
if defined %1.lbound call set /a _Concatenate_lbound=%%%~1.lbound%%
if defined %1.ubound call set /a _Concatenate_ubound=%%%~1.ubound%%
if not defined %1.lbound set /a "_Concatenate_lbound=0"
if not defined %1.ubound set /a "_Concatenate_ubound=0"
set /a "_Concatenate_index=%_Concatenate_lbound%"
if not defined %1.lbound if not defined %1.ubound if not defined %_Concatenate_input%[%_Concatenate_index%] if defined %1 set %_Concatenate_input%[%_Concatenate_index%]=!%1!
if not defined %1.lbound if not defined %1.ubound if not defined %_Concatenate_input%[%_Concatenate_index%] set "%_Concatenate_input%[%_Concatenate_index%]=%~1"
if defined !_Concatenate_separator! ( set _Concatenate_separator=!%_Concatenate_separator%! )
if not defined _Concatenate_separator set "_Concatenate_separator= "
set _Concatenate
:Concatenate-loop
set _Concatenate_buffer=!_Concatenate_buffer!!%_Concatenate_input%[%_Concatenate_index%]!!_Concatenate_separator!
set /a "_Concatenate_index+=1"
if %_Concatenate_index% LEQ %_Concatenate_ubound% GoTo :Concatenate-loop
if "[%~2]" NEQ "[]" ( shift & GoTo :Concatenate ) 
for /f "tokens=* delims==" %%a in ('echo.!_Concatenate_buffer!') do (
																endlocal
																set %_Concatenate_output%=%%a
																)
Call :ClearVariablesByPrefix %_Concatenate_prefix% _Concatenate
GoTo :EOF

:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
if "[%~1]" NEQ "[]" for /f "tokens=1 delims==" %%a in ('set "%~1" 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :ClearVariablesByPrefix
GoTo :EOF