/**
 * https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/
 * 
 * 
 */ 
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 0 else {return 0}
        var profit = 0
        for i in 1..<prices.count {
            if prices[i] > prices[i-1] {
                profit += prices[i] - prices[i-1]
            }
        }
        return profit
    }
}
