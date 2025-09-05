class Solution {
    public String countAndSay(int n) {
        String res = "1";
        for (int i = 2; i <= n; i++) {
            StringBuilder cur = new StringBuilder();
            int cnt = 1;
            for (int j = 1; j < res.length(); j++) {
                if (res.charAt(j) == res.charAt(j-1)) {
                    cnt++;
                } else {
                    cur.append(cnt).append(res.charAt(j-1));
                    cnt = 1;
                }
            }
            cur.append(cnt).append(res.charAt(res.length() - 1));
            res = cur.toString();
        }
        return res;
    }
}