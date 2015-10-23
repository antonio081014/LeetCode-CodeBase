/**
 * Problem Link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/
 * 
 */
public class Solution {
    public int maxProfit(int[] prices) {
        int profit = 0;
        int buy = Integer.MAX_VALUE;
        int n = prices.length;
        for(int i=0; i<n - 1; i++) {
            if(prices[i] <= prices[i+1]) {
                buy = Math.min(prices[i], buy);
            } else if(prices[i] > prices[i+1] && buy != Integer.MAX_VALUE) {
                profit += prices[i] - buy;
                buy = Integer.MAX_VALUE;
            }
        }
        if(buy != Integer.MAX_VALUE && prices[n-1] >= prices[n-2]) {
            profit += prices[n-1] - buy;
        }
        return profit;
    }
}
