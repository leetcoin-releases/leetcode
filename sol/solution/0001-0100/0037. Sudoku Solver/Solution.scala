import scala.collection.mutable.ArrayBuffer
object Solution {
    def solveSudoku(board: Array[Array[Char]]): Unit = {
        val rows = Array.fill(9)(0)
        val cols = Array.fill(9)(0)
        val boxes = Array.fill(9)(0)
        val empties = ArrayBuffer.empty[Int]
        var r = 0
        while (r < 9) {
            var c = 0
            while (c < 9) {
                val ch = board(r)(c)
                if (ch == '.') {
                    empties += (r * 9 + c)
                } else {
                    val d = ch - '1'
                        val bit = 1 << d
                    rows(r) |= bit
                    cols(c) |= bit
                    boxes((r / 3) * 3 + (c / 3)) |= bit
                }
                c += 1
            }
            r += 1
        }
        def dfs(): Boolean = {
            if (empties.isEmpty) return true
            var bestIdx = -1
            var bestMask = 0
            var bestCount = 10
            var i = 0
            while (i < empties.length) {
                val pos = empties(i)
                val rr = pos / 9
                val cc = pos % 9
                val bb = (rr / 3) * 3 + (cc / 3)
                val used = rows(rr) | cols(cc) | boxes(bb)
                val mask = (~used) & 0x1FF
                val cnt = java.lang.Integer.bitCount(mask)
                if (cnt == 0) return false
                if (cnt < bestCount) {
                    bestCount = cnt
                    bestMask = mask
                    bestIdx = i
                    if (cnt == 1) {}
                }
                i += 1
            }
            val last = empties.length - 1
            val chosen = empties(bestIdx)
            empties(bestIdx) = empties(last)
            empties.remove(last)
            val rr = chosen / 9
            val cc = chosen % 9
            val bb = (rr / 3) * 3 + (cc / 3)
            var mask = bestMask
            while (mask != 0) {
                val bit = mask & -mask
                val d = java.lang.Integer.numberOfTrailingZeros(bit)
                board(rr)(cc) = (d + '1').toChar
                rows(rr) |= bit
                cols(cc) |= bit
                boxes(bb) |= bit
                if (dfs()) return true
                rows(rr) &= ~bit
                cols(cc) &= ~bit
                boxes(bb) &= ~bit
                mask &= (mask - 1)
            }
            board(rr)(cc) = '.'
            empties += chosen
            false
        }
        dfs()
    }
}