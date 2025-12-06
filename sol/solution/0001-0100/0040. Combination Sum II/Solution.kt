class Solution {
    fun combinationSum2(candidates: IntArray, target: Int): List<List<Int>> {
        val result = mutableListOf<List<Int>>()
        candidates.sort()
        backtrack(candidates, target, 0, mutableListOf(), result)
        return result
    }
    private fun backtrack(
        candidates: IntArray,
        target: Int,
        start: Int,
        current: MutableList<Int>,
        result: MutableList<List<Int>>
    ) {
        if (target == 0) {
            result.add(ArrayList(current))
            return
        }
        for (i in start until candidates.size) {
            if (i > start && candidates[i] == candidates[i - 1]) continue
            if (candidates[i] > target) break
            current.add(candidates[i])
            backtrack(candidates, target - candidates[i], i + 1, current, result)
            current.removeAt(current.size - 1)
        }
    }
}