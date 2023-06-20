// We import process from Node.js to handle command-line arguments
import { argv } from 'process';

console.log('Hello, world!');

// argv is an array with the command-line arguments
// argv[0] is the node executable, argv[1] is the file name, and argv[2] onwards are the actual arguments
if (argv.length > 2) {
    const arg = argv[2].toLowerCase();

    if (arg === 'true') {
        console.log('The argument was true.');
    } else if (arg === 'false') {
        console.log('The argument was false.');
    } else {
        console.log('The argument was not a recognizable boolean value.');
    }
} else {
    console.log('No argument was provided.');
}
