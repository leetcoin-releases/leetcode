class Solution {
public:
    string countAndSay(int n) {
        string res = "1";
        for (int i = 2; i <= n; i++) {
            string cur = "";
            int cnt = 1;
            for (int j = 1; j < res.size(); j++) {
                if (res[j] == res[j-1]) {
                    cnt++;
                } else {
                    cur += to_string(cnt) + res[j-1];
                    cnt = 1;
                }
            }
            cur += to_string(cnt) + res.back();
            res = cur;
        }
        return res;
    }
};