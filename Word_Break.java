import java.util.*;

public class Solution {
    public boolean wordBreak(String s, Set<String> wordDict) {
        int n = s.length();
        mark = new int[n][n];
        for(int i=0; i<n; i++) for(int j=0; j<n; j++) mark[i][j] = -1;
        dfs(s, wordDict, 0, n-1);
        return mark[0][n-1] == 1;
    }
    
    private int[][] mark;
    
    private void dfs(String s, Set<String> wordDict, int i, int j) {
        if(mark[i][j] != -1) return;
        
        mark[i][j] = 0;
        for(String a : wordDict) {
            if(a.length() > (j-i+1)) continue;
            if(s.substring(i, i + a.length()).compareTo(a) == 0) {
                mark[i][i + a.length()-1] = 1;
                if(a.length() + i <= j) {
                    dfs(s, wordDict, i + a.length(), j);
                    if(mark[i + a.length()][j] == 1) {
                        mark[i][j] = 1;
                        return;
                    }
                }
                
            }
        }
    }
}
