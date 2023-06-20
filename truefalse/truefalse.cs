using System;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Hello, World!");

        if (args.Length > 0)
        {
            bool argument;
            if (bool.TryParse(args[0], out argument))
            {
                if (argument)
                {
                    Console.WriteLine("The argument was true.");
                }
                else
                {
                    Console.WriteLine("The argument was false.");
                }
            }
            else
            {
                Console.WriteLine("The argument was not a recognizable boolean value.");
            }
        }
        else
        {
            Console.WriteLine("No argument was provided.");
        }
    }
}
