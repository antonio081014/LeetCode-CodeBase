import java.util.*;

public class Solution {
    public List<String> findWords(char[][] board, String[] words) {
        Set<String> list = new HashSet<String>();
        for(int i=0; i<words.length; i++) {
            boolean flag = true;
            for(int x = 0; x < board.length && flag; x++){
                for(int y = 0; y<board[0].length && flag; y++){
                    boolean [][] visited = new boolean[board.length][board[0].length];
                    visited[x][y] = true;
                    if(finding(x, y, visited, 0, board, words[i])) {
                        flag = false;
                    }
                }
            }
            if(!flag) list.add(words[i]);
        }
        return new ArrayList<String>(list);
    }
    
    private final int[] dx = {0, 1, 0 , -1};
    private final int[] dy = {1, 0, -1 , 0};
    
    private boolean finding(int x, int y, boolean[][] visited, int k, char[][] board, String word) {
        if(k == word.length()) return true;
        if(word.charAt(k) == board[x][y]) {
            for(int i=0; i<dx.length; i++) {
                int xx = x + dx[i];
                int yy = y + dy[i];
                if(inBoundary(xx, yy, board.length, board[0].length) && !visited[xx][yy]) {
                    visited[xx][yy] = true;
                    if(finding(xx, yy, visited, k+1, board, word)) return true;
                    visited[xx][yy] = false;
                }
            }
        }
        return false;
    }
    
    private boolean inBoundary(int x, int y, int width, int height) {
        return x>=0 && x<width && y>=0 && y<height;
        
    }
    
    public static void main(String[] args) {
        Solution a = new Solution();
        char[][] board = {
            {'o','a','a','n'},
            {'e','t','a','e'},
            {'i','h','k','r'},
            {'i','f','l','v'}
        };
        String[] dict = {"oath","pea","eat","rain"};
        System.out.println(a.findWords(board, dict));
    }
}
