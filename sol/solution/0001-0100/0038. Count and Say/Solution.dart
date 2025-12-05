class Solution {
  String countAndSay(int n) {
    String res = "1";
    for (int i = 2; i <= n; i++) {
      String cur = "";
      int cnt = 1;
      for (int j = 1; j < res.length; j++) {
        if (res[j] == res[j-1]) {
          cnt++;
        } else {
          cur += cnt.toString() + res[j-1];
          cnt = 1;
        }
      }
      cur += cnt.toString() + res[res.length - 1];
      res = cur;
    }
    return res;
  }
}