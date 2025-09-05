public class Solution {
    public string CountAndSay(int n) {
        string res = "1";
        for (int i = 2; i <= n; i++) {
            StringBuilder cur = new StringBuilder();
            int cnt = 1;
            for (int j = 1; j < res.Length; j++) {
                if (res[j] == res[j-1]) cnt++;
                else {
                    cur.Append(cnt).Append(res[j-1]);
                    cnt = 1;
                }
            }
            cur.Append(cnt).Append(res[res.Length - 1]);
            res = cur.ToString();
        }
        return res;
    }
}