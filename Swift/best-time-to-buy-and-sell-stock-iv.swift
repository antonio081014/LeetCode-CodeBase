/**
 * https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iv/
 * 
 * 
 */ 
// Date: Mon Jun  1 14:33:28 PDT 2020
class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        let n = prices.count
        guard n > 1, k > 0 else { return 0 }
        if k >= (n / 2) {
            var profit = 0
            for index in 1 ..< n {
                profit += max(0, prices[index] - prices[index - 1])
            }
            return profit
        }
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: k + 1)
        for kk in 1 ... k {
            var tmpMin = prices[0] - dp[kk - 1][0]
            for sell in 2 ... n {
                tmpMin = min(tmpMin, prices[sell - 1] - dp[kk - 1][sell - 1])
                dp[kk][sell] = max(dp[kk][sell - 1], prices[sell - 1] - tmpMin)
            }
        }
        // print("\(dp)")
        return dp[k][n]
    }
}
