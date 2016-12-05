public class Solution {
    public int calculateMinimumHP(int[][] d) {
        int n = d.length;
        int m = d[0].length;
        int[][] mark = new int[n][m];
        mark[n-1][m-1] = Math.max(1, 1 - d[n-1][m-1]);
        for(int i=n-1; i>=0; i--) {
            for(int j=m-1; j>=0; j--) {
                int down = 0;
                int right = 0;
                if(i < n-1) {
                    down = Math.max(1, mark[i+1][j] - d[i][j]);
                }
                if(j < m-1) {
                    right = Math.max(1, mark[i][j+1] - d[i][j]);
                }
                if(down == 0 && right == 0) mark[i][j] = Math.max(1, 1 - d[i][j]);
                else {
                    if(down == 0) down = Integer.MAX_VALUE;
                    if(right == 0) right = Integer.MAX_VALUE;
                    mark[i][j] = Math.min(down, right);
                }
            }
        }
        return mark[0][0];
    }
}
