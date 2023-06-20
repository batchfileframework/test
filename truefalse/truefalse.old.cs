using System;

public class LogicCheck
{
    public static void Check(bool condition)
    {
        if (condition)
        {
            Console.WriteLine("Result is True");
        }
        else
        {
            Console.WriteLine("Result is False");
        }
    }
}

public class Program
{
    public static void Main()
    {
        LogicCheck.Check(false);
    }
}