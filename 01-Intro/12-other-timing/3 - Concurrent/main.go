package main

import (
    "fmt"
    "runtime"
    "time"
)

func worker(id int) {
    for i := 1; i <= 3; i++ {
        fmt.Printf("Worker %d running iteration %d\n", id, i)
        time.Sleep(400 * time.Millisecond)
    }
}

func main() {
    runtime.GOMAXPROCS(1) // use only 1 OS thread
    fmt.Println("Using GOMAXPROCS:", runtime.GOMAXPROCS(0))
    fmt.Println("---- Concurrency Demo ----")

    go worker(1)
    go worker(2)
    go worker(3)

    time.Sleep(3 * time.Second)
}
