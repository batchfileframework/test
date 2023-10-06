#include <windows.h>
#include <stdio.h>
#include <ctype.h>


int isNumeric(const char *str) {
    while(*str) {
        if(!isdigit(*str))
            return 0; // false
        str++;
    }
    return 1; // true
}

void parseBounds(const char* rangeStr, DWORD* startBound, DWORD* endBound) {
    if (!rangeStr || strlen(rangeStr) == 0) {
        *startBound = 0;
        *endBound = 0xFFF;
        return;
    }

    char* dashPos = strchr(rangeStr, '-');
    if (!dashPos) {
        // If there's no dash, treat the bounds as the same number
        *startBound = *endBound = (DWORD)strtol(rangeStr, NULL, 10);
    } else {
        // If there's a dash, extract the numbers before and after the dash as the start and end bounds
        *dashPos = '\0';
        *startBound = (DWORD)strtol(rangeStr, NULL, 10);
        *dashPos = '-';
        *endBound = (DWORD)strtol(dashPos + 1, NULL, 10);
    }
}

void printAttributes(const char* prefix, WORD attributes) {
    printf("%s.attributes.foreground.red=%d\n", prefix, (attributes & FOREGROUND_RED) ? 1 : 0);
    printf("%s.attributes.foreground.green=%d\n", prefix, (attributes & FOREGROUND_GREEN) ? 1 : 0);
    printf("%s.attributes.foreground.blue=%d\n", prefix, (attributes & FOREGROUND_BLUE) ? 1 : 0);
    printf("%s.attributes.foreground.intensity=%d\n", prefix, (attributes & FOREGROUND_INTENSITY) ? 1 : 0);

    printf("%s.attributes.background.red=%d\n", prefix, (attributes & BACKGROUND_RED) ? 1 : 0);
    printf("%s.attributes.background.green=%d\n", prefix, (attributes & BACKGROUND_GREEN) ? 1 : 0);
    printf("%s.attributes.background.blue=%d\n", prefix, (attributes & BACKGROUND_BLUE) ? 1 : 0);
    printf("%s.attributes.background.intensity=%d\n", prefix, (attributes & BACKGROUND_INTENSITY) ? 1 : 0);

    printf("%s.attributes.leadingbyte=%d\n", prefix, (attributes & COMMON_LVB_LEADING_BYTE) ? 1 : 0);
    printf("%s.attributes.trailingbyte=%d\n", prefix, (attributes & COMMON_LVB_TRAILING_BYTE) ? 1 : 0);
    printf("%s.attributes.grid.horizontal=%d\n", prefix, (attributes & COMMON_LVB_GRID_HORIZONTAL) ? 1 : 0);
    printf("%s.attributes.grid.vertical.lowend=%d\n", prefix, (attributes & COMMON_LVB_GRID_LVERTICAL) ? 1 : 0);
    printf("%s.attributes.grid.vertical.highend=%d\n", prefix, (attributes & COMMON_LVB_GRID_RVERTICAL) ? 1 : 0);
    printf("%s.attributes.reverse=%d\n", prefix, (attributes & COMMON_LVB_REVERSE_VIDEO) ? 1 : 0);
    printf("%s.attributes.underscore=%d\n", prefix, (attributes & COMMON_LVB_UNDERSCORE) ? 1 : 0);
}

void printInfo(const char* prefix, CONSOLE_SCREEN_BUFFER_INFO *csbi, const char* idx, unsigned long potentialHandle) {
    const char* format = isNumeric(idx) ? "%s[%s]" : "%s.%s";

    char buffer[256];
    sprintf(buffer, format, prefix, idx);
    
    printf("%s.handle=%lu\n", buffer, potentialHandle);
    printf("%s.size.width=%d\n", buffer, csbi->dwSize.X);
    printf("%s.size.height=%d\n", buffer, csbi->dwSize.Y);
    printf("%s.cursor.x=%d\n", buffer, csbi->dwCursorPosition.X);
    printf("%s.cursor.y=%d\n", buffer, csbi->dwCursorPosition.Y);
    printf("%s.window.left=%d\n", buffer, csbi->srWindow.Left);
    printf("%s.window.top=%d\n", buffer, csbi->srWindow.Top);
    printf("%s.window.right=%d\n", buffer, csbi->srWindow.Right);
    printf("%s.window.bottom=%d\n", buffer, csbi->srWindow.Bottom);
    printf("%s.window.width=%d\n", buffer, csbi->srWindow.Right - csbi->srWindow.Left + 1);
    printf("%s.window.height=%d\n", buffer, csbi->srWindow.Bottom - csbi->srWindow.Top + 1);
    printf("%s.window.maxwidth=%d\n", buffer, csbi->dwMaximumWindowSize.X);
    printf("%s.window.maxheight=%d\n", buffer, csbi->dwMaximumWindowSize.Y);
    
    printAttributes(buffer, csbi->wAttributes);
}

void processRange(const char* prefix, const char* rangeStr, int* idx) {
    DWORD startBound, endBound;
    parseBounds(rangeStr, &startBound, &endBound);

    char idxStr[20]; // Enough to hold all digits of int
    for (DWORD i = startBound; i <= endBound; i += 1) {
        HANDLE potentialHandle = (HANDLE)i;
        CONSOLE_SCREEN_BUFFER_INFO csbi;
        if (GetConsoleScreenBufferInfo(potentialHandle, &csbi)) {
            (*idx)++;
            sprintf(idxStr, "%d", *idx);  // Convert idx to string
            printInfo(prefix, &csbi, idxStr, (unsigned long)potentialHandle);
        }
    }
}

int main(int argc, char* argv[]) {

    if (argc >= 2 && (strcmp(argv[1], "/?") == 0 || strcmp(argv[1], "/h") == 0)) {
        printf("Usage: %s optional <prefix> optional [range1] [range2] [rangeN] ...\n", argv[0]);
        return 1;
    }

    const char* prefix = "console.screenbuffers"; // Default prefix
    int idx = -1; // Initialize idx in main
    int argIndex = 1;

	if (argc > 1 && !isNumeric(argv[1]) && !strchr(argv[1], '-')) {
		prefix = argv[1];
		argIndex++;
	}
	
	if (argc >= 2) { if (strcmp(argv[1], "active") == 0) { prefix = "console.screenbuffers"; } }
	
	CONSOLE_SCREEN_BUFFER_INFO csbi;
	HANDLE hActiveScreenBuffer = GetStdHandle(STD_OUTPUT_HANDLE);
	if (GetConsoleScreenBufferInfo(hActiveScreenBuffer, &csbi)) {
		printInfo(prefix, &csbi,"active", (unsigned long)hActiveScreenBuffer);
	}
	
	if (argc >= 2) { if (strcmp(argv[1], "active") == 0) { return 0; } }
	
	// Process remaining arguments as ranges, or use the default range if none are provided.
	if (argIndex < argc) {
		for (; argIndex < argc; argIndex++) {
			processRange(prefix, argv[argIndex], &idx);
		}
	} else {
		processRange(prefix, "", &idx);
	}

    if (idx != -1) {
        printf("%s.ubound=%d\n", prefix, idx);
    }
	
    return 0;
}
