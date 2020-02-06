/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const r1 = parseInt(readline());
const r2 = parseInt(readline());

// Write an action using console.log()
// To debug: console.error('Debug messages...');


function get_next(r1){
    const sum = (r1 + "").split("").map(Number).reduce((acc, e) => acc + e);
    return sum + r1;
}

function singleCompare(arr1, arr2){
    const res = [];
    arr1.forEach((e1) => arr2.forEach((e2) => {
        if (e1 === e2){
            res.push(e1)
        }
    }
    ));
    return res;
}

let r_1 = [r1];
let r_2 = [r2];


for(;;){
    r_1.push(get_next(r_1[r_1.length - 1]));
    r_2.push(get_next(r_2[r_2.length - 1]));
    var arr = singleCompare(r_1, r_2);
    if (arr.length > 0){
        console.log(arr[arr.length - 1]);
        break;
    }
}