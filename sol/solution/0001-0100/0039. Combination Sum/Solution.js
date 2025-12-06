/**
 * @param {number[]} candidates
 * @param {number} target
 * @return {number[][]}
 */
var combinationSum = function(candidates, target) {
    candidates.sort((a, b) => a - b);
    const result = [];
    const current = [];
    function backtrack(start, remaining) {
        if (remaining === 0) {
            result.push([...current]);
            return;
        }
        for (let i = start; i < candidates.length; i++) {
            const num = candidates[i];
            if (num > remaining) break; 
            current.push(num);
            backtrack(i, remaining - num);
            current.pop();
        }
    }
    backtrack(0, target);
    return result;
};