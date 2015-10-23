/**
 * Problem Link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
 * 
 */
public class Solution {
    public int maxProfit(int[] prices) {
        if(prices == null || prices.length < 2){
            return 0;
        }
        int n = prices.length;
        int profit = 0;
        int[] buy = new int[n];
        for(int i=0; i<n; i++) {
            if(i==0) buy[i] = prices[i];
            else buy[i] = Math.min(prices[i], buy[i-1]);
        }
        
        for(int i=0; i<n; i++) {
            profit = Math.max(profit, prices[i] - buy[i]);
        }
        
        return profit;
    }
}
