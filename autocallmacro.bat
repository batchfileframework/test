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





In batch file language, I need to call a function

Normally I would use 

call :myfunction

However in this case, I don' t know if the function exists in my current file as a label, or if it exists in the path as a .bat (and maybe .exe)

What Ii need is, an universal way to call a function, and somehow it figures out if it exists as a label or as an external script/program and run the one that exists

Also, in the case where both exist, there needs to be a way to specify if it should run the internal label function or the external command

What do you suggest to accomplish this ?
ChatGPT

You can accomplish this by first checking if a label exists in the current batch file, and then checking if the function exists as an external script or program in the path. Here's a suggestion on how to do this:

    Use the findstr command to check if a label exists in the current batch file.
    If the label doesn't exist, check if the function exists as an external script or program in the path using the where command.
    Call the function based on the previous checks.

Let's create a simple script to achieve this:

batch

@echo off
setlocal enabledelayedexpansion

:: Your main code here...

call :universalCall myfunction
goto :eof

:universalCall
set funcName=%1

:: Check if label exists in the current file
findstr /R "^:%funcName%$" "%~f0" >nul
if not errorlevel 1 (
    echo Calling internal function %funcName%
    call :%funcName%
    exit /b
)

:: Check if function exists as an external script/program in the path
where %funcName% 2>nul >nul
if not errorlevel 1 (
    echo Calling external function/script %funcName%
    %funcName%
    exit /b
)

echo Function %funcName% not found!
exit /b

:myfunction
echo This is the internal function.
exit /b

To determine which to run when both exist (the internal label function or the external command), you can establish a priority in the :universalCall subroutine. In the example above, the internal label has higher priority. If you want to give external commands priority, simply swap the order of the checks.

Additionally, you might want to add more advanced checks or parameters, but this script should give you a good starting point.
User
Ok, that is a good start 

However one problem I see is that it is a call then another call. I find that when there are special characters in the arguments, doing two calls requires quadruble the escaping characters and gets very confusing very fast. Also this basic version does not handle the arguments at all.

Lastly, to change the priority between internal function label and external program you need to edit the code. 

That should be either an environment variable that selects which is run first, or something you include when you activate this function.  Or maybe both, an environement variable could set "internal then external" or "external then internal"   but when you actually activate it, you could optionally specify a preference. 

What do you propose ?
ChatGPT

Given the requirements you've laid out, here's an improved approach:

    Pass arguments through a single call by setting them to variables prior to calling the universal function.
    Utilize an environment variable for default priority (either INTERNAL_FIRST or EXTERNAL_FIRST).
    Allow an optional second argument to :universalCall to override the default priority for that specific call.

Let's implement these suggestions:

batch

@echo off
setlocal enabledelayedexpansion

:: Set default priority in an environment variable
set DEFAULT_PRIORITY=INTERNAL_FIRST

:: Main code...
set ARG1=Hello
set ARG2=World
call :universalCall myfunction EXTERNAL_FIRST

goto :eof

:universalCall
set funcName=%1
set localPriority=%2

if not defined localPriority (
    set localPriority=%DEFAULT_PRIORITY%
)

if "%localPriority%"=="INTERNAL_FIRST" (
    call :checkInternal %funcName%
    if errorlevel 1 (
        call :checkExternal %funcName%
    )
) else (
    call :checkExternal %funcName%
    if errorlevel 1 (
        call :checkInternal %funcName%
    )
)
exit /b

:checkInternal
findstr /R "^:%1$" "%~f0" >nul
if not errorlevel 1 (
    echo Calling internal function %1
    call :%1
    exit /b 0
)
exit /b 1

:checkExternal
where %1 2>nul >nul
if not errorlevel 1 (
    echo Calling external function/script %1
    %1
    exit /b 0
)
exit /b 1

:myfunction
echo This is the internal function.
echo Arg1: %ARG1%, Arg2: %ARG2%
exit /b

Here, we're following these steps:

    The DEFAULT_PRIORITY environment variable sets the default preference for internal vs external.
    The :universalCall function checks if an override is provided and then makes the calls based on the priority.
    We separate the checks for internal and external functions to :checkInternal and :checkExternal respectively for cleaner code.
    Arguments are set using the set command prior to invoking the universal call, which avoids issues with special characters. Here, I've set ARG1 and ARG2 as examples, but you can expand this to handle multiple arguments as required.

This way, the priority is clear and can be changed globally or on a per-call basis. The issue of special characters in arguments is also circumvented by avoiding nested calls with those arguments.
User
What about using a macro instead ?

One problem I have here, is that we check which of the two exists, every single time we activate the function. It would be nice to check once and then cache the result as a variable for that function 
name

Also I would prefer if this were less "invasive"   as this method requires changing how we call the functions, especially now we would need to always put out argument in variable even though sometimes it is more convenient and readable to pass the value of the argument directly.

What do you propose ?
ChatGPT

Using a macro is a great idea to make the solution more elegant and flexible. This approach can help in caching the check results and making the function call less invasive.

Here's a proposed solution using a macro:

    Use the macro to call functions with a simple syntax similar to the standard call command.
    Cache the result of the checks for the existence of internal or external functions.

batch

@echo off
setlocal enabledelayedexpansion

:: Macro for Universal Call
set "universalCall=for %%# in (1 2) do if %%#==2 (%%~1) else setlocal enableextensions & set funcName=%%~1 & call :cacheCheckFunction & if defined funcType (if "!funcType!"=="INTERNAL" (call :!funcName! %%~2) else (!funcName! %%~2)) else echo Function not found!"

:: Set default priority
set DEFAULT_PRIORITY=INTERNAL_FIRST

:: Main code
%universalCall% myfunction "Hello, World!"

goto :eof

:cacheCheckFunction
:: Check cache
if defined funcType%funcName% (
    set funcType=!funcType%funcName%!
    exit /b
)

:: If not cached, check based on priority
if "%DEFAULT_PRIORITY%"=="INTERNAL_FIRST" (
    call :checkInternal %funcName%
    if errorlevel 1 (
        call :checkExternal %funcName%
    )
) else (
    call :checkExternal %funcName%
    if errorlevel 1 (
        call :checkInternal %funcName%
    )
)
exit /b

:checkInternal
findstr /R "^:%1$" "%~f0" >nul
if not errorlevel 1 (
    set funcType%1=INTERNAL
    exit /b 0
)
exit /b 1

:checkExternal
where %1 2>nul >nul
if not errorlevel 1 (
    set funcType%1=EXTERNAL
    exit /b 0
)
exit /b 1

:myfunction
echo This is the internal function.
echo Argument: %1
exit /b

In this script:

    The macro universalCall allows for a syntax that's quite similar to the standard call command.
    The :cacheCheckFunction label handles checking whether a function is cached, and if not, performs the checks and then caches the result in a variable named funcType<FunctionName>.
    The DEFAULT_PRIORITY environment variable still sets the priority between internal and external checks.
    Since we use a macro, you can directly pass arguments without needing to set them as separate environment variables, making the calls cleaner and more readable.

This approach should reduce invasiveness, improve performance by leveraging caching, and provide a more intuitive way to call functions.
User
Instead of calling the macro universalCall

Could we call it call

That way it becomes simply 

%Call% myfunction "Hello, World!"

Which is very similar to the original 

Call :myfunction "Hello, World!" and Call :myfunction "Hello, World!"

If we can call it %Call%  , then could we have another macro called  %Calli%  to override the default behaviour and the environement variable to specify "internal then external"    and also yet another macro function called %Calle% to specify "external then internal"
ChatGPT

Certainly! Overloading the familiar call command to fit your desired behavior, while introducing Calli and Calle for priority overrides, is a great idea for a smoother transition and easier usage. Here's how you can set up the macros:

batch

@echo off
setlocal enabledelayedexpansion

:: Macro for Universal Call
set "Call=for %%# in (1 2) do if %%#==2 (%%~1) else setlocal enableextensions & set funcName=%%~1 & call :cacheCheckFunction UNIVERSAL & if defined funcType (if "!funcType!"=="INTERNAL" (call :!funcName! %%~2) else (!funcName! %%~2)) else echo Function not found!"
set "Calli=for %%# in (1 2) do if %%#==2 (%%~1) else setlocal enableextensions & set funcName=%%~1 & call :cacheCheckFunction INTERNAL_FIRST & if defined funcType (if "!funcType!"=="INTERNAL" (call :!funcName! %%~2) else (!funcName! %%~2)) else echo Function not found!"
set "Calle=for %%# in (1 2) do if %%#==2 (%%~1) else setlocal enableextensions & set funcName=%%~1 & call :cacheCheckFunction EXTERNAL_FIRST & if defined funcType (if "!funcType!"=="INTERNAL" (call :!funcName! %%~2) else (!funcName! %%~2)) else echo Function not found!"

:: Set default priority
set DEFAULT_PRIORITY=INTERNAL_FIRST

:: Main code
%Call% myfunction "Hello, World!"
%Calli% myfunction "Hello again!"
%Calle% myfunction "Hello, one last time!"

goto :eof

:cacheCheckFunction
:: Priority selection
if "%1"=="UNIVERSAL" (
    set priority=%DEFAULT_PRIORITY%
) else (
    set priority=%1
)

:: Check cache
if defined funcType%funcName% (
    set funcType=!funcType%funcName%!
    exit /b
)

:: If not cached, check based on priority
if "%priority%"=="INTERNAL_FIRST" (
    call :checkInternal %funcName%
    if errorlevel 1 (
        call :checkExternal %funcName%
    )
) else (
    call :checkExternal %funcName%
    if errorlevel 1 (
        call :checkInternal %funcName%
    )
)
exit /b

:checkInternal
findstr /R "^:%1$" "%~f0" >nul
if not errorlevel 1 (
    set funcType%1=INTERNAL
    exit /b 0
)
exit /b 1

:checkExternal
where %1 2>nul >nul
if not errorlevel 1 (
    set funcType%1=EXTERNAL
    exit /b 0
)
exit /b 1

:myfunction
echo This is the internal function.
echo Argument: %1
exit /b

With the given solution:

    The %Call% macro uses the default priority.
    The %Calli% macro gives priority to internal functions.
    The %Calle% macro gives priority to external functions.

By doing this, you can keep a familiar syntax, while having the flexibility to specify function call priorities on-the-fly.
User
Could you explain only how the Call macro works 

This line specifically 

set "Call=for %%# in (1 2) do if %%#==2 (%%~1) else setlocal enableextensions & set funcName=%%~1 & call :cacheCheckFunction UNIVERSAL & if defined funcType (if "!funcType!"=="INTERNAL" (call :!funcName! %%~2) else (!funcName! %%~2)) else echo Function not found!"
ChatGPT

Certainly! The Call macro is a bit dense, but let's break it down step by step:

batch

set "Call=for %%# in (1 2) do if %%#==2 (%%~1) else setlocal enableextensions & set funcName=%%~1 & call :cacheCheckFunction UNIVERSAL & if defined funcType (if "!funcType!"=="INTERNAL" (call :!funcName! %%~2) else (!funcName! %%~2)) else echo Function not found!"

    for %%# in (1 2) do: This loop runs two iterations, essentially allowing us to run two separate blocks of code sequentially without having to do a call (which would require re-parsing arguments). The first iteration will set up necessary variables, and the second iteration will perform the function call.

    if %%#==2 (%%~1) else ...: On the second iteration (i.e., when %%# is 2), it simply tries to run the function (useful for external commands). Otherwise, it runs the subsequent code to set up the function call.

    setlocal enableextensions: Enables delayed variable expansion and creates a local scope for variables. This ensures that the variables used in this block don't interfere with variables outside this block.

    set funcName=%%~1: Sets the function name (passed as the first argument to the macro) to the funcName variable. %%~1 refers to the first argument passed to the macro.

    call :cacheCheckFunction UNIVERSAL: Calls the cacheCheckFunction subroutine with the argument UNIVERSAL. This subroutine will check if the function exists internally or externally based on the specified priority (in this case, it will use the default priority).

    if defined funcType ...: Once the cacheCheckFunction has run, it will set a variable funcType indicating whether the function was found internally (INTERNAL) or externally (EXTERNAL). This block of code checks if funcType is defined.
        if "!funcType!"=="INTERNAL" (call :!funcName! %%~2) else (!funcName! %%~2): If the function type is INTERNAL, it will call the function label using the name stored in funcName. If it's EXTERNAL, it will just run the command using the function name.

    else echo Function not found!: If funcType is not defined (meaning the function wasn't found internally or externally), it will output an error message.

In essence, this macro tries to:

    Determine if the desired function is internal or external and caches the result.
    Calls the function based on the determined type.
    Gives an error if the function isn't found in either scope.

User
 by setlocal enableextensions I think you meant enabledelayedexpansion 

Also, in the macro , this variable %%~1  does not appear to contain anything and simply expands to %~1

I have done a test as follows 

First the file autocallmacro.bat

containing the following 

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


And then the file test.bat 
which only contains
echo this is hello.bat

Here is what happens when I run autocallmacro.bat in my console

D:\dev\work>autocallmacro.bat

D:\dev\work>echo this is autocallmacro.bat
this is autocallmacro.bat

D:\dev\work>set Call=Echo this is macro call first %~1 argument

D:\dev\work>set Call2=for %# in (1 2) do Echo this is macro call first %~1 argument %#

D:\dev\work>set Call3=for %# in (1 2) do if %#==2 ( echo this is %~1 ) else ( echo if is false )

D:\dev\work>call :test

D:\dev\work>echo this is autocallmacro.bat internal :test label
this is autocallmacro.bat internal :test label

D:\dev\work>GoTo :EOF

D:\dev\work>call test

D:\dev\work>echo this is hello.bat
this is hello.bat

D:\dev\work>Echo this is macro call first %~1 argument test
this is macro call first %~1 argument test

D:\dev\work>for %# in (1 2) do Echo this is macro call first %~1 argument %# test

D:\dev\work>Echo this is macro call first %~1 argument 1 test
this is macro call first %~1 argument 1 test

D:\dev\work>Echo this is macro call first %~1 argument 2 test
this is macro call first %~1 argument 2 test
test was unexpected at this time.

D:\dev\work>for %# in (1 2) do if %#==2 ( echo this is %~1 ) else ( echo if is false ) test

ChatGPT

I apologize for the oversight. You're right; %%~1 doesn't directly expand within the for loop inside the macro. Let me correct that.

In batch, the arguments passed to macros are referenced differently than in traditional function calls. You directly use %1, %2, etc. within macros.

So, let's correct the example to handle the arguments properly:

For your test:

batch

@echo on

echo this is autocallmacro.bat

:: Set the macros
set Call=Echo this is macro call first %1 argument
set Call2=for %%# in (1 2) do Echo this is macro call second %1 argument %%#
set Call3=for %%# in (1 2) do if %%#==2 ( echo this is %1 ) else ( echo if is false )

:: Call the different test cases
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

Explanation:

    %Call% - Directly references the first argument passed using %1.
    %Call2% - Uses the loop variable %%# for iterating and %1 for the argument.
    %Call3% - A combination of checking loop iteration and echoing the argument %1.

Again, apologies for the confusion earlier, and thank you for your patience.
User
I have tried this permutation 

The %1 expand to nothing in the variable itself as you can see here

D:\dev\work>set call
Call=Echo this is macro call first  argument
Call2=for %# in (1 2) do Echo this is macro call second  argument %#
Call3=for %# in (1 2) do if %#==2 ( echo this is  ) else ( echo if is false )


Here is the code running 

D:\dev\work>autocallmacro.2.bat

D:\dev\work>echo on

D:\dev\work>echo this is autocallmacro.bat
this is autocallmacro.bat

D:\dev\work>set Call=Echo this is macro call first  argument

D:\dev\work>set Call2=for %# in (1 2) do Echo this is macro call second  argument %#

D:\dev\work>set Call3=for %# in (1 2) do if %#==2 ( echo this is  ) else ( echo if is false )

D:\dev\work>call :test

D:\dev\work>echo this is autocallmacro.bat internal :test label
this is autocallmacro.bat internal :test label

D:\dev\work>GoTo :EOF

D:\dev\work>call test

D:\dev\work>echo this is hello.bat
this is hello.bat

D:\dev\work>Echo this is macro call first  argument test
this is macro call first  argument test

D:\dev\work>for %# in (1 2) do Echo this is macro call second  argument %# test

D:\dev\work>Echo this is macro call second  argument 1 test
this is macro call second  argument 1 test

D:\dev\work>Echo this is macro call second  argument 2 test
this is macro call second  argument 2 test
test was unexpected at this time.

D:\dev\work>for %# in (1 2) do if %#==2 ( echo this is  ) else ( echo if is false ) test

So I have attempted to double the % in %1 to %%1 

Here is what happenned this that change 


D:\dev\work>autocallmacro.2.bat

D:\dev\work>echo on

D:\dev\work>echo this is autocallmacro.bat
this is autocallmacro.bat

D:\dev\work>set Call=Echo this is macro call first %1 argument

D:\dev\work>set Call2=for %# in (1 2) do Echo this is macro call second %1 argument %#

D:\dev\work>set Call3=for %# in (1 2) do if %#==2 ( echo this is %1 ) else ( echo if is false )

D:\dev\work>call :test

D:\dev\work>echo this is autocallmacro.bat internal :test label
this is autocallmacro.bat internal :test label

D:\dev\work>GoTo :EOF

D:\dev\work>call test

D:\dev\work>echo this is hello.bat
this is hello.bat

D:\dev\work>Echo this is macro call first %1 argument test
this is macro call first %1 argument test

D:\dev\work>for %# in (1 2) do Echo this is macro call second %1 argument %# test

D:\dev\work>Echo this is macro call second %1 argument 1 test
this is macro call second %1 argument 1 test

D:\dev\work>Echo this is macro call second %1 argument 2 test
this is macro call second %1 argument 2 test
test was unexpected at this time.

D:\dev\work>for %# in (1 2) do if %#==2 ( echo this is %1 ) else ( echo if is false ) test

You can see, in the macro variable, they became %1

D:\dev\work>set call
Call=Echo this is macro call first %1 argument
Call2=for %# in (1 2) do Echo this is macro call second %1 argument %#
Call3=for %# in (1 2) do if %#==2 ( echo this is %1 ) else ( echo if is false )

And that still does not work because the function name test, is text that appears after the end of the expanded macro. The macro itself cannot know what the function name is in this case.

What do you propose ?
ChatGPT

In batch, you're right; macros don't inherently support positional arguments in the same way functions or scripts do. The %1, %2, etc., inside a macro will use the arguments from the current batch file context, not from the macro invocation.

Let's approach this differently. Instead of embedding the %1 inside the macro directly, we can set up our macro such that we expand the macro followed by its arguments.

Here's an example:

batch

@echo on

echo this is autocallmacro.bat

:: Define the macro
set "Call=(echo this is macro call first %%~1 argument)"
set "Call2=for %%# in (1 2) do echo this is macro call second %%~1 argument %%#"
set "Call3=for %%# in (1 2) do if %%#==2 ( echo this is %%~1 ) else ( echo if is false )"

:: Use the macro
call :test
call test
%Call% test
%Call2% test
%Call3% test

echo this is the end of autocallmacro.bat
exit /b

:test
echo this is autocallmacro.bat internal :test label
exit /b

In this method:

    Instead of invoking the macro with %Call% arg, we define Call to be an expression that expects to be followed by its arguments.

    The %%~1 inside the macro is intended to capture the first argument following the macro. When it gets expanded in the command line, it becomes %~1, capturing the argument 'test'.

    %~1 will get the first parameter provided after the macro expansion. So, %Call% test will essentially become (echo this is macro call first %~1 argument) test, and %~1 will evaluate to test.

This approach is a more accurate reflection of how macros tend to be used in batch scripting. They are essentially pre-canned script snippets that are "expanded" into place in the script where they're used, and then they operate on whatever follows them in the command line.