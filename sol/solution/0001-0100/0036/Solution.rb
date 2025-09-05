# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
  rows = Array.new(9, 0)
  cols = Array.new(9, 0)
  boxes = Array.new(9, 0)
  (0...9).each do |i|
    (0...9).each do |j|
      c = board[i][j]
      next if c == '.'
      v = c.ord - '1'.ord
      mask = 1 << v
      b = (i / 3) * 3 + (j / 3)
      return false if (rows[i] & mask) != 0
      return false if (cols[j] & mask) != 0
      return false if (boxes[b] & mask) != 0
      rows[i] |= mask
      cols[j] |= mask
      boxes[b] |= mask
    end
  end
  true
end