func combinationSum(candidates []int, target int) [][]int {
    sort.Ints(candidates)
    var result [][]int
    var current []int
    var backtrack func(start, target int)
    backtrack = func(start, target int) {
        if target == 0 {
            comb := make([]int, len(current))
            copy(comb, current)
            result = append(result, comb)
            return
        }
        for i := start; i < len(candidates); i++ {
            c := candidates[i]
            if c > target {
                break
            }
            current = append(current, c)
            backtrack(i, target-c) 
            current = current[:len(current)-1]
        }
    }
    backtrack(0, target)
    return result
}