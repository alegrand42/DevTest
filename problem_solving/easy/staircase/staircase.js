function staircase(n) {
    for (let i = n; --i >= 0;){
        let str = '';
        for (let j = 0; j < n; j++){
            str += j >= i ? '#' : ' ';
        }
        console.log(str);
    }
}
