/**
 * https://leetcode.com/problems/longest-common-subsequence/
 * 
 * 
 */ 
// Date: Sun Apr 26 09:36:42 PDT 2020
class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var cost = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)
        let text1 = Array(text1)
        let text2 = Array(text2)
        
        for i in 0 ..< text1.count {
            for j in 0 ..< text2.count {
                cost[i + 1][j + 1] = max(cost[i + 1][j + 1], cost[i][j])
                cost[i + 1][j + 1] = max(cost[i + 1][j + 1], cost[i + 1][j])
                cost[i + 1][j + 1] = max(cost[i + 1][j + 1], cost[i][j + 1])
                if text1[i] == text2[j] {
                    cost[i + 1][j + 1] = max(1 + cost[i][j], cost[i + 1][j + 1])
                }
            }
        }
        // print("\(cost)")
        return cost[text1.count][text2.count]
    }
}
