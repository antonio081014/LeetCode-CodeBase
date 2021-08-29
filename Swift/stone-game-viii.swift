/**
 * https://leetcode.com/problems/stone-game-viii/
 * 
 * 
 */ 
// Date: Sun Aug 29 16:30:41 PDT 2021
class Solution {
    func stoneGameVIII(_ stones: [Int]) -> Int {
        let n = stones.count
        var sums = Array(repeating: 0, count: n)
        for index in 0 ..< n {
            sums[index] = stones[index] + (index > 0 ? sums[index - 1] : 0)
        }

        // print(sums)
        var result = sums[n - 1]
        for index in stride(from: n - 1, to: 1, by: -1) {
            result = max(result, sums[index - 1] - result)
        }
        return result
    }
}