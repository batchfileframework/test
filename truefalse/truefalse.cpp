#include <iostream>
#include <string>

int main(int argc, char* argv[]) {
    std::cout << "Hello, world!\n";

    if (argc > 1) {
        std::string arg = argv[1];
        std::transform(arg.begin(), arg.end(), arg.begin(), ::tolower);

        if (arg == "true") {
            std::cout << "The argument was true.\n";
        } else if (arg == "false") {
            std::cout << "The argument was false.\n";
        } else {
            std::cout << "The argument was not a recognizable boolean value.\n";
        }
    } else {
        std::cout << "No argument was provided.\n";
    }

    return 0;
}
