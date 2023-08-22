@echo off

Call :HexToDecimal-DEMO
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
