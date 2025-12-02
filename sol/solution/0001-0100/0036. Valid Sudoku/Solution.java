class Solution {
    public boolean isValidSudoku(char[][] board) {
        int[] rows = new int[9], cols = new int[9], boxes = new int[9];
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                char c = board[i][j];
                if (c == '.') continue;
                int v = c - '1';
                int mask = 1 << v;
                int b = (i / 3) * 3 + (j / 3);
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