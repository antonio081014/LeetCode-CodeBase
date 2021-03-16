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
/**
 * https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/
 * 
 * 
 */ 
// Date: Tue Mar 16 13:36:37 PDT 2021
class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        guard prices.count > 1 else { return 0 }
        var hold = Array(repeating: 0, count: prices.count)
        var notHold = Array(repeating: 0, count: prices.count)
        hold[0] = -prices[0]
        notHold[0] = 0
        for index in 1 ..< prices.count {
            notHold[index] = max(notHold[index - 1], hold[index - 1] + prices[index] - fee)
            hold[index] = max(hold[index - 1], notHold[index - 1] - prices[index])
        }
        return notHold[prices.count - 1]
    }
}