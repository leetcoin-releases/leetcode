class Solution {
  void solveSudoku(List<List<String>> board) {
    bool isValid(int r, int c, String ch) {
      for (int i = 0; i < 9; i++) {
        if (board[r][i] == ch || board[i][c] == ch) return false;
        if (board[(r ~/ 3) * 3 + (i ~/ 3)][(c ~/ 3) * 3 + (i % 3)] == ch)
          return false;
      }
      return true;
    }
    bool solve() {
      for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
          if (board[i][j] == ".") {
            for (int d = 1; d <= 9; d++) {
              String ch = d.toString();
              if (isValid(i, j, ch)) {
                board[i][j] = ch;
                if (solve()) return true;
                board[i][j] = ".";
              }
            }
            return false;
          }
        }
      }
      return true;
    }
    solve();
  }
}