func countAndSay(n int) string {
    res := "1"
    for i := 2; i <= n; i++ {
        cur := ""
        cnt := 1
        for j := 1; j < len(res); j++ {
            if res[j] == res[j-1] {
                cnt++
            } else {
                cur += strconv.Itoa(cnt) + string(res[j-1])
                cnt = 1
            }
        }
        cur += strconv.Itoa(cnt) + string(res[len(res)-1])
        res = cur
    }
    return res
}