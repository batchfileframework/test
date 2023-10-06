#include <windows.h>
#include <stdio.h>

void interpretAttributes(WORD attributes) {
    // Foreground colors
    printf("Foreground Blue: %s\n", (attributes & FOREGROUND_BLUE) ? "ON" : "OFF");
    printf("Foreground Green: %s\n", (attributes & FOREGROUND_GREEN) ? "ON" : "OFF");
    printf("Foreground Red: %s\n", (attributes & FOREGROUND_RED) ? "ON" : "OFF");
    printf("Foreground Intensity: %s\n", (attributes & FOREGROUND_INTENSITY) ? "ON" : "OFF");

    // Background colors
    printf("Background Blue: %s\n", (attributes & BACKGROUND_BLUE) ? "ON" : "OFF");
    printf("Background Green: %s\n", (attributes & BACKGROUND_GREEN) ? "ON" : "OFF");
    printf("Background Red: %s\n", (attributes & BACKGROUND_RED) ? "ON" : "OFF");
    printf("Background Intensity: %s\n", (attributes & BACKGROUND_INTENSITY) ? "ON" : "OFF");

    // Common attributes
    printf("Leading Byte: %s\n", (attributes & COMMON_LVB_LEADING_BYTE) ? "ON" : "OFF");
    printf("Trailing Byte: %s\n", (attributes & COMMON_LVB_TRAILING_BYTE) ? "ON" : "OFF");
    printf("Grid Horizontal: %s\n", (attributes & COMMON_LVB_GRID_HORIZONTAL) ? "ON" : "OFF");
    printf("Grid Vertical (Low End Graphics Characters): %s\n", (attributes & COMMON_LVB_GRID_LVERTICAL) ? "ON" : "OFF");
    printf("Grid Vertical (High End Graphics Characters): %s\n", (attributes & COMMON_LVB_GRID_RVERTICAL) ? "ON" : "OFF");
    printf("Reverse Video: %s\n", (attributes & COMMON_LVB_REVERSE_VIDEO) ? "ON" : "OFF");
    printf("Underscore: %s\n", (attributes & COMMON_LVB_UNDERSCORE) ? "ON" : "OFF");
}


int main() {
    HANDLE potentialHandle;
    DWORD dwBytesRead;
    CHAR buffer[2];

	CONSOLE_SCREEN_BUFFER_INFO csbi;

	for (DWORD i = 0x4; i <= 0xFFF; i += 1) {  // Typical handle values increment by 4.
		potentialHandle = (HANDLE)i;
		
		// Try to fetch information about the screen buffer.
		if (GetConsoleScreenBufferInfo(potentialHandle, &csbi)) {
			printf("Found potential screen buffer handle: 0x%lX\n", (unsigned long)potentialHandle);
			
			// Print the contents of CONSOLE_SCREEN_BUFFER_INFO
			printf("Size: (%d, %d)\n", csbi.dwSize.X, csbi.dwSize.Y);
			printf("CursorPosition: (%d, %d)\n", csbi.dwCursorPosition.X, csbi.dwCursorPosition.Y);
			interpretAttributes(csbi.wAttributes);
			printf("Window left-top: (%d, %d), right-bottom: (%d, %d)\n",
				   csbi.srWindow.Left, csbi.srWindow.Top, csbi.srWindow.Right, csbi.srWindow.Bottom);
			printf("MaximumWindowSize: (%d, %d)\n", csbi.dwMaximumWindowSize.X, csbi.dwMaximumWindowSize.Y);
			printf("\n");
		} else {
			// printf("No potential screen buffer handle: 0x%lX\n", (unsigned long)potentialHandle);
		}
	}
	
    return 0;
}
