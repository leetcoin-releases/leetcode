# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum2(candidates, target)
	result = []
	candidates.sort!
	backtrack(candidates, target, 0, [], result)
	result
end
def backtrack(candidates, target, start, current, result)
	if target == 0
		result << current.dup
		return
	end
	(start...candidates.length).each do |i|
		break if candidates[i] > target
		next if i > start && candidates[i] == candidates[i - 1]
		current << candidates[i]
		backtrack(candidates, target - candidates[i], i + 1, current, result)
		current.pop
	end
end