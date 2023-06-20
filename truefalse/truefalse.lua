-- print "Hello, world!"
print("Hello, world!")

-- check if a command line argument was provided
if arg[1] then
    -- convert the argument to lower case
    local arg_lower = string.lower(arg[1])

    -- check if the argument is "true" or "false"
    if arg_lower == "true" then
        print("The argument was true.")
    elseif arg_lower == "false" then
        print("The argument was false.")
    else
        print("The argument was not a recognizable boolean value.")
    end
else
    print("No argument was provided.")
end
