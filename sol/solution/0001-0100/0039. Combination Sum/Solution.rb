# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum(candidates, target)
  candidates.sort!
  result = []
  current = []
  backtrack = lambda do |start, remaining|
    if remaining == 0
      result << current.dup
      return
    end
    (start...candidates.size).each do |i|
      num = candidates[i]
      break if num > remaining
      current << num
      backtrack.call(i, remaining - num)
      current.pop
    end
  end
  backtrack.call(0, target)
  result
end