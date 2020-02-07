/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const R = parseInt(readline());
const V = parseInt(readline());
for (let i = 0; i < V; i++) {
    var inputs = readline().split(' ');
    const C = parseInt(inputs[0]);
    const N = parseInt(inputs[1]);
}

function fac(n){
    let arr = Array.from(Array(n + 1).keys())
    arr.splice(0, 1);
    return arr.reduce((acc, e) => acc * e);
}

console.error(fac(4));

// Write an action using console.log()
// To debug: console.error('Debug messages...');

console.log('1');