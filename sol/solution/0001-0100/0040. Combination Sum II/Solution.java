import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
class Solution {
    private void combinations2(int index, int[] arr, int target, List<Integer> subset, List<List<Integer>> res) {
        if (target == 0) {
            res.add(List.copyOf(subset));
            return;
        }
        for (int i = index; i < arr.length; i++) {
            if (i > index && arr[i] == arr[i - 1]) {
                continue;
            }
            if (arr[i] > target) {
                break;
            }
            subset.add(arr[i]);
            combinations2(i + 1, arr, target - arr[i], subset, res);
            subset.removeLast();
        }
    }
    private void getResults(int[] arr, int sum, List<List<Integer>> result) {
        java.util.Arrays.sort(arr);
        combinations2(0, arr, sum, new ArrayList<>(), result);
    }
    public List<List<Integer>> combinationSum2(int[] candidates, int target) {
        return new AbstractList<List<Integer>>() {
            List<List<Integer>> res;
            private void init() {
                res = new java.util.ArrayList<>();
                getResults(candidates, target, res);
            }
            @Override
            public List<Integer> get(int index) {
                return res.get(index);
            }
            @Override
            public int size() {
                if (res == null) {
                    init();
                }
                return res.size();
            }
        };
    }
}