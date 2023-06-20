// Access command line arguments
const args = process.argv.slice(2); 

console.log("Hello, world!");

// Check if the first command line argument is true or false
if(args[0] === 'true') {
  console.log('The argument was true.');
} else if(args[0] === 'false') {
  console.log('The argument was false.');
} else {
  console.log('The argument was not a recognizable boolean value.');
}
