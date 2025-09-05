object Solution {
  def isValidSudoku(board: Array[Array[Char]]): Boolean = {
    val rows = Array.fill(9)(0)
    val cols = Array.fill(9)(0)
    val boxes = Array.fill(9)(0)
    var i = 0
    while (i < 9) {
      var j = 0
      while (j < 9) {
        val c = board(i)(j)
        if (c != '.') {
          val v = c - '1'
            val mask = 1 << v
          val b = (i / 3) * 3 + (j / 3)
          if ((rows(i) & mask) != 0) return false
          if ((cols(j) & mask) != 0) return false
          if ((boxes(b) & mask) != 0) return false
          rows(i) |= mask
          cols(j) |= mask
          boxes(b) |= mask
        }
        j += 1
      }
      i += 1
    }
    true
  }
}