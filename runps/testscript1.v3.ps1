Add-Type '
    using System;
    using System.Runtime.InteropServices;
    public class HighPrecisionTimer {
        [DllImport("Kernel32.dll", SetLastError = true)]
        public static extern bool QueryPerformanceFrequency(out long lpFrequency);
        [DllImport("Kernel32.dll", SetLastError = true)]
        public static extern bool QueryPerformanceCounter(out long lpPerformanceCount);
    }'


function Get-HighPrecisionTime {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [scriptblock]$CodeBlock
    )

    $frequency = 0
    [void][HighPrecisionTimer]::QueryPerformanceFrequency([ref]$frequency)

    $startCounter = 0
    [void][HighPrecisionTimer]::QueryPerformanceCounter([ref]$startCounter)

    # Invoke the code block if supplied
    if($null -ne $CodeBlock) {
        & $CodeBlock
    }

    $endCounter = 0
    [void][HighPrecisionTimer]::QueryPerformanceCounter([ref]$endCounter)

    $timeElapsed = ($endCounter - $startCounter) / $frequency
    Write-Output "Code took $($timeElapsed) seconds to run"
}

# Example usage:
Get-HighPrecisionTime {
    Start-Sleep -Milliseconds 500  # Replace with your own code
}
