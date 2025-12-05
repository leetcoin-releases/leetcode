class Solution {
    fun countAndSay(n: Int): String {
        var res = "1"
        for (i in 2..n) {
            var cur = StringBuilder()
            var cnt = 1
            for (j in 1 until res.length) {
                if (res[j] == res[j-1]) cnt++
                else {
                    cur.append(cnt).append(res[j-1])
                    cnt = 1
                }
            }
            cur.append(cnt).append(res.last())
            res = cur.toString()
        }
        return res
    }
}