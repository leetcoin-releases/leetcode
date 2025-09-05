def solve_sudoku(board)
    rows = Array.new(9, 0)
    cols = Array.new(9, 0)
    boxes = Array.new(9, 0)
    empties = []
    9.times do |r|
        9.times do |c|
            ch = board[r][c]
            if ch == '.'
                empties << [r, c]
            else
                bit = 1 << (ch.ord - '1'.ord)
                rows[r] |= bit
                cols[c] |= bit
                boxes[(r/3)*3 + c/3] |= bit
            end
        end
    end
    backtrack = lambda do
        target_idx = -1
        candidates_mask = 0
        min_count = 10
        empties.each_with_index do |(r, c), idx|
            next unless board[r][c] == '.'
            used = rows[r] | cols[c] | boxes[(r/3)*3 + c/3]
            mask = (~used) & 0x1FF
            return false if mask == 0
            count = 0
            m = mask
            while m > 0
                m &= m - 1
                count += 1
            end
            if count < min_count
                min_count = count
                target_idx = idx
                candidates_mask = mask
                break if count == 1
            end
        end
        return true if target_idx == -1
        r, c = empties[target_idx]
        box_idx = (r/3)*3 + c/3
        mask = candidates_mask
        1.upto(9) do |d|
            bit = 1 << (d - 1)
            next if (mask & bit) == 0
            board[r][c] = d.to_s
            rows[r] |= bit
            cols[c] |= bit
            boxes[box_idx] |= bit
            return true if backtrack.call
            board[r][c] = '.'
            rows[r] ^= bit
            cols[c] ^= bit
            boxes[box_idx] ^= bit
        end
        false
    end
    backtrack.call
end