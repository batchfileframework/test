#include <windows.h>
#include <stdio.h>

int main() {
    // Get the handle to the original screen buffer.
    HANDLE hOriginalScreenBuffer = GetStdHandle(STD_OUTPUT_HANDLE);
    if (hOriginalScreenBuffer == INVALID_HANDLE_VALUE) {
        printf("Failed to get original screen buffer handle.\n");
        return 1;
    }

    // Create a new screen buffer.
    HANDLE hNewScreenBuffer = CreateConsoleScreenBuffer(
        GENERIC_READ | GENERIC_WRITE,
        FILE_SHARE_READ | FILE_SHARE_WRITE,
        NULL,
        CONSOLE_TEXTMODE_BUFFER,
        NULL
    );
    if (hNewScreenBuffer == INVALID_HANDLE_VALUE) {
        printf("Failed to create new screen buffer.\n");
        return 1;
    }

    // Write some text to the new screen buffer.
    DWORD dwBytesWritten;
    const char* msg = "This is the new screen buffer!";
    if (!WriteConsole(hNewScreenBuffer, msg, strlen(msg), &dwBytesWritten, NULL)) {
        printf("Failed to write to new screen buffer.\n");
        CloseHandle(hNewScreenBuffer);
        return 1;
    }

    // Set the new screen buffer as the active screen buffer.
    if (!SetConsoleActiveScreenBuffer(hNewScreenBuffer)) {
        printf("Failed to set new screen buffer as active.\n");
        CloseHandle(hNewScreenBuffer);
        return 1;
    }

    // Wait for a key press.
    printf("Press any key to revert back to original screen buffer...\n");
    getch();

    // Revert back to the original screen buffer.
    SetConsoleActiveScreenBuffer(hOriginalScreenBuffer);

    CloseHandle(hNewScreenBuffer);
    return 0;
}
