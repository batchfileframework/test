#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
    printf("Hello, World!\n");

    if (argc > 1) {
        if (strcmp(argv[1], "true") == 0) {
            printf("The argument was true.\n");
        } else if (strcmp(argv[1], "false") == 0) {
            printf("The argument was false.\n");
        } else {
            printf("The argument was not a recognizable boolean value.\n");
        }
    } else {
        printf("No argument was provided.\n");
    }

    return 0;
}
