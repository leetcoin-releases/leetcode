class Solution {
  void backtrack(List<int> candidates, int target, int start, List<int> combination, List<List<int>> result) {
    if (target == 0) {
      result.add(List<int>.from(combination));
      return;
    }
    for (int i = start; i < candidates.length; i++) {
      if (i > start && candidates[i] == candidates[i - 1]) continue;
      if (candidates[i] > target) break;
      combination.add(candidates[i]);
      backtrack(candidates, target - candidates[i], i + 1, combination, result);
      combination.removeLast();
    }
  }
  List<List<int>> combinationSum2(List<int> candidates, int target) {
    candidates.sort();
    List<List<int>> result = [];
    List<int> combination = [];
    backtrack(candidates, target, 0, combination, result);
    return result;
  }
}