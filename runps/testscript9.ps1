# Assuming MyLibrary.dll has a class `Printer` in the `MyLibrary` namespace
Add-Type -Path "MyLibrary.dll"

# Create a type accelerator for the MyLibrary.Printer class
$accelerators = [psobject].Assembly.GetType("System.Management.Automation.TypeAccelerators")::Get
$accelerators.Add('NewNamespacePrinter', [MyLibrary.Printer])

# Now you can use NewNamespacePrinter as a type, albeit it's not a true namespace renaming
$printer = New-Object NewNamespacePrinter
$printer.PrintTest()
