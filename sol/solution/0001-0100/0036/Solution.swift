class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = [Int](repeating: 0, count: 9)
        var cols = [Int](repeating: 0, count: 9)
        var boxes = [Int](repeating: 0, count: 9)
        for i in 0..<9 {
            for j in 0..<9 {
                let c = board[i][j]
                if c == "." { continue }
                let v = Int(c.asciiValue! - Character("1").asciiValue!)
                let mask = 1 << v
                let b = (i / 3) * 3 + (j / 3)
                if (rows[i] & mask) != 0 { return false }
                if (cols[j] & mask) != 0 { return false }
                if (boxes[b] & mask) != 0 { return false }
                rows[i] |= mask
                cols[j] |= mask
                boxes[b] |= mask
            }
        }
        return true
    }
}