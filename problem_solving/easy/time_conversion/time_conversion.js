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
    inputString = inputString.trim().split('\n').map(str => str.trim());

    main();
});

function readLine() {
    return inputString[currentLine++];
}

/*
 * Complete the timeConversion function below.
 */
function timeConversion(s) {
    let hh = parseInt(s.slice(0, 2));
    let m = s.slice(8, 10);
    let b = '';

    if (m === 'PM') {
        hh += hh !== 12 ? 12 : 0;
    } else if (hh === 12) {
        hh = 0;
    }
    if (hh < 10)
        b += '0';
    return b + hh + s.slice(2, 8);
}

function main() {
    const ws = fs.createWriteStream(process.env.OUTPUT_PATH);

    const s = readLine();

    let result = timeConversion(s);

    ws.write(result + "\n");

    ws.end();
}
