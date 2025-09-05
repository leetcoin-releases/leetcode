char* countAndSay(int n) {
    char *res = malloc(5000); 
    char *cur = malloc(5000);
    strcpy(res, "1");
    for (int i = 2; i <= n; i++) {
        int idx = 0, cnt = 1;
        int len = strlen(res);
        for (int j = 1; j < len; j++) {
            if (res[j] == res[j-1]) {
                cnt++;
            } else {
                idx += sprintf(cur + idx, "%d%c", cnt, res[j-1]);
                cnt = 1;
            }
        }
        idx += sprintf(cur + idx, "%d%c", cnt, res[len-1]);
        strcpy(res, cur);
    }
    free(cur);
    return res;
}