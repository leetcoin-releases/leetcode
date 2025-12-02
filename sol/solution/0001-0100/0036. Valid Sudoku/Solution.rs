impl Solution {
    pub fn is_valid_sudoku(board: Vec<Vec<char>>) -> bool {
        let mut rows = [0u16; 9];
        let mut cols = [0u16; 9];
        let mut boxes = [0u16; 9];
        for i in 0..9 {
            for j in 0..9 {
                let c = board[i][j];
                if c == '.' { continue; }
                let v = (c as u8 - b'1') as usize;
                let mask = 1 << v;
                let b = (i / 3) * 3 + (j / 3);
                if rows[i] & mask != 0 { return false; }
                if cols[j] & mask != 0 { return false; }
                if boxes[b] & mask != 0 { return false; }
                rows[i] |= mask;
                cols[j] |= mask;
                boxes[b] |= mask;
            }
        }
        true
    }
}