package main

import (
    "log"
    "time"
)

func main() {
log.Println("DO SOMETHING 0")
    t1 := schedule(oneSec, time.Second)
    t2 := schedule(twoSec, 2*time.Second)
    time.Sleep(5 * time.Second)
log.Println("DO SOMETHING 1")
    t1.Stop()
    t2.Stop()

log.Println("DO SOMETHING 2")
}

func oneSec() {
    log.Println("oneSec")
}

func twoSec() {
    log.Println("twoSec")
}


func schedule(f func(), interval time.Duration) *time.Ticker {
    ticker := time.NewTicker(interval)
    go func() {
        for range ticker.C {
            f()
        }
    }()
    return ticker
}

