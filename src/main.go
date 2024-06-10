package main

import (
    "log"
    "net/http"
)

func main() {
    http.HandleFunc("/", handler)

    log.Println("Server started on :8080")
    if err := http.ListenAndServe(":8080", nil); err != nil {
        log.Fatalf("Server error: %s", err)
    }
}

func handler(w http.ResponseWriter, r *http.Request) {
    w.WriteHeader(http.StatusOK)
    w.Write([]byte("Hello, World!"))
}
