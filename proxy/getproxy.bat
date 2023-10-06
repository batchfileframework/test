@echo off
:setup
:main
Set "_GetProxy_query=%~1"
if not defined _GetProxy_query set "_GetProxy_query=http://www.google.com"
Call :GetProxy "%_GetProxy_query%"
GoTo :EOF

::Usage Call :GetProxy DestinationHost
:GetProxy
set "_GetProxy_Destination=%~1"
Call :PrepareProxyFile _GetProxy_ProxyFile
echo for /f "delims=" %%a in ('%systemroot%\System32\cscript.exe //E:jscript //nologo "%_GetProxy_ProxyFile%" "%_GetProxy_Destination%"') do set "_GetProxy_Result=%%a"
for /f "delims=" %%a in ('%systemroot%\System32\cscript.exe //E:jscript //nologo "%_GetProxy_ProxyFile%" "%_GetProxy_Destination%"') do set "_GetProxy_Result=%%a"
echo %_GetProxy_Result%
set "_GetProxy_Destination=" & set "_GetProxy_ProxyFile="
GoTo :EOF

::Usage Call :PrepareProxyFile OutputProxyFilePath optional ProxyFile optional ProxyFileURL
:PrepareProxyFile
set "_PrepareProxyFile_output=%~1"
if defined %~2 call set "_PrepareProxyFile_file=%%%~2%%"
if defined %~3 call set "_PrepareProxyFile_URL=%%%~3%%" 
if "[%~2]" EQU "[]" ( set "_PrepareProxyFile_file=%temp%\proxy.pac" ) else ( if not defined _PrepareProxyFile_file set "_PrepareProxyFile_file=%~2" )
Call :IfFileExist _PrepareProxyFile_file && ( Call :IsFileOlderThanDays 1 _PrepareProxyFile_file && del "%_PrepareProxyFile_file%" )
Call :IfFileExist _PrepareProxyFile_file && ( set "%_PrepareProxyFile_output%=%_PrepareProxyFile_file%" & GoTo :EOF )
Call :IfFileExist _PrepareProxyFile_file && ( echo yes the file exists )
if "[%~1]" EQU "[]" ( call :GetProxyFileURL _PrepareProxyFile_URL ) else ( if not defined _PrepareProxyFile_URL set "_PrepareProxyFile_URL=%~3" )
Call :DownloadProxyFile _GetProxy_ProxyFileURL _PrepareProxyFile_file
Call :AppendMissingProxyFunctions _PrepareProxyFile_file
set "%_PrepareProxyFile_output%=%_PrepareProxyFile_file%"
set "_PrepareProxyFile_output=" & set "_PrepareProxyFile_file=" & set "_PrepareProxyFile_URL="
GoTo :EOF

::Usage Call :IsFileOlderThanDays DaysCount Filename
:IsFileOlderThanDays
if defined %~1 call set "_IsFileOlderThanDays_DaysCount=%%%~1%%"
if defined %~2 call set "_IsFileOlderThanDays_File=%%%~2%%"
if not defined _IsFileOlderThanDays_DaysCount set "_IsFileOlderThanDays_DaysCount=%~1"
if not defined _IsFileOlderThanDays_File set "_IsFileOlderThanDays_File=%~2"
for %%A in ("%_IsFileOlderThanDays_File%") do set "_IsFileOlderThanDays_folder=%%~dpA"
for %%A in ("%_IsFileOlderThanDays_File%") do set "_IsFileOlderThanDays_files=%%~nxA"
if "[%_IsFileOlderThanDays_folder:~-1%]" EQU "[\]" set "_IsFileOlderThanDays_folder=%_IsFileOlderThanDays_folder:~,-1%"
forfiles /P "%_IsFileOlderThanDays_folder%" /M "%_IsFileOlderThanDays_files%" /D -%_IsFileOlderThanDays_DaysCount% >NUL 2>NUL
set "_IsFileOlderThanDays_DaysCount=" & set "_IsFileOlderThanDays_File=" & set "_IsFileOlderThanDays_folder="
exit /b

:IfFileExist
if defined %~1 call set "_IfFileExist_File=%%%~1%%"
if not defined _IfFileExist_File set "_IfFileExist_File=%~1"
IF EXIST "%_IfFileExist_File%" ( set "_IfFileExist_File=" & exit /b 0 ) ELSE ( set "_IfFileExist_File=" & exit /b 1 )

:IfFileDontExist
if defined %~1 call set "_IfFileDontExist_File=%%%~1%%"
if not defined _IfFileDontExist_File set "_IfFileDontExist_File=%~1"
IF EXIST "%IfFileDontExist%" ( set "IfFileDontExist=" & exit /b 0 ) ELSE ( set "IfFileDontExist=" & exit /b 1 )


::Usage :GetProxyFileURL OutputURL
:GetProxyFileURL
FOR /F "tokens=2*" %%a IN ('REG QUERY "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoConfigURL') DO set "%~1=%%b"
exit /b

::Usage Call :DownloadProxyFile optional ProxyFileURL optional outputfile 
:DownloadProxyFile
echo downloading
if defined %~1 call set "_DownloadProxyFile_URL=%%%~1%%" 
if defined %~2 call set "_DownloadProxyFile_output=%%%~2%%"
if "[%~1]" EQU "[]" ( call :GetProxyFileURL _DownloadProxyFile_URL ) else ( if not defined _DownloadProxyFile_URL set "_DownloadProxyFile_URL=%~1" )
if "[%~2]" EQU "[]" ( set "_DownloadProxyFile_output=%temp%\proxy.pac" ) else ( if not defined _DownloadProxyFile_output set "_DownloadProxyFile_output=%~2" )
curl -o "%_DownloadProxyFile_output%" "%_DownloadProxyFile_URL%" >NUL 2>%_DownloadProxyFile_output%.log
if errorlevel 0 del %_DownloadProxyFile_output%.log
set "_DownloadProxyFile_URL=" & set "_DownloadProxyFile_output="
GoTo :EOF

::Usage Call :AppendMissingProxyFunctions InputProxyFilePath
:AppendMissingProxyFunctions
if defined %~1 call set "_AppendMissingProxyFunctions_ProxyFile=%%%~1%%"
if not defined _AppendMissingProxyFunctions_ProxyFile set "_AppendMissingProxyFunctions_ProxyFile=%~1"
call :IsFunctionPresent "%~1" "myIpAddress" || Call :AppendFunction _AppendMissingProxyFunctions_ProxyFile myIpAddress
call :IsFunctionPresent "%~1" "isInNet" || Call :AppendFunction _AppendMissingProxyFunctions_ProxyFile isInNet
call :IsFunctionPresent "%~1" "shExpMatch" || Call :AppendFunction _AppendMissingProxyFunctions_ProxyFile shExpMatch
call :IsFunctionPresent "%~1" "dnsDomainIs" || Call :AppendFunction _AppendMissingProxyFunctions_ProxyFile dnsDomainIs
call :IsFunctionPresent "%~1" "isPlainHostName" || Call :AppendFunction _AppendMissingProxyFunctions_ProxyFile isPlainHostName
call :IsFunctionPresent "%~1" "MainOutput" || Call :AppendFunction _AppendMissingProxyFunctions_ProxyFile MainOutput

REM call :IsFunctionPresent "%~1" "MainOutput" && echo is present || echo is not present

set "_AppendMissingProxyFunctions_ProxyFile="
GoTo :EOF

::Usage Call :IsFunctionPresent Filename FunctionName
:IsFunctionPresent
if defined %~1 call set "_IsFunctionPresent_ScriptFile=%%%~1%%"
if not defined _IsFunctionPresent_ScriptFile set "_IsFunctionPresent_ScriptFile=%~1"
findstr /C:"function %~2" "%_IsFunctionPresent_ScriptFile%" >nul
set "_IsFunctionPresent_ScriptFile="
exit /b

::Usage Call :AppendFunction Filename FunctionName
:AppendFunction
if defined %~1 call set "_AppendFunction_ScriptFile=%%%~1%%"
if defined %~2 call set "_AppendFunction_FunctionName=%%%~2%%"
if not defined _AppendFunction_ScriptFile set "_AppendFunction_ScriptFile=%~1"
if not defined _AppendFunction_FunctionName set "_AppendFunction_FunctionName=%~2"
Call :AppendFunction-%_AppendFunction_FunctionName% >> "%_AppendFunction_ScriptFile%"
set "_AppendFunction_ScriptFile=" & set "_AppendFunction_FunctionName=" 
GoTo :EOF

:AppendFunction-myIpAddress
echo function myIpAddress() {
echo    var objShell = new ActiveXObject("WScript.Shell");
echo    var objExec = objShell.Exec("ipconfig");
echo    var strOutput = objExec.StdOut.ReadAll();
echo    var re = /\b(?:\d{1,3}\.){3}\d{1,3}\b/g;
echo    var matches = strOutput.match(re);
echo    if (matches !== null) {
echo        return matches[0]; // Just returning the first found IP, which might not always be the desired one.
echo    }
echo    return "0.0.0.0";
echo }
GoTo :EOF

:AppendFunction-isInNet
echo function isInNet(ip, pattern, mask) {
echo     var ipParts = ip.split(".");
echo     var patternParts = pattern.split(".");
echo     var maskParts = mask.split(".");
echo     if (ipParts.length !== 4 ^|^| patternParts.length !== 4 ^|^| maskParts.length !== 4) {
echo         return false;
echo     }
echo     for (var i = 0; i ^< 4; i++) {
echo         if ((parseInt(ipParts[i], 10) ^& parseInt(maskParts[i], 10)) !== parseInt(patternParts[i], 10)) {
echo             return false;
echo         }
echo     }
echo     return true;
echo }
GoTo :EOF

:AppendFunction-shExpMatch
echo function shExpMatch(str, shexp) {
echo     shexp = shexp.replace(/\./g, '\\.') 
echo                  .replace(/\*/g, '.*') 
echo                  .replace(/\?/g, '.');
echo     var re = new RegExp(shexp, 'i');  // 'i' for case-insensitive
echo     return re.test(str);
echo }
GoTo :EOF

:AppendFunction-dnsDomainIs
echo function dnsDomainIs(host, domain) {
echo     return host.substring(host.length - domain.length) === domain;
echo }
GoTo :EOF

:AppendFunction-isPlainHostName
echo function isPlainHostName(host) {
echo     return host.indexOf('.') === -1;
echo }
GoTo :EOF

:AppendFunction-MainOutput
echo MainOutput()
echo function MainOutput(host) {
echo     var urlToCheck = WScript.Arguments(0);
echo 	var result = FindProxyForURL(urlToCheck, new ActiveXObject("WScript.Network").ComputerName);
echo 	WScript.Echo(result);
echo }
GoTo :EOF






:END



function testfunctions () {
	WScript.Echo("starting test functions");
	test_myIpAddress();
	test_isInNet();
	test_shExpMatch();
	test_dnsDomainIs();
	test_isPlainHostName();
}

function test_myIpAddress() {
    var ip = myIpAddress();
    WScript.Echo("myIpAddress: " + ip);
}


function test_isInNet() {
    var testCases = [
        { ip: "192.168.1.5", pattern: "192.168.1.0", mask: "255.255.255.0", expected: true },
        { ip: "192.168.2.5", pattern: "192.168.1.0", mask: "255.255.255.0", expected: false }
    ];

    for (var i = 0; i < testCases.length; i++) {
        var result = isInNet(testCases[i].ip, testCases[i].pattern, testCases[i].mask);
        WScript.Echo("isInNet for IP: " + testCases[i].ip + " with Pattern: " + testCases[i].pattern + " and Mask: " + testCases[i].mask + " = " + result + " (Expected: " + testCases[i].expected + ")");
    }
}



function test_shExpMatch() {
    var testCases = [
        { str: "example.com", pattern: "*.com", expected: true },
        { str: "test.org", pattern: "*.com", expected: false }
    ];

    for (var i = 0; i < testCases.length; i++) {
        var result = shExpMatch(testCases[i].str, testCases[i].pattern);
        WScript.Echo("shExpMatch for String: " + testCases[i].str + " with Pattern: " + testCases[i].pattern + " = " + result + " (Expected: " + testCases[i].expected + ")");
    }
}




function test_dnsDomainIs() {
    var testCases = [
        { host: "www.google.com", domain: ".google.com", expected: true },
        { host: "www.example.com", domain: ".google.com", expected: false }
    ];

    for (var i = 0; i < testCases.length; i++) {
        var result = dnsDomainIs(testCases[i].host, testCases[i].domain);
        WScript.Echo("dnsDomainIs for Host: " + testCases[i].host + " with Domain: " + testCases[i].domain + " = " + result + " (Expected: " + testCases[i].expected + ")");
    }
}



function test_isPlainHostName() {
    var testCases = [
        { host: "example", expected: true },
        { host: "www.example.com", expected: false }
    ];

    for (var i = 0; i < testCases.length; i++) {
        var result = isPlainHostName(testCases[i].host);
        WScript.Echo("isPlainHostName for Host: " + testCases[i].host + " = " + result + " (Expected: " + testCases[i].expected + ")");
    }
}




https://en.wikipedia.org/wiki/Proxy_auto-config

C:\WINDOWS\System32\cscript.exe //E:jscript //nologo "C:\Users\pw46487\AppData\Local\Temp\proxy.pac" "https://www.google.com"
starting test
starting test functions
myIpAddress: 141.119.102.88
isInNet for IP: 192.168.1.5 with Pattern: 192.168.1.0 and Mask: 255.255.255.0 = true (Expected: true)
isInNet for IP: 192.168.2.5 with Pattern: 192.168.1.0 and Mask: 255.255.255.0 = false (Expected: false)
shExpMatch for String: example.com with Pattern: *.com = true (Expected: true)
shExpMatch for String: test.org with Pattern: *.com = false (Expected: false)
dnsDomainIs for Host: www.google.com with Domain: .google.com = true (Expected: true)
dnsDomainIs for Host: www.example.com with Domain: .google.com = false (Expected: false)
isPlainHostName for Host: example = true (Expected: true)
isPlainHostName for Host: www.example.com = false (Expected: false)
ending test
DIRECT



