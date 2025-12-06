object Solution {
    def combinationSum(candidates: Array[Int], target: Int): List[List[Int]] = {
        def backtrack(remain: Int, start: Int, current: List[Int]): List[List[Int]] = {
            if (remain == 0) List(current)
            else if (remain < 0) Nil
            else {
                (start until candidates.length).flatMap { i =>
                    backtrack(remain - candidates(i), i, current :+ candidates(i))
                }.toList
            }
        }
        backtrack(target, 0, Nil)
    }
}