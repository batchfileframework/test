Imports System

Module Program
    Sub Main(args As String())
        Console.WriteLine("Hello, World!")

        If args.Length > 0 Then
            Dim argument As Boolean
            If Boolean.TryParse(args(0), argument) Then
                If argument Then
                    Console.WriteLine("The argument was true.")
                Else
                    Console.WriteLine("The argument was false.")
                End If
            Else
                Console.WriteLine("The argument was not a recognizable boolean value.")
            End If
        Else
            Console.WriteLine("No argument was provided.")
        End If
    End Sub
End Module
