@echo off
:setup
REM call :ClearLocalVariables
REM Call :GetTime FileTime StartDate StartTime
REM Call :GetCodePage InitialCodepage
REM Call :SetTitle "Control 'This PC' icon on the desktop" 
set debug=false
REM set verbose=75
REM set verbose=85
REM set silent=false
REM set logfile=%tmp%\%filetime%
REM if "[debug]"=="[true]" Call :PrintTime
:: Uncomment line below if this scripts needs to run with admin privileges
REM call :IsAdmin || set args=%* && (call :ElevateAndWait & exit /b)

:macro
REM call :SetMacroPrintTime

:main

cls

REM %PrintTime%
if "[%debug%]"=="[true]" echo Debug mode is enabled
REM if "[%silent%]"=="[true]" echo Silent mode is enabled
REM if not "[%verbose%]"=="[]" echo Verbose level : %verbose%
REM if not "[%verbose%]"=="[]" if %verbose% GTR 49 echo Verbose level 50 or more

call :AddEscapeCharacters-AND-GetRandomString-DEMOv2
REM call :Performance-timer-DEMO
REM call :EchoArguments-DEMO
REM call :AddEscapeCharacters-AND-GetRandomString-DEMO
REM call :AddEscapeCharacters-DEMO
REM call :runps-DEMO
REM call :CharArray2String-DEMO
REM call :ArrayToFile-DEMO
REM call :EchoFile-DEMO
REM call :ListUnescapedSpecialCharactersInString-DEMO
REM call :PrintCharMap-DEMO
REM call :GetRandomString-DEMO
REM call :ReadyMadeLoop-DEMO
REM call :rnd-DEMO
REM call :len-DEMO
REM call :StringCompare-DEMO
REM call :GetCharMap-DEMO
REM Call :SetNonEmptyValueOnlyIfNotDefined-DEMO
REM Call :EchoArray-DEMO
GoTo :END

:end
REM set FileTime=
REM set StartDate=
REM set StartTime=
REM set InitialCodepage=
REM set debug=
REM set verbose=
REM set silent=
REM set logfile=

GoTo :EOF
REM Exit /b %returnvalue%

REM Internal Functions 


:AddEscapeCharacters-AND-GetRandomString-DEMOv2

goto :AddEscapeCharacters-AND-GetRandomString-DEMOv2-skip1

REM set debug=true

REM Call :PrintCharMap 
REM goto :eof

Call :ClearVariablesByPrefix _AEC _GRD my
echo new attempt>>randomstring.txt

echo.
echo calling GetRandomString five times
echo without arguments the strings will have, no space, no quotes, no exclamation, no percent, no delimiters
echo if the last character is a number, it will be escaped with a carret (this reduce the output string length by 1 (TODO FIX))
echo.

call :GetRandomString 30 myoutput[0]
call :len myoutput[0].len2 myoutput[0]
echo R %myoutput[0].len% %myoutput[0].len2% %myoutput[0]%
call :GetRandomString 30 myoutput[1]
call :len myoutput[1].len2 myoutput[1]
echo R %myoutput[1].len% %myoutput[1].len2% %myoutput[1]%
call :GetRandomString 30 myoutput[2]
call :len myoutput[2].len2 myoutput[2]
echo R %myoutput[2].len% %myoutput[2].len2% %myoutput[2]%
call :GetRandomString 30 myoutput[3]
call :len myoutput[3].len2 myoutput[3]
echo R %myoutput[3].len% %myoutput[3].len2% %myoutput[3]%
call :GetRandomString 30 myoutput[4]
call :len myoutput[4].len2 myoutput[4]
echo R %myoutput[4].len% %myoutput[4].len2% %myoutput[4]%
call :GetRandomString 30 myoutput[5]
call :len myoutput[5].len2 myoutput[5]
echo R %myoutput[5].len% %myoutput[5].len2% %myoutput[5]%

Call :ClearVariablesByPrefix myout


echo.
echo calling GetRandomString five times, using :RunMultipleTimes
echo.
Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%]" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"

echo.
echo save as previous, but using USESPECIALCHARS, random string will now include these characters ^& ^< ^> ^^ ^|
echo these characters are all properly escaped by default so they will appear with a simple echo and no delayed expansion
echo.
Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] USESPECIALCHARS" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"

echo.
echo save as previous, but using USESPACE instead, random string will now include spaces
echo the space are all escaped by default 
echo.
Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] USESPACE" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"

echo.
echo save as previous, but using USEEXCLAMATION instead, random string will now include exclamations
echo the exclamation are all escaped by default 
echo.
Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] USEEXCLAMATION" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"

echo.
echo save as previous, but using USEPERCENT instead, random string will now include percent signs
echo these percent signs are all properly escaped by default
echo.
Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] USEPERCENT" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"

echo.
echo save as previous, but using USEQUOTES instead, random string will now include doublequotes
echo these double quotes are all properly escaped by default
echo.
Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] USEQUOTES" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"

echo.
echo save as previous, but using USEDELIMITERS instead, random string will now include delimiter characters ^= ^; ^,
echo.
Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] USEDELIMITERS" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"

echo.
echo save as previous, but using all the previous option together
echo USESPECIALCHARS USESPACE USEEXCLAMATION USEPERCENT USEQUOTES USEDELIMITERS
echo.
Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] USESPECIALCHARS USESPACE USEEXCLAMATION USEPERCENT USEQUOTES USEDELIMITERS" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"

echo.
echo save as previous, but with option USEALLCHARS, which should be same as all options enabled
echo.
Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] USEALLCHARS" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"


echo.
echo with options USESPACE USEEXCLAMATION USEQUOTES USEPERCENT USEDELIMITERS
echo but also DONTESCAPE (everything but special characters)
echo.
Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] DONTESCAPE USESPACE USEEXCLAMATION USEQUOTES USEPERCENT USEDELIMITERS" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"

:AddEscapeCharacters-AND-GetRandomString-DEMOv2-skip1

del AddEscapeCharacters-AND-GetRandomString-DEMO.txt

echo.
echo with options USESPACE USEEXCLAMATION USEQUOTES USEPERCENT USEDELIMITERS
echo but also DONTESCAPE (everything but special characters)
echo and output to file AddEscapeCharacters-AND-GetRandomString-DEMO.txt
echo.
Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] DONTESCAPE USESPACE USEEXCLAMATION USEQUOTES USEPERCENT USEDELIMITERS" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%>>AddEscapeCharacters-AND-GetRandomString-DEMO.txt"

echo. 
echo Reading back from previous file, one line at a file 
echo Using readline
echo.
Call :Readline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 1 myreadline
echo %myreadline%
Call :Readline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 2 myreadline
echo %myreadline%
Call :Readline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 3 myreadline
echo %myreadline%
Call :Readline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 4 myreadline
echo %myreadline%
Call :Readline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 5 myreadline
echo %myreadline%

echo. 
echo Reading back from previous file, one line at a file 
echo Using printline
echo.
Call :Printline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 1 
Call :Printline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 2 
Call :Printline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 3 
Call :Printline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 4 
Call :Printline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 5 


REM Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] DONTESCAPE" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"



GoTo :EOF





REM call :GetRandomString 29 myteststring USESPECIALCHARS DONTESCAPE
REM call :GetRandomString 29 myteststring DONTESCAPE USEALLCHARS
REM call :GetRandomString 29 myteststring DONTESCAPE USESPECIALCHARS USEPERCENT USEEXCLAMATION USEDELIMITERS
REM call :GetRandomString 1000 myteststring DONTESCAPE USESPECIALCHARS USEPERCENT USEEXCLAMATION USEDELIMITERS
REM call :GetRandomString 30 myteststring DONTESCAPE 
Call :GetRandomString 3000 myteststring DONTESCAPE 
Call :len myteststring.len2 myteststring
Call :AddEscapeCharacters myteststring  myescapedstring
Call :len myescapedstring.len2 myescapedstring

:AddEscapeCharacters-AND-GetRandomString-DEMOv2
:AddEscapeCharacters-AND-GetRandomString-DEMOv2-output
echo I %myteststring.len% %myteststring.len2% "%myteststring%"
echo O %myescapedstring.len% %myescapedstring.len2%  %myescapedstring%
echo I %myteststring.len% %myteststring.len2% "%myteststring%">>randomstring.txt
echo O %myescapedstring.len% %myescapedstring.len2%  %myescapedstring%>>randomstring.txt
setlocal enabledelayedexpansion
echo II !myteststring.len! !myteststring.len2!  !myteststring!
echo OO !myescapedstring.len! !myescapedstring.len2!  !myescapedstring!
echo II !myteststring.len! !myteststring.len2!  !myteststring!>>randomstring.txt
echo OO !myescapedstring.len! !myescapedstring.len2!  !myescapedstring!>>randomstring.txt
endlocal
REM set my
GoTo :EOF




:AddEscapeCharacters-AND-GetRandomString-DEMOv1

REM set debug=true

REM Call :PrintCharMap 
REM goto :eof
Call :ClearVariablesByPrefix _GetRandomString
Call :ClearVariablesByPrefix _AddEscapeCharacters
echo new attempt>>randomstring.txt

set "myteststring=" & set "myescapedstring=" & set "myteststring.len=" & set "myescapedstring.len="
REM call :GetRandomString 29 myteststring USESPECIALCHARS DONTESCAPE
REM call :GetRandomString 29 myteststring DONTESCAPE USEALLCHARS
REM call :GetRandomString 29 myteststring DONTESCAPE USESPECIALCHARS USEPERCENT USEEXCLAMATION USEDELIMITERS
REM call :GetRandomString 1000 myteststring DONTESCAPE USESPECIALCHARS USEPERCENT USEEXCLAMATION USEDELIMITERS
REM call :GetRandomString 30 myteststring DONTESCAPE 
call :GetRandomString 3000 myteststring DONTESCAPE 
Call :len myteststring.len2 myteststring

Call :AddEscapeCharacters myteststring  myescapedstring
Call :len myescapedstring.len2 myescapedstring



echo I1 %myteststring.len% %myteststring.len2% "%myteststring%"
echo I1 %myteststring.len% %myteststring.len2% "%myteststring%">>randomstring.txt
setlocal enabledelayedexpansion
Call :len myteststring.len myteststring
echo I2 !myteststring.len! !myteststring.len2!  !myteststring!
echo I2 !myteststring.len! !myteststring.len2!  !myteststring!>>randomstring.txt
endlocal
echo O1 %myescapedstring.len% %myescapedstring.len2%  %myescapedstring%
echo O1 %myescapedstring.len% %myescapedstring.len2%  %myescapedstring%>>randomstring.txt
setlocal enabledelayedexpansion
echo O2 !myescapedstring.len! !myescapedstring.len2!  !myescapedstring!
echo O2 !myescapedstring.len! !myescapedstring.len2!  !myescapedstring!>>randomstring.txt
endlocal
REM set my
goto :AddEscapeCharacters-AND-GetRandomString-DEMO

GoTo :EOF



:Performance-timer-DEMO


Call :ClearVariablesByPrefix "app.timer" _StartTimer _UpdateTimer _PrintTimer _ClearTimer _UpdateTimerAndPrint _GetTimeDifference _UTAP _GTD 

echo.
echo First test, running StartTimer, then UpdateTimer a bunch of time, then PrintTimer
echo then showing the whole app.timer.default structure 
echo then calling ClearTimer, now app.timer.default should not be defined
echo.
Call :StartTimer 
Call :UpdateTimer
Call :UpdateTimer
Call :UpdateTimer
Call :UpdateTimer
Call :UpdateTimer
Call :UpdateTimer
Call :UpdateTimer
Call :PrintTimer
echo.
echo.
set app.timer.default
Call :ClearTimer
set app.timer.default
echo.

echo.
echo Same test as previous, but a comment is included on each step 
echo empty variable required to fullfill "semi-optional" argument
echo.
Call :StartTimer "" "This is start timer" 
Call :UpdateTimer "" "This is update 1"
Call :UpdateTimer "" "This is update 2"
Call :UpdateTimer "" "This is update 3"
Call :UpdateTimer "" "This is update 4"
Call :UpdateTimer "" "This is update 5"
Call :UpdateTimer "" "This is update 6"
Call :UpdateTimer "" "This is update 7"
Call :PrintTimer
echo.
echo.
set app.timer.default
Call :ClearTimer
set app.timer.default
echo.


echo.
echo Same test as previous, but with a named timer
echo.
Call :StartTimer NamedTimer1 "This is start timer" 
Call :UpdateTimer NamedTimer1 "This is update 1"
Call :UpdateTimer NamedTimer1 "This is update 2"
Call :UpdateTimer NamedTimer1 "This is update 3"
Call :UpdateTimer NamedTimer1 "This is update 4"
Call :UpdateTimer NamedTimer1 "This is update 5"
Call :UpdateTimer NamedTimer1 "This is update 6"
Call :UpdateTimer "NamedTimer1" "This is update 7"
Call :PrintTimer NamedTimer1
echo.
echo.
set app.timer
Call :ClearTimer NamedTimer1
set app.timer
echo.

echo.
echo Same test as previous, but with two named timers and interlaced updates
echo no longer showing app.timer structure
echo.
Call :StartTimer NamedTimer2 "Th2s is start timer" 
Call :StartTimer NamedTimer3 "Th3s is start timer" 
Call :UpdateTimer NamedTimer2 "Th2s is update 1"
Call :UpdateTimer NamedTimer3 "Th3s is update 1"
Call :UpdateTimer NamedTimer2 "Th2s is update 2"
Call :UpdateTimer NamedTimer3 "Th3s is update 2"
Call :UpdateTimer NamedTimer2 "Th2s is update 3"
Call :UpdateTimer NamedTimer3 "Th3s is update 3"
Call :UpdateTimer NamedTimer2 "Th2s is update 4"
Call :UpdateTimer NamedTimer3 "Th3s is update 4"
Call :UpdateTimer NamedTimer2 "Th2s is update 5"
Call :UpdateTimer NamedTimer3 "Th3s is update 5"
Call :UpdateTimer NamedTimer2 "Th2s is update 6"
Call :UpdateTimer NamedTimer3 "Th3s is update 6"
Call :UpdateTimer "NamedTimer2" "Th2s is update 7"
Call :UpdateTimer "NamedTimer3" "Th3s is update 7"
Call :PrintTimer NamedTimer2
Call :PrintTimer NamedTimer3
Call :ClearTimer NamedTimer2
Call :ClearTimer NamedTimer3
echo.


echo.
echo Single named timer, testing sleep function in between
echo.
Call :StartTimer NamedTimer1 "This is start timer" 
Call :UpdateTimer NamedTimer1 "This is update 1"
Call :Sleep
Call :UpdateTimer NamedTimer1 "This is update 2"
Call :Sleep
Call :Sleep
Call :Sleep
Call :Sleep
Call :UpdateTimer NamedTimer1 "This is update 3"
Call :Sleep
Call :Sleep
Call :Sleep
Call :Sleep
Call :UpdateTimer NamedTimer1 "This is update 4"
Call :Sleep
Call :UpdateTimer NamedTimer1 "This is update 5"
Call :Sleep
Call :UpdateTimer NamedTimer1 "This is update 6"
Call :UpdateTimer "NamedTimer1" "This is update 7"
Call :PrintTimer NamedTimer1
Call :ClearTimer NamedTimer1
echo.

GoTo :EOF

::Usage Call :Sleep optional millis=1000
:Sleep
Call :SetIfNotDefined "%~1" _Sleep_millis
Call :SetIfNotDefined 1000 _Sleep_millis
set /a "_Sleep_loop_count=%_Sleep_millis%/10"
for /l %%a in (1,1,%_Sleep_loop_count%) do ( ping -n 1 -w 127.0.0.1 > nul )
GoTo :EOF


::Usage Call :StartTimer semi-optional TimerName optional TimeComment
:StartTimer 
Call :SetIfNotDefined "%~1" _StartTimer_TimerName "%~2" _StartTimer_TimerComment
Call :SetIfNotDefined default _StartTimer_TimerName
set "_StartTimer_TimerName=app.timer.%_StartTimer_TimerName%"
set /a "%_StartTimer_TimerName%.lbound=0" & set /a "%_StartTimer_TimerName%.ubound=0"
set "%_StartTimer_TimerName%[0].comment=%_StartTimer_TimerComment%"
set "%_StartTimer_TimerName%[0].date=%date%"
set "%_StartTimer_TimerName%[0].time=%time: =0%"
Call :ClearVariablesByPrefix _StartTimer
GoTo :EOF

::Usage Call :UpdateTimer semi-optional TimerName optional TimeComment
:UpdateTimer 
Call :SetIfNotDefined "%~1" _UpdateTimer_TimerName "%~2" _UpdateTimer_TimerComment
Call :SetIfNotDefined default _UpdateTimer_TimerName
set "_UpdateTimer_TimerName=app.timer.%_UpdateTimer_TimerName%"
set /a "%_UpdateTimer_TimerName%.ubound+=1"
Call set /a "_UpdateTimer_ubound=%%%_UpdateTimer_TimerName%.ubound%%"
set "%_UpdateTimer_TimerName%[%_UpdateTimer_ubound%].comment=%_UpdateTimer_TimerComment%"
set "%_UpdateTimer_TimerName%[%_UpdateTimer_ubound%].date=%date%"
set "%_UpdateTimer_TimerName%[%_UpdateTimer_ubound%].time=%time: =0%"
Call :ClearVariablesByPrefix _UpdateTimer
GoTo :EOF

::Usage Call :UpdateTimerAndPrint semi-optional TimerName optional TimeComment
:UpdateTimerAndPrint
set "_UpdateTimerAndPrint_prefix=_UTAP"
Call :SetIfNotDefined "%~1" _UTAP_TimerName "%~2" _UTAP_TimerComment
Call :SetIfNotDefined default _UTAP_TimerName
set "_UTAP_TimerName=app.timer.%_UTAP_TimerName%"
set /a "%_UTAP_TimerName%.ubound+=1"
Call set /a "_UTAP_ubound=%%%_UTAP_TimerName%.ubound%%"
set "%_UTAP_TimerName%[%_UTAP_ubound%].comment=%_UTAP_TimerComment%"
set "%_UTAP_TimerName%[%_UTAP_ubound%].date=%date%"
set "%_UTAP_TimerName%[%_UTAP_ubound%].time=%time: =0%"
set /a "_UTAP_pbound=%_UTAP_ubound%-1"
Call :GetTimeDifference %%%_UTAP_TimerName%[%_UTAP_pbound%].time%% %%%_UTAP_TimerName%[%_UTAP_ubound%].time%% _UTAP_TimeDifference
echo Time elapsed [%_UTAP_TimeDifference%]
Call :ClearVariablesByPrefix %_UpdateTimerAndPrint_prefix% _UpdateTimerAndPrint
GoTo :EOF


::Usage Call :PrintTimer optional TimerName
:PrintTimer
Call :SetIfNotDefined "%~1" _PrintTimer_TimerName
Call :SetIfNotDefined default _PrintTimer_TimerName
set "_PrintTimer_TimerName=app.timer.%_PrintTimer_TimerName%"
set /a "_PrintTimer_previous=-1"
set /a "_PrintTimer_index=0"
call set /a "_PrintTimer_ubound=%%%_PrintTimer_TimerName%.ubound%%"
:PrintTimer-loop
if %_PrintTimer_index% GTR 0 Call :GetTimeDifference %%%_PrintTimer_TimerName%[%_PrintTimer_previous%].time%% %%%_PrintTimer_TimerName%[%_PrintTimer_index%].time%% _PrintTimer_TimeDifference
call echo %_PrintTimer_TimerName% [%_PrintTimer_index%] %%%_PrintTimer_TimerName%[%_PrintTimer_index%].date%% %%%_PrintTimer_TimerName%[%_PrintTimer_index%].time%% : diff [%_PrintTimer_TimeDifference%] : %%%_PrintTimer_TimerName%[%_PrintTimer_index%].comment%% 
set /a "_PrintTimer_previous+=1"
set /a "_PrintTimer_index+=1"
if %_PrintTimer_index% LEQ %_PrintTimer_ubound% GoTo :PrintTimer-loop
Call :ClearVariablesByPrefix _PrintTimer
GoTo :EOF

::Usage Call :ClearTimer optional TimerName
:ClearTimer
Call :SetIfNotDefined "%~1" _ClearTimer_TimerName
Call :SetIfNotDefined default _ClearTimer_TimerName
set "_ClearTimer_TimerName=app.timer.%_ClearTimer_TimerName%"
Call :ClearVariablesByPrefix %_ClearTimer_TimerName%
Call :ClearVariablesByPrefix _ClearTimer
GoTo :EOF


::Usage Call :GetTimeDifference Time1 Time2 DifferenceOutput
:GetTimeDifference 
set "_GetTimeDifference_prefix=_GTD"
Call :SetIfNotDefined "%~1" _GTD_Time1 "%~2" _GTD_Time2
setlocal EnableDelayedExpansion
set "_GTD_Time2_cent=!_GTD_Time2:%time:~8,1%=%%100)*100+1!"  &  set "_GTD_Time1_cent=!_GTD_Time1:%time:~8,1%=%%100)*100+1!"
set /A "_GTD_elapsed=((((10!_GTD_Time2_cent:%time:~2,1%=%%100)*60+1!%%100)-((((10!_GTD_Time1_cent:%time:~2,1%=%%100)*60+1!%%100), elap-=(elap>>31)*24*60*60*100"
endlocal & set "%~3=%_GTD_elapsed%"
Call :ClearVariablesByPrefix "%_GetTimeDifference_prefix%" _GetTimeDifference
GoTo :EOF
::With help from https://stackoverflow.com/questions/9922498/



rem Convert elapsed time to HH:MM:SS:CC format:
set /A "cc=elap%%100+100,elap/=100,ss=elap%%60+100,elap/=60,mm=elap%%60+100,hh=elap/60+100"

echo Start:    %startTime%
echo End:      %endTime%
echo Elapsed:  %hh:~1%%time:~2,1%%mm:~1%%time:~2,1%%ss:~1%%time:~8,1%%cc:~1%



::Usage Call :GetTime 
:GetTimer TimerName OutputValue semi-optional TimerName optional TimeComment
Call :SetIfNotDefined "%~1" _GetTimer_Output "%~2" _GetTimer_TimerComment "%~3" _GetTimer_TimerComment
Call :SetIfNotDefined default _GetTimer_TimerName



REM Function Library

::Usage Call :IsEqual StringA StringB optional OutputBool && echo it is true (errorlevel 0) || echo it is false (errorlevel not 0)
:IsEqual
setlocal enabledelayedexpansion
endlocal & if "[%~3]" NEQ "[]"


::Usage Call :RunMultipleTimes RunCount "Your Command here"
:RunMultipleTimes
set /a "_RunMultipleTimes_index=0"
set /a "_RunMultipleTimes_ubound=%~1"
shift
:RunMultipleTimes-loop
%~1
%~2
%~3
%~4
%~5
%~6
%~7
%~8
%~9
set /a "_RunMultipleTimes_index+=1"
if %_RunMultipleTimes_index% LSS %_RunMultipleTimes_ubound% GoTo :RunMultipleTimes-loop
GoTo :EOF

:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :ClearVariablesByPrefix
GoTo :EOF

::Usage Call :SetIfNotDefined "%ValueIfUnset%" OutputVariable optional VariableName2 "%ValueIfUnset2%" optional optional VariableNameN "%ValueIfUnsetN%"
:SetIfNotDefined
set "_SetIfNotDefined_Output=%~2"
if not defined %_SetIfNotDefined_Output% set "%_SetIfNotDefined_Output%=%~1"
if not "[%~4]"=="[]" shift & shift & GoTo :SetIfNotDefined
set "_SetIfNotDefined_Output="
GoTo :EOF

::Usage Call :Readline Filename LineNumber OutputVariable
:Readline
Call :SetIfNotDefined "%~1" _Readline_Filename "%~2" _Readline_LineNumber "%~3" _Readline_Output 0 _Readline_Index
setlocal enabledelayedexpansion
for /f "delims=" %%a in (%_Readline_Filename%) do (
    set /a "_Readline_Index+=1"
    if !_Readline_Index! equ %_Readline_LineNumber% set _Readline_Intermediate=%%a
	if !_Readline_Index! equ %_Readline_LineNumber% GoTo :Readline-end
)
:Readline-end
endlocal & set %_Readline_Output%=%_Readline_Intermediate%
Call :ClearVariablesByPrefix _Readline
GoTo :EOF

REM ::Usage Call :Printline Filename LineNumber 
REM :Printline
REM Call :SetIfNotDefined "%~1" _Printline_Filename "%~2" _Printline_LineNumber 0 _Printline_Index
REM setlocal enabledelayedexpansion
REM for /f "delims=" %%a in (%_Printline_Filename%) do (
    REM set /a "_Printline_Index+=1"
    REM if !_Printline_Index! equ %_Printline_LineNumber% echo %%a
	REM if !_Printline_Index! equ %_Printline_LineNumber% GoTo :Printline-end
REM )
REM :Printline-end
REM endlocal 
REM Call :ClearVariablesByPrefix _Printline
REM GoTo :EOF

REM ::Usage Call :Printline Filename LineNumber 
:Printline
Call :SetIfNotDefined "%~1" _Printline_Filename "%~2" _Printline_LineNumber 0 _Printline_Index
setlocal enabledelayedexpansion
for /f "delims=" %%a in (%_Printline_Filename%) do (
    set /a "_Printline_Index+=1"
    REM if !_Printline_Index! equ %_Printline_LineNumber% echo %%a
	if !_Printline_Index! equ %_Printline_LineNumber% (
		endlocal
		echo %%a
		setlocal enabledelayedexpansion
	)
	if !_Printline_Index! equ %_Printline_LineNumber% GoTo :Printline-end
)
:Printline-end
endlocal 
Call :ClearVariablesByPrefix _Printline
GoTo :EOF

::Usage Call :PrintCharMap FULLRANGE
:PrintCharMap
set /a "_PrintCharMap_index=32" & set /a "_PrintCharMap_count=126"
if "[%~1]"=="[FULLRANGE]" set /a "_PrintCharMap_index=0" & set /a "_PrintCharMap_count=255"
:PrintCharMap-loop
cmd /c exit %_PrintCharMap_index%
setlocal enabledelayedexpansion
echo %_PrintCharMap_index% !=exitcodeascii!

endlocal
set /a "_PrintCharMap_index+=1"
if %_PrintCharMap_index% LEQ %_PrintCharMap_count% GoTo :PrintCharMap-loop
GoTo :EOF

rem <space> ()[]{}=;'+,`~    ! @"
rem ^& ^< ^> ^^ ^| ^" ^! %
rem escape function for regex
rem escape function for  powershell
rem escape function for web url style%20%


REM if "!=exitcodeascii!"==""^" echo it is "

REM if "!=exitcodeascii!"==" " echo it is space
REM if "!=exitcodeascii!"=="(" echo it is (
REM if "!=exitcodeascii!"==")" echo it is )
REM if "!=exitcodeascii!"=="[" echo it is [
REM if "!=exitcodeascii!"=="]" echo it is ]
REM if "!=exitcodeascii!"=="{" echo it is {
REM if "!=exitcodeascii!"=="}" echo it is }
REM if "!=exitcodeascii!"=="=" echo it is =
REM if "!=exitcodeascii!"==";" echo it is ;
REM if "!=exitcodeascii!"=="'" echo it is '
REM if "!=exitcodeascii!"=="+" echo it is +
REM if "!=exitcodeascii!"=="," echo it is ,
REM if "!=exitcodeascii!"=="`" echo it is `
REM if "!=exitcodeascii!"=="~" echo it is ~
REM if "!=exitcodeascii!"=="@" echo it is @

REM if "!=exitcodeascii!"=="^!" echo it is exclamation

REM if "!=exitcodeascii!"=="%%" echo it is %%
REM if "!=exitcodeascii!"=="^" echo it is ^^
REM if "!=exitcodeascii!"=="&" echo it is ^&
REM if "!=exitcodeascii!"=="<" echo it is ^<
REM if "!=exitcodeascii!"==">" echo it is ^>
REM if "!=exitcodeascii!"=="|" echo it is ^|





::Usage Call :EchoArguments Argument1 Argument2 ArgumentN
:EchoArguments
if "[%_EchoArguments.index%]"=="[]" set /a "_EchoArguments.index=1"
echo Argument                        #%_EchoArguments.index% ^|"%1"^| unquoted ^|"%~1"^|
echo Argument                        #%_EchoArguments.index% ^|%1^| unquoted ^|%~1^|
setlocal enabledelayedexpansion
echo Argument with delayed expansion #!_EchoArguments.index! ^|"%1"^| unquoted ^|"%~1"^|
echo Argument with delayed expansion #!_EchoArguments.index! ^|%1^| unquoted ^|%~1^|
endlocal
set /a "_EchoArguments.index+=1"
shift
setlocal enabledelayedexpansion
if "[%~1]" NEQ "[]" ( set "_EchoArguments_argument_remaining=true" ) else ( set "_EchoArguments_argument_remaining=false" ) 
echo.
endlocal & if "[%_EchoArguments_argument_remaining%]"=="[true]" GoTo :EchoArguments
Call :ClearVariablesByPrefix _EchoArguments
GoTo :EOF

::Usage Call :lenByRef OutputResult %VariableName%
:: 8172 max lenght, breaks batch file if len=8173 WRONG
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
    exit /b
)


REM escape delimiters , reject delimiters
REM separate count for escaped and included characters
::Usage Call :GetRandomString CharacterCount OutputString USESPECIALCHARS DONTESCAPE FULLRANGE
:GetRandomString
set "_GetRandomString_prefix=_GSR"
Call :SetIfNotDefined "%~1" _GSR_count "%~2" _GSR_output
REM set /a "_GSR_count=%~1"
REM set "_GSR_output=%~2"
set "_GSR_space_genlist=32 "
set "_GSR_exclamation_genlist=33 "
set "_GSR_quotes_genlist=34 "
set "_GSR_percent_genlist=37 "
set "_GSR_special_genlist=38 60 62 94 124 "
set "_GSR_delimiter_genlist=44 59 61 "
set "_GSR_special_esclist=38 60 62 94 124 "
set "_GSR_delimiter_esclist=44 59 61 "
set "_GSR_special_escape_char=^^^"
set "_GSR_quotes_escape_char=^^^"
set "_GSR_percent_escape_char=%%%%"
set "_GSR_exclamation_escape_char=^^^"
set "_GSR_bracket_escape_char=^^^"
set "_GSR_delimiter_escape_char=^^^"
set "_GSR_extdelimiter_escape_char=^^^"
set "_GSR_special_esccharcount=3"
set "_GSR_space_esccharcount=3"
set "_GSR_quote_esccharcount=3"
set "_GSR_exclamation_esccharcount=3"
set "_GSR_percent_esccharcount=3"
set "_GSR_bracket_esccharcount=0"
set "_GSR_delimiter_esccharcount=3"
set "_GSR_extdelimiter_esccharcount=0"
:GetRandomString-arguments
if "[%~3]" EQU "[USEALLCHARS]" set "_GSR_useallchar=true"
if "[%~3]" EQU "[DONTESCAPE]" set "_GSR_dontescape=true"
if "[%~3]" EQU "[FULLRANGE]" set "_GSR_fullrange=true"
if "[%~3]" EQU "[USESPECIALCHARS]" set "_GSR_special_genlist="
if "[%~3]" EQU "[USESPACE]" set "_GSR_space_genlist="
if "[%~3]" EQU "[USEEXCLAMATION]" set "_GSR_exclamation_genlist="
if "[%~3]" EQU "[USEQUOTES]" set "_GSR_quotes_genlist="
if "[%~3]" EQU "[USEPERCENT]" set "_GSR_percent_genlist="
if "[%~3]" EQU "[NOBRACKETS]" set "_GSR_bracket_genlist=40 41 91 93 123 125 "
if "[%~3]" EQU "[USEDELIMITERS]" set "_GSR_delimiter_genlist="
if "[%~3]" EQU "[NOEXTDELIMITERS]" set "_GSR_extdelimiter_genlist=39 43 64 96 126 "
if "[%~3]" EQU "[ESCNOTSPECIAL]" ( set "_GSR_special_escape_char=^" & set "_GSR_special_esccharcount=1" )
if "[%~3]" EQU "[ESCNOTSPACE]" ( set "_GSR_space_escape_char=" & set "_GSR_space_esccharcount=0" )
if "[%~3]" EQU "[ESCNOTPERCENT]" ( set "_GSR_percent_escape_char=%%" & set "_GSR_percent_esccharcount=1" )
if "[%~3]" EQU "[ESCNOTEXCLAMATION]" ( set "_GSR_exclamation_escape_char=" & set "_GSR_exclamation_esccharcount=0" )
if "[%~3]" EQU "[ESCNOTQUOTES]" ( set "_GSR_quotes_escape_char=^" & set "_GSR_quote_esccharcount=1" )
if "[%~3]" EQU "[ESCBRACKETS]" ( set "_GSR_bracket_esclist=40 41 91 93 123 125 " & set "_GSR_bracket_esccharcount=3" )
if "[%~3]" EQU "[ESCNOTDELIMITERS]" ( set "_GSR_delimiter_esclist=" & set "_GSR_delimiter_esccharcount=0" )
if "[%~3]" EQU "[ESCEXTDELIMITERS]" ( set "_GSR_extdelimiter_esclist=39 43 64 96 126 " & set "_GSR_extdelimiter_esccharcount=3" )
if "[%~3]" EQU "[ESCNOTLASTDIGIT]" ( set "_GSR_escnot_lastdigit=true" )
if "[%~4]" NEQ "[]" ( shift & GoTo :GetRandomString-arguments )
if "[%_GSR_useallchar%]" NEQ "[true]" set "_GSR_genlist=%_GSR_special_genlist%%_GSR_exclamation_genlist%%_GSR_space_genlist%%_GSR_quotes_genlist%%_GSR_percent_genlist%%_GSR_delimiter_genlist%%_GSR_bracket_genlist%%_GSR_extdelimiter_esclist%"
if "[%_GSR_dontescape%]"=="[true]" ( set "_GSR_special_esccharcount=0" & set "_GSR_quote_esccharcount=0" & set "_GSR_exclamation_esccharcount=0" & set "_GSR_percent_esccharcount=0" & set "_GSR_delimiter_esccharcount=0" & set "_GSR_special_escape_char=^" & set "_GSR_quotes_escape_char=^" & set "_GSR_percent_escape_char=%%" & set "_GSR_exclamation_escape_char=" & set "_GSR_delimiter_esclist=" & set "_GSR_delimiter_escape_char=^" )
if "[%_GSR_fullrange%]"=="[true]" ( set "_GSR_random_min=0" & set "_GSR_random_max=255" ) else ( set "_GSR_random_min=32" & set "_GSR_random_max=126" )
set /a "_GSR_index=0" & set /a "_GSR_regular_charcount=0" & set /a "_GSR_escapecount=0"
setlocal enabledelayedexpansion
REM set _GSR
:GetRandomString-loop
set "_GSR_escape_char=" & set "_GSR_escape_charcount=0" & set "_GSR_fillerchar="
set /a "_GSR_next_ascii=%RANDOM% * (%_GSR_random_max% - %_GSR_random_min% + 1) / 32768 + %_GSR_random_min%"
for %%a in (!_GSR_genlist!) do ( if "[!_GSR_next_ascii!]"=="[%%a]" GoTo :GetRandomString-loop )
for %%a in (!_GSR_special_esclist!) do ( if "[!_GSR_next_ascii!]"=="[%%a]" ( set "_GSR_escape_char=%_GSR_special_escape_char%" & set "_GSR_escape_charcount=!_GSR_special_esccharcount!" ) )
for %%a in (!_GSR_bracket_esclist!) do ( if "[!_GSR_next_ascii!]"=="[%%a]" ( set "_GSR_escape_char=%_GSR_bracket_escape_char%" & set "_GSR_escape_charcount=!_GSR_bracket_esccharcount!" ) )
for %%a in (!_GSR_delimiter_esclist!) do ( if "[!_GSR_next_ascii!]"=="[%%a]" ( set "_GSR_escape_char=%_GSR_delimiter_escape_char%" & set "_GSR_escape_charcount=!_GSR_delimiter_esccharcount!" ) )
for %%a in (!_GSR_extdelimiter_esclist!) do ( if "[!_GSR_next_ascii!]"=="[%%a]" ( set "_GSR_escape_char=%_GSR_extdelimiter_escape_char%" & set "_GSR_escape_charcount=!_GSR_extdelimiter_esccharcount!" ) )
if "[!_GSR_next_ascii!]"=="[32]" ( set "_GSR_escape_char=%_GSR_space_escape_char%" & set "_GSR_escape_charcount=!_GSR_space_esccharcount!" )
if "[!_GSR_next_ascii!]"=="[33]" ( set "_GSR_escape_char=%_GSR_exclamation_escape_char%" & set "_GSR_escape_charcount=!_GSR_exclamation_esccharcount!" )
if "[!_GSR_next_ascii!]"=="[34]" ( set "_GSR_escape_char=%_GSR_quotes_escape_char%" & set "_GSR_escape_charcount=!_GSR_quote_esccharcount!" )
if "[!_GSR_next_ascii!]"=="[37]" ( set "_GSR_escape_char=%_GSR_percent_escape%" & set "_GSR_escape_charcount=!_GSR_percent_esccharcount!" )
cmd /c exit !_GSR_next_ascii!
if "[!=exitcodeascii!]" EQU "[]" set "_GSR_fillerchar= "
REM echo S!_GSR_intermediate! E!_GSR_escape_char! X!=exitcodeascii! SC!_GSR_isspecialchar!
set _GSR_intermediate=!_GSR_intermediate!!_GSR_escape_char!!=exitcodeascii!!_GSR_fillerchar!
set /a "_GSR_index+=1"
if "!_GSR_escape_char!" NEQ "" set /a "_GSR_escapecount+=!_GSR_escape_charcount!"
set /a "_GSR_total_char=!_GSR_index!+!_GSR_escapecount!"
REM if "!_GSR_escape_char!" NEQ "" set /a "_GSR_index+=1"
if !_GSR_total_char! LSS 8030 if !_GSR_index! LSS !_GSR_count! GoTo :GetRandomString-loop
if "[%_GSR_dontescape%]" NEQ "[true]" if "[%_GSR_escnot_lastdigit%]" NEQ "[true]" for %%a in (0 1 2 3 4 5 6 7 8 9) do (if "[!_GSR_intermediate:~-1!]"=="[%%a]" ( set /a "_GSR_escapecount+=1" & set _GSR_intermediate=!_GSR_intermediate:~,-1!^^%%a) )
if "[%debug%]"=="[true]" echo R  !_GSR_index!     !_GSR_intermediate!
if "[%debug%]"=="[true]" echo R  !_GSR_index!     !_GSR_intermediate!>>randomstring.txt
endlocal & set /a "%_GSR_output%.len=%_GSR_index%" & set /a "%_GSR_output%.lentotal=%_GSR_total_char%" & set %_GSR_output%=%_GSR_intermediate%
Call :ClearVariablesByPrefix %_GetRandomString_prefix% _GetRandomString
goto :eof


:: Default configuration 
:: Will escape space, quotes, exclamation, percent, special characters (& < > ^ |) and delimiters ()
:: but not backets (( ) [ ] { }) or extra delimiters (' + ` ~ @)
::Usage Call :AddEscapeCharacters optional  byref InputString optional OutputString
:AddEscapeCharacters
set "_AddEscapeCharacters_prefix=_AEC"
Call :SetIfNotDefined "%~1" _AEC_input "%~2" _AEC_output
Call :SetIfNotDefined "%_AEC_input%" _AEC_output
set "_AEC_special_esclist=^& ^< ^> ^^ ^|"
set "_AEC_delimiter_esclist1=^= ^; ^,"
set "_AEC_regular_escape_char=^^^"
set "_AEC_space_escape_char=^^^"
set "_AEC_quotes_escape_char=^^^"
set "_AEC_percent_escape_char=%%"
set "_AEC_exclamation_escape_char=^^^"
:AddEscapeCharacters-arguments
if "[%~3]" EQU "[NOTSPACE]" set "_AEC_space_escape_char=^"
if "[%~3]" EQU "[NOTQUOTES]" set "_AEC_quotes_escape_char=^"
if "[%~3]" EQU "[NOTEXCLAMATION]" set "_AEC_exclamation_escape_char=^^"
if "[%~3]" EQU "[NOTPERCENT]" set "_AEC_percent_escape_char=%"
if "[%~3]" EQU "[NOTSPECIAL]" set "_AEC_special_esclist="
if "[%~3]" EQU "[BRACKETS]" set "_AEC_bracket_esclist=^( ^) ^[ ^] ^{ ^}"
if "[%~3]" EQU "[NOTDELIMITERS]" set "_AEC_delimiter_esclist="
if "[%~3]" EQU "[EXTDELIMITERS]" set "_AEC_extdelimiter_esclist=^' ^+ ^` ^~ ^@"
if "[%~3]" EQU "[NOTLASTDIGIT]" set "_AEC_notlastdigit=true"
if "[%~4]" NEQ "[]" ( shift & GoTo :GetRandomString-arguments )
set "_AEC_escape_list=%_AEC_special_esclist% %_AEC_bracket_esclist% %_AEC_delimiter_esclist% %_AEC_extdelimiter_esclist%"
set /a "_AEC_input.index=0" & set /a "_AEC_output.escapechars=0" & set /a "_AEC_output.totalchars=0"
setlocal enabledelayedexpansion
:AddEscapeCharacters-loop
set "_AEC_escapechar=" & set "_AEC_input_char=!%_AEC_input%:~%_AEC_input.index%,1!"
for %%a in ( %_AEC_escape_list% ) do ( if ^!_AEC_input_char!==%%a ( set "_AEC_escapechar=!_AEC_regular_escape_char!" ) )
if "!_AEC_input_char!"==" " set "_AEC_escapechar=!_AEC_quotes_escape_char!"
if "!_AEC_input_char!"=="^!" set "_AEC_escapechar=!_AEC_exclamation_escape_char!"
if "!_AEC_input_char!"=="%%" set "_AEC_escapechar=!_AEC_percent_escape_char!"
set _AEC_intermediate=!_AEC_intermediate!!_AEC_escapechar!!_AEC_input_char!
set /a "_AEC_input.index+=1"
if "[!_AEC_escapechar!]" NEQ "[]" set /a "_AEC_output.escapechars+=1"
set /a "_AEC_output.totalchars=!_AEC_input.index!+!_AEC_output.escapechars!"
if !_AEC_output.totalchars! LSS 8030 if "!%_AEC_input%:~%_AEC_input.index%,1!" NEQ "" GoTo :AddEscapeCharacters-loop
set "_AEC_last_char=!_AEC_intermediate:~-1!"
if "[%_AEC_notlastdigit%]" NEQ ["true"] for %%a in (0 1 2 3 4 5 6 7 8 9) do ( if "[!_AEC_last_char!]"=="[%%a]" ( set /a "_AEC_input.escapechars+=1" & set /a "_AEC_output.totalchars+=1" & set _AEC_intermediate=!_AEC_intermediate:~,-1!^%%a) )
endlocal & set /a "%_AEC_output%.len=%_AEC_input.index%" & set /a "%_AEC_output%.totallen=%_AEC_output.totalchars%" & set /a "%_AEC_output%.lenesc=%_AEC_output.escapechars%" & set %_AEC_output%=%_AEC_intermediate%
Call :ClearVariablesByPrefix %_AddEscapeCharacters% _AddEscapeCharacters
GoTo :EOF



























REM ::Usage Call :lenByRef OutputResult %VariableName%
REM :: 8172 max lenght, breaks batch file if len=8173 WRONG
REM :lenByVal
REM setlocal enabledelayedexpansion
REM set _len=%~2
REM GoTo :len-skip-preamble
REM ::Usage Call :len OutputResult VariableName
REM :: 5% slower for 100 strings, maximum lenght = 8174 (will break at 8175) WRONG
REM :len
REM setlocal enabledelayedexpansion
REM echo beforesetlen
REM set _len=!%~2!
REM echo aftersetlen
REM :len-skip-preamble
REM if not defined _len set /a "_len.count=0" GoTo :len-end
REM set /a "_len.count=1"
REM if "!_len:~4096,1!" NEQ "" set /a "_len.count+=4096" & set _len=!_len:~4096!
REM if "!_len:~2048,1!" NEQ "" set /a "_len.count+=2048" & set _len=!_len:~2048!
REM if "!_len:~1024,1!" NEQ "" set /a "_len.count+=1024" & set _len=!_len:~1024!
REM if "!_len:~512,1!" NEQ "" set /a "_len.count+=512" & set _len=!_len:~512!
REM if "!_len:~256,1!" NEQ "" set /a "_len.count+=256" & set _len=!_len:~256!
REM if "!_len:~128,1!" NEQ "" set /a "_len.count+=128" & set _len=!_len:~128!
REM if "!_len:~64,1!" NEQ "" set /a "_len.count+=64" & set _len=!_len:~64!
REM if "!_len:~32,1!" NEQ "" set /a "_len.count+=32" & set _len=!_len:~32!
REM if "!_len:~16,1!" NEQ "" set /a "_len.count+=16" & set _len=!_len:~16!
REM if "!_len:~8,1!" NEQ ""  set /a "_len.count+=8" & set _len=!_len:~8!
REM if "!_len:~4,1!" NEQ ""  set /a "_len.count+=4" & set _len=!_len:~4!
REM if "!_len:~2,1!" NEQ ""  set /a "_len.count+=2" & set _len=!_len:~2!
REM if "!_len:~1,1!" NEQ ""  set /a "_len.count+=1" & set _len=!_len:~1!
REM :len-end
REM endlocal & set "_len=" & set /a "%~1=%_len.count%" & exit /b %_len.count%





:EchoSingleArgumentTest-DEMO

echo How argument with ampersand in them work
echo result : no argument with ampersand allowed byval

echo argument with ^& ( )
Call :EchoSingleArgumentTest A1rgum&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^& ( )
Call :EchoSingleArgumentTest A2rgum^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^& ( )
Call :EchoSingleArgumentTest A3rgum^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^& ( )
Call :EchoSingleArgumentTest A4rgum^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^& ( )
Call :EchoSingleArgumentTest A5rgum^^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest A6rgum^^^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest A7rgum^^^^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest A8rgum^^^^^^^&ent1 Argument2 ArgumentN
echo.

echo argument with ^& ( )
Call :EchoSingleArgumentTest "A1rgum&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^& ( )
Call :EchoSingleArgumentTest "A2rgum^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^& ( )
Call :EchoSingleArgumentTest "A3rgum^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^& ( )
Call :EchoSingleArgumentTest "A4rgum^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A5rgum^^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A6rgum^^^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A7rgum^^^^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A8rgum^^^^^^^&ent1 Argument2 ArgumentN
echo.

echo argument with ^& ( )
Call :EchoSingleArgumentTest "A1rgum&ent1 Argument2 ArgumentN"
echo.
echo argument with ^^^& ( )
Call :EchoSingleArgumentTest "A2rgum^&ent1 Argument2 ArgumentN"
echo.
echo argument with ^^^^^& ( )
Call :EchoSingleArgumentTest "A3rgum^^&ent1 Argument2 ArgumentN"
echo.
echo argument with ^^^^^^^& ( )
Call :EchoSingleArgumentTest "A4rgum^^^&ent1 Argument2 ArgumentN"
echo.
echo argument with ^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A5rgum^^^^&ent1 Argument2 ArgumentN"
echo.
echo argument with ^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A6rgum^^^^^&ent1 Argument2 ArgumentN"
echo.
echo argument with ^^^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A7rgum^^^^^^&ent1 Argument2 ArgumentN"
echo.
echo argument with ^^^^^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A8rgum^^^^^^^&ent1 Argument2 ArgumentN"
echo.

GoTo :EOF


:EchoSingleArgumentTest
echo testtext1 %1
echo testtext2 %~1
echo testtext3 "%1"
echo testtext4 "%~1"
setlocal enabledelayedexpansion
echo testtext5 %1
echo testtext6 %~1
echo testtext7 "%1"
echo testtext8 "%~1"
endlocal
echo testtex21 %2
echo testtex22 %~2
echo testtex23 "%2"
echo testtex24 "%~2"
setlocal enabledelayedexpansion
echo testtex25 %2
echo testtex26 %~2
echo testtex27 "%2"
echo testtex28 "%~2"

endlocal
GoTo :EOF


:EchoArguments-DEMO

Call :ClearVariablesByPrefix _EchoArguments

REM 32 space
REM 33 !
REM 34 "
REM 37 %
REM 38 &
REM 39 '
REM 40 (
REM 41 )
REM 43 +
REM 44 ,
REM 59 ;
REM 60 <
REM 61 =
REM 62 >
REM 64 @
REM 91 [
REM 93 ]
REM 94 ^
REM 96 `
REM 123 {
REM 124 |
REM 125 }
REM 126 ~

echo single argument1
Call :EchoArguments Argument1 
echo three arguments
Call :EchoArguments Argument1 Argument2 ArgumentN
echo argument with space
Call :EchoArguments Argum ent1 Argument2 ArgumentN
echo argument with ! (strange behaviour with delayed expansion as expected)
Call :EchoArguments Argum!ent1 Argument2 ArgumentN
echo argument with " (quote turns all arguments into one argument, in :EchoArguments, it also turns the rest of the line into a quote !)
Call :EchoArguments Argum"ent1 Argument2 ArgumentN
echo argument with %
Call :EchoArguments Argum%ent1 Argument2 ArgumentN
echo argument with %%
Call :EchoArguments Argum%%ent1 Argument2 ArgumentN
echo argument with %%%% (only this one still has a single %% in the final output)
Call :EchoArguments Argum%%%%ent1 Argument2 ArgumentN

echo argument with ^& (this runs Call :EchoArguments with Argum, then tried to run "ent1" 
Call :EchoArguments Argum&ent1 Argument2 ArgumentN
echo argument with ^^^& (this does not even execute the first line of code in :EchoArguments, without errors)
Call :EchoArguments Argum^&ent1 Argument2 ArgumentN
echo argument with ^^^^^& (DISABLED) ( this runs Call :EchoArguments with Argum^^^^ , trailing carret will break code, argument get trunkated )
REM Call :EchoArguments Argum^^&ent1 Argument2 ArgumentN
echo argument with ^^^^^^^& (this does not even execute the first line of code in :EchoArguments, without errors)
Call :EchoArguments Argum^^^&ent1 Argument2 ArgumentN
echo argument with ^^^^^^^^^& (DISABLED) ( this runs Call :EchoArguments with Argum^^^^^^ , trailing carret will break code, argument get trunkated )
REM Call :EchoArguments Argum^^^^&ent1 Argument2 ArgumentN
echo argument with ^^^^^^^^^^^& (this does not even execute the first line of code in :EchoArguments, without errors)
Call :EchoArguments Argum^^^^^&ent1 Argument2 ArgumentN
echo argument with ^^^^^^^^^^^^^& (DISABLED) ( this runs Call :EchoArguments with Argum^^^^^^^^ , trailing carret will break code, argument get trunkated )
REM Call :EchoArguments Argum^^^^^^&ent1 Argument2 ArgumentN
echo argument with ^^^^^^^^^^^^^^^& (this does not even execute the first line of code in :EchoArguments, without errors)
Call :EchoArguments Argum^^^^^^^&ent1 Argument2 ArgumentN

echo argument with '
Call :EchoArguments Argum'ent1 Argument2 ArgumentN
echo argument with (
Call :EchoArguments Argum(ent1 Argument2 ArgumentN
echo argument with )
Call :EchoArguments Argum)ent1 Argument2 ArgumentN
echo argument with +
Call :EchoArguments Argum+ent1 Argument2 ArgumentN
echo argument with , (this does split the argument)
Call :EchoArguments Argum,ent1 Argument2 ArgumentN
echo argument with ; (this does split the argument)
Call :EchoArguments Argum;ent1 Argument2 ArgumentN
echo argument with ^< (trunkates first argument at Argum ,no error when ent1 doesn't exist, rest of the argument intacts)
Call :EchoArguments Argum<ent1 Argument2 ArgumentN
echo argument with ^^&< ( not checked but probably same pattern as ampersand)
Call :EchoArguments Argum^<ent1 Argument2 ArgumentN
echo argument with = (this does split the argument)
Call :EchoArguments Argum=ent1 Argument2 ArgumentN
echo argument with ^> (like ^^^&, this does not even execute the first line of code in :EchoArguments, without errors))
Call :EchoArguments Argum>ent1 Argument2 ArgumentN
echo argument with ^^^> ( creates a file called ent1 )
Call :EchoArguments Argum^>ent1 Argument2 ArgumentN
echo argument with @
Call :EchoArguments Argum@ent1 Argument2 ArgumentN
echo argument with [
Call :EchoArguments Argum[ent1 Argument2 ArgumentN
echo argument with ]
Call :EchoArguments Argum]ent1 Argument2 ArgumentN
echo argument with ^^ (the single ^^ disappears)
Call :EchoArguments Argum^ent1 Argument2 ArgumentN
echo argument with ^^^^ (the single ^^ disappears)
Call :EchoArguments Argum^^ent1 Argument2 ArgumentN
echo argument with `
Call :EchoArguments Argum`ent1 Argument2 ArgumentN
echo argument with {
Call :EchoArguments Argum{ent1 Argument2 ArgumentN
REM echo argument with ^| (this actually breaks :EchoArguments)
REM Call :EchoArguments Argum|ent1 Argument2 ArgumentN
echo argument with ^| (like ^^^& and ^^^>, this does not even execute the first line of code in :EchoArguments, without errors))
Call :EchoArguments Argum^|ent1 Argument2 ArgumentN
echo argument with }
Call :EchoArguments Argum}ent1 Argument2 ArgumentN
echo argument with ~
Call :EchoArguments Argum~ent1 Argument2 ArgumentN




REM Call :EchoArguments Argum(ent1 Argument2 ArgumentN
REM Call :EchoArguments Argum)ent1 Argument2 ArgumentN
REM Call :EchoArguments Argum[ent1 Argument2 ArgumentN
REM Call :EchoArguments Argum]ent1 Argument2 ArgumentN
REM Call :EchoArguments Argum{ent1 Argument2 ArgumentN
REM Call :EchoArguments Argum}ent1 Argument2 ArgumentN
REM Call :EchoArguments Argum+ent1 Argument2 ArgumentN
REM Call :EchoArguments Argum,ent1 Argument2 ArgumentN
REM Call :EchoArguments Argum`ent1 Argument2 ArgumentN
REM Call :EchoArguments Argum~ent1 Argument2 ArgumentN
REM Call :EchoArguments Argum@ent1 Argument2 ArgumentN
REM Call :EchoArguments Argum'ent1 Argument2 ArgumentN


GoTo :EOF
