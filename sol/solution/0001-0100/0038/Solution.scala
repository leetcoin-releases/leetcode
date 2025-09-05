object Solution {
    def countAndSay(n: Int): String = {
        var res = "1"
        for (_ <- 2 to n) {
            val sb = new StringBuilder
            var cnt = 1
            for (j <- 1 until res.length) {
                if (res(j) == res(j-1)) cnt += 1
                else {
                    sb.append(cnt).append(res(j-1))
                    cnt = 1
                }
            }
            sb.append(cnt).append(res.last)
            res = sb.toString
        }
        res
    }
}