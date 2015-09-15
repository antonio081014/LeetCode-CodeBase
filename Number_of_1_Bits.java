/**
 * Problem: https://leetcode.com/problems/number-of-1-bits/
 * 
 * 
 */

public class Solution {
    // you need to treat n as an unsigned value
    public int hammingWeight(int n) {
        int count = 0;  
         while(n != 0){  
           n = n & (n-1);  
           count++;  
         }  
         return count;  
    }
}
