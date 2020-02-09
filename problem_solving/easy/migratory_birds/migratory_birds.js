'use strict';

const fs = require('fs');

process.stdin.resume();
process.stdin.setEncoding('utf-8');

let inputString = '';
let currentLine = 0;

process.stdin.on('data', function(inputStdin) {
    inputString += inputStdin;
});

process.stdin.on('end', function() {
    inputString = inputString.split('\n');

    main();
});

function readLine() {
    return inputString[currentLine++];
}

function arrCount(arr, value){
    let count = 0;
    arr.forEach((e) => { if (value === e) count++})
    return count;
}

// Complete the migratoryBirds function below.
function migratoryBirds(arr) {
    let res = []
    arr.forEach((e) => res.push([e, arrCount(arr, e)]));
    let max = res[0][1]; 
    res.forEach(e => { if (max < e[1]){ max = e[1] }});
    let test= []
    res.sort().forEach( e => {if (e[1] === max) test.push(e[0])});
    return test[0];
}

function main() {
    const ws = fs.createWriteStream(process.env.OUTPUT_PATH);

    const arrCount = parseInt(readLine().trim(), 10);

    const arr = readLine().replace(/\s+$/g, '').split(' ').map(arrTemp => parseInt(arrTemp, 10));

    const result = migratoryBirds(arr);

    ws.write(result + '\n');

    ws.end();
}
