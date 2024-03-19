package main

import (
	"fmt"
	"os"
	"strconv"

	"github.com/dgryski/wasip2-demo/docs/calculator/add"
)

func main() {
	if len(os.Args) != 4 {
		fmt.Println("Wrong number of arguments: expected 3")
		return
	}

	arg1, err := strconv.Atoi(os.Args[1])
	if err != nil {
		fmt.Printf("failed to parse uint32 %v: %v\n", os.Args[1], err)
		return
	}

	arg2, err := strconv.Atoi(os.Args[2])
	if err != nil {
		fmt.Printf("failed to parse uint32 %v: %v\n", os.Args[2], err)
		return
	}

	if os.Args[3] == "add" {
		sum := add.Add(uint32(arg1), uint32(arg2))
		fmt.Printf("add.Add(%v, %v)=%v\n", arg1, arg2, sum)
	}
}
