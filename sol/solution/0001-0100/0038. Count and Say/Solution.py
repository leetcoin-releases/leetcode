class Solution:
    def countAndSay(self, n: int) -> str:
        res = "1"
        for _ in range(1, n):
            cur = ""
            cnt = 1
            for j in range(1, len(res)):
                if res[j] == res[j-1]:
                    cnt += 1
                else:
                    cur += str(cnt) + res[j-1]
                    cnt = 1
            cur += str(cnt) + res[-1]
            res = cur
        return res