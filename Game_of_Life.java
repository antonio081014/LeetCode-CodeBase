public class Solution {
    private int[] dx = {0, 1, 0, -1, 1, -1, -1, 1};
    private int[] dy = {1, 0, -1, 0, 1, 1, -1, -1};
    public void gameOfLife(int[][] board) {
        for(int i=0; i<board.length; i++) {
            for(int j=0; j<board[i].length; j++) {
                int count = 0;
                for(int k=0; k<dx.length; k++) {
                    int xx = i + dx[k];
                    int yy = j + dy[k];
                    count += status(board, xx, yy);
                }
                if(count == 3) board[i][j] |= 2;
                else if (count >=2 && count <= 3 && status(board, i, j) > 0) {
                    board[i][j] |= 2;
                }
            }
        }
        for(int i=0; i<board.length; i++) {
            for(int j=0; j<board[i].length; j++) {
                board[i][j] = board[i][j] >> 1;
            }
        }
    }
    
    private int status(int[][] board, int x, int y) {
        if(x >=0 && x < board.length && y >=0 && y<board[0].length) return 1 & board[x][y];
        return 0;
    }
}
