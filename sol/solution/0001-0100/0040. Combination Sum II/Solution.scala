object Solution {
  def combinationSum2(candidates: Array[Int], target: Int): List[List[Int]] = {
    val candidatesS = candidates.sorted
    def dfs(pos: Int, remainingTarget: Int, path: List[Int], res: List[List[Int]]): List[List[Int]] = {
      if (remainingTarget == 0) {
        path :: res
      } else if (pos > candidatesS.length - 1 || candidatesS(pos) > remainingTarget) {
        res
      } else {
        (pos until candidatesS.length).foldLeft(res) { (acc, p) =>
          if (p > pos && candidatesS(p) == candidatesS(p - 1)) {
            acc
          } else {
            dfs(p + 1, remainingTarget - candidatesS(p), candidatesS(p) :: path, acc)
          }
        }
      }
    }
    dfs(0, target, List.empty, List.empty)
  }
}