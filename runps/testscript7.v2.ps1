Add-Type  -OutputAssembly ".\MyLibrary.dll" -TypeDefinition 'using System;namespace MyLibrary{public class Printer{public void PrintTest(){Console.WriteLine("test");}}}'; Add-Type -Path ".\MyLibrary.dll"; $printer = New-Object MyLibrary.Printer; $printer.PrintTest();
