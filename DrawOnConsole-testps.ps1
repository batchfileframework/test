# Load the necessary assembly
Add-Type -AssemblyName System.Windows.Forms

# Define the native methods
Add-Type -TypeDefinition '
using System;
using System.Runtime.InteropServices;
public static class NativeMethods {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern IntPtr GetDC(IntPtr hWnd);

    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool ReleaseDC(IntPtr hWnd, IntPtr hDC);

    [DllImport("gdi32.dll")]
    public static extern IntPtr CreateSolidBrush(int crColor);

    [DllImport("gdi32.dll", SetLastError = true)]
    public static extern bool DeleteObject(IntPtr hObject);

    [DllImport("gdi32.dll")]
    public static extern bool Ellipse(IntPtr hdc, int nLeftRect, int nTopRect, int nRightRect, int nBottomRect);

    [DllImport("kernel32.dll")]
    public static extern IntPtr GetConsoleWindow();

    [DllImport("user32.dll", SetLastError = true)]
    public static extern IntPtr SetWindowsHookEx(int idHook, windowProc lpfn, IntPtr hMod, uint dwThreadId);

    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool UnhookWindowsHookEx(IntPtr hhk);

    [DllImport("user32.dll")]
    public static extern IntPtr CallNextHookEx(IntPtr hhk, int nCode, IntPtr wParam, IntPtr lParam);

	[DllImport("user32.dll", SetLastError = true)]
	public static extern uint GetWindowThreadProcessId(IntPtr hWnd, out uint lpdwProcessId);
	
	public struct MSG {
		public IntPtr hWnd;
		public uint message;
		public IntPtr wParam;
		public IntPtr lParam;
		public uint time;
		public POINT pt;
	}

	public struct POINT {
		public int x;
		public int y;
	}

	public delegate IntPtr windowProc(int nCode, IntPtr wParam, ref MSG lParam);

	public const int WH_GETMESSAGE = 3;
    public const int WH_CALLWNDPROCRET = 12;
    public const int WM_PAINT = 0x000F;
	public const uint THREAD_QUERY_INFORMATION = 0x0040;
		
	[DllImport("gdi32.dll")] public static extern IntPtr SelectObject(IntPtr hdc, IntPtr h);
	[DllImport("kernel32.dll", SetLastError = true)] public static extern IntPtr OpenThread(uint desiredAccess, bool inheritHandle, uint threadId);
    [DllImport("kernel32.dll", SetLastError = true)] public static extern uint GetProcessIdOfThread(IntPtr threadHandle);
    [DllImport("kernel32.dll", SetLastError = true)] public static extern bool CloseHandle(IntPtr hObject);

}
'


$hWndConsole = [NativeMethods]::GetConsoleWindow();
$hDC = [NativeMethods]::GetDC($hWndConsole);
$redBrush = [NativeMethods]::CreateSolidBrush(0x0000FF);
$oldBrush = [NativeMethods]::SelectObject($hDC, $redBrush);
[NativeMethods]::Ellipse($hDC, 0, 0, 100, 100) | out-null;
[void] [NativeMethods]::SelectObject($hDC, $oldBrush);
[NativeMethods]::DeleteObject($redBrush) | out-null;
[NativeMethods]::ReleaseDC([IntPtr]::Zero, $hDC) | out-null;


$global:windowProc = [NativeMethods+windowProc] { param([int]$nCode, [IntPtr]$wParam, [ref]$lParam)

    return [NativeMethods]::CallNextHookEx([IntPtr]::Zero, $nCode, $wParam, $lParam)
}

# private static IntPtr HookCallback(int nCode, IntPtr wParam, IntPtr lParam) {

  # return CallNextHookEx(hookId, nCode, wParam, lParam);
# }
	
# $global:windowProc = [NativeMethods+windowProc] {
    # param([int]$nCode, [IntPtr]$wParam, [ref]$lParam)
    # Write-Host "Hook called with message code: $($lParam.message)"
	
    # if ($nCode -ge 0) {
        # if ($lParam.message -eq [NativeMethods]::WM_PAINT) {
            # Write-Host "WM_PAINT received."

            # $hWndConsole = [NativeMethods]::GetConsoleWindow()
            # $hDC = [NativeMethods]::GetDC($hWndConsole)
            # $redBrush = [NativeMethods]::CreateSolidBrush(0x0000FF)
            # $oldBrush = [NativeMethods]::SelectObject($hDC, $redBrush);
            # [NativeMethods]::Ellipse($hDC, 0, 0, 100, 100)
            # [void] [NativeMethods]::SelectObject($hDC, $oldBrush);
            # [NativeMethods]::ReleaseDC($hWndConsole, $hDC)
            # [NativeMethods]::DeleteObject($redBrush)
        # }
    # }

    # return [NativeMethods]::CallNextHookEx([IntPtr]::Zero, $nCode, $wParam, $lParam)
# }
# [System.Runtime.InteropServices.GCHandle]::Alloc($global:windowProc, [System.Runtime.InteropServices.GCHandleType]::Normal)

# $hookId = [NativeMethods]::SetWindowsHookEx([NativeMethods]::WH_CALLWNDPROCRET, $global:windowProc, [IntPtr]::Zero, $threadId)
# $hookId = [NativeMethods]::SetWindowsHookEx([NativeMethods]::WH_GETMESSAGE, $global:windowProc, [IntPtr]::Zero, $threadId)
# $hookId = [NativeMethods]::SetWindowsHookEx([NativeMethods]::WH_CALLWNDPROCRET, $global:windowProc, [IntPtr]::Zero, 0)
# $hookId = [NativeMethods]::SetWindowsHookEx([NativeMethods]::WH_CALLWNDPROC, $global:windowProc, [IntPtr]::Zero, $threadId)



# $threads = Get-Counter -Counter "\Thread(*)\ID Thread" | ForEach-Object {
    # $_.CounterSamples | Where-Object { $_.InstanceName -match "2236" } | ForEach-Object {
        # [int] $_.CookedValue
    # }
# }
# $threads

# $pid = yourPID




$mymanuallyknownthreadId = 8100

$threadHandle = [NativeMethods]::OpenThread([NativeMethods]::THREAD_QUERY_INFORMATION, $false, $mythreadId)
if ($threadHandle -eq [IntPtr]::Zero) {
    throw "Failed to open thread."
}
try {
    $myprocessId = [NativeMethods]::GetProcessIdOfThread($threadHandle)
} finally {
    [void][NativeMethods]::CloseHandle($threadHandle)
}





# $null     = [NativeMethods]::GetWindowThreadProcessId($hWndConsole, [ref]$null)
# $threadId = [NativeMethods]::GetWindowThreadProcessId($hWndConsole, [ref]$null)
$hWndConsole = [NativeMethods]::GetConsoleWindow()
$processId = 0
$threadId = [NativeMethods]::GetWindowThreadProcessId($hWndConsole, [ref]$processId)

Write-Host "pid $pid fromhwnd $processId frommythread $myprocessId"

write-host from GetWindowThreadProcessId fromhwndpid $processId
$threads = Get-WmiObject -Query "SELECT * FROM Win32_Thread WHERE ProcessHandle='$processId'"
$threadIds = $threads | ForEach-Object { $_.Handle }
$threadIds

write-host from powershell pid $pid
$threads = Get-WmiObject -Query "SELECT * FROM Win32_Thread WHERE ProcessHandle='$pid'"
$threadIds = $threads | ForEach-Object { $_.Handle }
$threadIds

write-host from frommythreadpid $myprocessId
$threads = Get-WmiObject -Query "SELECT * FROM Win32_Thread WHERE ProcessHandle='$myprocessId'"
$threadIds = $threads | ForEach-Object { $_.Handle }
$threadIds

$hModule = [System.Diagnostics.Process]::GetCurrentProcess().Modules | Where-Object { $_.ModuleName -eq 'user32.dll' } | Select-Object -ExpandProperty BaseAddress
Write-Host "hWndConsole $hWndConsole thread $threadId processId $processId pid $pid $hModule GetLastWin32Error $([System.Runtime.InteropServices.Marshal]::GetLastWin32Error())"
$threadId = 8100
Write-Host "hWndConsole $hWndConsole thread $threadId  hook $hookId hmodule $hModule GetLastWin32Error $([System.Runtime.InteropServices.Marshal]::GetLastWin32Error())"
# $hookId = [NativeMethods]::SetWindowsHookEx([NativeMethods]::WH_CALLWNDPROCRET, $global:windowProc, $hModule, $threadId)
# $hookId = [NativeMethods]::SetWindowsHookEx([NativeMethods]::WH_CALLWNDPROC, $global:windowProc, $hModule, $threadId)
# $hookId = [NativeMethods]::SetWindowsHookEx([NativeMethods]::WH_GETMESSAGE, $global:windowProc, $hModule, $threadId)
# $hookId = [NativeMethods]::SetWindowsHookEx([NativeMethods]::WH_CALLWNDPROC, $global:windowProc, [IntPtr]::Zero, $threadId)
# $hookId = [NativeMethods]::SetWindowsHookEx([NativeMethods]::WH_GETMESSAGE, $global:windowProc, [IntPtr]::Zero, $threadId)
# $hookId = [NativeMethods]::SetWindowsHookEx([NativeMethods]::WH_CALLWNDPROC, $global:windowProc, [IntPtr]::Zero, 0)

$hookId = [NativeMethods]::SetWindowsHookEx([NativeMethods]::WH_CALLWNDPROC, $global:windowProc, $hModule, $threadId)
$hookId = [NativeMethods]::SetWindowsHookEx([NativeMethods]::WH_GETMESSAGE, $global:windowProc, [IntPtr]::Zero, 0)
$hookId = [NativeMethods]::SetWindowsHookEx([NativeMethods]::WH_CALLWNDPROCRET, $global:windowProc, [IntPtr]::Zero, 0)


Write-Host "hookId is $hookId, here is the output of GetLastWin32Error $([System.Runtime.InteropServices.Marshal]::GetLastWin32Error())"

# $hookId = [NativeMethods]::SetWindowsHookEx([NativeMethods]::WH_GETMESSAGE, $global:windowProc, [IntPtr]::Zero, 0)

Write-Host "hWndConsole $hWndConsole thread $threadId  hook $hookId hmodule $hModule GetLastWin32Error $([System.Runtime.InteropServices.Marshal]::GetLastWin32Error())"

Write-Host "Press Enter to exit..."
$null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

[NativeMethods]::UnhookWindowsHookEx($hookId)





<# $global:windowProc = [NativeMethods+windowProc] {
    param([int]$nCode, [IntPtr]$wParam, [ref]$lParam)
    Write-Host "Hook called with message code: $($lParam.message)"

# $global:windowProc = [NativeMethods+LowLevelProc] {
    # param([int]$nCode, [IntPtr]$wParam, [IntPtr]$lParam)
    # Write-Host "Hook called with message code: $nCode"
	

# $windowProc = [NativeMethods+LowLevelProc] {
    # param([int]$nCode, [IntPtr]$wParam, [IntPtr]$lParam)
# 	Write-Host "message received."

    if ($nCode -ge 0) {
        $message = [System.Runtime.InteropServices.Marshal]::PtrToStructure($lParam, [System.Windows.Forms.Message])
		
		if ($message.Msg -eq [NativeMethods]::WM_PAINT) {
			Write-Host "WM_PAINT received."
			# rest of your code
		}
		
        if ($message.Msg -eq [NativeMethods]::WM_PAINT) {
            $hWndConsole = [NativeMethods]::GetConsoleWindow()
            $hDC = [NativeMethods]::GetDC($hWndConsole)
            $redBrush = [NativeMethods]::CreateSolidBrush(0x0000FF)
			$oldBrush = [NativeMethods]::SelectObject($hDC, $redBrush);
            [NativeMethods]::Ellipse($hDC, 0, 0, 100, 100)
			[void] [NativeMethods]::SelectObject($hDC, $oldBrush);
            [NativeMethods]::ReleaseDC($hWndConsole, $hDC)
            [NativeMethods]::DeleteObject($redBrush)
        }
    }

    return [NativeMethods]::CallNextHookEx([IntPtr]::Zero, $nCode, $wParam, $lParam)
} #>



# $hookId = [NativeMethods]::SetWindowsHookEx([NativeMethods]::WH_GETMESSAGE, $windowProc, [IntPtr]::Zero, 0)
# $hookId = [NativeMethods]::SetWindowsHookEx([NativeMethods]::WH_CALLWNDPROC, $windowProc, [IntPtr]::Zero, 0)
# $hookId = [NativeMethods]::SetWindowsHookEx([NativeMethods]::WH_CALLWNDPROCRET, $windowProc, [IntPtr]::Zero, 0)
# $hookId = [NativeMethods]::SetWindowsHookEx([NativeMethods]::WH_CALLWNDPROCRET, $windowProc, [IntPtr]::Zero, [System.Diagnostics.Process]::GetCurrentProcess().Id)