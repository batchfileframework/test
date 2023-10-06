

# Ensure the DLL is loaded
Add-Type -Path ".\MyLibrary.dll"

# Create a type accelerator for the MyLibrary.Printer class
$accelerators = [psobject].Assembly.GetType("System.Management.Automation.TypeAccelerators")

# Ensure the type is fully loaded and accessible
$printerType = [MyLibrary.Printer]

# Add the accelerator
$accelerators::Add('NewNamespacePrinter', $printerType)
$mynewprinter = New-Object NewNamespacePrinter
$mynewprinter.PrintTest()
# Check the type accelerator
# NewNamespacePrinter
