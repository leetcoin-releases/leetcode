function combinationSum(candidates: number[], target: number): number[][] {
	const result: number[][] = [];
	function backtrack(start: number, current: number[], remaining: number): void {
		if (remaining === 0) {
			result.push([...current]);
			return;
		}
		for (let i = start; i < candidates.length; i++) {
			if (candidates[i] <= remaining) {
				current.push(candidates[i]);
				backtrack(i, current, remaining - candidates[i]);
				current.pop();
			}
		}
	}
	backtrack(0, [], target);
	return result;
}