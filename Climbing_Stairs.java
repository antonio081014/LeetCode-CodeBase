/**
 * Problem: https://leetcode.com/problems/climbing-stairs/
 * 
 * Solution: Easy dynamic programming problem with memorization.
 */

public class Solution {
    private int[] choices;
    public int climbStairs(int n) {
        choices = new int[n+1];
        for(int i=0; i<=n; i++) choices[i] = -1;
        return solve(n);
    }
    
    private int solve(int x) {
        if(choices[x] != -1) return choices[x];
        if(x == 0) return choices[x] = 1;
        choices[x] = 0;
        if(x >= 1) choices[x] += solve(x-1);
        if(x >= 2) choices[x] += solve(x-2);
        return choices[x];
    }
}
