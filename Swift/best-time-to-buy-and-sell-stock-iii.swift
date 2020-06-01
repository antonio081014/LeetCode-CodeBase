/**
 * https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iii/
 * 
 * 
 */ 
// Date: Mon Jun  1 11:57:15 PDT 2020
class Solution {
    /// dp[k, i] = max(dp[k, i-1], prices[i] - prices[j] + dp[k-1, j-1]), j=[0..i-1]
    /// - Complexity:
    ///     - Time: O(k*n*n), k is the number of trasactions, and n is the number of elements in prices array.
    ///     - Space: O(k*n)
    ///
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        let k = 2
        guard n > 1 else { return 0 }
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: k + 1)
        for kk in 1 ... k {
            for sell in 2 ... n {
                dp[kk][sell] = dp[kk][sell - 1]
                for buy in 1 ..< sell {
                    dp[kk][sell] = max(dp[kk][sell], prices[sell - 1] - prices[buy - 1] + dp[kk - 1][buy - 1])
                }
            }
        }
        // print("\(dp)")
        return max(dp[k][n], dp[k - 1][n])
    }
}

class Solution {
    /// dp[k, i] = max(dp[k, i-1], prices[i] - prices[j] + dp[k-1, j-1]), j=[0..i-1]
    ///
    /// tmpMin has been repeatedly calculated.
    /// - Complexity:
    ///     - Time: O(k*n), k is the number of trasactions, and n is the number of elements in prices array.
    ///     - Space: O(k*n)
    ///
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        let k = 2
        guard n > 1 else { return 0 }
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: k + 1)
        for kk in 1 ... k {
            var tmpMin = prices[0] - dp[kk - 1][0]
            for sell in 2 ... n {
                tmpMin = min(tmpMin, prices[sell - 1] - dp[kk - 1][sell - 1])
                dp[kk][sell] = max(dp[kk][sell - 1], prices[sell - 1] - tmpMin)
            }
        }
        // print("\(dp)")
        return max(dp[k][n], dp[k - 1][n])
    }
}
