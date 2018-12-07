const getSq = (sum, val) => ( sum += Math.sqrt(val) % 1 === 0 ? 1 : 0);

function squares(a, b) {
    let arr = [...Array(b - a + 1)].map((_, i) => i + a);
    return arr.reduce(getSq, 0);
}
