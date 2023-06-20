package main

import (
	"fmt"
	"os"
	"strings"
)

func main() {
	fmt.Println("Hello, world!")

	if len(os.Args) > 1 {
		arg := strings.ToLower(os.Args[1])

		if arg == "true" {
			fmt.Println("The argument was true.")
		} else if arg == "false" {
			fmt.Println("The argument was false.")
		} else {
			fmt.Println("The argument was not a recognizable boolean value.")
		}
	} else {
		fmt.Println("No argument was provided.")
	}
}
