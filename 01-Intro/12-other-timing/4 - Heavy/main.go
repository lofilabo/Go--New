package main

import (
    "fmt"
    "runtime"
    "time"
)

func worker(id int, tm time.Duration ) {
    for i := 1; i <= 3; i++ {
	fmt.Printf("Worker %d running iteration %d\n", id, i)
	time.Sleep(100 * time.Millisecond * tm)
    }
}

func main() {
	runtime.GOMAXPROCS(1) // use only 1 OS thread
	fmt.Println("Using GOMAXPROCS:", runtime.GOMAXPROCS(0))
	fmt.Println("---- Concurrency Demo ----")

	go worker(1,2)
	go worker(2,4)
	go worker(3,40)
	fmt.Printf("Before Timing")
	time.Sleep(10 * time.Second)
	fmt.Printf("After Timing")
}

