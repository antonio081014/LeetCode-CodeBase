/**
 * Problem: https://leetcode.com/problems/reverse-bits/
 * 
 */
public class Solution {
    // you need treat n as an unsigned value
    public int reverseBits(int n) {
        for(int i=0; i<32/2; i++) {
            n = swap(n, 32 - i - 1, i);
        }
        return n;
    }
    
    private int swap(int n, int i, int j) {
        int ai = (n >> i) & 1;
        int aj = (n >> j) & 1;
        return n + (aj - ai) * ((1<<i) - (1<<j));
        // if ((ai ^ aj) != 0) {
        //     return n ^= (1 << i) | (1 << j);
        // }
        // return n;
    }
}
