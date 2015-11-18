/**
 * Problem Link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iv/
 * 
 * Solution: 
 *      http://blog.csdn.net/linhuanmars/article/details/23236995
 *      http://www.cnblogs.com/grandyang/p/4295761.html
 */

public class Solution {
    public int maxProfit(int k, int[] prices) {
        int n = prices.length;
        if(n < 2 || k <= 0) return 0;
        
    	if (k >= n)
    		return solveMaxProfit(prices);
 
        int[][] local = new int[n][k+1];
        int[][] global = new int[n][k+1];
        
        for(int i=1; i<n; i++) {
            int diff = prices[i] - prices[i-1];
            for(int j=1; j<=k; j++) {
                local[i][j] = Math.max(global[i-1][j-1] + Math.max(0, diff), local[i-1][j] + diff);
                global[i][j] = Math.max(local[i][j], global[i-1][j]);
            }
        }
        return global[n-1][k];
    }
    
    private int solveMaxProfit(int[] prices) {
        int res = 0;
        for (int i = 1; i < prices.length; ++i) {
            if (prices[i] - prices[i - 1] > 0) {
                res += prices[i] - prices[i - 1];
            }
        }
        return res;
    }
}
