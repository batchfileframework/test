public class Main {
    public static void main(String[] args) {
        System.out.println("Hello, world!");

        if (args.length > 0) {
            String arg = args[0].toLowerCase();

            if (arg.equals("true")) {
                System.out.println("The argument was true.");
            } else if (arg.equals("false")) {
                System.out.println("The argument was false.");
            } else {
                System.out.println("The argument was not a recognizable boolean value.");
            }
        } else {
            System.out.println("No argument was provided.");
        }
    }
}
