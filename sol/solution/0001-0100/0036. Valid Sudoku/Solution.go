func isValidSudoku(board [][]byte) bool {
    var rows, cols, boxes [9]int
    for i := 0; i < 9; i++ {
        for j := 0; j < 9; j++ {
            c := board[i][j]
            if c == '.' { continue }
            v := int(c - '1')
            mask := 1 << v
            b := (i/3)*3 + j/3
            if rows[i]&mask != 0 { return false }
            if cols[j]&mask != 0 { return false }
            if boxes[b]&mask != 0 { return false }
            rows[i] |= mask
            cols[j] |= mask
            boxes[b] |= mask
        }
    }
    return true
}