class Solution {
public:
    void solveSudoku(vector<vector<char>>& board) {
        solve(board);
    }
private:
    bool solve(vector<vector<char>>& b) {
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                if (b[i][j] == '.') {
                    for (char c = '1'; c <= '9'; c++) {
                        if (isValid(b, i, j, c)) {
                            b[i][j] = c;
                            if (solve(b)) return true;
                            b[i][j] = '.';
                        }
                    }
                    return false;
                }
            }
        }
        return true;
    }
    bool isValid(vector<vector<char>>& b, int r, int c, char ch) {
        for (int i = 0; i < 9; i++) {
            if (b[r][i] == ch || b[i][c] == ch) return false;
            if (b[(r/3)*3 + i/3][(c/3)*3 + i%3] == ch) return false;
        }
        return true;
    }
};