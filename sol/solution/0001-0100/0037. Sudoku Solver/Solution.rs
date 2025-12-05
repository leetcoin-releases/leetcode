impl Solution {
    pub fn solve_sudoku(board: &mut Vec<Vec<char>>) {
        let mut rows = [0b1111111110u16; 9];
        let mut cols = [0b1111111110u16; 9];
        let mut boxes = [0b1111111110u16; 9];
        let mut indexes = board.iter().flatten().enumerate().filter_map(|(idx, &c)| {
            if let Some(digit) = c.to_digit(10) {
                let bit = 1 << digit as u16;
                let mask = !bit;
                let (i, j) = (idx / 9, idx % 9);
                let k = i - i % 3 + j / 3;
                rows[i] &= mask;
                cols[j] &= mask;
                boxes[k] &= mask;
                None
            } else {
                Some(idx)
            }
        }).collect::<Vec<_>>();
        let mut stack = vec![0u16; indexes.len()];
        let mut depth = 0;
        while depth < indexes.len() {
            let old = stack[depth];
            let (new, i, j, k) = if old > 0 {
                let idx = indexes[depth];
                let (i, j) = (idx / 9, idx % 9);
                let k = i - i % 3 + j / 3;
                let bit = old & old.wrapping_neg();
                rows[i] |= bit;
                cols[j] |= bit;
                boxes[k] |= bit;
                (old ^ bit, i, j, k)
            } else {
                let new_depth = indexes.iter().enumerate().skip(depth).min_by_key(|(_, idx)| {
                    let (i, j) = (*idx / 9, *idx % 9);
                    let k = i - i % 3 + j / 3;
                    let bits = rows[i] & cols[j] & boxes[k];
                    bits.count_ones()
                }).unwrap().0;
                indexes.swap(depth, new_depth);
                let idx = indexes[depth];
                let (i, j) = (idx / 9, idx % 9);
                let k = i - i % 3 + j / 3;
                (rows[i] & cols[j] & boxes[k], i, j, k)
            };
            stack[depth] = new;
            if new > 0 {
                let bit = new & new.wrapping_neg();
                let mask = !bit;
                rows[i] &= mask;
                cols[j] &= mask;
                boxes[k] &= mask;
                depth += 1;
            } else {
                depth -= 1;
            }
        }
        for (idx, bits) in indexes.into_iter().zip(stack) {
            let digit = bits.trailing_zeros();
            let (i, j) = (idx / 9, idx % 9);
            board[i][j] = std::char::from_digit(digit, 10).unwrap();
        }
    }
}