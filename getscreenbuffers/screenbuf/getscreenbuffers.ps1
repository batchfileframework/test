# Define C# code for the API calls
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class ConsoleAPI {
    [StructLayout(LayoutKind.Sequential)]
    public struct COORD {
        public short X;
        public short Y;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct SMALL_RECT {
        public short Left;
        public short Top;
        public short Right;
        public short Bottom;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct CONSOLE_SCREEN_BUFFER_INFO {
        public COORD dwSize;
        public COORD dwCursorPosition;
        public ushort wAttributes;
        public SMALL_RECT srWindow;
        public COORD dwMaximumWindowSize;
    }

    [DllImport("kernel32.dll", SetLastError = true)]
    public static extern bool GetConsoleScreenBufferInfo(IntPtr hConsoleOutput, out CONSOLE_SCREEN_BUFFER_INFO lpConsoleScreenBufferInfo);

    [DllImport("kernel32.dll", SetLastError = true)]
    public static extern IntPtr GetStdHandle(int nStdHandle);
}
"@ -Language CSharp

function IsNumeric {
    param ([string]$str)
    return $str -match '^[0-9]+$'
}

function ParseBounds {
    param ([string]$rangeStr)
    if (-not $rangeStr) {
        return 0, 0xFFF
    }
    $parts = $rangeStr -split '-'
    if ($parts.Count -eq 1) {
        return [int]$parts[0], [int]$parts[0]
    } else {
        return [int]$parts[0], [int]$parts[1]
    }
}

function PrintAttributes {
    param (
        [string]$prefix,
        [UInt16]$attributes
    )

    "$prefix.attributes.foreground.red=" + $(if ($attributes -band 0x0004) {1} else {0})
    "$prefix.attributes.foreground.green=" + $(if ($attributes -band 0x0002) {1} else {0})
    "$prefix.attributes.foreground.blue=" + $(if ($attributes -band 0x0001) {1} else {0})
    "$prefix.attributes.foreground.intensity=" + $(if ($attributes -band 0x0008) {1} else {0})

    "$prefix.attributes.background.red=" + $(if ($attributes -band 0x0040) {1} else {0})
    "$prefix.attributes.background.green=" + $(if ($attributes -band 0x0020) {1} else {0})
    "$prefix.attributes.background.blue=" + $(if ($attributes -band 0x0010) {1} else {0})
    "$prefix.attributes.background.intensity=" + $(if ($attributes -band 0x0080) {1} else {0})

    "$prefix.attributes.leadingbyte=" + $(if ($attributes -band 0x0100) {1} else {0})
    "$prefix.attributes.trailingbyte=" + $(if ($attributes -band 0x0200) {1} else {0})
    "$prefix.attributes.grid.horizontal=" + $(if ($attributes -band 0x0400) {1} else {0})
    "$prefix.attributes.grid.vertical.lowend=" + $(if ($attributes -band 0x0800) {1} else {0})
    "$prefix.attributes.grid.vertical.highend=" + $(if ($attributes -band 0x1000) {1} else {0})
    "$prefix.attributes.reverse=" + $(if ($attributes -band 0x4000) {1} else {0})
    "$prefix.attributes.underscore=" + $(if ($attributes -band 0x8000) {1} else {0})
}

function PrintInfo {
    param (
        [string]$prefix,
        [ConsoleAPI+CONSOLE_SCREEN_BUFFER_INFO]$csbi,
        [string]$idx,
        [IntPtr]$potentialHandle 
    )

    $format = if (IsNumeric $idx) { "{0}[{1}]" } else { "{0}.{1}" }
    $buffer = $format -f $prefix, $idx

    "$buffer.handle=$potentialHandle"
    "$buffer.size.width=$($csbi.dwSize.X)"
    "$buffer.size.height=$($csbi.dwSize.Y)"
    "$buffer.cursor.x=$($csbi.dwCursorPosition.X)"
    "$buffer.cursor.y=$($csbi.dwCursorPosition.Y)"
    "$buffer.window.left=$($csbi.srWindow.Left)"
    "$buffer.window.top=$($csbi.srWindow.Top)"
    "$buffer.window.right=$($csbi.srWindow.Right)"
    "$buffer.window.bottom=$($csbi.srWindow.Bottom)"
    "$buffer.window.width=$(($csbi.srWindow.Right - $csbi.srWindow.Left + 1))"
    "$buffer.window.height=$(($csbi.srWindow.Bottom - $csbi.srWindow.Top + 1))"
    "$buffer.window.maxwidth=$($csbi.dwMaximumWindowSize.X)"
    "$buffer.window.maxheight=$($csbi.dwMaximumWindowSize.Y)"

    PrintAttributes $buffer $csbi.wAttributes
}


function ProcessRange {
    param (
        [string]$prefix,
        [string]$rangeStr,
        [ref]$idx
    )

    $startBound, $endBound = ParseBounds $rangeStr
    for ($i = $startBound; $i -le $endBound; $i++) {
        $potentialHandle = [IntPtr]$i
        $csbi = [ConsoleAPI+CONSOLE_SCREEN_BUFFER_INFO]::new()
        if ([ConsoleAPI]::GetConsoleScreenBufferInfo($potentialHandle, [ref]$csbi)) {
            $idx.Value++
            PrintInfo $prefix $csbi $idx.Value $potentialHandle
        }
    }
}

# MAIN SCRIPT LOGIC

$prefix = "console.screenbuffers"
$idx = -1
$argIndex = 1

# This is a simplified approach to command-line argument parsing.
# You may need to adjust based on your exact requirements.

# Example usage:
# .\yourscript.ps1 active 5-10
# .\yourscript.ps1 prefixValue 10-20

if ($args[0] -eq "/?" -or $args[0] -eq "/h") {
    "Usage: yourscript.ps1 optional <prefix> optional [range1] [range2] [rangeN] ..."
    return
}

if ($args.Count -gt 0 -and -not (IsNumeric $args[0]) -and ($args[0] -notmatch '-')) {
    $prefix = $args[0]
    $argIndex++
}

if ($args.Count -ge 1 -and $args[0] -eq "active") {
    $prefix = "console.screenbuffers"
}

$csbi = [ConsoleAPI+CONSOLE_SCREEN_BUFFER_INFO]::new()
$activeScreenBufferHandle = [ConsoleAPI]::GetStdHandle(-11) # STD_OUTPUT_HANDLE
if ([ConsoleAPI]::GetConsoleScreenBufferInfo($activeScreenBufferHandle, [ref]$csbi)) {
    PrintInfo $prefix $csbi "active" $activeScreenBufferHandle
}

if ($args.Count -ge 1 -and $args[0] -eq "active") {
    return
}

if ($argIndex -lt $args.Count) {
    for (; $argIndex -lt $args.Count; $argIndex++) {
        ProcessRange $prefix $args[$argIndex] ([ref]$idx)
    }
} else {
    ProcessRange $prefix "" ([ref]$idx)
}

if ($idx -ne -1) {
    "$prefix.ubound=$idx"
}
