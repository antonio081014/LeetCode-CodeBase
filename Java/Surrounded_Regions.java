/**
 * Problem Link: https://leetcode.com/problems/surrounded-regions/
 * 
 * DFS will cause stackoverflow, for large tables, dfs will be called under too many levels.
 * 
 */
public class Solution {
    private boolean[][] mark;
    private int n;
    private int m;
    private int[] dx = {0, 1, 0, -1};
    private int[] dy = {1, 0, -1, 0};

    public void solve(char[][] board) {
        n = board.length;
        if(n == 0) return;
        m = board[0].length;
        mark = new boolean[n][m];
        
        for(int i=0; i<n; i++) {
            if(board[i][0] == 'O') bfs(board, i, 0);
            if(board[i][m-1] == 'O') bfs(board, i, m-1);
        }
        for(int i=0; i<m; i++) {
            if(board[0][i] == 'O') bfs(board, 0, i);
            if(board[n-1][i] == 'O') bfs(board, n-1, i);
        }
        
        for(int i=1; i<n-1; i++) {
            for(int j=1; j<m-1; j++) {
                if(board[i][j] == 'O' && !mark[i][j]) {
                    board[i][j] = 'X';
                }
            }
        }
    }
    
    private void bfs(char[][] board, int x, int y) {
        if(mark[x][y]) return;
        mark[x][y] = true;
        Queue<Integer> q = new LinkedList<Integer>();
        q.offer(x * m + y);
        while(!q.isEmpty()) {
            int sum = q.poll();
            x = sum / m;
            y = sum % m;
            for(int i=0; i<dx.length; i++) {
                int xx = x + dx[i];
                int yy = y + dy[i];
                if(xx >=0 && xx < n && yy >=0 && yy < m && board[xx][yy] == 'O' && !mark[xx][yy]) {
                    mark[xx][yy] = true;
                    q.offer(xx * m + yy);
                }
            }
        }
    }
    
    private void dfs(char[][] board, int x, int y) {
        if(mark[x][y]) return;
        mark[x][y] = true;
        for(int i=0; i<dx.length; i++) {
            int xx = x + dx[i];
            int yy = y + dy[i];
            if(xx >=0 && xx < n && yy >=0 && yy < m && board[xx][yy] == 'O' && !mark[xx][yy]) {
                dfs(board, xx, yy);
            } 
        }
    }
}
