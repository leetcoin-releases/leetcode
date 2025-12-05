class Solution:
    def solveSudoku(self, board: list[list[str]]) -> None:
        rows = [0] * 9
        cols = [0] * 9
        boxes = [0] * 9
        empties = []
        for r in range(9):
            for c in range(9):
                ch = board[r][c]
                if ch == '.':
                    empties.append((r, c))
                else:
                    bit = 1 << (ord(ch) - ord('1'))
                    rows[r] |= bit
                    cols[c] |= bit
                    boxes[(r // 3) * 3 + c // 3] |= bit
        def backtrack(idx=0):
            if idx == len(empties):
                return True
            best = idx
            min_options = 10
            for k in range(idx, len(empties)):
                r, c = empties[k]
                b = (r // 3) * 3 + c // 3
                mask = ~(rows[r] | cols[c] | boxes[b]) & 0x1FF
                options = mask.bit_count()
                if options < min_options:
                    min_options = options
                    best = k
                    if options == 1:
                        break
            if min_options == 0:
                return False
            empties[idx], empties[best] = empties[best], empties[idx]
            r, c = empties[idx]
            b = (r // 3) * 3 + c // 3
            mask = ~(rows[r] | cols[c] | boxes[b]) & 0x1FF
            while mask:
                bit = mask & -mask
                mask -= bit
                d = bit.bit_length()
                ch = str(d)
                board[r][c] = ch
                rows[r] |= bit
                cols[c] |= bit
                boxes[b] |= bit
                if backtrack(idx + 1):
                    return True
                board[r][c] = '.'
                rows[r] &= ~bit
                cols[c] &= ~bit
                boxes[b] &= ~bit
            return False
        backtrack()