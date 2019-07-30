package main

import (
	"fmt"

	"github.com/BrianSigafoos/go_practice/hello"
)

func main() {
	// hello.go
	print(hello.Hello())
	print(hello.Proverb())
}

func print(s string) {
	fmt.Println(s)
}
