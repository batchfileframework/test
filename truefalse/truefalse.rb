puts "Hello, world!"

if ARGV.length > 0
    arg = ARGV[0].downcase

    if arg == "true"
        puts "The argument was true."
    elsif arg == "false"
        puts "The argument was false."
    else
        puts "The argument was not a recognizable boolean value."
    end
else
    puts "No argument was provided."
end
