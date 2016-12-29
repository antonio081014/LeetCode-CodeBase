/**
 * https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
 * 
 * 
 */ 
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 0 else {return 0}
        let n = prices.count
        var maxp = 0
        var profit = 0
        for i in 0..<n {
            maxp = max(maxp, prices[n-i-1])
            profit = max(profit, maxp - prices[n-i-1])
        }
        return profit
    }
}
