'use strict';

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

function arrMax(arr){
    return arr.reduce(function(p, v){
       return (p > v ? p : v);
    });
}

function arrMin(arr){
    return arr.reduce(function(p, v){
        return (p < v ? p : v);
    });
}

// Complete the miniMaxSum function below.
function miniMaxSum(arr) {
    let res = [];

    for(let i =0; i < arr.length; i++){
        let dupArr = arr.slice(0);
        dupArr.splice(i, 1);
        res.push(dupArr.reduce((acc, e) => acc + e));
    }
    console.log(arrMin(res) + ' ' + arrMax(res));
}

function main() {
    const arr = readLine().split(' ').map(arrTemp => parseInt(arrTemp, 10));

    miniMaxSum(arr);
}
