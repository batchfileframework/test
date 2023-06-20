use std::env;

fn main() {
    println!("Hello, world!");

    let args: Vec<String> = env::args().collect();
    
    if args.len() > 1 {
        let arg = args[1].to_lowercase();

        if arg == "true" {
            println!("The argument was true.");
        } else if arg == "false" {
            println!("The argument was false.");
        } else {
            println!("The argument was not a recognizable boolean value.");
        }
    } else {
        println!("No argument was provided.");
    }
}
