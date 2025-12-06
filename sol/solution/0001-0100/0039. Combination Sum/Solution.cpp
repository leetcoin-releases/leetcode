class Solution
{
public:
    vector<vector<int>> res;
    vector<int> comb;
    void dfs(int rootindex, vector<int> &candidates, int target, int sum)
    {
        if (sum == target)
        {
            res.push_back(comb);
            return;
        }
        for (int i = rootindex; i < candidates.size(); i++)
        {
            if (candidates[i] + sum > target)
            {
                continue;
            }
            comb.push_back(candidates[i]);
            sum += candidates[i];
            dfs(i, candidates, target, sum);
            comb.pop_back();
            sum -= candidates[i];
        }
    }
    vector<vector<int>> combinationSum(vector<int> &candidates, int target)
    {
        dfs(0, candidates, target, 0);
        return res;
    }
};