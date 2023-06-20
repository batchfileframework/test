@echo off
echo Hello, world!

REM Check if a command line argument was provided
IF "%~1"=="" (
    echo No argument was provided.
    GOTO EndScript
)

REM Convert the argument to lowercase
for /f %%i in ('echo %~1 ^| find /v /i "dummy"') do set arg=%%i

REM Check if the argument is "true" or "false"
IF /i "%arg%"=="true" (
    echo The argument was true.
) ELSE IF /i "%arg%"=="false" (
    echo The argument was false.
) ELSE (
    echo The argument was not a recognizable boolean value.
)

:EndScript
