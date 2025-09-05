class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        _ = solve(&board)
    }
    private func solve(_ b: inout [[Character]]) -> Bool {
        for i in 0..<9 {
            for j in 0..<9 {
                if b[i][j] == "." {
                    for d in 1...9 {
                        let ch = Character(String(d))
                        if isValid(b, i, j, ch) {
                            b[i][j] = ch
                            if solve(&b) { return true }
                            b[i][j] = "."
                        }
                    }
                    return false
                }
            }
        }
        return true
    }
    private func isValid(_ b: [[Character]], _ r: Int, _ c: Int, _ ch: Character) -> Bool {
        for i in 0..<9 {
            if b[r][i] == ch || b[i][c] == ch { return false }
            if b[(r/3)*3 + i/3][(c/3)*3 + i%3] == ch { return false }
        }
        return true
    }
}