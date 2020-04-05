/**
 * https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/
 * 
 * 
 */ 
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var profit = 0
        if prices.isEmpty { return profit }
        for index in 1 ..< prices.count {
            profit += max(0, prices[index] - prices[index - 1])
        }
        return profit
    }
}
