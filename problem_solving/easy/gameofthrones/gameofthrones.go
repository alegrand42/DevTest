package main

import (
    "bufio"
    "fmt"
    "io"
    "os"
    "strings"
)

// Complete the gameOfThrones function below.
func gameOfThrones(s string) string {
    p := make([]int, 26)

    for _, v := range s {
        i := int(v) - int('a')
        p[i] = (p[i] + 1) % 2
    }

    sum := 0
    for _, v := range p {
        sum += v
    }

    if len(s) % 2 == sum {
        return "YES"
    }

    return "NO"
}

func main() {
    reader := bufio.NewReaderSize(os.Stdin, 1024 * 1024)

    stdout, err := os.Create(os.Getenv("OUTPUT_PATH"))
    checkError(err)

    defer stdout.Close()

    writer := bufio.NewWriterSize(stdout, 1024 * 1024)

    s := readLine(reader)

    result := gameOfThrones(s)

    fmt.Fprintf(writer, "%s\n", result)

    writer.Flush()
}

func readLine(reader *bufio.Reader) string {
    str, _, err := reader.ReadLine()
    if err == io.EOF {
        return ""
    }

    return strings.TrimRight(string(str), "\r\n")
}

func checkError(err error) {
    if err != nil {
        panic(err)
    }
}