class Solution {
    fun isValidSudoku(board: Array<CharArray>): Boolean {
        val rows = IntArray(9)
        val cols = IntArray(9)
        val boxes = IntArray(9)
        for (i in 0 until 9) {
            for (j in 0 until 9) {
                val c = board[i][j]
                if (c == '.') continue
                val v = c - '1'
                val mask = 1 shl v
                val b = (i / 3) * 3 + (j / 3)
                if ((rows[i] and mask) != 0) return false
                if ((cols[j] and mask) != 0) return false
                if ((boxes[b] and mask) != 0) return false
                rows[i] = rows[i] or mask
                cols[j] = cols[j] or mask
                boxes[b] = boxes[b] or mask
            }
        }
        return true
    }
}