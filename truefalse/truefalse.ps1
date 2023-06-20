# Print "Hello, World!"
Write-Host "Hello, World!"

# Check if a command line argument was provided
if ($args.Length -gt 0) {
    # Get the first command line argument and convert it to lowercase
    $arg = $args[0].ToLower()

    # Check if the argument is "true" or "false"
    if ($arg -eq "true") {
        Write-Host "The argument was true."
    }
    elseif ($arg -eq "false") {
        Write-Host "The argument was false."
    }
    else {
        Write-Host "The argument was not a recognizable boolean value."
    }
}
else {
    Write-Host "No argument was provided."
}
