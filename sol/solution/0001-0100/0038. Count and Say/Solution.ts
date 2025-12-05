function countAndSay(n: number): string {
    let res = "1";
    for (let i = 2; i <= n; i++) {
        let cur = "";
        let cnt = 1;
        for (let j = 1; j < res.length; j++) {
            if (res[j] === res[j-1]) cnt++;
            else {
                cur += cnt.toString() + res[j-1];
                cnt = 1;
            }
        }
        cur += cnt.toString() + res[res.length-1];
        res = cur;
    }
    return res;
}