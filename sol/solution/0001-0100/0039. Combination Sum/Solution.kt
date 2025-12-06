class Solution {
    fun combinationSum(candidates: IntArray, target: Int): List<List<Int>> {
        candidates.sort()
        val result = mutableListOf<List<Int>>()
        val current = mutableListOf<Int>()
        fun backtrack(start: Int, remaining: Int) {
            if (remaining == 0) {
                result.add(ArrayList(current))
                return
            }
            for (i in start until candidates.size) {
                val num = candidates[i]
                if (num > remaining) break  // prune
                current.add(num)
                backtrack(i, remaining - num)  // reuse same candidate
                current.removeAt(current.size - 1)
            }
        }
        backtrack(0, target)
        return result
    }
}