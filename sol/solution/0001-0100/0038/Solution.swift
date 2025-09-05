class Solution {
    func countAndSay(_ n: Int) -> String {
        var res = "1"
        if n <= 1 { return res }
        for _ in 2...n {
            var cur = ""
            var cnt = 1
            let chars = Array(res)
            for j in 1..<chars.count {
                if chars[j] == chars[j-1] {
                    cnt += 1
                } else {
                    cur += "\(cnt)\(chars[j-1])"
                    cnt = 1
                }
            }
            cur += "\(cnt)\(chars.last!)"
            res = cur
        }
        return res
    }
}