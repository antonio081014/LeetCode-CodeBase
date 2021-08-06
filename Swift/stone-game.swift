/**
 * https://leetcode.com/problems/stone-game/
 * 
 * 
 */ 
// Date: Thu Aug  5 23:53:43 PDT 2021
class Solution {
    func stoneGame(_ piles: [Int]) -> Bool {
        let n = piles.count
        var dp = Array(repeating: Array(repeating: 0, count: n + 2), count: n + 2)
        for size in 1 ... n {
            var start = 0
            var end = size - 1
            while end < n {
                let parity = (start + end + n) % 2
                if parity == 1 {
                    dp[start + 1][end + 1] = max(piles[start] + dp[start + 2][end + 1], piles[end] + dp[start + 1][end])
                } else {
                    dp[start + 1][end + 1] = min(-piles[start] + dp[start + 2][end + 1], -piles[end] + dp[start + 1][end])
                }
                start += 1
                end += 1
            }
        }
        return dp[1][n] > 0
    }
}