package main

import (
    "bufio"
    "fmt"
    "io"
    "os"
    "strconv"
    "strings"
)

func printArr(arr []int32, n int32) {
    for i := int32(0); i < n ; i++ {
        fmt.Printf("%v ", arr[i])
    }
    fmt.Println()
}

// Complete the insertionSort1 function below.
func insertionSort1(n int32, arr []int32) {
    i := n - 1
    j := i
    x := arr[i]

    for j > 0 && arr[j - 1] > x {
        arr[j] = arr[j - 1]
        j--
        printArr(arr, n)
    }
    arr[j] = x
    printArr(arr, n)
}

func main() {
    reader := bufio.NewReaderSize(os.Stdin, 1024 * 1024)

    nTemp, err := strconv.ParseInt(readLine(reader), 10, 64)
    checkError(err)
    n := int32(nTemp)

    arrTemp := strings.Split(readLine(reader), " ")

    var arr []int32

    for i := 0; i < int(n); i++ {
        arrItemTemp, err := strconv.ParseInt(arrTemp[i], 10, 64)
        checkError(err)
        arrItem := int32(arrItemTemp)
        arr = append(arr, arrItem)
    }

    insertionSort1(n, arr)
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