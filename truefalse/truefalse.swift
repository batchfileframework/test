import Foundation

print("Hello, world!")

if CommandLine.arguments.count > 1 {
    let arg = CommandLine.arguments[1].lowercased()

    if arg == "true" {
        print("The argument was true.")
    } else if arg == "false" {
        print("The argument was false.")
    } else {
        print("The argument was not a recognizable boolean value.")
    }
} else {
    print("No argument was provided.")
}
