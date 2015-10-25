/**
 * Problem Link: https://leetcode.com/problems/unique-binary-search-trees/
 * 
 */
public class Solution {
    private int[] mark;
    public int numTrees(int n) {
        mark = new int[n+1];
        for(int i=0; i<=n; i++) mark[i] = -1;
        return solve(n);
    }
    
    private int solve(int n) {
        if(mark[n] >= 0) return mark[n];
        if(n == 0) return 1;
        if(n == 1) return 1;
        if(n == 2) return 2;
        mark[n] = 0;
        for(int left = 0; left < n; left++){
            mark[n] += solve(left) * solve(n-left-1);
        }
        return mark[n];
    }
}
