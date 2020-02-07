'use strict';

const fs = require('fs');

process.stdin.resume();
process.stdin.setEncoding('utf-8');

let inputString = '';
let currentLine = 0;

process.stdin.on('data', inputStdin => {
    inputString += inputStdin;
});

process.stdin.on('end', _ => {
    inputString = inputString.replace(/\s*$/, '')
        .split('\n')
        .map(str => str.replace(/\s*$/, ''));

    main();
});

function readLine() {
    return inputString[currentLine++];
}

function countArr(arr, elem){
    let count = 0;
    for(let i =0; i < arr.length; i++){
        arr[i] === elem ? count++ : 0;
    }
    return count;
}

function maxArr(arr){
    return arr.reduce(
        (acc, e) => (acc > e ? acc : e)
    );
}

// Complete the birthdayCakeCandles function below.
function birthdayCakeCandles(ar) {
    let hash = {};
    for(let i =0; i < ar.length; i++){
        hash[ar[i]] = countArr(ar, ar[i]);
    }
    return hash[maxArr(ar)];
}

function main() {
    const ws = fs.createWriteStream(process.env.OUTPUT_PATH);

    const arCount = parseInt(readLine(), 10);

    const ar = readLine().split(' ').map(arTemp => parseInt(arTemp, 10));

    let result = birthdayCakeCandles(ar);

    ws.write(result + "\n");

    ws.end();
}

