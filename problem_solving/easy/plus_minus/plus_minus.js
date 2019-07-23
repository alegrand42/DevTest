const pMin = ([p, n, z], elem) => [
    p += elem > 0 ? 1 : 0,
    n += elem < 0 ? 1 : 0,
    z += elem === 0 ? 1 : 0
]; 

function plusMinus(arr) {
    let res = arr.reduce(pMin, [0, 0, 0]);
    console.log(res.map((e, _) => (e / arr.length).toFixed(6)).join('\n'));
}
