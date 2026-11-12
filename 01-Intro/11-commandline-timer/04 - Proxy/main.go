package main

import (
    "fmt"
    "time"
)

func main() {
    var a int
    // use like this
    timeChan, callback := NewProxyTicker(time.Second * 2)
    go callback()

    tickChan := time.NewTicker(time.Millisecond * 500).C

    for {
        select {
        case <-timeChan: 
            fmt.Println("weekly updated")
            a = 1
        case <-tickChan:
            if a == 1 {
                fmt.Println("daily check")
            } else {
                fmt.Println("Not update？")
            }
        }
    }
}

func NewProxyTicker(d time.Duration) (chan time.Time, func()) {
    ticker := time.NewTicker(d)
    proxyChan := make(chan time.Time)
    callback := func() {
        proxyChan <- time.Now()
        for {
            select {
            case <-ticker.C:
                proxyChan <- time.Now()
            }
        }
    }
    return proxyChan, callback
}
