public class Solution {
    public void solveSudoku(char[][] board) {
        if(board == null || board.length != 9 || board[0].length != 9) return;  
        backtrack(board, 0, 0);
    }
    
    private boolean backtrack(char[][] board, int x, int y) {
        if(x == 9) return true;
        if(y == 9) return backtrack(board, x + 1, 0);
        
        if(board[x][y] == '.') {
            for(char c = '1'; c<='9'; c++) {
                board[x][y] = c;
                if(isValid(board, x, y) && backtrack(board, x, y + 1)) return true;
                board[x][y] = '.';
            }
            return false;
        }
        else {
            return backtrack(board, x, y+1);
        }
    }
    
    private boolean isValid(char[][] board, int i, int j) {  
        for(int k=0;k<9;k++)  
        {  
            if(k!=j && board[i][k]==board[i][j])  
                return false;  
        }  
        for(int k=0;k<9;k++)  
        {  
            if(k!=i && board[k][j]==board[i][j])  
                return false;  
        }          
        for(int row = i/3*3; row<i/3*3+3; row++)  
        {  
            for(int col=j/3*3; col<j/3*3+3; col++)  
            {  
                if((row!=i || col!=j) && board[row][col]==board[i][j])  
                    return false;  
            }  
        }  
        return true;  
    }  
}
