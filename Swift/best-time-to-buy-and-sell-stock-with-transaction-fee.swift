/**
 * https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/
 * 
 * 
 */ 
// Date: Mon Jun  1 14:36:52 PDT 2020
class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        let n = prices.count
        guard n > 1 else { return 0 }
        var dp = Array(repeating: 0, count: n + 1)
        var minCost = Int.max
        for sell in 2 ... n {
            minCost = min(minCost, prices[sell - 2] + fee - dp[sell - 2])
            dp[sell] = max(dp[sell - 1], prices[sell - 1] - minCost)
        }
        // print("\(dp)")
        return dp[n]
    }
}
