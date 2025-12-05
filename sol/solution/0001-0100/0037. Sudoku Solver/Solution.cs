public class Solution {
    public void SolveSudoku(char[][] board) {
        Solve(board);
    }
    private bool Solve(char[][] b) {
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                if (b[i][j] == '.') {
                    for (char c = '1'; c <= '9'; c++) {
                        if (IsValid(b, i, j, c)) {
                            b[i][j] = c;
                            if (Solve(b)) return true;
                            b[i][j] = '.';
                        }
                    }
                    return false;
                }
            }
        }
        return true;
    }
    private bool IsValid(char[][] b, int r, int c, char ch) {
        for (int i = 0; i < 9; i++) {
            if (b[r][i] == ch || b[i][c] == ch) return false;
            if (b[(r/3)*3 + i/3][(c/3)*3 + i%3] == ch) return false;
        }
        return true;
    }
}