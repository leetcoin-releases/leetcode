impl Solution {
    pub fn combination_sum(candidates: Vec<i32>, target: i32) -> Vec<Vec<i32>> {
        let mut candidates = candidates;
        candidates.sort_unstable();
        let mut result = Vec::new();
        let mut current = Vec::new();
        fn backtrack(
            candidates: &Vec<i32>,
            start: usize,
            remaining: i32,
            current: &mut Vec<i32>,
            result: &mut Vec<Vec<i32>>,
        ) {
            if remaining == 0 {
                result.push(current.clone());
                return;
            }
            for i in start..candidates.len() {
                let num = candidates[i];
                if num > remaining {
                    break;
                }
                current.push(num);
                backtrack(candidates, i, remaining - num, current, result);
                current.pop();
            }
        }
        backtrack(&candidates, 0, target, &mut current, &mut result);
        result
    }
}