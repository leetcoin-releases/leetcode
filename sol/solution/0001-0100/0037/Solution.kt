class Solution {
    fun solveSudoku(board: Array<CharArray>): Unit {
        solve(board)
    }
    private fun solve(b: Array<CharArray>): Boolean {
        for (i in 0 until 9) {
            for (j in 0 until 9) {
                if (b[i][j] == '.') {
                    for (d in '1'..'9') {
                        if (isValid(b, i, j, d)) {
                            b[i][j] = d
                            if (solve(b)) return true
                            b[i][j] = '.'
                        }
                    }
                    return false
                }
            }
        }
        return true
    }
    private fun isValid(b: Array<CharArray>, r: Int, c: Int, ch: Char): Boolean {
        for (i in 0 until 9) {
            if (b[r][i] == ch || b[i][c] == ch) return false
            if (b[(r/3)*3 + i/3][(c/3)*3 + i%3] == ch) return false
        }
        return true
    }
}