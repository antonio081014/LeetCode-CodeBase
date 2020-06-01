/**
 * https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/
 * 
 * 
 */ 
// Date: Mon Jun  1 14:07:11 PDT 2020
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        guard n > 1 else { return 0 }
        var dp = Array(repeating: 0, count: n + 1)
        for sell in 2 ... n {
            dp[sell] = dp[sell - 1]
            for buy in 1 ..< sell {
                dp[sell] = max(dp[sell], prices[sell - 1] - prices[buy - 1] + (buy >= 2 ? dp[buy - 2] : 0))
            }
        }
        //print("\(dp)")
        return dp[n]
    }
}
/**
 * https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/
 * 
 * 
 */ 
// Date: Mon Jun  1 14:26:11 PDT 2020
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        guard n > 1 else { return 0 }
        var dp = Array(repeating: 0, count: n + 1)
        var minCost = Int.max
        for sell in 2 ... n {
            minCost = min(minCost, prices[sell - 2] - (sell > 2 ? dp[sell - 3] : 0))
            dp[sell] = max(dp[sell - 1], prices[sell - 1] - minCost)
        }
        // print("\(dp)")
        return dp[n]
    }
}
