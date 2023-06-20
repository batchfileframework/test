import sys

print("Hello, world!")

# Check if a command line argument was provided
if len(sys.argv) > 1:
    arg = sys.argv[1].lower()

    if arg == 'true':
        print("The argument was true.")
    elif arg == 'false':
        print("The argument was false.")
    else:
        print("The argument was not a recognizable boolean value.")
else:
    print("No argument was provided.")
