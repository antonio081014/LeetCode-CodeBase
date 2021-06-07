/**
 * https://leetcode.com/problems/min-cost-climbing-stairs/
 * 
 * 
 */ 
// Date: Mon Jun  7 08:30:45 PDT 2021
class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        let n = cost.count
        var dp = Array(repeating: 0, count: n + 1)
        for index in 2 ... n {
            dp[index] = dp[index - 1] + cost[index - 1]
            if index > 1 {
                dp[index] = min(dp[index], dp[index - 2] + cost[index - 2])
            }
        }
        return dp[n]
    }
}/**
 * https://leetcode.com/problems/min-cost-climbing-stairs/
 * 
 * 
 */ 
// Date: Mon Jun  7 08:38:40 PDT 2021
class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        let n = cost.count
        var c1 = 0
        var c2 = 0
        for index in 2 ... n {
            let tmp = c1
            c1 = min(c1 + cost[index - 1], c2 + cost[index - 2])
            c2 = tmp
        }
        return c1
    }
}