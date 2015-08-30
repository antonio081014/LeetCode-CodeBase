/**
 * Problem: https://leetcode.com/problems/edit-distance/
 * Dynamic Programming Problem.
 * 
 */

public class Solution {
    public int minDistance(String word1, String word2) {
        int n = word1.length();
        int m = word2.length();
        int[][] steps = new int[n+1][m+1];
        for(int i=1; i<=n; i++) steps[i][0] = steps[i-1][0] + 1;
        for(int j=1; j<=m; j++) steps[0][j] = steps[0][j-1] + 1;
        for(int i=1; i<=n; i++) {
            for(int j=1; j<=m; j++) {
                // If two characters are the same, then do nothing.
                if(word1.charAt(i-1) == word2.charAt(j-1)) {
                    steps[i][j] = steps[i-1][j-1];
                } else {
                    // Otherwise, we could add one character to either word.
                    steps[i][j] = Math.min(steps[i-1][j], steps[i][j-1]) + 1;
                    // Or, we could replace one with another.
                    steps[i][j] = Math.min(steps[i][j], steps[i-1][j-1] + 1);
                }
            }
        }
        
        return steps[n][m];
    }
}
