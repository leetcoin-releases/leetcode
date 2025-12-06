class Solution {
  List<List<int>> combinationSum(List<int> candidates, int target) {
    List<List<int>> result = [];
    List<int> currentCombination = [];
    dfs(candidates, target, currentCombination, 0, result);
    return result;
  }
  void dfs(
    List<int> candidates,
    int target,
    List<int> currentCombination,
    int startIndex,
    List<List<int>> result,
  ) {
    if (target == 0) {
      result.add([...currentCombination]);
      return;
    }
    if (target < 0) {
      return;
    }
    for (int i = startIndex; i < candidates.length; i++) {
      currentCombination.add(candidates[i]);
      dfs(candidates, target - candidates[i], currentCombination, i, result);
      currentCombination.removeLast();
    }
  }
}