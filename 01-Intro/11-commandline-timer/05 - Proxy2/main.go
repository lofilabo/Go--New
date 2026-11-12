package main

import (
    "context"
    "log"
    "os"
    "os/signal"
    "time"
)

func main() {
    ctx, cancel := signal.NotifyContext(context.Background(), os.Interrupt)
    defer cancel()

    weeklyTicker := time.NewTicker(2 * time.Second)
    dailyTicker := time.NewTicker(10 * time.Second)
    customTrigger := make(chan struct{})

    // Example of custom trigger at a random point
    go func() {
        time.Sleep(5 * time.Second)
        customTrigger <- struct{}{}
    }()

    weeklyRun := true
    for {
        if weeklyRun {
            log.Println("Run weekly logic")
            weeklyRun = false
        } else {
            log.Println("Run daily logic")
        }

        select {
        case <-ctx.Done():
            log.Println("interrupt received")
            return
        case <-dailyTicker.C:
            log.Println("weekly updated")
            weeklyRun = true
        case <-weeklyTicker.C:
            log.Println("daily check")
        case <-customTrigger:
            log.Println("custom check trigger")
        }
    }
}
