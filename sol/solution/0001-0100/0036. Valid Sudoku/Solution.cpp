class Solution {
public:
    bool isValidSudoku(vector<vector<char>>& board) {
        int rows[9] = {0}, cols[9] = {0}, boxes[9] = {0};
        for (int i = 0; i < 9; ++i) {
            for (int j = 0; j < 9; ++j) {
                char c = board[i][j];
                if (c == '.') continue;
                int v = c - '1'; // 0..8
                int mask = 1 << v;
                int b = (i / 3) * 3 + (j / 3);
                if (rows[i] & mask) return false;
                if (cols[j] & mask) return false;
                if (boxes[b] & mask) return false;
                rows[i] |= mask;
                cols[j] |= mask;
                boxes[b] |= mask;
            }
        }
        return true;
    }
};