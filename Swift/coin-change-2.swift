/**
 * https://leetcode.com/problems/coin-change-2/
 * 
 * 
 */ 
// Date: Sun Jun  7 11:13:38 PDT 2020
class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        let coins = coins.sorted()
        var dp = Array(repeating: 0, count: amount + 1)
        dp[0] = 1
        for index in 0 ..< coins.count {
            if amount >= coins[index] {
                for total in coins[index] ... amount {
                    dp[total] += dp[total - coins[index]]
                }
            }
        }
        print("\(dp)")
        return dp[amount]
    }
}
