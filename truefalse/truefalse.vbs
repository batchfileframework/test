' Create a WScript Shell object
Set objShell = WScript.CreateObject("WScript.Shell")

' Print "Hello, World!"
WScript.Echo "Hello, World!"

' Get the command line arguments
Set args = WScript.Arguments

' Check if a command line argument was provided
If args.Count > 0 Then
    ' Get the first command line argument
    arg = args.Item(0)

    ' Check if the argument is "true" or "false"
    If LCase(arg) = "true" Then
        WScript.Echo "The argument was true."
    ElseIf LCase(arg) = "false" Then
        WScript.Echo "The argument was false."
    Else
        WScript.Echo "The argument was not a recognizable boolean value."
    End If
Else
    WScript.Echo "No argument was provided."
End If
