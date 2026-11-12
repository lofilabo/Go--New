package main

import (
    "fmt"
    "runtime"
    "sync"
    "time"
)

func heavyWork(id int, wg *sync.WaitGroup) {
    defer wg.Done()
    start := time.Now()
    sum := 0
    for i := 0; i < 5e7; i++ {
        sum += i
    }
    fmt.Printf("Worker %d done in %v (sum=%d)\n", id, time.Since(start), sum)
}

func main() {
    cores := runtime.NumCPU()
    runtime.GOMAXPROCS(cores)

    fmt.Printf("Detected %d cores\n", cores)
    fmt.Println("---- Parallelism Demo ----")

    var wg sync.WaitGroup
    for i := 1; i <= cores; i++ {
        wg.Add(1)
        go heavyWork(i, &wg)
    }

    wg.Wait()
    fmt.Println("All workers done.")
}
