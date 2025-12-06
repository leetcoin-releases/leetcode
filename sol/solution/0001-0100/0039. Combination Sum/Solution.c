/**
 * Return an array of arrays of size *returnSize.
 * The sizes of the arrays are returned as *returnColumnSizes array.
 * Note: Both returned array and *columnSizes array must be malloced, assume caller calls free().
 */
void backtrack(int *candidates, int candidatesSize, int target, int start, int **res, int *returnSize, int *colSizes, int *path, int pathSize)
{
    if (target == 0)
    {
        res[*returnSize] = malloc(pathSize * sizeof(int));
        colSizes[*returnSize] = pathSize;
        for (int i = 0; i < pathSize; i++)
            res[*returnSize][i] = path[i];
        (*returnSize)++;
        return;
    }
    for (int i = start; i < candidatesSize; i++)
    {
        if (candidates[i] > target)
        {
            continue;
        }
        path[pathSize] = candidates[i];
        backtrack(candidates, candidatesSize, target - candidates[i], i, res, returnSize, colSizes, path, pathSize + 1);
    }
}
int **combinationSum(int *candidates, int candidatesSize, int target, int *returnSize, int **returnColumnSizes)
{

    int **res = malloc(200 * sizeof(int *));
    int *colSizes = malloc(200 * sizeof(int));
    int *path = malloc(200 * sizeof(int));
    *returnSize = 0;
    backtrack(candidates, candidatesSize, target, 0, res, returnSize, colSizes, path, 0);
    *returnColumnSizes = colSizes;
    return res;
}