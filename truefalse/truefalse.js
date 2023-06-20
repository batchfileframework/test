// Define a function that takes in an argument and checks if it is true or false
function checkArgument(arg) {
  WScript.Echo('Hello, world!');

  // Check if the argument is true or false
  if (arg.toLowerCase() == 'true') {
    WScript.Echo('The argument was true.');
  } else if (arg.toLowerCase() == 'false') {
    WScript.Echo('The argument was false.');
  } else {
    WScript.Echo('The argument was not a recognizable boolean value.');
  }
}

// Check if a command line argument was provided
if (WScript.Arguments.length > 0) {
  // Call the function with the first command line argument
  checkArgument(WScript.Arguments(0));
} else {
  WScript.Echo('No argument was provided.');
}
