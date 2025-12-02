class Solution {
  bool isValidSudoku(List<List<String>> board) {
    List<int> rows = List.filled(9, 0);
    List<int> cols = List.filled(9, 0);
    List<int> boxes = List.filled(9, 0);
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        String c = board[i][j];
        if (c == '.') continue;
        int v = c.codeUnitAt(0) - '1'.codeUnitAt(0);
        int mask = 1 << v;
        int b = (i ~/ 3) * 3 + (j ~/ 3);
        if ((rows[i] & mask) != 0) return false;
        if ((cols[j] & mask) != 0) return false;
        if ((boxes[b] & mask) != 0) return false;
        rows[i] |= mask;
        cols[j] |= mask;
        boxes[b] |= mask;
      }
    }
    return true;
  }
}