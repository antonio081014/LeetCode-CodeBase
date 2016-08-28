/**
 * Problem: https://leetcode.com/problems/perfect-squares/
 */
public class Solution {
    
    private int[] mark;
    
    public int numSquares(int n) {
        int x = (int)Math.sqrt(n);
        mark = new int[n+1];
        for(int i=0; i<=n; i++) mark[i] = -1;
        for(int i = (int)Math.sqrt(n); i >= 1; i--) {
            mark[i*i] = 1;
        }
        return square(n);
    }
    
    private int square(int left) {
        if(mark[left] != -1) return mark[left];
        mark[left] = Integer.MAX_VALUE;
        for(int x = (int)Math.sqrt(left); x >=1; x--){
            mark[left] = Math.min(mark[left], 1 + square(left - x * x));
        }
        return mark[left];
    }
}
