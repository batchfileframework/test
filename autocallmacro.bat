@echo on

echo this is autocallmacro.bat

set Call=Echo this is macro call first %%~1 argument
set Call2=for %%# in (1 2) do Echo this is macro call first %%~1 argument %%#
set Call3=for %%# in (1 2) do if %%#==2 ( echo this is %%~1 ) else ( echo if is false )

call :test
call test
%call% test
%call2% test
%call3% test

echo this is the end of autocallmacro.bat
GoTo :EOF

:test
echo this is autocallmacro.bat internal :test label
GoTo :EOF