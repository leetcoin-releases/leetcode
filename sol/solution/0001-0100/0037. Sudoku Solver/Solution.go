func solveSudoku(board [][]byte)  {
    var solve func() bool
    solve = func() bool {
        for i := 0; i < 9; i++ {
            for j := 0; j < 9; j++ {
                if board[i][j] == '.' {
                    for d := byte('1'); d <= '9'; d++ {
                        if isValid(board, i, j, d) {
                            board[i][j] = d
                            if solve() {
                                return true
                            }
                            board[i][j] = '.'
                        }
                    }
                    return false
                }
            }
        }
        return true
    }
    solve()
}
func isValid(b [][]byte, r, c int, ch byte) bool {
    for i := 0; i < 9; i++ {
        if b[r][i] == ch || b[i][c] == ch {
            return false
        }
        if b[(r/3)*3+i/3][(c/3)*3+i%3] == ch {
            return false
        }
    }
    return true
}