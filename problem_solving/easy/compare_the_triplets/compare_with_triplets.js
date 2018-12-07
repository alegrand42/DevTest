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

const arrSq = (a, b) => a.map((elem, i) => [a[i], b[i]]);
const arrCmp = ([sa, sb], [a, b]) => (
    [
        sa += a > b ? 1 : 0,
        sb += b > a ? 1 : 0
    ]
);

// Complete the compareTriplets function below.
function compareTriplets(a, b) {
    return arrSq(a, b).reduce(arrCmp, [0, 0]);
}

function main() {
    const ws = fs.createWriteStream(process.env.OUTPUT_PATH);

    const a = readLine().replace(/\s+$/g, '').split(' ').map(aTemp => parseInt(aTemp, 10));

    const b = readLine().replace(/\s+$/g, '').split(' ').map(bTemp => parseInt(bTemp, 10));

    const result = compareTriplets(a, b);

    ws.write(result.join(' ') + '\n');

    ws.end();
}
