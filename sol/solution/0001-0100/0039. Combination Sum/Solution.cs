public class Solution
{
    public IList<IList<int>> CombinationSum(int[] candidates, int target)
    {
        var res = new List<IList<int>>();
        Combination(candidates, 0, target, res, new List<int>());
        return res;
    }
    private void Combination(int[] arr, int ind, int target, List<IList<int>> res, List<int> list)
    {
        if (target == 0)
        {
            res.Add(new List<int>(list));
            return;
        }
        if (ind == arr.Length || target < 0)
        {
            return;
        }
        if (arr[ind] <= target)
        {
            list.Add(arr[ind]);
            Combination(arr, ind, target - arr[ind], res, list);
            list.RemoveAt(list.Count - 1);
        }
        Combination(arr, ind + 1, target, res, list);
    }
}