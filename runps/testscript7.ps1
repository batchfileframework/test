# Define the C# code as a string
$CSharpCode = @"
using System;
namespace MyLibrary
{
    public class Printer
    {
        public void PrintTest()
        {
            Console.WriteLine("test");
        }
    }
}
"@

# Add the type to the current PowerShell session
# and compile it to a DLL
Add-Type -TypeDefinition $CSharpCode -Language CSharp -OutputAssembly '.\MyLibrary.dll'

# Load the compiled DLL
Add-Type -Path '.\MyLibrary.dll'

# Create an instance of the Printer class
$printer = New-Object MyLibrary.Printer

# Call the PrintTest method
$printer.PrintTest()

