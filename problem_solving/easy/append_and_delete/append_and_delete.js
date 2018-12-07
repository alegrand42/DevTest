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

const getArr = (s, t) => s.map((_, i) => [s[i], t[i]]);

// Complete the appendAndDelete function below.
function appendAndDelete(s, t, k) {
    let sa = s.split('');
    let ta = t.split('');
    let arr = getArr(sa, ta);
    let del = 0;
    let add = 0;
    for (let i = 0; i < arr.length; i++) {
        if (arr[i][0] !== arr[i][1]) {
            del = sa.length - i;
            add = ta.length - i;
            break;
        }
    }
    return del + add <= k ? 'Yes' : 'No';
}

function main() {
    const ws = fs.createWriteStream(process.env.OUTPUT_PATH);

    const s = readLine();

    const t = readLine();

    const k = parseInt(readLine(), 10);

    let result = appendAndDelete(s, t, k);

    ws.write(result + "\n");

    ws.end();
}
