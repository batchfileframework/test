# Define the Win32 API methods to be used
$signature = @'
[DllImport("kernel32.dll", SetLastError = true)] 
public static extern IntPtr GetStdHandle(int nStdHandle);

[DllImport("kernel32.dll", CharSet = CharSet.Auto, SetLastError = true)]
public static extern bool WriteConsole(IntPtr hConsoleOutput, string lpBuffer, uint nNumberOfCharsToWrite, out uint lpNumberOfCharsWritten, IntPtr lpReserved);
'@

# Add the type with the above methods to PowerShell
$consoleApi = Add-Type -MemberDefinition $signature -Name "ConsoleApi" -Namespace Win32 -PassThru

# Define handle type and text to write
$STD_OUTPUT_HANDLE = -11  # Standard output handle type
$textToWrite = "Hello, Console via API!"

# Get the handle for the standard output device
$handle = $consoleApi::GetStdHandle($STD_OUTPUT_HANDLE)

# Check if the handle is valid
if ($handle -eq [IntPtr]::Zero) {
    Write-Warning "Failed to retrieve standard output handle!"
    exit 1
}

# Write text to console using API
$charsWritten = $null
if (-not $consoleApi::WriteConsole($handle, $textToWrite, $textToWrite.Length, [ref]$charsWritten, [IntPtr]::Zero)) {
    Write-Warning "Failed to write to console!"
    exit 2
}

# Optionally, print a success message in standard PowerShell manner
Write-Output "`nText successfully written to console."
