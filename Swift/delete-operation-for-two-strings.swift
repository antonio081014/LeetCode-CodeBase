/**
 * https://leetcode.com/problems/delete-operation-for-two-strings/
 * 
 * 
 */ 
// Date: Fri May  7 11:20:57 PDT 2021
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let word1 = Array(word1)
        let word2 = Array(word2)
        let n = word1.count
        let m = word2.count
        var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
        
        for x in 0 ... n {
            for y in 0 ... m {
                if x == 0 || y == 0 {
                    continue
                }
                dp[x][y] = max(dp[x][y], max(dp[x - 1][y], dp[x][y - 1]))
                if word1[x - 1] == word2[y - 1] {
                    dp[x][y] = max(dp[x][y], 1 + dp[x - 1][y - 1])
                }
            }
        }
        return n + m - dp[n][m] * 2
    }
}