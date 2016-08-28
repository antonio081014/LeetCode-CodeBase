/**
 * Problem: https://leetcode.com/problems/number-of-islands/
 * Easy Flood-Fill Problem.
 **/
public class Solution {
    public int numIslands(char[][] grid) {
        int sum = 0;
        for(int i=0; i<grid.length; i++) {
            for(int j=0; j<grid[i].length; j++) {
                if(grid[i][j] == '1') {
                    sum ++;
                    fill(i, j, grid);
                }
            }
        }
        return sum;
    }
    
    private int[] dx = {0, 1, 0, -1};
    private int[] dy = {1, 0, -1, 0};
    
    private void fill(int x, int y, char[][] grid) {
        grid[x][y] = '0';
        
        for(int i=0; i<dx.length; i++) {
            int xx = x + dx[i];
            int yy = y + dy[i];
            if(xx >=0 && xx < grid.length 
            && yy >=0 && yy<grid[xx].length 
            && grid[xx][yy] == '1'){
                fill(xx, yy, grid);
            }
        }
    }
}
