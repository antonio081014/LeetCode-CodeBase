/**
 * Problem link: https://leetcode.com/problems/spiral-matrix-ii/
 */

public class Solution {
    int[] dx = {0, 1, 0, -1};
    int[] dy = {1, 0, -1, 0};
    
    public int[][] generateMatrix(int n) {
        int[][] mat = new int[n][n];
        int dir = 0;
        for(int x=0,y=0,i=1; i<=n*n; i++) {
            mat[x][y] = i;
            int xx = x + dx[dir];
            int yy = y + dy[dir];
            if(xx < 0 || xx >= n || yy < 0 || yy >= n || mat[xx][yy] > 0) {
                dir = (dir + 1) % dx.length;
                xx = x + dx[dir];
                yy = y + dy[dir];
            }
            x = xx;
            y = yy;
        }
        return mat;
    }
}
