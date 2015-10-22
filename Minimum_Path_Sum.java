/**
 * Problem Link: https://leetcode.com/problems/minimum-path-sum/
 * 
 * Dynamic Programming.
 */
public class Solution {
    public int minPathSum(int[][] grid) {
        int m = grid.length;
        int n = grid[0].length;
        int[][] cost = new int[m][n];
        for(int i=0; i<m; i++) {
            for(int j=0; j<n; j++) {
                int c = Integer.MAX_VALUE;
                if(i > 0) c = Math.min(c, cost[i-1][j]);
                if(j > 0) c = Math.min(c, cost[i][j-1]);
                if(c == Integer.MAX_VALUE) c = 0;
                cost[i][j] = grid[i][j] + c;
            }
        }
        return cost[m-1][n-1];
    }
}
