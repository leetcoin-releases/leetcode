public class Solution
{
    public IList<IList<int>> CombinationSum2(int[] candidates, int target)
    {
        Array.Sort(candidates);
        IList<IList<int>> result = new List<IList<int>>();
        IList<int> combination = new List<int>();
        Backtrack(candidates, target, 0, combination, result);
        return result;
    }
    private void Backtrack(int[] candidates, int target, int start, IList<int> combination, IList<IList<int>> result)
    {
        if (target == 0)
        {
            result.Add(new List<int>(combination));
            return;
        }
        for (int i = start; i < candidates.Length; i++)
        {
            if (i > start && candidates[i] == candidates[i - 1])
            {
                continue;
            }
            if (candidates[i] > target)
            {
                break;
            }
            combination.Add(candidates[i]);
            Backtrack(candidates, target - candidates[i], i + 1, combination, result);
            combination.RemoveAt(combination.Count - 1);
        }
    }
}