class Solution:
    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
        candidates.sort()
        result = []
        current = []
        def backtrack(start: int, remaining: int):
            if remaining == 0:
                result.append(list(current))
                return
            for i in range(start, len(candidates)):
                num = candidates[i]
                if num > remaining:
                    break
                current.append(num)
                backtrack(i, remaining - num)
                current.pop()
        backtrack(0, target)
        return result