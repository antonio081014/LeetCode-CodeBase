/**
 * https://leetcode.com/problems/coin-change/
 * 
 * 
 */ 
// Date: Sun Jun  7 11:36:05 PDT 2020
class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        let coins = coins.sorted(by: >)
        var dp = Array(repeating: Int.max, count: amount + 1)
        dp[0] = 0
        for index in 0 ..< coins.count {
            if amount >= coins[index] {
                for total in coins[index] ... amount {
                    if dp[total - coins[index]] < Int.max {
                        dp[total] = min(dp[total], 1 + dp[total - coins[index]])
                    }
                }
            }
        }
        // print("\(dp)")
        return dp[amount] == Int.max ? -1 : dp[amount]
    }
}
