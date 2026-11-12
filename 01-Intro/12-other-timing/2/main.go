package main

import (
    "fmt"
    "time"
)

func main() {
    ticker := time.NewTicker(time.Second)
    quit := make(chan struct{}) // Create a quit channel

    go func() {
        for {
            select {
            case <-ticker.C:
                fmt.Println("Ticker fired!")
            case <-quit:
                fmt.Println("Goroutine stopped!")
                return // Exit the loop when receiving the quit signal
            }
        }
    }()

    time.Sleep(time.Second * 3)
    ticker.Stop() // Stop the ticker
    close(quit)   // Send the quit signal
    fmt.Println("Ticker stopped!")
}


https://leapcell.medium.com/working-with-scheduled-tasks-in-go-timer-and-ticker-5b6c4289a63c
