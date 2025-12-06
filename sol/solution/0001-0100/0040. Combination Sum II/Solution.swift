class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var current = [Int]()
        let sortedCandidates = candidates.sorted()
        func backtrack(_ start: Int, _ remaining: Int) {
            if remaining == 0 {
                result.append(current)
                return
            }
            for i in start..<sortedCandidates.count {
                if i > start && sortedCandidates[i] == sortedCandidates[i - 1] {
                    continue
                }
                if sortedCandidates[i] > remaining {
                    break
                }
                current.append(sortedCandidates[i])
                backtrack(i + 1, remaining - sortedCandidates[i])
                current.removeLast()
            }
        }
        backtrack(0, target)
        return result
    }
}