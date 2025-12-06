class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var combination = [Int]()
        let sortedCandidates = candidates.sorted()
        func backtrack(_ start: Int, _ remaining: Int) {
            if remaining == 0 {
                result.append(combination)
                return
            }
            for i in start..<sortedCandidates.count {
                if sortedCandidates[i] > remaining {
                    break
                }
                combination.append(sortedCandidates[i])
                backtrack(i, remaining - sortedCandidates[i])
                combination.removeLast()
            }
        }
        backtrack(0, target)
        return result
    }
}