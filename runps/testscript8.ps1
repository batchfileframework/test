# Define the C# code as a string

# Load the compiled DLL
Add-Type -Path ".\MyLibrary.dll"

# Create an instance of the Printer class
$printer = New-Object MyLibrary.Printer

# Call the PrintTest method
$printer.PrintTest()
