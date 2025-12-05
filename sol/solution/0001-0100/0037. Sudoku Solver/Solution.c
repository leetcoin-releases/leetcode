static bool isValid(char** b, int r, int c, char ch) {
    for (int i = 0; i < 9; i++) {
        if (b[r][i] == ch || b[i][c] == ch) return false;
        if (b[(r/3)*3 + i/3][(c/3)*3 + i%3] == ch) return false;
    }
    return true;
}
static bool solve(char** b) {
    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
            if (b[i][j] == '.') {
                for (char ch = '1'; ch <= '9'; ch++) {
                    if (isValid(b, i, j, ch)) {
                        b[i][j] = ch;
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
void solveSudoku(char** board, int boardSize, int* boardColSize) {
    solve(board);
}