/**
 * Return an array of arrays of size *returnSize.
 * The sizes of the arrays are returned as *returnColumnSizes array.
 * Note: Both returned array and *columnSizes array must be malloced, assume caller calls free().
 */
int compare(const void *a, const void *b);
void backtrack(int *candidates, int candidatesSize, int target, int start, int *combination, int combinationSize, int ***result, int *returnSize, int **returnColumnSizes)
{
    if (target == 0)
    {
        (*result)[*returnSize] = (int *)malloc(combinationSize * sizeof(int));
        for (int i = 0; i < combinationSize; i++)
        {
            (*result)[*returnSize][i] = combination[i];
        }
        (*returnColumnSizes)[*returnSize] = combinationSize;
        (*returnSize)++;
        return;
    }
    for (int i = start; i < candidatesSize; i++)
    {
        if (i > start && candidates[i] == candidates[i - 1])
        {
            continue;
        }
        if (candidates[i] > target)
        {
            break;
        }
        combination[combinationSize] = candidates[i];
        backtrack(candidates, candidatesSize, target - candidates[i], i + 1, combination, combinationSize + 1, result, returnSize, returnColumnSizes);
    }
}
int **combinationSum2(int *candidates, int candidatesSize, int target, int *returnSize, int **returnColumnSizes)
{
    qsort(candidates, candidatesSize, sizeof(int), compare);
    int **result = (int **)malloc(1000 * sizeof(int *));
    *returnColumnSizes = (int *)malloc(1000 * sizeof(int));
    *returnSize = 0;
    int *combination = (int *)malloc(candidatesSize * sizeof(int));
    backtrack(candidates, candidatesSize, target, 0, combination, 0, &result, returnSize, returnColumnSizes);
    free(combination);
    return result;
}
int compare(const void *a, const void *b)
{
    return (*(int *)a - *(int *)b);
}