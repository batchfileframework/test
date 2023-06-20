<?php
echo "Hello, world!\n";

if ($argc > 1) {
    $arg = strtolower($argv[1]);

    if ($arg === "true") {
        echo "The argument was true.\n";
    } elseif ($arg === "false") {
        echo "The argument was false.\n";
    } else {
        echo "The argument was not a recognizable boolean value.\n";
    }
} else {
    echo "No argument was provided.\n";
}
?>
