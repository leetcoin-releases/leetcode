/**
 * @param {number[]} candidates
 * @param {number} target
 * @return {number[][]}
 */
var combinationSum2 = function(candidates, target) {
	const result = [];
	candidates.sort((a, b) => a - b);
	const backtrack = (start, remaining, path) => {
		if (remaining === 0) {
			result.push([...path]);
			return;
		}
		for (let i = start; i < candidates.length; i++) {
			if (i > start && candidates[i] === candidates[i - 1]) continue;
			if (candidates[i] > remaining) break;
			
			path.push(candidates[i]);
			backtrack(i + 1, remaining - candidates[i], path);
			path.pop();
		}
	};
	backtrack(0, target, []);
	return result;
};