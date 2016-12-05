/**
 * Problem Link: https://leetcode.com/problems/unique-paths-ii/
 */
public class Solution {
    public int uniquePathsWithObstacles(int[][] grid) {
        int n = grid.length;
        int m = grid[0].length;
        int[][] cost = new int[n][m];
        cost[0][0] = grid[0][0] == 0 ? 1 : 0;
        for(int i=0; i<n; i++) {
            for(int j=0; j<m; j++) {
                if(grid[i][j] == 0) {
                    if(i > 0) cost[i][j] += cost[i-1][j];
                    if(j > 0) cost[i][j] += cost[i][j-1];
                }
                else {
                    cost[i][j] = 0;
                }
            }
        }
        return cost[n-1][m-1];
    }
}
