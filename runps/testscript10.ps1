Add-Type -OutputAssembly '.\MyLibrary2.dll' -Name 'ConsoleApi' -Namespace Win32 -MemberDefinition '[DllImport("kernel32.dll", SetLastError = true)] public static extern IntPtr GetStdHandle(int nStdHandle);[DllImport("kernel32.dll", CharSet = CharSet.Auto, SetLastError = true)] public static extern bool WriteConsole(IntPtr hConsoleOutput, string lpBuffer, uint nNumberOfCharsToWrite, out uint lpNumberOfCharsWritten, IntPtr lpReserved);';